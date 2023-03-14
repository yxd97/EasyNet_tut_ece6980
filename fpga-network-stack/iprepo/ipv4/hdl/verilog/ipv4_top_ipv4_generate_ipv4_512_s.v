// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module ipv4_top_ipv4_generate_ipv4_512_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        protocol_dout,
        protocol_num_data_valid,
        protocol_fifo_cap,
        protocol_empty_n,
        protocol_read,
        local_ipv4_address_dout,
        local_ipv4_address_num_data_valid,
        local_ipv4_address_fifo_cap,
        local_ipv4_address_empty_n,
        local_ipv4_address_read,
        tx_shift2ipv4Fifo_dout,
        tx_shift2ipv4Fifo_num_data_valid,
        tx_shift2ipv4Fifo_fifo_cap,
        tx_shift2ipv4Fifo_empty_n,
        tx_shift2ipv4Fifo_read,
        s_axis_tx_meta_TVALID,
        m_axis_tx_data_internal_din,
        m_axis_tx_data_internal_num_data_valid,
        m_axis_tx_data_internal_fifo_cap,
        m_axis_tx_data_internal_full_n,
        m_axis_tx_data_internal_write,
        s_axis_tx_meta_TDATA,
        s_axis_tx_meta_TREADY
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;
parameter    ap_const_lv512_lc_3 = 512'd0;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [7:0] protocol_dout;
input  [2:0] protocol_num_data_valid;
input  [2:0] protocol_fifo_cap;
input   protocol_empty_n;
output   protocol_read;
input  [31:0] local_ipv4_address_dout;
input  [2:0] local_ipv4_address_num_data_valid;
input  [2:0] local_ipv4_address_fifo_cap;
input   local_ipv4_address_empty_n;
output   local_ipv4_address_read;
input  [1023:0] tx_shift2ipv4Fifo_dout;
input  [3:0] tx_shift2ipv4Fifo_num_data_valid;
input  [3:0] tx_shift2ipv4Fifo_fifo_cap;
input   tx_shift2ipv4Fifo_empty_n;
output   tx_shift2ipv4Fifo_read;
input   s_axis_tx_meta_TVALID;
output  [1023:0] m_axis_tx_data_internal_din;
input  [1:0] m_axis_tx_data_internal_num_data_valid;
input  [1:0] m_axis_tx_data_internal_fifo_cap;
input   m_axis_tx_data_internal_full_n;
output   m_axis_tx_data_internal_write;
input  [47:0] s_axis_tx_meta_TDATA;
output   s_axis_tx_meta_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg protocol_read;
reg local_ipv4_address_read;
reg tx_shift2ipv4Fifo_read;
reg[1023:0] m_axis_tx_data_internal_din;
reg m_axis_tx_data_internal_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [1:0] gi_state_load_load_fu_212_p1;
wire   [0:0] grp_nbreadreq_fu_144_p3;
reg    ap_predicate_op23_read_state1;
reg    ap_predicate_op48_read_state1;
wire   [0:0] tmp_i_nbreadreq_fu_158_p3;
reg    ap_predicate_op57_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [1:0] gi_state_load_reg_472;
reg   [0:0] tmp_i_47_reg_476;
reg    ap_predicate_op76_write_state2;
reg   [0:0] tmp_9_i_reg_506;
reg    ap_predicate_op84_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [1:0] gi_state;
reg   [15:0] header_idx_1;
reg   [159:0] header_header_V_1;
reg    s_axis_tx_meta_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    local_ipv4_address_blk_n;
reg    protocol_blk_n;
reg    m_axis_tx_data_internal_blk_n;
reg    tx_shift2ipv4Fifo_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [511:0] currWord_data_V_fu_225_p1;
wire   [511:0] p_Result_13_fu_243_p5;
wire   [0:0] icmp_ln82_1_fu_237_p2;
reg   [64:0] tmp_reg_493;
wire   [511:0] p_Result_12_fu_305_p5;
wire   [0:0] icmp_ln82_fu_299_p2;
reg   [1023:0] tx_shift2ipv4Fifo_read_reg_510;
wire   [511:0] ap_phi_reg_pp0_iter0_currWord_data_V_3_reg_179;
reg   [511:0] ap_phi_reg_pp0_iter1_currWord_data_V_3_reg_179;
wire   [511:0] ap_phi_reg_pp0_iter0_currWord_data_V_1_reg_188;
reg   [511:0] ap_phi_reg_pp0_iter1_currWord_data_V_1_reg_188;
wire   [1:0] select_ln222_cast_i_fu_277_p3;
wire   [0:0] grp_fu_199_p3;
wire   [15:0] grp_fu_207_p2;
wire   [159:0] p_Result_s_fu_419_p5;
wire   [1023:0] zext_ln174_2_fu_450_p1;
reg    ap_block_pp0_stage0_01001;
wire   [1023:0] zext_ln174_fu_467_p1;
wire   [24:0] shl_ln76_1_fu_229_p3;
wire   [0:0] xor_ln222_fu_271_p2;
wire   [24:0] shl_ln_fu_291_p3;
wire   [15:0] meta_length_V_fu_339_p4;
wire   [15:0] len_V_fu_355_p2;
wire   [7:0] trunc_ln674_fu_371_p1;
wire   [7:0] tmp_1_i8_fu_361_p4;
wire   [15:0] p_Result_8_fu_375_p3;
wire   [159:0] p_Result_9_fu_383_p5;
wire   [31:0] meta_their_address_V_fu_335_p1;
wire   [159:0] p_Result_10_fu_395_p5;
wire   [159:0] p_Result_11_fu_407_p5;
wire   [576:0] tmp_2_fu_443_p3;
wire   [512:0] or_ln_fu_455_p3;
wire  signed [543:0] sext_ln174_fu_463_p1;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
wire    regslice_both_s_axis_tx_meta_U_apdone_blk;
wire   [47:0] s_axis_tx_meta_TDATA_int_regslice;
wire    s_axis_tx_meta_TVALID_int_regslice;
reg    s_axis_tx_meta_TREADY_int_regslice;
wire    regslice_both_s_axis_tx_meta_U_ack_in;
reg    ap_condition_166;
reg    ap_condition_175;
reg    ap_condition_197;
reg    ap_condition_209;
reg    ap_condition_233;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 gi_state = 2'd0;
#0 header_idx_1 = 16'd0;
#0 header_header_V_1 = 160'd1180591620717411303493;
end

ipv4_top_regslice_both #(
    .DataWidth( 48 ))
regslice_both_s_axis_tx_meta_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_tx_meta_TDATA),
    .vld_in(s_axis_tx_meta_TVALID),
    .ack_in(regslice_both_s_axis_tx_meta_U_ack_in),
    .data_out(s_axis_tx_meta_TDATA_int_regslice),
    .vld_out(s_axis_tx_meta_TVALID_int_regslice),
    .ack_out(s_axis_tx_meta_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_tx_meta_U_apdone_blk)
);

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
    if ((1'b1 == ap_condition_166)) begin
        if (((gi_state_load_load_fu_212_p1 == 2'd1) & (icmp_ln82_fu_299_p2 == 1'd1))) begin
            ap_phi_reg_pp0_iter1_currWord_data_V_1_reg_188 <= p_Result_12_fu_305_p5;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter1_currWord_data_V_1_reg_188 <= ap_phi_reg_pp0_iter0_currWord_data_V_1_reg_188;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_166)) begin
        if ((1'b1 == ap_condition_197)) begin
            ap_phi_reg_pp0_iter1_currWord_data_V_3_reg_179 <= currWord_data_V_fu_225_p1;
        end else if ((1'b1 == ap_condition_175)) begin
            ap_phi_reg_pp0_iter1_currWord_data_V_3_reg_179 <= p_Result_13_fu_243_p5;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter1_currWord_data_V_3_reg_179 <= ap_phi_reg_pp0_iter0_currWord_data_V_3_reg_179;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_166)) begin
        if (((tmp_i_nbreadreq_fu_158_p3 == 1'd1) & (gi_state == 2'd0))) begin
            gi_state <= 2'd2;
        end else if ((1'b1 == ap_condition_209)) begin
            gi_state <= 2'd0;
        end else if ((gi_state_load_load_fu_212_p1 == 2'd1)) begin
            gi_state <= 2'd2;
        end else if (((grp_nbreadreq_fu_144_p3 == 1'd1) & (gi_state == 2'd2))) begin
            gi_state <= select_ln222_cast_i_fu_277_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_158_p3 == 1'd1) & (gi_state == 2'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        header_idx_1 <= 16'd0;
    end else if ((((grp_nbreadreq_fu_144_p3 == 1'd1) & (gi_state == 2'd2) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln82_1_fu_237_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((gi_state_load_load_fu_212_p1 == 2'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln82_fu_299_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        header_idx_1 <= grp_fu_207_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        gi_state_load_reg_472 <= gi_state;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_158_p3 == 1'd1) & (gi_state == 2'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        header_header_V_1 <= p_Result_s_fu_419_p5;
    end
end

always @ (posedge ap_clk) begin
    if (((gi_state == 2'd3) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_9_i_reg_506 <= grp_nbreadreq_fu_144_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((gi_state == 2'd2) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_47_reg_476 <= grp_nbreadreq_fu_144_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_nbreadreq_fu_144_p3 == 1'd1) & (gi_state == 2'd2) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_reg_493 <= {{tx_shift2ipv4Fifo_dout[576:512]}};
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op48_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tx_shift2ipv4Fifo_read_reg_510 <= tx_shift2ipv4Fifo_dout;
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
    if (((ap_done_reg == 1'b0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        local_ipv4_address_blk_n = local_ipv4_address_empty_n;
    end else begin
        local_ipv4_address_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        local_ipv4_address_read = 1'b1;
    end else begin
        local_ipv4_address_read = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op84_write_state2 == 1'b1)) | ((gi_state_load_reg_472 == 2'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_predicate_op76_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        m_axis_tx_data_internal_blk_n = m_axis_tx_data_internal_full_n;
    end else begin
        m_axis_tx_data_internal_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_233)) begin
        if ((ap_predicate_op84_write_state2 == 1'b1)) begin
            m_axis_tx_data_internal_din = tx_shift2ipv4Fifo_read_reg_510;
        end else if ((gi_state_load_reg_472 == 2'd1)) begin
            m_axis_tx_data_internal_din = zext_ln174_fu_467_p1;
        end else if ((ap_predicate_op76_write_state2 == 1'b1)) begin
            m_axis_tx_data_internal_din = zext_ln174_2_fu_450_p1;
        end else begin
            m_axis_tx_data_internal_din = 'bx;
        end
    end else begin
        m_axis_tx_data_internal_din = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op84_write_state2 == 1'b1)) | ((gi_state_load_reg_472 == 2'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op76_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        m_axis_tx_data_internal_write = 1'b1;
    end else begin
        m_axis_tx_data_internal_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        protocol_blk_n = protocol_empty_n;
    end else begin
        protocol_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        protocol_read = 1'b1;
    end else begin
        protocol_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op57_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        s_axis_tx_meta_TDATA_blk_n = s_axis_tx_meta_TVALID_int_regslice;
    end else begin
        s_axis_tx_meta_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op57_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        s_axis_tx_meta_TREADY_int_regslice = 1'b1;
    end else begin
        s_axis_tx_meta_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_done_reg == 1'b0) & (ap_predicate_op48_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_done_reg == 1'b0) & (ap_predicate_op23_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        tx_shift2ipv4Fifo_blk_n = tx_shift2ipv4Fifo_empty_n;
    end else begin
        tx_shift2ipv4Fifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_predicate_op48_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op23_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        tx_shift2ipv4Fifo_read = 1'b1;
    end else begin
        tx_shift2ipv4Fifo_read = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | (local_ipv4_address_empty_n == 1'b0) | (protocol_empty_n == 1'b0) | ((ap_predicate_op57_read_state1 == 1'b1) & (s_axis_tx_meta_TVALID_int_regslice == 1'b0)) | ((ap_predicate_op48_read_state1 == 1'b1) & (tx_shift2ipv4Fifo_empty_n == 1'b0)) | ((ap_predicate_op23_read_state1 == 1'b1) & (tx_shift2ipv4Fifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((m_axis_tx_data_internal_full_n == 1'b0) & (ap_predicate_op84_write_state2 == 1'b1)) | ((gi_state_load_reg_472 == 2'd1) & (m_axis_tx_data_internal_full_n == 1'b0)) | ((ap_predicate_op76_write_state2 == 1'b1) & (m_axis_tx_data_internal_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | (local_ipv4_address_empty_n == 1'b0) | (protocol_empty_n == 1'b0) | ((ap_predicate_op57_read_state1 == 1'b1) & (s_axis_tx_meta_TVALID_int_regslice == 1'b0)) | ((ap_predicate_op48_read_state1 == 1'b1) & (tx_shift2ipv4Fifo_empty_n == 1'b0)) | ((ap_predicate_op23_read_state1 == 1'b1) & (tx_shift2ipv4Fifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((m_axis_tx_data_internal_full_n == 1'b0) & (ap_predicate_op84_write_state2 == 1'b1)) | ((gi_state_load_reg_472 == 2'd1) & (m_axis_tx_data_internal_full_n == 1'b0)) | ((ap_predicate_op76_write_state2 == 1'b1) & (m_axis_tx_data_internal_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | (local_ipv4_address_empty_n == 1'b0) | (protocol_empty_n == 1'b0) | ((ap_predicate_op57_read_state1 == 1'b1) & (s_axis_tx_meta_TVALID_int_regslice == 1'b0)) | ((ap_predicate_op48_read_state1 == 1'b1) & (tx_shift2ipv4Fifo_empty_n == 1'b0)) | ((ap_predicate_op23_read_state1 == 1'b1) & (tx_shift2ipv4Fifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((m_axis_tx_data_internal_full_n == 1'b0) & (ap_predicate_op84_write_state2 == 1'b1)) | ((gi_state_load_reg_472 == 2'd1) & (m_axis_tx_data_internal_full_n == 1'b0)) | ((ap_predicate_op76_write_state2 == 1'b1) & (m_axis_tx_data_internal_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | (local_ipv4_address_empty_n == 1'b0) | (protocol_empty_n == 1'b0) | ((ap_predicate_op57_read_state1 == 1'b1) & (s_axis_tx_meta_TVALID_int_regslice == 1'b0)) | ((ap_predicate_op48_read_state1 == 1'b1) & (tx_shift2ipv4Fifo_empty_n == 1'b0)) | ((ap_predicate_op23_read_state1 == 1'b1) & (tx_shift2ipv4Fifo_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((m_axis_tx_data_internal_full_n == 1'b0) & (ap_predicate_op84_write_state2 == 1'b1)) | ((gi_state_load_reg_472 == 2'd1) & (m_axis_tx_data_internal_full_n == 1'b0)) | ((ap_predicate_op76_write_state2 == 1'b1) & (m_axis_tx_data_internal_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_166 = ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

always @ (*) begin
    ap_condition_175 = ((grp_nbreadreq_fu_144_p3 == 1'd1) & (gi_state == 2'd2) & (icmp_ln82_1_fu_237_p2 == 1'd1));
end

always @ (*) begin
    ap_condition_197 = ((grp_nbreadreq_fu_144_p3 == 1'd1) & (gi_state == 2'd2) & (icmp_ln82_1_fu_237_p2 == 1'd0));
end

always @ (*) begin
    ap_condition_209 = ((grp_nbreadreq_fu_144_p3 == 1'd1) & (gi_state == 2'd3) & (grp_fu_199_p3 == 1'd1));
end

always @ (*) begin
    ap_condition_233 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_01001));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_currWord_data_V_1_reg_188 = 'bx;

assign ap_phi_reg_pp0_iter0_currWord_data_V_3_reg_179 = 'bx;

always @ (*) begin
    ap_predicate_op23_read_state1 = ((grp_nbreadreq_fu_144_p3 == 1'd1) & (gi_state == 2'd2));
end

always @ (*) begin
    ap_predicate_op48_read_state1 = ((grp_nbreadreq_fu_144_p3 == 1'd1) & (gi_state == 2'd3));
end

always @ (*) begin
    ap_predicate_op57_read_state1 = ((tmp_i_nbreadreq_fu_158_p3 == 1'd1) & (gi_state == 2'd0));
end

always @ (*) begin
    ap_predicate_op76_write_state2 = ((tmp_i_47_reg_476 == 1'd1) & (gi_state_load_reg_472 == 2'd2));
end

always @ (*) begin
    ap_predicate_op84_write_state2 = ((gi_state_load_reg_472 == 2'd3) & (tmp_9_i_reg_506 == 1'd1));
end

assign currWord_data_V_fu_225_p1 = tx_shift2ipv4Fifo_dout[511:0];

assign gi_state_load_load_fu_212_p1 = gi_state;

assign grp_fu_199_p3 = tx_shift2ipv4Fifo_dout[1024'd576];

assign grp_fu_207_p2 = (header_idx_1 + 16'd1);

assign grp_nbreadreq_fu_144_p3 = tx_shift2ipv4Fifo_empty_n;

assign icmp_ln82_1_fu_237_p2 = ((shl_ln76_1_fu_229_p3 < 25'd160) ? 1'b1 : 1'b0);

assign icmp_ln82_fu_299_p2 = ((shl_ln_fu_291_p3 < 25'd160) ? 1'b1 : 1'b0);

assign len_V_fu_355_p2 = (meta_length_V_fu_339_p4 + 16'd20);

assign meta_length_V_fu_339_p4 = {{s_axis_tx_meta_TDATA_int_regslice[47:32]}};

assign meta_their_address_V_fu_335_p1 = s_axis_tx_meta_TDATA_int_regslice[31:0];

assign or_ln_fu_455_p3 = {{1'd1}, {ap_phi_reg_pp0_iter1_currWord_data_V_1_reg_188}};

assign p_Result_10_fu_395_p5 = {{meta_their_address_V_fu_335_p1}, {p_Result_9_fu_383_p5[127:0]}};

assign p_Result_11_fu_407_p5 = {{p_Result_10_fu_395_p5[159:128]}, {local_ipv4_address_dout}, {p_Result_10_fu_395_p5[95:0]}};

assign p_Result_12_fu_305_p5 = {{ap_const_lv512_lc_3[511:160]}, {header_header_V_1}};

assign p_Result_13_fu_243_p5 = {{currWord_data_V_fu_225_p1[511:160]}, {header_header_V_1}};

assign p_Result_8_fu_375_p3 = {{trunc_ln674_fu_371_p1}, {tmp_1_i8_fu_361_p4}};

assign p_Result_9_fu_383_p5 = {{header_header_V_1[159:32]}, {p_Result_8_fu_375_p3}, {header_header_V_1[15:0]}};

assign p_Result_s_fu_419_p5 = {{p_Result_11_fu_407_p5[159:80]}, {protocol_dout}, {p_Result_11_fu_407_p5[71:0]}};

assign s_axis_tx_meta_TREADY = regslice_both_s_axis_tx_meta_U_ack_in;

assign select_ln222_cast_i_fu_277_p3 = ((xor_ln222_fu_271_p2[0:0] == 1'b1) ? 2'd3 : 2'd0);

assign sext_ln174_fu_463_p1 = $signed(or_ln_fu_455_p3);

assign shl_ln76_1_fu_229_p3 = {{header_idx_1}, {9'd0}};

assign shl_ln_fu_291_p3 = {{header_idx_1}, {9'd0}};

assign tmp_1_i8_fu_361_p4 = {{len_V_fu_355_p2[15:8]}};

assign tmp_2_fu_443_p3 = {{tmp_reg_493}, {ap_phi_reg_pp0_iter1_currWord_data_V_3_reg_179}};

assign tmp_i_nbreadreq_fu_158_p3 = s_axis_tx_meta_TVALID_int_regslice;

assign trunc_ln674_fu_371_p1 = len_V_fu_355_p2[7:0];

assign xor_ln222_fu_271_p2 = (grp_fu_199_p3 ^ 1'd1);

assign zext_ln174_2_fu_450_p1 = tmp_2_fu_443_p3;

assign zext_ln174_fu_467_p1 = $unsigned(sext_ln174_fu_463_p1);

endmodule //ipv4_top_ipv4_generate_ipv4_512_s
