// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module toe_top_rshiftWordByOctet_net_axis_512_512_53_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        txEng_tcpPkgBuffer3_dout,
        txEng_tcpPkgBuffer3_num_data_valid,
        txEng_tcpPkgBuffer3_fifo_cap,
        txEng_tcpPkgBuffer3_empty_n,
        txEng_tcpPkgBuffer3_read,
        txEng_tcpPkgBuffer4_din,
        txEng_tcpPkgBuffer4_num_data_valid,
        txEng_tcpPkgBuffer4_fifo_cap,
        txEng_tcpPkgBuffer4_full_n,
        txEng_tcpPkgBuffer4_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [576:0] txEng_tcpPkgBuffer3_dout;
input  [1:0] txEng_tcpPkgBuffer3_num_data_valid;
input  [1:0] txEng_tcpPkgBuffer3_fifo_cap;
input   txEng_tcpPkgBuffer3_empty_n;
output   txEng_tcpPkgBuffer3_read;
output  [576:0] txEng_tcpPkgBuffer4_din;
input  [1:0] txEng_tcpPkgBuffer4_num_data_valid;
input  [1:0] txEng_tcpPkgBuffer4_fifo_cap;
input   txEng_tcpPkgBuffer4_full_n;
output   txEng_tcpPkgBuffer4_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg txEng_tcpPkgBuffer3_read;
reg[576:0] txEng_tcpPkgBuffer4_din;
reg txEng_tcpPkgBuffer4_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] fsmState_load_load_fu_136_p1;
wire   [0:0] tmp_i_nbreadreq_fu_76_p3;
reg    ap_predicate_op18_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] fsmState_load_reg_260;
reg   [0:0] tmp_i_reg_274;
reg   [0:0] rs_firstWord_load_reg_281;
reg    ap_predicate_op45_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] fsmState;
reg   [511:0] prevWord_data_V_4;
reg   [63:0] prevWord_keep_V_7;
reg   [0:0] rs_firstWord;
reg    txEng_tcpPkgBuffer3_blk_n;
wire    ap_block_pp0_stage0;
reg    txEng_tcpPkgBuffer4_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [511:0] p_Val2_s_reg_264;
reg   [63:0] p_Val2_12_reg_269;
wire   [0:0] rs_firstWord_load_load_fu_170_p1;
wire   [95:0] trunc_ln674_fu_174_p1;
reg   [95:0] trunc_ln674_reg_285;
reg   [11:0] tmp_411_i_reg_290;
wire   [0:0] sendWord_last_V_fu_198_p2;
reg   [0:0] sendWord_last_V_reg_295;
reg   [0:0] ap_phi_mux_sendWord_last_V_3_phi_fu_100_p4;
wire   [0:0] ap_phi_reg_pp0_iter0_sendWord_last_V_3_reg_97;
reg   [0:0] ap_phi_mux_rs_firstWord_new_0_i_phi_fu_110_p4;
wire   [0:0] ap_phi_reg_pp0_iter0_rs_firstWord_new_0_i_reg_107;
wire   [0:0] currWord_last_V_fu_162_p3;
wire   [511:0] currWord_data_V_fu_148_p1;
wire   [576:0] p_0_fu_235_p6;
reg    ap_block_pp0_stage0_01001;
wire   [576:0] p_03_fu_247_p5;
wire   [51:0] tmp_412_i_fu_188_p4;
wire   [51:0] grp_fu_127_p4;
wire   [415:0] grp_fu_118_p4;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_147;
reg    ap_condition_132;
reg    ap_condition_166;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 fsmState = 1'd0;
#0 prevWord_data_V_4 = 512'd0;
#0 prevWord_keep_V_7 = 64'd0;
#0 rs_firstWord = 1'd1;
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
    if ((1'b1 == ap_condition_132)) begin
        if ((fsmState_load_load_fu_136_p1 == 1'd1)) begin
            fsmState <= 1'd0;
        end else if ((1'b1 == ap_condition_147)) begin
            fsmState <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        fsmState_load_reg_260 <= fsmState;
        p_Val2_12_reg_269 <= prevWord_keep_V_7;
        p_Val2_s_reg_264 <= prevWord_data_V_4;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_76_p3 == 1'd1) & (fsmState == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        prevWord_data_V_4 <= currWord_data_V_fu_148_p1;
        prevWord_keep_V_7 <= {{txEng_tcpPkgBuffer3_dout[575:512]}};
        rs_firstWord <= ap_phi_mux_rs_firstWord_new_0_i_phi_fu_110_p4;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_76_p3 == 1'd1) & (fsmState == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rs_firstWord_load_reg_281 <= rs_firstWord;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_76_p3 == 1'd1) & (fsmState == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (rs_firstWord_load_load_fu_170_p1 == 1'd0))) begin
        sendWord_last_V_reg_295 <= sendWord_last_V_fu_198_p2;
        tmp_411_i_reg_290 <= {{txEng_tcpPkgBuffer3_dout[523:512]}};
        trunc_ln674_reg_285 <= trunc_ln674_fu_174_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (fsmState == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_i_reg_274 <= tmp_i_nbreadreq_fu_76_p3;
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
    if (((tmp_i_nbreadreq_fu_76_p3 == 1'd1) & (fsmState == 1'd0))) begin
        if ((currWord_last_V_fu_162_p3 == 1'd0)) begin
            ap_phi_mux_rs_firstWord_new_0_i_phi_fu_110_p4 = 1'd0;
        end else if ((currWord_last_V_fu_162_p3 == 1'd1)) begin
            ap_phi_mux_rs_firstWord_new_0_i_phi_fu_110_p4 = 1'd1;
        end else begin
            ap_phi_mux_rs_firstWord_new_0_i_phi_fu_110_p4 = ap_phi_reg_pp0_iter0_rs_firstWord_new_0_i_reg_107;
        end
    end else begin
        ap_phi_mux_rs_firstWord_new_0_i_phi_fu_110_p4 = ap_phi_reg_pp0_iter0_rs_firstWord_new_0_i_reg_107;
    end
end

always @ (*) begin
    if (((tmp_i_nbreadreq_fu_76_p3 == 1'd1) & (fsmState == 1'd0))) begin
        if ((rs_firstWord_load_load_fu_170_p1 == 1'd1)) begin
            ap_phi_mux_sendWord_last_V_3_phi_fu_100_p4 = 1'd0;
        end else if ((rs_firstWord_load_load_fu_170_p1 == 1'd0)) begin
            ap_phi_mux_sendWord_last_V_3_phi_fu_100_p4 = sendWord_last_V_fu_198_p2;
        end else begin
            ap_phi_mux_sendWord_last_V_3_phi_fu_100_p4 = ap_phi_reg_pp0_iter0_sendWord_last_V_3_reg_97;
        end
    end else begin
        ap_phi_mux_sendWord_last_V_3_phi_fu_100_p4 = ap_phi_reg_pp0_iter0_sendWord_last_V_3_reg_97;
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
        txEng_tcpPkgBuffer3_blk_n = txEng_tcpPkgBuffer3_empty_n;
    end else begin
        txEng_tcpPkgBuffer3_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op18_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        txEng_tcpPkgBuffer3_read = 1'b1;
    end else begin
        txEng_tcpPkgBuffer3_read = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0) & (fsmState_load_reg_260 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op45_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        txEng_tcpPkgBuffer4_blk_n = txEng_tcpPkgBuffer4_full_n;
    end else begin
        txEng_tcpPkgBuffer4_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_166)) begin
        if ((fsmState_load_reg_260 == 1'd1)) begin
            txEng_tcpPkgBuffer4_din = p_03_fu_247_p5;
        end else if ((ap_predicate_op45_write_state2 == 1'b1)) begin
            txEng_tcpPkgBuffer4_din = p_0_fu_235_p6;
        end else begin
            txEng_tcpPkgBuffer4_din = 'bx;
        end
    end else begin
        txEng_tcpPkgBuffer4_din = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (fsmState_load_reg_260 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op45_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        txEng_tcpPkgBuffer4_write = 1'b1;
    end else begin
        txEng_tcpPkgBuffer4_write = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((fsmState_load_reg_260 == 1'd1) & (txEng_tcpPkgBuffer4_full_n == 1'b0)) | ((ap_predicate_op45_write_state2 == 1'b1) & (txEng_tcpPkgBuffer4_full_n == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op18_read_state1 == 1'b1) & (txEng_tcpPkgBuffer3_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((fsmState_load_reg_260 == 1'd1) & (txEng_tcpPkgBuffer4_full_n == 1'b0)) | ((ap_predicate_op45_write_state2 == 1'b1) & (txEng_tcpPkgBuffer4_full_n == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op18_read_state1 == 1'b1) & (txEng_tcpPkgBuffer3_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((fsmState_load_reg_260 == 1'd1) & (txEng_tcpPkgBuffer4_full_n == 1'b0)) | ((ap_predicate_op45_write_state2 == 1'b1) & (txEng_tcpPkgBuffer4_full_n == 1'b0)))) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op18_read_state1 == 1'b1) & (txEng_tcpPkgBuffer3_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((ap_predicate_op18_read_state1 == 1'b1) & (txEng_tcpPkgBuffer3_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((fsmState_load_reg_260 == 1'd1) & (txEng_tcpPkgBuffer4_full_n == 1'b0)) | ((ap_predicate_op45_write_state2 == 1'b1) & (txEng_tcpPkgBuffer4_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_132 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_147 = ((tmp_i_nbreadreq_fu_76_p3 == 1'd1) & (fsmState == 1'd0) & (currWord_last_V_fu_162_p3 == 1'd1) & (ap_phi_mux_sendWord_last_V_3_phi_fu_100_p4 == 1'd0));
end

always @ (*) begin
    ap_condition_166 = ((1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_rs_firstWord_new_0_i_reg_107 = 'bx;

assign ap_phi_reg_pp0_iter0_sendWord_last_V_3_reg_97 = 'bx;

always @ (*) begin
    ap_predicate_op18_read_state1 = ((tmp_i_nbreadreq_fu_76_p3 == 1'd1) & (fsmState == 1'd0));
end

always @ (*) begin
    ap_predicate_op45_write_state2 = ((rs_firstWord_load_reg_281 == 1'd0) & (tmp_i_reg_274 == 1'd1) & (fsmState_load_reg_260 == 1'd0));
end

assign currWord_data_V_fu_148_p1 = txEng_tcpPkgBuffer3_dout[511:0];

assign currWord_last_V_fu_162_p3 = txEng_tcpPkgBuffer3_dout[32'd576];

assign fsmState_load_load_fu_136_p1 = fsmState;

assign grp_fu_118_p4 = {{p_Val2_s_reg_264[511:96]}};

assign grp_fu_127_p4 = {{p_Val2_12_reg_269[63:12]}};

assign p_03_fu_247_p5 = {{{{{{13'd4096}, {grp_fu_127_p4}}}, {96'd0}}}, {grp_fu_118_p4}};

assign p_0_fu_235_p6 = {{{{{sendWord_last_V_reg_295}, {tmp_411_i_reg_290}}, {grp_fu_127_p4}}, {trunc_ln674_reg_285}}, {grp_fu_118_p4}};

assign rs_firstWord_load_load_fu_170_p1 = rs_firstWord;

assign sendWord_last_V_fu_198_p2 = ((tmp_412_i_fu_188_p4 == 52'd0) ? 1'b1 : 1'b0);

assign tmp_412_i_fu_188_p4 = {{txEng_tcpPkgBuffer3_dout[575:524]}};

assign tmp_i_nbreadreq_fu_76_p3 = txEng_tcpPkgBuffer3_empty_n;

assign trunc_ln674_fu_174_p1 = txEng_tcpPkgBuffer3_dout[95:0];

endmodule //toe_top_rshiftWordByOctet_net_axis_512_512_53_s