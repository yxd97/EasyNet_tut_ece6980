-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mac_ip_encode_top_insert_ip_checksum_512_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    dataStreamBuffer1_dout : IN STD_LOGIC_VECTOR (576 downto 0);
    dataStreamBuffer1_num_data_valid : IN STD_LOGIC_VECTOR (5 downto 0);
    dataStreamBuffer1_fifo_cap : IN STD_LOGIC_VECTOR (5 downto 0);
    dataStreamBuffer1_empty_n : IN STD_LOGIC;
    dataStreamBuffer1_read : OUT STD_LOGIC;
    checksumFifo_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    checksumFifo_num_data_valid : IN STD_LOGIC_VECTOR (4 downto 0);
    checksumFifo_fifo_cap : IN STD_LOGIC_VECTOR (4 downto 0);
    checksumFifo_empty_n : IN STD_LOGIC;
    checksumFifo_read : OUT STD_LOGIC;
    dataStreamBuffer2_din : OUT STD_LOGIC_VECTOR (576 downto 0);
    dataStreamBuffer2_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    dataStreamBuffer2_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    dataStreamBuffer2_full_n : IN STD_LOGIC;
    dataStreamBuffer2_write : OUT STD_LOGIC );
end;


architecture behav of mac_ip_encode_top_insert_ip_checksum_512_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_240 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000001001000000";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_50 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001010000";
    constant ap_const_lv32_5F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001011111";
    constant ap_const_lv32_200 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000001000000000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal grp_nbreadreq_fu_64_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op20_read_state1 : BOOLEAN;
    signal tmp_69_i_nbreadreq_fu_78_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op29_read_state1 : BOOLEAN;
    signal ap_predicate_op32_read_state1 : BOOLEAN;
    signal ap_predicate_op44_read_state1 : BOOLEAN;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal wordCount_V_load_reg_207 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_68_i_reg_211 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op51_write_state2 : BOOLEAN;
    signal tmp_i_reg_215 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_69_i_reg_219 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op54_write_state2 : BOOLEAN;
    signal tmp_i_50_reg_233 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op56_write_state2 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal wordCount_V : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal dataStreamBuffer1_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal checksumFifo_blk_n : STD_LOGIC;
    signal dataStreamBuffer2_blk_n : STD_LOGIC;
    signal reg_107 : STD_LOGIC_VECTOR (576 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal p_Result_32_fu_156_p5 : STD_LOGIC_VECTOR (511 downto 0);
    signal p_Result_32_reg_223 : STD_LOGIC_VECTOR (511 downto 0);
    signal tmp_reg_228 : STD_LOGIC_VECTOR (64 downto 0);
    signal select_ln117_fu_116_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln100_cast_i_fu_184_p1 : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_fu_99_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal p_s_fu_200_p3 : STD_LOGIC_VECTOR (576 downto 0);
    signal trunc_ln674_fu_144_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_70_i9_fu_134_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_data_V_fu_130_p1 : STD_LOGIC_VECTOR (511 downto 0);
    signal p_Result_s_fu_148_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal xor_ln100_fu_178_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to0 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_condition_284 : BOOLEAN;
    signal ap_condition_282 : BOOLEAN;
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


    wordCount_V_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_282)) then
                if ((ap_const_boolean_1 = ap_condition_284)) then 
                    wordCount_V <= ap_const_lv2_0;
                elsif (((tmp_69_i_nbreadreq_fu_78_p3 = ap_const_lv1_1) and (wordCount_V = ap_const_lv2_0))) then 
                    wordCount_V <= select_ln100_cast_i_fu_184_p1;
                elsif ((wordCount_V = ap_const_lv2_1)) then 
                    wordCount_V <= select_ln117_fu_116_p3;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_69_i_nbreadreq_fu_78_p3 = ap_const_lv1_1) and (grp_nbreadreq_fu_64_p3 = ap_const_lv1_1) and (wordCount_V = ap_const_lv2_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                p_Result_32_reg_223 <= p_Result_32_fu_156_p5;
                tmp_reg_228 <= dataStreamBuffer1_dout(576 downto 512);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_predicate_op20_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then
                reg_107 <= dataStreamBuffer1_dout;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((wordCount_V = ap_const_lv2_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_68_i_reg_211 <= grp_nbreadreq_fu_64_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_nbreadreq_fu_64_p3 = ap_const_lv1_1) and (wordCount_V = ap_const_lv2_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_69_i_reg_219 <= tmp_69_i_nbreadreq_fu_78_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((wordCount_V = ap_const_lv2_0)) and not((wordCount_V = ap_const_lv2_1)) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_i_50_reg_233 <= grp_nbreadreq_fu_64_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((wordCount_V = ap_const_lv2_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_i_reg_215 <= grp_nbreadreq_fu_64_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                wordCount_V_load_reg_207 <= wordCount_V;
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

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, dataStreamBuffer1_empty_n, ap_predicate_op20_read_state1, ap_predicate_op29_read_state1, checksumFifo_empty_n, ap_predicate_op32_read_state1, ap_predicate_op44_read_state1, ap_done_reg, dataStreamBuffer2_full_n, ap_predicate_op51_write_state2, ap_predicate_op54_write_state2, ap_predicate_op56_write_state2)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (dataStreamBuffer1_empty_n = ap_const_logic_0)) or ((ap_predicate_op32_read_state1 = ap_const_boolean_1) and (checksumFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op29_read_state1 = ap_const_boolean_1) and (dataStreamBuffer1_empty_n = ap_const_logic_0)) or ((ap_predicate_op20_read_state1 = ap_const_boolean_1) and (dataStreamBuffer1_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op51_write_state2 = ap_const_boolean_1) and (dataStreamBuffer2_full_n = ap_const_logic_0)) or ((dataStreamBuffer2_full_n = ap_const_logic_0) and (ap_predicate_op56_write_state2 = ap_const_boolean_1)) or ((dataStreamBuffer2_full_n = ap_const_logic_0) and (ap_predicate_op54_write_state2 = ap_const_boolean_1)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, dataStreamBuffer1_empty_n, ap_predicate_op20_read_state1, ap_predicate_op29_read_state1, checksumFifo_empty_n, ap_predicate_op32_read_state1, ap_predicate_op44_read_state1, ap_done_reg, dataStreamBuffer2_full_n, ap_predicate_op51_write_state2, ap_predicate_op54_write_state2, ap_predicate_op56_write_state2)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (dataStreamBuffer1_empty_n = ap_const_logic_0)) or ((ap_predicate_op32_read_state1 = ap_const_boolean_1) and (checksumFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op29_read_state1 = ap_const_boolean_1) and (dataStreamBuffer1_empty_n = ap_const_logic_0)) or ((ap_predicate_op20_read_state1 = ap_const_boolean_1) and (dataStreamBuffer1_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op51_write_state2 = ap_const_boolean_1) and (dataStreamBuffer2_full_n = ap_const_logic_0)) or ((dataStreamBuffer2_full_n = ap_const_logic_0) and (ap_predicate_op56_write_state2 = ap_const_boolean_1)) or ((dataStreamBuffer2_full_n = ap_const_logic_0) and (ap_predicate_op54_write_state2 = ap_const_boolean_1)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, dataStreamBuffer1_empty_n, ap_predicate_op20_read_state1, ap_predicate_op29_read_state1, checksumFifo_empty_n, ap_predicate_op32_read_state1, ap_predicate_op44_read_state1, ap_done_reg, dataStreamBuffer2_full_n, ap_predicate_op51_write_state2, ap_predicate_op54_write_state2, ap_predicate_op56_write_state2)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (dataStreamBuffer1_empty_n = ap_const_logic_0)) or ((ap_predicate_op32_read_state1 = ap_const_boolean_1) and (checksumFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op29_read_state1 = ap_const_boolean_1) and (dataStreamBuffer1_empty_n = ap_const_logic_0)) or ((ap_predicate_op20_read_state1 = ap_const_boolean_1) and (dataStreamBuffer1_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op51_write_state2 = ap_const_boolean_1) and (dataStreamBuffer2_full_n = ap_const_logic_0)) or ((dataStreamBuffer2_full_n = ap_const_logic_0) and (ap_predicate_op56_write_state2 = ap_const_boolean_1)) or ((dataStreamBuffer2_full_n = ap_const_logic_0) and (ap_predicate_op54_write_state2 = ap_const_boolean_1)))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(dataStreamBuffer1_empty_n, ap_predicate_op20_read_state1, ap_predicate_op29_read_state1, checksumFifo_empty_n, ap_predicate_op32_read_state1, ap_predicate_op44_read_state1, ap_done_reg)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (dataStreamBuffer1_empty_n = ap_const_logic_0)) or ((ap_predicate_op32_read_state1 = ap_const_boolean_1) and (checksumFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op29_read_state1 = ap_const_boolean_1) and (dataStreamBuffer1_empty_n = ap_const_logic_0)) or ((ap_predicate_op20_read_state1 = ap_const_boolean_1) and (dataStreamBuffer1_empty_n = ap_const_logic_0)));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(dataStreamBuffer2_full_n, ap_predicate_op51_write_state2, ap_predicate_op54_write_state2, ap_predicate_op56_write_state2)
    begin
                ap_block_state2_pp0_stage0_iter1 <= (((ap_predicate_op51_write_state2 = ap_const_boolean_1) and (dataStreamBuffer2_full_n = ap_const_logic_0)) or ((dataStreamBuffer2_full_n = ap_const_logic_0) and (ap_predicate_op56_write_state2 = ap_const_boolean_1)) or ((dataStreamBuffer2_full_n = ap_const_logic_0) and (ap_predicate_op54_write_state2 = ap_const_boolean_1)));
    end process;


    ap_condition_282_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, grp_nbreadreq_fu_64_p3, ap_block_pp0_stage0_11001)
    begin
                ap_condition_282 <= ((grp_nbreadreq_fu_64_p3 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001));
    end process;


    ap_condition_284_assign_proc : process(wordCount_V, grp_fu_99_p3)
    begin
                ap_condition_284 <= (not((wordCount_V = ap_const_lv2_0)) and not((wordCount_V = ap_const_lv2_1)) and (grp_fu_99_p3 = ap_const_lv1_1));
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


    ap_predicate_op20_read_state1_assign_proc : process(grp_nbreadreq_fu_64_p3, wordCount_V)
    begin
                ap_predicate_op20_read_state1 <= ((grp_nbreadreq_fu_64_p3 = ap_const_lv1_1) and (wordCount_V = ap_const_lv2_1));
    end process;


    ap_predicate_op29_read_state1_assign_proc : process(grp_nbreadreq_fu_64_p3, tmp_69_i_nbreadreq_fu_78_p3, wordCount_V)
    begin
                ap_predicate_op29_read_state1 <= ((tmp_69_i_nbreadreq_fu_78_p3 = ap_const_lv1_1) and (grp_nbreadreq_fu_64_p3 = ap_const_lv1_1) and (wordCount_V = ap_const_lv2_0));
    end process;


    ap_predicate_op32_read_state1_assign_proc : process(grp_nbreadreq_fu_64_p3, tmp_69_i_nbreadreq_fu_78_p3, wordCount_V)
    begin
                ap_predicate_op32_read_state1 <= ((tmp_69_i_nbreadreq_fu_78_p3 = ap_const_lv1_1) and (grp_nbreadreq_fu_64_p3 = ap_const_lv1_1) and (wordCount_V = ap_const_lv2_0));
    end process;


    ap_predicate_op44_read_state1_assign_proc : process(grp_nbreadreq_fu_64_p3, wordCount_V)
    begin
                ap_predicate_op44_read_state1 <= (not((wordCount_V = ap_const_lv2_0)) and not((wordCount_V = ap_const_lv2_1)) and (grp_nbreadreq_fu_64_p3 = ap_const_lv1_1));
    end process;


    ap_predicate_op51_write_state2_assign_proc : process(wordCount_V_load_reg_207, tmp_68_i_reg_211)
    begin
                ap_predicate_op51_write_state2 <= ((tmp_68_i_reg_211 = ap_const_lv1_1) and (wordCount_V_load_reg_207 = ap_const_lv2_1));
    end process;


    ap_predicate_op54_write_state2_assign_proc : process(wordCount_V_load_reg_207, tmp_i_reg_215, tmp_69_i_reg_219)
    begin
                ap_predicate_op54_write_state2 <= ((tmp_i_reg_215 = ap_const_lv1_1) and (wordCount_V_load_reg_207 = ap_const_lv2_0) and (tmp_69_i_reg_219 = ap_const_lv1_1));
    end process;


    ap_predicate_op56_write_state2_assign_proc : process(wordCount_V_load_reg_207, tmp_i_50_reg_233)
    begin
                ap_predicate_op56_write_state2 <= (not((wordCount_V_load_reg_207 = ap_const_lv2_0)) and not((wordCount_V_load_reg_207 = ap_const_lv2_1)) and (tmp_i_50_reg_233 = ap_const_lv1_1));
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


    checksumFifo_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, checksumFifo_empty_n, ap_predicate_op32_read_state1, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_done_reg = ap_const_logic_0) and (ap_predicate_op32_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            checksumFifo_blk_n <= checksumFifo_empty_n;
        else 
            checksumFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    checksumFifo_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op32_read_state1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op32_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            checksumFifo_read <= ap_const_logic_1;
        else 
            checksumFifo_read <= ap_const_logic_0;
        end if; 
    end process;


    dataStreamBuffer1_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, dataStreamBuffer1_empty_n, ap_predicate_op20_read_state1, ap_predicate_op29_read_state1, ap_predicate_op44_read_state1, ap_done_reg, ap_block_pp0_stage0)
    begin
        if ((((ap_done_reg = ap_const_logic_0) and (ap_predicate_op44_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((ap_done_reg = ap_const_logic_0) and (ap_predicate_op29_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((ap_done_reg = ap_const_logic_0) and (ap_predicate_op20_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)))) then 
            dataStreamBuffer1_blk_n <= dataStreamBuffer1_empty_n;
        else 
            dataStreamBuffer1_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    dataStreamBuffer1_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op20_read_state1, ap_predicate_op29_read_state1, ap_predicate_op44_read_state1, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_predicate_op29_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_predicate_op20_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
            dataStreamBuffer1_read <= ap_const_logic_1;
        else 
            dataStreamBuffer1_read <= ap_const_logic_0;
        end if; 
    end process;


    dataStreamBuffer2_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, dataStreamBuffer2_full_n, ap_predicate_op51_write_state2, ap_predicate_op54_write_state2, ap_predicate_op56_write_state2, ap_block_pp0_stage0)
    begin
        if ((((ap_predicate_op51_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op56_write_state2 = ap_const_boolean_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op54_write_state2 = ap_const_boolean_1)))) then 
            dataStreamBuffer2_blk_n <= dataStreamBuffer2_full_n;
        else 
            dataStreamBuffer2_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    dataStreamBuffer2_din_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op51_write_state2, ap_predicate_op54_write_state2, ap_predicate_op56_write_state2, reg_107, ap_block_pp0_stage0_01001, p_s_fu_200_p3)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_predicate_op54_write_state2 = ap_const_boolean_1))) then 
            dataStreamBuffer2_din <= p_s_fu_200_p3;
        elsif ((((ap_predicate_op51_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_predicate_op56_write_state2 = ap_const_boolean_1)))) then 
            dataStreamBuffer2_din <= reg_107;
        else 
            dataStreamBuffer2_din <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    dataStreamBuffer2_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op51_write_state2, ap_predicate_op54_write_state2, ap_predicate_op56_write_state2, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_predicate_op51_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op56_write_state2 = ap_const_boolean_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op54_write_state2 = ap_const_boolean_1)))) then 
            dataStreamBuffer2_write <= ap_const_logic_1;
        else 
            dataStreamBuffer2_write <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_99_p3 <= dataStreamBuffer1_dout(576 downto 576);
    grp_nbreadreq_fu_64_p3 <= (0=>(dataStreamBuffer1_empty_n), others=>'-');
    p_Result_32_fu_156_p5 <= (tmp_data_V_fu_130_p1(511 downto 96) & p_Result_s_fu_148_p3 & tmp_data_V_fu_130_p1(79 downto 0));
    p_Result_s_fu_148_p3 <= (trunc_ln674_fu_144_p1 & tmp_70_i9_fu_134_p4);
    p_s_fu_200_p3 <= (tmp_reg_228 & p_Result_32_reg_223);
    select_ln100_cast_i_fu_184_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(xor_ln100_fu_178_p2),2));
    select_ln117_fu_116_p3 <= 
        ap_const_lv2_0 when (grp_fu_99_p3(0) = '1') else 
        ap_const_lv2_2;
    tmp_69_i_nbreadreq_fu_78_p3 <= (0=>(checksumFifo_empty_n), others=>'-');
    tmp_70_i9_fu_134_p4 <= checksumFifo_dout(15 downto 8);
    tmp_data_V_fu_130_p1 <= dataStreamBuffer1_dout(512 - 1 downto 0);
    trunc_ln674_fu_144_p1 <= checksumFifo_dout(8 - 1 downto 0);
    xor_ln100_fu_178_p2 <= (grp_fu_99_p3 xor ap_const_lv1_1);
end behav;