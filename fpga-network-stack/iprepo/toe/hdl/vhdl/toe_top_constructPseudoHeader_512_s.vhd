-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity toe_top_constructPseudoHeader_512_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    rxEng_ipMetaFifo_dout : IN STD_LOGIC_VECTOR (95 downto 0);
    rxEng_ipMetaFifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    rxEng_ipMetaFifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    rxEng_ipMetaFifo_empty_n : IN STD_LOGIC;
    rxEng_ipMetaFifo_read : OUT STD_LOGIC;
    rxEng_pseudoHeaderFifo_din : OUT STD_LOGIC_VECTOR (1023 downto 0);
    rxEng_pseudoHeaderFifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    rxEng_pseudoHeaderFifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    rxEng_pseudoHeaderFifo_full_n : IN STD_LOGIC;
    rxEng_pseudoHeaderFifo_write : OUT STD_LOGIC );
end;


architecture behav of toe_top_constructPseudoHeader_512_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_48 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001000";
    constant ap_const_lv32_4F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001111";
    constant ap_const_lv32_40 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000000";
    constant ap_const_lv32_47 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000111";
    constant ap_const_lv32_50 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001010000";
    constant ap_const_lv32_5F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001011111";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv25_60 : STD_LOGIC_VECTOR (24 downto 0) := "0000000000000000001100000";
    constant ap_const_lv512_lc_3 : STD_LOGIC_VECTOR (511 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
    constant ap_const_lv65_10000000000000000 : STD_LOGIC_VECTOR (64 downto 0) := "10000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv577_lc_9 : STD_LOGIC_VECTOR (576 downto 0) := "0111111111111111111111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal state_3_load_load_fu_114_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_i_nbreadreq_fu_82_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op18_read_state1 : BOOLEAN;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal state_3_load_reg_285 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal state_3 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal header_idx_4 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal header_header_V_4 : STD_LOGIC_VECTOR (95 downto 0) := "000000000000000000000110000000000000000000000000000000000000000000000000000000000000000000000000";
    signal rxEng_ipMetaFifo_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal rxEng_pseudoHeaderFifo_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal p_Result_244_fu_236_p5 : STD_LOGIC_VECTOR (511 downto 0);
    signal icmp_ln82_fu_230_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter0_sendWord_data_V_20_reg_103 : STD_LOGIC_VECTOR (511 downto 0);
    signal ap_phi_reg_pp0_iter1_sendWord_data_V_20_reg_103 : STD_LOGIC_VECTOR (511 downto 0);
    signal add_ln85_fu_248_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_Result_s_fu_198_p5 : STD_LOGIC_VECTOR (95 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal tmp_their_address_V_fu_126_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal p_Result_241_fu_146_p5 : STD_LOGIC_VECTOR (95 downto 0);
    signal tmp_our_address_V_fu_130_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_600_i6_fu_180_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_i5_fu_170_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_Result_242_fu_158_p5 : STD_LOGIC_VECTOR (95 downto 0);
    signal p_Result_243_fu_190_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal shl_ln_fu_222_p3 : STD_LOGIC_VECTOR (24 downto 0);
    signal zext_ln174_i_fu_266_p3 : STD_LOGIC_VECTOR (576 downto 0);
    signal or_ln174_fu_274_p2 : STD_LOGIC_VECTOR (576 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to0 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_condition_108 : BOOLEAN;
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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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


    ap_phi_reg_pp0_iter1_sendWord_data_V_20_reg_103_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_108)) then
                if (((state_3_load_load_fu_114_p1 = ap_const_lv1_1) and (icmp_ln82_fu_230_p2 = ap_const_lv1_1))) then 
                    ap_phi_reg_pp0_iter1_sendWord_data_V_20_reg_103 <= p_Result_244_fu_236_p5;
                elsif ((ap_const_boolean_1 = ap_const_boolean_1)) then 
                    ap_phi_reg_pp0_iter1_sendWord_data_V_20_reg_103 <= ap_phi_reg_pp0_iter0_sendWord_data_V_20_reg_103;
                end if;
            end if; 
        end if;
    end process;

    header_idx_4_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_108)) then
                if (((state_3_load_load_fu_114_p1 = ap_const_lv1_1) and (icmp_ln82_fu_230_p2 = ap_const_lv1_1))) then 
                    header_idx_4 <= add_ln85_fu_248_p2;
                elsif (((tmp_i_nbreadreq_fu_82_p3 = ap_const_lv1_1) and (state_3 = ap_const_lv1_0))) then 
                    header_idx_4 <= ap_const_lv16_0;
                end if;
            end if; 
        end if;
    end process;

    state_3_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_108)) then
                if ((state_3_load_load_fu_114_p1 = ap_const_lv1_1)) then 
                    state_3 <= ap_const_lv1_0;
                elsif (((tmp_i_nbreadreq_fu_82_p3 = ap_const_lv1_1) and (state_3 = ap_const_lv1_0))) then 
                    state_3 <= ap_const_lv1_1;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_i_nbreadreq_fu_82_p3 = ap_const_lv1_1) and (state_3 = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                header_header_V_4 <= p_Result_s_fu_198_p5;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                state_3_load_reg_285 <= state_3;
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
    add_ln85_fu_248_p2 <= std_logic_vector(unsigned(header_idx_4) + unsigned(ap_const_lv16_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, rxEng_ipMetaFifo_empty_n, ap_predicate_op18_read_state1, ap_done_reg, rxEng_pseudoHeaderFifo_full_n, state_3_load_reg_285)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((state_3_load_reg_285 = ap_const_lv1_1) and (rxEng_pseudoHeaderFifo_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op18_read_state1 = ap_const_boolean_1) and (rxEng_ipMetaFifo_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, rxEng_ipMetaFifo_empty_n, ap_predicate_op18_read_state1, ap_done_reg, rxEng_pseudoHeaderFifo_full_n, state_3_load_reg_285)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((state_3_load_reg_285 = ap_const_lv1_1) and (rxEng_pseudoHeaderFifo_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op18_read_state1 = ap_const_boolean_1) and (rxEng_ipMetaFifo_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, rxEng_ipMetaFifo_empty_n, ap_predicate_op18_read_state1, ap_done_reg, rxEng_pseudoHeaderFifo_full_n, state_3_load_reg_285)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((state_3_load_reg_285 = ap_const_lv1_1) and (rxEng_pseudoHeaderFifo_full_n = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op18_read_state1 = ap_const_boolean_1) and (rxEng_ipMetaFifo_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(rxEng_ipMetaFifo_empty_n, ap_predicate_op18_read_state1, ap_done_reg)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op18_read_state1 = ap_const_boolean_1) and (rxEng_ipMetaFifo_empty_n = ap_const_logic_0)));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(rxEng_pseudoHeaderFifo_full_n, state_3_load_reg_285)
    begin
                ap_block_state2_pp0_stage0_iter1 <= ((state_3_load_reg_285 = ap_const_lv1_1) and (rxEng_pseudoHeaderFifo_full_n = ap_const_logic_0));
    end process;


    ap_condition_108_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
                ap_condition_108 <= ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_done_reg, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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

    ap_phi_reg_pp0_iter0_sendWord_data_V_20_reg_103 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    ap_predicate_op18_read_state1_assign_proc : process(tmp_i_nbreadreq_fu_82_p3, state_3)
    begin
                ap_predicate_op18_read_state1 <= ((tmp_i_nbreadreq_fu_82_p3 = ap_const_lv1_1) and (state_3 = ap_const_lv1_0));
    end process;


    ap_ready_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
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

    icmp_ln82_fu_230_p2 <= "1" when (unsigned(shl_ln_fu_222_p3) < unsigned(ap_const_lv25_60)) else "0";
    or_ln174_fu_274_p2 <= (zext_ln174_i_fu_266_p3 or ap_const_lv577_lc_9);
    p_Result_241_fu_146_p5 <= (header_header_V_4(95 downto 32) & tmp_their_address_V_fu_126_p1);
    p_Result_242_fu_158_p5 <= (p_Result_241_fu_146_p5(95 downto 64) & tmp_our_address_V_fu_130_p4 & p_Result_241_fu_146_p5(31 downto 0));
    p_Result_243_fu_190_p3 <= (tmp_600_i6_fu_180_p4 & tmp_i5_fu_170_p4);
    p_Result_244_fu_236_p5 <= (ap_const_lv512_lc_3(511 downto 96) & header_header_V_4);
    p_Result_s_fu_198_p5 <= (p_Result_243_fu_190_p3 & p_Result_242_fu_158_p5(79 downto 0));

    rxEng_ipMetaFifo_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, rxEng_ipMetaFifo_empty_n, ap_predicate_op18_read_state1, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_done_reg = ap_const_logic_0) and (ap_predicate_op18_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            rxEng_ipMetaFifo_blk_n <= rxEng_ipMetaFifo_empty_n;
        else 
            rxEng_ipMetaFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    rxEng_ipMetaFifo_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op18_read_state1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op18_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            rxEng_ipMetaFifo_read <= ap_const_logic_1;
        else 
            rxEng_ipMetaFifo_read <= ap_const_logic_0;
        end if; 
    end process;


    rxEng_pseudoHeaderFifo_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, rxEng_pseudoHeaderFifo_full_n, state_3_load_reg_285, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (state_3_load_reg_285 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            rxEng_pseudoHeaderFifo_blk_n <= rxEng_pseudoHeaderFifo_full_n;
        else 
            rxEng_pseudoHeaderFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    rxEng_pseudoHeaderFifo_din <= std_logic_vector(IEEE.numeric_std.resize(unsigned(or_ln174_fu_274_p2),1024));

    rxEng_pseudoHeaderFifo_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, state_3_load_reg_285, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (state_3_load_reg_285 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            rxEng_pseudoHeaderFifo_write <= ap_const_logic_1;
        else 
            rxEng_pseudoHeaderFifo_write <= ap_const_logic_0;
        end if; 
    end process;

    shl_ln_fu_222_p3 <= (header_idx_4 & ap_const_lv9_0);
    state_3_load_load_fu_114_p1 <= state_3;
    tmp_600_i6_fu_180_p4 <= rxEng_ipMetaFifo_dout(71 downto 64);
    tmp_i5_fu_170_p4 <= rxEng_ipMetaFifo_dout(79 downto 72);
    tmp_i_nbreadreq_fu_82_p3 <= (0=>(rxEng_ipMetaFifo_empty_n), others=>'-');
    tmp_our_address_V_fu_130_p4 <= rxEng_ipMetaFifo_dout(63 downto 32);
    tmp_their_address_V_fu_126_p1 <= rxEng_ipMetaFifo_dout(32 - 1 downto 0);
    zext_ln174_i_fu_266_p3 <= (ap_const_lv65_10000000000000000 & ap_phi_reg_pp0_iter1_sendWord_data_V_20_reg_103);
end behav;
