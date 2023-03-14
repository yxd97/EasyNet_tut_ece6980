// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module toe_top_constructPseudoHeader_512_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rxEng_ipMetaFifo_dout,
        rxEng_ipMetaFifo_num_data_valid,
        rxEng_ipMetaFifo_fifo_cap,
        rxEng_ipMetaFifo_empty_n,
        rxEng_ipMetaFifo_read,
        rxEng_pseudoHeaderFifo_din,
        rxEng_pseudoHeaderFifo_num_data_valid,
        rxEng_pseudoHeaderFifo_fifo_cap,
        rxEng_pseudoHeaderFifo_full_n,
        rxEng_pseudoHeaderFifo_write
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
input  [95:0] rxEng_ipMetaFifo_dout;
input  [1:0] rxEng_ipMetaFifo_num_data_valid;
input  [1:0] rxEng_ipMetaFifo_fifo_cap;
input   rxEng_ipMetaFifo_empty_n;
output   rxEng_ipMetaFifo_read;
output  [1023:0] rxEng_pseudoHeaderFifo_din;
input  [1:0] rxEng_pseudoHeaderFifo_num_data_valid;
input  [1:0] rxEng_pseudoHeaderFifo_fifo_cap;
input   rxEng_pseudoHeaderFifo_full_n;
output   rxEng_pseudoHeaderFifo_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rxEng_ipMetaFifo_read;
reg rxEng_pseudoHeaderFifo_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] state_3_load_load_fu_114_p1;
wire   [0:0] tmp_i_nbreadreq_fu_82_p3;
reg    ap_predicate_op18_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] state_3_load_reg_285;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] state_3;
reg   [15:0] header_idx_4;
reg   [95:0] header_header_V_4;
reg    rxEng_ipMetaFifo_blk_n;
wire    ap_block_pp0_stage0;
reg    rxEng_pseudoHeaderFifo_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [511:0] p_Result_244_fu_236_p5;
wire   [0:0] icmp_ln82_fu_230_p2;
wire   [511:0] ap_phi_reg_pp0_iter0_sendWord_data_V_20_reg_103;
reg   [511:0] ap_phi_reg_pp0_iter1_sendWord_data_V_20_reg_103;
wire   [15:0] add_ln85_fu_248_p2;
wire   [95:0] p_Result_s_fu_198_p5;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] tmp_their_address_V_fu_126_p1;
wire   [95:0] p_Result_241_fu_146_p5;
wire   [31:0] tmp_our_address_V_fu_130_p4;
wire   [7:0] tmp_600_i6_fu_180_p4;
wire   [7:0] tmp_i5_fu_170_p4;
wire   [95:0] p_Result_242_fu_158_p5;
wire   [15:0] p_Result_243_fu_190_p3;
wire   [24:0] shl_ln_fu_222_p3;
wire   [576:0] zext_ln174_i_fu_266_p3;
wire   [576:0] or_ln174_fu_274_p2;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_108;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 state_3 = 1'd0;
#0 header_idx_4 = 16'd0;
#0 header_header_V_4 = 96'd28334198897217871282176;
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
    if ((1'b1 == ap_condition_108)) begin
        if (((state_3_load_load_fu_114_p1 == 1'd1) & (icmp_ln82_fu_230_p2 == 1'd1))) begin
            ap_phi_reg_pp0_iter1_sendWord_data_V_20_reg_103 <= p_Result_244_fu_236_p5;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter1_sendWord_data_V_20_reg_103 <= ap_phi_reg_pp0_iter0_sendWord_data_V_20_reg_103;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_108)) begin
        if (((state_3_load_load_fu_114_p1 == 1'd1) & (icmp_ln82_fu_230_p2 == 1'd1))) begin
            header_idx_4 <= add_ln85_fu_248_p2;
        end else if (((tmp_i_nbreadreq_fu_82_p3 == 1'd1) & (state_3 == 1'd0))) begin
            header_idx_4 <= 16'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_108)) begin
        if ((state_3_load_load_fu_114_p1 == 1'd1)) begin
            state_3 <= 1'd0;
        end else if (((tmp_i_nbreadreq_fu_82_p3 == 1'd1) & (state_3 == 1'd0))) begin
            state_3 <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_82_p3 == 1'd1) & (state_3 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        header_header_V_4 <= p_Result_s_fu_198_p5;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        state_3_load_reg_285 <= state_3;
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
    if (((1'b0 == ap_block_pp0_stage0) & (ap_done_reg == 1'b0) & (ap_predicate_op18_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rxEng_ipMetaFifo_blk_n = rxEng_ipMetaFifo_empty_n;
    end else begin
        rxEng_ipMetaFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op18_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rxEng_ipMetaFifo_read = 1'b1;
    end else begin
        rxEng_ipMetaFifo_read = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (state_3_load_reg_285 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rxEng_pseudoHeaderFifo_blk_n = rxEng_pseudoHeaderFifo_full_n;
    end else begin
        rxEng_pseudoHeaderFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (state_3_load_reg_285 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rxEng_pseudoHeaderFifo_write = 1'b1;
    end else begin
        rxEng_pseudoHeaderFifo_write = 1'b0;
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

assign add_ln85_fu_248_p2 = (header_idx_4 + 16'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((state_3_load_reg_285 == 1'd1) & (rxEng_pseudoHeaderFifo_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op18_read_state1 == 1'b1) & (rxEng_ipMetaFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((state_3_load_reg_285 == 1'd1) & (rxEng_pseudoHeaderFifo_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op18_read_state1 == 1'b1) & (rxEng_ipMetaFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((state_3_load_reg_285 == 1'd1) & (rxEng_pseudoHeaderFifo_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op18_read_state1 == 1'b1) & (rxEng_ipMetaFifo_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((ap_predicate_op18_read_state1 == 1'b1) & (rxEng_ipMetaFifo_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((state_3_load_reg_285 == 1'd1) & (rxEng_pseudoHeaderFifo_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_108 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_sendWord_data_V_20_reg_103 = 'bx;

always @ (*) begin
    ap_predicate_op18_read_state1 = ((tmp_i_nbreadreq_fu_82_p3 == 1'd1) & (state_3 == 1'd0));
end

assign icmp_ln82_fu_230_p2 = ((shl_ln_fu_222_p3 < 25'd96) ? 1'b1 : 1'b0);

assign or_ln174_fu_274_p2 = (zext_ln174_i_fu_266_p3 | 577'd247330401473104534047094713089704592935557324103005993786583690272304831728808305726594637031169498012795797127849235911661333176120265159113792272289946597970173123142615040);

assign p_Result_241_fu_146_p5 = {{header_header_V_4[95:32]}, {tmp_their_address_V_fu_126_p1}};

assign p_Result_242_fu_158_p5 = {{p_Result_241_fu_146_p5[95:64]}, {tmp_our_address_V_fu_130_p4}, {p_Result_241_fu_146_p5[31:0]}};

assign p_Result_243_fu_190_p3 = {{tmp_600_i6_fu_180_p4}, {tmp_i5_fu_170_p4}};

assign p_Result_244_fu_236_p5 = {{ap_const_lv512_lc_3[511:96]}, {header_header_V_4}};

assign p_Result_s_fu_198_p5 = {{p_Result_243_fu_190_p3}, {p_Result_242_fu_158_p5[79:0]}};

assign rxEng_pseudoHeaderFifo_din = or_ln174_fu_274_p2;

assign shl_ln_fu_222_p3 = {{header_idx_4}, {9'd0}};

assign state_3_load_load_fu_114_p1 = state_3;

assign tmp_600_i6_fu_180_p4 = {{rxEng_ipMetaFifo_dout[71:64]}};

assign tmp_i5_fu_170_p4 = {{rxEng_ipMetaFifo_dout[79:72]}};

assign tmp_i_nbreadreq_fu_82_p3 = rxEng_ipMetaFifo_empty_n;

assign tmp_our_address_V_fu_130_p4 = {{rxEng_ipMetaFifo_dout[63:32]}};

assign tmp_their_address_V_fu_126_p1 = rxEng_ipMetaFifo_dout[31:0];

assign zext_ln174_i_fu_266_p3 = {{65'd18446744073709551616}, {ap_phi_reg_pp0_iter1_sendWord_data_V_20_reg_103}};

endmodule //toe_top_constructPseudoHeader_512_s