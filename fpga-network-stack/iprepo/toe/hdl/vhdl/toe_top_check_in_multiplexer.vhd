-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity toe_top_check_in_multiplexer is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    rxEng2portTable_check_req_dout : IN STD_LOGIC_VECTOR (15 downto 0);
    rxEng2portTable_check_req_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    rxEng2portTable_check_req_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    rxEng2portTable_check_req_empty_n : IN STD_LOGIC;
    rxEng2portTable_check_req_read : OUT STD_LOGIC;
    pt_portCheckListening_req_fifo_din : OUT STD_LOGIC_VECTOR (14 downto 0);
    pt_portCheckListening_req_fifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    pt_portCheckListening_req_fifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    pt_portCheckListening_req_fifo_full_n : IN STD_LOGIC;
    pt_portCheckListening_req_fifo_write : OUT STD_LOGIC;
    pt_dstFifo_din : OUT STD_LOGIC_VECTOR (0 downto 0);
    pt_dstFifo_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    pt_dstFifo_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    pt_dstFifo_full_n : IN STD_LOGIC;
    pt_dstFifo_write : OUT STD_LOGIC;
    pt_portCheckUsed_req_fifo_din : OUT STD_LOGIC_VECTOR (14 downto 0);
    pt_portCheckUsed_req_fifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    pt_portCheckUsed_req_fifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    pt_portCheckUsed_req_fifo_full_n : IN STD_LOGIC;
    pt_portCheckUsed_req_fifo_write : OUT STD_LOGIC );
end;


architecture behav of toe_top_check_in_multiplexer is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal tmp_i_nbreadreq_fu_46_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal tmp_i_reg_113 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_reg_127 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op29_write_state2 : BOOLEAN;
    signal ap_predicate_op30_write_state2 : BOOLEAN;
    signal ap_predicate_op32_write_state2 : BOOLEAN;
    signal ap_predicate_op33_write_state2 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal rxEng2portTable_check_req_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal pt_portCheckListening_req_fifo_blk_n : STD_LOGIC;
    signal pt_dstFifo_blk_n : STD_LOGIC;
    signal pt_portCheckUsed_req_fifo_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal tmp_i5_reg_117 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln414_fu_93_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal trunc_ln414_reg_122 : STD_LOGIC_VECTOR (6 downto 0);
    signal p_0_fu_105_p3 : STD_LOGIC_VECTOR (14 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to0 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_condition_139 : BOOLEAN;
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

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_i_nbreadreq_fu_46_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                tmp_i5_reg_117 <= rxEng2portTable_check_req_dout(15 downto 8);
                tmp_reg_127 <= rxEng2portTable_check_req_dout(7 downto 7);
                trunc_ln414_reg_122 <= trunc_ln414_fu_93_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                tmp_i_reg_113 <= tmp_i_nbreadreq_fu_46_p3;
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

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, rxEng2portTable_check_req_empty_n, tmp_i_nbreadreq_fu_46_p3, ap_done_reg, pt_portCheckListening_req_fifo_full_n, ap_predicate_op29_write_state2, pt_dstFifo_full_n, ap_predicate_op30_write_state2, pt_portCheckUsed_req_fifo_full_n, ap_predicate_op32_write_state2, ap_predicate_op33_write_state2)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op33_write_state2 = ap_const_boolean_1) and (pt_dstFifo_full_n = ap_const_logic_0)) or ((ap_predicate_op32_write_state2 = ap_const_boolean_1) and (pt_portCheckUsed_req_fifo_full_n = ap_const_logic_0)) or ((ap_predicate_op30_write_state2 = ap_const_boolean_1) and (pt_dstFifo_full_n = ap_const_logic_0)) or ((ap_predicate_op29_write_state2 = ap_const_boolean_1) and (pt_portCheckListening_req_fifo_full_n = ap_const_logic_0)))) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_46_p3 = ap_const_lv1_1) and (rxEng2portTable_check_req_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, rxEng2portTable_check_req_empty_n, tmp_i_nbreadreq_fu_46_p3, ap_done_reg, pt_portCheckListening_req_fifo_full_n, ap_predicate_op29_write_state2, pt_dstFifo_full_n, ap_predicate_op30_write_state2, pt_portCheckUsed_req_fifo_full_n, ap_predicate_op32_write_state2, ap_predicate_op33_write_state2)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op33_write_state2 = ap_const_boolean_1) and (pt_dstFifo_full_n = ap_const_logic_0)) or ((ap_predicate_op32_write_state2 = ap_const_boolean_1) and (pt_portCheckUsed_req_fifo_full_n = ap_const_logic_0)) or ((ap_predicate_op30_write_state2 = ap_const_boolean_1) and (pt_dstFifo_full_n = ap_const_logic_0)) or ((ap_predicate_op29_write_state2 = ap_const_boolean_1) and (pt_portCheckListening_req_fifo_full_n = ap_const_logic_0)))) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_46_p3 = ap_const_lv1_1) and (rxEng2portTable_check_req_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, rxEng2portTable_check_req_empty_n, tmp_i_nbreadreq_fu_46_p3, ap_done_reg, pt_portCheckListening_req_fifo_full_n, ap_predicate_op29_write_state2, pt_dstFifo_full_n, ap_predicate_op30_write_state2, pt_portCheckUsed_req_fifo_full_n, ap_predicate_op32_write_state2, ap_predicate_op33_write_state2)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op33_write_state2 = ap_const_boolean_1) and (pt_dstFifo_full_n = ap_const_logic_0)) or ((ap_predicate_op32_write_state2 = ap_const_boolean_1) and (pt_portCheckUsed_req_fifo_full_n = ap_const_logic_0)) or ((ap_predicate_op30_write_state2 = ap_const_boolean_1) and (pt_dstFifo_full_n = ap_const_logic_0)) or ((ap_predicate_op29_write_state2 = ap_const_boolean_1) and (pt_portCheckListening_req_fifo_full_n = ap_const_logic_0)))) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_46_p3 = ap_const_lv1_1) and (rxEng2portTable_check_req_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(rxEng2portTable_check_req_empty_n, tmp_i_nbreadreq_fu_46_p3, ap_done_reg)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_46_p3 = ap_const_lv1_1) and (rxEng2portTable_check_req_empty_n = ap_const_logic_0)));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(pt_portCheckListening_req_fifo_full_n, ap_predicate_op29_write_state2, pt_dstFifo_full_n, ap_predicate_op30_write_state2, pt_portCheckUsed_req_fifo_full_n, ap_predicate_op32_write_state2, ap_predicate_op33_write_state2)
    begin
                ap_block_state2_pp0_stage0_iter1 <= (((ap_predicate_op33_write_state2 = ap_const_boolean_1) and (pt_dstFifo_full_n = ap_const_logic_0)) or ((ap_predicate_op32_write_state2 = ap_const_boolean_1) and (pt_portCheckUsed_req_fifo_full_n = ap_const_logic_0)) or ((ap_predicate_op30_write_state2 = ap_const_boolean_1) and (pt_dstFifo_full_n = ap_const_logic_0)) or ((ap_predicate_op29_write_state2 = ap_const_boolean_1) and (pt_portCheckListening_req_fifo_full_n = ap_const_logic_0)));
    end process;


    ap_condition_139_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_01001)
    begin
                ap_condition_139 <= ((ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
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


    ap_predicate_op29_write_state2_assign_proc : process(tmp_i_reg_113, tmp_reg_127)
    begin
                ap_predicate_op29_write_state2 <= ((tmp_reg_127 = ap_const_lv1_0) and (tmp_i_reg_113 = ap_const_lv1_1));
    end process;


    ap_predicate_op30_write_state2_assign_proc : process(tmp_i_reg_113, tmp_reg_127)
    begin
                ap_predicate_op30_write_state2 <= ((tmp_reg_127 = ap_const_lv1_0) and (tmp_i_reg_113 = ap_const_lv1_1));
    end process;


    ap_predicate_op32_write_state2_assign_proc : process(tmp_i_reg_113, tmp_reg_127)
    begin
                ap_predicate_op32_write_state2 <= ((tmp_reg_127 = ap_const_lv1_1) and (tmp_i_reg_113 = ap_const_lv1_1));
    end process;


    ap_predicate_op33_write_state2_assign_proc : process(tmp_i_reg_113, tmp_reg_127)
    begin
                ap_predicate_op33_write_state2 <= ((tmp_reg_127 = ap_const_lv1_1) and (tmp_i_reg_113 = ap_const_lv1_1));
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

    p_0_fu_105_p3 <= (trunc_ln414_reg_122 & tmp_i5_reg_117);

    pt_dstFifo_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, pt_dstFifo_full_n, ap_predicate_op30_write_state2, ap_predicate_op33_write_state2, ap_block_pp0_stage0)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op33_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op30_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            pt_dstFifo_blk_n <= pt_dstFifo_full_n;
        else 
            pt_dstFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    pt_dstFifo_din_assign_proc : process(ap_predicate_op30_write_state2, ap_predicate_op33_write_state2, ap_condition_139)
    begin
        if ((ap_const_boolean_1 = ap_condition_139)) then
            if ((ap_predicate_op33_write_state2 = ap_const_boolean_1)) then 
                pt_dstFifo_din <= ap_const_lv1_0;
            elsif ((ap_predicate_op30_write_state2 = ap_const_boolean_1)) then 
                pt_dstFifo_din <= ap_const_lv1_1;
            else 
                pt_dstFifo_din <= "X";
            end if;
        else 
            pt_dstFifo_din <= "X";
        end if; 
    end process;


    pt_dstFifo_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op30_write_state2, ap_predicate_op33_write_state2, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op33_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op30_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            pt_dstFifo_write <= ap_const_logic_1;
        else 
            pt_dstFifo_write <= ap_const_logic_0;
        end if; 
    end process;


    pt_portCheckListening_req_fifo_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, pt_portCheckListening_req_fifo_full_n, ap_predicate_op29_write_state2, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op29_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            pt_portCheckListening_req_fifo_blk_n <= pt_portCheckListening_req_fifo_full_n;
        else 
            pt_portCheckListening_req_fifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    pt_portCheckListening_req_fifo_din <= p_0_fu_105_p3;

    pt_portCheckListening_req_fifo_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op29_write_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op29_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            pt_portCheckListening_req_fifo_write <= ap_const_logic_1;
        else 
            pt_portCheckListening_req_fifo_write <= ap_const_logic_0;
        end if; 
    end process;


    pt_portCheckUsed_req_fifo_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, pt_portCheckUsed_req_fifo_full_n, ap_predicate_op32_write_state2, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op32_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            pt_portCheckUsed_req_fifo_blk_n <= pt_portCheckUsed_req_fifo_full_n;
        else 
            pt_portCheckUsed_req_fifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    pt_portCheckUsed_req_fifo_din <= p_0_fu_105_p3;

    pt_portCheckUsed_req_fifo_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op32_write_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op32_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            pt_portCheckUsed_req_fifo_write <= ap_const_logic_1;
        else 
            pt_portCheckUsed_req_fifo_write <= ap_const_logic_0;
        end if; 
    end process;


    rxEng2portTable_check_req_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, rxEng2portTable_check_req_empty_n, tmp_i_nbreadreq_fu_46_p3, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_done_reg = ap_const_logic_0) and (tmp_i_nbreadreq_fu_46_p3 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            rxEng2portTable_check_req_blk_n <= rxEng2portTable_check_req_empty_n;
        else 
            rxEng2portTable_check_req_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    rxEng2portTable_check_req_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, tmp_i_nbreadreq_fu_46_p3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_i_nbreadreq_fu_46_p3 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            rxEng2portTable_check_req_read <= ap_const_logic_1;
        else 
            rxEng2portTable_check_req_read <= ap_const_logic_0;
        end if; 
    end process;

    tmp_i_nbreadreq_fu_46_p3 <= (0=>(rxEng2portTable_check_req_empty_n), others=>'-');
    trunc_ln414_fu_93_p1 <= rxEng2portTable_check_req_dout(7 - 1 downto 0);
end behav;
