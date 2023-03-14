// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module ip_handler_top_cut_length (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        ipDataDropFifo_dout,
        ipDataDropFifo_num_data_valid,
        ipDataDropFifo_fifo_cap,
        ipDataDropFifo_empty_n,
        ipDataDropFifo_read,
        ipDataCutFifo_din,
        ipDataCutFifo_num_data_valid,
        ipDataCutFifo_fifo_cap,
        ipDataCutFifo_full_n,
        ipDataCutFifo_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [576:0] ipDataDropFifo_dout;
input  [1:0] ipDataDropFifo_num_data_valid;
input  [1:0] ipDataDropFifo_fifo_cap;
input   ipDataDropFifo_empty_n;
output   ipDataDropFifo_read;
output  [576:0] ipDataCutFifo_din;
input  [1:0] ipDataCutFifo_num_data_valid;
input  [1:0] ipDataCutFifo_fifo_cap;
input   ipDataCutFifo_full_n;
output   ipDataCutFifo_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg ipDataDropFifo_read;
reg[576:0] ipDataCutFifo_din;
reg ipDataCutFifo_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] tmp_i_nbreadreq_fu_178_p3;
reg    ap_predicate_op16_read_state1;
reg    ap_predicate_op28_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] cl_state_load_reg_399;
reg   [0:0] tmp_i_reg_403;
reg    ap_predicate_op37_write_state2;
reg    ap_predicate_op39_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] cl_state;
reg    ipDataDropFifo_blk_n;
wire    ap_block_pp0_stage0;
reg    ipDataCutFifo_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [511:0] tmp_data_V_fu_220_p1;
reg   [511:0] tmp_data_V_reg_407;
wire   [0:0] grp_fu_208_p3;
reg   [0:0] tmp_last_V_reg_417;
wire   [63:0] currWord_keep_V_2_fu_250_p66;
reg   [576:0] ipDataDropFifo_read_reg_427;
wire   [63:0] ap_phi_reg_pp0_iter0_currWord_keep_V_reg_199;
reg   [63:0] ap_phi_reg_pp0_iter1_currWord_keep_V_reg_199;
wire   [576:0] p_0_fu_390_p4;
reg    ap_block_pp0_stage0_01001;
wire   [5:0] currWord_keep_V_2_fu_250_p65;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_128;
reg    ap_condition_139;
reg    ap_condition_123;
reg    ap_condition_346;
reg    ap_condition_151;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 cl_state = 1'd0;
end

ip_handler_top_mux_646_64_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .din2_WIDTH( 64 ),
    .din3_WIDTH( 64 ),
    .din4_WIDTH( 64 ),
    .din5_WIDTH( 64 ),
    .din6_WIDTH( 64 ),
    .din7_WIDTH( 64 ),
    .din8_WIDTH( 64 ),
    .din9_WIDTH( 64 ),
    .din10_WIDTH( 64 ),
    .din11_WIDTH( 64 ),
    .din12_WIDTH( 64 ),
    .din13_WIDTH( 64 ),
    .din14_WIDTH( 64 ),
    .din15_WIDTH( 64 ),
    .din16_WIDTH( 64 ),
    .din17_WIDTH( 64 ),
    .din18_WIDTH( 64 ),
    .din19_WIDTH( 64 ),
    .din20_WIDTH( 64 ),
    .din21_WIDTH( 64 ),
    .din22_WIDTH( 64 ),
    .din23_WIDTH( 64 ),
    .din24_WIDTH( 64 ),
    .din25_WIDTH( 64 ),
    .din26_WIDTH( 64 ),
    .din27_WIDTH( 64 ),
    .din28_WIDTH( 64 ),
    .din29_WIDTH( 64 ),
    .din30_WIDTH( 64 ),
    .din31_WIDTH( 64 ),
    .din32_WIDTH( 64 ),
    .din33_WIDTH( 64 ),
    .din34_WIDTH( 64 ),
    .din35_WIDTH( 64 ),
    .din36_WIDTH( 64 ),
    .din37_WIDTH( 64 ),
    .din38_WIDTH( 64 ),
    .din39_WIDTH( 64 ),
    .din40_WIDTH( 64 ),
    .din41_WIDTH( 64 ),
    .din42_WIDTH( 64 ),
    .din43_WIDTH( 64 ),
    .din44_WIDTH( 64 ),
    .din45_WIDTH( 64 ),
    .din46_WIDTH( 64 ),
    .din47_WIDTH( 64 ),
    .din48_WIDTH( 64 ),
    .din49_WIDTH( 64 ),
    .din50_WIDTH( 64 ),
    .din51_WIDTH( 64 ),
    .din52_WIDTH( 64 ),
    .din53_WIDTH( 64 ),
    .din54_WIDTH( 64 ),
    .din55_WIDTH( 64 ),
    .din56_WIDTH( 64 ),
    .din57_WIDTH( 64 ),
    .din58_WIDTH( 64 ),
    .din59_WIDTH( 64 ),
    .din60_WIDTH( 64 ),
    .din61_WIDTH( 64 ),
    .din62_WIDTH( 64 ),
    .din63_WIDTH( 64 ),
    .din64_WIDTH( 6 ),
    .dout_WIDTH( 64 ))
mux_646_64_1_1_U102(
    .din0(64'd18446744073709551615),
    .din1(64'd1),
    .din2(64'd3),
    .din3(64'd7),
    .din4(64'd15),
    .din5(64'd31),
    .din6(64'd63),
    .din7(64'd127),
    .din8(64'd255),
    .din9(64'd511),
    .din10(64'd1023),
    .din11(64'd2047),
    .din12(64'd4095),
    .din13(64'd8191),
    .din14(64'd16383),
    .din15(64'd32767),
    .din16(64'd65535),
    .din17(64'd131071),
    .din18(64'd262143),
    .din19(64'd524287),
    .din20(64'd1048575),
    .din21(64'd2097151),
    .din22(64'd4194303),
    .din23(64'd8388607),
    .din24(64'd16777215),
    .din25(64'd33554431),
    .din26(64'd67108863),
    .din27(64'd134217727),
    .din28(64'd268435455),
    .din29(64'd536870911),
    .din30(64'd1073741823),
    .din31(64'd2147483647),
    .din32(64'd4294967295),
    .din33(64'd8589934591),
    .din34(64'd17179869183),
    .din35(64'd34359738367),
    .din36(64'd68719476735),
    .din37(64'd137438953471),
    .din38(64'd274877906943),
    .din39(64'd549755813887),
    .din40(64'd1099511627775),
    .din41(64'd2199023255551),
    .din42(64'd4398046511103),
    .din43(64'd8796093022207),
    .din44(64'd17592186044415),
    .din45(64'd35184372088831),
    .din46(64'd70368744177663),
    .din47(64'd140737488355327),
    .din48(64'd281474976710655),
    .din49(64'd562949953421311),
    .din50(64'd1125899906842623),
    .din51(64'd2251799813685247),
    .din52(64'd4503599627370495),
    .din53(64'd9007199254740991),
    .din54(64'd18014398509481983),
    .din55(64'd36028797018963967),
    .din56(64'd72057594037927935),
    .din57(64'd144115188075855871),
    .din58(64'd288230376151711743),
    .din59(64'd576460752303423487),
    .din60(64'd1152921504606846975),
    .din61(64'd2305843009213693951),
    .din62(64'd4611686018427387903),
    .din63(64'd9223372036854775807),
    .din64(currWord_keep_V_2_fu_250_p65),
    .dout(currWord_keep_V_2_fu_250_p66)
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
    if ((1'b1 == ap_condition_123)) begin
        if ((1'b1 == ap_condition_139)) begin
            ap_phi_reg_pp0_iter1_currWord_keep_V_reg_199 <= {{ipDataDropFifo_dout[575:512]}};
        end else if ((1'b1 == ap_condition_128)) begin
            ap_phi_reg_pp0_iter1_currWord_keep_V_reg_199 <= currWord_keep_V_2_fu_250_p66;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter1_currWord_keep_V_reg_199 <= ap_phi_reg_pp0_iter0_currWord_keep_V_reg_199;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_346)) begin
        if (((cl_state == 1'd1) & (grp_fu_208_p3 == 1'd1))) begin
            cl_state <= 1'd0;
        end else if (((cl_state == 1'd0) & (grp_fu_208_p3 == 1'd0))) begin
            cl_state <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        cl_state_load_reg_399 <= cl_state;
        tmp_i_reg_403 <= tmp_i_nbreadreq_fu_178_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op28_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ipDataDropFifo_read_reg_427 <= ipDataDropFifo_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_178_p3 == 1'd1) & (cl_state == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_data_V_reg_407 <= tmp_data_V_fu_220_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_178_p3 == 1'd1) & (cl_state == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_last_V_reg_417 <= ipDataDropFifo_dout[32'd576];
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
    if ((((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op39_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op37_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        ipDataCutFifo_blk_n = ipDataCutFifo_full_n;
    end else begin
        ipDataCutFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_151)) begin
        if ((ap_predicate_op39_write_state2 == 1'b1)) begin
            ipDataCutFifo_din = ipDataDropFifo_read_reg_427;
        end else if ((ap_predicate_op37_write_state2 == 1'b1)) begin
            ipDataCutFifo_din = p_0_fu_390_p4;
        end else begin
            ipDataCutFifo_din = 'bx;
        end
    end else begin
        ipDataCutFifo_din = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op39_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op37_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        ipDataCutFifo_write = 1'b1;
    end else begin
        ipDataCutFifo_write = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0) & (ap_done_reg == 1'b0) & (ap_predicate_op28_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0) & (ap_done_reg == 1'b0) & (ap_predicate_op16_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        ipDataDropFifo_blk_n = ipDataDropFifo_empty_n;
    end else begin
        ipDataDropFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op28_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op16_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        ipDataDropFifo_read = 1'b1;
    end else begin
        ipDataDropFifo_read = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op39_write_state2 == 1'b1) & (ipDataCutFifo_full_n == 1'b0)) | ((ap_predicate_op37_write_state2 == 1'b1) & (ipDataCutFifo_full_n == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op28_read_state1 == 1'b1) & (ipDataDropFifo_empty_n == 1'b0)) | ((ap_predicate_op16_read_state1 == 1'b1) & (ipDataDropFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op39_write_state2 == 1'b1) & (ipDataCutFifo_full_n == 1'b0)) | ((ap_predicate_op37_write_state2 == 1'b1) & (ipDataCutFifo_full_n == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op28_read_state1 == 1'b1) & (ipDataDropFifo_empty_n == 1'b0)) | ((ap_predicate_op16_read_state1 == 1'b1) & (ipDataDropFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op39_write_state2 == 1'b1) & (ipDataCutFifo_full_n == 1'b0)) | ((ap_predicate_op37_write_state2 == 1'b1) & (ipDataCutFifo_full_n == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op28_read_state1 == 1'b1) & (ipDataDropFifo_empty_n == 1'b0)) | ((ap_predicate_op16_read_state1 == 1'b1) & (ipDataDropFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((ap_predicate_op28_read_state1 == 1'b1) & (ipDataDropFifo_empty_n == 1'b0)) | ((ap_predicate_op16_read_state1 == 1'b1) & (ipDataDropFifo_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((ap_predicate_op39_write_state2 == 1'b1) & (ipDataCutFifo_full_n == 1'b0)) | ((ap_predicate_op37_write_state2 == 1'b1) & (ipDataCutFifo_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_123 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_128 = ((tmp_i_nbreadreq_fu_178_p3 == 1'd1) & (cl_state == 1'd0) & (grp_fu_208_p3 == 1'd1));
end

always @ (*) begin
    ap_condition_139 = ((tmp_i_nbreadreq_fu_178_p3 == 1'd1) & (cl_state == 1'd0) & (grp_fu_208_p3 == 1'd0));
end

always @ (*) begin
    ap_condition_151 = ((1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_346 = ((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_178_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_currWord_keep_V_reg_199 = 'bx;

always @ (*) begin
    ap_predicate_op16_read_state1 = ((tmp_i_nbreadreq_fu_178_p3 == 1'd1) & (cl_state == 1'd0));
end

always @ (*) begin
    ap_predicate_op28_read_state1 = ((tmp_i_nbreadreq_fu_178_p3 == 1'd1) & (cl_state == 1'd1));
end

always @ (*) begin
    ap_predicate_op37_write_state2 = ((tmp_i_reg_403 == 1'd1) & (cl_state_load_reg_399 == 1'd0));
end

always @ (*) begin
    ap_predicate_op39_write_state2 = ((tmp_i_reg_403 == 1'd1) & (cl_state_load_reg_399 == 1'd1));
end

assign currWord_keep_V_2_fu_250_p65 = {{ipDataDropFifo_dout[29:24]}};

assign grp_fu_208_p3 = ipDataDropFifo_dout[32'd576];

assign p_0_fu_390_p4 = {{{tmp_last_V_reg_417}, {ap_phi_reg_pp0_iter1_currWord_keep_V_reg_199}}, {tmp_data_V_reg_407}};

assign tmp_data_V_fu_220_p1 = ipDataDropFifo_dout[511:0];

assign tmp_i_nbreadreq_fu_178_p3 = ipDataDropFifo_empty_n;

endmodule //ip_handler_top_cut_length