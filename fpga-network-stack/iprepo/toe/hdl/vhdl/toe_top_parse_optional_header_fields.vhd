-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity toe_top_parse_optional_header_fields is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    rxEng_dataOffsetFifo_dout : IN STD_LOGIC_VECTOR (3 downto 0);
    rxEng_dataOffsetFifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    rxEng_dataOffsetFifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    rxEng_dataOffsetFifo_empty_n : IN STD_LOGIC;
    rxEng_dataOffsetFifo_read : OUT STD_LOGIC;
    rxEng_optionalFieldsFifo_dout : IN STD_LOGIC_VECTOR (319 downto 0);
    rxEng_optionalFieldsFifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    rxEng_optionalFieldsFifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    rxEng_optionalFieldsFifo_empty_n : IN STD_LOGIC;
    rxEng_optionalFieldsFifo_read : OUT STD_LOGIC;
    rxEng_winScaleFifo_din : OUT STD_LOGIC_VECTOR (3 downto 0);
    rxEng_winScaleFifo_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    rxEng_winScaleFifo_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    rxEng_winScaleFifo_full_n : IN STD_LOGIC;
    rxEng_winScaleFifo_write : OUT STD_LOGIC );
end;


architecture behav of toe_top_parse_optional_header_fields is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv8_3 : STD_LOGIC_VECTOR (7 downto 0) := "00000011";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_13 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010011";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal state_4_load_load_fu_114_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_i_nbreadreq_fu_64_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_465_i_nbreadreq_fu_72_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op24_read_state1 : BOOLEAN;
    signal ap_predicate_op26_read_state1 : BOOLEAN;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal state_4_load_reg_239 : STD_LOGIC_VECTOR (0 downto 0);
    signal optionKind_reg_249 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_predicate_op53_write_state2 : BOOLEAN;
    signal ap_predicate_op54_write_state2 : BOOLEAN;
    signal icmp_ln1065_reg_258 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_predicate_op55_write_state2 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal state_4 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal dataOffset_V_1 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal fields_V : STD_LOGIC_VECTOR (319 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    signal rxEng_dataOffsetFifo_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal rxEng_optionalFieldsFifo_blk_n : STD_LOGIC;
    signal rxEng_winScaleFifo_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal optionKind_fu_144_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal p_036_reg_253 : STD_LOGIC_VECTOR (3 downto 0);
    signal icmp_ln1065_fu_187_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_mux_optionLength_V_1_phi_fu_103_p8 : STD_LOGIC_VECTOR (7 downto 0);
    signal optionLength_V_fu_148_p4 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_phi_reg_pp0_iter0_optionLength_V_1_reg_100 : STD_LOGIC_VECTOR (7 downto 0);
    signal sub_ln887_fu_203_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal r_V_fu_227_p2 : STD_LOGIC_VECTOR (319 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal zext_ln1065_fu_183_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal trunc_ln887_fu_199_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal shl_ln_fu_215_p3 : STD_LOGIC_VECTOR (10 downto 0);
    signal zext_ln994_fu_223_p1 : STD_LOGIC_VECTOR (319 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to0 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_condition_46 : BOOLEAN;
    signal ap_condition_168 : BOOLEAN;
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


    dataOffset_V_1_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_168)) then
                if ((state_4_load_load_fu_114_p1 = ap_const_lv1_1)) then 
                    dataOffset_V_1 <= sub_ln887_fu_203_p2;
                elsif ((ap_const_boolean_1 = ap_condition_46)) then 
                    dataOffset_V_1 <= rxEng_dataOffsetFifo_dout;
                end if;
            end if; 
        end if;
    end process;

    fields_V_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_1 = ap_condition_168)) then
                if ((state_4_load_load_fu_114_p1 = ap_const_lv1_1)) then 
                    fields_V <= r_V_fu_227_p2;
                elsif ((ap_const_boolean_1 = ap_condition_46)) then 
                    fields_V <= rxEng_optionalFieldsFifo_dout;
                end if;
            end if; 
        end if;
    end process;

    state_4_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((not((optionKind_fu_144_p1 = ap_const_lv8_1)) and not((optionKind_fu_144_p1 = ap_const_lv8_0)) and not((optionKind_fu_144_p1 = ap_const_lv8_3)) and (state_4_load_load_fu_114_p1 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (icmp_ln1065_fu_187_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((state_4_load_load_fu_114_p1 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (optionKind_fu_144_p1 = ap_const_lv8_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((state_4_load_load_fu_114_p1 = ap_const_lv1_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (optionKind_fu_144_p1 = ap_const_lv8_3) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)))) then 
                state_4 <= ap_const_lv1_0;
            elsif (((tmp_465_i_nbreadreq_fu_72_p3 = ap_const_lv1_1) and (tmp_i_nbreadreq_fu_64_p3 = ap_const_lv1_1) and (state_4 = ap_const_lv1_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
                state_4 <= ap_const_lv1_1;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not((optionKind_fu_144_p1 = ap_const_lv8_1)) and not((optionKind_fu_144_p1 = ap_const_lv8_0)) and not((optionKind_fu_144_p1 = ap_const_lv8_3)) and (state_4_load_load_fu_114_p1 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                icmp_ln1065_reg_258 <= icmp_ln1065_fu_187_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((state_4_load_load_fu_114_p1 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                optionKind_reg_249 <= optionKind_fu_144_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((state_4_load_load_fu_114_p1 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (optionKind_fu_144_p1 = ap_const_lv8_3) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                p_036_reg_253 <= fields_V(19 downto 16);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                state_4_load_reg_239 <= state_4;
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

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, rxEng_dataOffsetFifo_empty_n, ap_predicate_op24_read_state1, rxEng_optionalFieldsFifo_empty_n, ap_predicate_op26_read_state1, ap_done_reg, rxEng_winScaleFifo_full_n, ap_predicate_op53_write_state2, ap_predicate_op54_write_state2, ap_predicate_op55_write_state2)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op26_read_state1 = ap_const_boolean_1) and (rxEng_optionalFieldsFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op24_read_state1 = ap_const_boolean_1) and (rxEng_dataOffsetFifo_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op54_write_state2 = ap_const_boolean_1) and (rxEng_winScaleFifo_full_n = ap_const_logic_0)) or ((ap_predicate_op53_write_state2 = ap_const_boolean_1) and (rxEng_winScaleFifo_full_n = ap_const_logic_0)) or ((rxEng_winScaleFifo_full_n = ap_const_logic_0) and (ap_predicate_op55_write_state2 = ap_const_boolean_1)))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, rxEng_dataOffsetFifo_empty_n, ap_predicate_op24_read_state1, rxEng_optionalFieldsFifo_empty_n, ap_predicate_op26_read_state1, ap_done_reg, rxEng_winScaleFifo_full_n, ap_predicate_op53_write_state2, ap_predicate_op54_write_state2, ap_predicate_op55_write_state2)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op26_read_state1 = ap_const_boolean_1) and (rxEng_optionalFieldsFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op24_read_state1 = ap_const_boolean_1) and (rxEng_dataOffsetFifo_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op54_write_state2 = ap_const_boolean_1) and (rxEng_winScaleFifo_full_n = ap_const_logic_0)) or ((ap_predicate_op53_write_state2 = ap_const_boolean_1) and (rxEng_winScaleFifo_full_n = ap_const_logic_0)) or ((rxEng_winScaleFifo_full_n = ap_const_logic_0) and (ap_predicate_op55_write_state2 = ap_const_boolean_1)))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, rxEng_dataOffsetFifo_empty_n, ap_predicate_op24_read_state1, rxEng_optionalFieldsFifo_empty_n, ap_predicate_op26_read_state1, ap_done_reg, rxEng_winScaleFifo_full_n, ap_predicate_op53_write_state2, ap_predicate_op54_write_state2, ap_predicate_op55_write_state2)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op26_read_state1 = ap_const_boolean_1) and (rxEng_optionalFieldsFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op24_read_state1 = ap_const_boolean_1) and (rxEng_dataOffsetFifo_empty_n = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((ap_predicate_op54_write_state2 = ap_const_boolean_1) and (rxEng_winScaleFifo_full_n = ap_const_logic_0)) or ((ap_predicate_op53_write_state2 = ap_const_boolean_1) and (rxEng_winScaleFifo_full_n = ap_const_logic_0)) or ((rxEng_winScaleFifo_full_n = ap_const_logic_0) and (ap_predicate_op55_write_state2 = ap_const_boolean_1)))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(rxEng_dataOffsetFifo_empty_n, ap_predicate_op24_read_state1, rxEng_optionalFieldsFifo_empty_n, ap_predicate_op26_read_state1, ap_done_reg)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_done_reg = ap_const_logic_1) or ((ap_predicate_op26_read_state1 = ap_const_boolean_1) and (rxEng_optionalFieldsFifo_empty_n = ap_const_logic_0)) or ((ap_predicate_op24_read_state1 = ap_const_boolean_1) and (rxEng_dataOffsetFifo_empty_n = ap_const_logic_0)));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(rxEng_winScaleFifo_full_n, ap_predicate_op53_write_state2, ap_predicate_op54_write_state2, ap_predicate_op55_write_state2)
    begin
                ap_block_state2_pp0_stage0_iter1 <= (((ap_predicate_op54_write_state2 = ap_const_boolean_1) and (rxEng_winScaleFifo_full_n = ap_const_logic_0)) or ((ap_predicate_op53_write_state2 = ap_const_boolean_1) and (rxEng_winScaleFifo_full_n = ap_const_logic_0)) or ((rxEng_winScaleFifo_full_n = ap_const_logic_0) and (ap_predicate_op55_write_state2 = ap_const_boolean_1)));
    end process;


    ap_condition_168_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
                ap_condition_168 <= ((ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001));
    end process;


    ap_condition_46_assign_proc : process(tmp_i_nbreadreq_fu_64_p3, tmp_465_i_nbreadreq_fu_72_p3, state_4)
    begin
                ap_condition_46 <= ((tmp_465_i_nbreadreq_fu_72_p3 = ap_const_lv1_1) and (tmp_i_nbreadreq_fu_64_p3 = ap_const_lv1_1) and (state_4 = ap_const_lv1_0));
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


    ap_phi_mux_optionLength_V_1_phi_fu_103_p8_assign_proc : process(state_4_load_load_fu_114_p1, fields_V, optionKind_fu_144_p1, ap_phi_reg_pp0_iter0_optionLength_V_1_reg_100)
    begin
        if (((state_4_load_load_fu_114_p1 = ap_const_lv1_1) and (optionKind_fu_144_p1 = ap_const_lv8_1))) then 
            ap_phi_mux_optionLength_V_1_phi_fu_103_p8 <= ap_const_lv8_1;
        elsif (((not((optionKind_fu_144_p1 = ap_const_lv8_1)) and not((optionKind_fu_144_p1 = ap_const_lv8_0)) and not((optionKind_fu_144_p1 = ap_const_lv8_3)) and (state_4_load_load_fu_114_p1 = ap_const_lv1_1)) or ((state_4_load_load_fu_114_p1 = ap_const_lv1_1) and (optionKind_fu_144_p1 = ap_const_lv8_0)) or ((state_4_load_load_fu_114_p1 = ap_const_lv1_1) and (optionKind_fu_144_p1 = ap_const_lv8_3)))) then 
            ap_phi_mux_optionLength_V_1_phi_fu_103_p8 <= fields_V(15 downto 8);
        else 
            ap_phi_mux_optionLength_V_1_phi_fu_103_p8 <= ap_phi_reg_pp0_iter0_optionLength_V_1_reg_100;
        end if; 
    end process;

    ap_phi_reg_pp0_iter0_optionLength_V_1_reg_100 <= "XXXXXXXX";

    ap_predicate_op24_read_state1_assign_proc : process(tmp_i_nbreadreq_fu_64_p3, tmp_465_i_nbreadreq_fu_72_p3, state_4)
    begin
                ap_predicate_op24_read_state1 <= ((tmp_465_i_nbreadreq_fu_72_p3 = ap_const_lv1_1) and (tmp_i_nbreadreq_fu_64_p3 = ap_const_lv1_1) and (state_4 = ap_const_lv1_0));
    end process;


    ap_predicate_op26_read_state1_assign_proc : process(tmp_i_nbreadreq_fu_64_p3, tmp_465_i_nbreadreq_fu_72_p3, state_4)
    begin
                ap_predicate_op26_read_state1 <= ((tmp_465_i_nbreadreq_fu_72_p3 = ap_const_lv1_1) and (tmp_i_nbreadreq_fu_64_p3 = ap_const_lv1_1) and (state_4 = ap_const_lv1_0));
    end process;


    ap_predicate_op53_write_state2_assign_proc : process(state_4_load_reg_239, optionKind_reg_249)
    begin
                ap_predicate_op53_write_state2 <= ((optionKind_reg_249 = ap_const_lv8_3) and (state_4_load_reg_239 = ap_const_lv1_1));
    end process;


    ap_predicate_op54_write_state2_assign_proc : process(state_4_load_reg_239, optionKind_reg_249)
    begin
                ap_predicate_op54_write_state2 <= ((optionKind_reg_249 = ap_const_lv8_0) and (state_4_load_reg_239 = ap_const_lv1_1));
    end process;


    ap_predicate_op55_write_state2_assign_proc : process(state_4_load_reg_239, optionKind_reg_249, icmp_ln1065_reg_258)
    begin
                ap_predicate_op55_write_state2 <= (not((optionKind_reg_249 = ap_const_lv8_1)) and not((optionKind_reg_249 = ap_const_lv8_0)) and not((optionKind_reg_249 = ap_const_lv8_3)) and (icmp_ln1065_reg_258 = ap_const_lv1_1) and (state_4_load_reg_239 = ap_const_lv1_1));
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

    icmp_ln1065_fu_187_p2 <= "1" when (zext_ln1065_fu_183_p1 = optionLength_V_fu_148_p4) else "0";
    optionKind_fu_144_p1 <= fields_V(8 - 1 downto 0);
    optionLength_V_fu_148_p4 <= fields_V(15 downto 8);
    r_V_fu_227_p2 <= std_logic_vector(shift_right(unsigned(fields_V),to_integer(unsigned('0' & zext_ln994_fu_223_p1(31-1 downto 0)))));

    rxEng_dataOffsetFifo_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, rxEng_dataOffsetFifo_empty_n, ap_predicate_op24_read_state1, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_done_reg = ap_const_logic_0) and (ap_predicate_op24_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            rxEng_dataOffsetFifo_blk_n <= rxEng_dataOffsetFifo_empty_n;
        else 
            rxEng_dataOffsetFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    rxEng_dataOffsetFifo_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op24_read_state1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op24_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            rxEng_dataOffsetFifo_read <= ap_const_logic_1;
        else 
            rxEng_dataOffsetFifo_read <= ap_const_logic_0;
        end if; 
    end process;


    rxEng_optionalFieldsFifo_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, rxEng_optionalFieldsFifo_empty_n, ap_predicate_op26_read_state1, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_done_reg = ap_const_logic_0) and (ap_predicate_op26_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            rxEng_optionalFieldsFifo_blk_n <= rxEng_optionalFieldsFifo_empty_n;
        else 
            rxEng_optionalFieldsFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    rxEng_optionalFieldsFifo_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_predicate_op26_read_state1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_predicate_op26_read_state1 = ap_const_boolean_1) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then 
            rxEng_optionalFieldsFifo_read <= ap_const_logic_1;
        else 
            rxEng_optionalFieldsFifo_read <= ap_const_logic_0;
        end if; 
    end process;


    rxEng_winScaleFifo_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, rxEng_winScaleFifo_full_n, ap_predicate_op53_write_state2, ap_predicate_op54_write_state2, ap_predicate_op55_write_state2, ap_block_pp0_stage0)
    begin
        if ((((ap_predicate_op54_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((ap_predicate_op53_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_predicate_op55_write_state2 = ap_const_boolean_1)))) then 
            rxEng_winScaleFifo_blk_n <= rxEng_winScaleFifo_full_n;
        else 
            rxEng_winScaleFifo_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    rxEng_winScaleFifo_din_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op53_write_state2, ap_predicate_op54_write_state2, ap_predicate_op55_write_state2, p_036_reg_253, ap_block_pp0_stage0_01001)
    begin
        if ((((ap_predicate_op54_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_predicate_op55_write_state2 = ap_const_boolean_1)))) then 
            rxEng_winScaleFifo_din <= ap_const_lv4_0;
        elsif (((ap_predicate_op53_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_01001))) then 
            rxEng_winScaleFifo_din <= p_036_reg_253;
        else 
            rxEng_winScaleFifo_din <= "XXXX";
        end if; 
    end process;


    rxEng_winScaleFifo_write_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_predicate_op53_write_state2, ap_predicate_op54_write_state2, ap_predicate_op55_write_state2, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_predicate_op54_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_predicate_op53_write_state2 = ap_const_boolean_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001)) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_predicate_op55_write_state2 = ap_const_boolean_1)))) then 
            rxEng_winScaleFifo_write <= ap_const_logic_1;
        else 
            rxEng_winScaleFifo_write <= ap_const_logic_0;
        end if; 
    end process;

    shl_ln_fu_215_p3 <= (ap_phi_mux_optionLength_V_1_phi_fu_103_p8 & ap_const_lv3_0);
    state_4_load_load_fu_114_p1 <= state_4;
    sub_ln887_fu_203_p2 <= std_logic_vector(unsigned(dataOffset_V_1) - unsigned(trunc_ln887_fu_199_p1));
    tmp_465_i_nbreadreq_fu_72_p3 <= (0=>(rxEng_optionalFieldsFifo_empty_n), others=>'-');
    tmp_i_nbreadreq_fu_64_p3 <= (0=>(rxEng_dataOffsetFifo_empty_n), others=>'-');
    trunc_ln887_fu_199_p1 <= ap_phi_mux_optionLength_V_1_phi_fu_103_p8(4 - 1 downto 0);
    zext_ln1065_fu_183_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(dataOffset_V_1),8));
    zext_ln994_fu_223_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(shl_ln_fu_215_p3),320));
end behav;
