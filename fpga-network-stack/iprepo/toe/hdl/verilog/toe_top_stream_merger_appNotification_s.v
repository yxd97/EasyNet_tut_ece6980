// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module toe_top_stream_merger_appNotification_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rxEng2rxApp_notification_dout,
        rxEng2rxApp_notification_num_data_valid,
        rxEng2rxApp_notification_fifo_cap,
        rxEng2rxApp_notification_empty_n,
        rxEng2rxApp_notification_read,
        timer2rxApp_notification_dout,
        timer2rxApp_notification_num_data_valid,
        timer2rxApp_notification_fifo_cap,
        timer2rxApp_notification_empty_n,
        timer2rxApp_notification_read,
        m_axis_notification_TREADY,
        m_axis_notification_TDATA,
        m_axis_notification_TVALID
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [80:0] rxEng2rxApp_notification_dout;
input  [2:0] rxEng2rxApp_notification_num_data_valid;
input  [2:0] rxEng2rxApp_notification_fifo_cap;
input   rxEng2rxApp_notification_empty_n;
output   rxEng2rxApp_notification_read;
input  [80:0] timer2rxApp_notification_dout;
input  [2:0] timer2rxApp_notification_num_data_valid;
input  [2:0] timer2rxApp_notification_fifo_cap;
input   timer2rxApp_notification_empty_n;
output   timer2rxApp_notification_read;
input   m_axis_notification_TREADY;
output  [87:0] m_axis_notification_TDATA;
output   m_axis_notification_TVALID;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rxEng2rxApp_notification_read;
reg timer2rxApp_notification_read;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire   [0:0] tmp_i_nbreadreq_fu_30_p3;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] tmp_i_reg_73;
wire   [0:0] tmp_i_318_nbreadreq_fu_44_p3;
reg    ap_predicate_op21_read_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg   [0:0] tmp_i_reg_73_pp0_iter1_reg;
reg   [0:0] tmp_i_318_reg_82;
reg    ap_predicate_op23_write_state3;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_state3_io;
reg   [0:0] tmp_i_reg_73_pp0_iter2_reg;
reg   [0:0] tmp_i_318_reg_82_pp0_iter2_reg;
reg    ap_predicate_op26_write_state4;
wire    regslice_both_m_axis_notification_U_apdone_blk;
reg    ap_block_state4_pp0_stage0_iter3;
reg    ap_block_state4_io;
reg    ap_block_pp0_stage0_subdone;
reg    m_axis_notification_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    rxEng2rxApp_notification_blk_n;
reg    timer2rxApp_notification_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [80:0] rxEng2rxApp_notification_read_reg_77;
reg   [80:0] rxEng2rxApp_notification_read_reg_77_pp0_iter1_reg;
reg   [80:0] timer2rxApp_notification_read_reg_86;
wire   [87:0] zext_ln174_14_fu_65_p1;
wire   [87:0] zext_ln174_fu_69_p1;
reg    ap_block_pp0_stage0_01001;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to2;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg   [87:0] m_axis_notification_TDATA_int_regslice;
reg    m_axis_notification_TVALID_int_regslice;
wire    m_axis_notification_TREADY_int_regslice;
wire    regslice_both_m_axis_notification_U_vld_out;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_done_reg = 1'b0;
end

toe_top_regslice_both #(
    .DataWidth( 88 ))
regslice_both_m_axis_notification_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(m_axis_notification_TDATA_int_regslice),
    .vld_in(m_axis_notification_TVALID_int_regslice),
    .ack_in(m_axis_notification_TREADY_int_regslice),
    .data_out(m_axis_notification_TDATA),
    .vld_out(regslice_both_m_axis_notification_U_vld_out),
    .ack_out(m_axis_notification_TREADY),
    .apdone_blk(regslice_both_m_axis_notification_U_apdone_blk)
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
        end else if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_30_p3 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rxEng2rxApp_notification_read_reg_77 <= rxEng2rxApp_notification_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rxEng2rxApp_notification_read_reg_77_pp0_iter1_reg <= rxEng2rxApp_notification_read_reg_77;
        tmp_i_reg_73 <= tmp_i_nbreadreq_fu_30_p3;
        tmp_i_reg_73_pp0_iter1_reg <= tmp_i_reg_73;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op21_read_state2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        timer2rxApp_notification_read_reg_86 <= timer2rxApp_notification_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_reg_73 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_318_reg_82 <= tmp_i_318_nbreadreq_fu_44_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        tmp_i_318_reg_82_pp0_iter2_reg <= tmp_i_318_reg_82;
        tmp_i_reg_73_pp0_iter2_reg <= tmp_i_reg_73_pp0_iter1_reg;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0_0to2 = 1'b1;
    end else begin
        ap_idle_pp0_0to2 = 1'b0;
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
    if (((ap_start == 1'b0) & (ap_idle_pp0_0to2 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_predicate_op26_write_state4 == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((tmp_i_reg_73_pp0_iter1_reg == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((ap_predicate_op23_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((tmp_i_reg_73_pp0_iter2_reg == 1'd1) & (ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0)))) begin
        m_axis_notification_TDATA_blk_n = m_axis_notification_TREADY_int_regslice;
    end else begin
        m_axis_notification_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_01001))) begin
        if ((tmp_i_reg_73_pp0_iter1_reg == 1'd1)) begin
            m_axis_notification_TDATA_int_regslice = zext_ln174_fu_69_p1;
        end else if ((ap_predicate_op23_write_state3 == 1'b1)) begin
            m_axis_notification_TDATA_int_regslice = zext_ln174_14_fu_65_p1;
        end else begin
            m_axis_notification_TDATA_int_regslice = 'bx;
        end
    end else begin
        m_axis_notification_TDATA_int_regslice = 'bx;
    end
end

always @ (*) begin
    if ((((tmp_i_reg_73_pp0_iter1_reg == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op23_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        m_axis_notification_TVALID_int_regslice = 1'b1;
    end else begin
        m_axis_notification_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (tmp_i_nbreadreq_fu_30_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        rxEng2rxApp_notification_blk_n = rxEng2rxApp_notification_empty_n;
    end else begin
        rxEng2rxApp_notification_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_i_nbreadreq_fu_30_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rxEng2rxApp_notification_read = 1'b1;
    end else begin
        rxEng2rxApp_notification_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_predicate_op21_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        timer2rxApp_notification_blk_n = timer2rxApp_notification_empty_n;
    end else begin
        timer2rxApp_notification_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op21_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        timer2rxApp_notification_read = 1'b1;
    end else begin
        timer2rxApp_notification_read = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (((tmp_i_reg_73_pp0_iter1_reg == 1'd1) & (m_axis_notification_TREADY_int_regslice == 1'b0)) | ((ap_predicate_op23_write_state3 == 1'b1) & (m_axis_notification_TREADY_int_regslice == 1'b0)))) | ((ap_predicate_op21_read_state2 == 1'b1) & (timer2rxApp_notification_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_30_p3 == 1'd1) & (rxEng2rxApp_notification_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter3 == 1'b1) & ((regslice_both_m_axis_notification_U_apdone_blk == 1'b1) | ((ap_predicate_op26_write_state4 == 1'b1) & (m_axis_notification_TREADY_int_regslice == 1'b0)) | ((tmp_i_reg_73_pp0_iter2_reg == 1'd1) & (m_axis_notification_TREADY_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter2 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((tmp_i_reg_73_pp0_iter1_reg == 1'd1) & (m_axis_notification_TREADY_int_regslice == 1'b0)) | ((ap_predicate_op23_write_state3 == 1'b1) & (m_axis_notification_TREADY_int_regslice == 1'b0)))) | ((ap_predicate_op21_read_state2 == 1'b1) & (timer2rxApp_notification_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_30_p3 == 1'd1) & (rxEng2rxApp_notification_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter3 == 1'b1) & ((1'b1 == ap_block_state4_io) | (regslice_both_m_axis_notification_U_apdone_blk == 1'b1) | ((ap_predicate_op26_write_state4 == 1'b1) & (m_axis_notification_TREADY_int_regslice == 1'b0)) | ((tmp_i_reg_73_pp0_iter2_reg == 1'd1) & (m_axis_notification_TREADY_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter2 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((tmp_i_reg_73_pp0_iter1_reg == 1'd1) & (m_axis_notification_TREADY_int_regslice == 1'b0)) | ((ap_predicate_op23_write_state3 == 1'b1) & (m_axis_notification_TREADY_int_regslice == 1'b0)))) | ((ap_predicate_op21_read_state2 == 1'b1) & (timer2rxApp_notification_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_30_p3 == 1'd1) & (rxEng2rxApp_notification_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter3 == 1'b1) & ((1'b1 == ap_block_state4_io) | (regslice_both_m_axis_notification_U_apdone_blk == 1'b1) | ((ap_predicate_op26_write_state4 == 1'b1) & (m_axis_notification_TREADY_int_regslice == 1'b0)) | ((tmp_i_reg_73_pp0_iter2_reg == 1'd1) & (m_axis_notification_TREADY_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_30_p3 == 1'd1) & (rxEng2rxApp_notification_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((ap_predicate_op21_read_state2 == 1'b1) & (timer2rxApp_notification_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state3_io = (((tmp_i_reg_73_pp0_iter1_reg == 1'd1) & (m_axis_notification_TREADY_int_regslice == 1'b0)) | ((ap_predicate_op23_write_state3 == 1'b1) & (m_axis_notification_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = (((tmp_i_reg_73_pp0_iter1_reg == 1'd1) & (m_axis_notification_TREADY_int_regslice == 1'b0)) | ((ap_predicate_op23_write_state3 == 1'b1) & (m_axis_notification_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state4_io = (((ap_predicate_op26_write_state4 == 1'b1) & (m_axis_notification_TREADY_int_regslice == 1'b0)) | ((tmp_i_reg_73_pp0_iter2_reg == 1'd1) & (m_axis_notification_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state4_pp0_stage0_iter3 = ((regslice_both_m_axis_notification_U_apdone_blk == 1'b1) | ((ap_predicate_op26_write_state4 == 1'b1) & (m_axis_notification_TREADY_int_regslice == 1'b0)) | ((tmp_i_reg_73_pp0_iter2_reg == 1'd1) & (m_axis_notification_TREADY_int_regslice == 1'b0)));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_predicate_op21_read_state2 = ((tmp_i_318_nbreadreq_fu_44_p3 == 1'd1) & (tmp_i_reg_73 == 1'd0));
end

always @ (*) begin
    ap_predicate_op23_write_state3 = ((tmp_i_318_reg_82 == 1'd1) & (tmp_i_reg_73_pp0_iter1_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op26_write_state4 = ((tmp_i_318_reg_82_pp0_iter2_reg == 1'd1) & (tmp_i_reg_73_pp0_iter2_reg == 1'd0));
end

assign m_axis_notification_TVALID = regslice_both_m_axis_notification_U_vld_out;

assign tmp_i_318_nbreadreq_fu_44_p3 = timer2rxApp_notification_empty_n;

assign tmp_i_nbreadreq_fu_30_p3 = rxEng2rxApp_notification_empty_n;

assign zext_ln174_14_fu_65_p1 = timer2rxApp_notification_read_reg_86;

assign zext_ln174_fu_69_p1 = rxEng2rxApp_notification_read_reg_77_pp0_iter1_reg;

endmodule //toe_top_stream_merger_appNotification_s
