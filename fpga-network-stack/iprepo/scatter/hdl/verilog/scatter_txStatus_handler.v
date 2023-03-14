// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module scatter_txStatus_handler (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        s_axis_tx_status_TVALID,
        txStatusBuffer_din,
        txStatusBuffer_num_data_valid,
        txStatusBuffer_fifo_cap,
        txStatusBuffer_full_n,
        txStatusBuffer_write,
        s_axis_tx_status_TDATA,
        s_axis_tx_status_TREADY
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input   s_axis_tx_status_TVALID;
output  [95:0] txStatusBuffer_din;
input  [9:0] txStatusBuffer_num_data_valid;
input  [9:0] txStatusBuffer_fifo_cap;
input   txStatusBuffer_full_n;
output   txStatusBuffer_write;
input  [63:0] s_axis_tx_status_TDATA;
output   s_axis_tx_status_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg txStatusBuffer_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] tmp_i_nbreadreq_fu_38_p3;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] tmp_i_reg_90;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg    s_axis_tx_status_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    txStatusBuffer_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [1:0] trunc_ln145_4_reg_94;
wire   [61:0] empty_fu_69_p1;
reg   [61:0] empty_reg_99;
reg    ap_block_pp0_stage0_01001;
wire   [63:0] tmp_3_cast_i_fu_73_p1;
wire   [66:0] tmp_fu_76_p4;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
wire    regslice_both_s_axis_tx_status_U_apdone_blk;
wire   [63:0] s_axis_tx_status_TDATA_int_regslice;
wire    s_axis_tx_status_TVALID_int_regslice;
reg    s_axis_tx_status_TREADY_int_regslice;
wire    regslice_both_s_axis_tx_status_U_ack_in;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

scatter_regslice_both #(
    .DataWidth( 64 ))
regslice_both_s_axis_tx_status_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_tx_status_TDATA),
    .vld_in(s_axis_tx_status_TVALID),
    .ack_in(regslice_both_s_axis_tx_status_U_ack_in),
    .data_out(s_axis_tx_status_TDATA_int_regslice),
    .vld_out(s_axis_tx_status_TVALID_int_regslice),
    .ack_out(s_axis_tx_status_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_tx_status_U_apdone_blk)
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_38_p3 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        empty_reg_99 <= empty_fu_69_p1;
        trunc_ln145_4_reg_94 <= {{s_axis_tx_status_TDATA_int_regslice[63:62]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_i_reg_90 <= tmp_i_nbreadreq_fu_38_p3;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0) & (ap_done_reg == 1'b0) & (tmp_i_nbreadreq_fu_38_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        s_axis_tx_status_TDATA_blk_n = s_axis_tx_status_TVALID_int_regslice;
    end else begin
        s_axis_tx_status_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_38_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        s_axis_tx_status_TREADY_int_regslice = 1'b1;
    end else begin
        s_axis_tx_status_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (tmp_i_reg_90 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        txStatusBuffer_blk_n = txStatusBuffer_full_n;
    end else begin
        txStatusBuffer_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_reg_90 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        txStatusBuffer_write = 1'b1;
    end else begin
        txStatusBuffer_write = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((tmp_i_reg_90 == 1'd1) & (txStatusBuffer_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_38_p3 == 1'd1) & (s_axis_tx_status_TVALID_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((tmp_i_reg_90 == 1'd1) & (txStatusBuffer_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_38_p3 == 1'd1) & (s_axis_tx_status_TVALID_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((tmp_i_reg_90 == 1'd1) & (txStatusBuffer_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_38_p3 == 1'd1) & (s_axis_tx_status_TVALID_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_38_p3 == 1'd1) & (s_axis_tx_status_TVALID_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((tmp_i_reg_90 == 1'd1) & (txStatusBuffer_full_n == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign empty_fu_69_p1 = s_axis_tx_status_TDATA_int_regslice[61:0];

assign s_axis_tx_status_TREADY = regslice_both_s_axis_tx_status_U_ack_in;

assign tmp_3_cast_i_fu_73_p1 = empty_reg_99;

assign tmp_fu_76_p4 = {{{{1'd0}, {trunc_ln145_4_reg_94}}}, {tmp_3_cast_i_fu_73_p1}};

assign tmp_i_nbreadreq_fu_38_p3 = s_axis_tx_status_TVALID_int_regslice;

assign txStatusBuffer_din = tmp_fu_76_p4;

endmodule //scatter_txStatus_handler
