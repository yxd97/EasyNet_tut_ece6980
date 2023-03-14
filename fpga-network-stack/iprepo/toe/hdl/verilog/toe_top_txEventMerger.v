// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module toe_top_txEventMerger (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        txApp2eventEng_mergeEvent_dout,
        txApp2eventEng_mergeEvent_num_data_valid,
        txApp2eventEng_mergeEvent_fifo_cap,
        txApp2eventEng_mergeEvent_empty_n,
        txApp2eventEng_mergeEvent_read,
        txAppStream2event_mergeEvent_dout,
        txAppStream2event_mergeEvent_num_data_valid,
        txAppStream2event_mergeEvent_fifo_cap,
        txAppStream2event_mergeEvent_empty_n,
        txAppStream2event_mergeEvent_read,
        txApp2eventEng_setEvent_din,
        txApp2eventEng_setEvent_num_data_valid,
        txApp2eventEng_setEvent_fifo_cap,
        txApp2eventEng_setEvent_full_n,
        txApp2eventEng_setEvent_write,
        txApp_txEventCache_din,
        txApp_txEventCache_num_data_valid,
        txApp_txEventCache_fifo_cap,
        txApp_txEventCache_full_n,
        txApp_txEventCache_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [84:0] txApp2eventEng_mergeEvent_dout;
input  [6:0] txApp2eventEng_mergeEvent_num_data_valid;
input  [6:0] txApp2eventEng_mergeEvent_fifo_cap;
input   txApp2eventEng_mergeEvent_empty_n;
output   txApp2eventEng_mergeEvent_read;
input  [84:0] txAppStream2event_mergeEvent_dout;
input  [6:0] txAppStream2event_mergeEvent_num_data_valid;
input  [6:0] txAppStream2event_mergeEvent_fifo_cap;
input   txAppStream2event_mergeEvent_empty_n;
output   txAppStream2event_mergeEvent_read;
output  [84:0] txApp2eventEng_setEvent_din;
input  [6:0] txApp2eventEng_setEvent_num_data_valid;
input  [6:0] txApp2eventEng_setEvent_fifo_cap;
input   txApp2eventEng_setEvent_full_n;
output   txApp2eventEng_setEvent_write;
output  [84:0] txApp_txEventCache_din;
input  [6:0] txApp_txEventCache_num_data_valid;
input  [6:0] txApp_txEventCache_fifo_cap;
input   txApp_txEventCache_full_n;
output   txApp_txEventCache_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg txApp2eventEng_mergeEvent_read;
reg txAppStream2event_mergeEvent_read;
reg[84:0] txApp2eventEng_setEvent_din;
reg txApp2eventEng_setEvent_write;
reg txApp_txEventCache_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire   [0:0] tmp_i_nbreadreq_fu_28_p3;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] tmp_i_reg_80;
wire   [0:0] tmp_i_182_nbreadreq_fu_42_p3;
reg    ap_predicate_op27_read_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg   [0:0] tmp_i_reg_80_pp0_iter1_reg;
reg   [0:0] tmp_i_182_reg_89;
reg    ap_predicate_op32_write_state3;
reg   [0:0] icmp_ln54_reg_99;
reg    ap_predicate_op33_write_state3;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_subdone;
reg    txApp2eventEng_mergeEvent_blk_n;
wire    ap_block_pp0_stage0;
reg    txApp2eventEng_setEvent_blk_n;
reg    txAppStream2event_mergeEvent_blk_n;
reg    txApp_txEventCache_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [84:0] txApp2eventEng_mergeEvent_read_reg_84;
reg   [84:0] txApp2eventEng_mergeEvent_read_reg_84_pp0_iter1_reg;
reg   [84:0] txAppStream2event_mergeEvent_read_reg_93;
wire   [0:0] icmp_ln54_fu_74_p2;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] ev_type_fu_70_p1;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to1;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
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
    if (((tmp_i_182_nbreadreq_fu_42_p3 == 1'd1) & (tmp_i_reg_80 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln54_reg_99 <= icmp_ln54_fu_74_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_reg_80 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_182_reg_89 <= tmp_i_182_nbreadreq_fu_42_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_reg_80 <= tmp_i_nbreadreq_fu_28_p3;
        tmp_i_reg_80_pp0_iter1_reg <= tmp_i_reg_80;
        txApp2eventEng_mergeEvent_read_reg_84_pp0_iter1_reg <= txApp2eventEng_mergeEvent_read_reg_84;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_28_p3 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        txApp2eventEng_mergeEvent_read_reg_84 <= txApp2eventEng_mergeEvent_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op27_read_state2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        txAppStream2event_mergeEvent_read_reg_93 <= txAppStream2event_mergeEvent_dout;
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
    if (((ap_done_reg == 1'b0) & (tmp_i_nbreadreq_fu_28_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        txApp2eventEng_mergeEvent_blk_n = txApp2eventEng_mergeEvent_empty_n;
    end else begin
        txApp2eventEng_mergeEvent_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_i_nbreadreq_fu_28_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        txApp2eventEng_mergeEvent_read = 1'b1;
    end else begin
        txApp2eventEng_mergeEvent_read = 1'b0;
    end
end

always @ (*) begin
    if ((((tmp_i_reg_80_pp0_iter1_reg == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((ap_predicate_op32_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)))) begin
        txApp2eventEng_setEvent_blk_n = txApp2eventEng_setEvent_full_n;
    end else begin
        txApp2eventEng_setEvent_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_01001))) begin
        if ((tmp_i_reg_80_pp0_iter1_reg == 1'd1)) begin
            txApp2eventEng_setEvent_din = txApp2eventEng_mergeEvent_read_reg_84_pp0_iter1_reg;
        end else if ((ap_predicate_op32_write_state3 == 1'b1)) begin
            txApp2eventEng_setEvent_din = txAppStream2event_mergeEvent_read_reg_93;
        end else begin
            txApp2eventEng_setEvent_din = 'bx;
        end
    end else begin
        txApp2eventEng_setEvent_din = 'bx;
    end
end

always @ (*) begin
    if ((((tmp_i_reg_80_pp0_iter1_reg == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op32_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        txApp2eventEng_setEvent_write = 1'b1;
    end else begin
        txApp2eventEng_setEvent_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_predicate_op27_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        txAppStream2event_mergeEvent_blk_n = txAppStream2event_mergeEvent_empty_n;
    end else begin
        txAppStream2event_mergeEvent_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op27_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        txAppStream2event_mergeEvent_read = 1'b1;
    end else begin
        txAppStream2event_mergeEvent_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_predicate_op33_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        txApp_txEventCache_blk_n = txApp_txEventCache_full_n;
    end else begin
        txApp_txEventCache_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op33_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        txApp_txEventCache_write = 1'b1;
    end else begin
        txApp_txEventCache_write = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_predicate_op27_read_state2 == 1'b1) & (txAppStream2event_mergeEvent_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_28_p3 == 1'd1) & (txApp2eventEng_mergeEvent_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (((tmp_i_reg_80_pp0_iter1_reg == 1'd1) & (txApp2eventEng_setEvent_full_n == 1'b0)) | ((ap_predicate_op33_write_state3 == 1'b1) & (txApp_txEventCache_full_n == 1'b0)) | ((ap_predicate_op32_write_state3 == 1'b1) & (txApp2eventEng_setEvent_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_predicate_op27_read_state2 == 1'b1) & (txAppStream2event_mergeEvent_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_28_p3 == 1'd1) & (txApp2eventEng_mergeEvent_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (((tmp_i_reg_80_pp0_iter1_reg == 1'd1) & (txApp2eventEng_setEvent_full_n == 1'b0)) | ((ap_predicate_op33_write_state3 == 1'b1) & (txApp_txEventCache_full_n == 1'b0)) | ((ap_predicate_op32_write_state3 == 1'b1) & (txApp2eventEng_setEvent_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_predicate_op27_read_state2 == 1'b1) & (txAppStream2event_mergeEvent_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_28_p3 == 1'd1) & (txApp2eventEng_mergeEvent_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (((tmp_i_reg_80_pp0_iter1_reg == 1'd1) & (txApp2eventEng_setEvent_full_n == 1'b0)) | ((ap_predicate_op33_write_state3 == 1'b1) & (txApp_txEventCache_full_n == 1'b0)) | ((ap_predicate_op32_write_state3 == 1'b1) & (txApp2eventEng_setEvent_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_28_p3 == 1'd1) & (txApp2eventEng_mergeEvent_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((ap_predicate_op27_read_state2 == 1'b1) & (txAppStream2event_mergeEvent_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = (((tmp_i_reg_80_pp0_iter1_reg == 1'd1) & (txApp2eventEng_setEvent_full_n == 1'b0)) | ((ap_predicate_op33_write_state3 == 1'b1) & (txApp_txEventCache_full_n == 1'b0)) | ((ap_predicate_op32_write_state3 == 1'b1) & (txApp2eventEng_setEvent_full_n == 1'b0)));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_predicate_op27_read_state2 = ((tmp_i_182_nbreadreq_fu_42_p3 == 1'd1) & (tmp_i_reg_80 == 1'd0));
end

always @ (*) begin
    ap_predicate_op32_write_state3 = ((tmp_i_182_reg_89 == 1'd1) & (tmp_i_reg_80_pp0_iter1_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op33_write_state3 = ((icmp_ln54_reg_99 == 1'd1) & (tmp_i_182_reg_89 == 1'd1) & (tmp_i_reg_80_pp0_iter1_reg == 1'd0));
end

assign ev_type_fu_70_p1 = txAppStream2event_mergeEvent_dout[31:0];

assign icmp_ln54_fu_74_p2 = ((ev_type_fu_70_p1 == 32'd0) ? 1'b1 : 1'b0);

assign tmp_i_182_nbreadreq_fu_42_p3 = txAppStream2event_mergeEvent_empty_n;

assign tmp_i_nbreadreq_fu_28_p3 = txApp2eventEng_mergeEvent_empty_n;

assign txApp_txEventCache_din = txAppStream2event_mergeEvent_read_reg_93;

endmodule //toe_top_txEventMerger
