// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module toe_top_pseudoHeaderConstructionNew_512_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        txEng_shift2pseudoFifo_dout,
        txEng_shift2pseudoFifo_num_data_valid,
        txEng_shift2pseudoFifo_fifo_cap,
        txEng_shift2pseudoFifo_empty_n,
        txEng_shift2pseudoFifo_read,
        txEng_tcpMetaFifo_dout,
        txEng_tcpMetaFifo_num_data_valid,
        txEng_tcpMetaFifo_fifo_cap,
        txEng_tcpMetaFifo_empty_n,
        txEng_tcpMetaFifo_read,
        txEng_tcpTupleFifo_dout,
        txEng_tcpTupleFifo_num_data_valid,
        txEng_tcpTupleFifo_fifo_cap,
        txEng_tcpTupleFifo_empty_n,
        txEng_tcpTupleFifo_read,
        txEng_tcpPkgBuffer1_din,
        txEng_tcpPkgBuffer1_num_data_valid,
        txEng_tcpPkgBuffer1_fifo_cap,
        txEng_tcpPkgBuffer1_full_n,
        txEng_tcpPkgBuffer1_write
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
input  [576:0] txEng_shift2pseudoFifo_dout;
input  [1:0] txEng_shift2pseudoFifo_num_data_valid;
input  [1:0] txEng_shift2pseudoFifo_fifo_cap;
input   txEng_shift2pseudoFifo_empty_n;
output   txEng_shift2pseudoFifo_read;
input  [103:0] txEng_tcpMetaFifo_dout;
input  [5:0] txEng_tcpMetaFifo_num_data_valid;
input  [5:0] txEng_tcpMetaFifo_fifo_cap;
input   txEng_tcpMetaFifo_empty_n;
output   txEng_tcpMetaFifo_read;
input  [95:0] txEng_tcpTupleFifo_dout;
input  [5:0] txEng_tcpTupleFifo_num_data_valid;
input  [5:0] txEng_tcpTupleFifo_fifo_cap;
input   txEng_tcpTupleFifo_empty_n;
output   txEng_tcpTupleFifo_read;
output  [576:0] txEng_tcpPkgBuffer1_din;
input  [4:0] txEng_tcpPkgBuffer1_num_data_valid;
input  [4:0] txEng_tcpPkgBuffer1_fifo_cap;
input   txEng_tcpPkgBuffer1_full_n;
output   txEng_tcpPkgBuffer1_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg txEng_shift2pseudoFifo_read;
reg txEng_tcpMetaFifo_read;
reg txEng_tcpTupleFifo_read;
reg[576:0] txEng_tcpPkgBuffer1_din;
reg txEng_tcpPkgBuffer1_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [1:0] state_1_load_load_fu_304_p1;
wire   [0:0] grp_nbreadreq_fu_222_p3;
reg    ap_predicate_op27_read_state1;
reg    ap_predicate_op55_read_state1;
wire   [0:0] tmp_i_nbreadreq_fu_236_p3;
wire   [0:0] tmp_428_i_nbreadreq_fu_244_p3;
reg    ap_predicate_op66_read_state1;
reg    ap_predicate_op73_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [1:0] state_1_load_reg_1009;
reg   [0:0] tmp_i_340_reg_1018;
reg    ap_predicate_op121_write_state2;
reg   [0:0] tmp_427_i_reg_1058;
reg    ap_predicate_op143_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [1:0] state_1;
reg   [15:0] header_idx_1;
reg   [255:0] header_header_V_1;
reg   [0:0] hasBody;
reg   [3:0] win_shift_V;
reg   [0:0] isSYN;
reg    txEng_tcpMetaFifo_blk_n;
wire    ap_block_pp0_stage0;
reg    txEng_tcpTupleFifo_blk_n;
reg    txEng_tcpPkgBuffer1_blk_n;
reg    txEng_shift2pseudoFifo_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] hasBody_load_reg_1013;
wire   [511:0] tmp_data_V_3_fu_321_p1;
wire   [511:0] p_Result_189_fu_339_p5;
wire   [0:0] icmp_ln82_1_fu_333_p2;
reg   [64:0] tmp_74_reg_1035;
wire   [511:0] p_Result_186_fu_401_p5;
wire   [0:0] icmp_ln82_fu_395_p2;
reg   [3:0] win_shift_V_load_reg_1048;
wire   [0:0] icmp_ln1069_fu_437_p2;
reg   [0:0] icmp_ln1069_reg_1053;
reg   [576:0] txEng_shift2pseudoFifo_read_reg_1062;
wire   [511:0] ap_phi_reg_pp0_iter0_currWord_data_V_reg_271;
reg   [511:0] ap_phi_reg_pp0_iter1_currWord_data_V_reg_271;
wire   [511:0] ap_phi_reg_pp0_iter0_sendWord_data_V_8_reg_280;
reg   [511:0] ap_phi_reg_pp0_iter1_sendWord_data_V_8_reg_280;
wire   [1:0] select_ln1183_cast_i_fu_373_p3;
wire   [1:0] select_ln1123_fu_419_p3;
wire   [1:0] select_ln1102_fu_859_p3;
wire   [0:0] grp_fu_291_p3;
wire   [15:0] grp_fu_299_p2;
wire   [255:0] p_Result_s_fu_841_p5;
wire   [0:0] and_ln1095_fu_789_p2;
wire   [3:0] tmp_win_shift_V_fu_491_p4;
wire   [0:0] tmp_syn_V_fu_449_p3;
wire   [576:0] p_08_fu_873_p3;
reg    ap_block_pp0_stage0_01001;
wire   [576:0] p_09_fu_994_p6;
wire   [16:0] tmp_291_fu_325_p3;
wire   [0:0] xor_ln1183_fu_367_p2;
wire   [16:0] tmp_287_fu_387_p3;
wire   [31:0] tmp_srcIp_V_fu_501_p1;
wire   [255:0] p_Result_178_fu_521_p5;
wire   [31:0] tmp_dstIp_V_fu_505_p4;
wire   [15:0] tmp_length_V_fu_465_p4;
wire   [15:0] len_V_fu_545_p2;
wire   [7:0] tmp_438_i_fu_629_p4;
wire   [7:0] tmp_437_i_fu_619_p4;
wire   [7:0] tmp_436_i_fu_609_p4;
wire   [7:0] tmp_435_i_fu_599_p4;
wire   [7:0] trunc_ln674_7_fu_595_p1;
wire   [7:0] tmp_433_i_fu_585_p4;
wire   [7:0] tmp_432_i_fu_575_p4;
wire   [7:0] tmp_431_i_fu_565_p4;
wire   [31:0] tmp_s_fu_639_p4;
wire   [7:0] trunc_ln674_fu_561_p1;
wire   [7:0] tmp_429_i_fu_551_p4;
wire   [255:0] p_Result_179_fu_533_p5;
wire   [111:0] tmp_348_i_fu_649_p12;
wire   [0:0] icmp_ln1069_3_fu_693_p2;
wire   [0:0] and_ln1069_1_fu_699_p2;
wire   [2:0] select_ln1069_4_fu_705_p3;
wire   [2:0] select_ln1069_3_fu_713_p3;
wire   [255:0] p_Result_180_fu_675_p5;
wire   [3:0] zext_ln1069_fu_721_p1;
wire   [255:0] p_Result_181_fu_725_p5;
wire   [0:0] tmp_fin_V_fu_457_p3;
wire   [255:0] p_Result_182_fu_737_p4;
wire   [255:0] p_Result_183_fu_747_p4;
wire   [0:0] tmp_rst_V_fu_483_p3;
wire   [255:0] p_Result_184_fu_757_p4;
wire   [0:0] tmp_ack_V_fu_475_p3;
wire   [0:0] icmp_ln1095_fu_783_p2;
wire   [0:0] xor_ln947_fu_777_p2;
wire   [7:0] tmp_440_i_fu_817_p4;
wire   [7:0] tmp_439_i_fu_807_p4;
wire   [16:0] tmp_351_i_fu_827_p4;
wire   [255:0] p_Result_185_fu_767_p4;
wire   [31:0] zext_ln414_1_fu_837_p1;
wire   [7:0] zext_ln414_fu_902_p1;
wire   [24:0] tmp_350_i_fu_905_p4;
wire   [511:0] p_Result_187_fu_890_p5;
wire   [31:0] zext_ln391_fu_915_p1;
wire   [511:0] p_Result_188_fu_919_p5;
wire   [0:0] and_ln1069_fu_939_p2;
wire   [511:0] sendWord_data_V_6_fu_931_p3;
wire   [511:0] sendWord_data_V_7_fu_944_p3;
wire   [512:0] tmp_fu_952_p3;
wire   [35:0] select_ln1069_fu_966_p3;
wire   [35:0] select_ln1069_1_fu_974_p3;
wire   [512:0] or_ln174_fu_960_p2;
wire   [0:0] sendWord_last_V_fu_881_p2;
wire  signed [38:0] sext_ln174_fu_982_p1;
wire   [0:0] tmp_289_fu_986_p3;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_183;
reg    ap_condition_209;
reg    ap_condition_174;
reg    ap_condition_222;
reg    ap_condition_68;
reg    ap_condition_254;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 state_1 = 2'd0;
#0 header_idx_1 = 16'd0;
#0 header_header_V_1 = 256'd28334198897217871282176;
#0 hasBody = 1'd0;
#0 win_shift_V = 4'd0;
#0 isSYN = 1'd0;
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
    if ((1'b1 == ap_condition_174)) begin
        if ((1'b1 == ap_condition_209)) begin
            ap_phi_reg_pp0_iter1_currWord_data_V_reg_271 <= tmp_data_V_3_fu_321_p1;
        end else if ((1'b1 == ap_condition_183)) begin
            ap_phi_reg_pp0_iter1_currWord_data_V_reg_271 <= p_Result_189_fu_339_p5;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter1_currWord_data_V_reg_271 <= ap_phi_reg_pp0_iter0_currWord_data_V_reg_271;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_174)) begin
        if (((state_1_load_load_fu_304_p1 == 2'd1) & (icmp_ln82_fu_395_p2 == 1'd1))) begin
            ap_phi_reg_pp0_iter1_sendWord_data_V_8_reg_280 <= p_Result_186_fu_401_p5;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter1_sendWord_data_V_8_reg_280 <= ap_phi_reg_pp0_iter0_sendWord_data_V_8_reg_280;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_428_i_nbreadreq_fu_244_p3 == 1'd1) & (tmp_i_nbreadreq_fu_236_p3 == 1'd1) & (state_1 == 2'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        header_idx_1 <= 16'd0;
    end else if ((((grp_nbreadreq_fu_222_p3 == 1'd1) & (state_1 == 2'd2) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln82_1_fu_333_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((state_1_load_load_fu_304_p1 == 2'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln82_fu_395_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        header_idx_1 <= grp_fu_299_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_174)) begin
        if ((1'b1 == ap_condition_68)) begin
            state_1 <= select_ln1102_fu_859_p3;
        end else if ((1'b1 == ap_condition_222)) begin
            state_1 <= 2'd0;
        end else if ((state_1_load_load_fu_304_p1 == 2'd1)) begin
            state_1 <= select_ln1123_fu_419_p3;
        end else if (((grp_nbreadreq_fu_222_p3 == 1'd1) & (state_1 == 2'd2))) begin
            state_1 <= select_ln1183_cast_i_fu_373_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_428_i_nbreadreq_fu_244_p3 == 1'd1) & (tmp_i_nbreadreq_fu_236_p3 == 1'd1) & (state_1 == 2'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        hasBody <= and_ln1095_fu_789_p2;
        header_header_V_1 <= p_Result_s_fu_841_p5;
        isSYN <= txEng_tcpMetaFifo_dout[32'd102];
        win_shift_V <= {{txEng_tcpMetaFifo_dout[83:80]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        hasBody_load_reg_1013 <= hasBody;
        state_1_load_reg_1009 <= state_1;
    end
end

always @ (posedge ap_clk) begin
    if (((state_1_load_load_fu_304_p1 == 2'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln1069_reg_1053 <= icmp_ln1069_fu_437_p2;
        win_shift_V_load_reg_1048 <= win_shift_V;
    end
end

always @ (posedge ap_clk) begin
    if (((state_1 == 2'd3) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_427_i_reg_1058 <= grp_nbreadreq_fu_222_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_nbreadreq_fu_222_p3 == 1'd1) & (state_1 == 2'd2) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_74_reg_1035 <= {{txEng_shift2pseudoFifo_dout[576:512]}};
    end
end

always @ (posedge ap_clk) begin
    if (((state_1 == 2'd2) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_340_reg_1018 <= grp_nbreadreq_fu_222_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op55_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        txEng_shift2pseudoFifo_read_reg_1062 <= txEng_shift2pseudoFifo_dout;
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
    if ((((ap_done_reg == 1'b0) & (ap_predicate_op55_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_done_reg == 1'b0) & (ap_predicate_op27_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        txEng_shift2pseudoFifo_blk_n = txEng_shift2pseudoFifo_empty_n;
    end else begin
        txEng_shift2pseudoFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_predicate_op55_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op27_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        txEng_shift2pseudoFifo_read = 1'b1;
    end else begin
        txEng_shift2pseudoFifo_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op66_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        txEng_tcpMetaFifo_blk_n = txEng_tcpMetaFifo_empty_n;
    end else begin
        txEng_tcpMetaFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op66_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        txEng_tcpMetaFifo_read = 1'b1;
    end else begin
        txEng_tcpMetaFifo_read = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op143_write_state2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op121_write_state2 == 1'b1)) | ((state_1_load_reg_1009 == 2'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        txEng_tcpPkgBuffer1_blk_n = txEng_tcpPkgBuffer1_full_n;
    end else begin
        txEng_tcpPkgBuffer1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_254)) begin
        if ((ap_predicate_op143_write_state2 == 1'b1)) begin
            txEng_tcpPkgBuffer1_din = txEng_shift2pseudoFifo_read_reg_1062;
        end else if ((state_1_load_reg_1009 == 2'd1)) begin
            txEng_tcpPkgBuffer1_din = p_09_fu_994_p6;
        end else if ((ap_predicate_op121_write_state2 == 1'b1)) begin
            txEng_tcpPkgBuffer1_din = p_08_fu_873_p3;
        end else begin
            txEng_tcpPkgBuffer1_din = 'bx;
        end
    end else begin
        txEng_tcpPkgBuffer1_din = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op143_write_state2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op121_write_state2 == 1'b1)) | ((state_1_load_reg_1009 == 2'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        txEng_tcpPkgBuffer1_write = 1'b1;
    end else begin
        txEng_tcpPkgBuffer1_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op73_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        txEng_tcpTupleFifo_blk_n = txEng_tcpTupleFifo_empty_n;
    end else begin
        txEng_tcpTupleFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op73_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        txEng_tcpTupleFifo_read = 1'b1;
    end else begin
        txEng_tcpTupleFifo_read = 1'b0;
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

assign and_ln1069_1_fu_699_p2 = (tmp_syn_V_fu_449_p3 & icmp_ln1069_3_fu_693_p2);

assign and_ln1069_fu_939_p2 = (isSYN & icmp_ln1069_reg_1053);

assign and_ln1095_fu_789_p2 = (xor_ln947_fu_777_p2 & icmp_ln1095_fu_783_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op73_read_state1 == 1'b1) & (txEng_tcpTupleFifo_empty_n == 1'b0)) | ((ap_predicate_op66_read_state1 == 1'b1) & (txEng_tcpMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op55_read_state1 == 1'b1) & (txEng_shift2pseudoFifo_empty_n == 1'b0)) | ((ap_predicate_op27_read_state1 == 1'b1) & (txEng_shift2pseudoFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((txEng_tcpPkgBuffer1_full_n == 1'b0) & (ap_predicate_op143_write_state2 == 1'b1)) | ((txEng_tcpPkgBuffer1_full_n == 1'b0) & (ap_predicate_op121_write_state2 == 1'b1)) | ((state_1_load_reg_1009 == 2'd1) & (txEng_tcpPkgBuffer1_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op73_read_state1 == 1'b1) & (txEng_tcpTupleFifo_empty_n == 1'b0)) | ((ap_predicate_op66_read_state1 == 1'b1) & (txEng_tcpMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op55_read_state1 == 1'b1) & (txEng_shift2pseudoFifo_empty_n == 1'b0)) | ((ap_predicate_op27_read_state1 == 1'b1) & (txEng_shift2pseudoFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((txEng_tcpPkgBuffer1_full_n == 1'b0) & (ap_predicate_op143_write_state2 == 1'b1)) | ((txEng_tcpPkgBuffer1_full_n == 1'b0) & (ap_predicate_op121_write_state2 == 1'b1)) | ((state_1_load_reg_1009 == 2'd1) & (txEng_tcpPkgBuffer1_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op73_read_state1 == 1'b1) & (txEng_tcpTupleFifo_empty_n == 1'b0)) | ((ap_predicate_op66_read_state1 == 1'b1) & (txEng_tcpMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op55_read_state1 == 1'b1) & (txEng_shift2pseudoFifo_empty_n == 1'b0)) | ((ap_predicate_op27_read_state1 == 1'b1) & (txEng_shift2pseudoFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((txEng_tcpPkgBuffer1_full_n == 1'b0) & (ap_predicate_op143_write_state2 == 1'b1)) | ((txEng_tcpPkgBuffer1_full_n == 1'b0) & (ap_predicate_op121_write_state2 == 1'b1)) | ((state_1_load_reg_1009 == 2'd1) & (txEng_tcpPkgBuffer1_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((ap_predicate_op73_read_state1 == 1'b1) & (txEng_tcpTupleFifo_empty_n == 1'b0)) | ((ap_predicate_op66_read_state1 == 1'b1) & (txEng_tcpMetaFifo_empty_n == 1'b0)) | ((ap_predicate_op55_read_state1 == 1'b1) & (txEng_shift2pseudoFifo_empty_n == 1'b0)) | ((ap_predicate_op27_read_state1 == 1'b1) & (txEng_shift2pseudoFifo_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((txEng_tcpPkgBuffer1_full_n == 1'b0) & (ap_predicate_op143_write_state2 == 1'b1)) | ((txEng_tcpPkgBuffer1_full_n == 1'b0) & (ap_predicate_op121_write_state2 == 1'b1)) | ((state_1_load_reg_1009 == 2'd1) & (txEng_tcpPkgBuffer1_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_174 = ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

always @ (*) begin
    ap_condition_183 = ((grp_nbreadreq_fu_222_p3 == 1'd1) & (state_1 == 2'd2) & (icmp_ln82_1_fu_333_p2 == 1'd1));
end

always @ (*) begin
    ap_condition_209 = ((grp_nbreadreq_fu_222_p3 == 1'd1) & (state_1 == 2'd2) & (icmp_ln82_1_fu_333_p2 == 1'd0));
end

always @ (*) begin
    ap_condition_222 = ((grp_nbreadreq_fu_222_p3 == 1'd1) & (state_1 == 2'd3) & (grp_fu_291_p3 == 1'd1));
end

always @ (*) begin
    ap_condition_254 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_01001));
end

always @ (*) begin
    ap_condition_68 = ((tmp_428_i_nbreadreq_fu_244_p3 == 1'd1) & (tmp_i_nbreadreq_fu_236_p3 == 1'd1) & (state_1 == 2'd0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_currWord_data_V_reg_271 = 'bx;

assign ap_phi_reg_pp0_iter0_sendWord_data_V_8_reg_280 = 'bx;

always @ (*) begin
    ap_predicate_op121_write_state2 = ((tmp_i_340_reg_1018 == 1'd1) & (state_1_load_reg_1009 == 2'd2));
end

always @ (*) begin
    ap_predicate_op143_write_state2 = ((state_1_load_reg_1009 == 2'd3) & (tmp_427_i_reg_1058 == 1'd1));
end

always @ (*) begin
    ap_predicate_op27_read_state1 = ((grp_nbreadreq_fu_222_p3 == 1'd1) & (state_1 == 2'd2));
end

always @ (*) begin
    ap_predicate_op55_read_state1 = ((grp_nbreadreq_fu_222_p3 == 1'd1) & (state_1 == 2'd3));
end

always @ (*) begin
    ap_predicate_op66_read_state1 = ((tmp_428_i_nbreadreq_fu_244_p3 == 1'd1) & (tmp_i_nbreadreq_fu_236_p3 == 1'd1) & (state_1 == 2'd0));
end

always @ (*) begin
    ap_predicate_op73_read_state1 = ((tmp_428_i_nbreadreq_fu_244_p3 == 1'd1) & (tmp_i_nbreadreq_fu_236_p3 == 1'd1) & (state_1 == 2'd0));
end

assign grp_fu_291_p3 = txEng_shift2pseudoFifo_dout[32'd576];

assign grp_fu_299_p2 = (header_idx_1 + 16'd1);

assign grp_nbreadreq_fu_222_p3 = txEng_shift2pseudoFifo_empty_n;

assign icmp_ln1069_3_fu_693_p2 = ((tmp_win_shift_V_fu_491_p4 == 4'd0) ? 1'b1 : 1'b0);

assign icmp_ln1069_fu_437_p2 = ((win_shift_V == 4'd0) ? 1'b1 : 1'b0);

assign icmp_ln1095_fu_783_p2 = ((tmp_length_V_fu_465_p4 != 16'd0) ? 1'b1 : 1'b0);

assign icmp_ln82_1_fu_333_p2 = ((tmp_291_fu_325_p3 == 17'd0) ? 1'b1 : 1'b0);

assign icmp_ln82_fu_395_p2 = ((tmp_287_fu_387_p3 == 17'd0) ? 1'b1 : 1'b0);

assign len_V_fu_545_p2 = (tmp_length_V_fu_465_p4 + 16'd20);

assign or_ln174_fu_960_p2 = (tmp_fu_952_p3 | 513'd13407807929942597099574024998205846127479365820592393377723561443721764030073546976801874298166903427690031858186486050853753882811946569946433649006084096);

assign p_08_fu_873_p3 = {{tmp_74_reg_1035}, {ap_phi_reg_pp0_iter1_currWord_data_V_reg_271}};

assign p_09_fu_994_p6 = {{{{{sendWord_last_V_fu_881_p2}, {24'd0}}, {sext_ln174_fu_982_p1}}, {tmp_289_fu_986_p3}}, {sendWord_data_V_7_fu_944_p3}};

assign p_Result_178_fu_521_p5 = {{header_header_V_1[255:32]}, {tmp_srcIp_V_fu_501_p1}};

assign p_Result_179_fu_533_p5 = {{p_Result_178_fu_521_p5[255:64]}, {tmp_dstIp_V_fu_505_p4}, {p_Result_178_fu_521_p5[31:0]}};

assign p_Result_180_fu_675_p5 = {{p_Result_179_fu_533_p5[255:192]}, {tmp_348_i_fu_649_p12}, {p_Result_179_fu_533_p5[79:0]}};

assign p_Result_181_fu_725_p5 = {{p_Result_180_fu_675_p5[255:200]}, {zext_ln1069_fu_721_p1}, {p_Result_180_fu_675_p5[195:0]}};

assign p_Result_182_fu_737_p4 = {p_Result_181_fu_725_p5[256 - 1:201], |(tmp_fin_V_fu_457_p3), p_Result_181_fu_725_p5[199:0]};

assign p_Result_183_fu_747_p4 = {p_Result_182_fu_737_p4[256 - 1:202], |(tmp_syn_V_fu_449_p3), p_Result_182_fu_737_p4[200:0]};

assign p_Result_184_fu_757_p4 = {p_Result_183_fu_747_p4[256 - 1:203], |(tmp_rst_V_fu_483_p3), p_Result_183_fu_747_p4[201:0]};

assign p_Result_185_fu_767_p4 = {p_Result_184_fu_757_p4[256 - 1:205], |(tmp_ack_V_fu_475_p3), p_Result_184_fu_757_p4[203:0]};

assign p_Result_186_fu_401_p5 = {{ap_const_lv512_lc_3[511:256]}, {header_header_V_1}};

assign p_Result_187_fu_890_p5 = {{ap_phi_reg_pp0_iter1_sendWord_data_V_8_reg_280[511:288]}, {32'd1049602}, {ap_phi_reg_pp0_iter1_sendWord_data_V_8_reg_280[255:0]}};

assign p_Result_188_fu_919_p5 = {{p_Result_187_fu_890_p5[511:320]}, {zext_ln391_fu_915_p1}, {p_Result_187_fu_890_p5[287:0]}};

assign p_Result_189_fu_339_p5 = {{tmp_data_V_3_fu_321_p1[511:256]}, {header_header_V_1}};

assign p_Result_s_fu_841_p5 = {{p_Result_185_fu_767_p4[255:240]}, {zext_ln414_1_fu_837_p1}, {p_Result_185_fu_767_p4[207:0]}};

assign select_ln1069_1_fu_974_p3 = ((isSYN[0:0] == 1'b1) ? select_ln1069_fu_966_p3 : 36'd2147483647);

assign select_ln1069_3_fu_713_p3 = ((tmp_syn_V_fu_449_p3[0:0] == 1'b1) ? select_ln1069_4_fu_705_p3 : 3'd5);

assign select_ln1069_4_fu_705_p3 = ((and_ln1069_1_fu_699_p2[0:0] == 1'b1) ? 3'd6 : 3'd7);

assign select_ln1069_fu_966_p3 = ((and_ln1069_fu_939_p2[0:0] == 1'b1) ? 36'd34359738367 : 36'd68719476735);

assign select_ln1102_fu_859_p3 = ((and_ln1095_fu_789_p2[0:0] == 1'b1) ? 2'd2 : 2'd1);

assign select_ln1123_fu_419_p3 = ((hasBody[0:0] == 1'b1) ? 2'd3 : 2'd0);

assign select_ln1183_cast_i_fu_373_p3 = ((xor_ln1183_fu_367_p2[0:0] == 1'b1) ? 2'd3 : 2'd0);

assign sendWord_data_V_6_fu_931_p3 = ((isSYN[0:0] == 1'b1) ? p_Result_188_fu_919_p5 : ap_phi_reg_pp0_iter1_sendWord_data_V_8_reg_280);

assign sendWord_data_V_7_fu_944_p3 = ((and_ln1069_fu_939_p2[0:0] == 1'b1) ? p_Result_187_fu_890_p5 : sendWord_data_V_6_fu_931_p3);

assign sendWord_last_V_fu_881_p2 = (hasBody_load_reg_1013 ^ 1'd1);

assign sext_ln174_fu_982_p1 = $signed(select_ln1069_1_fu_974_p3);

assign state_1_load_load_fu_304_p1 = state_1;

assign tmp_287_fu_387_p3 = {{header_idx_1}, {1'd0}};

assign tmp_289_fu_986_p3 = or_ln174_fu_960_p2[32'd512];

assign tmp_291_fu_325_p3 = {{header_idx_1}, {1'd0}};

assign tmp_348_i_fu_649_p12 = {{{{{{{{{{{tmp_438_i_fu_629_p4}, {tmp_437_i_fu_619_p4}}, {tmp_436_i_fu_609_p4}}, {tmp_435_i_fu_599_p4}}, {trunc_ln674_7_fu_595_p1}}, {tmp_433_i_fu_585_p4}}, {tmp_432_i_fu_575_p4}}, {tmp_431_i_fu_565_p4}}, {tmp_s_fu_639_p4}}, {trunc_ln674_fu_561_p1}}, {tmp_429_i_fu_551_p4}};

assign tmp_350_i_fu_905_p4 = {{{{1'd0}, {zext_ln414_fu_902_p1}}}, {16'd771}};

assign tmp_351_i_fu_827_p4 = {{{{1'd0}, {tmp_440_i_fu_817_p4}}}, {tmp_439_i_fu_807_p4}};

assign tmp_428_i_nbreadreq_fu_244_p3 = txEng_tcpTupleFifo_empty_n;

assign tmp_429_i_fu_551_p4 = {{len_V_fu_545_p2[15:8]}};

assign tmp_431_i_fu_565_p4 = {{txEng_tcpMetaFifo_dout[31:24]}};

assign tmp_432_i_fu_575_p4 = {{txEng_tcpMetaFifo_dout[23:16]}};

assign tmp_433_i_fu_585_p4 = {{txEng_tcpMetaFifo_dout[15:8]}};

assign tmp_435_i_fu_599_p4 = {{txEng_tcpMetaFifo_dout[63:56]}};

assign tmp_436_i_fu_609_p4 = {{txEng_tcpMetaFifo_dout[55:48]}};

assign tmp_437_i_fu_619_p4 = {{txEng_tcpMetaFifo_dout[47:40]}};

assign tmp_438_i_fu_629_p4 = {{txEng_tcpMetaFifo_dout[39:32]}};

assign tmp_439_i_fu_807_p4 = {{txEng_tcpMetaFifo_dout[79:72]}};

assign tmp_440_i_fu_817_p4 = {{txEng_tcpMetaFifo_dout[71:64]}};

assign tmp_ack_V_fu_475_p3 = txEng_tcpMetaFifo_dout[32'd100];

assign tmp_data_V_3_fu_321_p1 = txEng_shift2pseudoFifo_dout[511:0];

assign tmp_dstIp_V_fu_505_p4 = {{txEng_tcpTupleFifo_dout[63:32]}};

assign tmp_fin_V_fu_457_p3 = txEng_tcpMetaFifo_dout[32'd103];

assign tmp_fu_952_p3 = {{1'd0}, {sendWord_data_V_7_fu_944_p3}};

assign tmp_i_nbreadreq_fu_236_p3 = txEng_tcpMetaFifo_empty_n;

assign tmp_length_V_fu_465_p4 = {{txEng_tcpMetaFifo_dout[99:84]}};

assign tmp_rst_V_fu_483_p3 = txEng_tcpMetaFifo_dout[32'd101];

assign tmp_s_fu_639_p4 = {{txEng_tcpTupleFifo_dout[95:64]}};

assign tmp_srcIp_V_fu_501_p1 = txEng_tcpTupleFifo_dout[31:0];

assign tmp_syn_V_fu_449_p3 = txEng_tcpMetaFifo_dout[32'd102];

assign tmp_win_shift_V_fu_491_p4 = {{txEng_tcpMetaFifo_dout[83:80]}};

assign trunc_ln674_7_fu_595_p1 = txEng_tcpMetaFifo_dout[7:0];

assign trunc_ln674_fu_561_p1 = len_V_fu_545_p2[7:0];

assign xor_ln1183_fu_367_p2 = (grp_fu_291_p3 ^ 1'd1);

assign xor_ln947_fu_777_p2 = (tmp_syn_V_fu_449_p3 ^ 1'd1);

assign zext_ln1069_fu_721_p1 = select_ln1069_3_fu_713_p3;

assign zext_ln391_fu_915_p1 = tmp_350_i_fu_905_p4;

assign zext_ln414_1_fu_837_p1 = tmp_351_i_fu_827_p4;

assign zext_ln414_fu_902_p1 = win_shift_V_load_reg_1048;

endmodule //toe_top_pseudoHeaderConstructionNew_512_s
