-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ipv4_top_process_ipv4_512_s is
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
    rx_process2dropFifo_din : OUT STD_LOGIC_VECTOR (1023 downto 0);
    rx_process2dropFifo_num_data_valid : IN STD_LOGIC_VECTOR (3 downto 0);
    rx_process2dropFifo_fifo_cap : IN STD_LOGIC_VECTOR (3 downto 0);
    rx_process2dropFifo_full_n : IN STD_LOGIC;
    rx_process2dropFifo_write : OUT STD_LOGIC;
    m_axis_rx_meta_TREADY : IN STD_LOGIC;
    rx_process2dropLengthFifo_din : OUT STD_LOGIC_VECTOR (3 downto 0);
    rx_process2dropLengthFifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    rx_process2dropLengthFifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    rx_process2dropLengthFifo_full_n : IN STD_LOGIC;
    rx_process2dropLengthFifo_write : OUT STD_LOGIC;
    m_axis_rx_meta_TDATA : OUT STD_LOGIC_VECTOR (47 downto 0);
    m_axis_rx_meta_TVALID : OUT STD_LOGIC );
end;


architecture behav of ipv4_top_process_ipv4_512_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv1024_lc_1 : STD_LOGIC_VECTOR (1023 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001001000000";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
    constant ap_const_lv25_9F : STD_LOGIC_VECTOR (24 downto 0) := "0000000000000000010011111";
    constant ap_const_lv159_lc_3 : STD_LOGIC_VECTOR (158 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_9F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000010011111";
    constant ap_const_lv160_lc_4 : STD_LOGIC_VECTOR (159 downto 0) := "0111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";
    constant ap_const_lv160_lc_3 : STD_LOGIC_VECTOR (159 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv160_lc_5 : STD_LOGIC_VECTOR (159 downto 0) := "1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111110";
    constant ap_const_lv160_lc_6 : STD_LOGIC_VECTOR (159 downto 0) := "1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111";
    constant ap_const_lv32_60 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001100000";
    constant ap_const_lv32_7F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001111111";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";

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
    signal tmp_i_nbreadreq_fu_98_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal tmp_i_reg_399 : STD_LOGIC_VECTOR (0 downto 0);
    signal metaWritten_load_reg_416 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op63_write_state2 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state2_io : BOOLEAN;
    signal tmp_i_reg_399_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal metaWritten_load_reg_416_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op70_write_state3 : BOOLEAN;
    signal ap_predicate_op71_write_state3 : BOOLEAN;
    signal regslice_both_m_axis_rx_meta_U_apdone_blk : STD_LOGIC;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state3_io : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal header_ready : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal header_idx : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal header_header_V : STD_LOGIC_VECTOR (159 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000001000101";
    signal metaWritten : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal m_axis_rx_meta_TDATA_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal s_axis_rx_data_internal_blk_n : STD_LOGIC;
    signal rx_process2dropFifo_blk_n : STD_LOGIC;
    signal rx_process2dropLengthFifo_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal s_axis_rx_data_internal_read_reg_403 : STD_LOGIC_VECTOR (1023 downto 0);
    signal currWord_last_V_fu_174_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal currWord_last_V_reg_410 : STD_LOGIC_VECTOR (0 downto 0);
    signal metaWritten_load_load_fu_182_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln63_fu_186_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln63_reg_420 : STD_LOGIC_VECTOR (0 downto 0);
    signal trunc_ln674_fu_331_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal trunc_ln674_reg_431 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_phi_mux_metaWritten_flag_0_i_phi_fu_136_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter0_metaWritten_flag_0_i_reg_133 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_mux_header_ready_flag_0_i_phi_fu_147_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_reg_pp0_iter1_header_ready_flag_0_i_reg_144 : STD_LOGIC_VECTOR (0 downto 0);
    signal header_ready_load_load_fu_204_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_mux_header_idx_new_0_i_phi_fu_158_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal add_ln67_fu_228_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_phi_reg_pp0_iter1_header_idx_new_0_i_reg_155 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_phi_mux_p_Val2_1_in_i_in_in_phi_fu_168_p4 : STD_LOGIC_VECTOR (159 downto 0);
    signal ap_phi_reg_pp0_iter1_p_Val2_1_in_i_in_in_reg_165 : STD_LOGIC_VECTOR (159 downto 0);
    signal p_Result_s_fu_318_p2 : STD_LOGIC_VECTOR (159 downto 0);
    signal or_ln63_fu_376_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln63_fu_381_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal or_ln63_1_fu_192_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal shl_ln_fu_217_p3 : STD_LOGIC_VECTOR (24 downto 0);
    signal trunc_ln414_fu_241_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln414_fu_235_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal st_fu_244_p3 : STD_LOGIC_VECTOR (159 downto 0);
    signal tmp_1_fu_225_p1 : STD_LOGIC_VECTOR (159 downto 0);
    signal select_ln414_fu_252_p3 : STD_LOGIC_VECTOR (159 downto 0);
    signal tmp_fu_260_p4 : STD_LOGIC_VECTOR (159 downto 0);
    signal select_ln414_2_fu_278_p3 : STD_LOGIC_VECTOR (159 downto 0);
    signal select_ln414_3_fu_286_p3 : STD_LOGIC_VECTOR (159 downto 0);
    signal or_ln414_fu_294_p2 : STD_LOGIC_VECTOR (159 downto 0);
    signal select_ln414_1_fu_270_p3 : STD_LOGIC_VECTOR (159 downto 0);
    signal xor_ln414_fu_300_p2 : STD_LOGIC_VECTOR (159 downto 0);
    signal and_ln414_fu_306_p2 : STD_LOGIC_VECTOR (159 downto 0);
    signal and_ln414_1_fu_312_p2 : STD_LOGIC_VECTOR (159 downto 0);
    signal tmp_i_38_fu_355_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_9_i_fu_345_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_7_i_fu_335_p4 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to1 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal m_axis_rx_meta_TDATA_int_regslice : STD_LOGIC_VECTOR (47 downto 0);
    signal m_axis_rx_meta_TVALID_int_regslice : STD_LOGIC;
    signal m_axis_rx_meta_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_m_axis_rx_meta_U_vld_out : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component ipv4_top_regslice_both IS
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
    regslice_both_m_axis_rx_meta_U : component ipv4_top_regslice_both
    generic map (
        DataWidth => 48)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => m_axis_rx_meta_TDATA_int_regslice,
        vld_in => m_axis_rx_meta_TVALID_int_regslice,
        ack_in => m_axis_rx_meta_TREADY_int_regslice,
        data_out => m_axis_rx_meta_TDATA,
        vld_out => regslice_both_m_axis_rx_meta_U_vld_out,
        ack_out => m_axis_rx_meta_TREADY,
        apdone_blk => regslice_both_m_axis_rx_meta_U_apdone_blk);





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
                elsif (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
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

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_nbreadreq_fu_98_p3 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                currWord_last_V_reg_410 <= s_axis_rx_data_internal_dout(576 downto 576);
                metaWritten_load_reg_416 <= metaWritten;
                s_axis_rx_data_internal_read_reg_403 <= s_axis_rx_data_internal_dout;
                xor_ln63_reg_420 <= xor_ln63_fu_186_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_reg_399 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (header_ready_load_load_fu_204_p1 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                header_header_V <= p_Result_s_fu_318_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_reg_399 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (or_ln63_fu_376_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                header_idx <= select_ln63_fu_381_p3;
                header_ready <= xor_ln63_reg_420;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tmp_i_nbreadreq_fu_98_p3 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (or_ln63_1_fu_192_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                metaWritten <= xor_ln63_fu_186_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                metaWritten_load_reg_416_pp0_iter1_reg <= metaWritten_load_reg_416;
                tmp_i_reg_399 <= tmp_i_nbreadreq_fu_98_p3;
                tmp_i_reg_399_pp0_iter1_reg <= tmp_i_reg_399;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((metaWritten_load_reg_416 = ap_const_lv1_0) and (tmp_i_reg_399 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                trunc_ln674_reg_431 <= trunc_ln674_fu_331_p1;
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
    add_ln67_fu_228_p2 <= std_logic_vector(unsigned(header_idx) + unsigned(ap_const_lv16_1));
    and_ln414_1_fu_312_p2 <= (xor_ln414_fu_300_p2 and select_ln414_1_fu_270_p3);
    and_ln414_fu_306_p2 <= (or_ln414_fu_294_p2 and header_header_V);
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, s_axis_rx_data_internal_empty_n, tmp_i_nbreadreq_fu_98_p3, ap_done_reg, rx_process2dropFifo_full_n, tmp_i_reg_399, ap_predicate_op63_write_state2, rx_process2dropLengthFifo_full_n, ap_predicate_op70_write_state3, ap_predicate_op71_write_state3, regslice_both_m_axis_rx_meta_U_apdone_blk, m_axis_rx_meta_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op63_write_state2 = ap_const_boolean_1) and (m_axis_rx_meta_TREADY_int_regslice = ap_const_logic_0)) or ((tmp_i_reg_399 = ap_const_lv1_1) and (rx_process2dropFifo_full_n = ap_const_logic_0)))) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_98_p3 = ap_const_lv1_1) and (s_axis_rx_data_internal_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((regslice_both_m_axis_rx_meta_U_apdone_blk = ap_const_logic_1) or ((ap_predicate_op71_write_state3 = ap_const_boolean_1) and (m_axis_rx_meta_TREADY_int_regslice = ap_const_logic_0)) or ((ap_predicate_op70_write_state3 = ap_const_boolean_1) and (rx_process2dropLengthFifo_full_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, s_axis_rx_data_internal_empty_n, tmp_i_nbreadreq_fu_98_p3, ap_done_reg, rx_process2dropFifo_full_n, tmp_i_reg_399, ap_predicate_op63_write_state2, ap_block_state2_io, rx_process2dropLengthFifo_full_n, ap_predicate_op70_write_state3, ap_predicate_op71_write_state3, regslice_both_m_axis_rx_meta_U_apdone_blk, ap_block_state3_io, m_axis_rx_meta_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((ap_const_boolean_1 = ap_block_state2_io) or ((ap_predicate_op63_write_state2 = ap_const_boolean_1) and (m_axis_rx_meta_TREADY_int_regslice = ap_const_logic_0)) or ((tmp_i_reg_399 = ap_const_lv1_1) and (rx_process2dropFifo_full_n = ap_const_logic_0)))) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_98_p3 = ap_const_lv1_1) and (s_axis_rx_data_internal_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((regslice_both_m_axis_rx_meta_U_apdone_blk = ap_const_logic_1) or (ap_const_boolean_1 = ap_block_state3_io) or ((ap_predicate_op71_write_state3 = ap_const_boolean_1) and (m_axis_rx_meta_TREADY_int_regslice = ap_const_logic_0)) or ((ap_predicate_op70_write_state3 = ap_const_boolean_1) and (rx_process2dropLengthFifo_full_n = ap_const_logic_0)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, s_axis_rx_data_internal_empty_n, tmp_i_nbreadreq_fu_98_p3, ap_done_reg, rx_process2dropFifo_full_n, tmp_i_reg_399, ap_predicate_op63_write_state2, ap_block_state2_io, rx_process2dropLengthFifo_full_n, ap_predicate_op70_write_state3, ap_predicate_op71_write_state3, regslice_both_m_axis_rx_meta_U_apdone_blk, ap_block_state3_io, m_axis_rx_meta_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((ap_const_boolean_1 = ap_block_state2_io) or ((ap_predicate_op63_write_state2 = ap_const_boolean_1) and (m_axis_rx_meta_TREADY_int_regslice = ap_const_logic_0)) or ((tmp_i_reg_399 = ap_const_lv1_1) and (rx_process2dropFifo_full_n = ap_const_logic_0)))) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_98_p3 = ap_const_lv1_1) and (s_axis_rx_data_internal_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((regslice_both_m_axis_rx_meta_U_apdone_blk = ap_const_logic_1) or (ap_const_boolean_1 = ap_block_state3_io) or ((ap_predicate_op71_write_state3 = ap_const_boolean_1) and (m_axis_rx_meta_TREADY_int_regslice = ap_const_logic_0)) or ((ap_predicate_op70_write_state3 = ap_const_boolean_1) and (rx_process2dropLengthFifo_full_n = ap_const_logic_0)))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(s_axis_rx_data_internal_empty_n, tmp_i_nbreadreq_fu_98_p3, ap_done_reg)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_done_reg = ap_const_logic_1) or ((tmp_i_nbreadreq_fu_98_p3 = ap_const_lv1_1) and (s_axis_rx_data_internal_empty_n = ap_const_logic_0)));
    end process;


    ap_block_state2_io_assign_proc : process(ap_predicate_op63_write_state2, m_axis_rx_meta_TREADY_int_regslice)
    begin
                ap_block_state2_io <= ((ap_predicate_op63_write_state2 = ap_const_boolean_1) and (m_axis_rx_meta_TREADY_int_regslice = ap_const_logic_0));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(rx_process2dropFifo_full_n, tmp_i_reg_399, ap_predicate_op63_write_state2, m_axis_rx_meta_TREADY_int_regslice)
    begin
                ap_block_state2_pp0_stage0_iter1 <= (((ap_predicate_op63_write_state2 = ap_const_boolean_1) and (m_axis_rx_meta_TREADY_int_regslice = ap_const_logic_0)) or ((tmp_i_reg_399 = ap_const_lv1_1) and (rx_process2dropFifo_full_n = ap_const_logic_0)));
    end process;


    ap_block_state3_io_assign_proc : process(ap_predicate_op71_write_state3, m_axis_rx_meta_TREADY_int_regslice)
    begin
                ap_block_state3_io <= ((ap_predicate_op71_write_state3 = ap_const_boolean_1) and (m_axis_rx_meta_TREADY_int_regslice = ap_const_logic_0));
    end process;


    ap_block_state3_pp0_stage0_iter2_assign_proc : process(rx_process2dropLengthFifo_full_n, ap_predicate_op70_write_state3, ap_predicate_op71_write_state3, regslice_both_m_axis_rx_meta_U_apdone_blk, m_axis_rx_meta_TREADY_int_regslice)
    begin
                ap_block_state3_pp0_stage0_iter2 <= ((regslice_both_m_axis_rx_meta_U_apdone_blk = ap_const_logic_1) or ((ap_predicate_op71_write_state3 = ap_const_boolean_1) and (m_axis_rx_meta_TREADY_int_regslice = ap_const_logic_0)) or ((ap_predicate_op70_write_state3 = ap_const_boolean_1) and (rx_process2dropLengthFifo_full_n = ap_const_logic_0)));
    end process;


    ap_done_assign_proc : process(ap_enable_reg_pp0_iter2, ap_done_reg, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
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


    ap_phi_mux_header_idx_new_0_i_phi_fu_158_p4_assign_proc : process(tmp_i_reg_399, header_ready_load_load_fu_204_p1, add_ln67_fu_228_p2, ap_phi_reg_pp0_iter1_header_idx_new_0_i_reg_155)
    begin
        if (((tmp_i_reg_399 = ap_const_lv1_1) and (header_ready_load_load_fu_204_p1 = ap_const_lv1_0))) then 
            ap_phi_mux_header_idx_new_0_i_phi_fu_158_p4 <= add_ln67_fu_228_p2;
        else 
            ap_phi_mux_header_idx_new_0_i_phi_fu_158_p4 <= ap_phi_reg_pp0_iter1_header_idx_new_0_i_reg_155;
        end if; 
    end process;


    ap_phi_mux_header_ready_flag_0_i_phi_fu_147_p4_assign_proc : process(tmp_i_reg_399, ap_phi_reg_pp0_iter1_header_ready_flag_0_i_reg_144, header_ready_load_load_fu_204_p1)
    begin
        if ((tmp_i_reg_399 = ap_const_lv1_1)) then
            if ((header_ready_load_load_fu_204_p1 = ap_const_lv1_0)) then 
                ap_phi_mux_header_ready_flag_0_i_phi_fu_147_p4 <= ap_const_lv1_1;
            elsif ((header_ready_load_load_fu_204_p1 = ap_const_lv1_1)) then 
                ap_phi_mux_header_ready_flag_0_i_phi_fu_147_p4 <= ap_const_lv1_0;
            else 
                ap_phi_mux_header_ready_flag_0_i_phi_fu_147_p4 <= ap_phi_reg_pp0_iter1_header_ready_flag_0_i_reg_144;
            end if;
        else 
            ap_phi_mux_header_ready_flag_0_i_phi_fu_147_p4 <= ap_phi_reg_pp0_iter1_header_ready_flag_0_i_reg_144;
        end if; 
    end process;


    ap_phi_mux_metaWritten_flag_0_i_phi_fu_136_p4_assign_proc : process(tmp_i_nbreadreq_fu_98_p3, metaWritten_load_load_fu_182_p1, ap_phi_reg_pp0_iter0_metaWritten_flag_0_i_reg_133)
    begin
        if ((tmp_i_nbreadreq_fu_98_p3 = ap_const_lv1_1)) then
            if ((metaWritten_load_load_fu_182_p1 = ap_const_lv1_0)) then 
                ap_phi_mux_metaWritten_flag_0_i_phi_fu_136_p4 <= ap_const_lv1_1;
            elsif ((metaWritten_load_load_fu_182_p1 = ap_const_lv1_1)) then 
                ap_phi_mux_metaWritten_flag_0_i_phi_fu_136_p4 <= ap_const_lv1_0;
            else 
                ap_phi_mux_metaWritten_flag_0_i_phi_fu_136_p4 <= ap_phi_reg_pp0_iter0_metaWritten_flag_0_i_reg_133;
            end if;
        else 
            ap_phi_mux_metaWritten_flag_0_i_phi_fu_136_p4 <= ap_phi_reg_pp0_iter0_metaWritten_flag_0_i_reg_133;
        end if; 
    end process;


    ap_phi_mux_p_Val2_1_in_i_in_in_phi_fu_168_p4_assign_proc : process(tmp_i_reg_399, header_header_V, header_ready_load_load_fu_204_p1, ap_phi_reg_pp0_iter1_p_Val2_1_in_i_in_in_reg_165, p_Result_s_fu_318_p2)
    begin
        if ((tmp_i_reg_399 = ap_const_lv1_1)) then
            if ((header_ready_load_load_fu_204_p1 = ap_const_lv1_0)) then 
                ap_phi_mux_p_Val2_1_in_i_in_in_phi_fu_168_p4 <= p_Result_s_fu_318_p2;
            elsif ((header_ready_load_load_fu_204_p1 = ap_const_lv1_1)) then 
                ap_phi_mux_p_Val2_1_in_i_in_in_phi_fu_168_p4 <= header_header_V;
            else 
                ap_phi_mux_p_Val2_1_in_i_in_in_phi_fu_168_p4 <= ap_phi_reg_pp0_iter1_p_Val2_1_in_i_in_in_reg_165;
            end if;
        else 
            ap_phi_mux_p_Val2_1_in_i_in_in_phi_fu_168_p4 <= ap_phi_reg_pp0_iter1_p_Val2_1_in_i_in_in_reg_165;
        end if; 
    end process;

    ap_phi_reg_pp0_iter0_metaWritten_flag_0_i_reg_133 <= "X";
    ap_phi_reg_pp0_iter1_header_idx_new_0_i_reg_155 <= "XXXXXXXXXXXXXXXX";
    ap_phi_reg_pp0_iter1_header_ready_flag_0_i_reg_144 <= "X";
    ap_phi_reg_pp0_iter1_p_Val2_1_in_i_in_in_reg_165 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

    ap_predicate_op63_write_state2_assign_proc : process(tmp_i_reg_399, metaWritten_load_reg_416)
    begin
                ap_predicate_op63_write_state2 <= ((metaWritten_load_reg_416 = ap_const_lv1_0) and (tmp_i_reg_399 = ap_const_lv1_1));
    end process;


    ap_predicate_op70_write_state3_assign_proc : process(tmp_i_reg_399_pp0_iter1_reg, metaWritten_load_reg_416_pp0_iter1_reg)
    begin
                ap_predicate_op70_write_state3 <= ((metaWritten_load_reg_416_pp0_iter1_reg = ap_const_lv1_0) and (tmp_i_reg_399_pp0_iter1_reg = ap_const_lv1_1));
    end process;


    ap_predicate_op71_write_state3_assign_proc : process(tmp_i_reg_399_pp0_iter1_reg, metaWritten_load_reg_416_pp0_iter1_reg)
    begin
                ap_predicate_op71_write_state3 <= ((metaWritten_load_reg_416_pp0_iter1_reg = ap_const_lv1_0) and (tmp_i_reg_399_pp0_iter1_reg = ap_const_lv1_1));
    end process;


    ap_ready_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
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

    currWord_last_V_fu_174_p3 <= s_axis_rx_data_internal_dout(576 downto 576);
    header_ready_load_load_fu_204_p1 <= header_ready;
    icmp_ln414_fu_235_p2 <= "1" when (unsigned(shl_ln_fu_217_p3) > unsigned(ap_const_lv25_9F)) else "0";

    m_axis_rx_meta_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_predicate_op63_write_state2, ap_predicate_op71_write_state3, ap_block_pp0_stage0, m_axis_rx_meta_TREADY_int_regslice)
    begin
        if ((((ap_predicate_op71_write_state3 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((ap_predicate_op63_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)))) then 
            m_axis_rx_meta_TDATA_blk_n <= m_axis_rx_meta_TREADY_int_regslice;
        else 
            m_axis_rx_meta_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    m_axis_rx_meta_TDATA_int_regslice <= ((tmp_i_38_fu_355_p4 & tmp_9_i_fu_345_p4) & tmp_7_i_fu_335_p4);
    m_axis_rx_meta_TVALID <= regslice_both_m_axis_rx_meta_U_vld_out;

    m_axis_rx_meta_TVALID_int_regslice_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op63_write_state2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op63_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            m_axis_rx_meta_TVALID_int_regslice <= ap_const_logic_1;
        else 
            m_axis_rx_meta_TVALID_int_regslice <= ap_const_logic_0;
        end if; 
    end process;

    metaWritten_load_load_fu_182_p1 <= metaWritten;
    or_ln414_fu_294_p2 <= (select_ln414_3_fu_286_p3 or select_ln414_2_fu_278_p3);
    or_ln63_1_fu_192_p2 <= (currWord_last_V_fu_174_p3 or ap_phi_mux_metaWritten_flag_0_i_phi_fu_136_p4);
    or_ln63_fu_376_p2 <= (currWord_last_V_reg_410 or ap_phi_mux_header_ready_flag_0_i_phi_fu_147_p4);
    p_Result_s_fu_318_p2 <= (and_ln414_fu_306_p2 or and_ln414_1_fu_312_p2);

    rx_process2dropFifo_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, rx_process2dropFifo_full_n, tmp_i_reg_399, ap_block_pp0_stage0)
    begin
        if (((tmp_i_reg_399 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            rx_process2dropFifo_blk_n <= rx_process2dropFifo_full_n;
        else 
            rx_process2dropFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    rx_process2dropFifo_din <= s_axis_rx_data_internal_read_reg_403;

    rx_process2dropFifo_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, tmp_i_reg_399, ap_block_pp0_stage0_11001)
    begin
        if (((tmp_i_reg_399 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            rx_process2dropFifo_write <= ap_const_logic_1;
        else 
            rx_process2dropFifo_write <= ap_const_logic_0;
        end if; 
    end process;


    rx_process2dropLengthFifo_blk_n_assign_proc : process(ap_enable_reg_pp0_iter2, rx_process2dropLengthFifo_full_n, ap_predicate_op70_write_state3, ap_block_pp0_stage0)
    begin
        if (((ap_predicate_op70_write_state3 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            rx_process2dropLengthFifo_blk_n <= rx_process2dropLengthFifo_full_n;
        else 
            rx_process2dropLengthFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    rx_process2dropLengthFifo_din <= trunc_ln674_reg_431;

    rx_process2dropLengthFifo_write_assign_proc : process(ap_enable_reg_pp0_iter2, ap_predicate_op70_write_state3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op70_write_state3 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            rx_process2dropLengthFifo_write <= ap_const_logic_1;
        else 
            rx_process2dropLengthFifo_write <= ap_const_logic_0;
        end if; 
    end process;


    s_axis_rx_data_internal_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, s_axis_rx_data_internal_empty_n, tmp_i_nbreadreq_fu_98_p3, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_done_reg = ap_const_logic_0) and (tmp_i_nbreadreq_fu_98_p3 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            s_axis_rx_data_internal_blk_n <= s_axis_rx_data_internal_empty_n;
        else 
            s_axis_rx_data_internal_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    s_axis_rx_data_internal_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, tmp_i_nbreadreq_fu_98_p3, ap_block_pp0_stage0_11001)
    begin
        if (((tmp_i_nbreadreq_fu_98_p3 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            s_axis_rx_data_internal_read <= ap_const_logic_1;
        else 
            s_axis_rx_data_internal_read <= ap_const_logic_0;
        end if; 
    end process;

    select_ln414_1_fu_270_p3 <= 
        tmp_fu_260_p4 when (icmp_ln414_fu_235_p2(0) = '1') else 
        tmp_1_fu_225_p1;
    select_ln414_2_fu_278_p3 <= 
        ap_const_lv160_lc_4 when (icmp_ln414_fu_235_p2(0) = '1') else 
        ap_const_lv160_lc_3;
    select_ln414_3_fu_286_p3 <= 
        ap_const_lv160_lc_5 when (icmp_ln414_fu_235_p2(0) = '1') else 
        ap_const_lv160_lc_3;
    select_ln414_fu_252_p3 <= 
        st_fu_244_p3 when (icmp_ln414_fu_235_p2(0) = '1') else 
        tmp_1_fu_225_p1;
    select_ln63_fu_381_p3 <= 
        ap_const_lv16_0 when (currWord_last_V_reg_410(0) = '1') else 
        ap_phi_mux_header_idx_new_0_i_phi_fu_158_p4;
    shl_ln_fu_217_p3 <= (header_idx & ap_const_lv9_0);
    st_fu_244_p3 <= (trunc_ln414_fu_241_p1 & ap_const_lv159_lc_3);
    tmp_1_fu_225_p1 <= s_axis_rx_data_internal_read_reg_403(160 - 1 downto 0);
    tmp_7_i_fu_335_p4 <= ap_phi_mux_p_Val2_1_in_i_in_in_phi_fu_168_p4(127 downto 96);
    tmp_9_i_fu_345_p4 <= ap_phi_mux_p_Val2_1_in_i_in_in_phi_fu_168_p4(31 downto 24);
    
    tmp_fu_260_p4_proc : process(select_ln414_fu_252_p3)
    variable vlo_cpy : STD_LOGIC_VECTOR(160+32 - 1 downto 0);
    variable vhi_cpy : STD_LOGIC_VECTOR(160+32 - 1 downto 0);
    variable v0_cpy : STD_LOGIC_VECTOR(160 - 1 downto 0);
    variable tmp_fu_260_p4_i : integer;
    variable section : STD_LOGIC_VECTOR(160 - 1 downto 0);
    variable tmp_mask : STD_LOGIC_VECTOR(160 - 1 downto 0);
    variable resvalue, res_value, res_mask : STD_LOGIC_VECTOR(160 - 1 downto 0);
    begin
        vlo_cpy := (others => '0');
        vlo_cpy(8 - 1 downto 0) := ap_const_lv32_9F(8 - 1 downto 0);
        vhi_cpy := (others => '0');
        vhi_cpy(8 - 1 downto 0) := ap_const_lv32_0(8 - 1 downto 0);
        v0_cpy := select_ln414_fu_252_p3;
        if (vlo_cpy(8 - 1 downto 0) > vhi_cpy(8 - 1 downto 0)) then
            vhi_cpy(8-1 downto 0) := std_logic_vector(160-1-unsigned(ap_const_lv32_0(8-1 downto 0)));
            vlo_cpy(8-1 downto 0) := std_logic_vector(160-1-unsigned(ap_const_lv32_9F(8-1 downto 0)));
            for tmp_fu_260_p4_i in 0 to 160-1 loop
                v0_cpy(tmp_fu_260_p4_i) := select_ln414_fu_252_p3(160-1-tmp_fu_260_p4_i);
            end loop;
        end if;
        res_value := std_logic_vector(shift_right(unsigned(v0_cpy), to_integer(unsigned('0' & vlo_cpy(8-1 downto 0)))));

        section := (others=>'0');
        section(8-1 downto 0) := std_logic_vector(unsigned(vhi_cpy(8-1 downto 0)) - unsigned(vlo_cpy(8-1 downto 0)));
        tmp_mask := (others => '1');
        res_mask := std_logic_vector(shift_left(unsigned(tmp_mask),to_integer(unsigned('0' & section(31-1 downto 0)))));
        res_mask := res_mask(160-2 downto 0) & '0';
        resvalue := res_value and not res_mask;
        tmp_fu_260_p4 <= resvalue(160-1 downto 0);
    end process;

    tmp_i_38_fu_355_p4 <= ap_phi_mux_p_Val2_1_in_i_in_in_phi_fu_168_p4(23 downto 16);
    tmp_i_nbreadreq_fu_98_p3 <= (0=>(s_axis_rx_data_internal_empty_n), others=>'-');
    trunc_ln414_fu_241_p1 <= s_axis_rx_data_internal_read_reg_403(1 - 1 downto 0);
    trunc_ln674_fu_331_p1 <= ap_phi_mux_p_Val2_1_in_i_in_in_phi_fu_168_p4(4 - 1 downto 0);
    xor_ln414_fu_300_p2 <= (or_ln414_fu_294_p2 xor ap_const_lv160_lc_6);
    xor_ln63_fu_186_p2 <= (currWord_last_V_fu_174_p3 xor ap_const_lv1_1);
end behav;
