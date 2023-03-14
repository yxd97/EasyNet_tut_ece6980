// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module toe_top_close_timer (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rxEng2timer_setCloseTimer_dout,
        rxEng2timer_setCloseTimer_num_data_valid,
        rxEng2timer_setCloseTimer_fifo_cap,
        rxEng2timer_setCloseTimer_empty_n,
        rxEng2timer_setCloseTimer_read,
        closeTimer2stateTable_releaseState_din,
        closeTimer2stateTable_releaseState_num_data_valid,
        closeTimer2stateTable_releaseState_fifo_cap,
        closeTimer2stateTable_releaseState_full_n,
        closeTimer2stateTable_releaseState_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] rxEng2timer_setCloseTimer_dout;
input  [1:0] rxEng2timer_setCloseTimer_num_data_valid;
input  [1:0] rxEng2timer_setCloseTimer_fifo_cap;
input   rxEng2timer_setCloseTimer_empty_n;
output   rxEng2timer_setCloseTimer_read;
output  [15:0] closeTimer2stateTable_releaseState_din;
input  [1:0] closeTimer2stateTable_releaseState_num_data_valid;
input  [1:0] closeTimer2stateTable_releaseState_fifo_cap;
input   closeTimer2stateTable_releaseState_full_n;
output   closeTimer2stateTable_releaseState_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rxEng2timer_setCloseTimer_read;
reg closeTimer2stateTable_releaseState_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire   [0:0] tmp_i_nbreadreq_fu_66_p3;
reg    ap_predicate_op30_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
reg   [0:0] ct_waitForWrite_load_reg_240;
reg   [0:0] ct_waitForWrite_load_reg_240_pp0_iter1_reg;
reg   [0:0] tmp_i_reg_244;
reg   [0:0] tmp_i_reg_244_pp0_iter1_reg;
reg   [0:0] tmp_reg_262;
reg   [0:0] icmp_ln1081_reg_271;
reg    ap_predicate_op57_write_state3;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] ct_waitForWrite;
reg   [15:0] ct_setSessionID_V;
reg   [15:0] ct_prevSessionID_V;
wire   [9:0] closeTimerTable_address0;
reg    closeTimerTable_ce0;
reg    closeTimerTable_we0;
reg   [32:0] closeTimerTable_d0;
reg   [9:0] closeTimerTable_address1;
reg    closeTimerTable_ce1;
reg    closeTimerTable_we1;
wire   [32:0] closeTimerTable_q1;
reg   [15:0] ct_currSessionID_V;
reg    rxEng2timer_setCloseTimer_blk_n;
wire    ap_block_pp0_stage0;
reg    closeTimer2stateTable_releaseState_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [15:0] ct_currSessionID_V_load_reg_248;
reg   [15:0] ct_currSessionID_V_load_reg_248_pp0_iter1_reg;
reg   [9:0] closeTimerTable_addr_1_reg_253;
reg   [9:0] closeTimerTable_addr_1_reg_253_pp0_iter1_reg;
wire   [0:0] tmp_fu_208_p3;
wire   [31:0] trunc_ln1081_fu_216_p1;
reg   [31:0] trunc_ln1081_reg_266;
wire   [0:0] icmp_ln1081_fu_220_p2;
wire   [63:0] zext_ln587_17_fu_136_p1;
wire   [63:0] zext_ln587_fu_185_p1;
wire   [0:0] icmp_ln1069_fu_179_p2;
wire   [15:0] add_ln887_fu_196_p2;
wire   [15:0] select_ln93_fu_153_p3;
reg    ap_block_pp0_stage0_01001;
wire   [32:0] or_ln_i_fu_231_p3;
wire   [15:0] add_ln886_fu_141_p2;
wire   [0:0] icmp_ln1065_fu_147_p2;
wire   [31:0] add_ln887_2_fu_226_p2;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to1;
reg    ap_reset_idle_pp0;
reg    ap_block_pp0;
reg    ap_predicate_op39_store_state1;
reg    ap_enable_operation_39;
reg    ap_enable_state1_pp0_iter0_stage0;
reg    ap_predicate_op24_load_state1;
reg    ap_enable_operation_24;
reg    ap_predicate_op45_load_state2;
reg    ap_enable_operation_45;
reg    ap_enable_state2_pp0_iter1_stage0;
reg    ap_predicate_op54_store_state3;
reg    ap_enable_operation_54;
reg    ap_enable_state3_pp0_iter2_stage0;
reg    ap_predicate_op56_store_state3;
reg    ap_enable_operation_56;
wire    ap_enable_pp0;
reg    ap_condition_116;
reg    ap_condition_293;
reg    ap_condition_160;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 ct_waitForWrite = 1'd0;
#0 ct_setSessionID_V = 16'd0;
#0 ct_prevSessionID_V = 16'd0;
#0 ct_currSessionID_V = 16'd0;
end

toe_top_probe_timer_probeTimerTable_RAM_T2P_BRAM_1R1W #(
    .DataWidth( 33 ),
    .AddressRange( 1000 ),
    .AddressWidth( 10 ))
closeTimerTable_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(closeTimerTable_address0),
    .ce0(closeTimerTable_ce0),
    .we0(closeTimerTable_we0),
    .d0(closeTimerTable_d0),
    .address1(closeTimerTable_address1),
    .ce1(closeTimerTable_ce1),
    .we1(closeTimerTable_we1),
    .d1(33'd4304342297),
    .q1(closeTimerTable_q1)
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
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_160)) begin
        if ((ct_waitForWrite == 1'd1)) begin
            ct_prevSessionID_V <= add_ln887_fu_196_p2;
        end else if (((tmp_i_nbreadreq_fu_66_p3 == 1'd0) & (ct_waitForWrite == 1'd0))) begin
            ct_prevSessionID_V <= ct_currSessionID_V;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_160)) begin
        if (((ct_waitForWrite == 1'd1) & (icmp_ln1069_fu_179_p2 == 1'd0))) begin
            ct_waitForWrite <= 1'd0;
        end else if (((tmp_i_nbreadreq_fu_66_p3 == 1'd1) & (ct_waitForWrite == 1'd0))) begin
            ct_waitForWrite <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_66_p3 == 1'd0) & (ct_waitForWrite == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        closeTimerTable_addr_1_reg_253 <= zext_ln587_17_fu_136_p1;
        ct_currSessionID_V_load_reg_248 <= ct_currSessionID_V;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        closeTimerTable_addr_1_reg_253_pp0_iter1_reg <= closeTimerTable_addr_1_reg_253;
        ct_currSessionID_V_load_reg_248_pp0_iter1_reg <= ct_currSessionID_V_load_reg_248;
        ct_waitForWrite_load_reg_240 <= ct_waitForWrite;
        ct_waitForWrite_load_reg_240_pp0_iter1_reg <= ct_waitForWrite_load_reg_240;
        tmp_i_reg_244_pp0_iter1_reg <= tmp_i_reg_244;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_66_p3 == 1'd0) & (ct_waitForWrite == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ct_currSessionID_V <= select_ln93_fu_153_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_66_p3 == 1'd1) & (ct_waitForWrite == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ct_setSessionID_V <= rxEng2timer_setCloseTimer_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_reg_244 == 1'd0) & (ct_waitForWrite_load_reg_240 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_fu_208_p3 == 1'd1))) begin
        icmp_ln1081_reg_271 <= icmp_ln1081_fu_220_p2;
        trunc_ln1081_reg_266 <= trunc_ln1081_fu_216_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ct_waitForWrite == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_i_reg_244 <= tmp_i_nbreadreq_fu_66_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_reg_244 == 1'd0) & (ct_waitForWrite_load_reg_240 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_reg_262 <= closeTimerTable_q1[32'd32];
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
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
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
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
    if (((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op57_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        closeTimer2stateTable_releaseState_blk_n = closeTimer2stateTable_releaseState_full_n;
    end else begin
        closeTimer2stateTable_releaseState_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op57_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        closeTimer2stateTable_releaseState_write = 1'b1;
    end else begin
        closeTimer2stateTable_releaseState_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_116)) begin
        if (((ct_waitForWrite == 1'd1) & (icmp_ln1069_fu_179_p2 == 1'd0))) begin
            closeTimerTable_address1 = zext_ln587_fu_185_p1;
        end else if (((tmp_i_nbreadreq_fu_66_p3 == 1'd0) & (ct_waitForWrite == 1'd0))) begin
            closeTimerTable_address1 = zext_ln587_17_fu_136_p1;
        end else begin
            closeTimerTable_address1 = 'bx;
        end
    end else begin
        closeTimerTable_address1 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1081_reg_271 == 1'd1) & (tmp_reg_262 == 1'd1) & (tmp_i_reg_244_pp0_iter1_reg == 1'd0) & (ct_waitForWrite_load_reg_240_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1081_reg_271 == 1'd0) & (tmp_reg_262 == 1'd1) & (tmp_i_reg_244_pp0_iter1_reg == 1'd0) & (ct_waitForWrite_load_reg_240_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
        closeTimerTable_ce0 = 1'b1;
    end else begin
        closeTimerTable_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ct_waitForWrite == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln1069_fu_179_p2 == 1'd0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (tmp_i_nbreadreq_fu_66_p3 == 1'd0) & (ct_waitForWrite == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        closeTimerTable_ce1 = 1'b1;
    end else begin
        closeTimerTable_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_293)) begin
        if ((icmp_ln1081_reg_271 == 1'd1)) begin
            closeTimerTable_d0 = 33'd0;
        end else if ((icmp_ln1081_reg_271 == 1'd0)) begin
            closeTimerTable_d0 = or_ln_i_fu_231_p3;
        end else begin
            closeTimerTable_d0 = 'bx;
        end
    end else begin
        closeTimerTable_d0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1081_reg_271 == 1'd1) & (tmp_reg_262 == 1'd1) & (tmp_i_reg_244_pp0_iter1_reg == 1'd0) & (ct_waitForWrite_load_reg_240_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1081_reg_271 == 1'd0) & (tmp_reg_262 == 1'd1) & (tmp_i_reg_244_pp0_iter1_reg == 1'd0) & (ct_waitForWrite_load_reg_240_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
        closeTimerTable_we0 = 1'b1;
    end else begin
        closeTimerTable_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ct_waitForWrite == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln1069_fu_179_p2 == 1'd0))) begin
        closeTimerTable_we1 = 1'b1;
    end else begin
        closeTimerTable_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_done_reg == 1'b0) & (ap_predicate_op30_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rxEng2timer_setCloseTimer_blk_n = rxEng2timer_setCloseTimer_empty_n;
    end else begin
        rxEng2timer_setCloseTimer_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op30_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rxEng2timer_setCloseTimer_read = 1'b1;
    end else begin
        rxEng2timer_setCloseTimer_read = 1'b0;
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

assign add_ln886_fu_141_p2 = (ct_currSessionID_V + 16'd1);

assign add_ln887_2_fu_226_p2 = ($signed(trunc_ln1081_reg_266) + $signed(32'd4294967295));

assign add_ln887_fu_196_p2 = ($signed(ct_prevSessionID_V) + $signed(16'd65535));

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_pp0 = ((ap_ST_fsm_pp0_stage0 == ap_CS_fsm) & (1'b1 == ap_block_pp0_stage0_subdone));
end

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_predicate_op57_write_state3 == 1'b1) & (closeTimer2stateTable_releaseState_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op30_read_state1 == 1'b1) & (rxEng2timer_setCloseTimer_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_predicate_op57_write_state3 == 1'b1) & (closeTimer2stateTable_releaseState_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op30_read_state1 == 1'b1) & (rxEng2timer_setCloseTimer_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_predicate_op57_write_state3 == 1'b1) & (closeTimer2stateTable_releaseState_full_n == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op30_read_state1 == 1'b1) & (rxEng2timer_setCloseTimer_empty_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((ap_predicate_op30_read_state1 == 1'b1) & (rxEng2timer_setCloseTimer_empty_n == 1'b0)));
end

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = ((ap_predicate_op57_write_state3 == 1'b1) & (closeTimer2stateTable_releaseState_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_116 = ((1'b0 == ap_block_pp0_stage0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_160 = ((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_condition_293 = ((1'b0 == ap_block_pp0_stage0) & (tmp_reg_262 == 1'd1) & (tmp_i_reg_244_pp0_iter1_reg == 1'd0) & (ct_waitForWrite_load_reg_240_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1));
end

always @ (*) begin
    ap_enable_operation_24 = (ap_predicate_op24_load_state1 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_39 = (ap_predicate_op39_store_state1 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_45 = (ap_predicate_op45_load_state2 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_54 = (ap_predicate_op54_store_state3 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_56 = (ap_predicate_op56_store_state3 == 1'b1);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_enable_state1_pp0_iter0_stage0 = ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_enable_state2_pp0_iter1_stage0 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_enable_state3_pp0_iter2_stage0 = ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_predicate_op24_load_state1 = ((tmp_i_nbreadreq_fu_66_p3 == 1'd0) & (ct_waitForWrite == 1'd0));
end

always @ (*) begin
    ap_predicate_op30_read_state1 = ((tmp_i_nbreadreq_fu_66_p3 == 1'd1) & (ct_waitForWrite == 1'd0));
end

always @ (*) begin
    ap_predicate_op39_store_state1 = ((ct_waitForWrite == 1'd1) & (icmp_ln1069_fu_179_p2 == 1'd0));
end

always @ (*) begin
    ap_predicate_op45_load_state2 = ((tmp_i_reg_244 == 1'd0) & (ct_waitForWrite_load_reg_240 == 1'd0));
end

always @ (*) begin
    ap_predicate_op54_store_state3 = ((icmp_ln1081_reg_271 == 1'd0) & (tmp_reg_262 == 1'd1) & (tmp_i_reg_244_pp0_iter1_reg == 1'd0) & (ct_waitForWrite_load_reg_240_pp0_iter1_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op56_store_state3 = ((icmp_ln1081_reg_271 == 1'd1) & (tmp_reg_262 == 1'd1) & (tmp_i_reg_244_pp0_iter1_reg == 1'd0) & (ct_waitForWrite_load_reg_240_pp0_iter1_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op57_write_state3 = ((icmp_ln1081_reg_271 == 1'd1) & (tmp_reg_262 == 1'd1) & (tmp_i_reg_244_pp0_iter1_reg == 1'd0) & (ct_waitForWrite_load_reg_240_pp0_iter1_reg == 1'd0));
end

assign closeTimer2stateTable_releaseState_din = ct_currSessionID_V_load_reg_248_pp0_iter1_reg;

assign closeTimerTable_address0 = closeTimerTable_addr_1_reg_253_pp0_iter1_reg;

assign icmp_ln1065_fu_147_p2 = ((add_ln886_fu_141_p2 == 16'd1000) ? 1'b1 : 1'b0);

assign icmp_ln1069_fu_179_p2 = ((ct_setSessionID_V == ct_prevSessionID_V) ? 1'b1 : 1'b0);

assign icmp_ln1081_fu_220_p2 = ((trunc_ln1081_fu_216_p1 == 32'd0) ? 1'b1 : 1'b0);

assign or_ln_i_fu_231_p3 = {{1'd1}, {add_ln887_2_fu_226_p2}};

assign select_ln93_fu_153_p3 = ((icmp_ln1065_fu_147_p2[0:0] == 1'b1) ? 16'd0 : add_ln886_fu_141_p2);

assign tmp_fu_208_p3 = closeTimerTable_q1[32'd32];

assign tmp_i_nbreadreq_fu_66_p3 = rxEng2timer_setCloseTimer_empty_n;

assign trunc_ln1081_fu_216_p1 = closeTimerTable_q1[31:0];

assign zext_ln587_17_fu_136_p1 = ct_currSessionID_V;

assign zext_ln587_fu_185_p1 = ct_setSessionID_V;

endmodule //toe_top_close_timer
