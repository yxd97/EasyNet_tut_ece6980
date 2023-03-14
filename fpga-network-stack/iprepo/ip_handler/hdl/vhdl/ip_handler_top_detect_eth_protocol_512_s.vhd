-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ip_handler_top_detect_eth_protocol_512_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    s_axis_raw_internal_dout : IN STD_LOGIC_VECTOR (1023 downto 0);
    s_axis_raw_internal_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    s_axis_raw_internal_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    s_axis_raw_internal_empty_n : IN STD_LOGIC;
    s_axis_raw_internal_read : OUT STD_LOGIC;
    ethDataFifo_din : OUT STD_LOGIC_VECTOR (1023 downto 0);
    ethDataFifo_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    ethDataFifo_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    ethDataFifo_full_n : IN STD_LOGIC;
    ethDataFifo_write : OUT STD_LOGIC;
    etherTypeFifo_din : OUT STD_LOGIC_VECTOR (15 downto 0);
    etherTypeFifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    etherTypeFifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    etherTypeFifo_full_n : IN STD_LOGIC;
    etherTypeFifo_write : OUT STD_LOGIC );
end;


architecture behav of ip_handler_top_detect_eth_protocol_512_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv112_0 : STD_LOGIC_VECTOR (111 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1024_lc_1 : STD_LOGIC_VECTOR (1023 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001001000000";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
    constant ap_const_lv25_6F : STD_LOGIC_VECTOR (24 downto 0) := "0000000000000000001101111";
    constant ap_const_lv111_0 : STD_LOGIC_VECTOR (110 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_6F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001101111";
    constant ap_const_lv112_7FFFFFFFFFFFFFFFFFFFFFFFFFFF : STD_LOGIC_VECTOR (111 downto 0) := "0111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";
    constant ap_const_lv112_FFFFFFFFFFFFFFFFFFFFFFFFFFFE : STD_LOGIC_VECTOR (111 downto 0) := "1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110";
    constant ap_const_lv112_FFFFFFFFFFFFFFFFFFFFFFFFFFFF : STD_LOGIC_VECTOR (111 downto 0) := "1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";
    constant ap_const_lv32_68 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001101000";
    constant ap_const_lv32_60 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001100000";
    constant ap_const_lv32_67 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001100111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal tmp_i_nbreadreq_fu_82_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal tmp_i_reg_357 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal tmp_i_reg_357_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal metaWritten_1_load_reg_389 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op66_write_state3 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal header_ready_1 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal header_idx_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal header_header_V_1 : STD_LOGIC_VECTOR (111 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    signal metaWritten_1 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal s_axis_raw_internal_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal etherTypeFifo_blk_n : STD_LOGIC;
    signal ethDataFifo_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal s_axis_raw_internal_read_reg_361 : STD_LOGIC_VECTOR (1023 downto 0);
    signal tmp_last_V_reg_368 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Result_s_fu_272_p2 : STD_LOGIC_VECTOR (111 downto 0);
    signal header_ready_1_load_load_fu_159_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal metaWritten_1_load_load_fu_284_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_mux_header_ready_1_flag_0_i_phi_fu_113_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter1_header_ready_1_flag_0_i_reg_110 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_mux_header_idx_1_new_0_i_phi_fu_124_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal add_ln67_fu_182_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_phi_reg_pp0_iter1_header_idx_1_new_0_i_reg_121 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_phi_mux_metaWritten_1_flag_0_i_phi_fu_134_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter1_metaWritten_1_flag_0_i_reg_131 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter0_p_Val2_8_reg_142 : STD_LOGIC_VECTOR (111 downto 0);
    signal ap_phi_reg_pp0_iter1_p_Val2_8_reg_142 : STD_LOGIC_VECTOR (111 downto 0);
    signal ap_phi_reg_pp0_iter2_p_Val2_8_reg_142 : STD_LOGIC_VECTOR (111 downto 0);
    signal xor_ln62_fu_293_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln62_fu_288_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln62_fu_298_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal or_ln62_1_fu_305_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal shl_ln_fu_171_p3 : STD_LOGIC_VECTOR (24 downto 0);
    signal trunc_ln414_fu_195_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln414_fu_189_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal st_fu_198_p3 : STD_LOGIC_VECTOR (111 downto 0);
    signal tmp_75_fu_179_p1 : STD_LOGIC_VECTOR (111 downto 0);
    signal select_ln414_fu_206_p3 : STD_LOGIC_VECTOR (111 downto 0);
    signal tmp_fu_214_p4 : STD_LOGIC_VECTOR (111 downto 0);
    signal select_ln414_5_fu_232_p3 : STD_LOGIC_VECTOR (111 downto 0);
    signal select_ln414_6_fu_240_p3 : STD_LOGIC_VECTOR (111 downto 0);
    signal or_ln414_fu_248_p2 : STD_LOGIC_VECTOR (111 downto 0);
    signal select_ln414_4_fu_224_p3 : STD_LOGIC_VECTOR (111 downto 0);
    signal xor_ln414_fu_254_p2 : STD_LOGIC_VECTOR (111 downto 0);
    signal and_ln414_fu_260_p2 : STD_LOGIC_VECTOR (111 downto 0);
    signal and_ln414_2_fu_266_p2 : STD_LOGIC_VECTOR (111 downto 0);
    signal tmp_101_i_fu_338_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_i_60_fu_328_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to1 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_condition_143 : BOOLEAN;
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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
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
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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


    ap_phi_reg_pp0_iter2_p_Val2_8_reg_142_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_143)) then
                if (((tmp_i_reg_357 = ap_const_lv1_1) and (header_ready_1_load_load_fu_159_p1 = ap_const_lv1_0))) then 
                    ap_phi_reg_pp0_iter2_p_Val2_8_reg_142 <= p_Result_s_fu_272_p2;
                elsif (((tmp_i_reg_357 = ap_const_lv1_1) and (header_ready_1_load_load_fu_159_p1 = ap_const_lv1_1))) then 
                    ap_phi_reg_pp0_iter2_p_Val2_8_reg_142 <= header_header_V_1;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter2_p_Val2_8_reg_142 <= ap_phi_reg_pp0_iter1_p_Val2_8_reg_142;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_phi_reg_pp0_iter1_p_Val2_8_reg_142 <= ap_phi_reg_pp0_iter0_p_Val2_8_reg_142;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_i_reg_357 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (header_ready_1_load_load_fu_159_p1 = ap_const_lv1_0))) then
                header_header_V_1 <= p_Result_s_fu_272_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_i_reg_357 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (or_ln62_fu_288_p2 = ap_const_lv1_1))) then
                header_idx_1 <= select_ln62_fu_298_p3;
                header_ready_1 <= xor_ln62_fu_293_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_i_reg_357 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (or_ln62_1_fu_305_p2 = ap_const_lv1_1))) then
                metaWritten_1 <= xor_ln62_fu_293_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_i_reg_357 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                metaWritten_1_load_reg_389 <= metaWritten_1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_i_nbreadreq_fu_82_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                s_axis_raw_internal_read_reg_361 <= s_axis_raw_internal_dout;
                tmp_last_V_reg_368 <= s_axis_raw_internal_dout(576 downto 576);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                tmp_i_reg_357 <= tmp_i_nbreadreq_fu_82_p3;
                tmp_i_reg_357_pp0_iter1_reg <= tmp_i_reg_357;
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
    add_ln67_fu_182_p2 <= std_logic_vector(unsigned(header_idx_1) + unsigned(ap_const_lv16_1));
    and_ln414_2_fu_266_p2 <= (xor_ln414_fu_254_p2 and select_ln414_4_fu_224_p3);
    and_ln414_fu_260_p2 <= (or_ln414_fu_248_p2 and header_header_V_1);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, s_axis_raw_internal_empty_n, tmp_i_nbreadreq_fu_82_p3, ap_done_reg, ethDataFifo_full_n, tmp_i_reg_357, etherTypeFifo_full_n, ap_predicate_op66_write_state3)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op66_write_state3 = ap_const_boolean_1) and (etherTypeFifo_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((tmp_i_reg_357 = ap_const_lv1_1) and (ethDataFifo_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_82_p3 = ap_const_lv1_1) and (s_axis_raw_internal_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, s_axis_raw_internal_empty_n, tmp_i_nbreadreq_fu_82_p3, ap_done_reg, ethDataFifo_full_n, tmp_i_reg_357, etherTypeFifo_full_n, ap_predicate_op66_write_state3)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op66_write_state3 = ap_const_boolean_1) and (etherTypeFifo_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((tmp_i_reg_357 = ap_const_lv1_1) and (ethDataFifo_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_82_p3 = ap_const_lv1_1) and (s_axis_raw_internal_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, s_axis_raw_internal_empty_n, tmp_i_nbreadreq_fu_82_p3, ap_done_reg, ethDataFifo_full_n, tmp_i_reg_357, etherTypeFifo_full_n, ap_predicate_op66_write_state3)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op66_write_state3 = ap_const_boolean_1) and (etherTypeFifo_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((tmp_i_reg_357 = ap_const_lv1_1) and (ethDataFifo_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_82_p3 = ap_const_lv1_1) and (s_axis_raw_internal_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(s_axis_raw_internal_empty_n, tmp_i_nbreadreq_fu_82_p3, ap_done_reg)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_82_p3 = ap_const_lv1_1) and (s_axis_raw_internal_empty_n = ap_const_logic_0)));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(ethDataFifo_full_n, tmp_i_reg_357)
    begin
                ap_block_state2_pp0_stage0_iter1 <= ((tmp_i_reg_357 = ap_const_lv1_1) and (ethDataFifo_full_n = ap_const_logic_0));
    end process;


    ap_block_state3_pp0_stage0_iter2_assign_proc : process(etherTypeFifo_full_n, ap_predicate_op66_write_state3)
    begin
                ap_block_state3_pp0_stage0_iter2 <= ((ap_predicate_op66_write_state3 = ap_const_boolean_1) and (etherTypeFifo_full_n = ap_const_logic_0));
    end process;


    ap_condition_143_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
                ap_condition_143 <= ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_done_assign_proc : process(ap_enable_reg_pp0_iter2, ap_done_reg, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_0to1_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0_0to1 <= ap_const_logic_1;
        else 
            ap_idle_pp0_0to1 <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_header_idx_1_new_0_i_phi_fu_124_p4_assign_proc : process(tmp_i_reg_357, header_ready_1_load_load_fu_159_p1, add_ln67_fu_182_p2, ap_phi_reg_pp0_iter1_header_idx_1_new_0_i_reg_121)
    begin
        if (((tmp_i_reg_357 = ap_const_lv1_1) and (header_ready_1_load_load_fu_159_p1 = ap_const_lv1_0))) then 
            ap_phi_mux_header_idx_1_new_0_i_phi_fu_124_p4 <= add_ln67_fu_182_p2;
        else 
            ap_phi_mux_header_idx_1_new_0_i_phi_fu_124_p4 <= ap_phi_reg_pp0_iter1_header_idx_1_new_0_i_reg_121;
        end if; 
    end process;


    ap_phi_mux_header_ready_1_flag_0_i_phi_fu_113_p4_assign_proc : process(tmp_i_reg_357, header_ready_1_load_load_fu_159_p1, ap_phi_reg_pp0_iter1_header_ready_1_flag_0_i_reg_110)
    begin
        if ((tmp_i_reg_357 = ap_const_lv1_1)) then
            if ((header_ready_1_load_load_fu_159_p1 = ap_const_lv1_0)) then 
                ap_phi_mux_header_ready_1_flag_0_i_phi_fu_113_p4 <= ap_const_lv1_1;
            elsif ((header_ready_1_load_load_fu_159_p1 = ap_const_lv1_1)) then 
                ap_phi_mux_header_ready_1_flag_0_i_phi_fu_113_p4 <= ap_const_lv1_0;
            else 
                ap_phi_mux_header_ready_1_flag_0_i_phi_fu_113_p4 <= ap_phi_reg_pp0_iter1_header_ready_1_flag_0_i_reg_110;
            end if;
        else 
            ap_phi_mux_header_ready_1_flag_0_i_phi_fu_113_p4 <= ap_phi_reg_pp0_iter1_header_ready_1_flag_0_i_reg_110;
        end if; 
    end process;


    ap_phi_mux_metaWritten_1_flag_0_i_phi_fu_134_p4_assign_proc : process(tmp_i_reg_357, metaWritten_1_load_load_fu_284_p1, ap_phi_reg_pp0_iter1_metaWritten_1_flag_0_i_reg_131)
    begin
        if ((tmp_i_reg_357 = ap_const_lv1_1)) then
            if ((metaWritten_1_load_load_fu_284_p1 = ap_const_lv1_0)) then 
                ap_phi_mux_metaWritten_1_flag_0_i_phi_fu_134_p4 <= ap_const_lv1_1;
            elsif ((metaWritten_1_load_load_fu_284_p1 = ap_const_lv1_1)) then 
                ap_phi_mux_metaWritten_1_flag_0_i_phi_fu_134_p4 <= ap_const_lv1_0;
            else 
                ap_phi_mux_metaWritten_1_flag_0_i_phi_fu_134_p4 <= ap_phi_reg_pp0_iter1_metaWritten_1_flag_0_i_reg_131;
            end if;
        else 
            ap_phi_mux_metaWritten_1_flag_0_i_phi_fu_134_p4 <= ap_phi_reg_pp0_iter1_metaWritten_1_flag_0_i_reg_131;
        end if; 
    end process;

    ap_phi_reg_pp0_iter0_p_Val2_8_reg_142 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    ap_phi_reg_pp0_iter1_header_idx_1_new_0_i_reg_121 <= "XXXXXXXXXXXXXXXX";
    ap_phi_reg_pp0_iter1_header_ready_1_flag_0_i_reg_110 <= "X";
    ap_phi_reg_pp0_iter1_metaWritten_1_flag_0_i_reg_131 <= "X";

    ap_predicate_op66_write_state3_assign_proc : process(tmp_i_reg_357_pp0_iter1_reg, metaWritten_1_load_reg_389)
    begin
                ap_predicate_op66_write_state3 <= ((metaWritten_1_load_reg_389 = ap_const_lv1_0) and (tmp_i_reg_357_pp0_iter1_reg = ap_const_lv1_1));
    end process;


    ap_ready_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_reset_idle_pp0_assign_proc : process(ap_start, ap_idle_pp0_0to1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0_0to1 = ap_const_logic_1))) then 
            ap_reset_idle_pp0 <= ap_const_logic_1;
        else 
            ap_reset_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ethDataFifo_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ethDataFifo_full_n, tmp_i_reg_357, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (tmp_i_reg_357 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ethDataFifo_blk_n <= ethDataFifo_full_n;
        else 
            ethDataFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    ethDataFifo_din <= s_axis_raw_internal_read_reg_361;

    ethDataFifo_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, tmp_i_reg_357, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_i_reg_357 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ethDataFifo_write <= ap_const_logic_1;
        else 
            ethDataFifo_write <= ap_const_logic_0;
        end if; 
    end process;


    etherTypeFifo_blk_n_assign_proc : process(ap_enable_reg_pp0_iter2, etherTypeFifo_full_n, ap_predicate_op66_write_state3, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op66_write_state3 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            etherTypeFifo_blk_n <= etherTypeFifo_full_n;
        else 
            etherTypeFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    etherTypeFifo_din <= (tmp_101_i_fu_338_p4 & tmp_i_60_fu_328_p4);

    etherTypeFifo_write_assign_proc : process(ap_enable_reg_pp0_iter2, ap_predicate_op66_write_state3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op66_write_state3 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            etherTypeFifo_write <= ap_const_logic_1;
        else 
            etherTypeFifo_write <= ap_const_logic_0;
        end if; 
    end process;

    header_ready_1_load_load_fu_159_p1 <= header_ready_1;
    icmp_ln414_fu_189_p2 <= "1" when (unsigned(shl_ln_fu_171_p3) > unsigned(ap_const_lv25_6F)) else "0";
    metaWritten_1_load_load_fu_284_p1 <= metaWritten_1;
    or_ln414_fu_248_p2 <= (select_ln414_6_fu_240_p3 or select_ln414_5_fu_232_p3);
    or_ln62_1_fu_305_p2 <= (tmp_last_V_reg_368 or ap_phi_mux_metaWritten_1_flag_0_i_phi_fu_134_p4);
    or_ln62_fu_288_p2 <= (tmp_last_V_reg_368 or ap_phi_mux_header_ready_1_flag_0_i_phi_fu_113_p4);
    p_Result_s_fu_272_p2 <= (and_ln414_fu_260_p2 or and_ln414_2_fu_266_p2);

    s_axis_raw_internal_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, s_axis_raw_internal_empty_n, tmp_i_nbreadreq_fu_82_p3, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_done_reg = ap_const_logic_0) and (tmp_i_nbreadreq_fu_82_p3 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            s_axis_raw_internal_blk_n <= s_axis_raw_internal_empty_n;
        else 
            s_axis_raw_internal_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    s_axis_raw_internal_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, tmp_i_nbreadreq_fu_82_p3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_i_nbreadreq_fu_82_p3 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            s_axis_raw_internal_read <= ap_const_logic_1;
        else 
            s_axis_raw_internal_read <= ap_const_logic_0;
        end if; 
    end process;

    select_ln414_4_fu_224_p3 <= 
        tmp_fu_214_p4 when (icmp_ln414_fu_189_p2(0) = '1') else 
        tmp_75_fu_179_p1;
    select_ln414_5_fu_232_p3 <= 
        ap_const_lv112_7FFFFFFFFFFFFFFFFFFFFFFFFFFF when (icmp_ln414_fu_189_p2(0) = '1') else 
        ap_const_lv112_0;
    select_ln414_6_fu_240_p3 <= 
        ap_const_lv112_FFFFFFFFFFFFFFFFFFFFFFFFFFFE when (icmp_ln414_fu_189_p2(0) = '1') else 
        ap_const_lv112_0;
    select_ln414_fu_206_p3 <= 
        st_fu_198_p3 when (icmp_ln414_fu_189_p2(0) = '1') else 
        tmp_75_fu_179_p1;
    select_ln62_fu_298_p3 <= 
        ap_const_lv16_0 when (tmp_last_V_reg_368(0) = '1') else 
        ap_phi_mux_header_idx_1_new_0_i_phi_fu_124_p4;
    shl_ln_fu_171_p3 <= (header_idx_1 & ap_const_lv9_0);
    st_fu_198_p3 <= (trunc_ln414_fu_195_p1 & ap_const_lv111_0);
    tmp_101_i_fu_338_p4 <= ap_phi_reg_pp0_iter2_p_Val2_8_reg_142(103 downto 96);
    tmp_75_fu_179_p1 <= s_axis_raw_internal_read_reg_361(112 - 1 downto 0);
    
    tmp_fu_214_p4_proc : process(select_ln414_fu_206_p3)
    variable vlo_cpy : STD_LOGIC_VECTOR(112+32 - 1 downto 0);
    variable vhi_cpy : STD_LOGIC_VECTOR(112+32 - 1 downto 0);
    variable v0_cpy : STD_LOGIC_VECTOR(112 - 1 downto 0);
    variable tmp_fu_214_p4_i : integer;
    variable section : STD_LOGIC_VECTOR(112 - 1 downto 0);
    variable tmp_mask : STD_LOGIC_VECTOR(112 - 1 downto 0);
    variable resvalue, res_value, res_mask : STD_LOGIC_VECTOR(112 - 1 downto 0);
    begin
        vlo_cpy := (others => '0');
        vlo_cpy(7 - 1 downto 0) := ap_const_lv32_6F(7 - 1 downto 0);
        vhi_cpy := (others => '0');
        vhi_cpy(7 - 1 downto 0) := ap_const_lv32_0(7 - 1 downto 0);
        v0_cpy := select_ln414_fu_206_p3;
        if (vlo_cpy(7 - 1 downto 0) > vhi_cpy(7 - 1 downto 0)) then
            vhi_cpy(7-1 downto 0) := std_logic_vector(112-1-unsigned(ap_const_lv32_0(7-1 downto 0)));
            vlo_cpy(7-1 downto 0) := std_logic_vector(112-1-unsigned(ap_const_lv32_6F(7-1 downto 0)));
            for tmp_fu_214_p4_i in 0 to 112-1 loop
                v0_cpy(tmp_fu_214_p4_i) := select_ln414_fu_206_p3(112-1-tmp_fu_214_p4_i);
            end loop;
        end if;
        res_value := std_logic_vector(shift_right(unsigned(v0_cpy), to_integer(unsigned('0' & vlo_cpy(7-1 downto 0)))));

        section := (others=>'0');
        section(7-1 downto 0) := std_logic_vector(unsigned(vhi_cpy(7-1 downto 0)) - unsigned(vlo_cpy(7-1 downto 0)));
        tmp_mask := (others => '1');
        res_mask := std_logic_vector(shift_left(unsigned(tmp_mask),to_integer(unsigned('0' & section(31-1 downto 0)))));
        res_mask := res_mask(112-2 downto 0) & '0';
        resvalue := res_value and not res_mask;
        tmp_fu_214_p4 <= resvalue(112-1 downto 0);
    end process;

    tmp_i_60_fu_328_p4 <= ap_phi_reg_pp0_iter2_p_Val2_8_reg_142(111 downto 104);
    tmp_i_nbreadreq_fu_82_p3 <= (0=>(s_axis_raw_internal_empty_n), others=>'-');
    trunc_ln414_fu_195_p1 <= s_axis_raw_internal_read_reg_361(1 - 1 downto 0);
    xor_ln414_fu_254_p2 <= (or_ln414_fu_248_p2 xor ap_const_lv112_FFFFFFFFFFFFFFFFFFFFFFFFFFFF);
    xor_ln62_fu_293_p2 <= (tmp_last_V_reg_368 xor ap_const_lv1_1);
end behav;
