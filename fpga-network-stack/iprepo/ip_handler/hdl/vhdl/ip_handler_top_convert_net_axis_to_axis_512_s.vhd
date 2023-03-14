-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ip_handler_top_convert_net_axis_to_axis_512_s is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    m_axis_arp_internal_dout : IN STD_LOGIC_VECTOR (1023 downto 0);
    m_axis_arp_internal_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axis_arp_internal_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axis_arp_internal_empty_n : IN STD_LOGIC;
    m_axis_arp_internal_read : OUT STD_LOGIC;
    m_axis_arp_TREADY : IN STD_LOGIC;
    m_axis_arp_TDATA : OUT STD_LOGIC_VECTOR (511 downto 0);
    m_axis_arp_TVALID : OUT STD_LOGIC;
    m_axis_arp_TKEEP : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axis_arp_TSTRB : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axis_arp_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of ip_handler_top_convert_net_axis_to_axis_512_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_200 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000001000000000";
    constant ap_const_lv32_23F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000001000111111";
    constant ap_const_lv1024_lc_1 : STD_LOGIC_VECTOR (1023 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001001000000";

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
    signal tmp_i_nbreadreq_fu_46_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal tmp_i_reg_99 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state2_io : BOOLEAN;
    signal tmp_i_reg_99_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal regslice_both_m_axis_arp_V_data_V_U_apdone_blk : STD_LOGIC;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state3_io : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal m_axis_arp_TDATA_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal m_axis_arp_internal_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal inputWord_data_V_fu_77_p1 : STD_LOGIC_VECTOR (511 downto 0);
    signal inputWord_data_V_reg_103 : STD_LOGIC_VECTOR (511 downto 0);
    signal inputWord_keep_V_reg_108 : STD_LOGIC_VECTOR (63 downto 0);
    signal inputWord_last_V_reg_113 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to1 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal m_axis_arp_TVALID_int_regslice : STD_LOGIC;
    signal m_axis_arp_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_m_axis_arp_V_data_V_U_vld_out : STD_LOGIC;
    signal regslice_both_m_axis_arp_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_m_axis_arp_V_keep_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_m_axis_arp_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_m_axis_arp_V_strb_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_m_axis_arp_V_strb_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_m_axis_arp_V_strb_V_U_vld_out : STD_LOGIC;
    signal regslice_both_m_axis_arp_V_last_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_m_axis_arp_V_last_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_m_axis_arp_V_last_V_U_vld_out : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component ip_handler_top_regslice_both IS
    generic (
        DataWidth : INTEGER );
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_in : IN STD_LOGIC;
        ack_in : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_out : OUT STD_LOGIC;
        ack_out : IN STD_LOGIC;
        apdone_blk : OUT STD_LOGIC );
    end component;



begin
    regslice_both_m_axis_arp_V_data_V_U : component ip_handler_top_regslice_both
    generic map (
        DataWidth => 512)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => inputWord_data_V_reg_103,
        vld_in => m_axis_arp_TVALID_int_regslice,
        ack_in => m_axis_arp_TREADY_int_regslice,
        data_out => m_axis_arp_TDATA,
        vld_out => regslice_both_m_axis_arp_V_data_V_U_vld_out,
        ack_out => m_axis_arp_TREADY,
        apdone_blk => regslice_both_m_axis_arp_V_data_V_U_apdone_blk);

    regslice_both_m_axis_arp_V_keep_V_U : component ip_handler_top_regslice_both
    generic map (
        DataWidth => 64)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => inputWord_keep_V_reg_108,
        vld_in => m_axis_arp_TVALID_int_regslice,
        ack_in => regslice_both_m_axis_arp_V_keep_V_U_ack_in_dummy,
        data_out => m_axis_arp_TKEEP,
        vld_out => regslice_both_m_axis_arp_V_keep_V_U_vld_out,
        ack_out => m_axis_arp_TREADY,
        apdone_blk => regslice_both_m_axis_arp_V_keep_V_U_apdone_blk);

    regslice_both_m_axis_arp_V_strb_V_U : component ip_handler_top_regslice_both
    generic map (
        DataWidth => 64)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => ap_const_lv64_0,
        vld_in => m_axis_arp_TVALID_int_regslice,
        ack_in => regslice_both_m_axis_arp_V_strb_V_U_ack_in_dummy,
        data_out => m_axis_arp_TSTRB,
        vld_out => regslice_both_m_axis_arp_V_strb_V_U_vld_out,
        ack_out => m_axis_arp_TREADY,
        apdone_blk => regslice_both_m_axis_arp_V_strb_V_U_apdone_blk);

    regslice_both_m_axis_arp_V_last_V_U : component ip_handler_top_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => inputWord_last_V_reg_113,
        vld_in => m_axis_arp_TVALID_int_regslice,
        ack_in => regslice_both_m_axis_arp_V_last_V_U_ack_in_dummy,
        data_out => m_axis_arp_TLAST,
        vld_out => regslice_both_m_axis_arp_V_last_V_U_vld_out,
        ack_out => m_axis_arp_TREADY,
        apdone_blk => regslice_both_m_axis_arp_V_last_V_U_apdone_blk);





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

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_i_nbreadreq_fu_46_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                inputWord_data_V_reg_103 <= inputWord_data_V_fu_77_p1;
                inputWord_keep_V_reg_108 <= m_axis_arp_internal_dout(575 downto 512);
                inputWord_last_V_reg_113 <= m_axis_arp_internal_dout(576 downto 576);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                tmp_i_reg_99 <= tmp_i_nbreadreq_fu_46_p3;
                tmp_i_reg_99_pp0_iter1_reg <= tmp_i_reg_99;
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

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, m_axis_arp_internal_empty_n, tmp_i_nbreadreq_fu_46_p3, ap_done_reg, tmp_i_reg_99, tmp_i_reg_99_pp0_iter1_reg, regslice_both_m_axis_arp_V_data_V_U_apdone_blk, m_axis_arp_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((regslice_both_m_axis_arp_V_data_V_U_apdone_blk = ap_const_logic_1) or ((tmp_i_reg_99_pp0_iter1_reg = ap_const_lv1_1) and (m_axis_arp_TREADY_int_regslice = ap_const_logic_0)))) or ((tmp_i_reg_99 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (m_axis_arp_TREADY_int_regslice = ap_const_logic_0)) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_46_p3 = ap_const_lv1_1) and (m_axis_arp_internal_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, m_axis_arp_internal_empty_n, tmp_i_nbreadreq_fu_46_p3, ap_done_reg, tmp_i_reg_99, ap_block_state2_io, tmp_i_reg_99_pp0_iter1_reg, regslice_both_m_axis_arp_V_data_V_U_apdone_blk, ap_block_state3_io, m_axis_arp_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((regslice_both_m_axis_arp_V_data_V_U_apdone_blk = ap_const_logic_1) or (ap_const_boolean_1 = ap_block_state3_io) or ((tmp_i_reg_99_pp0_iter1_reg = ap_const_lv1_1) and (m_axis_arp_TREADY_int_regslice = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((ap_const_boolean_1 = ap_block_state2_io) or ((tmp_i_reg_99 = ap_const_lv1_1) and (m_axis_arp_TREADY_int_regslice = ap_const_logic_0)))) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_46_p3 = ap_const_lv1_1) and (m_axis_arp_internal_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, m_axis_arp_internal_empty_n, tmp_i_nbreadreq_fu_46_p3, ap_done_reg, tmp_i_reg_99, ap_block_state2_io, tmp_i_reg_99_pp0_iter1_reg, regslice_both_m_axis_arp_V_data_V_U_apdone_blk, ap_block_state3_io, m_axis_arp_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((regslice_both_m_axis_arp_V_data_V_U_apdone_blk = ap_const_logic_1) or (ap_const_boolean_1 = ap_block_state3_io) or ((tmp_i_reg_99_pp0_iter1_reg = ap_const_lv1_1) and (m_axis_arp_TREADY_int_regslice = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((ap_const_boolean_1 = ap_block_state2_io) or ((tmp_i_reg_99 = ap_const_lv1_1) and (m_axis_arp_TREADY_int_regslice = ap_const_logic_0)))) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_46_p3 = ap_const_lv1_1) and (m_axis_arp_internal_empty_n = ap_const_logic_0)))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(m_axis_arp_internal_empty_n, tmp_i_nbreadreq_fu_46_p3, ap_done_reg)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_46_p3 = ap_const_lv1_1) and (m_axis_arp_internal_empty_n = ap_const_logic_0)));
    end process;


    ap_block_state2_io_assign_proc : process(tmp_i_reg_99, m_axis_arp_TREADY_int_regslice)
    begin
                ap_block_state2_io <= ((tmp_i_reg_99 = ap_const_lv1_1) and (m_axis_arp_TREADY_int_regslice = ap_const_logic_0));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(tmp_i_reg_99, m_axis_arp_TREADY_int_regslice)
    begin
                ap_block_state2_pp0_stage0_iter1 <= ((tmp_i_reg_99 = ap_const_lv1_1) and (m_axis_arp_TREADY_int_regslice = ap_const_logic_0));
    end process;


    ap_block_state3_io_assign_proc : process(tmp_i_reg_99_pp0_iter1_reg, m_axis_arp_TREADY_int_regslice)
    begin
                ap_block_state3_io <= ((tmp_i_reg_99_pp0_iter1_reg = ap_const_lv1_1) and (m_axis_arp_TREADY_int_regslice = ap_const_logic_0));
    end process;


    ap_block_state3_pp0_stage0_iter2_assign_proc : process(tmp_i_reg_99_pp0_iter1_reg, regslice_both_m_axis_arp_V_data_V_U_apdone_blk, m_axis_arp_TREADY_int_regslice)
    begin
                ap_block_state3_pp0_stage0_iter2 <= ((regslice_both_m_axis_arp_V_data_V_U_apdone_blk = ap_const_logic_1) or ((tmp_i_reg_99_pp0_iter1_reg = ap_const_lv1_1) and (m_axis_arp_TREADY_int_regslice = ap_const_logic_0)));
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

    inputWord_data_V_fu_77_p1 <= m_axis_arp_internal_dout(512 - 1 downto 0);

    m_axis_arp_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, tmp_i_reg_99, tmp_i_reg_99_pp0_iter1_reg, ap_block_pp0_stage0, m_axis_arp_TREADY_int_regslice)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0) and (tmp_i_reg_99_pp0_iter1_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_const_boolean_0 = ap_block_pp0_stage0) and (tmp_i_reg_99 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            m_axis_arp_TDATA_blk_n <= m_axis_arp_TREADY_int_regslice;
        else 
            m_axis_arp_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    m_axis_arp_TVALID <= regslice_both_m_axis_arp_V_data_V_U_vld_out;

    m_axis_arp_TVALID_int_regslice_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, tmp_i_reg_99, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_i_reg_99 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            m_axis_arp_TVALID_int_regslice <= ap_const_logic_1;
        else 
            m_axis_arp_TVALID_int_regslice <= ap_const_logic_0;
        end if; 
    end process;


    m_axis_arp_internal_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, m_axis_arp_internal_empty_n, tmp_i_nbreadreq_fu_46_p3, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_done_reg = ap_const_logic_0) and (tmp_i_nbreadreq_fu_46_p3 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            m_axis_arp_internal_blk_n <= m_axis_arp_internal_empty_n;
        else 
            m_axis_arp_internal_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    m_axis_arp_internal_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, tmp_i_nbreadreq_fu_46_p3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (tmp_i_nbreadreq_fu_46_p3 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            m_axis_arp_internal_read <= ap_const_logic_1;
        else 
            m_axis_arp_internal_read <= ap_const_logic_0;
        end if; 
    end process;

    tmp_i_nbreadreq_fu_46_p3 <= (0=>(m_axis_arp_internal_empty_n), others=>'-');
end behav;
