-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity udp_top_generate_udp_512_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    tx_shift2udpFifo_dout : IN STD_LOGIC_VECTOR (1023 downto 0);
    tx_shift2udpFifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    tx_shift2udpFifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    tx_shift2udpFifo_empty_n : IN STD_LOGIC;
    tx_shift2udpFifo_read : OUT STD_LOGIC;
    tx_udpMetaFifo_dout : IN STD_LOGIC_VECTOR (63 downto 0);
    tx_udpMetaFifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    tx_udpMetaFifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    tx_udpMetaFifo_empty_n : IN STD_LOGIC;
    tx_udpMetaFifo_read : OUT STD_LOGIC;
    m_axis_tx_data_internal_din : OUT STD_LOGIC_VECTOR (1023 downto 0);
    m_axis_tx_data_internal_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axis_tx_data_internal_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axis_tx_data_internal_full_n : IN STD_LOGIC;
    m_axis_tx_data_internal_write : OUT STD_LOGIC );
end;


architecture behav of udp_top_generate_udp_512_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv2_2_1 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv1024_lc_1 : STD_LOGIC_VECTOR (1023 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001001000000";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv19_0 : STD_LOGIC_VECTOR (18 downto 0) := "0000000000000000000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv32_200 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000001000000000";
    constant ap_const_lv32_240 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000001001000000";
    constant ap_const_lv512_lc_2 : STD_LOGIC_VECTOR (511 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_28 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101000";
    constant ap_const_lv32_2F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101111";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_27 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal state_load_load_fu_170_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_nbreadreq_fu_102_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op22_read_state1 : BOOLEAN;
    signal ap_predicate_op47_read_state1 : BOOLEAN;
    signal tmp_i_nbreadreq_fu_116_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op56_read_state1 : BOOLEAN;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal state_load_reg_454 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_i_43_reg_458 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op77_write_state2 : BOOLEAN;
    signal tmp_8_i_reg_488 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op85_write_state2 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal header_idx : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal header_header_V : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal tx_udpMetaFifo_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal m_axis_tx_data_internal_blk_n : STD_LOGIC;
    signal tx_shift2udpFifo_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal currWord_data_V_fu_183_p1 : STD_LOGIC_VECTOR (511 downto 0);
    signal p_Result_18_fu_201_p5 : STD_LOGIC_VECTOR (511 downto 0);
    signal icmp_ln82_1_fu_195_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_475 : STD_LOGIC_VECTOR (64 downto 0);
    signal p_Result_17_fu_263_p5 : STD_LOGIC_VECTOR (511 downto 0);
    signal icmp_ln82_fu_257_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tx_shift2udpFifo_read_reg_492 : STD_LOGIC_VECTOR (1023 downto 0);
    signal ap_phi_reg_pp0_iter0_currWord_data_V_3_reg_137 : STD_LOGIC_VECTOR (511 downto 0);
    signal ap_phi_reg_pp0_iter1_currWord_data_V_3_reg_137 : STD_LOGIC_VECTOR (511 downto 0);
    signal ap_phi_reg_pp0_iter0_currWord_data_V_1_reg_146 : STD_LOGIC_VECTOR (511 downto 0);
    signal ap_phi_reg_pp0_iter1_currWord_data_V_1_reg_146 : STD_LOGIC_VECTOR (511 downto 0);
    signal select_ln132_cast_i_fu_235_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_fu_157_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_fu_165_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_Result_s_fu_401_p5 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln174_3_fu_432_p1 : STD_LOGIC_VECTOR (1023 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal zext_ln174_fu_449_p1 : STD_LOGIC_VECTOR (1023 downto 0);
    signal tmp_10_fu_187_p3 : STD_LOGIC_VECTOR (18 downto 0);
    signal xor_ln132_fu_229_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_6_fu_249_p3 : STD_LOGIC_VECTOR (18 downto 0);
    signal trunc_ln674_fu_309_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_9_i_fu_299_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Result_12_fu_313_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_12_i_fu_343_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_11_i9_fu_333_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Result_13_fu_321_p5 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_14_fu_353_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_14_i_fu_383_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_13_i_fu_373_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Result_15_fu_361_p5 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_Result_16_fu_393_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_9_fu_425_p3 : STD_LOGIC_VECTOR (576 downto 0);
    signal or_ln_fu_437_p3 : STD_LOGIC_VECTOR (512 downto 0);
    signal sext_ln174_fu_445_p1 : STD_LOGIC_VECTOR (543 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to0 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_condition_150 : BOOLEAN;
    signal ap_condition_159 : BOOLEAN;
    signal ap_condition_181 : BOOLEAN;
    signal ap_condition_215 : BOOLEAN;
    signal ap_condition_193 : BOOLEAN;
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
                elsif (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
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


    ap_phi_reg_pp0_iter1_currWord_data_V_1_reg_146_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_150)) then
                if (((state_load_load_fu_170_p1 = ap_const_lv2_1) and (icmp_ln82_fu_257_p2 = ap_const_lv1_1))) then 
                    ap_phi_reg_pp0_iter1_currWord_data_V_1_reg_146 <= p_Result_17_fu_263_p5;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter1_currWord_data_V_1_reg_146 <= ap_phi_reg_pp0_iter0_currWord_data_V_1_reg_146;
                end if;
            end if; 
        end if;
    end process;

    ap_phi_reg_pp0_iter1_currWord_data_V_3_reg_137_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_150)) then
                if ((ap_const_boolean_1 = ap_condition_181)) then 
                    ap_phi_reg_pp0_iter1_currWord_data_V_3_reg_137 <= currWord_data_V_fu_183_p1;
                elsif ((ap_const_boolean_1 = ap_condition_159)) then 
                    ap_phi_reg_pp0_iter1_currWord_data_V_3_reg_137 <= p_Result_18_fu_201_p5;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter1_currWord_data_V_3_reg_137 <= ap_phi_reg_pp0_iter0_currWord_data_V_3_reg_137;
                end if;
            end if; 
        end if;
    end process;

    header_idx_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_nbreadreq_fu_116_p3 = ap_const_lv1_1) and (state = ap_const_lv2_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
                header_idx <= ap_const_lv16_0;
            elsif ((((grp_nbreadreq_fu_102_p3 = ap_const_lv1_1) and (state = ap_const_lv2_2) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln82_1_fu_195_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((state_load_load_fu_170_p1 = ap_const_lv2_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln82_fu_257_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
                header_idx <= grp_fu_165_p2;
            end if; 
        end if;
    end process;

    state_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_150)) then
                if (((tmp_i_nbreadreq_fu_116_p3 = ap_const_lv1_1) and (state = ap_const_lv2_0))) then 
                    state <= ap_const_lv2_2_2;
                elsif ((ap_const_boolean_1 = ap_condition_193)) then 
                    state <= ap_const_lv2_0;
                elsif ((state_load_load_fu_170_p1 = ap_const_lv2_1)) then 
                    state <= ap_const_lv2_2_1;
                elsif (((grp_nbreadreq_fu_102_p3 = ap_const_lv1_1) and (state = ap_const_lv2_2))) then 
                    state <= select_ln132_cast_i_fu_235_p3;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_nbreadreq_fu_116_p3 = ap_const_lv1_1) and (state = ap_const_lv2_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                header_header_V <= p_Result_s_fu_401_p5;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                state_load_reg_454 <= state;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((state = ap_const_lv2_3) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_8_i_reg_488 <= grp_nbreadreq_fu_102_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((state = ap_const_lv2_2) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_i_43_reg_458 <= grp_nbreadreq_fu_102_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_nbreadreq_fu_102_p3 = ap_const_lv1_1) and (state = ap_const_lv2_2) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_reg_475 <= tx_shift2udpFifo_dout(576 downto 512);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_predicate_op47_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tx_shift2udpFifo_read_reg_492 <= tx_shift2udpFifo_dout;
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
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, tx_shift2udpFifo_empty_n, ap_predicate_op22_read_state1, ap_predicate_op47_read_state1, tx_udpMetaFifo_empty_n, ap_predicate_op56_read_state1, ap_done_reg, m_axis_tx_data_internal_full_n, state_load_reg_454, ap_predicate_op77_write_state2, ap_predicate_op85_write_state2)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op56_read_state1 = ap_const_boolean_1) and (tx_udpMetaFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op47_read_state1 = ap_const_boolean_1) and (tx_shift2udpFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op22_read_state1 = ap_const_boolean_1) and (tx_shift2udpFifo_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((state_load_reg_454 = ap_const_lv2_1) and (m_axis_tx_data_internal_full_n = ap_const_logic_0)) or ((ap_predicate_op77_write_state2 = ap_const_boolean_1) and (m_axis_tx_data_internal_full_n = ap_const_logic_0)) or ((ap_predicate_op85_write_state2 = ap_const_boolean_1) and (m_axis_tx_data_internal_full_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, tx_shift2udpFifo_empty_n, ap_predicate_op22_read_state1, ap_predicate_op47_read_state1, tx_udpMetaFifo_empty_n, ap_predicate_op56_read_state1, ap_done_reg, m_axis_tx_data_internal_full_n, state_load_reg_454, ap_predicate_op77_write_state2, ap_predicate_op85_write_state2)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op56_read_state1 = ap_const_boolean_1) and (tx_udpMetaFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op47_read_state1 = ap_const_boolean_1) and (tx_shift2udpFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op22_read_state1 = ap_const_boolean_1) and (tx_shift2udpFifo_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((state_load_reg_454 = ap_const_lv2_1) and (m_axis_tx_data_internal_full_n = ap_const_logic_0)) or ((ap_predicate_op77_write_state2 = ap_const_boolean_1) and (m_axis_tx_data_internal_full_n = ap_const_logic_0)) or ((ap_predicate_op85_write_state2 = ap_const_boolean_1) and (m_axis_tx_data_internal_full_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, tx_shift2udpFifo_empty_n, ap_predicate_op22_read_state1, ap_predicate_op47_read_state1, tx_udpMetaFifo_empty_n, ap_predicate_op56_read_state1, ap_done_reg, m_axis_tx_data_internal_full_n, state_load_reg_454, ap_predicate_op77_write_state2, ap_predicate_op85_write_state2)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op56_read_state1 = ap_const_boolean_1) and (tx_udpMetaFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op47_read_state1 = ap_const_boolean_1) and (tx_shift2udpFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op22_read_state1 = ap_const_boolean_1) and (tx_shift2udpFifo_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((state_load_reg_454 = ap_const_lv2_1) and (m_axis_tx_data_internal_full_n = ap_const_logic_0)) or ((ap_predicate_op77_write_state2 = ap_const_boolean_1) and (m_axis_tx_data_internal_full_n = ap_const_logic_0)) or ((ap_predicate_op85_write_state2 = ap_const_boolean_1) and (m_axis_tx_data_internal_full_n = ap_const_logic_0)))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(tx_shift2udpFifo_empty_n, ap_predicate_op22_read_state1, ap_predicate_op47_read_state1, tx_udpMetaFifo_empty_n, ap_predicate_op56_read_state1, ap_done_reg)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op56_read_state1 = ap_const_boolean_1) and (tx_udpMetaFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op47_read_state1 = ap_const_boolean_1) and (tx_shift2udpFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op22_read_state1 = ap_const_boolean_1) and (tx_shift2udpFifo_empty_n = ap_const_logic_0)));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(m_axis_tx_data_internal_full_n, state_load_reg_454, ap_predicate_op77_write_state2, ap_predicate_op85_write_state2)
    begin
                ap_block_state2_pp0_stage0_iter1 <= (((state_load_reg_454 = ap_const_lv2_1) and (m_axis_tx_data_internal_full_n = ap_const_logic_0)) or ((ap_predicate_op77_write_state2 = ap_const_boolean_1) and (m_axis_tx_data_internal_full_n = ap_const_logic_0)) or ((ap_predicate_op85_write_state2 = ap_const_boolean_1) and (m_axis_tx_data_internal_full_n = ap_const_logic_0)));
    end process;


    ap_condition_150_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
                ap_condition_150 <= ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001));
    end process;


    ap_condition_159_assign_proc : process(grp_nbreadreq_fu_102_p3, state, icmp_ln82_1_fu_195_p2)
    begin
                ap_condition_159 <= ((grp_nbreadreq_fu_102_p3 = ap_const_lv1_1) and (state = ap_const_lv2_2) and (icmp_ln82_1_fu_195_p2 = ap_const_lv1_1));
    end process;


    ap_condition_181_assign_proc : process(grp_nbreadreq_fu_102_p3, state, icmp_ln82_1_fu_195_p2)
    begin
                ap_condition_181 <= ((grp_nbreadreq_fu_102_p3 = ap_const_lv1_1) and (state = ap_const_lv2_2) and (icmp_ln82_1_fu_195_p2 = ap_const_lv1_0));
    end process;


    ap_condition_193_assign_proc : process(grp_nbreadreq_fu_102_p3, state, grp_fu_157_p3)
    begin
                ap_condition_193 <= ((grp_nbreadreq_fu_102_p3 = ap_const_lv1_1) and (state = ap_const_lv2_3) and (grp_fu_157_p3 = ap_const_lv1_1));
    end process;


    ap_condition_215_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_01001)
    begin
                ap_condition_215 <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001));
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_done_reg, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_0to0_assign_proc : process(ap_enable_reg_pp0_iter0)
    begin
        if ((ap_enable_reg_pp0_iter0 = ap_const_logic_0)) then 
            ap_idle_pp0_0to0 <= ap_const_logic_1;
        else 
            ap_idle_pp0_0to0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_phi_reg_pp0_iter0_currWord_data_V_1_reg_146 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    ap_phi_reg_pp0_iter0_currWord_data_V_3_reg_137 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    ap_predicate_op22_read_state1_assign_proc : process(grp_nbreadreq_fu_102_p3, state)
    begin
                ap_predicate_op22_read_state1 <= ((grp_nbreadreq_fu_102_p3 = ap_const_lv1_1) and (state = ap_const_lv2_2));
    end process;


    ap_predicate_op47_read_state1_assign_proc : process(grp_nbreadreq_fu_102_p3, state)
    begin
                ap_predicate_op47_read_state1 <= ((grp_nbreadreq_fu_102_p3 = ap_const_lv1_1) and (state = ap_const_lv2_3));
    end process;


    ap_predicate_op56_read_state1_assign_proc : process(tmp_i_nbreadreq_fu_116_p3, state)
    begin
                ap_predicate_op56_read_state1 <= ((tmp_i_nbreadreq_fu_116_p3 = ap_const_lv1_1) and (state = ap_const_lv2_0));
    end process;


    ap_predicate_op77_write_state2_assign_proc : process(state_load_reg_454, tmp_i_43_reg_458)
    begin
                ap_predicate_op77_write_state2 <= ((tmp_i_43_reg_458 = ap_const_lv1_1) and (state_load_reg_454 = ap_const_lv2_2));
    end process;


    ap_predicate_op85_write_state2_assign_proc : process(state_load_reg_454, tmp_8_i_reg_488)
    begin
                ap_predicate_op85_write_state2 <= ((tmp_8_i_reg_488 = ap_const_lv1_1) and (state_load_reg_454 = ap_const_lv2_3));
    end process;


    ap_ready_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_reset_idle_pp0_assign_proc : process(ap_start, ap_idle_pp0_0to0)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0_0to0 = ap_const_logic_1))) then 
            ap_reset_idle_pp0 <= ap_const_logic_1;
        else 
            ap_reset_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    currWord_data_V_fu_183_p1 <= tx_shift2udpFifo_dout(512 - 1 downto 0);
    grp_fu_157_p3 <= tx_shift2udpFifo_dout(576 downto 576);
    grp_fu_165_p2 <= std_logic_vector(unsigned(header_idx) + unsigned(ap_const_lv16_1));
    grp_nbreadreq_fu_102_p3 <= (0=>(tx_shift2udpFifo_empty_n), others=>'-');
    icmp_ln82_1_fu_195_p2 <= "1" when (tmp_10_fu_187_p3 = ap_const_lv19_0) else "0";
    icmp_ln82_fu_257_p2 <= "1" when (tmp_6_fu_249_p3 = ap_const_lv19_0) else "0";

    m_axis_tx_data_internal_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, m_axis_tx_data_internal_full_n, state_load_reg_454, ap_predicate_op77_write_state2, ap_predicate_op85_write_state2, ap_block_pp0_stage0)
    begin
        if ((((state_load_reg_454 = ap_const_lv2_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((ap_predicate_op77_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((ap_predicate_op85_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)))) then 
            m_axis_tx_data_internal_blk_n <= m_axis_tx_data_internal_full_n;
        else 
            m_axis_tx_data_internal_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    m_axis_tx_data_internal_din_assign_proc : process(state_load_reg_454, ap_predicate_op77_write_state2, ap_predicate_op85_write_state2, tx_shift2udpFifo_read_reg_492, zext_ln174_3_fu_432_p1, zext_ln174_fu_449_p1, ap_condition_215)
    begin
        if ((ap_const_boolean_1 = ap_condition_215)) then
            if ((ap_predicate_op85_write_state2 = ap_const_boolean_1)) then 
                m_axis_tx_data_internal_din <= tx_shift2udpFifo_read_reg_492;
            elsif ((state_load_reg_454 = ap_const_lv2_1)) then 
                m_axis_tx_data_internal_din <= zext_ln174_fu_449_p1;
            elsif ((ap_predicate_op77_write_state2 = ap_const_boolean_1)) then 
                m_axis_tx_data_internal_din <= zext_ln174_3_fu_432_p1;
            else 
                m_axis_tx_data_internal_din <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            m_axis_tx_data_internal_din <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    m_axis_tx_data_internal_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, state_load_reg_454, ap_predicate_op77_write_state2, ap_predicate_op85_write_state2, ap_block_pp0_stage0_11001)
    begin
        if ((((state_load_reg_454 = ap_const_lv2_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_predicate_op77_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_predicate_op85_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
            m_axis_tx_data_internal_write <= ap_const_logic_1;
        else 
            m_axis_tx_data_internal_write <= ap_const_logic_0;
        end if; 
    end process;

    or_ln_fu_437_p3 <= (ap_const_lv1_1 & ap_phi_reg_pp0_iter1_currWord_data_V_1_reg_146);
    p_Result_12_fu_313_p3 <= (trunc_ln674_fu_309_p1 & tmp_9_i_fu_299_p4);
    p_Result_13_fu_321_p5 <= (header_header_V(63 downto 32) & p_Result_12_fu_313_p3 & header_header_V(15 downto 0));
    p_Result_14_fu_353_p3 <= (tmp_12_i_fu_343_p4 & tmp_11_i9_fu_333_p4);
    p_Result_15_fu_361_p5 <= (p_Result_13_fu_321_p5(63 downto 16) & p_Result_14_fu_353_p3);
    p_Result_16_fu_393_p3 <= (tmp_14_i_fu_383_p4 & tmp_13_i_fu_373_p4);
    p_Result_17_fu_263_p5 <= (ap_const_lv512_lc_2(511 downto 64) & header_header_V);
    p_Result_18_fu_201_p5 <= (currWord_data_V_fu_183_p1(511 downto 64) & header_header_V);
    p_Result_s_fu_401_p5 <= (p_Result_15_fu_361_p5(63 downto 48) & p_Result_16_fu_393_p3 & p_Result_15_fu_361_p5(31 downto 0));
    select_ln132_cast_i_fu_235_p3 <= 
        ap_const_lv2_3 when (xor_ln132_fu_229_p2(0) = '1') else 
        ap_const_lv2_0;
        sext_ln174_fu_445_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(or_ln_fu_437_p3),544));

    state_load_load_fu_170_p1 <= state;
    tmp_10_fu_187_p3 <= (header_idx & ap_const_lv3_0);
    tmp_11_i9_fu_333_p4 <= tx_udpMetaFifo_dout(31 downto 24);
    tmp_12_i_fu_343_p4 <= tx_udpMetaFifo_dout(23 downto 16);
    tmp_13_i_fu_373_p4 <= tx_udpMetaFifo_dout(47 downto 40);
    tmp_14_i_fu_383_p4 <= tx_udpMetaFifo_dout(39 downto 32);
    tmp_6_fu_249_p3 <= (header_idx & ap_const_lv3_0);
    tmp_9_fu_425_p3 <= (tmp_reg_475 & ap_phi_reg_pp0_iter1_currWord_data_V_3_reg_137);
    tmp_9_i_fu_299_p4 <= tx_udpMetaFifo_dout(15 downto 8);
    tmp_i_nbreadreq_fu_116_p3 <= (0=>(tx_udpMetaFifo_empty_n), others=>'-');
    trunc_ln674_fu_309_p1 <= tx_udpMetaFifo_dout(8 - 1 downto 0);

    tx_shift2udpFifo_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, tx_shift2udpFifo_empty_n, ap_predicate_op22_read_state1, ap_predicate_op47_read_state1, ap_done_reg, ap_block_pp0_stage0)
    begin
        if ((((ap_done_reg = ap_const_logic_0) and (ap_predicate_op47_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((ap_done_reg = ap_const_logic_0) and (ap_predicate_op22_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)))) then 
            tx_shift2udpFifo_blk_n <= tx_shift2udpFifo_empty_n;
        else 
            tx_shift2udpFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    tx_shift2udpFifo_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op22_read_state1, ap_predicate_op47_read_state1, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_predicate_op47_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_predicate_op22_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
            tx_shift2udpFifo_read <= ap_const_logic_1;
        else 
            tx_shift2udpFifo_read <= ap_const_logic_0;
        end if; 
    end process;


    tx_udpMetaFifo_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, tx_udpMetaFifo_empty_n, ap_predicate_op56_read_state1, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_done_reg = ap_const_logic_0) and (ap_predicate_op56_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            tx_udpMetaFifo_blk_n <= tx_udpMetaFifo_empty_n;
        else 
            tx_udpMetaFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    tx_udpMetaFifo_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op56_read_state1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op56_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            tx_udpMetaFifo_read <= ap_const_logic_1;
        else 
            tx_udpMetaFifo_read <= ap_const_logic_0;
        end if; 
    end process;

    xor_ln132_fu_229_p2 <= (grp_fu_157_p3 xor ap_const_lv1_1);
    zext_ln174_3_fu_432_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_9_fu_425_p3),1024));
    zext_ln174_fu_449_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(sext_ln174_fu_445_p1),1024));
end behav;
