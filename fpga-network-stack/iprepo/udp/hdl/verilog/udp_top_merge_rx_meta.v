// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module udp_top_merge_rx_meta (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        s_axis_rx_meta_TVALID,
        rx_udpMetaFifo_dout,
        rx_udpMetaFifo_num_data_valid,
        rx_udpMetaFifo_fifo_cap,
        rx_udpMetaFifo_empty_n,
        rx_udpMetaFifo_read,
        m_axis_rx_meta_TREADY,
        s_axis_rx_meta_TDATA,
        s_axis_rx_meta_TREADY,
        m_axis_rx_meta_TDATA,
        m_axis_rx_meta_TVALID
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input   s_axis_rx_meta_TVALID;
input  [48:0] rx_udpMetaFifo_dout;
input  [1:0] rx_udpMetaFifo_num_data_valid;
input  [1:0] rx_udpMetaFifo_fifo_cap;
input   rx_udpMetaFifo_empty_n;
output   rx_udpMetaFifo_read;
input   m_axis_rx_meta_TREADY;
input  [47:0] s_axis_rx_meta_TDATA;
output   s_axis_rx_meta_TREADY;
output  [175:0] m_axis_rx_meta_TDATA;
output   m_axis_rx_meta_TVALID;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rx_udpMetaFifo_read;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire   [0:0] tmp_i_nbreadreq_fu_42_p3;
wire   [0:0] tmp_i_42_nbreadreq_fu_50_p3;
reg    ap_predicate_op15_read_state1;
reg    ap_predicate_op17_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] tmp_i_reg_102;
reg   [0:0] tmp_i_42_reg_106;
reg   [0:0] meta1_valid_reg_115;
reg    ap_predicate_op23_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_state2_io;
reg   [0:0] tmp_i_reg_102_pp0_iter1_reg;
reg   [0:0] tmp_i_42_reg_106_pp0_iter1_reg;
reg   [0:0] meta1_valid_reg_115_pp0_iter1_reg;
reg    ap_predicate_op24_write_state3;
wire    regslice_both_m_axis_rx_meta_U_apdone_blk;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_state3_io;
reg    ap_block_pp0_stage0_subdone;
reg    s_axis_rx_meta_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    m_axis_rx_meta_TDATA_blk_n;
reg    rx_udpMetaFifo_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [31:0] meta0_their_address_V_fu_77_p1;
reg   [31:0] meta0_their_address_V_reg_110;
wire   [0:0] meta1_valid_fu_81_p3;
wire   [47:0] trunc_ln174_fu_89_p1;
reg   [47:0] trunc_ln174_reg_119;
reg    ap_block_pp0_stage0_01001;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to1;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
wire    regslice_both_s_axis_rx_meta_U_apdone_blk;
wire   [47:0] s_axis_rx_meta_TDATA_int_regslice;
wire    s_axis_rx_meta_TVALID_int_regslice;
reg    s_axis_rx_meta_TREADY_int_regslice;
wire    regslice_both_s_axis_rx_meta_U_ack_in;
wire   [175:0] m_axis_rx_meta_TDATA_int_regslice;
reg    m_axis_rx_meta_TVALID_int_regslice;
wire    m_axis_rx_meta_TREADY_int_regslice;
wire    regslice_both_m_axis_rx_meta_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
end

udp_top_regslice_both #(
    .DataWidth( 48 ))
regslice_both_s_axis_rx_meta_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_rx_meta_TDATA),
    .vld_in(s_axis_rx_meta_TVALID),
    .ack_in(regslice_both_s_axis_rx_meta_U_ack_in),
    .data_out(s_axis_rx_meta_TDATA_int_regslice),
    .vld_out(s_axis_rx_meta_TVALID_int_regslice),
    .ack_out(s_axis_rx_meta_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_rx_meta_U_apdone_blk)
);

udp_top_regslice_both #(
    .DataWidth( 176 ))
regslice_both_m_axis_rx_meta_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(m_axis_rx_meta_TDATA_int_regslice),
    .vld_in(m_axis_rx_meta_TVALID_int_regslice),
    .ack_in(m_axis_rx_meta_TREADY_int_regslice),
    .data_out(m_axis_rx_meta_TDATA),
    .vld_out(regslice_both_m_axis_rx_meta_U_vld_out),
    .ack_out(m_axis_rx_meta_TREADY),
    .apdone_blk(regslice_both_m_axis_rx_meta_U_apdone_blk)
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
        end else if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_42_nbreadreq_fu_50_p3 == 1'd1) & (tmp_i_nbreadreq_fu_42_p3 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        meta0_their_address_V_reg_110 <= meta0_their_address_V_fu_77_p1;
        meta1_valid_reg_115 <= rx_udpMetaFifo_dout[32'd48];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        meta1_valid_reg_115_pp0_iter1_reg <= meta1_valid_reg_115;
        tmp_i_42_reg_106_pp0_iter1_reg <= tmp_i_42_reg_106;
        tmp_i_reg_102 <= tmp_i_nbreadreq_fu_42_p3;
        tmp_i_reg_102_pp0_iter1_reg <= tmp_i_reg_102;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_42_p3 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_42_reg_106 <= tmp_i_42_nbreadreq_fu_50_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_42_nbreadreq_fu_50_p3 == 1'd1) & (tmp_i_nbreadreq_fu_42_p3 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (meta1_valid_fu_81_p3 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        trunc_ln174_reg_119 <= trunc_ln174_fu_89_p1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0_0to1 = 1'b1;
    end else begin
        ap_idle_pp0_0to1 = 1'b0;
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
    if (((ap_start == 1'b0) & (ap_idle_pp0_0to1 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_predicate_op24_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((ap_predicate_op23_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        m_axis_rx_meta_TDATA_blk_n = m_axis_rx_meta_TREADY_int_regslice;
    end else begin
        m_axis_rx_meta_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op23_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axis_rx_meta_TVALID_int_regslice = 1'b1;
    end else begin
        m_axis_rx_meta_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op17_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        rx_udpMetaFifo_blk_n = rx_udpMetaFifo_empty_n;
    end else begin
        rx_udpMetaFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op17_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rx_udpMetaFifo_read = 1'b1;
    end else begin
        rx_udpMetaFifo_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op15_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        s_axis_rx_meta_TDATA_blk_n = s_axis_rx_meta_TVALID_int_regslice;
    end else begin
        s_axis_rx_meta_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op15_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        s_axis_rx_meta_TREADY_int_regslice = 1'b1;
    end else begin
        s_axis_rx_meta_TREADY_int_regslice = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter2 == 1'b1) & ((regslice_both_m_axis_rx_meta_U_apdone_blk == 1'b1) | ((ap_predicate_op24_write_state3 == 1'b1) & (m_axis_rx_meta_TREADY_int_regslice == 1'b0)))) | ((ap_predicate_op23_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (m_axis_rx_meta_TREADY_int_regslice == 1'b0)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op17_read_state1 == 1'b1) & (rx_udpMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op15_read_state1 == 1'b1) & (s_axis_rx_meta_TVALID_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter2 == 1'b1) & ((regslice_both_m_axis_rx_meta_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state3_io) | ((ap_predicate_op24_write_state3 == 1'b1) & (m_axis_rx_meta_TREADY_int_regslice == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((ap_predicate_op23_write_state2 == 1'b1) & (m_axis_rx_meta_TREADY_int_regslice == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op17_read_state1 == 1'b1) & (rx_udpMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op15_read_state1 == 1'b1) & (s_axis_rx_meta_TVALID_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter2 == 1'b1) & ((regslice_both_m_axis_rx_meta_U_apdone_blk == 1'b1) | (1'b1 == ap_block_state3_io) | ((ap_predicate_op24_write_state3 == 1'b1) & (m_axis_rx_meta_TREADY_int_regslice == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((ap_predicate_op23_write_state2 == 1'b1) & (m_axis_rx_meta_TREADY_int_regslice == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op17_read_state1 == 1'b1) & (rx_udpMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op15_read_state1 == 1'b1) & (s_axis_rx_meta_TVALID_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((ap_predicate_op17_read_state1 == 1'b1) & (rx_udpMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op15_read_state1 == 1'b1) & (s_axis_rx_meta_TVALID_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state2_io = ((ap_predicate_op23_write_state2 == 1'b1) & (m_axis_rx_meta_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((ap_predicate_op23_write_state2 == 1'b1) & (m_axis_rx_meta_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state3_io = ((ap_predicate_op24_write_state3 == 1'b1) & (m_axis_rx_meta_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = ((regslice_both_m_axis_rx_meta_U_apdone_blk == 1'b1) | ((ap_predicate_op24_write_state3 == 1'b1) & (m_axis_rx_meta_TREADY_int_regslice == 1'b0)));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_predicate_op15_read_state1 = ((tmp_i_42_nbreadreq_fu_50_p3 == 1'd1) & (tmp_i_nbreadreq_fu_42_p3 == 1'd1));
end

always @ (*) begin
    ap_predicate_op17_read_state1 = ((tmp_i_42_nbreadreq_fu_50_p3 == 1'd1) & (tmp_i_nbreadreq_fu_42_p3 == 1'd1));
end

always @ (*) begin
    ap_predicate_op23_write_state2 = ((meta1_valid_reg_115 == 1'd1) & (tmp_i_42_reg_106 == 1'd1) & (tmp_i_reg_102 == 1'd1));
end

always @ (*) begin
    ap_predicate_op24_write_state3 = ((meta1_valid_reg_115_pp0_iter1_reg == 1'd1) & (tmp_i_42_reg_106_pp0_iter1_reg == 1'd1) & (tmp_i_reg_102_pp0_iter1_reg == 1'd1));
end

assign m_axis_rx_meta_TDATA_int_regslice = {{{trunc_ln174_reg_119}, {96'd0}}, {meta0_their_address_V_reg_110}};

assign m_axis_rx_meta_TVALID = regslice_both_m_axis_rx_meta_U_vld_out;

assign meta0_their_address_V_fu_77_p1 = s_axis_rx_meta_TDATA_int_regslice[31:0];

assign meta1_valid_fu_81_p3 = rx_udpMetaFifo_dout[32'd48];

assign s_axis_rx_meta_TREADY = regslice_both_s_axis_rx_meta_U_ack_in;

assign tmp_i_42_nbreadreq_fu_50_p3 = rx_udpMetaFifo_empty_n;

assign tmp_i_nbreadreq_fu_42_p3 = s_axis_rx_meta_TVALID_int_regslice;

assign trunc_ln174_fu_89_p1 = rx_udpMetaFifo_dout[47:0];

endmodule //udp_top_merge_rx_meta
