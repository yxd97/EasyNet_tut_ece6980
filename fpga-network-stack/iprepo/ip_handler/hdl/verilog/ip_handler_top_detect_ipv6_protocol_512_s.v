// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module ip_handler_top_detect_ipv6_protocol_512_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        ipv6DataFifo_dout,
        ipv6DataFifo_num_data_valid,
        ipv6DataFifo_fifo_cap,
        ipv6DataFifo_empty_n,
        ipv6DataFifo_read,
        m_axis_ipv6udp_internal_din,
        m_axis_ipv6udp_internal_num_data_valid,
        m_axis_ipv6udp_internal_fifo_cap,
        m_axis_ipv6udp_internal_full_n,
        m_axis_ipv6udp_internal_write,
        m_axis_icmpv6_internal_din,
        m_axis_icmpv6_internal_num_data_valid,
        m_axis_icmpv6_internal_fifo_cap,
        m_axis_icmpv6_internal_full_n,
        m_axis_icmpv6_internal_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [1023:0] ipv6DataFifo_dout;
input  [1:0] ipv6DataFifo_num_data_valid;
input  [1:0] ipv6DataFifo_fifo_cap;
input   ipv6DataFifo_empty_n;
output   ipv6DataFifo_read;
output  [1023:0] m_axis_ipv6udp_internal_din;
input  [1:0] m_axis_ipv6udp_internal_num_data_valid;
input  [1:0] m_axis_ipv6udp_internal_fifo_cap;
input   m_axis_ipv6udp_internal_full_n;
output   m_axis_ipv6udp_internal_write;
output  [1023:0] m_axis_icmpv6_internal_din;
input  [1:0] m_axis_icmpv6_internal_num_data_valid;
input  [1:0] m_axis_icmpv6_internal_fifo_cap;
input   m_axis_icmpv6_internal_full_n;
output   m_axis_icmpv6_internal_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg ipv6DataFifo_read;
reg m_axis_ipv6udp_internal_write;
reg m_axis_icmpv6_internal_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] tmp_i_nbreadreq_fu_48_p3;
reg    ap_predicate_op20_read_state1;
reg    ap_predicate_op32_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] state_V_load_reg_126;
reg   [0:0] tmp_i_reg_130;
reg   [7:0] tmp_i_58_reg_137;
reg    ap_predicate_op42_write_state2;
reg    ap_predicate_op44_write_state2;
reg   [7:0] nextHeader_V_load_reg_144;
reg    ap_predicate_op46_write_state2;
reg    ap_predicate_op48_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] state_V;
reg   [7:0] nextHeader_V;
reg    ipv6DataFifo_blk_n;
wire    ap_block_pp0_stage0;
reg    m_axis_icmpv6_internal_blk_n;
reg    m_axis_ipv6udp_internal_blk_n;
reg   [1023:0] reg_84;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] grp_fu_76_p3;
reg    ap_block_pp0_stage0_01001;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_222;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 state_V = 1'd0;
#0 nextHeader_V = 8'd0;
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
    if ((1'b1 == ap_condition_222)) begin
        if (((state_V == 1'd1) & (grp_fu_76_p3 == 1'd1))) begin
            state_V <= 1'd0;
        end else if (((state_V == 1'd0) & (grp_fu_76_p3 == 1'd0))) begin
            state_V <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_48_p3 == 1'd1) & (state_V == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        nextHeader_V <= {{ipv6DataFifo_dout[55:48]}};
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_48_p3 == 1'd1) & (state_V == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        nextHeader_V_load_reg_144 <= nextHeader_V;
    end
end

always @ (posedge ap_clk) begin
    if ((((ap_predicate_op32_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op20_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        reg_84 <= ipv6DataFifo_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        state_V_load_reg_126 <= state_V;
        tmp_i_reg_130 <= tmp_i_nbreadreq_fu_48_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_48_p3 == 1'd1) & (state_V == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_58_reg_137 <= {{ipv6DataFifo_dout[55:48]}};
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
    if ((((ap_done_reg == 1'b0) & (ap_predicate_op32_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_done_reg == 1'b0) & (ap_predicate_op20_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        ipv6DataFifo_blk_n = ipv6DataFifo_empty_n;
    end else begin
        ipv6DataFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_predicate_op32_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op20_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        ipv6DataFifo_read = 1'b1;
    end else begin
        ipv6DataFifo_read = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_predicate_op44_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op48_write_state2 == 1'b1)))) begin
        m_axis_icmpv6_internal_blk_n = m_axis_icmpv6_internal_full_n;
    end else begin
        m_axis_icmpv6_internal_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_predicate_op44_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op48_write_state2 == 1'b1)))) begin
        m_axis_icmpv6_internal_write = 1'b1;
    end else begin
        m_axis_icmpv6_internal_write = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_predicate_op46_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_predicate_op42_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        m_axis_ipv6udp_internal_blk_n = m_axis_ipv6udp_internal_full_n;
    end else begin
        m_axis_ipv6udp_internal_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_predicate_op46_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op42_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        m_axis_ipv6udp_internal_write = 1'b1;
    end else begin
        m_axis_ipv6udp_internal_write = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op32_read_state1 == 1'b1) & (ipv6DataFifo_empty_n == 1'b0)) | ((ap_predicate_op20_read_state1 == 1'b1) & (ipv6DataFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op46_write_state2 == 1'b1) & (m_axis_ipv6udp_internal_full_n == 1'b0)) | ((ap_predicate_op44_write_state2 == 1'b1) & (m_axis_icmpv6_internal_full_n == 1'b0)) | ((m_axis_icmpv6_internal_full_n == 1'b0) & (ap_predicate_op48_write_state2 == 1'b1)) | ((ap_predicate_op42_write_state2 == 1'b1) & (m_axis_ipv6udp_internal_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op32_read_state1 == 1'b1) & (ipv6DataFifo_empty_n == 1'b0)) | ((ap_predicate_op20_read_state1 == 1'b1) & (ipv6DataFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op46_write_state2 == 1'b1) & (m_axis_ipv6udp_internal_full_n == 1'b0)) | ((ap_predicate_op44_write_state2 == 1'b1) & (m_axis_icmpv6_internal_full_n == 1'b0)) | ((m_axis_icmpv6_internal_full_n == 1'b0) & (ap_predicate_op48_write_state2 == 1'b1)) | ((ap_predicate_op42_write_state2 == 1'b1) & (m_axis_ipv6udp_internal_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op32_read_state1 == 1'b1) & (ipv6DataFifo_empty_n == 1'b0)) | ((ap_predicate_op20_read_state1 == 1'b1) & (ipv6DataFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op46_write_state2 == 1'b1) & (m_axis_ipv6udp_internal_full_n == 1'b0)) | ((ap_predicate_op44_write_state2 == 1'b1) & (m_axis_icmpv6_internal_full_n == 1'b0)) | ((m_axis_icmpv6_internal_full_n == 1'b0) & (ap_predicate_op48_write_state2 == 1'b1)) | ((ap_predicate_op42_write_state2 == 1'b1) & (m_axis_ipv6udp_internal_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((ap_predicate_op32_read_state1 == 1'b1) & (ipv6DataFifo_empty_n == 1'b0)) | ((ap_predicate_op20_read_state1 == 1'b1) & (ipv6DataFifo_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((ap_predicate_op46_write_state2 == 1'b1) & (m_axis_ipv6udp_internal_full_n == 1'b0)) | ((ap_predicate_op44_write_state2 == 1'b1) & (m_axis_icmpv6_internal_full_n == 1'b0)) | ((m_axis_icmpv6_internal_full_n == 1'b0) & (ap_predicate_op48_write_state2 == 1'b1)) | ((ap_predicate_op42_write_state2 == 1'b1) & (m_axis_ipv6udp_internal_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_222 = ((tmp_i_nbreadreq_fu_48_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_predicate_op20_read_state1 = ((tmp_i_nbreadreq_fu_48_p3 == 1'd1) & (state_V == 1'd0));
end

always @ (*) begin
    ap_predicate_op32_read_state1 = ((tmp_i_nbreadreq_fu_48_p3 == 1'd1) & (state_V == 1'd1));
end

always @ (*) begin
    ap_predicate_op42_write_state2 = ((tmp_i_58_reg_137 == 8'd17) & (tmp_i_reg_130 == 1'd1) & (state_V_load_reg_126 == 1'd0));
end

always @ (*) begin
    ap_predicate_op44_write_state2 = ((tmp_i_58_reg_137 == 8'd58) & (tmp_i_reg_130 == 1'd1) & (state_V_load_reg_126 == 1'd0));
end

always @ (*) begin
    ap_predicate_op46_write_state2 = ((nextHeader_V_load_reg_144 == 8'd17) & (tmp_i_reg_130 == 1'd1) & (state_V_load_reg_126 == 1'd1));
end

always @ (*) begin
    ap_predicate_op48_write_state2 = ((nextHeader_V_load_reg_144 == 8'd58) & (tmp_i_reg_130 == 1'd1) & (state_V_load_reg_126 == 1'd1));
end

assign grp_fu_76_p3 = ipv6DataFifo_dout[1024'd576];

assign m_axis_icmpv6_internal_din = reg_84;

assign m_axis_ipv6udp_internal_din = reg_84;

assign tmp_i_nbreadreq_fu_48_p3 = ipv6DataFifo_empty_n;

endmodule //ip_handler_top_detect_ipv6_protocol_512_s
