VIVADO := $(XILINX_VIVADO)/bin/vivado
$(TEMP_DIR)/${KRNL_1}.xo: kernel/network_krnl/network_krnl.xml kernel/network_krnl/package_network_krnl.tcl scripts/gen_xo.tcl kernel/network_krnl/src/hdl/*.sv
	mkdir -p $(TEMP_DIR)
	$(VIVADO) -mode batch -source scripts/gen_xo.tcl -tclargs $(TEMP_DIR)/${KRNL_1}.xo ${KRNL_1} $(TARGET) $(DEVICE) $(XSA) kernel/network_krnl/network_krnl.xml kernel/network_krnl/package_network_krnl.tcl

$(USER_KRNL_OBJ1): $(USER_KRNL_SRC1)
	mkdir -p $(TEMP_DIR)
	$(VPP) $(CLFLAGS) -c -k ${USER_KRNL1} -o $@ --input_files $^

$(USER_KRNL_OBJ2): $(USER_KRNL_SRC2)
	mkdir -p $(TEMP_DIR)
	$(VPP) $(CLFLAGS) -c -k ${USER_KRNL2} -o $@ --input_files $^

$(USER_KRNL_OBJ3): $(USER_KRNL_SRC3)
	mkdir -p $(TEMP_DIR)
	$(VPP) $(CLFLAGS) -c -k ${USER_KRNL3} -o $@ --input_files $^

$(TEMP_DIR)/${KRNL_3}.xo: kernel/cmac_krnl/cmac_krnl.xml kernel/cmac_krnl/package_cmac_krnl.tcl scripts/gen_xo.tcl kernel/cmac_krnl/src/hdl/*.sv
	mkdir -p $(TEMP_DIR)
	$(VIVADO) -mode batch -source scripts/gen_xo.tcl -tclargs $(TEMP_DIR)/${KRNL_3}.xo ${KRNL_3} $(TARGET) $(DEVICE) $(XSA) kernel/cmac_krnl/cmac_krnl.xml kernel/cmac_krnl/package_cmac_krnl.tcl
