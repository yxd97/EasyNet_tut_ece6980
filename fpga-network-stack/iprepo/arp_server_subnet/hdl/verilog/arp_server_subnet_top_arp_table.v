// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module arp_server_subnet_top_arp_table (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        s_axis_host_arp_lookup_request_TVALID,
        s_axis_arp_lookup_request_TVALID,
        arpTableInsertFifo_dout,
        arpTableInsertFifo_num_data_valid,
        arpTableInsertFifo_fifo_cap,
        arpTableInsertFifo_empty_n,
        arpTableInsertFifo_read,
        m_axis_host_arp_lookup_reply_TREADY,
        m_axis_arp_lookup_reply_TREADY,
        arpRequestMetaFifo_din,
        arpRequestMetaFifo_num_data_valid,
        arpRequestMetaFifo_fifo_cap,
        arpRequestMetaFifo_full_n,
        arpRequestMetaFifo_write,
        s_axis_arp_lookup_request_TDATA,
        s_axis_arp_lookup_request_TREADY,
        s_axis_host_arp_lookup_request_TDATA,
        s_axis_host_arp_lookup_request_TREADY,
        m_axis_arp_lookup_reply_TDATA,
        m_axis_arp_lookup_reply_TVALID,
        m_axis_host_arp_lookup_reply_TDATA,
        m_axis_host_arp_lookup_reply_TVALID
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input   s_axis_host_arp_lookup_request_TVALID;
input   s_axis_arp_lookup_request_TVALID;
input  [80:0] arpTableInsertFifo_dout;
input  [2:0] arpTableInsertFifo_num_data_valid;
input  [2:0] arpTableInsertFifo_fifo_cap;
input   arpTableInsertFifo_empty_n;
output   arpTableInsertFifo_read;
input   m_axis_host_arp_lookup_reply_TREADY;
input   m_axis_arp_lookup_reply_TREADY;
output  [31:0] arpRequestMetaFifo_din;
input  [2:0] arpRequestMetaFifo_num_data_valid;
input  [2:0] arpRequestMetaFifo_fifo_cap;
input   arpRequestMetaFifo_full_n;
output   arpRequestMetaFifo_write;
input  [31:0] s_axis_arp_lookup_request_TDATA;
output   s_axis_arp_lookup_request_TREADY;
input  [31:0] s_axis_host_arp_lookup_request_TDATA;
output   s_axis_host_arp_lookup_request_TREADY;
output  [55:0] m_axis_arp_lookup_reply_TDATA;
output   m_axis_arp_lookup_reply_TVALID;
output  [55:0] m_axis_host_arp_lookup_reply_TDATA;
output   m_axis_host_arp_lookup_reply_TVALID;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg arpTableInsertFifo_read;
reg[31:0] arpRequestMetaFifo_din;
reg arpRequestMetaFifo_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
wire   [0:0] tmp_i_nbreadreq_fu_76_p3;
wire   [0:0] tmp_1_i_nbreadreq_fu_84_p3;
wire   [0:0] tmp_3_i_nbreadreq_fu_92_p3;
reg    ap_predicate_op26_read_state1;
reg    ap_predicate_op29_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
reg   [0:0] tmp_i_reg_286;
reg   [0:0] tmp_i_reg_286_pp0_iter1_reg;
reg   [0:0] tmp_1_i_reg_290;
reg   [0:0] tmp_1_i_reg_290_pp0_iter1_reg;
reg   [0:0] tmp_3_i_reg_294;
reg   [0:0] tmp_3_i_reg_294_pp0_iter1_reg;
reg    ap_predicate_op57_write_state3;
reg    ap_predicate_op63_write_state3;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_state3_io;
reg   [0:0] tmp_i_reg_286_pp0_iter2_reg;
reg   [0:0] tmp_1_i_reg_290_pp0_iter2_reg;
reg   [0:0] tmp_3_i_reg_294_pp0_iter2_reg;
reg   [0:0] currEntry_valid_2_reg_353;
reg    ap_predicate_op64_write_state4;
reg    ap_predicate_op66_write_state4;
reg   [0:0] currEntry_valid_1_reg_362;
reg    ap_predicate_op68_write_state4;
reg    ap_predicate_op70_write_state4;
wire    regslice_both_m_axis_arp_lookup_reply_U_apdone_blk;
wire    regslice_both_m_axis_host_arp_lookup_reply_U_apdone_blk;
reg    ap_block_state4_pp0_stage0_iter3;
reg    ap_block_state4_io;
reg    ap_block_pp0_stage0_subdone;
reg   [7:0] arpTable_macAddress_V_address0;
reg    arpTable_macAddress_V_ce0;
reg    arpTable_macAddress_V_we0;
wire   [47:0] arpTable_macAddress_V_q0;
reg   [7:0] arpTable_valid_address0;
reg    arpTable_valid_ce0;
reg    arpTable_valid_we0;
wire   [0:0] arpTable_valid_q0;
reg    s_axis_arp_lookup_request_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    s_axis_host_arp_lookup_request_TDATA_blk_n;
reg    m_axis_arp_lookup_reply_TDATA_blk_n;
reg    m_axis_host_arp_lookup_reply_TDATA_blk_n;
reg    arpTableInsertFifo_blk_n;
reg    arpRequestMetaFifo_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [31:0] query_ip_V_1_reg_298;
reg   [31:0] query_ip_V_1_reg_298_pp0_iter1_reg;
reg   [31:0] query_ip_V_1_reg_298_pp0_iter2_reg;
reg   [7:0] tmp_4_i_reg_303;
reg   [31:0] query_ip_V_reg_308;
reg   [31:0] query_ip_V_reg_308_pp0_iter1_reg;
reg   [31:0] query_ip_V_reg_308_pp0_iter2_reg;
reg   [7:0] tmp_2_i_reg_313;
reg   [47:0] currEntry_macAddress_V_reg_318;
reg   [0:0] currEntry_valid_reg_323;
reg   [7:0] tmp_i_31_reg_328;
wire   [63:0] zext_ln714_2_fu_245_p1;
wire   [63:0] zext_ln714_1_fu_250_p1;
wire   [63:0] zext_ln714_fu_255_p1;
reg    ap_block_pp0_stage0_01001;
wire   [48:0] tmp_6_i_fu_260_p3;
wire   [48:0] tmp_5_i_fu_273_p3;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to2;
reg    ap_reset_idle_pp0;
reg    ap_block_pp0;
reg    ap_enable_operation_48;
reg    ap_enable_state2_pp0_iter1_stage0;
reg    ap_predicate_op38_load_state2;
reg    ap_enable_operation_38;
reg    ap_predicate_op52_load_state3;
reg    ap_enable_operation_52;
reg    ap_enable_state3_pp0_iter2_stage0;
reg    ap_predicate_op43_load_state2;
reg    ap_enable_operation_43;
reg    ap_predicate_op58_load_state3;
reg    ap_enable_operation_58;
reg    ap_enable_operation_50;
reg    ap_predicate_op40_load_state2;
reg    ap_enable_operation_40;
reg    ap_predicate_op53_load_state3;
reg    ap_enable_operation_53;
reg    ap_predicate_op45_load_state2;
reg    ap_enable_operation_45;
reg    ap_predicate_op59_load_state3;
reg    ap_enable_operation_59;
wire    ap_enable_pp0;
wire    regslice_both_s_axis_arp_lookup_request_U_apdone_blk;
wire   [31:0] s_axis_arp_lookup_request_TDATA_int_regslice;
wire    s_axis_arp_lookup_request_TVALID_int_regslice;
reg    s_axis_arp_lookup_request_TREADY_int_regslice;
wire    regslice_both_s_axis_arp_lookup_request_U_ack_in;
wire    regslice_both_s_axis_host_arp_lookup_request_U_apdone_blk;
wire   [31:0] s_axis_host_arp_lookup_request_TDATA_int_regslice;
wire    s_axis_host_arp_lookup_request_TVALID_int_regslice;
reg    s_axis_host_arp_lookup_request_TREADY_int_regslice;
wire    regslice_both_s_axis_host_arp_lookup_request_U_ack_in;
wire   [55:0] m_axis_arp_lookup_reply_TDATA_int_regslice;
reg    m_axis_arp_lookup_reply_TVALID_int_regslice;
wire    m_axis_arp_lookup_reply_TREADY_int_regslice;
wire    regslice_both_m_axis_arp_lookup_reply_U_vld_out;
wire   [55:0] m_axis_host_arp_lookup_reply_TDATA_int_regslice;
reg    m_axis_host_arp_lookup_reply_TVALID_int_regslice;
wire    m_axis_host_arp_lookup_reply_TREADY_int_regslice;
wire    regslice_both_m_axis_host_arp_lookup_reply_U_vld_out;
reg    ap_condition_261;
reg    ap_condition_284;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_done_reg = 1'b0;
end

arp_server_subnet_top_arp_table_arpTable_macAddress_V_RAM_1P_BRAM_1R1W #(
    .DataWidth( 48 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
arpTable_macAddress_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(arpTable_macAddress_V_address0),
    .ce0(arpTable_macAddress_V_ce0),
    .we0(arpTable_macAddress_V_we0),
    .d0(currEntry_macAddress_V_reg_318),
    .q0(arpTable_macAddress_V_q0)
);

arp_server_subnet_top_arp_table_arpTable_valid_RAM_1P_BRAM_1R1W #(
    .DataWidth( 1 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
arpTable_valid_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(arpTable_valid_address0),
    .ce0(arpTable_valid_ce0),
    .we0(arpTable_valid_we0),
    .d0(currEntry_valid_reg_323),
    .q0(arpTable_valid_q0)
);

arp_server_subnet_top_regslice_both #(
    .DataWidth( 32 ))
regslice_both_s_axis_arp_lookup_request_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_arp_lookup_request_TDATA),
    .vld_in(s_axis_arp_lookup_request_TVALID),
    .ack_in(regslice_both_s_axis_arp_lookup_request_U_ack_in),
    .data_out(s_axis_arp_lookup_request_TDATA_int_regslice),
    .vld_out(s_axis_arp_lookup_request_TVALID_int_regslice),
    .ack_out(s_axis_arp_lookup_request_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_arp_lookup_request_U_apdone_blk)
);

arp_server_subnet_top_regslice_both #(
    .DataWidth( 32 ))
regslice_both_s_axis_host_arp_lookup_request_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_host_arp_lookup_request_TDATA),
    .vld_in(s_axis_host_arp_lookup_request_TVALID),
    .ack_in(regslice_both_s_axis_host_arp_lookup_request_U_ack_in),
    .data_out(s_axis_host_arp_lookup_request_TDATA_int_regslice),
    .vld_out(s_axis_host_arp_lookup_request_TVALID_int_regslice),
    .ack_out(s_axis_host_arp_lookup_request_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_host_arp_lookup_request_U_apdone_blk)
);

arp_server_subnet_top_regslice_both #(
    .DataWidth( 56 ))
regslice_both_m_axis_arp_lookup_reply_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(m_axis_arp_lookup_reply_TDATA_int_regslice),
    .vld_in(m_axis_arp_lookup_reply_TVALID_int_regslice),
    .ack_in(m_axis_arp_lookup_reply_TREADY_int_regslice),
    .data_out(m_axis_arp_lookup_reply_TDATA),
    .vld_out(regslice_both_m_axis_arp_lookup_reply_U_vld_out),
    .ack_out(m_axis_arp_lookup_reply_TREADY),
    .apdone_blk(regslice_both_m_axis_arp_lookup_reply_U_apdone_blk)
);

arp_server_subnet_top_regslice_both #(
    .DataWidth( 56 ))
regslice_both_m_axis_host_arp_lookup_reply_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(m_axis_host_arp_lookup_reply_TDATA_int_regslice),
    .vld_in(m_axis_host_arp_lookup_reply_TVALID_int_regslice),
    .ack_in(m_axis_host_arp_lookup_reply_TREADY_int_regslice),
    .data_out(m_axis_host_arp_lookup_reply_TDATA),
    .vld_out(regslice_both_m_axis_host_arp_lookup_reply_U_vld_out),
    .ack_out(m_axis_host_arp_lookup_reply_TREADY),
    .apdone_blk(regslice_both_m_axis_host_arp_lookup_reply_U_apdone_blk)
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
    if (((tmp_i_nbreadreq_fu_76_p3 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        currEntry_macAddress_V_reg_318 <= {{arpTableInsertFifo_dout[79:32]}};
        currEntry_valid_reg_323 <= arpTableInsertFifo_dout[32'd80];
        tmp_i_31_reg_328 <= {{arpTableInsertFifo_dout[31:24]}};
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_1_i_reg_290_pp0_iter1_reg == 1'd1) & (tmp_i_reg_286_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        currEntry_valid_1_reg_362 <= arpTable_valid_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_3_i_reg_294_pp0_iter1_reg == 1'd1) & (tmp_1_i_reg_290_pp0_iter1_reg == 1'd0) & (tmp_i_reg_286_pp0_iter1_reg == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        currEntry_valid_2_reg_353 <= arpTable_valid_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op26_read_state1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        query_ip_V_1_reg_298 <= s_axis_host_arp_lookup_request_TDATA_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        query_ip_V_1_reg_298_pp0_iter1_reg <= query_ip_V_1_reg_298;
        query_ip_V_reg_308_pp0_iter1_reg <= query_ip_V_reg_308;
        tmp_1_i_reg_290_pp0_iter1_reg <= tmp_1_i_reg_290;
        tmp_3_i_reg_294_pp0_iter1_reg <= tmp_3_i_reg_294;
        tmp_i_reg_286 <= tmp_i_nbreadreq_fu_76_p3;
        tmp_i_reg_286_pp0_iter1_reg <= tmp_i_reg_286;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        query_ip_V_1_reg_298_pp0_iter2_reg <= query_ip_V_1_reg_298_pp0_iter1_reg;
        query_ip_V_reg_308_pp0_iter2_reg <= query_ip_V_reg_308_pp0_iter1_reg;
        tmp_1_i_reg_290_pp0_iter2_reg <= tmp_1_i_reg_290_pp0_iter1_reg;
        tmp_3_i_reg_294_pp0_iter2_reg <= tmp_3_i_reg_294_pp0_iter1_reg;
        tmp_i_reg_286_pp0_iter2_reg <= tmp_i_reg_286_pp0_iter1_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op29_read_state1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        query_ip_V_reg_308 <= s_axis_arp_lookup_request_TDATA_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_76_p3 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_1_i_reg_290 <= tmp_1_i_nbreadreq_fu_84_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_1_i_nbreadreq_fu_84_p3 == 1'd1) & (tmp_i_nbreadreq_fu_76_p3 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_2_i_reg_313 <= {{s_axis_arp_lookup_request_TDATA_int_regslice[31:24]}};
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_1_i_nbreadreq_fu_84_p3 == 1'd0) & (tmp_i_nbreadreq_fu_76_p3 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_3_i_reg_294 <= tmp_3_i_nbreadreq_fu_92_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_3_i_nbreadreq_fu_92_p3 == 1'd1) & (tmp_1_i_nbreadreq_fu_84_p3 == 1'd0) & (tmp_i_nbreadreq_fu_76_p3 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_4_i_reg_303 <= {{s_axis_host_arp_lookup_request_TDATA_int_regslice[31:24]}};
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
    if ((((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op68_write_state4 == 1'b1)) | ((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op64_write_state4 == 1'b1)))) begin
        arpRequestMetaFifo_blk_n = arpRequestMetaFifo_full_n;
    end else begin
        arpRequestMetaFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_01001))) begin
        if ((ap_predicate_op68_write_state4 == 1'b1)) begin
            arpRequestMetaFifo_din = query_ip_V_reg_308_pp0_iter2_reg;
        end else if ((ap_predicate_op64_write_state4 == 1'b1)) begin
            arpRequestMetaFifo_din = query_ip_V_1_reg_298_pp0_iter2_reg;
        end else begin
            arpRequestMetaFifo_din = 'bx;
        end
    end else begin
        arpRequestMetaFifo_din = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op68_write_state4 == 1'b1)) | ((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op64_write_state4 == 1'b1)))) begin
        arpRequestMetaFifo_write = 1'b1;
    end else begin
        arpRequestMetaFifo_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (tmp_i_nbreadreq_fu_76_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        arpTableInsertFifo_blk_n = arpTableInsertFifo_empty_n;
    end else begin
        arpTableInsertFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_i_nbreadreq_fu_76_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        arpTableInsertFifo_read = 1'b1;
    end else begin
        arpTableInsertFifo_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_284)) begin
        if ((tmp_i_reg_286 == 1'd1)) begin
            arpTable_macAddress_V_address0 = zext_ln714_fu_255_p1;
        end else if (((tmp_1_i_reg_290 == 1'd1) & (tmp_i_reg_286 == 1'd0))) begin
            arpTable_macAddress_V_address0 = zext_ln714_1_fu_250_p1;
        end else if ((1'b1 == ap_condition_261)) begin
            arpTable_macAddress_V_address0 = zext_ln714_2_fu_245_p1;
        end else begin
            arpTable_macAddress_V_address0 = 'bx;
        end
    end else begin
        arpTable_macAddress_V_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((tmp_i_reg_286 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_1_i_reg_290 == 1'd1) & (tmp_i_reg_286 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_3_i_reg_294 == 1'd1) & (tmp_1_i_reg_290 == 1'd0) & (tmp_i_reg_286 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        arpTable_macAddress_V_ce0 = 1'b1;
    end else begin
        arpTable_macAddress_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_i_reg_286 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        arpTable_macAddress_V_we0 = 1'b1;
    end else begin
        arpTable_macAddress_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_284)) begin
        if ((tmp_i_reg_286 == 1'd1)) begin
            arpTable_valid_address0 = zext_ln714_fu_255_p1;
        end else if (((tmp_1_i_reg_290 == 1'd1) & (tmp_i_reg_286 == 1'd0))) begin
            arpTable_valid_address0 = zext_ln714_1_fu_250_p1;
        end else if ((1'b1 == ap_condition_261)) begin
            arpTable_valid_address0 = zext_ln714_2_fu_245_p1;
        end else begin
            arpTable_valid_address0 = 'bx;
        end
    end else begin
        arpTable_valid_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((tmp_i_reg_286 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_1_i_reg_290 == 1'd1) & (tmp_i_reg_286 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_3_i_reg_294 == 1'd1) & (tmp_1_i_reg_290 == 1'd0) & (tmp_i_reg_286 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        arpTable_valid_ce0 = 1'b1;
    end else begin
        arpTable_valid_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_i_reg_286 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        arpTable_valid_we0 = 1'b1;
    end else begin
        arpTable_valid_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_predicate_op63_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op70_write_state4 == 1'b1)))) begin
        m_axis_arp_lookup_reply_TDATA_blk_n = m_axis_arp_lookup_reply_TREADY_int_regslice;
    end else begin
        m_axis_arp_lookup_reply_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op63_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axis_arp_lookup_reply_TVALID_int_regslice = 1'b1;
    end else begin
        m_axis_arp_lookup_reply_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_predicate_op57_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0)) | ((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op66_write_state4 == 1'b1)))) begin
        m_axis_host_arp_lookup_reply_TDATA_blk_n = m_axis_host_arp_lookup_reply_TREADY_int_regslice;
    end else begin
        m_axis_host_arp_lookup_reply_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op57_write_state3 == 1'b1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axis_host_arp_lookup_reply_TVALID_int_regslice = 1'b1;
    end else begin
        m_axis_host_arp_lookup_reply_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op29_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        s_axis_arp_lookup_request_TDATA_blk_n = s_axis_arp_lookup_request_TVALID_int_regslice;
    end else begin
        s_axis_arp_lookup_request_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op29_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        s_axis_arp_lookup_request_TREADY_int_regslice = 1'b1;
    end else begin
        s_axis_arp_lookup_request_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (ap_predicate_op26_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        s_axis_host_arp_lookup_request_TDATA_blk_n = s_axis_host_arp_lookup_request_TVALID_int_regslice;
    end else begin
        s_axis_host_arp_lookup_request_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op26_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        s_axis_host_arp_lookup_request_TREADY_int_regslice = 1'b1;
    end else begin
        s_axis_host_arp_lookup_request_TREADY_int_regslice = 1'b0;
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

always @ (*) begin
    ap_block_pp0 = ((ap_ST_fsm_pp0_stage0 == ap_CS_fsm) & (1'b1 == ap_block_pp0_stage0_subdone));
end

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((arpTableInsertFifo_empty_n == 1'b0) & (tmp_i_nbreadreq_fu_76_p3 == 1'd1)) | ((ap_predicate_op29_read_state1 == 1'b1) & (s_axis_arp_lookup_request_TVALID_int_regslice == 1'b0)) | ((ap_predicate_op26_read_state1 == 1'b1) & (s_axis_host_arp_lookup_request_TVALID_int_regslice == 1'b0)))) | ((ap_enable_reg_pp0_iter3 == 1'b1) & ((regslice_both_m_axis_host_arp_lookup_reply_U_apdone_blk == 1'b1) | (regslice_both_m_axis_arp_lookup_reply_U_apdone_blk == 1'b1) | ((m_axis_host_arp_lookup_reply_TREADY_int_regslice == 1'b0) & (ap_predicate_op66_write_state4 == 1'b1)) | ((m_axis_arp_lookup_reply_TREADY_int_regslice == 1'b0) & (ap_predicate_op70_write_state4 == 1'b1)) | ((ap_predicate_op68_write_state4 == 1'b1) & (arpRequestMetaFifo_full_n == 1'b0)) | ((ap_predicate_op64_write_state4 == 1'b1) & (arpRequestMetaFifo_full_n == 1'b0)))) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (((ap_predicate_op63_write_state3 == 1'b1) & (m_axis_arp_lookup_reply_TREADY_int_regslice == 1'b0)) | ((ap_predicate_op57_write_state3 == 1'b1) & (m_axis_host_arp_lookup_reply_TREADY_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((arpTableInsertFifo_empty_n == 1'b0) & (tmp_i_nbreadreq_fu_76_p3 == 1'd1)) | ((ap_predicate_op29_read_state1 == 1'b1) & (s_axis_arp_lookup_request_TVALID_int_regslice == 1'b0)) | ((ap_predicate_op26_read_state1 == 1'b1) & (s_axis_host_arp_lookup_request_TVALID_int_regslice == 1'b0)))) | ((ap_enable_reg_pp0_iter3 == 1'b1) & ((1'b1 == ap_block_state4_io) | (regslice_both_m_axis_host_arp_lookup_reply_U_apdone_blk == 1'b1) | (regslice_both_m_axis_arp_lookup_reply_U_apdone_blk == 1'b1) | ((m_axis_host_arp_lookup_reply_TREADY_int_regslice == 1'b0) & (ap_predicate_op66_write_state4 == 1'b1)) | ((m_axis_arp_lookup_reply_TREADY_int_regslice == 1'b0) & (ap_predicate_op70_write_state4 == 1'b1)) | ((ap_predicate_op68_write_state4 == 1'b1) & (arpRequestMetaFifo_full_n == 1'b0)) | ((ap_predicate_op64_write_state4 == 1'b1) & (arpRequestMetaFifo_full_n == 1'b0)))) | ((ap_enable_reg_pp0_iter2 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((ap_predicate_op63_write_state3 == 1'b1) & (m_axis_arp_lookup_reply_TREADY_int_regslice == 1'b0)) | ((ap_predicate_op57_write_state3 == 1'b1) & (m_axis_host_arp_lookup_reply_TREADY_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((arpTableInsertFifo_empty_n == 1'b0) & (tmp_i_nbreadreq_fu_76_p3 == 1'd1)) | ((ap_predicate_op29_read_state1 == 1'b1) & (s_axis_arp_lookup_request_TVALID_int_regslice == 1'b0)) | ((ap_predicate_op26_read_state1 == 1'b1) & (s_axis_host_arp_lookup_request_TVALID_int_regslice == 1'b0)))) | ((ap_enable_reg_pp0_iter3 == 1'b1) & ((1'b1 == ap_block_state4_io) | (regslice_both_m_axis_host_arp_lookup_reply_U_apdone_blk == 1'b1) | (regslice_both_m_axis_arp_lookup_reply_U_apdone_blk == 1'b1) | ((m_axis_host_arp_lookup_reply_TREADY_int_regslice == 1'b0) & (ap_predicate_op66_write_state4 == 1'b1)) | ((m_axis_arp_lookup_reply_TREADY_int_regslice == 1'b0) & (ap_predicate_op70_write_state4 == 1'b1)) | ((ap_predicate_op68_write_state4 == 1'b1) & (arpRequestMetaFifo_full_n == 1'b0)) | ((ap_predicate_op64_write_state4 == 1'b1) & (arpRequestMetaFifo_full_n == 1'b0)))) | ((ap_enable_reg_pp0_iter2 == 1'b1) & ((1'b1 == ap_block_state3_io) | ((ap_predicate_op63_write_state3 == 1'b1) & (m_axis_arp_lookup_reply_TREADY_int_regslice == 1'b0)) | ((ap_predicate_op57_write_state3 == 1'b1) & (m_axis_host_arp_lookup_reply_TREADY_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((arpTableInsertFifo_empty_n == 1'b0) & (tmp_i_nbreadreq_fu_76_p3 == 1'd1)) | ((ap_predicate_op29_read_state1 == 1'b1) & (s_axis_arp_lookup_request_TVALID_int_regslice == 1'b0)) | ((ap_predicate_op26_read_state1 == 1'b1) & (s_axis_host_arp_lookup_request_TVALID_int_regslice == 1'b0)));
end

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_io = (((ap_predicate_op63_write_state3 == 1'b1) & (m_axis_arp_lookup_reply_TREADY_int_regslice == 1'b0)) | ((ap_predicate_op57_write_state3 == 1'b1) & (m_axis_host_arp_lookup_reply_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = (((ap_predicate_op63_write_state3 == 1'b1) & (m_axis_arp_lookup_reply_TREADY_int_regslice == 1'b0)) | ((ap_predicate_op57_write_state3 == 1'b1) & (m_axis_host_arp_lookup_reply_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state4_io = (((m_axis_host_arp_lookup_reply_TREADY_int_regslice == 1'b0) & (ap_predicate_op66_write_state4 == 1'b1)) | ((m_axis_arp_lookup_reply_TREADY_int_regslice == 1'b0) & (ap_predicate_op70_write_state4 == 1'b1)));
end

always @ (*) begin
    ap_block_state4_pp0_stage0_iter3 = ((regslice_both_m_axis_host_arp_lookup_reply_U_apdone_blk == 1'b1) | (regslice_both_m_axis_arp_lookup_reply_U_apdone_blk == 1'b1) | ((m_axis_host_arp_lookup_reply_TREADY_int_regslice == 1'b0) & (ap_predicate_op66_write_state4 == 1'b1)) | ((m_axis_arp_lookup_reply_TREADY_int_regslice == 1'b0) & (ap_predicate_op70_write_state4 == 1'b1)) | ((ap_predicate_op68_write_state4 == 1'b1) & (arpRequestMetaFifo_full_n == 1'b0)) | ((ap_predicate_op64_write_state4 == 1'b1) & (arpRequestMetaFifo_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_261 = ((tmp_3_i_reg_294 == 1'd1) & (tmp_1_i_reg_290 == 1'd0) & (tmp_i_reg_286 == 1'd0));
end

always @ (*) begin
    ap_condition_284 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0));
end

always @ (*) begin
    ap_enable_operation_38 = (ap_predicate_op38_load_state2 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_40 = (ap_predicate_op40_load_state2 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_43 = (ap_predicate_op43_load_state2 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_45 = (ap_predicate_op45_load_state2 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_48 = (tmp_i_reg_286 == 1'd1);
end

always @ (*) begin
    ap_enable_operation_50 = (tmp_i_reg_286 == 1'd1);
end

always @ (*) begin
    ap_enable_operation_52 = (ap_predicate_op52_load_state3 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_53 = (ap_predicate_op53_load_state3 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_58 = (ap_predicate_op58_load_state3 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_59 = (ap_predicate_op59_load_state3 == 1'b1);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_enable_state2_pp0_iter1_stage0 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_enable_state3_pp0_iter2_stage0 = ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_predicate_op26_read_state1 = ((tmp_3_i_nbreadreq_fu_92_p3 == 1'd1) & (tmp_1_i_nbreadreq_fu_84_p3 == 1'd0) & (tmp_i_nbreadreq_fu_76_p3 == 1'd0));
end

always @ (*) begin
    ap_predicate_op29_read_state1 = ((tmp_1_i_nbreadreq_fu_84_p3 == 1'd1) & (tmp_i_nbreadreq_fu_76_p3 == 1'd0));
end

always @ (*) begin
    ap_predicate_op38_load_state2 = ((tmp_3_i_reg_294 == 1'd1) & (tmp_1_i_reg_290 == 1'd0) & (tmp_i_reg_286 == 1'd0));
end

always @ (*) begin
    ap_predicate_op40_load_state2 = ((tmp_3_i_reg_294 == 1'd1) & (tmp_1_i_reg_290 == 1'd0) & (tmp_i_reg_286 == 1'd0));
end

always @ (*) begin
    ap_predicate_op43_load_state2 = ((tmp_1_i_reg_290 == 1'd1) & (tmp_i_reg_286 == 1'd0));
end

always @ (*) begin
    ap_predicate_op45_load_state2 = ((tmp_1_i_reg_290 == 1'd1) & (tmp_i_reg_286 == 1'd0));
end

always @ (*) begin
    ap_predicate_op52_load_state3 = ((tmp_3_i_reg_294_pp0_iter1_reg == 1'd1) & (tmp_1_i_reg_290_pp0_iter1_reg == 1'd0) & (tmp_i_reg_286_pp0_iter1_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op53_load_state3 = ((tmp_3_i_reg_294_pp0_iter1_reg == 1'd1) & (tmp_1_i_reg_290_pp0_iter1_reg == 1'd0) & (tmp_i_reg_286_pp0_iter1_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op57_write_state3 = ((tmp_3_i_reg_294_pp0_iter1_reg == 1'd1) & (tmp_1_i_reg_290_pp0_iter1_reg == 1'd0) & (tmp_i_reg_286_pp0_iter1_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op58_load_state3 = ((tmp_1_i_reg_290_pp0_iter1_reg == 1'd1) & (tmp_i_reg_286_pp0_iter1_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op59_load_state3 = ((tmp_1_i_reg_290_pp0_iter1_reg == 1'd1) & (tmp_i_reg_286_pp0_iter1_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op63_write_state3 = ((tmp_1_i_reg_290_pp0_iter1_reg == 1'd1) & (tmp_i_reg_286_pp0_iter1_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op64_write_state4 = ((currEntry_valid_2_reg_353 == 1'd0) & (tmp_3_i_reg_294_pp0_iter2_reg == 1'd1) & (tmp_1_i_reg_290_pp0_iter2_reg == 1'd0) & (tmp_i_reg_286_pp0_iter2_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op66_write_state4 = ((tmp_3_i_reg_294_pp0_iter2_reg == 1'd1) & (tmp_1_i_reg_290_pp0_iter2_reg == 1'd0) & (tmp_i_reg_286_pp0_iter2_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op68_write_state4 = ((currEntry_valid_1_reg_362 == 1'd0) & (tmp_1_i_reg_290_pp0_iter2_reg == 1'd1) & (tmp_i_reg_286_pp0_iter2_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op70_write_state4 = ((tmp_1_i_reg_290_pp0_iter2_reg == 1'd1) & (tmp_i_reg_286_pp0_iter2_reg == 1'd0));
end

assign m_axis_arp_lookup_reply_TDATA_int_regslice = tmp_5_i_fu_273_p3;

assign m_axis_arp_lookup_reply_TVALID = regslice_both_m_axis_arp_lookup_reply_U_vld_out;

assign m_axis_host_arp_lookup_reply_TDATA_int_regslice = tmp_6_i_fu_260_p3;

assign m_axis_host_arp_lookup_reply_TVALID = regslice_both_m_axis_host_arp_lookup_reply_U_vld_out;

assign s_axis_arp_lookup_request_TREADY = regslice_both_s_axis_arp_lookup_request_U_ack_in;

assign s_axis_host_arp_lookup_request_TREADY = regslice_both_s_axis_host_arp_lookup_request_U_ack_in;

assign tmp_1_i_nbreadreq_fu_84_p3 = s_axis_arp_lookup_request_TVALID_int_regslice;

assign tmp_3_i_nbreadreq_fu_92_p3 = s_axis_host_arp_lookup_request_TVALID_int_regslice;

assign tmp_5_i_fu_273_p3 = {{arpTable_valid_q0}, {arpTable_macAddress_V_q0}};

assign tmp_6_i_fu_260_p3 = {{arpTable_valid_q0}, {arpTable_macAddress_V_q0}};

assign tmp_i_nbreadreq_fu_76_p3 = arpTableInsertFifo_empty_n;

assign zext_ln714_1_fu_250_p1 = tmp_2_i_reg_313;

assign zext_ln714_2_fu_245_p1 = tmp_4_i_reg_303;

assign zext_ln714_fu_255_p1 = tmp_i_31_reg_328;

endmodule //arp_server_subnet_top_arp_table