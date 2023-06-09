// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module iperf_client_server_512_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        s_axis_listen_port_status_TVALID,
        s_axis_notifications_TVALID,
        s_axis_rx_metadata_TVALID,
        rxDataBuffer_dout,
        rxDataBuffer_num_data_valid,
        rxDataBuffer_fifo_cap,
        rxDataBuffer_empty_n,
        rxDataBuffer_read,
        m_axis_listen_port_TREADY,
        m_axis_read_package_TREADY,
        m_axis_listen_port_TDATA,
        m_axis_listen_port_TVALID,
        s_axis_listen_port_status_TDATA,
        s_axis_listen_port_status_TREADY,
        s_axis_notifications_TDATA,
        s_axis_notifications_TREADY,
        m_axis_read_package_TDATA,
        m_axis_read_package_TVALID,
        s_axis_rx_metadata_TDATA,
        s_axis_rx_metadata_TREADY
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input   s_axis_listen_port_status_TVALID;
input   s_axis_notifications_TVALID;
input   s_axis_rx_metadata_TVALID;
input  [1023:0] rxDataBuffer_dout;
input  [9:0] rxDataBuffer_num_data_valid;
input  [9:0] rxDataBuffer_fifo_cap;
input   rxDataBuffer_empty_n;
output   rxDataBuffer_read;
input   m_axis_listen_port_TREADY;
input   m_axis_read_package_TREADY;
output  [15:0] m_axis_listen_port_TDATA;
output   m_axis_listen_port_TVALID;
input  [7:0] s_axis_listen_port_status_TDATA;
output   s_axis_listen_port_status_TREADY;
input  [87:0] s_axis_notifications_TDATA;
output   s_axis_notifications_TREADY;
output  [31:0] m_axis_read_package_TDATA;
output   m_axis_read_package_TVALID;
input  [15:0] s_axis_rx_metadata_TDATA;
output   s_axis_rx_metadata_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rxDataBuffer_read;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire   [0:0] listenState_load_load_fu_155_p1;
wire   [0:0] tmp_i_nbreadreq_fu_76_p3;
reg    ap_predicate_op20_read_state1;
wire   [0:0] tmp_7_i_nbreadreq_fu_90_p3;
wire   [0:0] tmp_3_i_nbreadreq_fu_104_p3;
wire   [0:0] grp_nbreadreq_fu_112_p3;
reg    ap_predicate_op41_read_state1;
reg    ap_predicate_op42_read_state1;
reg    ap_predicate_op51_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] listenState_load_reg_211;
reg   [0:0] tmp_7_i_reg_221;
reg   [0:0] icmp_ln1069_reg_225;
reg    ap_predicate_op59_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_state2_io;
reg   [0:0] listenState_load_reg_211_pp0_iter1_reg;
reg   [0:0] tmp_7_i_reg_221_pp0_iter1_reg;
reg   [0:0] icmp_ln1069_reg_225_pp0_iter1_reg;
reg    ap_predicate_op62_write_state3;
wire    regslice_both_m_axis_listen_port_U_apdone_blk;
wire    regslice_both_m_axis_read_package_U_apdone_blk;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_state3_io;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] listenState;
reg   [0:0] serverFsmState;
reg    m_axis_listen_port_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    s_axis_listen_port_status_TDATA_blk_n;
reg    s_axis_notifications_TDATA_blk_n;
reg    m_axis_read_package_TDATA_blk_n;
reg    s_axis_rx_metadata_TDATA_blk_n;
reg    rxDataBuffer_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln1069_fu_185_p2;
wire   [31:0] trunc_ln174_fu_191_p1;
reg   [31:0] trunc_ln174_reg_229;
wire   [0:0] tmp_fu_165_p1;
wire   [0:0] grp_fu_147_p3;
reg    ap_block_pp0_stage0_01001;
wire   [15:0] tmp_length_V_fu_175_p4;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to1;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    m_axis_listen_port_TVALID_int_regslice;
wire    m_axis_listen_port_TREADY_int_regslice;
wire    regslice_both_m_axis_listen_port_U_vld_out;
wire    regslice_both_s_axis_listen_port_status_U_apdone_blk;
wire   [7:0] s_axis_listen_port_status_TDATA_int_regslice;
wire    s_axis_listen_port_status_TVALID_int_regslice;
reg    s_axis_listen_port_status_TREADY_int_regslice;
wire    regslice_both_s_axis_listen_port_status_U_ack_in;
wire    regslice_both_s_axis_notifications_U_apdone_blk;
wire   [87:0] s_axis_notifications_TDATA_int_regslice;
wire    s_axis_notifications_TVALID_int_regslice;
reg    s_axis_notifications_TREADY_int_regslice;
wire    regslice_both_s_axis_notifications_U_ack_in;
reg    m_axis_read_package_TVALID_int_regslice;
wire    m_axis_read_package_TREADY_int_regslice;
wire    regslice_both_m_axis_read_package_U_vld_out;
wire    regslice_both_s_axis_rx_metadata_U_apdone_blk;
wire   [15:0] s_axis_rx_metadata_TDATA_int_regslice;
wire    s_axis_rx_metadata_TVALID_int_regslice;
reg    s_axis_rx_metadata_TREADY_int_regslice;
wire    regslice_both_s_axis_rx_metadata_U_ack_in;
reg    ap_condition_208;
reg    ap_condition_203;
reg    ap_condition_384;
reg    ap_condition_383;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 listenState = 1'd0;
#0 serverFsmState = 1'd0;
end

iperf_client_regslice_both #(
    .DataWidth( 16 ))
regslice_both_m_axis_listen_port_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(16'd5001),
    .vld_in(m_axis_listen_port_TVALID_int_regslice),
    .ack_in(m_axis_listen_port_TREADY_int_regslice),
    .data_out(m_axis_listen_port_TDATA),
    .vld_out(regslice_both_m_axis_listen_port_U_vld_out),
    .ack_out(m_axis_listen_port_TREADY),
    .apdone_blk(regslice_both_m_axis_listen_port_U_apdone_blk)
);

iperf_client_regslice_both #(
    .DataWidth( 8 ))
regslice_both_s_axis_listen_port_status_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_listen_port_status_TDATA),
    .vld_in(s_axis_listen_port_status_TVALID),
    .ack_in(regslice_both_s_axis_listen_port_status_U_ack_in),
    .data_out(s_axis_listen_port_status_TDATA_int_regslice),
    .vld_out(s_axis_listen_port_status_TVALID_int_regslice),
    .ack_out(s_axis_listen_port_status_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_listen_port_status_U_apdone_blk)
);

iperf_client_regslice_both #(
    .DataWidth( 88 ))
regslice_both_s_axis_notifications_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_notifications_TDATA),
    .vld_in(s_axis_notifications_TVALID),
    .ack_in(regslice_both_s_axis_notifications_U_ack_in),
    .data_out(s_axis_notifications_TDATA_int_regslice),
    .vld_out(s_axis_notifications_TVALID_int_regslice),
    .ack_out(s_axis_notifications_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_notifications_U_apdone_blk)
);

iperf_client_regslice_both #(
    .DataWidth( 32 ))
regslice_both_m_axis_read_package_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(trunc_ln174_reg_229),
    .vld_in(m_axis_read_package_TVALID_int_regslice),
    .ack_in(m_axis_read_package_TREADY_int_regslice),
    .data_out(m_axis_read_package_TDATA),
    .vld_out(regslice_both_m_axis_read_package_U_vld_out),
    .ack_out(m_axis_read_package_TREADY),
    .apdone_blk(regslice_both_m_axis_read_package_U_apdone_blk)
);

iperf_client_regslice_both #(
    .DataWidth( 16 ))
regslice_both_s_axis_rx_metadata_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_rx_metadata_TDATA),
    .vld_in(s_axis_rx_metadata_TVALID),
    .ack_in(regslice_both_s_axis_rx_metadata_U_ack_in),
    .data_out(s_axis_rx_metadata_TDATA_int_regslice),
    .vld_out(s_axis_rx_metadata_TVALID_int_regslice),
    .ack_out(s_axis_rx_metadata_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_rx_metadata_U_apdone_blk)
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
    if (ap_rst == 1'b1) begin
        listenState <= 1'd0;
    end else begin
        if ((1'b1 == ap_condition_203)) begin
            if ((1'b1 == ap_condition_208)) begin
                listenState <= 1'd0;
            end else if ((listenState_load_load_fu_155_p1 == 1'd0)) begin
                listenState <= 1'd1;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_383)) begin
        if (((serverFsmState == 1'd1) & (grp_fu_147_p3 == 1'd1))) begin
            serverFsmState <= 1'd0;
        end else if ((1'b1 == ap_condition_384)) begin
            serverFsmState <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_7_i_nbreadreq_fu_90_p3 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln1069_reg_225 <= icmp_ln1069_fu_185_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln1069_reg_225_pp0_iter1_reg <= icmp_ln1069_reg_225;
        listenState_load_reg_211 <= listenState;
        listenState_load_reg_211_pp0_iter1_reg <= listenState_load_reg_211;
        tmp_7_i_reg_221 <= tmp_7_i_nbreadreq_fu_90_p3;
        tmp_7_i_reg_221_pp0_iter1_reg <= tmp_7_i_reg_221;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_7_i_nbreadreq_fu_90_p3 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln1069_fu_185_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        trunc_ln174_reg_229 <= trunc_ln174_fu_191_p1;
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
    if ((((listenState_load_reg_211 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (listenState_load_reg_211_pp0_iter1_reg == 1'd0)))) begin
        m_axis_listen_port_TDATA_blk_n = m_axis_listen_port_TREADY_int_regslice;
    end else begin
        m_axis_listen_port_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((listenState_load_reg_211 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axis_listen_port_TVALID_int_regslice = 1'b1;
    end else begin
        m_axis_listen_port_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op62_write_state3 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op59_write_state2 == 1'b1)))) begin
        m_axis_read_package_TDATA_blk_n = m_axis_read_package_TREADY_int_regslice;
    end else begin
        m_axis_read_package_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op59_write_state2 == 1'b1))) begin
        m_axis_read_package_TVALID_int_regslice = 1'b1;
    end else begin
        m_axis_read_package_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_done_reg == 1'b0) & (ap_predicate_op51_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_done_reg == 1'b0) & (ap_predicate_op42_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        rxDataBuffer_blk_n = rxDataBuffer_empty_n;
    end else begin
        rxDataBuffer_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_predicate_op51_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op42_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        rxDataBuffer_read = 1'b1;
    end else begin
        rxDataBuffer_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op20_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        s_axis_listen_port_status_TDATA_blk_n = s_axis_listen_port_status_TVALID_int_regslice;
    end else begin
        s_axis_listen_port_status_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op20_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        s_axis_listen_port_status_TREADY_int_regslice = 1'b1;
    end else begin
        s_axis_listen_port_status_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (tmp_7_i_nbreadreq_fu_90_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        s_axis_notifications_TDATA_blk_n = s_axis_notifications_TVALID_int_regslice;
    end else begin
        s_axis_notifications_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_7_i_nbreadreq_fu_90_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        s_axis_notifications_TREADY_int_regslice = 1'b1;
    end else begin
        s_axis_notifications_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op41_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        s_axis_rx_metadata_TDATA_blk_n = s_axis_rx_metadata_TVALID_int_regslice;
    end else begin
        s_axis_rx_metadata_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op41_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        s_axis_rx_metadata_TREADY_int_regslice = 1'b1;
    end else begin
        s_axis_rx_metadata_TREADY_int_regslice = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op51_read_state1 == 1'b1) & (rxDataBuffer_empty_n == 1'b0)) | ((ap_predicate_op42_read_state1 == 1'b1) & (rxDataBuffer_empty_n == 1'b0)) | ((ap_predicate_op41_read_state1 == 1'b1) & (s_axis_rx_metadata_TVALID_int_regslice == 1'b0)) | ((tmp_7_i_nbreadreq_fu_90_p3 == 1'd1) & (s_axis_notifications_TVALID_int_regslice == 1'b0)) | ((ap_predicate_op20_read_state1 == 1'b1) & (s_axis_listen_port_status_TVALID_int_regslice == 1'b0)))) | ((ap_enable_reg_pp0_iter2 == 1'b1) & ((regslice_both_m_axis_read_package_U_apdone_blk == 1'b1) | (regslice_both_m_axis_listen_port_U_apdone_blk == 1'b1) | ((m_axis_read_package_TREADY_int_regslice == 1'b0) & (ap_predicate_op62_write_state3 == 1'b1)) | ((m_axis_listen_port_TREADY_int_regslice == 1'b0) & (listenState_load_reg_211_pp0_iter1_reg == 1'd0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((listenState_load_reg_211 == 1'd0) & (m_axis_listen_port_TREADY_int_regslice == 1'b0)) | ((m_axis_read_package_TREADY_int_regslice == 1'b0) & (ap_predicate_op59_write_state2 == 1'b1)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op51_read_state1 == 1'b1) & (rxDataBuffer_empty_n == 1'b0)) | ((ap_predicate_op42_read_state1 == 1'b1) & (rxDataBuffer_empty_n == 1'b0)) | ((ap_predicate_op41_read_state1 == 1'b1) & (s_axis_rx_metadata_TVALID_int_regslice == 1'b0)) | ((tmp_7_i_nbreadreq_fu_90_p3 == 1'd1) & (s_axis_notifications_TVALID_int_regslice == 1'b0)) | ((ap_predicate_op20_read_state1 == 1'b1) & (s_axis_listen_port_status_TVALID_int_regslice == 1'b0)))) | ((ap_enable_reg_pp0_iter2 == 1'b1) & ((1'b1 == ap_block_state3_io) | (regslice_both_m_axis_read_package_U_apdone_blk == 1'b1) | (regslice_both_m_axis_listen_port_U_apdone_blk == 1'b1) | ((m_axis_read_package_TREADY_int_regslice == 1'b0) & (ap_predicate_op62_write_state3 == 1'b1)) | ((m_axis_listen_port_TREADY_int_regslice == 1'b0) & (listenState_load_reg_211_pp0_iter1_reg == 1'd0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((listenState_load_reg_211 == 1'd0) & (m_axis_listen_port_TREADY_int_regslice == 1'b0)) | ((m_axis_read_package_TREADY_int_regslice == 1'b0) & (ap_predicate_op59_write_state2 == 1'b1)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op51_read_state1 == 1'b1) & (rxDataBuffer_empty_n == 1'b0)) | ((ap_predicate_op42_read_state1 == 1'b1) & (rxDataBuffer_empty_n == 1'b0)) | ((ap_predicate_op41_read_state1 == 1'b1) & (s_axis_rx_metadata_TVALID_int_regslice == 1'b0)) | ((tmp_7_i_nbreadreq_fu_90_p3 == 1'd1) & (s_axis_notifications_TVALID_int_regslice == 1'b0)) | ((ap_predicate_op20_read_state1 == 1'b1) & (s_axis_listen_port_status_TVALID_int_regslice == 1'b0)))) | ((ap_enable_reg_pp0_iter2 == 1'b1) & ((1'b1 == ap_block_state3_io) | (regslice_both_m_axis_read_package_U_apdone_blk == 1'b1) | (regslice_both_m_axis_listen_port_U_apdone_blk == 1'b1) | ((m_axis_read_package_TREADY_int_regslice == 1'b0) & (ap_predicate_op62_write_state3 == 1'b1)) | ((m_axis_listen_port_TREADY_int_regslice == 1'b0) & (listenState_load_reg_211_pp0_iter1_reg == 1'd0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & ((1'b1 == ap_block_state2_io) | ((listenState_load_reg_211 == 1'd0) & (m_axis_listen_port_TREADY_int_regslice == 1'b0)) | ((m_axis_read_package_TREADY_int_regslice == 1'b0) & (ap_predicate_op59_write_state2 == 1'b1)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((ap_predicate_op51_read_state1 == 1'b1) & (rxDataBuffer_empty_n == 1'b0)) | ((ap_predicate_op42_read_state1 == 1'b1) & (rxDataBuffer_empty_n == 1'b0)) | ((ap_predicate_op41_read_state1 == 1'b1) & (s_axis_rx_metadata_TVALID_int_regslice == 1'b0)) | ((tmp_7_i_nbreadreq_fu_90_p3 == 1'd1) & (s_axis_notifications_TVALID_int_regslice == 1'b0)) | ((ap_predicate_op20_read_state1 == 1'b1) & (s_axis_listen_port_status_TVALID_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state2_io = (((listenState_load_reg_211 == 1'd0) & (m_axis_listen_port_TREADY_int_regslice == 1'b0)) | ((m_axis_read_package_TREADY_int_regslice == 1'b0) & (ap_predicate_op59_write_state2 == 1'b1)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((listenState_load_reg_211 == 1'd0) & (m_axis_listen_port_TREADY_int_regslice == 1'b0)) | ((m_axis_read_package_TREADY_int_regslice == 1'b0) & (ap_predicate_op59_write_state2 == 1'b1)));
end

always @ (*) begin
    ap_block_state3_io = (((m_axis_read_package_TREADY_int_regslice == 1'b0) & (ap_predicate_op62_write_state3 == 1'b1)) | ((m_axis_listen_port_TREADY_int_regslice == 1'b0) & (listenState_load_reg_211_pp0_iter1_reg == 1'd0)));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = ((regslice_both_m_axis_read_package_U_apdone_blk == 1'b1) | (regslice_both_m_axis_listen_port_U_apdone_blk == 1'b1) | ((m_axis_read_package_TREADY_int_regslice == 1'b0) & (ap_predicate_op62_write_state3 == 1'b1)) | ((m_axis_listen_port_TREADY_int_regslice == 1'b0) & (listenState_load_reg_211_pp0_iter1_reg == 1'd0)));
end

always @ (*) begin
    ap_condition_203 = ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

always @ (*) begin
    ap_condition_208 = ((tmp_i_nbreadreq_fu_76_p3 == 1'd1) & (listenState == 1'd1) & (tmp_fu_165_p1 == 1'd0));
end

always @ (*) begin
    ap_condition_383 = ((grp_nbreadreq_fu_112_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

always @ (*) begin
    ap_condition_384 = ((tmp_3_i_nbreadreq_fu_104_p3 == 1'd1) & (serverFsmState == 1'd0) & (grp_fu_147_p3 == 1'd0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_predicate_op20_read_state1 = ((tmp_i_nbreadreq_fu_76_p3 == 1'd1) & (listenState == 1'd1));
end

always @ (*) begin
    ap_predicate_op41_read_state1 = ((grp_nbreadreq_fu_112_p3 == 1'd1) & (tmp_3_i_nbreadreq_fu_104_p3 == 1'd1) & (serverFsmState == 1'd0));
end

always @ (*) begin
    ap_predicate_op42_read_state1 = ((grp_nbreadreq_fu_112_p3 == 1'd1) & (tmp_3_i_nbreadreq_fu_104_p3 == 1'd1) & (serverFsmState == 1'd0));
end

always @ (*) begin
    ap_predicate_op51_read_state1 = ((grp_nbreadreq_fu_112_p3 == 1'd1) & (serverFsmState == 1'd1));
end

always @ (*) begin
    ap_predicate_op59_write_state2 = ((icmp_ln1069_reg_225 == 1'd0) & (tmp_7_i_reg_221 == 1'd1));
end

always @ (*) begin
    ap_predicate_op62_write_state3 = ((icmp_ln1069_reg_225_pp0_iter1_reg == 1'd0) & (tmp_7_i_reg_221_pp0_iter1_reg == 1'd1));
end

assign grp_fu_147_p3 = rxDataBuffer_dout[1024'd576];

assign grp_nbreadreq_fu_112_p3 = rxDataBuffer_empty_n;

assign icmp_ln1069_fu_185_p2 = ((tmp_length_V_fu_175_p4 == 16'd0) ? 1'b1 : 1'b0);

assign listenState_load_load_fu_155_p1 = listenState;

assign m_axis_listen_port_TVALID = regslice_both_m_axis_listen_port_U_vld_out;

assign m_axis_read_package_TVALID = regslice_both_m_axis_read_package_U_vld_out;

assign s_axis_listen_port_status_TREADY = regslice_both_s_axis_listen_port_status_U_ack_in;

assign s_axis_notifications_TREADY = regslice_both_s_axis_notifications_U_ack_in;

assign s_axis_rx_metadata_TREADY = regslice_both_s_axis_rx_metadata_U_ack_in;

assign tmp_3_i_nbreadreq_fu_104_p3 = s_axis_rx_metadata_TVALID_int_regslice;

assign tmp_7_i_nbreadreq_fu_90_p3 = s_axis_notifications_TVALID_int_regslice;

assign tmp_fu_165_p1 = s_axis_listen_port_status_TDATA_int_regslice[0:0];

assign tmp_i_nbreadreq_fu_76_p3 = s_axis_listen_port_status_TVALID_int_regslice;

assign tmp_length_V_fu_175_p4 = {{s_axis_notifications_TDATA_int_regslice[31:16]}};

assign trunc_ln174_fu_191_p1 = s_axis_notifications_TDATA_int_regslice[31:0];

endmodule //iperf_client_server_512_s
