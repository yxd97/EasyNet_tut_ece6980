-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ip_handler_top_detect_ipv4_protocol_512_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ipv4ProtocolFifo_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    ipv4ProtocolFifo_num_data_valid : IN STD_LOGIC_VECTOR (5 downto 0);
    ipv4ProtocolFifo_fifo_cap : IN STD_LOGIC_VECTOR (5 downto 0);
    ipv4ProtocolFifo_empty_n : IN STD_LOGIC;
    ipv4ProtocolFifo_read : OUT STD_LOGIC;
    ipv4ValidFifo_dout : IN STD_LOGIC_VECTOR (0 downto 0);
    ipv4ValidFifo_num_data_valid : IN STD_LOGIC_VECTOR (3 downto 0);
    ipv4ValidFifo_fifo_cap : IN STD_LOGIC_VECTOR (3 downto 0);
    ipv4ValidFifo_empty_n : IN STD_LOGIC;
    ipv4ValidFifo_read : OUT STD_LOGIC;
    ipDataCutFifo_dout : IN STD_LOGIC_VECTOR (576 downto 0);
    ipDataCutFifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    ipDataCutFifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    ipDataCutFifo_empty_n : IN STD_LOGIC;
    ipDataCutFifo_read : OUT STD_LOGIC;
    m_axis_tcp_internal_din : OUT STD_LOGIC_VECTOR (1023 downto 0);
    m_axis_tcp_internal_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axis_tcp_internal_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axis_tcp_internal_full_n : IN STD_LOGIC;
    m_axis_tcp_internal_write : OUT STD_LOGIC;
    udpDataFifo_din : OUT STD_LOGIC_VECTOR (576 downto 0);
    udpDataFifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    udpDataFifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    udpDataFifo_full_n : IN STD_LOGIC;
    udpDataFifo_write : OUT STD_LOGIC;
    m_axis_icmp_internal_din : OUT STD_LOGIC_VECTOR (1023 downto 0);
    m_axis_icmp_internal_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axis_icmp_internal_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axis_icmp_internal_full_n : IN STD_LOGIC;
    m_axis_icmp_internal_write : OUT STD_LOGIC );
end;


architecture behav of ip_handler_top_detect_ipv4_protocol_512_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv8_6 : STD_LOGIC_VECTOR (7 downto 0) := "00000110";
    constant ap_const_lv8_11 : STD_LOGIC_VECTOR (7 downto 0) := "00010001";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
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
    signal tmp_i_nbreadreq_fu_60_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_100_i_nbreadreq_fu_68_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op34_read_state1 : BOOLEAN;
    signal ap_predicate_op36_read_state1 : BOOLEAN;
    signal tmp_i_59_nbreadreq_fu_88_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op44_read_state1 : BOOLEAN;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal dip_state_load_reg_162 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_i_59_reg_175 : STD_LOGIC_VECTOR (0 downto 0);
    signal dip_ipProtocol_V_load_reg_188 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_predicate_op54_write_state2 : BOOLEAN;
    signal ap_predicate_op56_write_state2 : BOOLEAN;
    signal ap_predicate_op58_write_state2 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal dip_state : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal dip_ipProtocol_V : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal ipv4ProtocolFifo_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ipv4ValidFifo_blk_n : STD_LOGIC;
    signal ipDataCutFifo_blk_n : STD_LOGIC;
    signal m_axis_icmp_internal_blk_n : STD_LOGIC;
    signal udpDataFifo_blk_n : STD_LOGIC;
    signal m_axis_tcp_internal_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal ipDataCutFifo_read_reg_179 : STD_LOGIC_VECTOR (576 downto 0);
    signal tmp_74_read_fu_82_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_last_V_fu_139_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_07_fu_157_p1 : STD_LOGIC_VECTOR (1023 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to0 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_condition_179 : BOOLEAN;
    signal ap_condition_183 : BOOLEAN;
    signal ap_condition_176 : BOOLEAN;
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


    dip_state_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_176)) then
                if ((ap_const_boolean_1 = ap_condition_183)) then 
                    dip_state <= ap_const_lv1_0;
                elsif ((ap_const_boolean_1 = ap_condition_179)) then 
                    dip_state <= ap_const_lv1_1;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_100_i_nbreadreq_fu_68_p3 = ap_const_lv1_1) and (tmp_i_nbreadreq_fu_60_p3 = ap_const_lv1_1) and (dip_state = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                dip_ipProtocol_V <= ipv4ProtocolFifo_dout;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_59_nbreadreq_fu_88_p3 = ap_const_lv1_1) and (dip_state = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                dip_ipProtocol_V_load_reg_188 <= dip_ipProtocol_V;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                dip_state_load_reg_162 <= dip_state;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ipDataCutFifo_read_reg_179 <= ipDataCutFifo_dout;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((dip_state = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_i_59_reg_175 <= tmp_i_59_nbreadreq_fu_88_p3;
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

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ipv4ProtocolFifo_empty_n, ap_predicate_op34_read_state1, ipv4ValidFifo_empty_n, ap_predicate_op36_read_state1, ipDataCutFifo_empty_n, ap_predicate_op44_read_state1, ap_done_reg, m_axis_tcp_internal_full_n, ap_predicate_op54_write_state2, udpDataFifo_full_n, ap_predicate_op56_write_state2, m_axis_icmp_internal_full_n, ap_predicate_op58_write_state2)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (ipDataCutFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op36_read_state1 = ap_const_boolean_1) and (ipv4ValidFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op34_read_state1 = ap_const_boolean_1) and (ipv4ProtocolFifo_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op54_write_state2 = ap_const_boolean_1) and (m_axis_tcp_internal_full_n = ap_const_logic_0)) or ((ap_predicate_op58_write_state2 = ap_const_boolean_1) and (m_axis_icmp_internal_full_n = ap_const_logic_0)) or ((ap_predicate_op56_write_state2 = ap_const_boolean_1) and (udpDataFifo_full_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ipv4ProtocolFifo_empty_n, ap_predicate_op34_read_state1, ipv4ValidFifo_empty_n, ap_predicate_op36_read_state1, ipDataCutFifo_empty_n, ap_predicate_op44_read_state1, ap_done_reg, m_axis_tcp_internal_full_n, ap_predicate_op54_write_state2, udpDataFifo_full_n, ap_predicate_op56_write_state2, m_axis_icmp_internal_full_n, ap_predicate_op58_write_state2)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (ipDataCutFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op36_read_state1 = ap_const_boolean_1) and (ipv4ValidFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op34_read_state1 = ap_const_boolean_1) and (ipv4ProtocolFifo_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op54_write_state2 = ap_const_boolean_1) and (m_axis_tcp_internal_full_n = ap_const_logic_0)) or ((ap_predicate_op58_write_state2 = ap_const_boolean_1) and (m_axis_icmp_internal_full_n = ap_const_logic_0)) or ((ap_predicate_op56_write_state2 = ap_const_boolean_1) and (udpDataFifo_full_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ipv4ProtocolFifo_empty_n, ap_predicate_op34_read_state1, ipv4ValidFifo_empty_n, ap_predicate_op36_read_state1, ipDataCutFifo_empty_n, ap_predicate_op44_read_state1, ap_done_reg, m_axis_tcp_internal_full_n, ap_predicate_op54_write_state2, udpDataFifo_full_n, ap_predicate_op56_write_state2, m_axis_icmp_internal_full_n, ap_predicate_op58_write_state2)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (ipDataCutFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op36_read_state1 = ap_const_boolean_1) and (ipv4ValidFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op34_read_state1 = ap_const_boolean_1) and (ipv4ProtocolFifo_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op54_write_state2 = ap_const_boolean_1) and (m_axis_tcp_internal_full_n = ap_const_logic_0)) or ((ap_predicate_op58_write_state2 = ap_const_boolean_1) and (m_axis_icmp_internal_full_n = ap_const_logic_0)) or ((ap_predicate_op56_write_state2 = ap_const_boolean_1) and (udpDataFifo_full_n = ap_const_logic_0)))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(ipv4ProtocolFifo_empty_n, ap_predicate_op34_read_state1, ipv4ValidFifo_empty_n, ap_predicate_op36_read_state1, ipDataCutFifo_empty_n, ap_predicate_op44_read_state1, ap_done_reg)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (ipDataCutFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op36_read_state1 = ap_const_boolean_1) and (ipv4ValidFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op34_read_state1 = ap_const_boolean_1) and (ipv4ProtocolFifo_empty_n = ap_const_logic_0)));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(m_axis_tcp_internal_full_n, ap_predicate_op54_write_state2, udpDataFifo_full_n, ap_predicate_op56_write_state2, m_axis_icmp_internal_full_n, ap_predicate_op58_write_state2)
    begin
                ap_block_state2_pp0_stage0_iter1 <= (((ap_predicate_op54_write_state2 = ap_const_boolean_1) and (m_axis_tcp_internal_full_n = ap_const_logic_0)) or ((ap_predicate_op58_write_state2 = ap_const_boolean_1) and (m_axis_icmp_internal_full_n = ap_const_logic_0)) or ((ap_predicate_op56_write_state2 = ap_const_boolean_1) and (udpDataFifo_full_n = ap_const_logic_0)));
    end process;


    ap_condition_176_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
                ap_condition_176 <= ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001));
    end process;


    ap_condition_179_assign_proc : process(tmp_i_nbreadreq_fu_60_p3, tmp_100_i_nbreadreq_fu_68_p3, dip_state, tmp_74_read_fu_82_p2)
    begin
                ap_condition_179 <= ((tmp_100_i_nbreadreq_fu_68_p3 = ap_const_lv1_1) and (tmp_i_nbreadreq_fu_60_p3 = ap_const_lv1_1) and (dip_state = ap_const_lv1_0) and (tmp_74_read_fu_82_p2 = ap_const_lv1_1));
    end process;


    ap_condition_183_assign_proc : process(tmp_i_59_nbreadreq_fu_88_p3, dip_state, tmp_last_V_fu_139_p3)
    begin
                ap_condition_183 <= ((tmp_i_59_nbreadreq_fu_88_p3 = ap_const_lv1_1) and (dip_state = ap_const_lv1_1) and (tmp_last_V_fu_139_p3 = ap_const_lv1_1));
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


    ap_predicate_op34_read_state1_assign_proc : process(tmp_i_nbreadreq_fu_60_p3, tmp_100_i_nbreadreq_fu_68_p3, dip_state)
    begin
                ap_predicate_op34_read_state1 <= ((tmp_100_i_nbreadreq_fu_68_p3 = ap_const_lv1_1) and (tmp_i_nbreadreq_fu_60_p3 = ap_const_lv1_1) and (dip_state = ap_const_lv1_0));
    end process;


    ap_predicate_op36_read_state1_assign_proc : process(tmp_i_nbreadreq_fu_60_p3, tmp_100_i_nbreadreq_fu_68_p3, dip_state)
    begin
                ap_predicate_op36_read_state1 <= ((tmp_100_i_nbreadreq_fu_68_p3 = ap_const_lv1_1) and (tmp_i_nbreadreq_fu_60_p3 = ap_const_lv1_1) and (dip_state = ap_const_lv1_0));
    end process;


    ap_predicate_op44_read_state1_assign_proc : process(tmp_i_59_nbreadreq_fu_88_p3, dip_state)
    begin
                ap_predicate_op44_read_state1 <= ((tmp_i_59_nbreadreq_fu_88_p3 = ap_const_lv1_1) and (dip_state = ap_const_lv1_1));
    end process;


    ap_predicate_op54_write_state2_assign_proc : process(dip_state_load_reg_162, tmp_i_59_reg_175, dip_ipProtocol_V_load_reg_188)
    begin
                ap_predicate_op54_write_state2 <= ((dip_ipProtocol_V_load_reg_188 = ap_const_lv8_6) and (tmp_i_59_reg_175 = ap_const_lv1_1) and (dip_state_load_reg_162 = ap_const_lv1_1));
    end process;


    ap_predicate_op56_write_state2_assign_proc : process(dip_state_load_reg_162, tmp_i_59_reg_175, dip_ipProtocol_V_load_reg_188)
    begin
                ap_predicate_op56_write_state2 <= ((dip_ipProtocol_V_load_reg_188 = ap_const_lv8_11) and (tmp_i_59_reg_175 = ap_const_lv1_1) and (dip_state_load_reg_162 = ap_const_lv1_1));
    end process;


    ap_predicate_op58_write_state2_assign_proc : process(dip_state_load_reg_162, tmp_i_59_reg_175, dip_ipProtocol_V_load_reg_188)
    begin
                ap_predicate_op58_write_state2 <= ((dip_ipProtocol_V_load_reg_188 = ap_const_lv8_1) and (tmp_i_59_reg_175 = ap_const_lv1_1) and (dip_state_load_reg_162 = ap_const_lv1_1));
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


    ipDataCutFifo_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ipDataCutFifo_empty_n, ap_predicate_op44_read_state1, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_done_reg = ap_const_logic_0) and (ap_predicate_op44_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ipDataCutFifo_blk_n <= ipDataCutFifo_empty_n;
        else 
            ipDataCutFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    ipDataCutFifo_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op44_read_state1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            ipDataCutFifo_read <= ap_const_logic_1;
        else 
            ipDataCutFifo_read <= ap_const_logic_0;
        end if; 
    end process;


    ipv4ProtocolFifo_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ipv4ProtocolFifo_empty_n, ap_predicate_op34_read_state1, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_done_reg = ap_const_logic_0) and (ap_predicate_op34_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ipv4ProtocolFifo_blk_n <= ipv4ProtocolFifo_empty_n;
        else 
            ipv4ProtocolFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    ipv4ProtocolFifo_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op34_read_state1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op34_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            ipv4ProtocolFifo_read <= ap_const_logic_1;
        else 
            ipv4ProtocolFifo_read <= ap_const_logic_0;
        end if; 
    end process;


    ipv4ValidFifo_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ipv4ValidFifo_empty_n, ap_predicate_op36_read_state1, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_done_reg = ap_const_logic_0) and (ap_predicate_op36_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ipv4ValidFifo_blk_n <= ipv4ValidFifo_empty_n;
        else 
            ipv4ValidFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    ipv4ValidFifo_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op36_read_state1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op36_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            ipv4ValidFifo_read <= ap_const_logic_1;
        else 
            ipv4ValidFifo_read <= ap_const_logic_0;
        end if; 
    end process;


    m_axis_icmp_internal_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, m_axis_icmp_internal_full_n, ap_predicate_op58_write_state2, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op58_write_state2 = ap_const_boolean_1))) then 
            m_axis_icmp_internal_blk_n <= m_axis_icmp_internal_full_n;
        else 
            m_axis_icmp_internal_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    m_axis_icmp_internal_din <= p_07_fu_157_p1;

    m_axis_icmp_internal_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op58_write_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op58_write_state2 = ap_const_boolean_1))) then 
            m_axis_icmp_internal_write <= ap_const_logic_1;
        else 
            m_axis_icmp_internal_write <= ap_const_logic_0;
        end if; 
    end process;


    m_axis_tcp_internal_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, m_axis_tcp_internal_full_n, ap_predicate_op54_write_state2, ap_block_pp0_stage0)
    begin
        if (((ap_predicate_op54_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            m_axis_tcp_internal_blk_n <= m_axis_tcp_internal_full_n;
        else 
            m_axis_tcp_internal_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    m_axis_tcp_internal_din <= p_07_fu_157_p1;

    m_axis_tcp_internal_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op54_write_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op54_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            m_axis_tcp_internal_write <= ap_const_logic_1;
        else 
            m_axis_tcp_internal_write <= ap_const_logic_0;
        end if; 
    end process;

    p_07_fu_157_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ipDataCutFifo_read_reg_179),1024));
    tmp_100_i_nbreadreq_fu_68_p3 <= (0=>(ipv4ValidFifo_empty_n), others=>'-');
    tmp_74_read_fu_82_p2 <= ipv4ValidFifo_dout;
    tmp_i_59_nbreadreq_fu_88_p3 <= (0=>(ipDataCutFifo_empty_n), others=>'-');
    tmp_i_nbreadreq_fu_60_p3 <= (0=>(ipv4ProtocolFifo_empty_n), others=>'-');
    tmp_last_V_fu_139_p3 <= ipDataCutFifo_dout(576 downto 576);

    udpDataFifo_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, udpDataFifo_full_n, ap_predicate_op56_write_state2, ap_block_pp0_stage0)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op56_write_state2 = ap_const_boolean_1))) then 
            udpDataFifo_blk_n <= udpDataFifo_full_n;
        else 
            udpDataFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    udpDataFifo_din <= ipDataCutFifo_read_reg_179;

    udpDataFifo_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op56_write_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op56_write_state2 = ap_const_boolean_1))) then 
            udpDataFifo_write <= ap_const_logic_1;
        else 
            udpDataFifo_write <= ap_const_logic_0;
        end if; 
    end process;

end behav;
