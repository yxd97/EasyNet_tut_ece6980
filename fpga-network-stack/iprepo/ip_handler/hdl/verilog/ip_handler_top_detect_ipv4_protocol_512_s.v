// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module ip_handler_top_detect_ipv4_protocol_512_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        ipv4ProtocolFifo_dout,
        ipv4ProtocolFifo_num_data_valid,
        ipv4ProtocolFifo_fifo_cap,
        ipv4ProtocolFifo_empty_n,
        ipv4ProtocolFifo_read,
        ipv4ValidFifo_dout,
        ipv4ValidFifo_num_data_valid,
        ipv4ValidFifo_fifo_cap,
        ipv4ValidFifo_empty_n,
        ipv4ValidFifo_read,
        ipDataCutFifo_dout,
        ipDataCutFifo_num_data_valid,
        ipDataCutFifo_fifo_cap,
        ipDataCutFifo_empty_n,
        ipDataCutFifo_read,
        m_axis_tcp_internal_din,
        m_axis_tcp_internal_num_data_valid,
        m_axis_tcp_internal_fifo_cap,
        m_axis_tcp_internal_full_n,
        m_axis_tcp_internal_write,
        udpDataFifo_din,
        udpDataFifo_num_data_valid,
        udpDataFifo_fifo_cap,
        udpDataFifo_full_n,
        udpDataFifo_write,
        m_axis_icmp_internal_din,
        m_axis_icmp_internal_num_data_valid,
        m_axis_icmp_internal_fifo_cap,
        m_axis_icmp_internal_full_n,
        m_axis_icmp_internal_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [7:0] ipv4ProtocolFifo_dout;
input  [5:0] ipv4ProtocolFifo_num_data_valid;
input  [5:0] ipv4ProtocolFifo_fifo_cap;
input   ipv4ProtocolFifo_empty_n;
output   ipv4ProtocolFifo_read;
input  [0:0] ipv4ValidFifo_dout;
input  [3:0] ipv4ValidFifo_num_data_valid;
input  [3:0] ipv4ValidFifo_fifo_cap;
input   ipv4ValidFifo_empty_n;
output   ipv4ValidFifo_read;
input  [576:0] ipDataCutFifo_dout;
input  [1:0] ipDataCutFifo_num_data_valid;
input  [1:0] ipDataCutFifo_fifo_cap;
input   ipDataCutFifo_empty_n;
output   ipDataCutFifo_read;
output  [1023:0] m_axis_tcp_internal_din;
input  [1:0] m_axis_tcp_internal_num_data_valid;
input  [1:0] m_axis_tcp_internal_fifo_cap;
input   m_axis_tcp_internal_full_n;
output   m_axis_tcp_internal_write;
output  [576:0] udpDataFifo_din;
input  [1:0] udpDataFifo_num_data_valid;
input  [1:0] udpDataFifo_fifo_cap;
input   udpDataFifo_full_n;
output   udpDataFifo_write;
output  [1023:0] m_axis_icmp_internal_din;
input  [1:0] m_axis_icmp_internal_num_data_valid;
input  [1:0] m_axis_icmp_internal_fifo_cap;
input   m_axis_icmp_internal_full_n;
output   m_axis_icmp_internal_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg ipv4ProtocolFifo_read;
reg ipv4ValidFifo_read;
reg ipDataCutFifo_read;
reg m_axis_tcp_internal_write;
reg udpDataFifo_write;
reg m_axis_icmp_internal_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] tmp_i_nbreadreq_fu_60_p3;
wire   [0:0] tmp_100_i_nbreadreq_fu_68_p3;
reg    ap_predicate_op34_read_state1;
reg    ap_predicate_op36_read_state1;
wire   [0:0] tmp_i_59_nbreadreq_fu_88_p3;
reg    ap_predicate_op44_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] dip_state_load_reg_162;
reg   [0:0] tmp_i_59_reg_175;
reg   [7:0] dip_ipProtocol_V_load_reg_188;
reg    ap_predicate_op54_write_state2;
reg    ap_predicate_op56_write_state2;
reg    ap_predicate_op58_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] dip_state;
reg   [7:0] dip_ipProtocol_V;
reg    ipv4ProtocolFifo_blk_n;
wire    ap_block_pp0_stage0;
reg    ipv4ValidFifo_blk_n;
reg    ipDataCutFifo_blk_n;
reg    m_axis_icmp_internal_blk_n;
reg    udpDataFifo_blk_n;
reg    m_axis_tcp_internal_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [576:0] ipDataCutFifo_read_reg_179;
wire   [0:0] tmp_74_read_fu_82_p2;
wire   [0:0] tmp_last_V_fu_139_p3;
wire   [1023:0] p_07_fu_157_p1;
reg    ap_block_pp0_stage0_01001;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_179;
reg    ap_condition_183;
reg    ap_condition_176;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 dip_state = 1'd0;
#0 dip_ipProtocol_V = 8'd0;
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
    if ((1'b1 == ap_condition_176)) begin
        if ((1'b1 == ap_condition_183)) begin
            dip_state <= 1'd0;
        end else if ((1'b1 == ap_condition_179)) begin
            dip_state <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_100_i_nbreadreq_fu_68_p3 == 1'd1) & (tmp_i_nbreadreq_fu_60_p3 == 1'd1) & (dip_state == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dip_ipProtocol_V <= ipv4ProtocolFifo_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_59_nbreadreq_fu_88_p3 == 1'd1) & (dip_state == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dip_ipProtocol_V_load_reg_188 <= dip_ipProtocol_V;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        dip_state_load_reg_162 <= dip_state;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op44_read_state1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ipDataCutFifo_read_reg_179 <= ipDataCutFifo_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((dip_state == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_59_reg_175 <= tmp_i_59_nbreadreq_fu_88_p3;
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
    if (((ap_done_reg == 1'b0) & (ap_predicate_op44_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ipDataCutFifo_blk_n = ipDataCutFifo_empty_n;
    end else begin
        ipDataCutFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op44_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ipDataCutFifo_read = 1'b1;
    end else begin
        ipDataCutFifo_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op34_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ipv4ProtocolFifo_blk_n = ipv4ProtocolFifo_empty_n;
    end else begin
        ipv4ProtocolFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op34_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ipv4ProtocolFifo_read = 1'b1;
    end else begin
        ipv4ProtocolFifo_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op36_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ipv4ValidFifo_blk_n = ipv4ValidFifo_empty_n;
    end else begin
        ipv4ValidFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op36_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ipv4ValidFifo_read = 1'b1;
    end else begin
        ipv4ValidFifo_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op58_write_state2 == 1'b1))) begin
        m_axis_icmp_internal_blk_n = m_axis_icmp_internal_full_n;
    end else begin
        m_axis_icmp_internal_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op58_write_state2 == 1'b1))) begin
        m_axis_icmp_internal_write = 1'b1;
    end else begin
        m_axis_icmp_internal_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_predicate_op54_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        m_axis_tcp_internal_blk_n = m_axis_tcp_internal_full_n;
    end else begin
        m_axis_tcp_internal_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op54_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axis_tcp_internal_write = 1'b1;
    end else begin
        m_axis_tcp_internal_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op56_write_state2 == 1'b1))) begin
        udpDataFifo_blk_n = udpDataFifo_full_n;
    end else begin
        udpDataFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op56_write_state2 == 1'b1))) begin
        udpDataFifo_write = 1'b1;
    end else begin
        udpDataFifo_write = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op44_read_state1 == 1'b1) & (ipDataCutFifo_empty_n == 1'b0)) | ((ap_predicate_op36_read_state1 == 1'b1) & (ipv4ValidFifo_empty_n == 1'b0)) | ((ap_predicate_op34_read_state1 == 1'b1) & (ipv4ProtocolFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op54_write_state2 == 1'b1) & (m_axis_tcp_internal_full_n == 1'b0)) | ((ap_predicate_op58_write_state2 == 1'b1) & (m_axis_icmp_internal_full_n == 1'b0)) | ((ap_predicate_op56_write_state2 == 1'b1) & (udpDataFifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op44_read_state1 == 1'b1) & (ipDataCutFifo_empty_n == 1'b0)) | ((ap_predicate_op36_read_state1 == 1'b1) & (ipv4ValidFifo_empty_n == 1'b0)) | ((ap_predicate_op34_read_state1 == 1'b1) & (ipv4ProtocolFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op54_write_state2 == 1'b1) & (m_axis_tcp_internal_full_n == 1'b0)) | ((ap_predicate_op58_write_state2 == 1'b1) & (m_axis_icmp_internal_full_n == 1'b0)) | ((ap_predicate_op56_write_state2 == 1'b1) & (udpDataFifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op44_read_state1 == 1'b1) & (ipDataCutFifo_empty_n == 1'b0)) | ((ap_predicate_op36_read_state1 == 1'b1) & (ipv4ValidFifo_empty_n == 1'b0)) | ((ap_predicate_op34_read_state1 == 1'b1) & (ipv4ProtocolFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op54_write_state2 == 1'b1) & (m_axis_tcp_internal_full_n == 1'b0)) | ((ap_predicate_op58_write_state2 == 1'b1) & (m_axis_icmp_internal_full_n == 1'b0)) | ((ap_predicate_op56_write_state2 == 1'b1) & (udpDataFifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((ap_predicate_op44_read_state1 == 1'b1) & (ipDataCutFifo_empty_n == 1'b0)) | ((ap_predicate_op36_read_state1 == 1'b1) & (ipv4ValidFifo_empty_n == 1'b0)) | ((ap_predicate_op34_read_state1 == 1'b1) & (ipv4ProtocolFifo_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((ap_predicate_op54_write_state2 == 1'b1) & (m_axis_tcp_internal_full_n == 1'b0)) | ((ap_predicate_op58_write_state2 == 1'b1) & (m_axis_icmp_internal_full_n == 1'b0)) | ((ap_predicate_op56_write_state2 == 1'b1) & (udpDataFifo_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_176 = ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

always @ (*) begin
    ap_condition_179 = ((tmp_100_i_nbreadreq_fu_68_p3 == 1'd1) & (tmp_i_nbreadreq_fu_60_p3 == 1'd1) & (dip_state == 1'd0) & (tmp_74_read_fu_82_p2 == 1'd1));
end

always @ (*) begin
    ap_condition_183 = ((tmp_i_59_nbreadreq_fu_88_p3 == 1'd1) & (dip_state == 1'd1) & (tmp_last_V_fu_139_p3 == 1'd1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_predicate_op34_read_state1 = ((tmp_100_i_nbreadreq_fu_68_p3 == 1'd1) & (tmp_i_nbreadreq_fu_60_p3 == 1'd1) & (dip_state == 1'd0));
end

always @ (*) begin
    ap_predicate_op36_read_state1 = ((tmp_100_i_nbreadreq_fu_68_p3 == 1'd1) & (tmp_i_nbreadreq_fu_60_p3 == 1'd1) & (dip_state == 1'd0));
end

always @ (*) begin
    ap_predicate_op44_read_state1 = ((tmp_i_59_nbreadreq_fu_88_p3 == 1'd1) & (dip_state == 1'd1));
end

always @ (*) begin
    ap_predicate_op54_write_state2 = ((dip_ipProtocol_V_load_reg_188 == 8'd6) & (tmp_i_59_reg_175 == 1'd1) & (dip_state_load_reg_162 == 1'd1));
end

always @ (*) begin
    ap_predicate_op56_write_state2 = ((dip_ipProtocol_V_load_reg_188 == 8'd17) & (tmp_i_59_reg_175 == 1'd1) & (dip_state_load_reg_162 == 1'd1));
end

always @ (*) begin
    ap_predicate_op58_write_state2 = ((dip_ipProtocol_V_load_reg_188 == 8'd1) & (tmp_i_59_reg_175 == 1'd1) & (dip_state_load_reg_162 == 1'd1));
end

assign m_axis_icmp_internal_din = p_07_fu_157_p1;

assign m_axis_tcp_internal_din = p_07_fu_157_p1;

assign p_07_fu_157_p1 = ipDataCutFifo_read_reg_179;

assign tmp_100_i_nbreadreq_fu_68_p3 = ipv4ValidFifo_empty_n;

assign tmp_74_read_fu_82_p2 = ipv4ValidFifo_dout;

assign tmp_i_59_nbreadreq_fu_88_p3 = ipDataCutFifo_empty_n;

assign tmp_i_nbreadreq_fu_60_p3 = ipv4ProtocolFifo_empty_n;

assign tmp_last_V_fu_139_p3 = ipDataCutFifo_dout[32'd576];

assign udpDataFifo_din = ipDataCutFifo_read_reg_179;

endmodule //ip_handler_top_detect_ipv4_protocol_512_s
