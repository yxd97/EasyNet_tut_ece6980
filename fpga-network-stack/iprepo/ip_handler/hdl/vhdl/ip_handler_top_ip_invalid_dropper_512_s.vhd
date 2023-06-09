-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ip_handler_top_ip_invalid_dropper_512_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ipDataCheckFifo_dout : IN STD_LOGIC_VECTOR (576 downto 0);
    ipDataCheckFifo_num_data_valid : IN STD_LOGIC_VECTOR (6 downto 0);
    ipDataCheckFifo_fifo_cap : IN STD_LOGIC_VECTOR (6 downto 0);
    ipDataCheckFifo_empty_n : IN STD_LOGIC;
    ipDataCheckFifo_read : OUT STD_LOGIC;
    validChecksumFifo_dout : IN STD_LOGIC_VECTOR (0 downto 0);
    validChecksumFifo_num_data_valid : IN STD_LOGIC_VECTOR (2 downto 0);
    validChecksumFifo_fifo_cap : IN STD_LOGIC_VECTOR (2 downto 0);
    validChecksumFifo_empty_n : IN STD_LOGIC;
    validChecksumFifo_read : OUT STD_LOGIC;
    validIpAddressFifo_dout : IN STD_LOGIC_VECTOR (0 downto 0);
    validIpAddressFifo_num_data_valid : IN STD_LOGIC_VECTOR (5 downto 0);
    validIpAddressFifo_fifo_cap : IN STD_LOGIC_VECTOR (5 downto 0);
    validIpAddressFifo_empty_n : IN STD_LOGIC;
    validIpAddressFifo_read : OUT STD_LOGIC;
    ipDataDropFifo_din : OUT STD_LOGIC_VECTOR (576 downto 0);
    ipDataDropFifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    ipDataDropFifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    ipDataDropFifo_full_n : IN STD_LOGIC;
    ipDataDropFifo_write : OUT STD_LOGIC;
    ipv4ValidFifo_din : OUT STD_LOGIC_VECTOR (0 downto 0);
    ipv4ValidFifo_num_data_valid : IN STD_LOGIC_VECTOR (3 downto 0);
    ipv4ValidFifo_fifo_cap : IN STD_LOGIC_VECTOR (3 downto 0);
    ipv4ValidFifo_full_n : IN STD_LOGIC;
    ipv4ValidFifo_write : OUT STD_LOGIC );
end;


architecture behav of ip_handler_top_ip_invalid_dropper_512_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv32_240 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000001001000000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal grp_nbreadreq_fu_52_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op28_read_state1 : BOOLEAN;
    signal ap_predicate_op37_read_state1 : BOOLEAN;
    signal tmp_i_nbreadreq_fu_66_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_i_33_nbreadreq_fu_74_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op48_read_state1 : BOOLEAN;
    signal ap_predicate_op49_read_state1 : BOOLEAN;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal iid_state_load_reg_157 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_8_i_reg_161 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op58_write_state2 : BOOLEAN;
    signal tmp_i_reg_179 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_i_33_reg_183 : STD_LOGIC_VECTOR (0 downto 0);
    signal and_ln195_reg_187 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op59_write_state2 : BOOLEAN;
    signal ap_predicate_op60_write_state2 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal iid_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal validChecksumFifo_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal validIpAddressFifo_blk_n : STD_LOGIC;
    signal ipv4ValidFifo_blk_n : STD_LOGIC;
    signal ipDataCheckFifo_blk_n : STD_LOGIC;
    signal ipDataDropFifo_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal ipDataCheckFifo_read_1_reg_165 : STD_LOGIC_VECTOR (576 downto 0);
    signal and_ln195_fu_145_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_mux_storemerge_i_phi_fu_113_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_phi_reg_pp0_iter0_storemerge_i_reg_110 : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_fu_121_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to0 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_condition_69 : BOOLEAN;
    signal ap_condition_220 : BOOLEAN;
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


    iid_state_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((iid_state = ap_const_lv2_2)) and not((iid_state = ap_const_lv2_1)) and (tmp_i_33_nbreadreq_fu_74_p3 = ap_const_lv1_1) and (tmp_i_nbreadreq_fu_66_p3 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
                iid_state <= ap_phi_mux_storemerge_i_phi_fu_113_p4;
            elsif ((((grp_nbreadreq_fu_52_p3 = ap_const_lv1_1) and (iid_state = ap_const_lv2_2) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (grp_fu_121_p3 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((grp_nbreadreq_fu_52_p3 = ap_const_lv1_1) and (iid_state = ap_const_lv2_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (grp_fu_121_p3 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
                iid_state <= ap_const_lv2_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((iid_state = ap_const_lv2_2)) and not((iid_state = ap_const_lv2_1)) and (tmp_i_33_nbreadreq_fu_74_p3 = ap_const_lv1_1) and (tmp_i_nbreadreq_fu_66_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                and_ln195_reg_187 <= and_ln195_fu_145_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                iid_state_load_reg_157 <= iid_state;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_predicate_op28_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ipDataCheckFifo_read_1_reg_165 <= ipDataCheckFifo_dout;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((iid_state = ap_const_lv2_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_8_i_reg_161 <= grp_nbreadreq_fu_52_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((iid_state = ap_const_lv2_2)) and not((iid_state = ap_const_lv2_1)) and (tmp_i_nbreadreq_fu_66_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_i_33_reg_183 <= tmp_i_33_nbreadreq_fu_74_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((iid_state = ap_const_lv2_2)) and not((iid_state = ap_const_lv2_1)) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_i_reg_179 <= tmp_i_nbreadreq_fu_66_p3;
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
    and_ln195_fu_145_p2 <= (validIpAddressFifo_dout and validChecksumFifo_dout);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ipDataCheckFifo_empty_n, ap_predicate_op28_read_state1, ap_predicate_op37_read_state1, validChecksumFifo_empty_n, ap_predicate_op48_read_state1, validIpAddressFifo_empty_n, ap_predicate_op49_read_state1, ap_done_reg, ipDataDropFifo_full_n, ap_predicate_op58_write_state2, ipv4ValidFifo_full_n, ap_predicate_op59_write_state2, ap_predicate_op60_write_state2)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op49_read_state1 = ap_const_boolean_1) and (validIpAddressFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op48_read_state1 = ap_const_boolean_1) and (validChecksumFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op37_read_state1 = ap_const_boolean_1) and (ipDataCheckFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op28_read_state1 = ap_const_boolean_1) and (ipDataCheckFifo_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ipDataDropFifo_full_n = ap_const_logic_0) and (ap_predicate_op58_write_state2 = ap_const_boolean_1)) or ((ap_predicate_op60_write_state2 = ap_const_boolean_1) and (ipv4ValidFifo_full_n = ap_const_logic_0)) or ((ap_predicate_op59_write_state2 = ap_const_boolean_1) and (ipv4ValidFifo_full_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ipDataCheckFifo_empty_n, ap_predicate_op28_read_state1, ap_predicate_op37_read_state1, validChecksumFifo_empty_n, ap_predicate_op48_read_state1, validIpAddressFifo_empty_n, ap_predicate_op49_read_state1, ap_done_reg, ipDataDropFifo_full_n, ap_predicate_op58_write_state2, ipv4ValidFifo_full_n, ap_predicate_op59_write_state2, ap_predicate_op60_write_state2)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op49_read_state1 = ap_const_boolean_1) and (validIpAddressFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op48_read_state1 = ap_const_boolean_1) and (validChecksumFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op37_read_state1 = ap_const_boolean_1) and (ipDataCheckFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op28_read_state1 = ap_const_boolean_1) and (ipDataCheckFifo_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ipDataDropFifo_full_n = ap_const_logic_0) and (ap_predicate_op58_write_state2 = ap_const_boolean_1)) or ((ap_predicate_op60_write_state2 = ap_const_boolean_1) and (ipv4ValidFifo_full_n = ap_const_logic_0)) or ((ap_predicate_op59_write_state2 = ap_const_boolean_1) and (ipv4ValidFifo_full_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ipDataCheckFifo_empty_n, ap_predicate_op28_read_state1, ap_predicate_op37_read_state1, validChecksumFifo_empty_n, ap_predicate_op48_read_state1, validIpAddressFifo_empty_n, ap_predicate_op49_read_state1, ap_done_reg, ipDataDropFifo_full_n, ap_predicate_op58_write_state2, ipv4ValidFifo_full_n, ap_predicate_op59_write_state2, ap_predicate_op60_write_state2)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op49_read_state1 = ap_const_boolean_1) and (validIpAddressFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op48_read_state1 = ap_const_boolean_1) and (validChecksumFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op37_read_state1 = ap_const_boolean_1) and (ipDataCheckFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op28_read_state1 = ap_const_boolean_1) and (ipDataCheckFifo_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ipDataDropFifo_full_n = ap_const_logic_0) and (ap_predicate_op58_write_state2 = ap_const_boolean_1)) or ((ap_predicate_op60_write_state2 = ap_const_boolean_1) and (ipv4ValidFifo_full_n = ap_const_logic_0)) or ((ap_predicate_op59_write_state2 = ap_const_boolean_1) and (ipv4ValidFifo_full_n = ap_const_logic_0)))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(ipDataCheckFifo_empty_n, ap_predicate_op28_read_state1, ap_predicate_op37_read_state1, validChecksumFifo_empty_n, ap_predicate_op48_read_state1, validIpAddressFifo_empty_n, ap_predicate_op49_read_state1, ap_done_reg)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op49_read_state1 = ap_const_boolean_1) and (validIpAddressFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op48_read_state1 = ap_const_boolean_1) and (validChecksumFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op37_read_state1 = ap_const_boolean_1) and (ipDataCheckFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op28_read_state1 = ap_const_boolean_1) and (ipDataCheckFifo_empty_n = ap_const_logic_0)));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(ipDataDropFifo_full_n, ap_predicate_op58_write_state2, ipv4ValidFifo_full_n, ap_predicate_op59_write_state2, ap_predicate_op60_write_state2)
    begin
                ap_block_state2_pp0_stage0_iter1 <= (((ipDataDropFifo_full_n = ap_const_logic_0) and (ap_predicate_op58_write_state2 = ap_const_boolean_1)) or ((ap_predicate_op60_write_state2 = ap_const_boolean_1) and (ipv4ValidFifo_full_n = ap_const_logic_0)) or ((ap_predicate_op59_write_state2 = ap_const_boolean_1) and (ipv4ValidFifo_full_n = ap_const_logic_0)));
    end process;


    ap_condition_220_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_01001)
    begin
                ap_condition_220 <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001));
    end process;


    ap_condition_69_assign_proc : process(tmp_i_nbreadreq_fu_66_p3, tmp_i_33_nbreadreq_fu_74_p3, iid_state)
    begin
                ap_condition_69 <= (not((iid_state = ap_const_lv2_2)) and not((iid_state = ap_const_lv2_1)) and (tmp_i_33_nbreadreq_fu_74_p3 = ap_const_lv1_1) and (tmp_i_nbreadreq_fu_66_p3 = ap_const_lv1_1));
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


    ap_phi_mux_storemerge_i_phi_fu_113_p4_assign_proc : process(and_ln195_fu_145_p2, ap_phi_reg_pp0_iter0_storemerge_i_reg_110, ap_condition_69)
    begin
        if ((ap_const_boolean_1 = ap_condition_69)) then
            if ((ap_const_lv1_0 = and_ln195_fu_145_p2)) then 
                ap_phi_mux_storemerge_i_phi_fu_113_p4 <= ap_const_lv2_2;
            elsif ((ap_const_lv1_1 = and_ln195_fu_145_p2)) then 
                ap_phi_mux_storemerge_i_phi_fu_113_p4 <= ap_const_lv2_1;
            else 
                ap_phi_mux_storemerge_i_phi_fu_113_p4 <= ap_phi_reg_pp0_iter0_storemerge_i_reg_110;
            end if;
        else 
            ap_phi_mux_storemerge_i_phi_fu_113_p4 <= ap_phi_reg_pp0_iter0_storemerge_i_reg_110;
        end if; 
    end process;

    ap_phi_reg_pp0_iter0_storemerge_i_reg_110 <= "XX";

    ap_predicate_op28_read_state1_assign_proc : process(grp_nbreadreq_fu_52_p3, iid_state)
    begin
                ap_predicate_op28_read_state1 <= ((grp_nbreadreq_fu_52_p3 = ap_const_lv1_1) and (iid_state = ap_const_lv2_1));
    end process;


    ap_predicate_op37_read_state1_assign_proc : process(grp_nbreadreq_fu_52_p3, iid_state)
    begin
                ap_predicate_op37_read_state1 <= ((grp_nbreadreq_fu_52_p3 = ap_const_lv1_1) and (iid_state = ap_const_lv2_2));
    end process;


    ap_predicate_op48_read_state1_assign_proc : process(tmp_i_nbreadreq_fu_66_p3, tmp_i_33_nbreadreq_fu_74_p3, iid_state)
    begin
                ap_predicate_op48_read_state1 <= (not((iid_state = ap_const_lv2_2)) and not((iid_state = ap_const_lv2_1)) and (tmp_i_33_nbreadreq_fu_74_p3 = ap_const_lv1_1) and (tmp_i_nbreadreq_fu_66_p3 = ap_const_lv1_1));
    end process;


    ap_predicate_op49_read_state1_assign_proc : process(tmp_i_nbreadreq_fu_66_p3, tmp_i_33_nbreadreq_fu_74_p3, iid_state)
    begin
                ap_predicate_op49_read_state1 <= (not((iid_state = ap_const_lv2_2)) and not((iid_state = ap_const_lv2_1)) and (tmp_i_33_nbreadreq_fu_74_p3 = ap_const_lv1_1) and (tmp_i_nbreadreq_fu_66_p3 = ap_const_lv1_1));
    end process;


    ap_predicate_op58_write_state2_assign_proc : process(iid_state_load_reg_157, tmp_8_i_reg_161)
    begin
                ap_predicate_op58_write_state2 <= ((iid_state_load_reg_157 = ap_const_lv2_1) and (tmp_8_i_reg_161 = ap_const_lv1_1));
    end process;


    ap_predicate_op59_write_state2_assign_proc : process(iid_state_load_reg_157, tmp_i_reg_179, tmp_i_33_reg_183, and_ln195_reg_187)
    begin
                ap_predicate_op59_write_state2 <= (not((iid_state_load_reg_157 = ap_const_lv2_1)) and not((iid_state_load_reg_157 = ap_const_lv2_2)) and (ap_const_lv1_0 = and_ln195_reg_187) and (tmp_i_33_reg_183 = ap_const_lv1_1) and (tmp_i_reg_179 = ap_const_lv1_1));
    end process;


    ap_predicate_op60_write_state2_assign_proc : process(iid_state_load_reg_157, tmp_i_reg_179, tmp_i_33_reg_183, and_ln195_reg_187)
    begin
                ap_predicate_op60_write_state2 <= (not((iid_state_load_reg_157 = ap_const_lv2_1)) and not((iid_state_load_reg_157 = ap_const_lv2_2)) and (ap_const_lv1_1 = and_ln195_reg_187) and (tmp_i_33_reg_183 = ap_const_lv1_1) and (tmp_i_reg_179 = ap_const_lv1_1));
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

    grp_fu_121_p3 <= ipDataCheckFifo_dout(576 downto 576);
    grp_nbreadreq_fu_52_p3 <= (0=>(ipDataCheckFifo_empty_n), others=>'-');

    ipDataCheckFifo_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ipDataCheckFifo_empty_n, ap_predicate_op28_read_state1, ap_predicate_op37_read_state1, ap_done_reg, ap_block_pp0_stage0)
    begin
        if ((((ap_done_reg = ap_const_logic_0) and (ap_predicate_op37_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((ap_done_reg = ap_const_logic_0) and (ap_predicate_op28_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)))) then 
            ipDataCheckFifo_blk_n <= ipDataCheckFifo_empty_n;
        else 
            ipDataCheckFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    ipDataCheckFifo_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op28_read_state1, ap_predicate_op37_read_state1, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_predicate_op37_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_predicate_op28_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
            ipDataCheckFifo_read <= ap_const_logic_1;
        else 
            ipDataCheckFifo_read <= ap_const_logic_0;
        end if; 
    end process;


    ipDataDropFifo_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ipDataDropFifo_full_n, ap_predicate_op58_write_state2, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op58_write_state2 = ap_const_boolean_1))) then 
            ipDataDropFifo_blk_n <= ipDataDropFifo_full_n;
        else 
            ipDataDropFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    ipDataDropFifo_din <= ipDataCheckFifo_read_1_reg_165;

    ipDataDropFifo_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op58_write_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op58_write_state2 = ap_const_boolean_1))) then 
            ipDataDropFifo_write <= ap_const_logic_1;
        else 
            ipDataDropFifo_write <= ap_const_logic_0;
        end if; 
    end process;


    ipv4ValidFifo_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ipv4ValidFifo_full_n, ap_predicate_op59_write_state2, ap_predicate_op60_write_state2, ap_block_pp0_stage0)
    begin
        if ((((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op60_write_state2 = ap_const_boolean_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op59_write_state2 = ap_const_boolean_1)))) then 
            ipv4ValidFifo_blk_n <= ipv4ValidFifo_full_n;
        else 
            ipv4ValidFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    ipv4ValidFifo_din_assign_proc : process(ap_predicate_op59_write_state2, ap_predicate_op60_write_state2, ap_condition_220)
    begin
        if ((ap_const_boolean_1 = ap_condition_220)) then
            if ((ap_predicate_op60_write_state2 = ap_const_boolean_1)) then 
                ipv4ValidFifo_din <= ap_const_lv1_1;
            elsif ((ap_predicate_op59_write_state2 = ap_const_boolean_1)) then 
                ipv4ValidFifo_din <= ap_const_lv1_0;
            else 
                ipv4ValidFifo_din <= "X";
            end if;
        else 
            ipv4ValidFifo_din <= "X";
        end if; 
    end process;


    ipv4ValidFifo_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op59_write_state2, ap_predicate_op60_write_state2, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op60_write_state2 = ap_const_boolean_1)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op59_write_state2 = ap_const_boolean_1)))) then 
            ipv4ValidFifo_write <= ap_const_logic_1;
        else 
            ipv4ValidFifo_write <= ap_const_logic_0;
        end if; 
    end process;

    tmp_i_33_nbreadreq_fu_74_p3 <= (0=>(validIpAddressFifo_empty_n), others=>'-');
    tmp_i_nbreadreq_fu_66_p3 <= (0=>(validChecksumFifo_empty_n), others=>'-');

    validChecksumFifo_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, validChecksumFifo_empty_n, ap_predicate_op48_read_state1, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_done_reg = ap_const_logic_0) and (ap_predicate_op48_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            validChecksumFifo_blk_n <= validChecksumFifo_empty_n;
        else 
            validChecksumFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    validChecksumFifo_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op48_read_state1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op48_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            validChecksumFifo_read <= ap_const_logic_1;
        else 
            validChecksumFifo_read <= ap_const_logic_0;
        end if; 
    end process;


    validIpAddressFifo_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, validIpAddressFifo_empty_n, ap_predicate_op49_read_state1, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_done_reg = ap_const_logic_0) and (ap_predicate_op49_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            validIpAddressFifo_blk_n <= validIpAddressFifo_empty_n;
        else 
            validIpAddressFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    validIpAddressFifo_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op49_read_state1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op49_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            validIpAddressFifo_read <= ap_const_logic_1;
        else 
            validIpAddressFifo_read <= ap_const_logic_0;
        end if; 
    end process;

end behav;
