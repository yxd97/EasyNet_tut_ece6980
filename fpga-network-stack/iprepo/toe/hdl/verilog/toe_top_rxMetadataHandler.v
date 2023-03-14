// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module toe_top_rxMetadataHandler (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rxEng_metaDataFifo_dout,
        rxEng_metaDataFifo_num_data_valid,
        rxEng_metaDataFifo_fifo_cap,
        rxEng_metaDataFifo_empty_n,
        rxEng_metaDataFifo_read,
        portTable2rxEng_check_rsp_dout,
        portTable2rxEng_check_rsp_num_data_valid,
        portTable2rxEng_check_rsp_fifo_cap,
        portTable2rxEng_check_rsp_empty_n,
        portTable2rxEng_check_rsp_read,
        rxEng_tupleBuffer_dout,
        rxEng_tupleBuffer_num_data_valid,
        rxEng_tupleBuffer_fifo_cap,
        rxEng_tupleBuffer_empty_n,
        rxEng_tupleBuffer_read,
        sLookup2rxEng_rsp_dout,
        sLookup2rxEng_rsp_num_data_valid,
        sLookup2rxEng_rsp_fifo_cap,
        sLookup2rxEng_rsp_empty_n,
        sLookup2rxEng_rsp_read,
        rxEng_metaHandlerEventFifo_din,
        rxEng_metaHandlerEventFifo_num_data_valid,
        rxEng_metaHandlerEventFifo_fifo_cap,
        rxEng_metaHandlerEventFifo_full_n,
        rxEng_metaHandlerEventFifo_write,
        rxEng_metaHandlerDropFifo_din,
        rxEng_metaHandlerDropFifo_num_data_valid,
        rxEng_metaHandlerDropFifo_fifo_cap,
        rxEng_metaHandlerDropFifo_full_n,
        rxEng_metaHandlerDropFifo_write,
        rxEng2sLookup_req_din,
        rxEng2sLookup_req_num_data_valid,
        rxEng2sLookup_req_fifo_cap,
        rxEng2sLookup_req_full_n,
        rxEng2sLookup_req_write,
        rxEng_fsmMetaDataFifo_din,
        rxEng_fsmMetaDataFifo_num_data_valid,
        rxEng_fsmMetaDataFifo_fifo_cap,
        rxEng_fsmMetaDataFifo_full_n,
        rxEng_fsmMetaDataFifo_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [107:0] rxEng_metaDataFifo_dout;
input  [1:0] rxEng_metaDataFifo_num_data_valid;
input  [1:0] rxEng_metaDataFifo_fifo_cap;
input   rxEng_metaDataFifo_empty_n;
output   rxEng_metaDataFifo_read;
input  [0:0] portTable2rxEng_check_rsp_dout;
input  [2:0] portTable2rxEng_check_rsp_num_data_valid;
input  [2:0] portTable2rxEng_check_rsp_fifo_cap;
input   portTable2rxEng_check_rsp_empty_n;
output   portTable2rxEng_check_rsp_read;
input  [95:0] rxEng_tupleBuffer_dout;
input  [1:0] rxEng_tupleBuffer_num_data_valid;
input  [1:0] rxEng_tupleBuffer_fifo_cap;
input   rxEng_tupleBuffer_empty_n;
output   rxEng_tupleBuffer_read;
input  [16:0] sLookup2rxEng_rsp_dout;
input  [2:0] sLookup2rxEng_rsp_num_data_valid;
input  [2:0] sLookup2rxEng_rsp_fifo_cap;
input   sLookup2rxEng_rsp_empty_n;
output   sLookup2rxEng_rsp_read;
output  [180:0] rxEng_metaHandlerEventFifo_din;
input  [1:0] rxEng_metaHandlerEventFifo_num_data_valid;
input  [1:0] rxEng_metaHandlerEventFifo_fifo_cap;
input   rxEng_metaHandlerEventFifo_full_n;
output   rxEng_metaHandlerEventFifo_write;
output  [0:0] rxEng_metaHandlerDropFifo_din;
input  [1:0] rxEng_metaHandlerDropFifo_num_data_valid;
input  [1:0] rxEng_metaHandlerDropFifo_fifo_cap;
input   rxEng_metaHandlerDropFifo_full_n;
output   rxEng_metaHandlerDropFifo_write;
output  [96:0] rxEng2sLookup_req_din;
input  [2:0] rxEng2sLookup_req_num_data_valid;
input  [2:0] rxEng2sLookup_req_fifo_cap;
input   rxEng2sLookup_req_full_n;
output   rxEng2sLookup_req_write;
output  [187:0] rxEng_fsmMetaDataFifo_din;
input  [1:0] rxEng_fsmMetaDataFifo_num_data_valid;
input  [1:0] rxEng_fsmMetaDataFifo_fifo_cap;
input   rxEng_fsmMetaDataFifo_full_n;
output   rxEng_fsmMetaDataFifo_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rxEng_metaDataFifo_read;
reg portTable2rxEng_check_rsp_read;
reg rxEng_tupleBuffer_read;
reg sLookup2rxEng_rsp_read;
reg[180:0] rxEng_metaHandlerEventFifo_din;
reg rxEng_metaHandlerEventFifo_write;
reg[0:0] rxEng_metaHandlerDropFifo_din;
reg rxEng_metaHandlerDropFifo_write;
reg rxEng2sLookup_req_write;
reg rxEng_fsmMetaDataFifo_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] tmp_i_nbreadreq_fu_188_p3;
wire   [0:0] tmp_381_i_nbreadreq_fu_196_p3;
wire   [0:0] tmp_382_i_nbreadreq_fu_204_p3;
reg    ap_predicate_op45_read_state1;
reg    ap_predicate_op66_read_state1;
reg    ap_predicate_op67_read_state1;
wire   [0:0] tmp_i_334_nbreadreq_fu_230_p3;
reg    ap_predicate_op102_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] mh_state_load_reg_942;
reg   [0:0] tmp_i_reg_951;
reg   [0:0] tmp_381_i_reg_955;
reg   [0:0] tmp_382_i_reg_959;
reg   [0:0] portIsOpen_reg_967;
reg   [0:0] tmp_266_reg_963;
reg   [0:0] or_ln889_reg_990;
reg    ap_predicate_op124_write_state2;
reg    ap_predicate_op140_write_state2;
reg   [0:0] icmp_ln1069_2_reg_1001;
reg    ap_predicate_op142_write_state2;
reg    ap_predicate_op145_write_state2;
reg   [0:0] tmp_i_334_reg_1010;
reg   [0:0] tmp_reg_1019;
reg    ap_predicate_op160_write_state2;
reg   [0:0] icmp_ln1069_reg_1024;
reg    ap_predicate_op163_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] mh_state;
reg   [15:0] mh_meta_length_V;
reg   [31:0] mh_meta_seqNumb_V;
reg   [31:0] mh_meta_ackNumb_V;
reg   [15:0] mh_meta_winSize_V;
reg   [3:0] mh_meta_winScale_V;
reg   [0:0] mh_meta_ack_V;
reg   [0:0] mh_meta_rst_V;
reg   [0:0] mh_meta_syn_V;
reg   [0:0] mh_meta_fin_V;
reg   [3:0] mh_meta_dataOffset_V;
reg   [31:0] mh_srcIpAddress_V;
reg   [15:0] mh_dstIpPort_V;
reg   [15:0] mh_srcIpPort_V;
reg    rxEng_metaDataFifo_blk_n;
wire    ap_block_pp0_stage0;
reg    portTable2rxEng_check_rsp_blk_n;
reg    rxEng_tupleBuffer_blk_n;
reg    rxEng_metaHandlerEventFifo_blk_n;
reg    rxEng_metaHandlerDropFifo_blk_n;
reg    rxEng2sLookup_req_blk_n;
reg    sLookup2rxEng_rsp_blk_n;
reg    rxEng_fsmMetaDataFifo_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [15:0] mh_meta_length_V_load_reg_946;
wire   [0:0] tmp_266_fu_339_p3;
wire   [0:0] portIsOpen_read_fu_218_p2;
reg   [95:0] rxEng_tupleBuffer_read_reg_971;
wire   [31:0] tuple_srcIp_V_fu_445_p1;
reg   [31:0] tuple_srcIp_V_reg_978;
reg   [15:0] trunc_ln145_11_reg_984;
wire   [0:0] or_ln889_fu_579_p2;
wire   [31:0] ret_V_fu_589_p2;
reg   [31:0] ret_V_reg_994;
wire   [0:0] icmp_ln1069_2_fu_595_p2;
wire   [0:0] and_ln907_fu_613_p2;
reg   [0:0] and_ln907_reg_1005;
wire   [15:0] trunc_ln145_fu_625_p1;
reg   [15:0] trunc_ln145_reg_1014;
wire   [0:0] icmp_ln1069_fu_637_p2;
wire   [15:0] rhs_V_fu_321_p4;
wire   [31:0] lhs_V_fu_299_p1;
wire   [0:0] tmp_267_fu_347_p3;
wire   [0:0] tmp_264_fu_303_p3;
wire   [31:0] p_Result_s_fu_493_p5;
wire   [15:0] p_Result_145_fu_531_p3;
wire   [15:0] p_Result_146_fu_565_p3;
wire   [180:0] p_011_fu_733_p6;
reg    ap_block_pp0_stage0_01001;
wire   [180:0] p_012_fu_837_p6;
wire   [0:0] xor_ln923_fu_936_p2;
wire   [7:0] trunc_ln674_fu_489_p1;
wire   [7:0] tmp_388_i_fu_479_p4;
wire   [7:0] tmp_387_i_fu_469_p4;
wire   [7:0] tmp_386_i_fu_459_p4;
wire   [7:0] tmp_391_i_fu_521_p4;
wire   [7:0] tmp_390_i_fu_511_p4;
wire   [7:0] tmp_393_i_fu_555_p4;
wire   [7:0] tmp_392_i_fu_545_p4;
wire   [31:0] zext_ln1541_fu_585_p1;
wire   [0:0] or_ln907_fu_601_p2;
wire   [0:0] xor_ln907_fu_607_p2;
wire   [15:0] trunc_ln174_6_fu_658_p1;
wire   [15:0] tmp_70_fu_649_p4;
wire   [111:0] or_ln174_18_fu_661_p5;
wire   [111:0] or_ln174_48_fu_673_p2;
wire   [15:0] tmp_51_fu_699_p4;
wire   [17:0] tmp_50_fu_689_p4;
wire   [15:0] tmp_72_fu_679_p4;
wire   [82:0] or_ln174_19_fu_709_p6;
wire   [82:0] or_ln174_49_fu_723_p2;
wire   [15:0] grp_fu_282_p4;
wire   [31:0] grp_fu_273_p4;
wire   [84:0] zext_ln174_34_fu_729_p1;
wire   [31:0] seq_V_fu_746_p2;
wire   [15:0] trunc_ln174_fu_761_p1;
wire   [15:0] tmp_66_fu_751_p4;
wire   [111:0] or_ln174_s_fu_765_p5;
wire   [111:0] or_ln174_fu_777_p2;
wire   [15:0] tmp_48_fu_803_p4;
wire   [17:0] tmp_s_fu_793_p4;
wire   [15:0] tmp_68_fu_783_p4;
wire   [82:0] or_ln174_17_fu_813_p6;
wire   [82:0] or_ln174_47_fu_827_p2;
wire   [84:0] zext_ln174_fu_833_p1;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_276;
reg    ap_condition_284;
reg    ap_condition_341;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 mh_state = 1'd0;
#0 mh_meta_length_V = 16'd0;
#0 mh_meta_seqNumb_V = 32'd0;
#0 mh_meta_ackNumb_V = 32'd0;
#0 mh_meta_winSize_V = 16'd0;
#0 mh_meta_winScale_V = 4'd0;
#0 mh_meta_ack_V = 1'd0;
#0 mh_meta_rst_V = 1'd0;
#0 mh_meta_syn_V = 1'd0;
#0 mh_meta_fin_V = 1'd0;
#0 mh_meta_dataOffset_V = 4'd0;
#0 mh_srcIpAddress_V = 32'd0;
#0 mh_dstIpPort_V = 16'd0;
#0 mh_srcIpPort_V = 16'd0;
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
    if ((1'b1 == ap_condition_284)) begin
        if (((tmp_i_334_nbreadreq_fu_230_p3 == 1'd1) & (mh_state == 1'd1))) begin
            mh_state <= 1'd0;
        end else if ((1'b1 == ap_condition_276)) begin
            mh_state <= 1'd1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_382_i_nbreadreq_fu_204_p3 == 1'd1) & (tmp_381_i_nbreadreq_fu_196_p3 == 1'd1) & (tmp_i_nbreadreq_fu_188_p3 == 1'd1) & (mh_state == 1'd0) & (portIsOpen_read_fu_218_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        and_ln907_reg_1005 <= and_ln907_fu_613_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_382_i_nbreadreq_fu_204_p3 == 1'd1) & (tmp_381_i_nbreadreq_fu_196_p3 == 1'd1) & (tmp_i_nbreadreq_fu_188_p3 == 1'd1) & (mh_state == 1'd0) & (portIsOpen_read_fu_218_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln1069_2_reg_1001 <= icmp_ln1069_2_fu_595_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_334_nbreadreq_fu_230_p3 == 1'd1) & (mh_state == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln1069_reg_1024 <= icmp_ln1069_fu_637_p2;
        tmp_reg_1019 <= sLookup2rxEng_rsp_dout[32'd16];
        trunc_ln145_reg_1014 <= trunc_ln145_fu_625_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_382_i_nbreadreq_fu_204_p3 == 1'd1) & (tmp_381_i_nbreadreq_fu_196_p3 == 1'd1) & (tmp_i_nbreadreq_fu_188_p3 == 1'd1) & (mh_state == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mh_dstIpPort_V <= p_Result_145_fu_531_p3;
        mh_meta_ackNumb_V <= {{rxEng_metaDataFifo_dout[63:32]}};
        mh_meta_ack_V <= rxEng_metaDataFifo_dout[32'd100];
        mh_meta_dataOffset_V <= {{rxEng_metaDataFifo_dout[107:104]}};
        mh_meta_fin_V <= rxEng_metaDataFifo_dout[32'd103];
        mh_meta_length_V <= {{rxEng_metaDataFifo_dout[99:84]}};
        mh_meta_rst_V <= rxEng_metaDataFifo_dout[32'd101];
        mh_meta_seqNumb_V <= lhs_V_fu_299_p1;
        mh_meta_syn_V <= rxEng_metaDataFifo_dout[32'd102];
        mh_meta_winScale_V <= {{rxEng_metaDataFifo_dout[83:80]}};
        mh_meta_winSize_V <= {{rxEng_metaDataFifo_dout[79:64]}};
        mh_srcIpAddress_V <= p_Result_s_fu_493_p5;
        mh_srcIpPort_V <= p_Result_146_fu_565_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        mh_meta_length_V_load_reg_946 <= mh_meta_length_V;
        mh_state_load_reg_942 <= mh_state;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_382_i_nbreadreq_fu_204_p3 == 1'd1) & (tmp_381_i_nbreadreq_fu_196_p3 == 1'd1) & (tmp_i_nbreadreq_fu_188_p3 == 1'd1) & (mh_state == 1'd0) & (portIsOpen_read_fu_218_p2 == 1'd0) & (tmp_266_fu_339_p3 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        or_ln889_reg_990 <= or_ln889_fu_579_p2;
        ret_V_reg_994 <= ret_V_fu_589_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op66_read_state1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        portIsOpen_reg_967 <= portTable2rxEng_check_rsp_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op67_read_state1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rxEng_tupleBuffer_read_reg_971 <= rxEng_tupleBuffer_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_382_i_nbreadreq_fu_204_p3 == 1'd1) & (tmp_381_i_nbreadreq_fu_196_p3 == 1'd1) & (tmp_i_nbreadreq_fu_188_p3 == 1'd1) & (mh_state == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_266_reg_963 <= rxEng_metaDataFifo_dout[32'd101];
        trunc_ln145_11_reg_984 <= {{rxEng_tupleBuffer_dout[79:64]}};
        tuple_srcIp_V_reg_978 <= tuple_srcIp_V_fu_445_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_188_p3 == 1'd1) & (mh_state == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_381_i_reg_955 <= tmp_381_i_nbreadreq_fu_196_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_381_i_nbreadreq_fu_196_p3 == 1'd1) & (tmp_i_nbreadreq_fu_188_p3 == 1'd1) & (mh_state == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_382_i_reg_959 <= tmp_382_i_nbreadreq_fu_204_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((mh_state == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_334_reg_1010 <= tmp_i_334_nbreadreq_fu_230_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((mh_state == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_reg_951 <= tmp_i_nbreadreq_fu_188_p3;
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
    if (((ap_done_reg == 1'b0) & (ap_predicate_op66_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        portTable2rxEng_check_rsp_blk_n = portTable2rxEng_check_rsp_empty_n;
    end else begin
        portTable2rxEng_check_rsp_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op66_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        portTable2rxEng_check_rsp_read = 1'b1;
    end else begin
        portTable2rxEng_check_rsp_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op145_write_state2 == 1'b1))) begin
        rxEng2sLookup_req_blk_n = rxEng2sLookup_req_full_n;
    end else begin
        rxEng2sLookup_req_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op145_write_state2 == 1'b1))) begin
        rxEng2sLookup_req_write = 1'b1;
    end else begin
        rxEng2sLookup_req_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op160_write_state2 == 1'b1))) begin
        rxEng_fsmMetaDataFifo_blk_n = rxEng_fsmMetaDataFifo_full_n;
    end else begin
        rxEng_fsmMetaDataFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op160_write_state2 == 1'b1))) begin
        rxEng_fsmMetaDataFifo_write = 1'b1;
    end else begin
        rxEng_fsmMetaDataFifo_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op45_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        rxEng_metaDataFifo_blk_n = rxEng_metaDataFifo_empty_n;
    end else begin
        rxEng_metaDataFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op45_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rxEng_metaDataFifo_read = 1'b1;
    end else begin
        rxEng_metaDataFifo_read = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op163_write_state2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op142_write_state2 == 1'b1)))) begin
        rxEng_metaHandlerDropFifo_blk_n = rxEng_metaHandlerDropFifo_full_n;
    end else begin
        rxEng_metaHandlerDropFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_341)) begin
        if ((ap_predicate_op163_write_state2 == 1'b1)) begin
            rxEng_metaHandlerDropFifo_din = xor_ln923_fu_936_p2;
        end else if ((ap_predicate_op142_write_state2 == 1'b1)) begin
            rxEng_metaHandlerDropFifo_din = 1'd1;
        end else begin
            rxEng_metaHandlerDropFifo_din = 'bx;
        end
    end else begin
        rxEng_metaHandlerDropFifo_din = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op163_write_state2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op142_write_state2 == 1'b1)))) begin
        rxEng_metaHandlerDropFifo_write = 1'b1;
    end else begin
        rxEng_metaHandlerDropFifo_write = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op140_write_state2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op124_write_state2 == 1'b1)))) begin
        rxEng_metaHandlerEventFifo_blk_n = rxEng_metaHandlerEventFifo_full_n;
    end else begin
        rxEng_metaHandlerEventFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_341)) begin
        if ((ap_predicate_op140_write_state2 == 1'b1)) begin
            rxEng_metaHandlerEventFifo_din = p_012_fu_837_p6;
        end else if ((ap_predicate_op124_write_state2 == 1'b1)) begin
            rxEng_metaHandlerEventFifo_din = p_011_fu_733_p6;
        end else begin
            rxEng_metaHandlerEventFifo_din = 'bx;
        end
    end else begin
        rxEng_metaHandlerEventFifo_din = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op140_write_state2 == 1'b1)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op124_write_state2 == 1'b1)))) begin
        rxEng_metaHandlerEventFifo_write = 1'b1;
    end else begin
        rxEng_metaHandlerEventFifo_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op67_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        rxEng_tupleBuffer_blk_n = rxEng_tupleBuffer_empty_n;
    end else begin
        rxEng_tupleBuffer_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op67_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        rxEng_tupleBuffer_read = 1'b1;
    end else begin
        rxEng_tupleBuffer_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op102_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        sLookup2rxEng_rsp_blk_n = sLookup2rxEng_rsp_empty_n;
    end else begin
        sLookup2rxEng_rsp_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op102_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sLookup2rxEng_rsp_read = 1'b1;
    end else begin
        sLookup2rxEng_rsp_read = 1'b0;
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

assign and_ln907_fu_613_p2 = (xor_ln907_fu_607_p2 & tmp_267_fu_347_p3);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op102_read_state1 == 1'b1) & (sLookup2rxEng_rsp_empty_n == 1'b0)) | ((ap_predicate_op67_read_state1 == 1'b1) & (rxEng_tupleBuffer_empty_n == 1'b0)) | ((ap_predicate_op66_read_state1 == 1'b1) & (portTable2rxEng_check_rsp_empty_n == 1'b0)) | ((ap_predicate_op45_read_state1 == 1'b1) & (rxEng_metaDataFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op163_write_state2 == 1'b1) & (rxEng_metaHandlerDropFifo_full_n == 1'b0)) | ((ap_predicate_op160_write_state2 == 1'b1) & (rxEng_fsmMetaDataFifo_full_n == 1'b0)) | ((ap_predicate_op145_write_state2 == 1'b1) & (rxEng2sLookup_req_full_n == 1'b0)) | ((ap_predicate_op142_write_state2 == 1'b1) & (rxEng_metaHandlerDropFifo_full_n == 1'b0)) | ((ap_predicate_op140_write_state2 == 1'b1) & (rxEng_metaHandlerEventFifo_full_n == 1'b0)) | ((ap_predicate_op124_write_state2 == 1'b1) & (rxEng_metaHandlerEventFifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op102_read_state1 == 1'b1) & (sLookup2rxEng_rsp_empty_n == 1'b0)) | ((ap_predicate_op67_read_state1 == 1'b1) & (rxEng_tupleBuffer_empty_n == 1'b0)) | ((ap_predicate_op66_read_state1 == 1'b1) & (portTable2rxEng_check_rsp_empty_n == 1'b0)) | ((ap_predicate_op45_read_state1 == 1'b1) & (rxEng_metaDataFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op163_write_state2 == 1'b1) & (rxEng_metaHandlerDropFifo_full_n == 1'b0)) | ((ap_predicate_op160_write_state2 == 1'b1) & (rxEng_fsmMetaDataFifo_full_n == 1'b0)) | ((ap_predicate_op145_write_state2 == 1'b1) & (rxEng2sLookup_req_full_n == 1'b0)) | ((ap_predicate_op142_write_state2 == 1'b1) & (rxEng_metaHandlerDropFifo_full_n == 1'b0)) | ((ap_predicate_op140_write_state2 == 1'b1) & (rxEng_metaHandlerEventFifo_full_n == 1'b0)) | ((ap_predicate_op124_write_state2 == 1'b1) & (rxEng_metaHandlerEventFifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op102_read_state1 == 1'b1) & (sLookup2rxEng_rsp_empty_n == 1'b0)) | ((ap_predicate_op67_read_state1 == 1'b1) & (rxEng_tupleBuffer_empty_n == 1'b0)) | ((ap_predicate_op66_read_state1 == 1'b1) & (portTable2rxEng_check_rsp_empty_n == 1'b0)) | ((ap_predicate_op45_read_state1 == 1'b1) & (rxEng_metaDataFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op163_write_state2 == 1'b1) & (rxEng_metaHandlerDropFifo_full_n == 1'b0)) | ((ap_predicate_op160_write_state2 == 1'b1) & (rxEng_fsmMetaDataFifo_full_n == 1'b0)) | ((ap_predicate_op145_write_state2 == 1'b1) & (rxEng2sLookup_req_full_n == 1'b0)) | ((ap_predicate_op142_write_state2 == 1'b1) & (rxEng_metaHandlerDropFifo_full_n == 1'b0)) | ((ap_predicate_op140_write_state2 == 1'b1) & (rxEng_metaHandlerEventFifo_full_n == 1'b0)) | ((ap_predicate_op124_write_state2 == 1'b1) & (rxEng_metaHandlerEventFifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((ap_predicate_op102_read_state1 == 1'b1) & (sLookup2rxEng_rsp_empty_n == 1'b0)) | ((ap_predicate_op67_read_state1 == 1'b1) & (rxEng_tupleBuffer_empty_n == 1'b0)) | ((ap_predicate_op66_read_state1 == 1'b1) & (portTable2rxEng_check_rsp_empty_n == 1'b0)) | ((ap_predicate_op45_read_state1 == 1'b1) & (rxEng_metaDataFifo_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((ap_predicate_op163_write_state2 == 1'b1) & (rxEng_metaHandlerDropFifo_full_n == 1'b0)) | ((ap_predicate_op160_write_state2 == 1'b1) & (rxEng_fsmMetaDataFifo_full_n == 1'b0)) | ((ap_predicate_op145_write_state2 == 1'b1) & (rxEng2sLookup_req_full_n == 1'b0)) | ((ap_predicate_op142_write_state2 == 1'b1) & (rxEng_metaHandlerDropFifo_full_n == 1'b0)) | ((ap_predicate_op140_write_state2 == 1'b1) & (rxEng_metaHandlerEventFifo_full_n == 1'b0)) | ((ap_predicate_op124_write_state2 == 1'b1) & (rxEng_metaHandlerEventFifo_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_276 = ((tmp_382_i_nbreadreq_fu_204_p3 == 1'd1) & (tmp_381_i_nbreadreq_fu_196_p3 == 1'd1) & (tmp_i_nbreadreq_fu_188_p3 == 1'd1) & (mh_state == 1'd0) & (portIsOpen_read_fu_218_p2 == 1'd1));
end

always @ (*) begin
    ap_condition_284 = ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

always @ (*) begin
    ap_condition_341 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_01001));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_predicate_op102_read_state1 = ((tmp_i_334_nbreadreq_fu_230_p3 == 1'd1) & (mh_state == 1'd1));
end

always @ (*) begin
    ap_predicate_op124_write_state2 = ((or_ln889_reg_990 == 1'd0) & (tmp_266_reg_963 == 1'd0) & (portIsOpen_reg_967 == 1'd0) & (tmp_382_i_reg_959 == 1'd1) & (tmp_381_i_reg_955 == 1'd1) & (tmp_i_reg_951 == 1'd1) & (mh_state_load_reg_942 == 1'd0));
end

always @ (*) begin
    ap_predicate_op140_write_state2 = ((or_ln889_reg_990 == 1'd1) & (tmp_266_reg_963 == 1'd0) & (portIsOpen_reg_967 == 1'd0) & (tmp_382_i_reg_959 == 1'd1) & (tmp_381_i_reg_955 == 1'd1) & (tmp_i_reg_951 == 1'd1) & (mh_state_load_reg_942 == 1'd0));
end

always @ (*) begin
    ap_predicate_op142_write_state2 = ((icmp_ln1069_2_reg_1001 == 1'd0) & (portIsOpen_reg_967 == 1'd0) & (tmp_382_i_reg_959 == 1'd1) & (tmp_381_i_reg_955 == 1'd1) & (tmp_i_reg_951 == 1'd1) & (mh_state_load_reg_942 == 1'd0));
end

always @ (*) begin
    ap_predicate_op145_write_state2 = ((portIsOpen_reg_967 == 1'd1) & (tmp_382_i_reg_959 == 1'd1) & (tmp_381_i_reg_955 == 1'd1) & (tmp_i_reg_951 == 1'd1) & (mh_state_load_reg_942 == 1'd0));
end

always @ (*) begin
    ap_predicate_op160_write_state2 = ((tmp_reg_1019 == 1'd1) & (tmp_i_334_reg_1010 == 1'd1) & (mh_state_load_reg_942 == 1'd1));
end

always @ (*) begin
    ap_predicate_op163_write_state2 = ((icmp_ln1069_reg_1024 == 1'd0) & (tmp_i_334_reg_1010 == 1'd1) & (mh_state_load_reg_942 == 1'd1));
end

always @ (*) begin
    ap_predicate_op45_read_state1 = ((tmp_382_i_nbreadreq_fu_204_p3 == 1'd1) & (tmp_381_i_nbreadreq_fu_196_p3 == 1'd1) & (tmp_i_nbreadreq_fu_188_p3 == 1'd1) & (mh_state == 1'd0));
end

always @ (*) begin
    ap_predicate_op66_read_state1 = ((tmp_382_i_nbreadreq_fu_204_p3 == 1'd1) & (tmp_381_i_nbreadreq_fu_196_p3 == 1'd1) & (tmp_i_nbreadreq_fu_188_p3 == 1'd1) & (mh_state == 1'd0));
end

always @ (*) begin
    ap_predicate_op67_read_state1 = ((tmp_382_i_nbreadreq_fu_204_p3 == 1'd1) & (tmp_381_i_nbreadreq_fu_196_p3 == 1'd1) & (tmp_i_nbreadreq_fu_188_p3 == 1'd1) & (mh_state == 1'd0));
end

assign grp_fu_273_p4 = {{rxEng_tupleBuffer_read_reg_971[63:32]}};

assign grp_fu_282_p4 = {{rxEng_tupleBuffer_read_reg_971[95:80]}};

assign icmp_ln1069_2_fu_595_p2 = ((rhs_V_fu_321_p4 == 16'd0) ? 1'b1 : 1'b0);

assign icmp_ln1069_fu_637_p2 = ((mh_meta_length_V == 16'd0) ? 1'b1 : 1'b0);

assign lhs_V_fu_299_p1 = rxEng_metaDataFifo_dout[31:0];

assign or_ln174_17_fu_813_p6 = {{{{{{{{1'd0}, {tmp_48_fu_803_p4}}}, {tmp_s_fu_793_p4}}}, {tmp_68_fu_783_p4}}}, {32'd0}};

assign or_ln174_18_fu_661_p5 = {{{{trunc_ln174_6_fu_658_p1}, {16'd0}}, {tmp_70_fu_649_p4}}, {64'd0}};

assign or_ln174_19_fu_709_p6 = {{{{{{{{1'd0}, {tmp_51_fu_699_p4}}}, {tmp_50_fu_689_p4}}}, {tmp_72_fu_679_p4}}}, {32'd0}};

assign or_ln174_47_fu_827_p2 = (or_ln174_17_fu_813_p6 | 83'd6);

assign or_ln174_48_fu_673_p2 = (or_ln174_18_fu_661_p5 | 112'd6);

assign or_ln174_49_fu_723_p2 = (or_ln174_19_fu_709_p6 | 83'd6);

assign or_ln174_fu_777_p2 = (or_ln174_s_fu_765_p5 | 112'd6);

assign or_ln174_s_fu_765_p5 = {{{{trunc_ln174_fu_761_p1}, {16'd0}}, {tmp_66_fu_751_p4}}, {64'd0}};

assign or_ln889_fu_579_p2 = (tmp_267_fu_347_p3 | tmp_264_fu_303_p3);

assign or_ln907_fu_601_p2 = (tmp_266_fu_339_p3 | tmp_264_fu_303_p3);

assign p_011_fu_733_p6 = {{{{{trunc_ln145_11_reg_984}, {grp_fu_282_p4}}, {tuple_srcIp_V_reg_978}}, {grp_fu_273_p4}}, {zext_ln174_34_fu_729_p1}};

assign p_012_fu_837_p6 = {{{{{trunc_ln145_11_reg_984}, {grp_fu_282_p4}}, {tuple_srcIp_V_reg_978}}, {grp_fu_273_p4}}, {zext_ln174_fu_833_p1}};

assign p_Result_145_fu_531_p3 = {{tmp_391_i_fu_521_p4}, {tmp_390_i_fu_511_p4}};

assign p_Result_146_fu_565_p3 = {{tmp_393_i_fu_555_p4}, {tmp_392_i_fu_545_p4}};

assign p_Result_s_fu_493_p5 = {{{{trunc_ln674_fu_489_p1}, {tmp_388_i_fu_479_p4}}, {tmp_387_i_fu_469_p4}}, {tmp_386_i_fu_459_p4}};

assign portIsOpen_read_fu_218_p2 = portTable2rxEng_check_rsp_dout;

assign ret_V_fu_589_p2 = (lhs_V_fu_299_p1 + zext_ln1541_fu_585_p1);

assign rhs_V_fu_321_p4 = {{rxEng_metaDataFifo_dout[99:84]}};

assign rxEng2sLookup_req_din = {{and_ln907_reg_1005}, {rxEng_tupleBuffer_read_reg_971}};

assign rxEng_fsmMetaDataFifo_din = {{{{{{{{{{{{{{mh_srcIpPort_V}, {mh_meta_dataOffset_V}}, {mh_meta_fin_V}}, {mh_meta_syn_V}}, {mh_meta_rst_V}}, {mh_meta_ack_V}}, {mh_meta_length_V_load_reg_946}}, {mh_meta_winScale_V}}, {mh_meta_winSize_V}}, {mh_meta_ackNumb_V}}, {mh_meta_seqNumb_V}}, {mh_dstIpPort_V}}, {mh_srcIpAddress_V}}, {trunc_ln145_reg_1014}};

assign seq_V_fu_746_p2 = (ret_V_reg_994 + 32'd1);

assign tmp_264_fu_303_p3 = rxEng_metaDataFifo_dout[32'd103];

assign tmp_266_fu_339_p3 = rxEng_metaDataFifo_dout[32'd101];

assign tmp_267_fu_347_p3 = rxEng_metaDataFifo_dout[32'd102];

assign tmp_381_i_nbreadreq_fu_196_p3 = portTable2rxEng_check_rsp_empty_n;

assign tmp_382_i_nbreadreq_fu_204_p3 = rxEng_tupleBuffer_empty_n;

assign tmp_386_i_fu_459_p4 = {{rxEng_tupleBuffer_dout[31:24]}};

assign tmp_387_i_fu_469_p4 = {{rxEng_tupleBuffer_dout[23:16]}};

assign tmp_388_i_fu_479_p4 = {{rxEng_tupleBuffer_dout[15:8]}};

assign tmp_390_i_fu_511_p4 = {{rxEng_tupleBuffer_dout[95:88]}};

assign tmp_391_i_fu_521_p4 = {{rxEng_tupleBuffer_dout[87:80]}};

assign tmp_392_i_fu_545_p4 = {{rxEng_tupleBuffer_dout[79:72]}};

assign tmp_393_i_fu_555_p4 = {{rxEng_tupleBuffer_dout[71:64]}};

assign tmp_48_fu_803_p4 = {{or_ln174_fu_777_p2[111:96]}};

assign tmp_50_fu_689_p4 = {{or_ln174_48_fu_673_p2[81:64]}};

assign tmp_51_fu_699_p4 = {{or_ln174_48_fu_673_p2[111:96]}};

assign tmp_66_fu_751_p4 = {{seq_V_fu_746_p2[31:16]}};

assign tmp_68_fu_783_p4 = {{or_ln174_fu_777_p2[47:32]}};

assign tmp_70_fu_649_p4 = {{ret_V_reg_994[31:16]}};

assign tmp_72_fu_679_p4 = {{or_ln174_48_fu_673_p2[47:32]}};

assign tmp_i_334_nbreadreq_fu_230_p3 = sLookup2rxEng_rsp_empty_n;

assign tmp_i_nbreadreq_fu_188_p3 = rxEng_metaDataFifo_empty_n;

assign tmp_s_fu_793_p4 = {{or_ln174_fu_777_p2[81:64]}};

assign trunc_ln145_fu_625_p1 = sLookup2rxEng_rsp_dout[15:0];

assign trunc_ln174_6_fu_658_p1 = ret_V_reg_994[15:0];

assign trunc_ln174_fu_761_p1 = seq_V_fu_746_p2[15:0];

assign trunc_ln674_fu_489_p1 = rxEng_tupleBuffer_dout[7:0];

assign tuple_srcIp_V_fu_445_p1 = rxEng_tupleBuffer_dout[31:0];

assign xor_ln907_fu_607_p2 = (or_ln907_fu_601_p2 ^ 1'd1);

assign xor_ln923_fu_936_p2 = (tmp_reg_1019 ^ 1'd1);

assign zext_ln1541_fu_585_p1 = rhs_V_fu_321_p4;

assign zext_ln174_34_fu_729_p1 = or_ln174_49_fu_723_p2;

assign zext_ln174_fu_833_p1 = or_ln174_47_fu_827_p2;

endmodule //toe_top_rxMetadataHandler
