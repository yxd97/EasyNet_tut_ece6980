// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module arp_server_subnet_top_generate_arp_pkg_512_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        myIpAddress_dout,
        myIpAddress_num_data_valid,
        myIpAddress_fifo_cap,
        myIpAddress_empty_n,
        myIpAddress_read,
        myMacAddress_dout,
        myMacAddress_num_data_valid,
        myMacAddress_fifo_cap,
        myMacAddress_empty_n,
        myMacAddress_read,
        arpRequestMetaFifo_dout,
        arpRequestMetaFifo_num_data_valid,
        arpRequestMetaFifo_fifo_cap,
        arpRequestMetaFifo_empty_n,
        arpRequestMetaFifo_read,
        arpReplyMetaFifo_dout,
        arpReplyMetaFifo_num_data_valid,
        arpReplyMetaFifo_fifo_cap,
        arpReplyMetaFifo_empty_n,
        arpReplyMetaFifo_read,
        arpDataOut_internal_din,
        arpDataOut_internal_num_data_valid,
        arpDataOut_internal_fifo_cap,
        arpDataOut_internal_full_n,
        arpDataOut_internal_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [31:0] myIpAddress_dout;
input  [1:0] myIpAddress_num_data_valid;
input  [1:0] myIpAddress_fifo_cap;
input   myIpAddress_empty_n;
output   myIpAddress_read;
input  [47:0] myMacAddress_dout;
input  [2:0] myMacAddress_num_data_valid;
input  [2:0] myMacAddress_fifo_cap;
input   myMacAddress_empty_n;
output   myMacAddress_read;
input  [31:0] arpRequestMetaFifo_dout;
input  [2:0] arpRequestMetaFifo_num_data_valid;
input  [2:0] arpRequestMetaFifo_fifo_cap;
input   arpRequestMetaFifo_empty_n;
output   arpRequestMetaFifo_read;
input  [127:0] arpReplyMetaFifo_dout;
input  [2:0] arpReplyMetaFifo_num_data_valid;
input  [2:0] arpReplyMetaFifo_fifo_cap;
input   arpReplyMetaFifo_empty_n;
output   arpReplyMetaFifo_read;
output  [1023:0] arpDataOut_internal_din;
input  [1:0] arpDataOut_internal_num_data_valid;
input  [1:0] arpDataOut_internal_fifo_cap;
input   arpDataOut_internal_full_n;
output   arpDataOut_internal_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg myIpAddress_read;
reg myMacAddress_read;
reg arpRequestMetaFifo_read;
reg arpReplyMetaFifo_read;
reg arpDataOut_internal_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] gap_state_load_load_fu_164_p1;
wire   [0:0] tmp_i_nbreadreq_fu_118_p3;
wire   [0:0] tmp_i_30_nbreadreq_fu_126_p3;
reg    ap_predicate_op29_read_state1;
reg    ap_predicate_op38_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] gap_state_load_reg_379;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] gap_state;
reg   [15:0] header_idx_1;
reg   [335:0] header_header_V_1;
reg    myMacAddress_blk_n;
wire    ap_block_pp0_stage0;
reg    myIpAddress_blk_n;
reg    arpReplyMetaFifo_blk_n;
reg    arpRequestMetaFifo_blk_n;
reg    arpDataOut_internal_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [335:0] ap_phi_reg_pp0_iter0_sendWord_data_V_1_reg_153;
reg   [335:0] ap_phi_reg_pp0_iter1_sendWord_data_V_1_reg_153;
wire   [0:0] icmp_ln82_fu_326_p2;
wire   [15:0] add_ln85_fu_332_p2;
wire   [335:0] p_Result_3_fu_220_p5;
wire   [335:0] p_Result_s_fu_294_p5;
reg    ap_block_pp0_stage0_01001;
wire   [335:0] p_Result_10_fu_182_p5;
wire   [335:0] p_Result_11_fu_194_p5;
wire   [175:0] tmp_15_i_fu_206_p6;
wire   [47:0] trunc_ln145_fu_244_p1;
wire   [335:0] p_Result_8_fu_248_p5;
wire   [79:0] tmp_fu_272_p4;
wire   [335:0] p_Result_9_fu_260_p5;
wire   [175:0] tmp_14_i_fu_282_p5;
wire   [24:0] shl_ln_fu_318_p3;
wire   [511:0] zext_ln125_fu_350_p1;
wire   [512:0] tmp_13_i_fu_354_p3;
wire  signed [553:0] sext_ln174_fu_362_p1;
wire   [576:0] zext_ln174_cast_fu_366_p3;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_141;
reg    ap_condition_158;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 gap_state = 1'd0;
#0 header_idx_1 = 16'd0;
#0 header_header_V_1 = 336'd22969770278074827527357335424865723297445183488;
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
    if ((1'b1 == ap_condition_141)) begin
        if (((gap_state_load_load_fu_164_p1 == 1'd1) & (icmp_ln82_fu_326_p2 == 1'd0))) begin
            ap_phi_reg_pp0_iter1_sendWord_data_V_1_reg_153 <= 336'd0;
        end else if (((gap_state_load_load_fu_164_p1 == 1'd1) & (icmp_ln82_fu_326_p2 == 1'd1))) begin
            ap_phi_reg_pp0_iter1_sendWord_data_V_1_reg_153 <= header_header_V_1;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter1_sendWord_data_V_1_reg_153 <= ap_phi_reg_pp0_iter0_sendWord_data_V_1_reg_153;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((gap_state_load_load_fu_164_p1 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        gap_state <= 1'd0;
    end else if ((((tmp_i_nbreadreq_fu_118_p3 == 1'd1) & (gap_state == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_i_30_nbreadreq_fu_126_p3 == 1'd1) & (tmp_i_nbreadreq_fu_118_p3 == 1'd0) & (gap_state == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        gap_state <= 1'd1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_158)) begin
        if ((tmp_i_nbreadreq_fu_118_p3 == 1'd1)) begin
            header_header_V_1 <= p_Result_s_fu_294_p5;
        end else if (((tmp_i_30_nbreadreq_fu_126_p3 == 1'd1) & (tmp_i_nbreadreq_fu_118_p3 == 1'd0))) begin
            header_header_V_1 <= p_Result_3_fu_220_p5;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_141)) begin
        if (((gap_state_load_load_fu_164_p1 == 1'd1) & (icmp_ln82_fu_326_p2 == 1'd1))) begin
            header_idx_1 <= add_ln85_fu_332_p2;
        end else if ((gap_state == 1'd0)) begin
            header_idx_1 <= 16'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        gap_state_load_reg_379 <= gap_state;
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
    if (((gap_state_load_reg_379 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        arpDataOut_internal_blk_n = arpDataOut_internal_full_n;
    end else begin
        arpDataOut_internal_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((gap_state_load_reg_379 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        arpDataOut_internal_write = 1'b1;
    end else begin
        arpDataOut_internal_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op38_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        arpReplyMetaFifo_blk_n = arpReplyMetaFifo_empty_n;
    end else begin
        arpReplyMetaFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op38_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        arpReplyMetaFifo_read = 1'b1;
    end else begin
        arpReplyMetaFifo_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op29_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        arpRequestMetaFifo_blk_n = arpRequestMetaFifo_empty_n;
    end else begin
        arpRequestMetaFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op29_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        arpRequestMetaFifo_read = 1'b1;
    end else begin
        arpRequestMetaFifo_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        myIpAddress_blk_n = myIpAddress_empty_n;
    end else begin
        myIpAddress_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        myIpAddress_read = 1'b1;
    end else begin
        myIpAddress_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        myMacAddress_blk_n = myMacAddress_empty_n;
    end else begin
        myMacAddress_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        myMacAddress_read = 1'b1;
    end else begin
        myMacAddress_read = 1'b0;
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

assign add_ln85_fu_332_p2 = (header_idx_1 + 16'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((gap_state_load_reg_379 == 1'd1) & (arpDataOut_internal_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | (myMacAddress_empty_n == 1'b0) | (myIpAddress_empty_n == 1'b0) | ((ap_predicate_op38_read_state1 == 1'b1) & (arpReplyMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op29_read_state1 == 1'b1) & (arpRequestMetaFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((gap_state_load_reg_379 == 1'd1) & (arpDataOut_internal_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | (myMacAddress_empty_n == 1'b0) | (myIpAddress_empty_n == 1'b0) | ((ap_predicate_op38_read_state1 == 1'b1) & (arpReplyMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op29_read_state1 == 1'b1) & (arpRequestMetaFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((gap_state_load_reg_379 == 1'd1) & (arpDataOut_internal_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | (myMacAddress_empty_n == 1'b0) | (myIpAddress_empty_n == 1'b0) | ((ap_predicate_op38_read_state1 == 1'b1) & (arpReplyMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op29_read_state1 == 1'b1) & (arpRequestMetaFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | (myMacAddress_empty_n == 1'b0) | (myIpAddress_empty_n == 1'b0) | ((ap_predicate_op38_read_state1 == 1'b1) & (arpReplyMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op29_read_state1 == 1'b1) & (arpRequestMetaFifo_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((gap_state_load_reg_379 == 1'd1) & (arpDataOut_internal_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_141 = ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

always @ (*) begin
    ap_condition_158 = ((gap_state == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_sendWord_data_V_1_reg_153 = 'bx;

always @ (*) begin
    ap_predicate_op29_read_state1 = ((tmp_i_30_nbreadreq_fu_126_p3 == 1'd1) & (tmp_i_nbreadreq_fu_118_p3 == 1'd0) & (gap_state == 1'd0));
end

always @ (*) begin
    ap_predicate_op38_read_state1 = ((tmp_i_nbreadreq_fu_118_p3 == 1'd1) & (gap_state == 1'd0));
end

assign arpDataOut_internal_din = zext_ln174_cast_fu_366_p3;

assign gap_state_load_load_fu_164_p1 = gap_state;

assign icmp_ln82_fu_326_p2 = ((shl_ln_fu_318_p3 < 25'd336) ? 1'b1 : 1'b0);

assign p_Result_10_fu_182_p5 = {{header_header_V_1[335:48]}, {48'd281474976710655}};

assign p_Result_11_fu_194_p5 = {{p_Result_10_fu_182_p5[335:96]}, {myMacAddress_dout}, {p_Result_10_fu_182_p5[47:0]}};

assign p_Result_3_fu_220_p5 = {{tmp_15_i_fu_206_p6}, {p_Result_11_fu_194_p5[159:0]}};

assign p_Result_8_fu_248_p5 = {{header_header_V_1[335:48]}, {trunc_ln145_fu_244_p1}};

assign p_Result_9_fu_260_p5 = {{p_Result_8_fu_248_p5[335:96]}, {myMacAddress_dout}, {p_Result_8_fu_248_p5[47:0]}};

assign p_Result_s_fu_294_p5 = {{tmp_14_i_fu_282_p5}, {p_Result_9_fu_260_p5[159:0]}};

assign sext_ln174_fu_362_p1 = $signed(tmp_13_i_fu_354_p3);

assign shl_ln_fu_318_p3 = {{header_idx_1}, {9'd0}};

assign tmp_13_i_fu_354_p3 = {{1'd1}, {zext_ln125_fu_350_p1}};

assign tmp_14_i_fu_282_p5 = {{{{tmp_fu_272_p4}, {myIpAddress_dout}}, {myMacAddress_dout}}, {16'd512}};

assign tmp_15_i_fu_206_p6 = {{{{{arpRequestMetaFifo_dout}, {48'd0}}, {myIpAddress_dout}}, {myMacAddress_dout}}, {16'd256}};

assign tmp_fu_272_p4 = {{arpReplyMetaFifo_dout[127:48]}};

assign tmp_i_30_nbreadreq_fu_126_p3 = arpRequestMetaFifo_empty_n;

assign tmp_i_nbreadreq_fu_118_p3 = arpReplyMetaFifo_empty_n;

assign trunc_ln145_fu_244_p1 = arpReplyMetaFifo_dout[47:0];

assign zext_ln125_fu_350_p1 = ap_phi_reg_pp0_iter1_sendWord_data_V_1_reg_153;

assign zext_ln174_cast_fu_366_p3 = {{23'd4194304}, {sext_ln174_fu_362_p1}};

endmodule //arp_server_subnet_top_generate_arp_pkg_512_s
