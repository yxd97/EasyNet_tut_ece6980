.PHONY: help
help:
	$(ECHO) "Makefile Usage:"
	$(ECHO) "  make help"
	$(ECHO) "      Display this message."
	$(ECHO) ""
	$(ECHO) "  make examine"
	$(ECHO) "      Display the project setup."
	$(ECHO) ""
	$(ECHO) "  make clean "
	$(ECHO) "      Command to remove the generated non-hardware files."
	$(ECHO) ""
	$(ECHO) "  make cleanall"
	$(ECHO) "      Command to remove all the generated files."
	$(ECHO) ""
	$(ECHO) "  make exe"
	$(ECHO) "      Command to build the host program."
	$(ECHO) ""
	$(ECHO) "  make build"
	$(ECHO) "      Command to build xclbin application."
	$(ECHO) ""
	$(ECHO) "  make check"
	$(ECHO) "      Command to run test the application"
	$(ECHO) ""

###################################################################
# User-set switches. Modify as needed.
###################################################################

USER_KRNL_DIR := kernel/user_krnl/hls_loopback_krnl
# USER_KRNL_CFG := $(USER_KRNL_DIR)/config_sp_hls_loopback_krnl.txt
USER_KRNL1 := hls_send_krnl
USER_KRNL2 := hls_recv_krnl

HW_DEBUG := no
PROFILE := yes
REPORT := yes

# Xilinx Shall Archive name
XSA := xilinx_u280_gen3x16_xdma_1_202211_1
# XSA := xilinx_vck5000_gen4x8_xdma_2_202210_1

DEVICE := /opt/xilinx/platforms/$(XSA)/$(XSA).xpfm
VITIS_PLATFORM := ${DEVICE}
TARGET := hw
HOST_ARCH := x86
SYSROOT :=

USER_LINK_CFG := scripts/loopback_sys_link.txt

USER_HOST_DIR := host/hls_loopback_krnl
USER_HOST_SRC := host.cpp
USER_HOST_HDR :=

USER_KRNL_MODE ?= hls

TEMP_DIR := ./_x.$(TARGET).$(XSA)
BUILD_DIR := ./build_dir.$(TARGET).$(XSA)

USER_KRNL_SRC1 := $(USER_KRNL_DIR)/src/hls/$(USER_KRNL1).cpp
USER_KRNL_SRC2 := $(USER_KRNL_DIR)/src/hls/$(USER_KRNL2).cpp
USER_KRNL_OBJ1 := $(TEMP_DIR)/$(USER_KRNL1).xo
USER_KRNL_OBJ2 := $(TEMP_DIR)/$(USER_KRNL2).xo
USER_KRNL_OBJS := $(USER_KRNL_OBJ1) $(USER_KRNL_OBJ2)

###################################################################
# do not modify below unless you know what you're doing
###################################################################

# Points to top directory of Git repository
COMMON_REPO = ./
PWD = $(shell readlink -f .)
ABS_COMMON_REPO = $(shell readlink -f $(COMMON_REPO))

XCLBIN_NAME = network
KRNL_1 := network_krnl
KRNL_3 := cmac_krnl

CMAC_KRNL=vitis_network/_x.hw.$(XSA)/cmac_krnl.xo
NETWORK_KRNL=vitis_network/_x.hw.$(XSA)/network_krnl.xo

include ./utils.mk
POSTSYSLINKTCL ?= $(shell readlink -f ./scripts/post_sys_link.tcl)
IPREPOPATH ?= ./fpga-network-stack/iprepo

VPP := $(XILINX_VITIS)/bin/v++
SDCARD := sd_card

#Include Libraries
include $(ABS_COMMON_REPO)/common/includes/opencl/opencl.mk
include $(ABS_COMMON_REPO)/common/includes/xcl2/xcl2.mk

CXXFLAGS += $(xcl2_CXXFLAGS)
LDFLAGS += $(xcl2_LDFLAGS)
HOST_SRCS += $(xcl2_SRCS)
include config_$(USER_KRNL_MODE).mk

CXXFLAGS += $(opencl_CXXFLAGS) -Wall -O0 -g -std=c++11
CXXFLAGS += -DVITIS_PLATFORM=$(VITIS_PLATFORM)
LDFLAGS += $(opencl_LDFLAGS)

CXXFLAGS += -I$(HLS_INCLUDE)

HOST_SRCS += $(USER_HOST_DIR)/$(USER_HOST_SRC)
# Host compiler global settings
CXXFLAGS += -fmessage-length=0
LDFLAGS += -lrt -lstdc++

ifneq ($(HOST_ARCH), x86)
  LDFLAGS += --sysroot=$(SYSROOT)
endif

# Kernel compiler global settings
CLFLAGS += -t $(TARGET) --platform $(DEVICE) --save-temps #--config $(CONFIGLINKTCL)
CLFLAGS += --kernel_frequency 200
CLFLAGS += -g
ifneq ($(TARGET), hw)
endif

# Linker params

# Linker userPostSysLinkTcl param
LDCLFLAGS += --linkhook.custom postSysLink,$(POSTSYSLINKTCL)
ifeq ($(HW_DEBUG), yes)
LDCLFLAGS += --config scripts/hw_ila_config.txt
endif

#Generates profile summary report
ifeq ($(PROFILE), yes)
LDCLFLAGS += --config scripts/profile_config.txt
endif

#'estimate' for estimate report generation
#'system' for system report generation
ifneq ($(REPORT), no)
CLFLAGS += --report estimate
CLLDFLAGS += --report system
endif

EXECUTABLE = ./host/host
CMD_ARGS = $(BUILD_DIR)/${XCLBIN_NAME}.xclbin
EMCONFIG_DIR = $(TEMP_DIR)

BINARY_CONTAINERS += $(BUILD_DIR)/${XCLBIN_NAME}.xclbin
BINARY_CONTAINER_OBJS += $(TEMP_DIR)/${KRNL_1}.xo $(USER_KRNL_OBJS)

CP = cp -rf

###################################################################
# make targets
###################################################################

.PHONY: examine
examine:
	$(ECHO) ""
	$(ECHO) ""
	$(ECHO) "DEVICE: $(XSA)"
	$(ECHO) "HW_DEBUG: $(HW_DEBUG)"
	$(ECHO) "PROFILE: $(PROFILE)"
	$(ECHO) "REPORT: $(REPORT)"
	$(ECHO) "BINARY_CONTAINER_OBJS: $(BINARY_CONTAINER_OBJS)"
	$(ECHO) "PRESYSLINKTCL: $(PRESYSLINKTCL)"
	$(ECHO) "POSTSYSLINKTCL: $(POSTSYSLINKTCL)"
	$(ECHO) "CLFLAGS: $(CLFLAGS)"
	$(ECHO) "LDFLAGS: $(LDFLAGS)"
	$(ECHO) "LDCLFLAGS: $(LDCLFLAGS)"
	$(ECHO) ""
	$(ECHO) ""


# Building kernel
.PHONY: build
build: $(BINARY_CONTAINERS)

network_krnl: $(NETWORK_KRNL)
$(NETWORK_KRNL): kernel/network_krnl/network_krnl.xml kernel/network_krnl/package_network_krnl.tcl scripts/gen_xo.tcl kernel/network_krnl/src/hdl/*.sv
	mkdir -p $(TEMP_DIR)
	vivado -mode batch -source scripts/gen_xo.tcl -tclargs $(TEMP_DIR)/network_krnl.xo network_krnl $(TARGET) $(DEVICE) $(XSA) kernel/network_krnl/network_krnl.xml kernel/network_krnl/package_network_krnl.tcl

$(BUILD_DIR)/${XCLBIN_NAME}.xclbin: $(BINARY_CONTAINER_OBJS)
	mkdir -p $(BUILD_DIR)
	$(VPP) $(CLFLAGS) --temp_dir $(BUILD_DIR) -l $(LDCLFLAGS) --config $(USER_LINK_CFG) -o'$@' $(+)

# Building Host
.PHONY: exe
exe: $(EXECUTABLE)
$(EXECUTABLE): check-xrt $(HOST_SRCS) $(HOST_HDRS)
	$(CXX) $(CXXFLAGS) $(HOST_SRCS) $(HOST_HDRS) -o '$@' $(LDFLAGS)

# test
check: exe build
	./$(EXECUTABLE) $(BUILD_DIR)/${XCLBIN_NAME}.xclbin

# should not be used since EasyNet can only run on real hw
# emconfig:$(EMCONFIG_DIR)/emconfig.json
# $(EMCONFIG_DIR)/emconfig.json:
# 	emconfigutil --platform $(DEVICE) --od $(EMCONFIG_DIR)

# Cleaning stuff
.PHONY: clean
clean:
	-$(RMDIR) $(EXECUTABLE) $(XCLBIN)/{*sw_emu*,*hw_emu*}
	-$(RMDIR) profile_* TempConfig system_estimate.xtxt *.rpt *.csv $(USER_HOST_DIR)/.run *.run_summary
	-$(RMDIR) src/*.ll *v++* .Xil emconfig.json dltmp* xmltmp* *.log *.jou *.wcfg *.wdb

.PHONY: cleanall
cleanall: clean
	-$(RMDIR) build_dir*
	-$(RMDIR) _x.* *xclbin.run_summary qemu-memory-_* emulation/ _vimage/ pl* start_simulation.sh *.xclbin _x
	-$(RMDIR) ./tmp_kernel_pack* ./packaged_kernel*




