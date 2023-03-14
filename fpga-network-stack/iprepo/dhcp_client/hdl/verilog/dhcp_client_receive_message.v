// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module dhcp_client_receive_message (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        myMacAddress_c_din,
        myMacAddress_c_num_data_valid,
        myMacAddress_c_fifo_cap,
        myMacAddress_c_full_n,
        myMacAddress_c_write,
        s_axis_rx_data_TVALID,
        s_axis_rx_metadata_TVALID,
        dhcp_replyMetaFifo_din,
        dhcp_replyMetaFifo_num_data_valid,
        dhcp_replyMetaFifo_fifo_cap,
        dhcp_replyMetaFifo_full_n,
        dhcp_replyMetaFifo_write,
        s_axis_rx_metadata_TDATA,
        s_axis_rx_metadata_TREADY,
        s_axis_rx_data_TDATA,
        s_axis_rx_data_TREADY,
        s_axis_rx_data_TKEEP,
        s_axis_rx_data_TSTRB,
        s_axis_rx_data_TLAST,
        myMacAddress
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output  [47:0] myMacAddress_c_din;
input  [2:0] myMacAddress_c_num_data_valid;
input  [2:0] myMacAddress_c_fifo_cap;
input   myMacAddress_c_full_n;
output   myMacAddress_c_write;
input   s_axis_rx_data_TVALID;
input   s_axis_rx_metadata_TVALID;
output  [103:0] dhcp_replyMetaFifo_din;
input  [2:0] dhcp_replyMetaFifo_num_data_valid;
input  [2:0] dhcp_replyMetaFifo_fifo_cap;
input   dhcp_replyMetaFifo_full_n;
output   dhcp_replyMetaFifo_write;
input  [127:0] s_axis_rx_metadata_TDATA;
output   s_axis_rx_metadata_TREADY;
input  [63:0] s_axis_rx_data_TDATA;
output   s_axis_rx_data_TREADY;
input  [7:0] s_axis_rx_data_TKEEP;
input  [7:0] s_axis_rx_data_TSTRB;
input  [0:0] s_axis_rx_data_TLAST;
input  [47:0] myMacAddress;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg myMacAddress_c_write;
reg dhcp_replyMetaFifo_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] tmp_nbreadreq_fu_126_p6;
wire   [0:0] tmp_11_i_i_nbreadreq_fu_152_p3;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] tmp_reg_485;
reg   [0:0] tmp_last_V_reg_489;
reg   [0:0] and_ln121_1_reg_499;
reg    ap_predicate_op79_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [5:0] rm_wordCount_V;
reg   [0:0] rm_isReply;
reg   [0:0] rm_correctMac;
reg   [0:0] rm_isDHCP;
reg   [31:0] meta_identifier_V;
reg   [31:0] meta_assignedIpAddress_V;
reg   [31:0] meta_serverAddress_V;
reg   [7:0] meta_type_V_1;
reg    s_axis_rx_metadata_TDATA_blk_n;
wire    ap_block_pp0_stage0;
reg    s_axis_rx_data_TDATA_blk_n;
reg    myMacAddress_c_blk_n;
reg    dhcp_replyMetaFifo_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] tmp_last_V_fu_255_p1;
wire   [0:0] and_ln121_1_fu_444_p2;
reg   [0:0] ap_phi_mux_rm_isReply_loc_0_i_i_phi_fu_176_p14;
wire   [0:0] ap_phi_reg_pp0_iter0_rm_isReply_loc_0_i_i_reg_173;
wire   [5:0] rm_wordCount_V_load_load_fu_259_p1;
wire   [0:0] icmp_ln1065_fu_406_p2;
reg   [0:0] ap_phi_mux_rm_correctMac_loc_0_i_i_phi_fu_195_p14;
wire   [0:0] ap_phi_reg_pp0_iter0_rm_correctMac_loc_0_i_i_reg_192;
wire   [0:0] and_ln93_1_fu_324_p2;
wire   [0:0] and_ln93_fu_347_p2;
reg   [0:0] ap_phi_mux_rm_isDHCP_loc_0_i_i_phi_fu_215_p14;
wire   [0:0] ap_phi_reg_pp0_iter0_rm_isDHCP_loc_0_i_i_reg_212;
wire   [0:0] icmp_ln1065_3_fu_291_p2;
reg   [5:0] ap_phi_mux_rm_wordCount_V_new_0_i_i_phi_fu_234_p4;
wire   [5:0] ap_phi_reg_pp0_iter0_rm_wordCount_V_new_0_i_i_reg_231;
wire   [5:0] add_ln886_fu_431_p2;
wire   [31:0] grp_fu_241_p4;
wire   [31:0] trunc_ln674_3_fu_360_p1;
wire   [0:0] icmp_ln1065_2_fu_380_p2;
reg    ap_block_pp0_stage0_01001;
wire   [15:0] tmp_8_i_i9_fu_304_p4;
wire   [15:0] trunc_ln674_5_fu_314_p1;
wire   [0:0] icmp_ln1065_5_fu_318_p2;
wire   [31:0] trunc_ln674_4_fu_337_p1;
wire   [0:0] icmp_ln1065_4_fu_341_p2;
wire   [15:0] trunc_ln674_2_fu_376_p1;
wire   [7:0] trunc_ln674_fu_402_p1;
wire   [0:0] and_ln121_fu_438_p2;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
wire    regslice_both_s_axis_rx_metadata_U_apdone_blk;
wire   [127:0] s_axis_rx_metadata_TDATA_int_regslice;
wire    s_axis_rx_metadata_TVALID_int_regslice;
reg    s_axis_rx_metadata_TREADY_int_regslice;
wire    regslice_both_s_axis_rx_metadata_U_ack_in;
wire    regslice_both_s_axis_rx_data_V_data_V_U_apdone_blk;
wire   [63:0] s_axis_rx_data_TDATA_int_regslice;
wire    s_axis_rx_data_TVALID_int_regslice;
reg    s_axis_rx_data_TREADY_int_regslice;
wire    regslice_both_s_axis_rx_data_V_data_V_U_ack_in;
wire    regslice_both_s_axis_rx_data_V_keep_V_U_apdone_blk;
wire   [7:0] s_axis_rx_data_TKEEP_int_regslice;
wire    regslice_both_s_axis_rx_data_V_keep_V_U_vld_out;
wire    regslice_both_s_axis_rx_data_V_keep_V_U_ack_in;
wire    regslice_both_s_axis_rx_data_V_strb_V_U_apdone_blk;
wire   [7:0] s_axis_rx_data_TSTRB_int_regslice;
wire    regslice_both_s_axis_rx_data_V_strb_V_U_vld_out;
wire    regslice_both_s_axis_rx_data_V_strb_V_U_ack_in;
wire    regslice_both_s_axis_rx_data_V_last_V_U_apdone_blk;
wire   [0:0] s_axis_rx_data_TLAST_int_regslice;
wire    regslice_both_s_axis_rx_data_V_last_V_U_vld_out;
wire    regslice_both_s_axis_rx_data_V_last_V_U_ack_in;
reg    ap_condition_222;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 rm_wordCount_V = 6'd0;
#0 rm_isReply = 1'd0;
#0 rm_correctMac = 1'd1;
#0 rm_isDHCP = 1'd0;
#0 meta_identifier_V = 32'd0;
#0 meta_assignedIpAddress_V = 32'd0;
#0 meta_serverAddress_V = 32'd0;
#0 meta_type_V_1 = 8'd0;
end

dhcp_client_regslice_both #(
    .DataWidth( 128 ))
regslice_both_s_axis_rx_metadata_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_rx_metadata_TDATA),
    .vld_in(s_axis_rx_metadata_TVALID),
    .ack_in(regslice_both_s_axis_rx_metadata_U_ack_in),
    .data_out(s_axis_rx_metadata_TDATA_int_regslice),
    .vld_out(s_axis_rx_metadata_TVALID_int_regslice),
    .ack_out(s_axis_rx_metadata_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_rx_metadata_U_apdone_blk)
);

dhcp_client_regslice_both #(
    .DataWidth( 64 ))
regslice_both_s_axis_rx_data_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_rx_data_TDATA),
    .vld_in(s_axis_rx_data_TVALID),
    .ack_in(regslice_both_s_axis_rx_data_V_data_V_U_ack_in),
    .data_out(s_axis_rx_data_TDATA_int_regslice),
    .vld_out(s_axis_rx_data_TVALID_int_regslice),
    .ack_out(s_axis_rx_data_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_rx_data_V_data_V_U_apdone_blk)
);

dhcp_client_regslice_both #(
    .DataWidth( 8 ))
regslice_both_s_axis_rx_data_V_keep_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_rx_data_TKEEP),
    .vld_in(s_axis_rx_data_TVALID),
    .ack_in(regslice_both_s_axis_rx_data_V_keep_V_U_ack_in),
    .data_out(s_axis_rx_data_TKEEP_int_regslice),
    .vld_out(regslice_both_s_axis_rx_data_V_keep_V_U_vld_out),
    .ack_out(s_axis_rx_data_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_rx_data_V_keep_V_U_apdone_blk)
);

dhcp_client_regslice_both #(
    .DataWidth( 8 ))
regslice_both_s_axis_rx_data_V_strb_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_rx_data_TSTRB),
    .vld_in(s_axis_rx_data_TVALID),
    .ack_in(regslice_both_s_axis_rx_data_V_strb_V_U_ack_in),
    .data_out(s_axis_rx_data_TSTRB_int_regslice),
    .vld_out(regslice_both_s_axis_rx_data_V_strb_V_U_vld_out),
    .ack_out(s_axis_rx_data_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_rx_data_V_strb_V_U_apdone_blk)
);

dhcp_client_regslice_both #(
    .DataWidth( 1 ))
regslice_both_s_axis_rx_data_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(s_axis_rx_data_TLAST),
    .vld_in(s_axis_rx_data_TVALID),
    .ack_in(regslice_both_s_axis_rx_data_V_last_V_U_ack_in),
    .data_out(s_axis_rx_data_TLAST_int_regslice),
    .vld_out(regslice_both_s_axis_rx_data_V_last_V_U_vld_out),
    .ack_out(s_axis_rx_data_TREADY_int_regslice),
    .apdone_blk(regslice_both_s_axis_rx_data_V_last_V_U_apdone_blk)
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
    if ((1'b1 == ap_condition_222)) begin
        if ((rm_wordCount_V_load_load_fu_259_p1 == 6'd0)) begin
            rm_correctMac <= 1'd1;
        end else if ((rm_wordCount_V_load_load_fu_259_p1 == 6'd3)) begin
            rm_correctMac <= and_ln93_fu_347_p2;
        end else if ((rm_wordCount_V_load_load_fu_259_p1 == 6'd4)) begin
            rm_correctMac <= and_ln93_1_fu_324_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_126_p6 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_last_V_fu_255_p1 == 1'd1))) begin
        and_ln121_1_reg_499 <= and_ln121_1_fu_444_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_126_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd2))) begin
        meta_assignedIpAddress_V <= trunc_ln674_3_fu_360_p1;
        meta_serverAddress_V <= {{s_axis_rx_data_TDATA_int_regslice[63:32]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_126_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd0))) begin
        meta_identifier_V <= {{s_axis_rx_data_TDATA_int_regslice[63:32]}};
        rm_isReply <= icmp_ln1065_fu_406_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_126_p6 == 1'd1) & (icmp_ln1065_2_fu_380_p2 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd30))) begin
        meta_type_V_1 <= {{s_axis_rx_data_TDATA_int_regslice[23:16]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_126_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd29))) begin
        rm_isDHCP <= icmp_ln1065_3_fu_291_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_126_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        rm_wordCount_V <= ap_phi_mux_rm_wordCount_V_new_0_i_i_phi_fu_234_p4;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_126_p6 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_last_V_reg_489 <= s_axis_rx_data_TLAST_int_regslice;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_reg_485 <= tmp_nbreadreq_fu_126_p6;
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
    if (((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd0))) begin
        ap_phi_mux_rm_correctMac_loc_0_i_i_phi_fu_195_p14 = 1'd1;
    end else if (((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd3))) begin
        ap_phi_mux_rm_correctMac_loc_0_i_i_phi_fu_195_p14 = and_ln93_fu_347_p2;
    end else if (((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd4))) begin
        ap_phi_mux_rm_correctMac_loc_0_i_i_phi_fu_195_p14 = and_ln93_1_fu_324_p2;
    end else if ((((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd29)) | ((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd2)) | ((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd30)) | (~(rm_wordCount_V_load_load_fu_259_p1 == 6'd29) & ~(rm_wordCount_V_load_load_fu_259_p1 == 6'd4) & ~(rm_wordCount_V_load_load_fu_259_p1 == 6'd3) & ~(rm_wordCount_V_load_load_fu_259_p1 == 6'd2) & ~(rm_wordCount_V_load_load_fu_259_p1 == 6'd30) & ~(rm_wordCount_V_load_load_fu_259_p1 == 6'd0) & (tmp_nbreadreq_fu_126_p6 == 1'd1)))) begin
        ap_phi_mux_rm_correctMac_loc_0_i_i_phi_fu_195_p14 = rm_correctMac;
    end else begin
        ap_phi_mux_rm_correctMac_loc_0_i_i_phi_fu_195_p14 = ap_phi_reg_pp0_iter0_rm_correctMac_loc_0_i_i_reg_192;
    end
end

always @ (*) begin
    if (((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd29))) begin
        ap_phi_mux_rm_isDHCP_loc_0_i_i_phi_fu_215_p14 = icmp_ln1065_3_fu_291_p2;
    end else if ((((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd4)) | ((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd3)) | ((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd2)) | ((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd30)) | ((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd0)) | (~(rm_wordCount_V_load_load_fu_259_p1 == 6'd29) & ~(rm_wordCount_V_load_load_fu_259_p1 == 6'd4) & ~(rm_wordCount_V_load_load_fu_259_p1 == 6'd3) & ~(rm_wordCount_V_load_load_fu_259_p1 == 6'd2) & ~(rm_wordCount_V_load_load_fu_259_p1 == 6'd30) & ~(rm_wordCount_V_load_load_fu_259_p1 == 6'd0) & (tmp_nbreadreq_fu_126_p6 == 1'd1)))) begin
        ap_phi_mux_rm_isDHCP_loc_0_i_i_phi_fu_215_p14 = rm_isDHCP;
    end else begin
        ap_phi_mux_rm_isDHCP_loc_0_i_i_phi_fu_215_p14 = ap_phi_reg_pp0_iter0_rm_isDHCP_loc_0_i_i_reg_212;
    end
end

always @ (*) begin
    if (((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd0))) begin
        ap_phi_mux_rm_isReply_loc_0_i_i_phi_fu_176_p14 = icmp_ln1065_fu_406_p2;
    end else if ((((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd29)) | ((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd4)) | ((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd3)) | ((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd2)) | ((tmp_nbreadreq_fu_126_p6 == 1'd1) & (rm_wordCount_V_load_load_fu_259_p1 == 6'd30)) | (~(rm_wordCount_V_load_load_fu_259_p1 == 6'd29) & ~(rm_wordCount_V_load_load_fu_259_p1 == 6'd4) & ~(rm_wordCount_V_load_load_fu_259_p1 == 6'd3) & ~(rm_wordCount_V_load_load_fu_259_p1 == 6'd2) & ~(rm_wordCount_V_load_load_fu_259_p1 == 6'd30) & ~(rm_wordCount_V_load_load_fu_259_p1 == 6'd0) & (tmp_nbreadreq_fu_126_p6 == 1'd1)))) begin
        ap_phi_mux_rm_isReply_loc_0_i_i_phi_fu_176_p14 = rm_isReply;
    end else begin
        ap_phi_mux_rm_isReply_loc_0_i_i_phi_fu_176_p14 = ap_phi_reg_pp0_iter0_rm_isReply_loc_0_i_i_reg_173;
    end
end

always @ (*) begin
    if ((tmp_nbreadreq_fu_126_p6 == 1'd1)) begin
        if ((tmp_last_V_fu_255_p1 == 1'd0)) begin
            ap_phi_mux_rm_wordCount_V_new_0_i_i_phi_fu_234_p4 = add_ln886_fu_431_p2;
        end else if ((tmp_last_V_fu_255_p1 == 1'd1)) begin
            ap_phi_mux_rm_wordCount_V_new_0_i_i_phi_fu_234_p4 = 6'd0;
        end else begin
            ap_phi_mux_rm_wordCount_V_new_0_i_i_phi_fu_234_p4 = ap_phi_reg_pp0_iter0_rm_wordCount_V_new_0_i_i_reg_231;
        end
    end else begin
        ap_phi_mux_rm_wordCount_V_new_0_i_i_phi_fu_234_p4 = ap_phi_reg_pp0_iter0_rm_wordCount_V_new_0_i_i_reg_231;
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
    if (((1'b0 == ap_block_pp0_stage0) & (ap_predicate_op79_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dhcp_replyMetaFifo_blk_n = dhcp_replyMetaFifo_full_n;
    end else begin
        dhcp_replyMetaFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op79_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dhcp_replyMetaFifo_write = 1'b1;
    end else begin
        dhcp_replyMetaFifo_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_done_reg == 1'b0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        myMacAddress_c_blk_n = myMacAddress_c_full_n;
    end else begin
        myMacAddress_c_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        myMacAddress_c_write = 1'b1;
    end else begin
        myMacAddress_c_write = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_done_reg == 1'b0) & (tmp_nbreadreq_fu_126_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        s_axis_rx_data_TDATA_blk_n = s_axis_rx_data_TVALID_int_regslice;
    end else begin
        s_axis_rx_data_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_126_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        s_axis_rx_data_TREADY_int_regslice = 1'b1;
    end else begin
        s_axis_rx_data_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_done_reg == 1'b0) & (tmp_11_i_i_nbreadreq_fu_152_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        s_axis_rx_metadata_TDATA_blk_n = s_axis_rx_metadata_TVALID_int_regslice;
    end else begin
        s_axis_rx_metadata_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (tmp_11_i_i_nbreadreq_fu_152_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        s_axis_rx_metadata_TREADY_int_regslice = 1'b1;
    end else begin
        s_axis_rx_metadata_TREADY_int_regslice = 1'b0;
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

assign add_ln886_fu_431_p2 = (rm_wordCount_V + 6'd1);

assign and_ln121_1_fu_444_p2 = (ap_phi_mux_rm_isReply_loc_0_i_i_phi_fu_176_p14 & and_ln121_fu_438_p2);

assign and_ln121_fu_438_p2 = (ap_phi_mux_rm_isDHCP_loc_0_i_i_phi_fu_215_p14 & ap_phi_mux_rm_correctMac_loc_0_i_i_phi_fu_195_p14);

assign and_ln93_1_fu_324_p2 = (rm_correctMac & icmp_ln1065_5_fu_318_p2);

assign and_ln93_fu_347_p2 = (rm_correctMac & icmp_ln1065_4_fu_341_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_predicate_op79_write_state2 == 1'b1) & (dhcp_replyMetaFifo_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | (myMacAddress_c_full_n == 1'b0) | ((tmp_11_i_i_nbreadreq_fu_152_p3 == 1'd1) & (s_axis_rx_metadata_TVALID_int_regslice == 1'b0)) | ((tmp_nbreadreq_fu_126_p6 == 1'd1) & (s_axis_rx_data_TVALID_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_predicate_op79_write_state2 == 1'b1) & (dhcp_replyMetaFifo_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | (myMacAddress_c_full_n == 1'b0) | ((tmp_11_i_i_nbreadreq_fu_152_p3 == 1'd1) & (s_axis_rx_metadata_TVALID_int_regslice == 1'b0)) | ((tmp_nbreadreq_fu_126_p6 == 1'd1) & (s_axis_rx_data_TVALID_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_predicate_op79_write_state2 == 1'b1) & (dhcp_replyMetaFifo_full_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | (myMacAddress_c_full_n == 1'b0) | ((tmp_11_i_i_nbreadreq_fu_152_p3 == 1'd1) & (s_axis_rx_metadata_TVALID_int_regslice == 1'b0)) | ((tmp_nbreadreq_fu_126_p6 == 1'd1) & (s_axis_rx_data_TVALID_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | (myMacAddress_c_full_n == 1'b0) | ((tmp_11_i_i_nbreadreq_fu_152_p3 == 1'd1) & (s_axis_rx_metadata_TVALID_int_regslice == 1'b0)) | ((tmp_nbreadreq_fu_126_p6 == 1'd1) & (s_axis_rx_data_TVALID_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((ap_predicate_op79_write_state2 == 1'b1) & (dhcp_replyMetaFifo_full_n == 1'b0));
end

always @ (*) begin
    ap_condition_222 = ((1'b0 == ap_block_pp0_stage0_11001) & (tmp_nbreadreq_fu_126_p6 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign ap_phi_reg_pp0_iter0_rm_correctMac_loc_0_i_i_reg_192 = 'bx;

assign ap_phi_reg_pp0_iter0_rm_isDHCP_loc_0_i_i_reg_212 = 'bx;

assign ap_phi_reg_pp0_iter0_rm_isReply_loc_0_i_i_reg_173 = 'bx;

assign ap_phi_reg_pp0_iter0_rm_wordCount_V_new_0_i_i_reg_231 = 'bx;

always @ (*) begin
    ap_predicate_op79_write_state2 = ((tmp_last_V_reg_489 == 1'd1) & (tmp_reg_485 == 1'd1) & (1'd1 == and_ln121_1_reg_499));
end

assign dhcp_replyMetaFifo_din = {{{{meta_type_V_1}, {meta_serverAddress_V}}, {meta_assignedIpAddress_V}}, {meta_identifier_V}};

assign grp_fu_241_p4 = {{s_axis_rx_data_TDATA_int_regslice[63:32]}};

assign icmp_ln1065_2_fu_380_p2 = ((trunc_ln674_2_fu_376_p1 == 16'd309) ? 1'b1 : 1'b0);

assign icmp_ln1065_3_fu_291_p2 = ((grp_fu_241_p4 == 32'd1666417251) ? 1'b1 : 1'b0);

assign icmp_ln1065_4_fu_341_p2 = ((trunc_ln674_4_fu_337_p1 == grp_fu_241_p4) ? 1'b1 : 1'b0);

assign icmp_ln1065_5_fu_318_p2 = ((tmp_8_i_i9_fu_304_p4 == trunc_ln674_5_fu_314_p1) ? 1'b1 : 1'b0);

assign icmp_ln1065_fu_406_p2 = ((trunc_ln674_fu_402_p1 == 8'd2) ? 1'b1 : 1'b0);

assign myMacAddress_c_din = myMacAddress;

assign rm_wordCount_V_load_load_fu_259_p1 = rm_wordCount_V;

assign s_axis_rx_data_TREADY = regslice_both_s_axis_rx_data_V_data_V_U_ack_in;

assign s_axis_rx_metadata_TREADY = regslice_both_s_axis_rx_metadata_U_ack_in;

assign tmp_11_i_i_nbreadreq_fu_152_p3 = s_axis_rx_metadata_TVALID_int_regslice;

assign tmp_8_i_i9_fu_304_p4 = {{myMacAddress[47:32]}};

assign tmp_last_V_fu_255_p1 = s_axis_rx_data_TLAST_int_regslice;

assign tmp_nbreadreq_fu_126_p6 = s_axis_rx_data_TVALID_int_regslice;

assign trunc_ln674_2_fu_376_p1 = s_axis_rx_data_TDATA_int_regslice[15:0];

assign trunc_ln674_3_fu_360_p1 = s_axis_rx_data_TDATA_int_regslice[31:0];

assign trunc_ln674_4_fu_337_p1 = myMacAddress[31:0];

assign trunc_ln674_5_fu_314_p1 = s_axis_rx_data_TDATA_int_regslice[15:0];

assign trunc_ln674_fu_402_p1 = s_axis_rx_data_TDATA_int_regslice[7:0];

endmodule //dhcp_client_receive_message