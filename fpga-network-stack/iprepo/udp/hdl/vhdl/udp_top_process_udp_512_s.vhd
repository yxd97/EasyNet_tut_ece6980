-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity udp_top_process_udp_512_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    s_axis_rx_data_internal_dout : IN STD_LOGIC_VECTOR (1023 downto 0);
    s_axis_rx_data_internal_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    s_axis_rx_data_internal_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    s_axis_rx_data_internal_empty_n : IN STD_LOGIC;
    s_axis_rx_data_internal_read : OUT STD_LOGIC;
    regListenPort_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    regListenPort_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    regListenPort_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    regListenPort_empty_n : IN STD_LOGIC;
    regListenPort_read : OUT STD_LOGIC;
    rx_udpMetaFifo_din : OUT STD_LOGIC_VECTOR (48 downto 0);
    rx_udpMetaFifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    rx_udpMetaFifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    rx_udpMetaFifo_full_n : IN STD_LOGIC;
    rx_udpMetaFifo_write : OUT STD_LOGIC;
    rx_udp2shiftFifo_din : OUT STD_LOGIC_VECTOR (1023 downto 0);
    rx_udp2shiftFifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    rx_udp2shiftFifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    rx_udp2shiftFifo_full_n : IN STD_LOGIC;
    rx_udp2shiftFifo_write : OUT STD_LOGIC );
end;


architecture behav of udp_top_process_udp_512_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1024_lc_1 : STD_LOGIC_VECTOR (1023 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001001000000";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv26_0 : STD_LOGIC_VECTOR (25 downto 0) := "00000000000000000000000000";
    constant ap_const_lv63_0 : STD_LOGIC_VECTOR (62 downto 0) := "000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv64_7FFFFFFFFFFFFFFF : STD_LOGIC_VECTOR (63 downto 0) := "0111111111111111111111111111111111111111111111111111111111111111";
    constant ap_const_lv64_FFFFFFFFFFFFFFFE : STD_LOGIC_VECTOR (63 downto 0) := "1111111111111111111111111111111111111111111111111111111111111110";
    constant ap_const_lv64_FFFFFFFFFFFFFFFF : STD_LOGIC_VECTOR (63 downto 0) := "1111111111111111111111111111111111111111111111111111111111111111";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_27 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100111";
    constant ap_const_lv32_28 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101000";
    constant ap_const_lv32_2F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal tmp_i_nbreadreq_fu_110_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal tmp_i_reg_452 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_i_reg_452_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal metaWritten_load_reg_489 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op76_write_state3 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal tmp_i_reg_452_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1065_reg_499 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op77_write_state4 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal pu_header_ready : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal pu_header_idx : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal pu_header_header_V : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal metaWritten : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal regListenPort_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal s_axis_rx_data_internal_blk_n : STD_LOGIC;
    signal rx_udp2shiftFifo_blk_n : STD_LOGIC;
    signal rx_udpMetaFifo_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal s_axis_rx_data_internal_read_reg_456 : STD_LOGIC_VECTOR (1023 downto 0);
    signal s_axis_rx_data_internal_read_reg_456_pp0_iter1_reg : STD_LOGIC_VECTOR (1023 downto 0);
    signal s_axis_rx_data_internal_read_reg_456_pp0_iter2_reg : STD_LOGIC_VECTOR (1023 downto 0);
    signal currWord_last_V_reg_463 : STD_LOGIC_VECTOR (0 downto 0);
    signal regListenPort_read_reg_471 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_Result_s_fu_310_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal pu_header_ready_load_load_fu_193_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal metaWritten_load_load_fu_322_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1065_fu_394_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_mux_pu_header_ready_flag_0_i_phi_fu_147_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter1_pu_header_ready_flag_0_i_reg_144 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_mux_pu_header_idx_new_0_i_phi_fu_158_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal add_ln67_fu_208_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_phi_reg_pp0_iter1_pu_header_idx_new_0_i_reg_155 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_phi_mux_metaWritten_flag_0_i_phi_fu_168_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter1_metaWritten_flag_0_i_reg_165 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter0_p_Val2_7_in_i_in_in_reg_176 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_phi_reg_pp0_iter1_p_Val2_7_in_i_in_in_reg_176 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_phi_reg_pp0_iter2_p_Val2_7_in_i_in_in_reg_176 : STD_LOGIC_VECTOR (63 downto 0);
    signal xor_ln73_fu_331_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln73_fu_326_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln73_fu_336_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal or_ln73_1_fu_343_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal tmp_3_fu_215_p3 : STD_LOGIC_VECTOR (18 downto 0);
    signal zext_ln414_fu_223_p1 : STD_LOGIC_VECTOR (25 downto 0);
    signal trunc_ln414_fu_233_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln414_fu_227_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal st_fu_236_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_5_fu_205_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln414_fu_244_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_4_fu_252_p4 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln414_2_fu_270_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln414_3_fu_278_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal or_ln414_fu_286_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal select_ln414_1_fu_262_p3 : STD_LOGIC_VECTOR (63 downto 0);
    signal xor_ln414_fu_292_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal and_ln414_fu_298_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal and_ln414_1_fu_304_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_3_i_fu_376_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_i_41_fu_366_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Result_5_fu_386_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_7_i_fu_413_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_fu_423_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln674_fu_409_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_4_i_fu_399_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to2 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_condition_173 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    ap_phi_reg_pp0_iter2_p_Val2_7_in_i_in_in_reg_176_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_173)) then
                if (((tmp_i_reg_452 = ap_const_lv1_1) and (pu_header_ready_load_load_fu_193_p1 = ap_const_lv1_0))) then 
                    ap_phi_reg_pp0_iter2_p_Val2_7_in_i_in_in_reg_176 <= p_Result_s_fu_310_p2;
                elsif (((tmp_i_reg_452 = ap_const_lv1_1) and (pu_header_ready_load_load_fu_193_p1 = ap_const_lv1_1))) then 
                    ap_phi_reg_pp0_iter2_p_Val2_7_in_i_in_in_reg_176 <= pu_header_header_V;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter2_p_Val2_7_in_i_in_in_reg_176 <= ap_phi_reg_pp0_iter1_p_Val2_7_in_i_in_in_reg_176;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ap_phi_reg_pp0_iter1_p_Val2_7_in_i_in_in_reg_176 <= ap_phi_reg_pp0_iter0_p_Val2_7_in_i_in_in_reg_176;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_nbreadreq_fu_110_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                currWord_last_V_reg_463 <= s_axis_rx_data_internal_dout(576 downto 576);
                s_axis_rx_data_internal_read_reg_456 <= s_axis_rx_data_internal_dout;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_reg_452_pp0_iter1_reg = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                icmp_ln1065_reg_499 <= icmp_ln1065_fu_394_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_reg_452 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (or_ln73_1_fu_343_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                metaWritten <= xor_ln73_fu_331_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_reg_452 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                metaWritten_load_reg_489 <= metaWritten;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_reg_452 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (pu_header_ready_load_load_fu_193_p1 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                pu_header_header_V <= p_Result_s_fu_310_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_reg_452 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (or_ln73_fu_326_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                pu_header_idx <= select_ln73_fu_336_p3;
                pu_header_ready <= xor_ln73_fu_331_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                regListenPort_read_reg_471 <= regListenPort_dout;
                s_axis_rx_data_internal_read_reg_456_pp0_iter1_reg <= s_axis_rx_data_internal_read_reg_456;
                tmp_i_reg_452 <= tmp_i_nbreadreq_fu_110_p3;
                tmp_i_reg_452_pp0_iter1_reg <= tmp_i_reg_452;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                s_axis_rx_data_internal_read_reg_456_pp0_iter2_reg <= s_axis_rx_data_internal_read_reg_456_pp0_iter1_reg;
                tmp_i_reg_452_pp0_iter2_reg <= tmp_i_reg_452_pp0_iter1_reg;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage0_subdone, ap_reset_idle_pp0)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln67_fu_208_p2 <= std_logic_vector(unsigned(pu_header_idx) + unsigned(ap_const_lv16_1));
    and_ln414_1_fu_304_p2 <= (xor_ln414_fu_292_p2 and select_ln414_1_fu_262_p3);
    and_ln414_fu_298_p2 <= (pu_header_header_V and or_ln414_fu_286_p2);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, s_axis_rx_data_internal_empty_n, tmp_i_nbreadreq_fu_110_p3, ap_done_reg, regListenPort_empty_n, rx_udpMetaFifo_full_n, ap_predicate_op76_write_state3, rx_udp2shiftFifo_full_n, ap_predicate_op77_write_state4)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op77_write_state4 = ap_const_boolean_1) and (rx_udp2shiftFifo_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)) or ((ap_predicate_op76_write_state3 = ap_const_boolean_1) and (rx_udpMetaFifo_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((regListenPort_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_110_p3 = ap_const_lv1_1) and (s_axis_rx_data_internal_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, s_axis_rx_data_internal_empty_n, tmp_i_nbreadreq_fu_110_p3, ap_done_reg, regListenPort_empty_n, rx_udpMetaFifo_full_n, ap_predicate_op76_write_state3, rx_udp2shiftFifo_full_n, ap_predicate_op77_write_state4)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op77_write_state4 = ap_const_boolean_1) and (rx_udp2shiftFifo_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)) or ((ap_predicate_op76_write_state3 = ap_const_boolean_1) and (rx_udpMetaFifo_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((regListenPort_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_110_p3 = ap_const_lv1_1) and (s_axis_rx_data_internal_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, s_axis_rx_data_internal_empty_n, tmp_i_nbreadreq_fu_110_p3, ap_done_reg, regListenPort_empty_n, rx_udpMetaFifo_full_n, ap_predicate_op76_write_state3, rx_udp2shiftFifo_full_n, ap_predicate_op77_write_state4)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op77_write_state4 = ap_const_boolean_1) and (rx_udp2shiftFifo_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)) or ((ap_predicate_op76_write_state3 = ap_const_boolean_1) and (rx_udpMetaFifo_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((regListenPort_empty_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_110_p3 = ap_const_lv1_1) and (s_axis_rx_data_internal_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(s_axis_rx_data_internal_empty_n, tmp_i_nbreadreq_fu_110_p3, ap_done_reg)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_110_p3 = ap_const_lv1_1) and (s_axis_rx_data_internal_empty_n = ap_const_logic_0)));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(regListenPort_empty_n)
    begin
                ap_block_state2_pp0_stage0_iter1 <= (regListenPort_empty_n = ap_const_logic_0);
    end process;


    ap_block_state3_pp0_stage0_iter2_assign_proc : process(rx_udpMetaFifo_full_n, ap_predicate_op76_write_state3)
    begin
                ap_block_state3_pp0_stage0_iter2 <= ((ap_predicate_op76_write_state3 = ap_const_boolean_1) and (rx_udpMetaFifo_full_n = ap_const_logic_0));
    end process;


    ap_block_state4_pp0_stage0_iter3_assign_proc : process(rx_udp2shiftFifo_full_n, ap_predicate_op77_write_state4)
    begin
                ap_block_state4_pp0_stage0_iter3 <= ((ap_predicate_op77_write_state4 = ap_const_boolean_1) and (rx_udp2shiftFifo_full_n = ap_const_logic_0));
    end process;


    ap_condition_173_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
                ap_condition_173 <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001));
    end process;


    ap_done_assign_proc : process(ap_enable_reg_pp0_iter3, ap_done_reg, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start;

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_idle_pp0)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3)
    begin
        if (((ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_0to2_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0_0to2 <= ap_const_logic_1;
        else 
            ap_idle_pp0_0to2 <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_metaWritten_flag_0_i_phi_fu_168_p4_assign_proc : process(tmp_i_reg_452, metaWritten_load_load_fu_322_p1, ap_phi_reg_pp0_iter1_metaWritten_flag_0_i_reg_165)
    begin
        if ((tmp_i_reg_452 = ap_const_lv1_1)) then
            if ((metaWritten_load_load_fu_322_p1 = ap_const_lv1_0)) then 
                ap_phi_mux_metaWritten_flag_0_i_phi_fu_168_p4 <= ap_const_lv1_1;
            elsif ((metaWritten_load_load_fu_322_p1 = ap_const_lv1_1)) then 
                ap_phi_mux_metaWritten_flag_0_i_phi_fu_168_p4 <= ap_const_lv1_0;
            else 
                ap_phi_mux_metaWritten_flag_0_i_phi_fu_168_p4 <= ap_phi_reg_pp0_iter1_metaWritten_flag_0_i_reg_165;
            end if;
        else 
            ap_phi_mux_metaWritten_flag_0_i_phi_fu_168_p4 <= ap_phi_reg_pp0_iter1_metaWritten_flag_0_i_reg_165;
        end if; 
    end process;


    ap_phi_mux_pu_header_idx_new_0_i_phi_fu_158_p4_assign_proc : process(tmp_i_reg_452, pu_header_ready_load_load_fu_193_p1, add_ln67_fu_208_p2, ap_phi_reg_pp0_iter1_pu_header_idx_new_0_i_reg_155)
    begin
        if (((tmp_i_reg_452 = ap_const_lv1_1) and (pu_header_ready_load_load_fu_193_p1 = ap_const_lv1_0))) then 
            ap_phi_mux_pu_header_idx_new_0_i_phi_fu_158_p4 <= add_ln67_fu_208_p2;
        else 
            ap_phi_mux_pu_header_idx_new_0_i_phi_fu_158_p4 <= ap_phi_reg_pp0_iter1_pu_header_idx_new_0_i_reg_155;
        end if; 
    end process;


    ap_phi_mux_pu_header_ready_flag_0_i_phi_fu_147_p4_assign_proc : process(tmp_i_reg_452, pu_header_ready_load_load_fu_193_p1, ap_phi_reg_pp0_iter1_pu_header_ready_flag_0_i_reg_144)
    begin
        if ((tmp_i_reg_452 = ap_const_lv1_1)) then
            if ((pu_header_ready_load_load_fu_193_p1 = ap_const_lv1_0)) then 
                ap_phi_mux_pu_header_ready_flag_0_i_phi_fu_147_p4 <= ap_const_lv1_1;
            elsif ((pu_header_ready_load_load_fu_193_p1 = ap_const_lv1_1)) then 
                ap_phi_mux_pu_header_ready_flag_0_i_phi_fu_147_p4 <= ap_const_lv1_0;
            else 
                ap_phi_mux_pu_header_ready_flag_0_i_phi_fu_147_p4 <= ap_phi_reg_pp0_iter1_pu_header_ready_flag_0_i_reg_144;
            end if;
        else 
            ap_phi_mux_pu_header_ready_flag_0_i_phi_fu_147_p4 <= ap_phi_reg_pp0_iter1_pu_header_ready_flag_0_i_reg_144;
        end if; 
    end process;

    ap_phi_reg_pp0_iter0_p_Val2_7_in_i_in_in_reg_176 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    ap_phi_reg_pp0_iter1_metaWritten_flag_0_i_reg_165 <= "X";
    ap_phi_reg_pp0_iter1_pu_header_idx_new_0_i_reg_155 <= "XXXXXXXXXXXXXXXX";
    ap_phi_reg_pp0_iter1_pu_header_ready_flag_0_i_reg_144 <= "X";

    ap_predicate_op76_write_state3_assign_proc : process(tmp_i_reg_452_pp0_iter1_reg, metaWritten_load_reg_489)
    begin
                ap_predicate_op76_write_state3 <= ((metaWritten_load_reg_489 = ap_const_lv1_0) and (tmp_i_reg_452_pp0_iter1_reg = ap_const_lv1_1));
    end process;


    ap_predicate_op77_write_state4_assign_proc : process(tmp_i_reg_452_pp0_iter2_reg, icmp_ln1065_reg_499)
    begin
                ap_predicate_op77_write_state4 <= ((icmp_ln1065_reg_499 = ap_const_lv1_1) and (tmp_i_reg_452_pp0_iter2_reg = ap_const_lv1_1));
    end process;


    ap_ready_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_reset_idle_pp0_assign_proc : process(ap_start, ap_idle_pp0_0to2)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0_0to2 = ap_const_logic_1))) then 
            ap_reset_idle_pp0 <= ap_const_logic_1;
        else 
            ap_reset_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln1065_fu_394_p2 <= "1" when (p_Result_5_fu_386_p3 = regListenPort_read_reg_471) else "0";
    icmp_ln414_fu_227_p2 <= "0" when (zext_ln414_fu_223_p1 = ap_const_lv26_0) else "1";
    metaWritten_load_load_fu_322_p1 <= metaWritten;
    or_ln414_fu_286_p2 <= (select_ln414_3_fu_278_p3 or select_ln414_2_fu_270_p3);
    or_ln73_1_fu_343_p2 <= (currWord_last_V_reg_463 or ap_phi_mux_metaWritten_flag_0_i_phi_fu_168_p4);
    or_ln73_fu_326_p2 <= (currWord_last_V_reg_463 or ap_phi_mux_pu_header_ready_flag_0_i_phi_fu_147_p4);
    p_Result_5_fu_386_p3 <= (tmp_3_i_fu_376_p4 & tmp_i_41_fu_366_p4);
    p_Result_s_fu_310_p2 <= (and_ln414_fu_298_p2 or and_ln414_1_fu_304_p2);
    pu_header_ready_load_load_fu_193_p1 <= pu_header_ready;

    regListenPort_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, regListenPort_empty_n, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            regListenPort_blk_n <= regListenPort_empty_n;
        else 
            regListenPort_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    regListenPort_read_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            regListenPort_read <= ap_const_logic_1;
        else 
            regListenPort_read <= ap_const_logic_0;
        end if; 
    end process;


    rx_udp2shiftFifo_blk_n_assign_proc : process(ap_enable_reg_pp0_iter3, rx_udp2shiftFifo_full_n, ap_predicate_op77_write_state4, ap_block_pp0_stage0)
    begin
        if (((ap_predicate_op77_write_state4 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            rx_udp2shiftFifo_blk_n <= rx_udp2shiftFifo_full_n;
        else 
            rx_udp2shiftFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    rx_udp2shiftFifo_din <= s_axis_rx_data_internal_read_reg_456_pp0_iter2_reg;

    rx_udp2shiftFifo_write_assign_proc : process(ap_enable_reg_pp0_iter3, ap_predicate_op77_write_state4, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op77_write_state4 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            rx_udp2shiftFifo_write <= ap_const_logic_1;
        else 
            rx_udp2shiftFifo_write <= ap_const_logic_0;
        end if; 
    end process;


    rx_udpMetaFifo_blk_n_assign_proc : process(ap_enable_reg_pp0_iter2, rx_udpMetaFifo_full_n, ap_predicate_op76_write_state3, ap_block_pp0_stage0)
    begin
        if (((ap_predicate_op76_write_state3 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            rx_udpMetaFifo_blk_n <= rx_udpMetaFifo_full_n;
        else 
            rx_udpMetaFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    rx_udpMetaFifo_din <= ((((((icmp_ln1065_fu_394_p2 & tmp_7_i_fu_413_p4) & tmp_fu_423_p4) & tmp_3_i_fu_376_p4) & tmp_i_41_fu_366_p4) & trunc_ln674_fu_409_p1) & tmp_4_i_fu_399_p4);

    rx_udpMetaFifo_write_assign_proc : process(ap_enable_reg_pp0_iter2, ap_predicate_op76_write_state3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op76_write_state3 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            rx_udpMetaFifo_write <= ap_const_logic_1;
        else 
            rx_udpMetaFifo_write <= ap_const_logic_0;
        end if; 
    end process;


    s_axis_rx_data_internal_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, s_axis_rx_data_internal_empty_n, tmp_i_nbreadreq_fu_110_p3, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_done_reg = ap_const_logic_0) and (tmp_i_nbreadreq_fu_110_p3 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            s_axis_rx_data_internal_blk_n <= s_axis_rx_data_internal_empty_n;
        else 
            s_axis_rx_data_internal_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    s_axis_rx_data_internal_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, tmp_i_nbreadreq_fu_110_p3, ap_block_pp0_stage0_11001)
    begin
        if (((tmp_i_nbreadreq_fu_110_p3 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            s_axis_rx_data_internal_read <= ap_const_logic_1;
        else 
            s_axis_rx_data_internal_read <= ap_const_logic_0;
        end if; 
    end process;

    select_ln414_1_fu_262_p3 <= 
        tmp_4_fu_252_p4 when (icmp_ln414_fu_227_p2(0) = '1') else 
        tmp_5_fu_205_p1;
    select_ln414_2_fu_270_p3 <= 
        ap_const_lv64_7FFFFFFFFFFFFFFF when (icmp_ln414_fu_227_p2(0) = '1') else 
        ap_const_lv64_0;
    select_ln414_3_fu_278_p3 <= 
        ap_const_lv64_FFFFFFFFFFFFFFFE when (icmp_ln414_fu_227_p2(0) = '1') else 
        ap_const_lv64_0;
    select_ln414_fu_244_p3 <= 
        st_fu_236_p3 when (icmp_ln414_fu_227_p2(0) = '1') else 
        tmp_5_fu_205_p1;
    select_ln73_fu_336_p3 <= 
        ap_const_lv16_0 when (currWord_last_V_reg_463(0) = '1') else 
        ap_phi_mux_pu_header_idx_new_0_i_phi_fu_158_p4;
    st_fu_236_p3 <= (trunc_ln414_fu_233_p1 & ap_const_lv63_0);
    tmp_3_fu_215_p3 <= (pu_header_idx & ap_const_lv3_0);
    tmp_3_i_fu_376_p4 <= ap_phi_reg_pp0_iter2_p_Val2_7_in_i_in_in_reg_176(23 downto 16);
    
    tmp_4_fu_252_p4_proc : process(select_ln414_fu_244_p3)
    variable vlo_cpy : STD_LOGIC_VECTOR(64+32 - 1 downto 0);
    variable vhi_cpy : STD_LOGIC_VECTOR(64+32 - 1 downto 0);
    variable v0_cpy : STD_LOGIC_VECTOR(64 - 1 downto 0);
    variable tmp_4_fu_252_p4_i : integer;
    variable section : STD_LOGIC_VECTOR(64 - 1 downto 0);
    variable tmp_mask : STD_LOGIC_VECTOR(64 - 1 downto 0);
    variable resvalue, res_value, res_mask : STD_LOGIC_VECTOR(64 - 1 downto 0);
    begin
        vlo_cpy := (others => '0');
        vlo_cpy(6 - 1 downto 0) := ap_const_lv32_3F(6 - 1 downto 0);
        vhi_cpy := (others => '0');
        vhi_cpy(6 - 1 downto 0) := ap_const_lv32_0(6 - 1 downto 0);
        v0_cpy := select_ln414_fu_244_p3;
        if (vlo_cpy(6 - 1 downto 0) > vhi_cpy(6 - 1 downto 0)) then
            vhi_cpy(6-1 downto 0) := std_logic_vector(64-1-unsigned(ap_const_lv32_0(6-1 downto 0)));
            vlo_cpy(6-1 downto 0) := std_logic_vector(64-1-unsigned(ap_const_lv32_3F(6-1 downto 0)));
            for tmp_4_fu_252_p4_i in 0 to 64-1 loop
                v0_cpy(tmp_4_fu_252_p4_i) := select_ln414_fu_244_p3(64-1-tmp_4_fu_252_p4_i);
            end loop;
        end if;
        res_value := std_logic_vector(shift_right(unsigned(v0_cpy), to_integer(unsigned('0' & vlo_cpy(6-1 downto 0)))));

        section := (others=>'0');
        section(6-1 downto 0) := std_logic_vector(unsigned(vhi_cpy(6-1 downto 0)) - unsigned(vlo_cpy(6-1 downto 0)));
        tmp_mask := (others => '1');
        res_mask := std_logic_vector(shift_left(unsigned(tmp_mask),to_integer(unsigned('0' & section(31-1 downto 0)))));
        res_mask := res_mask(64-2 downto 0) & '0';
        resvalue := res_value and not res_mask;
        tmp_4_fu_252_p4 <= resvalue(64-1 downto 0);
    end process;

    tmp_4_i_fu_399_p4 <= ap_phi_reg_pp0_iter2_p_Val2_7_in_i_in_in_reg_176(15 downto 8);
    tmp_5_fu_205_p1 <= s_axis_rx_data_internal_read_reg_456(64 - 1 downto 0);
    tmp_7_i_fu_413_p4 <= ap_phi_reg_pp0_iter2_p_Val2_7_in_i_in_in_reg_176(39 downto 32);
    tmp_fu_423_p4 <= ap_phi_reg_pp0_iter2_p_Val2_7_in_i_in_in_reg_176(47 downto 40);
    tmp_i_41_fu_366_p4 <= ap_phi_reg_pp0_iter2_p_Val2_7_in_i_in_in_reg_176(31 downto 24);
    tmp_i_nbreadreq_fu_110_p3 <= (0=>(s_axis_rx_data_internal_empty_n), others=>'-');
    trunc_ln414_fu_233_p1 <= s_axis_rx_data_internal_read_reg_456(1 - 1 downto 0);
    trunc_ln674_fu_409_p1 <= ap_phi_reg_pp0_iter2_p_Val2_7_in_i_in_in_reg_176(8 - 1 downto 0);
    xor_ln414_fu_292_p2 <= (or_ln414_fu_286_p2 xor ap_const_lv64_FFFFFFFFFFFFFFFF);
    xor_ln73_fu_331_p2 <= (currWord_last_V_reg_463 xor ap_const_lv1_1);
    zext_ln414_fu_223_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_3_fu_215_p3),26));
end behav;
