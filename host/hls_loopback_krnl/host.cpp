#include "xcl2.hpp"
#include "ap_int.h"
#include <vector>
#include <chrono>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

// device memory channels
#define MAX_HBM_CHANNEL_COUNT 32
#define CHANNEL_NAME(n) n | XCL_MEM_TOPOLOGY
const int HBM[MAX_HBM_CHANNEL_COUNT] = {
    CHANNEL_NAME(0),  CHANNEL_NAME(1),  CHANNEL_NAME(2),  CHANNEL_NAME(3),  CHANNEL_NAME(4),
    CHANNEL_NAME(5),  CHANNEL_NAME(6),  CHANNEL_NAME(7),  CHANNEL_NAME(8),  CHANNEL_NAME(9),
    CHANNEL_NAME(10), CHANNEL_NAME(11), CHANNEL_NAME(12), CHANNEL_NAME(13), CHANNEL_NAME(14),
    CHANNEL_NAME(15), CHANNEL_NAME(16), CHANNEL_NAME(17), CHANNEL_NAME(18), CHANNEL_NAME(19),
    CHANNEL_NAME(20), CHANNEL_NAME(21), CHANNEL_NAME(22), CHANNEL_NAME(23), CHANNEL_NAME(24),
    CHANNEL_NAME(25), CHANNEL_NAME(26), CHANNEL_NAME(27), CHANNEL_NAME(28), CHANNEL_NAME(29),
    CHANNEL_NAME(30), CHANNEL_NAME(31)};

const int DDR[2] = {CHANNEL_NAME(32), CHANNEL_NAME(33)};

#define CL_CREATE_EXT_PTR(name, data, channel)                  \
cl_mem_ext_ptr_t name;                                          \
name.obj = data;                                                \
name.param = 0;                                                 \
name.flags = channel;

#define CL_BUFFER_RDONLY(context, size, ext, err)               \
cl::Buffer(context,                                             \
CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR, \
size, &ext, &err);

#define CL_BUFFER_WRONLY(context, size, ext, err)               \
cl::Buffer(context,                                             \
CL_MEM_WRITE_ONLY | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR,\
size, &ext, &err);

#define CL_BUFFER(context, size, ext, err)                      \
cl::Buffer(context,                                             \
CL_MEM_READ_WRITE | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR,\
size, &ext, &err);

#define CHECK_ERR(err)                                          \
    if (err != CL_SUCCESS) {                                    \
      printf("OCL Error at %s:%d, error code is: %d\n",         \
              __FILE__,__LINE__, err);                          \
      exit(EXIT_FAILURE);                                       \
    }

void wait_for_enter(const std::string &msg) {
    std::cout << msg << std::endl;
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
}

uint32_t ip2int(const char* ip_str) {
    std::string s(ip_str);
    std::string delimiter = ".";
    int ip [4];
    size_t pos = 0;
    std::string token;
    int i = 0;
    while ((pos = s.find(delimiter)) != std::string::npos) {
        token = s.substr(0, pos);
        ip[i] = stoi(token);
        s.erase(0, pos + delimiter.length());
        i++;
    }
    ip[i] = stoi(s);
    return ip[3] | (ip[2] << 8) | (ip[1] << 16) | (ip[0] << 24);
}

const uint64_t networkBufSizeBytes = 1024 * 1024; // 1MB

int main(int argc, char **argv) {
    if (argc < 2) {
        std::cout << "Usage: " << argv[0] << " <XCLBIN File> [<Transfer Word Count>]" << std::endl;
        return EXIT_FAILURE;
    }

    std::string binaryFile = argv[1];

    // 512 bits per word
    uint64_t wordCnt = 64;
    if (argc >= 3) {
        wordCnt = std::stoul(argv[2]);
    } 

    cl_int err;
    cl::CommandQueue q;
    cl::Context context;

    cl::Kernel user_send_kernel;
    cl::Kernel user_recv_kernel;
    cl::Kernel network_kernel_1;
    cl::Kernel network_kernel_2;

    uint32_t boardNum = 1; 
    // uint32_t hostIP = ip2int("128.253.128.102"); // zhang-capra
    // uint32_t local_IP = ip2int("128.253.128.40"); // brg-zhang
    uint32_t network_1_IP = ip2int("192.168.0.1");
    uint32_t network_2_IP = ip2int("192.168.0.2");

    //OPENCL HOST CODE AREA START
    //Create Program and Kernel
    auto devices = xcl::get_xil_devices();

    // read_binary_file() is a utility API which will load the binaryFile
    // and will return the pointer to file buffer.
    auto fileBuf = xcl::read_binary_file(binaryFile);
    cl::Program::Binaries bins{{fileBuf.data(), fileBuf.size()}};
    int valid_device = 0;
    for (unsigned int i = 0; i < devices.size(); i++) {
        auto device = devices[i];
        // Creating Context and Command Queue for selected Device
        OCL_CHECK(err, context = cl::Context({device}, NULL, NULL, NULL, &err));
        OCL_CHECK(
            err,
            q = cl::CommandQueue(
                context, {device},
                CL_QUEUE_PROFILING_ENABLE | CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE,
                &err
            )
        );

        std::cout << "Trying to program device[" << i
                  << "]: " << device.getInfo<CL_DEVICE_NAME>() << std::endl;
                  cl::Program program(context, {device}, bins, NULL, &err);
        if (err != CL_SUCCESS) {
            std::cout << "Failed to program device[" << i
                      << "] with xclbin file!\n";
        } else {
            std::cout << "Device[" << i << "]: program successful!\n";
            OCL_CHECK(err,
                      network_kernel_1 = cl::Kernel(program, "network_krnl:{network_krnl_1}", &err));
            OCL_CHECK(err,
                      network_kernel_2 = cl::Kernel(program, "network_krnl:{network_krnl_2}", &err));
            OCL_CHECK(err,
                      user_send_kernel = cl::Kernel(program, "hls_send_krnl", &err));
            OCL_CHECK(err,
                      user_recv_kernel = cl::Kernel(program, "hls_recv_krnl", &err));
            valid_device++;
            break; // we break because we found a valid device
        }
    }
    if (valid_device == 0) {
        std::cout << "Failed to program any device found, exit!\n";
        exit(EXIT_FAILURE);
    }

    wait_for_enter("\nPress ENTER to continue");

    // Allocate Memory for network kernels
    std::vector<int, aligned_allocator<int>> network_1_ptr0(networkBufSizeBytes / sizeof(int));
    std::vector<int, aligned_allocator<int>> network_1_ptr1(networkBufSizeBytes / sizeof(int));
    std::vector<int, aligned_allocator<int>> network_2_ptr0(networkBufSizeBytes / sizeof(int));
    std::vector<int, aligned_allocator<int>> network_2_ptr1(networkBufSizeBytes / sizeof(int));
    CL_CREATE_EXT_PTR(network_1_ptr0_ext, network_1_ptr0.data(), DDR[0]); CHECK_ERR(err)
    CL_CREATE_EXT_PTR(network_1_ptr1_ext, network_1_ptr1.data(), DDR[0]); CHECK_ERR(err)
    CL_CREATE_EXT_PTR(network_2_ptr0_ext, network_2_ptr0.data(), DDR[0]); CHECK_ERR(err)
    CL_CREATE_EXT_PTR(network_2_ptr1_ext, network_2_ptr1.data(), DDR[0]); CHECK_ERR(err)
    auto buffer_1_r1 = CL_BUFFER(context, networkBufSizeBytes, network_1_ptr0_ext, err); CHECK_ERR(err)
    auto buffer_1_r2 = CL_BUFFER(context, networkBufSizeBytes, network_1_ptr1_ext, err); CHECK_ERR(err)
    auto buffer_2_r1 = CL_BUFFER(context, networkBufSizeBytes, network_2_ptr0_ext, err); CHECK_ERR(err)
    auto buffer_2_r2 = CL_BUFFER(context, networkBufSizeBytes, network_2_ptr1_ext, err); CHECK_ERR(err)

    // Set network kernel arguments
    OCL_CHECK(err, err = network_kernel_1.setArg(0, network_1_IP)); // Default IP address
    OCL_CHECK(err, err = network_kernel_1.setArg(1, boardNum));     // Board number
    OCL_CHECK(err, err = network_kernel_1.setArg(2, network_2_IP)); // ARP lookup
    OCL_CHECK(err, err = network_kernel_1.setArg(3, buffer_1_r1));
    OCL_CHECK(err, err = network_kernel_1.setArg(4, buffer_1_r2));

    OCL_CHECK(err, err = network_kernel_2.setArg(0, network_2_IP)); // Default IP address
    OCL_CHECK(err, err = network_kernel_2.setArg(1, boardNum));     // Board number
    OCL_CHECK(err, err = network_kernel_2.setArg(2, network_1_IP)); // ARP lookup
    OCL_CHECK(err, err = network_kernel_2.setArg(3, buffer_2_r1));
    OCL_CHECK(err, err = network_kernel_2.setArg(4, buffer_2_r2));

    printf("Configuring network kernel...\n");
    OCL_CHECK(err, err = q.enqueueTask(network_kernel_1));
    OCL_CHECK(err, err = q.enqueueTask(network_kernel_2));
    OCL_CHECK(err, err = q.finish());
    printf("Done.\n");

    // Allocate Memory for user kernels
    std::vector<ap_uint<512>, aligned_allocator<ap_uint<512>>> sendData(wordCnt);
    std::vector<ap_uint<512>, aligned_allocator<ap_uint<512>>> recvData(wordCnt);
    CL_CREATE_EXT_PTR(sendData_ext, sendData.data(), DDR[0]); CHECK_ERR(err)
    CL_CREATE_EXT_PTR(recvData_ext, recvData.data(), DDR[0]); CHECK_ERR(err)
    auto buffer_sendData = CL_BUFFER_RDONLY(context, wordCnt * 64, sendData_ext, err); CHECK_ERR(err)
    auto buffer_recvData = CL_BUFFER_WRONLY(context, wordCnt * 64, recvData_ext, err); CHECK_ERR(err)
    
    // fill in data
    for (size_t i = 0; i < wordCnt; i++) {
        sendData[i] = i;
        recvData[i] = 0;
    }
    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_sendData}, 0 /* 0 means from host*/));
    OCL_CHECK(err, err = q.finish());
    
    //Set user Kernel Arguments
    uint64_t wordPerPkg = 64;
    uint64_t nPkg = wordCnt / wordPerPkg; 

    int connection = 1;
    int basePort = 7216;
    OCL_CHECK(err, err = user_send_kernel.setArg(0, buffer_sendData));   
    OCL_CHECK(err, err = user_send_kernel.setArg(1, nPkg));
    OCL_CHECK(err, err = user_send_kernel.setArg(2, wordPerPkg));
    OCL_CHECK(err, err = user_send_kernel.setArg(3, connection));
    OCL_CHECK(err, err = user_send_kernel.setArg(4, basePort));
    OCL_CHECK(err, err = user_send_kernel.setArg(5, network_1_IP));

    OCL_CHECK(err, err = user_recv_kernel.setArg(0, buffer_recvData));
    OCL_CHECK(err, err = user_recv_kernel.setArg(1, wordCnt));
    OCL_CHECK(err, err = user_recv_kernel.setArg(2, wordPerPkg));
    OCL_CHECK(err, err = user_recv_kernel.setArg(3, connection));
    OCL_CHECK(err, err = user_recv_kernel.setArg(4, basePort));

    //Launch the Kernel
    double durationUs = 0.0;
    printf("Running user kernel...\n");
    auto start = std::chrono::high_resolution_clock::now();
    OCL_CHECK(err, err = q.enqueueTask(user_send_kernel));
    OCL_CHECK(err, err = q.enqueueTask(user_recv_kernel));
    OCL_CHECK(err, err = q.finish());
    auto end = std::chrono::high_resolution_clock::now();
    durationUs = (std::chrono::duration_cast<std::chrono::nanoseconds>(end-start).count() / 1000.0);
    printf("Done! %f us for %ld Bytes\n",durationUs, wordCnt * 64);

    // get the results
    OCL_CHECK(err, err = q.enqueueMigrateMemObjects({buffer_recvData}, CL_MIGRATE_MEM_OBJECT_HOST));
    OCL_CHECK(err, err = q.finish());

    // check results
    bool match = true;
    for (size_t i = 0; i < wordCnt; i++) {
        if (sendData[i] != recvData[i]) {
            match = false;
            printf("Mismatch at %ld, %d != %d\n", i, sendData[i].to_int(), recvData[i].to_int());
        }
    }

    std::cout << "EXIT recorded" << std::endl;
    return (match ? EXIT_SUCCESS : EXIT_FAILURE);
}
