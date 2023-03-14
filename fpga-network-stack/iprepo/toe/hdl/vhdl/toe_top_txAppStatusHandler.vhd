-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity toe_top_txAppStatusHandler is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    s_axis_txwrite_sts_TVALID : IN STD_LOGIC;
    txApp_txEventCache_dout : IN STD_LOGIC_VECTOR (84 downto 0);
    txApp_txEventCache_num_data_valid : IN STD_LOGIC_VECTOR (6 downto 0);
    txApp_txEventCache_fifo_cap : IN STD_LOGIC_VECTOR (6 downto 0);
    txApp_txEventCache_empty_n : IN STD_LOGIC;
    txApp_txEventCache_read : OUT STD_LOGIC;
    txApp2txSar_push_din : OUT STD_LOGIC_VECTOR (33 downto 0);
    txApp2txSar_push_num_data_valid : IN STD_LOGIC_VECTOR (4 downto 0);
    txApp2txSar_push_fifo_cap : IN STD_LOGIC_VECTOR (4 downto 0);
    txApp2txSar_push_full_n : IN STD_LOGIC;
    txApp2txSar_push_write : OUT STD_LOGIC;
    s_axis_txwrite_sts_TDATA : IN STD_LOGIC_VECTOR (7 downto 0);
    s_axis_txwrite_sts_TREADY : OUT STD_LOGIC );
end;


architecture behav of toe_top_txAppStatusHandler is 
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
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv19_40000 : STD_LOGIC_VECTOR (18 downto 0) := "1000000000000000000";
    constant ap_const_lv32_42 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000010";
    constant ap_const_lv32_51 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001010001";
    constant ap_const_lv32_30 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110000";
    constant ap_const_lv32_41 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000001";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_2F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal grp_nbreadreq_fu_72_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op20_read_state1 : BOOLEAN;
    signal ap_predicate_op36_read_state1 : BOOLEAN;
    signal tmp_i_nbreadreq_fu_86_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op44_read_state1 : BOOLEAN;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal tash_state_load_reg_270 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_i_183_reg_292 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_okay_V_reg_296 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1081_reg_300 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op61_write_state2 : BOOLEAN;
    signal tmp_22_i_reg_304 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_okay_V_1_reg_308 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op65_write_state2 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal tash_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal ev_sessionID_V : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal ev_address_V : STD_LOGIC_VECTOR (17 downto 0) := "000000000000000000";
    signal ev_length_V : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal s_axis_txwrite_sts_TDATA_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal txApp_txEventCache_blk_n : STD_LOGIC;
    signal txApp2txSar_push_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal ev_sessionID_V_load_reg_274 : STD_LOGIC_VECTOR (15 downto 0);
    signal lhs_reg_280 : STD_LOGIC_VECTOR (17 downto 0);
    signal rhs_reg_286 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fu_118_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln1081_fu_156_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_mux_storemerge_i_phi_fu_110_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_phi_reg_pp0_iter0_storemerge_i_reg_107 : STD_LOGIC_VECTOR (1 downto 0);
    signal icmp_ln81_fu_226_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_03_fu_246_p3 : STD_LOGIC_VECTOR (33 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal p_02_fu_262_p3 : STD_LOGIC_VECTOR (33 downto 0);
    signal zext_ln232_2_fu_142_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal zext_ln232_3_fu_146_p1 : STD_LOGIC_VECTOR (18 downto 0);
    signal ret_V_fu_150_p2 : STD_LOGIC_VECTOR (18 downto 0);
    signal trunc_ln145_fu_174_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal zext_ln1541_fu_238_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal add_ln232_1_fu_241_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal zext_ln232_fu_254_p1 : STD_LOGIC_VECTOR (17 downto 0);
    signal add_ln232_fu_257_p2 : STD_LOGIC_VECTOR (17 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to0 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal regslice_both_s_axis_txwrite_sts_U_apdone_blk : STD_LOGIC;
    signal s_axis_txwrite_sts_TDATA_int_regslice : STD_LOGIC_VECTOR (7 downto 0);
    signal s_axis_txwrite_sts_TVALID_int_regslice : STD_LOGIC;
    signal s_axis_txwrite_sts_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_s_axis_txwrite_sts_U_ack_in : STD_LOGIC;
    signal ap_condition_164 : BOOLEAN;
    signal ap_condition_177 : BOOLEAN;
    signal ap_condition_181 : BOOLEAN;
    signal ap_condition_158 : BOOLEAN;
    signal ap_condition_203 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component toe_top_regslice_both IS
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
    regslice_both_s_axis_txwrite_sts_U : component toe_top_regslice_both
    generic map (
        DataWidth => 8)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => s_axis_txwrite_sts_TDATA,
        vld_in => s_axis_txwrite_sts_TVALID,
        ack_in => regslice_both_s_axis_txwrite_sts_U_ack_in,
        data_out => s_axis_txwrite_sts_TDATA_int_regslice,
        vld_out => s_axis_txwrite_sts_TVALID_int_regslice,
        ack_out => s_axis_txwrite_sts_TREADY_int_regslice,
        apdone_blk => regslice_both_s_axis_txwrite_sts_U_apdone_blk);





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


    tash_state_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_158)) then
                if ((ap_const_boolean_1 = ap_condition_181)) then 
                    tash_state <= ap_const_lv2_1;
                elsif ((ap_const_boolean_1 = ap_condition_177)) then 
                    tash_state <= ap_const_lv2_0;
                elsif ((ap_const_boolean_1 = ap_condition_164)) then 
                    tash_state <= ap_phi_mux_storemerge_i_phi_fu_110_p4;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((tash_state = ap_const_lv2_2)) and not((tash_state = ap_const_lv2_1)) and (tmp_i_nbreadreq_fu_86_p3 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ev_address_V <= txApp_txEventCache_dout(65 downto 48);
                ev_length_V <= txApp_txEventCache_dout(81 downto 66);
                ev_sessionID_V <= txApp_txEventCache_dout(47 downto 32);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                ev_sessionID_V_load_reg_274 <= ev_sessionID_V;
                lhs_reg_280 <= ev_address_V;
                rhs_reg_286 <= ev_length_V;
                tash_state_load_reg_270 <= tash_state;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_nbreadreq_fu_72_p3 = ap_const_lv1_1) and (tash_state = ap_const_lv2_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (grp_fu_118_p3 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                icmp_ln1081_reg_300 <= icmp_ln1081_fu_156_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tash_state = ap_const_lv2_2) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_22_i_reg_304 <= grp_nbreadreq_fu_72_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tash_state = ap_const_lv2_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_i_183_reg_292 <= grp_nbreadreq_fu_72_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_nbreadreq_fu_72_p3 = ap_const_lv1_1) and (tash_state = ap_const_lv2_2) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_okay_V_1_reg_308 <= s_axis_txwrite_sts_TDATA_int_regslice(7 downto 7);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((grp_nbreadreq_fu_72_p3 = ap_const_lv1_1) and (tash_state = ap_const_lv2_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                tmp_okay_V_reg_296 <= s_axis_txwrite_sts_TDATA_int_regslice(7 downto 7);
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
    add_ln232_1_fu_241_p2 <= std_logic_vector(unsigned(lhs_reg_280) + unsigned(zext_ln1541_fu_238_p1));
    add_ln232_fu_257_p2 <= std_logic_vector(unsigned(lhs_reg_280) + unsigned(zext_ln232_fu_254_p1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_predicate_op20_read_state1, ap_predicate_op36_read_state1, txApp_txEventCache_empty_n, ap_predicate_op44_read_state1, ap_done_reg, txApp2txSar_push_full_n, ap_predicate_op61_write_state2, ap_predicate_op65_write_state2, s_axis_txwrite_sts_TVALID_int_regslice)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (txApp_txEventCache_empty_n = ap_const_logic_0)) or ((ap_predicate_op36_read_state1 = ap_const_boolean_1) and (s_axis_txwrite_sts_TVALID_int_regslice = ap_const_logic_0)) or ((ap_predicate_op20_read_state1 = ap_const_boolean_1) and (s_axis_txwrite_sts_TVALID_int_regslice = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op61_write_state2 = ap_const_boolean_1) and (txApp2txSar_push_full_n = ap_const_logic_0)) or ((txApp2txSar_push_full_n = ap_const_logic_0) and (ap_predicate_op65_write_state2 = ap_const_boolean_1)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_predicate_op20_read_state1, ap_predicate_op36_read_state1, txApp_txEventCache_empty_n, ap_predicate_op44_read_state1, ap_done_reg, txApp2txSar_push_full_n, ap_predicate_op61_write_state2, ap_predicate_op65_write_state2, s_axis_txwrite_sts_TVALID_int_regslice)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (txApp_txEventCache_empty_n = ap_const_logic_0)) or ((ap_predicate_op36_read_state1 = ap_const_boolean_1) and (s_axis_txwrite_sts_TVALID_int_regslice = ap_const_logic_0)) or ((ap_predicate_op20_read_state1 = ap_const_boolean_1) and (s_axis_txwrite_sts_TVALID_int_regslice = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op61_write_state2 = ap_const_boolean_1) and (txApp2txSar_push_full_n = ap_const_logic_0)) or ((txApp2txSar_push_full_n = ap_const_logic_0) and (ap_predicate_op65_write_state2 = ap_const_boolean_1)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_predicate_op20_read_state1, ap_predicate_op36_read_state1, txApp_txEventCache_empty_n, ap_predicate_op44_read_state1, ap_done_reg, txApp2txSar_push_full_n, ap_predicate_op61_write_state2, ap_predicate_op65_write_state2, s_axis_txwrite_sts_TVALID_int_regslice)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (txApp_txEventCache_empty_n = ap_const_logic_0)) or ((ap_predicate_op36_read_state1 = ap_const_boolean_1) and (s_axis_txwrite_sts_TVALID_int_regslice = ap_const_logic_0)) or ((ap_predicate_op20_read_state1 = ap_const_boolean_1) and (s_axis_txwrite_sts_TVALID_int_regslice = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op61_write_state2 = ap_const_boolean_1) and (txApp2txSar_push_full_n = ap_const_logic_0)) or ((txApp2txSar_push_full_n = ap_const_logic_0) and (ap_predicate_op65_write_state2 = ap_const_boolean_1)))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(ap_predicate_op20_read_state1, ap_predicate_op36_read_state1, txApp_txEventCache_empty_n, ap_predicate_op44_read_state1, ap_done_reg, s_axis_txwrite_sts_TVALID_int_regslice)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (txApp_txEventCache_empty_n = ap_const_logic_0)) or ((ap_predicate_op36_read_state1 = ap_const_boolean_1) and (s_axis_txwrite_sts_TVALID_int_regslice = ap_const_logic_0)) or ((ap_predicate_op20_read_state1 = ap_const_boolean_1) and (s_axis_txwrite_sts_TVALID_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(txApp2txSar_push_full_n, ap_predicate_op61_write_state2, ap_predicate_op65_write_state2)
    begin
                ap_block_state2_pp0_stage0_iter1 <= (((ap_predicate_op61_write_state2 = ap_const_boolean_1) and (txApp2txSar_push_full_n = ap_const_logic_0)) or ((txApp2txSar_push_full_n = ap_const_logic_0) and (ap_predicate_op65_write_state2 = ap_const_boolean_1)));
    end process;


    ap_condition_158_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
                ap_condition_158 <= ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001));
    end process;


    ap_condition_164_assign_proc : process(grp_nbreadreq_fu_72_p3, tash_state, grp_fu_118_p3)
    begin
                ap_condition_164 <= ((grp_nbreadreq_fu_72_p3 = ap_const_lv1_1) and (tash_state = ap_const_lv2_1) and (grp_fu_118_p3 = ap_const_lv1_1));
    end process;


    ap_condition_177_assign_proc : process(grp_nbreadreq_fu_72_p3, tash_state, grp_fu_118_p3)
    begin
                ap_condition_177 <= ((grp_nbreadreq_fu_72_p3 = ap_const_lv1_1) and (tash_state = ap_const_lv2_2) and (grp_fu_118_p3 = ap_const_lv1_1));
    end process;


    ap_condition_181_assign_proc : process(tmp_i_nbreadreq_fu_86_p3, tash_state, icmp_ln81_fu_226_p2)
    begin
                ap_condition_181 <= (not((tash_state = ap_const_lv2_2)) and not((tash_state = ap_const_lv2_1)) and (tmp_i_nbreadreq_fu_86_p3 = ap_const_lv1_1) and (icmp_ln81_fu_226_p2 = ap_const_lv1_1));
    end process;


    ap_condition_203_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_01001)
    begin
                ap_condition_203 <= ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001));
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


    ap_phi_mux_storemerge_i_phi_fu_110_p4_assign_proc : process(icmp_ln1081_fu_156_p2, ap_phi_reg_pp0_iter0_storemerge_i_reg_107, ap_condition_164)
    begin
        if ((ap_const_boolean_1 = ap_condition_164)) then
            if ((icmp_ln1081_fu_156_p2 = ap_const_lv1_1)) then 
                ap_phi_mux_storemerge_i_phi_fu_110_p4 <= ap_const_lv2_2;
            elsif ((icmp_ln1081_fu_156_p2 = ap_const_lv1_0)) then 
                ap_phi_mux_storemerge_i_phi_fu_110_p4 <= ap_const_lv2_0;
            else 
                ap_phi_mux_storemerge_i_phi_fu_110_p4 <= ap_phi_reg_pp0_iter0_storemerge_i_reg_107;
            end if;
        else 
            ap_phi_mux_storemerge_i_phi_fu_110_p4 <= ap_phi_reg_pp0_iter0_storemerge_i_reg_107;
        end if; 
    end process;

    ap_phi_reg_pp0_iter0_storemerge_i_reg_107 <= "XX";

    ap_predicate_op20_read_state1_assign_proc : process(grp_nbreadreq_fu_72_p3, tash_state)
    begin
                ap_predicate_op20_read_state1 <= ((grp_nbreadreq_fu_72_p3 = ap_const_lv1_1) and (tash_state = ap_const_lv2_1));
    end process;


    ap_predicate_op36_read_state1_assign_proc : process(grp_nbreadreq_fu_72_p3, tash_state)
    begin
                ap_predicate_op36_read_state1 <= ((grp_nbreadreq_fu_72_p3 = ap_const_lv1_1) and (tash_state = ap_const_lv2_2));
    end process;


    ap_predicate_op44_read_state1_assign_proc : process(tmp_i_nbreadreq_fu_86_p3, tash_state)
    begin
                ap_predicate_op44_read_state1 <= (not((tash_state = ap_const_lv2_2)) and not((tash_state = ap_const_lv2_1)) and (tmp_i_nbreadreq_fu_86_p3 = ap_const_lv1_1));
    end process;


    ap_predicate_op61_write_state2_assign_proc : process(tash_state_load_reg_270, tmp_i_183_reg_292, tmp_okay_V_reg_296, icmp_ln1081_reg_300)
    begin
                ap_predicate_op61_write_state2 <= ((icmp_ln1081_reg_300 = ap_const_lv1_0) and (tmp_okay_V_reg_296 = ap_const_lv1_1) and (tmp_i_183_reg_292 = ap_const_lv1_1) and (tash_state_load_reg_270 = ap_const_lv2_1));
    end process;


    ap_predicate_op65_write_state2_assign_proc : process(tash_state_load_reg_270, tmp_22_i_reg_304, tmp_okay_V_1_reg_308)
    begin
                ap_predicate_op65_write_state2 <= ((tmp_okay_V_1_reg_308 = ap_const_lv1_1) and (tmp_22_i_reg_304 = ap_const_lv1_1) and (tash_state_load_reg_270 = ap_const_lv2_2));
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

    grp_fu_118_p3 <= s_axis_txwrite_sts_TDATA_int_regslice(7 downto 7);
    grp_nbreadreq_fu_72_p3 <= (0=>(s_axis_txwrite_sts_TVALID_int_regslice), others=>'-');
    icmp_ln1081_fu_156_p2 <= "1" when (unsigned(ret_V_fu_150_p2) > unsigned(ap_const_lv19_40000)) else "0";
    icmp_ln81_fu_226_p2 <= "1" when (trunc_ln145_fu_174_p1 = ap_const_lv32_0) else "0";
    p_02_fu_262_p3 <= (add_ln232_fu_257_p2 & ev_sessionID_V_load_reg_274);
    p_03_fu_246_p3 <= (add_ln232_1_fu_241_p2 & ev_sessionID_V_load_reg_274);
    ret_V_fu_150_p2 <= std_logic_vector(unsigned(zext_ln232_2_fu_142_p1) + unsigned(zext_ln232_3_fu_146_p1));

    s_axis_txwrite_sts_TDATA_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op20_read_state1, ap_predicate_op36_read_state1, ap_done_reg, ap_block_pp0_stage0, s_axis_txwrite_sts_TVALID_int_regslice)
    begin
        if ((((ap_done_reg = ap_const_logic_0) and (ap_predicate_op36_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((ap_done_reg = ap_const_logic_0) and (ap_predicate_op20_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)))) then 
            s_axis_txwrite_sts_TDATA_blk_n <= s_axis_txwrite_sts_TVALID_int_regslice;
        else 
            s_axis_txwrite_sts_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    s_axis_txwrite_sts_TREADY <= regslice_both_s_axis_txwrite_sts_U_ack_in;

    s_axis_txwrite_sts_TREADY_int_regslice_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op20_read_state1, ap_predicate_op36_read_state1, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_predicate_op36_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_predicate_op20_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
            s_axis_txwrite_sts_TREADY_int_regslice <= ap_const_logic_1;
        else 
            s_axis_txwrite_sts_TREADY_int_regslice <= ap_const_logic_0;
        end if; 
    end process;

    tmp_i_nbreadreq_fu_86_p3 <= (0=>(txApp_txEventCache_empty_n), others=>'-');
    trunc_ln145_fu_174_p1 <= txApp_txEventCache_dout(32 - 1 downto 0);

    txApp2txSar_push_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, txApp2txSar_push_full_n, ap_predicate_op61_write_state2, ap_predicate_op65_write_state2, ap_block_pp0_stage0)
    begin
        if ((((ap_predicate_op61_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op65_write_state2 = ap_const_boolean_1)))) then 
            txApp2txSar_push_blk_n <= txApp2txSar_push_full_n;
        else 
            txApp2txSar_push_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    txApp2txSar_push_din_assign_proc : process(ap_predicate_op61_write_state2, ap_predicate_op65_write_state2, p_03_fu_246_p3, p_02_fu_262_p3, ap_condition_203)
    begin
        if ((ap_const_boolean_1 = ap_condition_203)) then
            if ((ap_predicate_op65_write_state2 = ap_const_boolean_1)) then 
                txApp2txSar_push_din <= p_02_fu_262_p3;
            elsif ((ap_predicate_op61_write_state2 = ap_const_boolean_1)) then 
                txApp2txSar_push_din <= p_03_fu_246_p3;
            else 
                txApp2txSar_push_din <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            txApp2txSar_push_din <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    txApp2txSar_push_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op61_write_state2, ap_predicate_op65_write_state2, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_predicate_op61_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op65_write_state2 = ap_const_boolean_1)))) then 
            txApp2txSar_push_write <= ap_const_logic_1;
        else 
            txApp2txSar_push_write <= ap_const_logic_0;
        end if; 
    end process;


    txApp_txEventCache_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, txApp_txEventCache_empty_n, ap_predicate_op44_read_state1, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_done_reg = ap_const_logic_0) and (ap_predicate_op44_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            txApp_txEventCache_blk_n <= txApp_txEventCache_empty_n;
        else 
            txApp_txEventCache_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    txApp_txEventCache_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op44_read_state1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op44_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            txApp_txEventCache_read <= ap_const_logic_1;
        else 
            txApp_txEventCache_read <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln1541_fu_238_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_reg_286),18));
    zext_ln232_2_fu_142_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ev_address_V),19));
    zext_ln232_3_fu_146_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(ev_length_V),19));
    zext_ln232_fu_254_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(rhs_reg_286),18));
end behav;