// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module ip_handler_top_extract_ip_meta_512_s (
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
        ipDataFifo_dout,
        ipDataFifo_num_data_valid,
        ipDataFifo_fifo_cap,
        ipDataFifo_empty_n,
        ipDataFifo_read,
        ipDataMetaFifo_din,
        ipDataMetaFifo_num_data_valid,
        ipDataMetaFifo_fifo_cap,
        ipDataMetaFifo_full_n,
        ipDataMetaFifo_write,
        validIpAddressFifo_din,
        validIpAddressFifo_num_data_valid,
        validIpAddressFifo_fifo_cap,
        validIpAddressFifo_full_n,
        validIpAddressFifo_write,
        ipv4ProtocolFifo_din,
        ipv4ProtocolFifo_num_data_valid,
        ipv4ProtocolFifo_fifo_cap,
        ipv4ProtocolFifo_full_n,
        ipv4ProtocolFifo_write
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
input  [3:0] myIpAddress_num_data_valid;
input  [3:0] myIpAddress_fifo_cap;
input   myIpAddress_empty_n;
output   myIpAddress_read;
input  [576:0] ipDataFifo_dout;
input  [1:0] ipDataFifo_num_data_valid;
input  [1:0] ipDataFifo_fifo_cap;
input   ipDataFifo_empty_n;
output   ipDataFifo_read;
output  [1023:0] ipDataMetaFifo_din;
input  [1:0] ipDataMetaFifo_num_data_valid;
input  [1:0] ipDataMetaFifo_fifo_cap;
input   ipDataMetaFifo_full_n;
output   ipDataMetaFifo_write;
output  [0:0] validIpAddressFifo_din;
input  [5:0] validIpAddressFifo_num_data_valid;
input  [5:0] validIpAddressFifo_fifo_cap;
input   validIpAddressFifo_full_n;
output   validIpAddressFifo_write;
output  [7:0] ipv4ProtocolFifo_din;
input  [5:0] ipv4ProtocolFifo_num_data_valid;
input  [5:0] ipv4ProtocolFifo_fifo_cap;
input   ipv4ProtocolFifo_full_n;
output   ipv4ProtocolFifo_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg myIpAddress_read;
reg ipDataFifo_read;
reg ipDataMetaFifo_write;
reg validIpAddressFifo_write;
reg ipv4ProtocolFifo_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] tmp_i_nbreadreq_fu_106_p3;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] tmp_i_reg_413;
reg   [0:0] header_ready_load_reg_422;
reg    ap_predicate_op68_write_state2;
reg    ap_predicate_op69_write_state2;
reg   [0:0] metaWritten_load_reg_436;
reg    ap_predicate_op75_write_state2;
reg    ap_predicate_op77_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [0:0] header_ready;
reg   [15:0] header_idx;
reg   [159:0] header_header_V;
reg   [0:0] metaWritten;
reg    myIpAddress_blk_n;
wire    ap_block_pp0_stage0;
reg    ipDataFifo_blk_n;
reg    ipDataMetaFifo_blk_n;
reg    validIpAddressFifo_blk_n;
reg    ipv4ProtocolFifo_blk_n;
reg   [31:0] myIpAddress_read_reg_408;
reg    ap_block_pp0_stage0_11001;
reg   [576:0] ipDataFifo_read_reg_417;
wire   [0:0] header_ready_load_load_fu_190_p1;
wire   [159:0] p_Result_s_fu_305_p2;
wire   [0:0] metaWritten_load_load_fu_317_p1;
reg   [0:0] ap_phi_mux_header_ready_flag_0_i_phi_fu_144_p4;
wire   [0:0] ap_phi_reg_pp0_iter0_header_ready_flag_0_i_reg_141;
reg   [15:0] ap_phi_mux_header_idx_new_0_i_phi_fu_155_p4;
wire   [15:0] add_ln67_fu_214_p2;
wire   [15:0] ap_phi_reg_pp0_iter0_header_idx_new_0_i_reg_152;
reg   [0:0] ap_phi_mux_metaWritten_flag_0_i_phi_fu_165_p4;
wire   [0:0] ap_phi_reg_pp0_iter0_metaWritten_flag_0_i_reg_162;
wire   [159:0] ap_phi_reg_pp0_iter0_p_Val2_7_reg_173;
reg   [159:0] ap_phi_reg_pp0_iter1_p_Val2_7_reg_173;
wire   [0:0] xor_ln162_fu_327_p2;
wire   [0:0] or_ln162_fu_321_p2;
wire   [15:0] select_ln162_fu_333_p3;
wire   [0:0] or_ln162_1_fu_341_p2;
reg    ap_block_pp0_stage0_01001;
wire   [24:0] shl_ln_fu_202_p3;
wire   [0:0] trunc_ln414_fu_227_p1;
wire   [0:0] icmp_ln414_fu_221_p2;
wire   [159:0] st_fu_231_p3;
wire   [159:0] tmp_72_fu_210_p1;
wire   [159:0] select_ln414_fu_239_p3;
reg   [159:0] tmp_fu_247_p4;
wire   [159:0] select_ln414_2_fu_265_p3;
wire   [159:0] select_ln414_3_fu_273_p3;
wire   [159:0] or_ln414_fu_281_p2;
wire   [159:0] select_ln414_1_fu_257_p3;
wire   [159:0] xor_ln414_fu_287_p2;
wire   [159:0] and_ln414_fu_293_p2;
wire   [159:0] and_ln414_1_fu_299_p2;
wire   [0:0] tmp_last_V_fu_182_p3;
wire   [31:0] dstIpAddress_V_fu_369_p4;
wire   [0:0] icmp_ln1065_fu_379_p2;
wire   [0:0] icmp_ln1065_1_fu_384_p2;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_168;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 header_ready = 1'd0;
#0 header_idx = 16'd0;
#0 header_header_V = 160'd1180591620717411303493;
#0 metaWritten = 1'd0;
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
    if ((1'b1 == ap_condition_168)) begin
        if (((tmp_i_nbreadreq_fu_106_p3 == 1'd1) & (header_ready_load_load_fu_190_p1 == 1'd0))) begin
            ap_phi_reg_pp0_iter1_p_Val2_7_reg_173 <= p_Result_s_fu_305_p2;
        end else if (((tmp_i_nbreadreq_fu_106_p3 == 1'd1) & (header_ready_load_load_fu_190_p1 == 1'd1))) begin
            ap_phi_reg_pp0_iter1_p_Val2_7_reg_173 <= header_header_V;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter1_p_Val2_7_reg_173 <= ap_phi_reg_pp0_iter0_p_Val2_7_reg_173;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_106_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (header_ready_load_load_fu_190_p1 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        header_header_V <= p_Result_s_fu_305_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_106_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln162_fu_321_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        header_idx <= select_ln162_fu_333_p3;
        header_ready <= xor_ln162_fu_327_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_106_p3 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        header_ready_load_reg_422 <= header_ready;
        ipDataFifo_read_reg_417 <= ipDataFifo_dout;
        metaWritten_load_reg_436 <= metaWritten;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_106_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (or_ln162_1_fu_341_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        metaWritten <= xor_ln162_fu_327_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        myIpAddress_read_reg_408 <= myIpAddress_dout;
        tmp_i_reg_413 <= tmp_i_nbreadreq_fu_106_p3;
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
    if (((tmp_i_nbreadreq_fu_106_p3 == 1'd1) & (header_ready_load_load_fu_190_p1 == 1'd0))) begin
        ap_phi_mux_header_idx_new_0_i_phi_fu_155_p4 = add_ln67_fu_214_p2;
    end else begin
        ap_phi_mux_header_idx_new_0_i_phi_fu_155_p4 = ap_phi_reg_pp0_iter0_header_idx_new_0_i_reg_152;
    end
end

always @ (*) begin
    if ((tmp_i_nbreadreq_fu_106_p3 == 1'd1)) begin
        if ((header_ready_load_load_fu_190_p1 == 1'd0)) begin
            ap_phi_mux_header_ready_flag_0_i_phi_fu_144_p4 = 1'd1;
        end else if ((header_ready_load_load_fu_190_p1 == 1'd1)) begin
            ap_phi_mux_header_ready_flag_0_i_phi_fu_144_p4 = 1'd0;
        end else begin
            ap_phi_mux_header_ready_flag_0_i_phi_fu_144_p4 = ap_phi_reg_pp0_iter0_header_ready_flag_0_i_reg_141;
        end
    end else begin
        ap_phi_mux_header_ready_flag_0_i_phi_fu_144_p4 = ap_phi_reg_pp0_iter0_header_ready_flag_0_i_reg_141;
    end
end

always @ (*) begin
    if ((tmp_i_nbreadreq_fu_106_p3 == 1'd1)) begin
        if ((metaWritten_load_load_fu_317_p1 == 1'd0)) begin
            ap_phi_mux_metaWritten_flag_0_i_phi_fu_165_p4 = 1'd1;
        end else if ((metaWritten_load_load_fu_317_p1 == 1'd1)) begin
            ap_phi_mux_metaWritten_flag_0_i_phi_fu_165_p4 = 1'd0;
        end else begin
            ap_phi_mux_metaWritten_flag_0_i_phi_fu_165_p4 = ap_phi_reg_pp0_iter0_metaWritten_flag_0_i_reg_162;
        end
    end else begin
        ap_phi_mux_metaWritten_flag_0_i_phi_fu_165_p4 = ap_phi_reg_pp0_iter0_metaWritten_flag_0_i_reg_162;
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
    if (((ap_done_reg == 1'b0) & (tmp_i_nbreadreq_fu_106_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ipDataFifo_blk_n = ipDataFifo_empty_n;
    end else begin
        ipDataFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_i_nbreadreq_fu_106_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ipDataFifo_read = 1'b1;
    end else begin
        ipDataFifo_read = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_predicate_op69_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_predicate_op68_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        ipDataMetaFifo_blk_n = ipDataMetaFifo_full_n;
    end else begin
        ipDataMetaFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_predicate_op69_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op68_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        ipDataMetaFifo_write = 1'b1;
    end else begin
        ipDataMetaFifo_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_predicate_op77_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ipv4ProtocolFifo_blk_n = ipv4ProtocolFifo_full_n;
    end else begin
        ipv4ProtocolFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op77_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ipv4ProtocolFifo_write = 1'b1;
    end else begin
        ipv4ProtocolFifo_write = 1'b0;
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
    if (((ap_predicate_op75_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        validIpAddressFifo_blk_n = validIpAddressFifo_full_n;
    end else begin
        validIpAddressFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op75_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        validIpAddressFifo_write = 1'b1;
    end else begin
        validIpAddressFifo_write = 1'b0;
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

assign add_ln67_fu_214_p2 = (header_idx + 16'd1);

assign and_ln414_1_fu_299_p2 = (xor_ln414_fu_287_p2 & select_ln414_1_fu_257_p3);

assign and_ln414_fu_293_p2 = (or_ln414_fu_281_p2 & header_header_V);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | (myIpAddress_empty_n == 1'b0) | ((tmp_i_nbreadreq_fu_106_p3 == 1'd1) & (ipDataFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op77_write_state2 == 1'b1) & (ipv4ProtocolFifo_full_n == 1'b0)) | ((ap_predicate_op75_write_state2 == 1'b1) & (validIpAddressFifo_full_n == 1'b0)) | ((ap_predicate_op69_write_state2 == 1'b1) & (ipDataMetaFifo_full_n == 1'b0)) | ((ap_predicate_op68_write_state2 == 1'b1) & (ipDataMetaFifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | (myIpAddress_empty_n == 1'b0) | ((tmp_i_nbreadreq_fu_106_p3 == 1'd1) & (ipDataFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op77_write_state2 == 1'b1) & (ipv4ProtocolFifo_full_n == 1'b0)) | ((ap_predicate_op75_write_state2 == 1'b1) & (validIpAddressFifo_full_n == 1'b0)) | ((ap_predicate_op69_write_state2 == 1'b1) & (ipDataMetaFifo_full_n == 1'b0)) | ((ap_predicate_op68_write_state2 == 1'b1) & (ipDataMetaFifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | (myIpAddress_empty_n == 1'b0) | ((tmp_i_nbreadreq_fu_106_p3 == 1'd1) & (ipDataFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op77_write_state2 == 1'b1) & (ipv4ProtocolFifo_full_n == 1'b0)) | ((ap_predicate_op75_write_state2 == 1'b1) & (validIpAddressFifo_full_n == 1'b0)) | ((ap_predicate_op69_write_state2 == 1'b1) & (ipDataMetaFifo_full_n == 1'b0)) | ((ap_predicate_op68_write_state2 == 1'b1) & (ipDataMetaFifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | (myIpAddress_empty_n == 1'b0) | ((tmp_i_nbreadreq_fu_106_p3 == 1'd1) & (ipDataFifo_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((ap_predicate_op77_write_state2 == 1'b1) & (ipv4ProtocolFifo_full_n == 1'b0)) | ((ap_predicate_op75_write_state2 == 1'b1) & (validIpAddressFifo_full_n == 1'b0)) | ((ap_predicate_op69_write_state2 == 1'b1) & (ipDataMetaFifo_full_n == 1'b0)) | ((ap_predicate_op68_write_state2 == 1'b1) & (ipDataMetaFifo_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_168 = ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_header_idx_new_0_i_reg_152 = 'bx;

assign ap_phi_reg_pp0_iter0_header_ready_flag_0_i_reg_141 = 'bx;

assign ap_phi_reg_pp0_iter0_metaWritten_flag_0_i_reg_162 = 'bx;

assign ap_phi_reg_pp0_iter0_p_Val2_7_reg_173 = 'bx;

always @ (*) begin
    ap_predicate_op68_write_state2 = ((header_ready_load_reg_422 == 1'd0) & (tmp_i_reg_413 == 1'd1));
end

always @ (*) begin
    ap_predicate_op69_write_state2 = ((header_ready_load_reg_422 == 1'd1) & (tmp_i_reg_413 == 1'd1));
end

always @ (*) begin
    ap_predicate_op75_write_state2 = ((metaWritten_load_reg_436 == 1'd0) & (tmp_i_reg_413 == 1'd1));
end

always @ (*) begin
    ap_predicate_op77_write_state2 = ((metaWritten_load_reg_436 == 1'd0) & (tmp_i_reg_413 == 1'd1));
end

assign dstIpAddress_V_fu_369_p4 = {{ap_phi_reg_pp0_iter1_p_Val2_7_reg_173[159:128]}};

assign header_ready_load_load_fu_190_p1 = header_ready;

assign icmp_ln1065_1_fu_384_p2 = ((dstIpAddress_V_fu_369_p4 == 32'd4294967295) ? 1'b1 : 1'b0);

assign icmp_ln1065_fu_379_p2 = ((dstIpAddress_V_fu_369_p4 == myIpAddress_read_reg_408) ? 1'b1 : 1'b0);

assign icmp_ln414_fu_221_p2 = ((shl_ln_fu_202_p3 > 25'd159) ? 1'b1 : 1'b0);

assign ipDataMetaFifo_din = ipDataFifo_read_reg_417;

assign ipv4ProtocolFifo_din = {{ap_phi_reg_pp0_iter1_p_Val2_7_reg_173[79:72]}};

assign metaWritten_load_load_fu_317_p1 = metaWritten;

assign or_ln162_1_fu_341_p2 = (tmp_last_V_fu_182_p3 | ap_phi_mux_metaWritten_flag_0_i_phi_fu_165_p4);

assign or_ln162_fu_321_p2 = (tmp_last_V_fu_182_p3 | ap_phi_mux_header_ready_flag_0_i_phi_fu_144_p4);

assign or_ln414_fu_281_p2 = (select_ln414_3_fu_273_p3 | select_ln414_2_fu_265_p3);

assign p_Result_s_fu_305_p2 = (and_ln414_fu_293_p2 | and_ln414_1_fu_299_p2);

assign select_ln162_fu_333_p3 = ((tmp_last_V_fu_182_p3[0:0] == 1'b1) ? 16'd0 : ap_phi_mux_header_idx_new_0_i_phi_fu_155_p4);

assign select_ln414_1_fu_257_p3 = ((icmp_ln414_fu_221_p2[0:0] == 1'b1) ? tmp_fu_247_p4 : tmp_72_fu_210_p1);

assign select_ln414_2_fu_265_p3 = ((icmp_ln414_fu_221_p2[0:0] == 1'b1) ? 160'd730750818665451459101842416358141509827966271487 : 160'd0);

assign select_ln414_3_fu_273_p3 = ((icmp_ln414_fu_221_p2[0:0] == 1'b1) ? 160'd1461501637330902918203684832716283019655932542974 : 160'd0);

assign select_ln414_fu_239_p3 = ((icmp_ln414_fu_221_p2[0:0] == 1'b1) ? st_fu_231_p3 : tmp_72_fu_210_p1);

assign shl_ln_fu_202_p3 = {{header_idx}, {9'd0}};

assign st_fu_231_p3 = {{trunc_ln414_fu_227_p1}, {159'd0}};

assign tmp_72_fu_210_p1 = ipDataFifo_dout[159:0];

integer ap_tvar_int_0;

always @ (select_ln414_fu_239_p3) begin
    for (ap_tvar_int_0 = 160 - 1; ap_tvar_int_0 >= 0; ap_tvar_int_0 = ap_tvar_int_0 - 1) begin
        if (ap_tvar_int_0 > 159 - 0) begin
            tmp_fu_247_p4[ap_tvar_int_0] = 1'b0;
        end else begin
            tmp_fu_247_p4[ap_tvar_int_0] = select_ln414_fu_239_p3[159 - ap_tvar_int_0];
        end
    end
end

assign tmp_i_nbreadreq_fu_106_p3 = ipDataFifo_empty_n;

assign tmp_last_V_fu_182_p3 = ipDataFifo_dout[32'd576];

assign trunc_ln414_fu_227_p1 = ipDataFifo_dout[0:0];

assign validIpAddressFifo_din = (icmp_ln1065_fu_379_p2 | icmp_ln1065_1_fu_384_p2);

assign xor_ln162_fu_327_p2 = (tmp_last_V_fu_182_p3 ^ 1'd1);

assign xor_ln414_fu_287_p2 = (or_ln414_fu_281_p2 ^ 160'd1461501637330902918203684832716283019655932542975);

endmodule //ip_handler_top_extract_ip_meta_512_s
