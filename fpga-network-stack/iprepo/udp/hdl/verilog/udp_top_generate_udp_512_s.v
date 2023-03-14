// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module udp_top_generate_udp_512_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        tx_shift2udpFifo_dout,
        tx_shift2udpFifo_num_data_valid,
        tx_shift2udpFifo_fifo_cap,
        tx_shift2udpFifo_empty_n,
        tx_shift2udpFifo_read,
        tx_udpMetaFifo_dout,
        tx_udpMetaFifo_num_data_valid,
        tx_udpMetaFifo_fifo_cap,
        tx_udpMetaFifo_empty_n,
        tx_udpMetaFifo_read,
        m_axis_tx_data_internal_din,
        m_axis_tx_data_internal_num_data_valid,
        m_axis_tx_data_internal_fifo_cap,
        m_axis_tx_data_internal_full_n,
        m_axis_tx_data_internal_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;
parameter    ap_const_lv512_lc_2 = 512'd0;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [1023:0] tx_shift2udpFifo_dout;
input  [1:0] tx_shift2udpFifo_num_data_valid;
input  [1:0] tx_shift2udpFifo_fifo_cap;
input   tx_shift2udpFifo_empty_n;
output   tx_shift2udpFifo_read;
input  [63:0] tx_udpMetaFifo_dout;
input  [1:0] tx_udpMetaFifo_num_data_valid;
input  [1:0] tx_udpMetaFifo_fifo_cap;
input   tx_udpMetaFifo_empty_n;
output   tx_udpMetaFifo_read;
output  [1023:0] m_axis_tx_data_internal_din;
input  [1:0] m_axis_tx_data_internal_num_data_valid;
input  [1:0] m_axis_tx_data_internal_fifo_cap;
input   m_axis_tx_data_internal_full_n;
output   m_axis_tx_data_internal_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg tx_shift2udpFifo_read;
reg tx_udpMetaFifo_read;
reg[1023:0] m_axis_tx_data_internal_din;
reg m_axis_tx_data_internal_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [1:0] state_load_load_fu_170_p1;
wire   [0:0] grp_nbreadreq_fu_102_p3;
reg    ap_predicate_op22_read_state1;
reg    ap_predicate_op47_read_state1;
wire   [0:0] tmp_i_nbreadreq_fu_116_p3;
reg    ap_predicate_op56_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [1:0] state_load_reg_454;
reg   [0:0] tmp_i_43_reg_458;
reg    ap_predicate_op77_write_state2;
reg   [0:0] tmp_8_i_reg_488;
reg    ap_predicate_op85_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [1:0] state;
reg   [15:0] header_idx;
reg   [63:0] header_header_V;
reg    tx_udpMetaFifo_blk_n;
wire    ap_block_pp0_stage0;
reg    m_axis_tx_data_internal_blk_n;
reg    tx_shift2udpFifo_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [511:0] currWord_data_V_fu_183_p1;
wire   [511:0] p_Result_18_fu_201_p5;
wire   [0:0] icmp_ln82_1_fu_195_p2;
reg   [64:0] tmp_reg_475;
wire   [511:0] p_Result_17_fu_263_p5;
wire   [0:0] icmp_ln82_fu_257_p2;
reg   [1023:0] tx_shift2udpFifo_read_reg_492;
wire   [511:0] ap_phi_reg_pp0_iter0_currWord_data_V_3_reg_137;
reg   [511:0] ap_phi_reg_pp0_iter1_currWord_data_V_3_reg_137;
wire   [511:0] ap_phi_reg_pp0_iter0_currWord_data_V_1_reg_146;
reg   [511:0] ap_phi_reg_pp0_iter1_currWord_data_V_1_reg_146;
wire   [1:0] select_ln132_cast_i_fu_235_p3;
wire   [0:0] grp_fu_157_p3;
wire   [15:0] grp_fu_165_p2;
wire   [63:0] p_Result_s_fu_401_p5;
wire   [1023:0] zext_ln174_3_fu_432_p1;
reg    ap_block_pp0_stage0_01001;
wire   [1023:0] zext_ln174_fu_449_p1;
wire   [18:0] tmp_10_fu_187_p3;
wire   [0:0] xor_ln132_fu_229_p2;
wire   [18:0] tmp_6_fu_249_p3;
wire   [7:0] trunc_ln674_fu_309_p1;
wire   [7:0] tmp_9_i_fu_299_p4;
wire   [15:0] p_Result_12_fu_313_p3;
wire   [7:0] tmp_12_i_fu_343_p4;
wire   [7:0] tmp_11_i9_fu_333_p4;
wire   [63:0] p_Result_13_fu_321_p5;
wire   [15:0] p_Result_14_fu_353_p3;
wire   [7:0] tmp_14_i_fu_383_p4;
wire   [7:0] tmp_13_i_fu_373_p4;
wire   [63:0] p_Result_15_fu_361_p5;
wire   [15:0] p_Result_16_fu_393_p3;
wire   [576:0] tmp_9_fu_425_p3;
wire   [512:0] or_ln_fu_437_p3;
wire  signed [543:0] sext_ln174_fu_445_p1;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_150;
reg    ap_condition_159;
reg    ap_condition_181;
reg    ap_condition_215;
reg    ap_condition_193;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 state = 2'd0;
#0 header_idx = 16'd0;
#0 header_header_V = 64'd0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_start;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_150)) begin
        if (((state_load_load_fu_170_p1 == 2'd1) & (icmp_ln82_fu_257_p2 == 1'd1))) begin
            ap_phi_reg_pp0_iter1_currWord_data_V_1_reg_146 <= p_Result_17_fu_263_p5;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter1_currWord_data_V_1_reg_146 <= ap_phi_reg_pp0_iter0_currWord_data_V_1_reg_146;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_150)) begin
        if ((1'b1 == ap_condition_181)) begin
            ap_phi_reg_pp0_iter1_currWord_data_V_3_reg_137 <= currWord_data_V_fu_183_p1;
        end else if ((1'b1 == ap_condition_159)) begin
            ap_phi_reg_pp0_iter1_currWord_data_V_3_reg_137 <= p_Result_18_fu_201_p5;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter1_currWord_data_V_3_reg_137 <= ap_phi_reg_pp0_iter0_currWord_data_V_3_reg_137;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_116_p3 == 1'd1) & (state == 2'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        header_idx <= 16'd0;
    end else if ((((grp_nbreadreq_fu_102_p3 == 1'd1) & (state == 2'd2) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln82_1_fu_195_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((state_load_load_fu_170_p1 == 2'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln82_fu_257_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        header_idx <= grp_fu_165_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_150)) begin
        if (((tmp_i_nbreadreq_fu_116_p3 == 1'd1) & (state == 2'd0))) begin
            state <= 2'd2;
        end else if ((1'b1 == ap_condition_193)) begin
            state <= 2'd0;
        end else if ((state_load_load_fu_170_p1 == 2'd1)) begin
            state <= 2'd2;
        end else if (((grp_nbreadreq_fu_102_p3 == 1'd1) & (state == 2'd2))) begin
            state <= select_ln132_cast_i_fu_235_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_116_p3 == 1'd1) & (state == 2'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        header_header_V <= p_Result_s_fu_401_p5;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        state_load_reg_454 <= state;
    end
end

always @ (posedge ap_clk) begin
    if (((state == 2'd3) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_8_i_reg_488 <= grp_nbreadreq_fu_102_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((state == 2'd2) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_43_reg_458 <= grp_nbreadreq_fu_102_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_nbreadreq_fu_102_p3 == 1'd1) & (state == 2'd2) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_reg_475 <= {{tx_shift2udpFifo_dout[576:512]}};
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op47_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tx_shift2udpFifo_read_reg_492 <= tx_shift2udpFifo_dout;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((ap_enable_reg_pp0_iter0 == 1'b0)) begin
        ap_idle_pp0_0to0 = 1'b1;
    end else begin
        ap_idle_pp0_0to0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0_0to0 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((((state_load_reg_454 == 2'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_predicate_op77_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_predicate_op85_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        m_axis_tx_data_internal_blk_n = m_axis_tx_data_internal_full_n;
    end else begin
        m_axis_tx_data_internal_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_215)) begin
        if ((ap_predicate_op85_write_state2 == 1'b1)) begin
            m_axis_tx_data_internal_din = tx_shift2udpFifo_read_reg_492;
        end else if ((state_load_reg_454 == 2'd1)) begin
            m_axis_tx_data_internal_din = zext_ln174_fu_449_p1;
        end else if ((ap_predicate_op77_write_state2 == 1'b1)) begin
            m_axis_tx_data_internal_din = zext_ln174_3_fu_432_p1;
        end else begin
            m_axis_tx_data_internal_din = 'bx;
        end
    end else begin
        m_axis_tx_data_internal_din = 'bx;
    end
end

always @ (*) begin
    if ((((state_load_reg_454 == 2'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op77_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op85_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        m_axis_tx_data_internal_write = 1'b1;
    end else begin
        m_axis_tx_data_internal_write = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_done_reg == 1'b0) & (ap_predicate_op47_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_done_reg == 1'b0) & (ap_predicate_op22_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        tx_shift2udpFifo_blk_n = tx_shift2udpFifo_empty_n;
    end else begin
        tx_shift2udpFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_predicate_op47_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op22_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        tx_shift2udpFifo_read = 1'b1;
    end else begin
        tx_shift2udpFifo_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op56_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        tx_udpMetaFifo_blk_n = tx_udpMetaFifo_empty_n;
    end else begin
        tx_udpMetaFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op56_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tx_udpMetaFifo_read = 1'b1;
    end else begin
        tx_udpMetaFifo_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op56_read_state1 == 1'b1) & (tx_udpMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op47_read_state1 == 1'b1) & (tx_shift2udpFifo_empty_n == 1'b0)) | ((ap_predicate_op22_read_state1 == 1'b1) & (tx_shift2udpFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((state_load_reg_454 == 2'd1) & (m_axis_tx_data_internal_full_n == 1'b0)) | ((ap_predicate_op77_write_state2 == 1'b1) & (m_axis_tx_data_internal_full_n == 1'b0)) | ((ap_predicate_op85_write_state2 == 1'b1) & (m_axis_tx_data_internal_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op56_read_state1 == 1'b1) & (tx_udpMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op47_read_state1 == 1'b1) & (tx_shift2udpFifo_empty_n == 1'b0)) | ((ap_predicate_op22_read_state1 == 1'b1) & (tx_shift2udpFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((state_load_reg_454 == 2'd1) & (m_axis_tx_data_internal_full_n == 1'b0)) | ((ap_predicate_op77_write_state2 == 1'b1) & (m_axis_tx_data_internal_full_n == 1'b0)) | ((ap_predicate_op85_write_state2 == 1'b1) & (m_axis_tx_data_internal_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op56_read_state1 == 1'b1) & (tx_udpMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op47_read_state1 == 1'b1) & (tx_shift2udpFifo_empty_n == 1'b0)) | ((ap_predicate_op22_read_state1 == 1'b1) & (tx_shift2udpFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((state_load_reg_454 == 2'd1) & (m_axis_tx_data_internal_full_n == 1'b0)) | ((ap_predicate_op77_write_state2 == 1'b1) & (m_axis_tx_data_internal_full_n == 1'b0)) | ((ap_predicate_op85_write_state2 == 1'b1) & (m_axis_tx_data_internal_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((ap_predicate_op56_read_state1 == 1'b1) & (tx_udpMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op47_read_state1 == 1'b1) & (tx_shift2udpFifo_empty_n == 1'b0)) | ((ap_predicate_op22_read_state1 == 1'b1) & (tx_shift2udpFifo_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((state_load_reg_454 == 2'd1) & (m_axis_tx_data_internal_full_n == 1'b0)) | ((ap_predicate_op77_write_state2 == 1'b1) & (m_axis_tx_data_internal_full_n == 1'b0)) | ((ap_predicate_op85_write_state2 == 1'b1) & (m_axis_tx_data_internal_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_150 = ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

always @ (*) begin
    ap_condition_159 = ((grp_nbreadreq_fu_102_p3 == 1'd1) & (state == 2'd2) & (icmp_ln82_1_fu_195_p2 == 1'd1));
end

always @ (*) begin
    ap_condition_181 = ((grp_nbreadreq_fu_102_p3 == 1'd1) & (state == 2'd2) & (icmp_ln82_1_fu_195_p2 == 1'd0));
end

always @ (*) begin
    ap_condition_193 = ((grp_nbreadreq_fu_102_p3 == 1'd1) & (state == 2'd3) & (grp_fu_157_p3 == 1'd1));
end

always @ (*) begin
    ap_condition_215 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_01001));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_currWord_data_V_1_reg_146 = 'bx;

assign ap_phi_reg_pp0_iter0_currWord_data_V_3_reg_137 = 'bx;

always @ (*) begin
    ap_predicate_op22_read_state1 = ((grp_nbreadreq_fu_102_p3 == 1'd1) & (state == 2'd2));
end

always @ (*) begin
    ap_predicate_op47_read_state1 = ((grp_nbreadreq_fu_102_p3 == 1'd1) & (state == 2'd3));
end

always @ (*) begin
    ap_predicate_op56_read_state1 = ((tmp_i_nbreadreq_fu_116_p3 == 1'd1) & (state == 2'd0));
end

always @ (*) begin
    ap_predicate_op77_write_state2 = ((tmp_i_43_reg_458 == 1'd1) & (state_load_reg_454 == 2'd2));
end

always @ (*) begin
    ap_predicate_op85_write_state2 = ((tmp_8_i_reg_488 == 1'd1) & (state_load_reg_454 == 2'd3));
end

assign currWord_data_V_fu_183_p1 = tx_shift2udpFifo_dout[511:0];

assign grp_fu_157_p3 = tx_shift2udpFifo_dout[1024'd576];

assign grp_fu_165_p2 = (header_idx + 16'd1);

assign grp_nbreadreq_fu_102_p3 = tx_shift2udpFifo_empty_n;

assign icmp_ln82_1_fu_195_p2 = ((tmp_10_fu_187_p3 == 19'd0) ? 1'b1 : 1'b0);

assign icmp_ln82_fu_257_p2 = ((tmp_6_fu_249_p3 == 19'd0) ? 1'b1 : 1'b0);

assign or_ln_fu_437_p3 = {{1'd1}, {ap_phi_reg_pp0_iter1_currWord_data_V_1_reg_146}};

assign p_Result_12_fu_313_p3 = {{trunc_ln674_fu_309_p1}, {tmp_9_i_fu_299_p4}};

assign p_Result_13_fu_321_p5 = {{header_header_V[63:32]}, {p_Result_12_fu_313_p3}, {header_header_V[15:0]}};

assign p_Result_14_fu_353_p3 = {{tmp_12_i_fu_343_p4}, {tmp_11_i9_fu_333_p4}};

assign p_Result_15_fu_361_p5 = {{p_Result_13_fu_321_p5[63:16]}, {p_Result_14_fu_353_p3}};

assign p_Result_16_fu_393_p3 = {{tmp_14_i_fu_383_p4}, {tmp_13_i_fu_373_p4}};

assign p_Result_17_fu_263_p5 = {{ap_const_lv512_lc_2[511:64]}, {header_header_V}};

assign p_Result_18_fu_201_p5 = {{currWord_data_V_fu_183_p1[511:64]}, {header_header_V}};

assign p_Result_s_fu_401_p5 = {{p_Result_15_fu_361_p5[63:48]}, {p_Result_16_fu_393_p3}, {p_Result_15_fu_361_p5[31:0]}};

assign select_ln132_cast_i_fu_235_p3 = ((xor_ln132_fu_229_p2[0:0] == 1'b1) ? 2'd3 : 2'd0);

assign sext_ln174_fu_445_p1 = $signed(or_ln_fu_437_p3);

assign state_load_load_fu_170_p1 = state;

assign tmp_10_fu_187_p3 = {{header_idx}, {3'd0}};

assign tmp_11_i9_fu_333_p4 = {{tx_udpMetaFifo_dout[31:24]}};

assign tmp_12_i_fu_343_p4 = {{tx_udpMetaFifo_dout[23:16]}};

assign tmp_13_i_fu_373_p4 = {{tx_udpMetaFifo_dout[47:40]}};

assign tmp_14_i_fu_383_p4 = {{tx_udpMetaFifo_dout[39:32]}};

assign tmp_6_fu_249_p3 = {{header_idx}, {3'd0}};

assign tmp_9_fu_425_p3 = {{tmp_reg_475}, {ap_phi_reg_pp0_iter1_currWord_data_V_3_reg_137}};

assign tmp_9_i_fu_299_p4 = {{tx_udpMetaFifo_dout[15:8]}};

assign tmp_i_nbreadreq_fu_116_p3 = tx_udpMetaFifo_empty_n;

assign trunc_ln674_fu_309_p1 = tx_udpMetaFifo_dout[7:0];

assign xor_ln132_fu_229_p2 = (grp_fu_157_p3 ^ 1'd1);

assign zext_ln174_3_fu_432_p1 = tmp_9_fu_425_p3;

assign zext_ln174_fu_449_p1 = $unsigned(sext_ln174_fu_445_p1);

endmodule //udp_top_generate_udp_512_s
