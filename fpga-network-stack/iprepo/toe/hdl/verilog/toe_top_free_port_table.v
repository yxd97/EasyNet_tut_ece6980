// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module toe_top_free_port_table (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        sLookup2portTable_releasePort_dout,
        sLookup2portTable_releasePort_num_data_valid,
        sLookup2portTable_releasePort_fifo_cap,
        sLookup2portTable_releasePort_empty_n,
        sLookup2portTable_releasePort_read,
        pt_portCheckUsed_req_fifo_dout,
        pt_portCheckUsed_req_fifo_num_data_valid,
        pt_portCheckUsed_req_fifo_fifo_cap,
        pt_portCheckUsed_req_fifo_empty_n,
        pt_portCheckUsed_req_fifo_read,
        portTable2txApp_port_rsp_din,
        portTable2txApp_port_rsp_num_data_valid,
        portTable2txApp_port_rsp_fifo_cap,
        portTable2txApp_port_rsp_full_n,
        portTable2txApp_port_rsp_write,
        pt_portCheckUsed_rsp_fifo_din,
        pt_portCheckUsed_rsp_fifo_num_data_valid,
        pt_portCheckUsed_rsp_fifo_fifo_cap,
        pt_portCheckUsed_rsp_fifo_full_n,
        pt_portCheckUsed_rsp_fifo_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] sLookup2portTable_releasePort_dout;
input  [2:0] sLookup2portTable_releasePort_num_data_valid;
input  [2:0] sLookup2portTable_releasePort_fifo_cap;
input   sLookup2portTable_releasePort_empty_n;
output   sLookup2portTable_releasePort_read;
input  [14:0] pt_portCheckUsed_req_fifo_dout;
input  [1:0] pt_portCheckUsed_req_fifo_num_data_valid;
input  [1:0] pt_portCheckUsed_req_fifo_fifo_cap;
input   pt_portCheckUsed_req_fifo_empty_n;
output   pt_portCheckUsed_req_fifo_read;
output  [15:0] portTable2txApp_port_rsp_din;
input  [2:0] portTable2txApp_port_rsp_num_data_valid;
input  [2:0] portTable2txApp_port_rsp_fifo_cap;
input   portTable2txApp_port_rsp_full_n;
output   portTable2txApp_port_rsp_write;
output  [0:0] pt_portCheckUsed_rsp_fifo_din;
input  [1:0] pt_portCheckUsed_rsp_fifo_num_data_valid;
input  [1:0] pt_portCheckUsed_rsp_fifo_fifo_cap;
input   pt_portCheckUsed_rsp_fifo_full_n;
output   pt_portCheckUsed_rsp_fifo_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg sLookup2portTable_releasePort_read;
reg pt_portCheckUsed_req_fifo_read;
reg portTable2txApp_port_rsp_write;
reg pt_portCheckUsed_rsp_fifo_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_idle_pp0;
wire   [0:0] tmp_i_nbreadreq_fu_62_p3;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] tmp_i_reg_196;
wire   [0:0] tmp_i_349_nbreadreq_fu_76_p3;
reg    ap_predicate_op17_read_state2;
reg    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
reg   [0:0] tmp_i_reg_196_pp0_iter3_reg;
reg   [0:0] tmp_i_349_reg_209;
reg   [0:0] tmp_i_349_reg_209_pp0_iter3_reg;
reg   [0:0] freePortTable_load_reg_234;
wire   [0:0] tmp_548_i_nbwritereq_fu_90_p3;
reg    ap_predicate_op56_write_state5;
reg    ap_predicate_op58_write_state5;
reg    ap_block_state5_pp0_stage0_iter4;
reg    ap_block_pp0_stage0_subdone;
reg   [14:0] pt_cursor;
wire   [14:0] freePortTable_address0;
reg    freePortTable_ce0;
reg    freePortTable_we0;
reg   [14:0] freePortTable_address1;
reg    freePortTable_ce1;
reg    freePortTable_we1;
wire   [0:0] freePortTable_q1;
reg    sLookup2portTable_releasePort_blk_n;
wire    ap_block_pp0_stage0;
reg    pt_portCheckUsed_req_fifo_blk_n;
reg    pt_portCheckUsed_rsp_fifo_blk_n;
reg    portTable2txApp_port_rsp_blk_n;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] tmp_i_reg_196_pp0_iter1_reg;
reg   [0:0] tmp_i_reg_196_pp0_iter2_reg;
wire   [0:0] tmp_fu_147_p3;
reg   [0:0] tmp_reg_200;
reg   [0:0] tmp_reg_200_pp0_iter1_reg;
wire   [14:0] trunc_ln714_fu_155_p1;
reg   [14:0] trunc_ln714_reg_204;
reg   [14:0] trunc_ln714_reg_204_pp0_iter1_reg;
reg   [0:0] tmp_i_349_reg_209_pp0_iter2_reg;
reg   [14:0] tmp_V_reg_213;
reg   [14:0] pt_cursor_load_reg_218;
reg   [14:0] pt_cursor_load_reg_218_pp0_iter3_reg;
reg   [14:0] freePortTable_addr_2_reg_223;
reg   [14:0] freePortTable_addr_2_reg_223_pp0_iter3_reg;
reg   [0:0] freePortTable_load_1_reg_238;
wire   [63:0] zext_ln587_16_fu_163_p1;
wire   [63:0] zext_ln587_fu_168_p1;
wire   [63:0] zext_ln714_fu_172_p1;
wire   [14:0] add_ln886_fu_176_p2;
reg    ap_block_pp0_stage0_01001;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to3;
reg    ap_reset_idle_pp0;
reg    ap_block_pp0;
reg    ap_predicate_op45_store_state3;
reg    ap_enable_operation_45;
reg    ap_enable_state3_pp0_iter2_stage0;
reg    ap_predicate_op39_load_state3;
reg    ap_enable_operation_39;
reg    ap_predicate_op49_load_state4;
reg    ap_enable_operation_49;
reg    ap_enable_state4_pp0_iter3_stage0;
reg    ap_predicate_op42_load_state3;
reg    ap_enable_operation_42;
reg    ap_predicate_op51_load_state4;
reg    ap_enable_operation_51;
reg    ap_predicate_op55_store_state5;
reg    ap_enable_operation_55;
reg    ap_enable_state5_pp0_iter4_stage0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 pt_cursor = 15'd0;
end

toe_top_free_port_table_freePortTable_RAM_T2P_BRAM_1R1W #(
    .DataWidth( 1 ),
    .AddressRange( 32768 ),
    .AddressWidth( 15 ))
freePortTable_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(freePortTable_address0),
    .ce0(freePortTable_ce0),
    .we0(freePortTable_we0),
    .d0(1'd1),
    .address1(freePortTable_address1),
    .ce1(freePortTable_ce1),
    .we1(freePortTable_we1),
    .d1(1'd0),
    .q1(freePortTable_q1)
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
        end else if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_349_reg_209 == 1'd0) & (tmp_i_reg_196_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        freePortTable_addr_2_reg_223 <= zext_ln587_16_fu_163_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        freePortTable_addr_2_reg_223_pp0_iter3_reg <= freePortTable_addr_2_reg_223;
        pt_cursor_load_reg_218 <= pt_cursor;
        pt_cursor_load_reg_218_pp0_iter3_reg <= pt_cursor_load_reg_218;
        tmp_i_349_reg_209_pp0_iter2_reg <= tmp_i_349_reg_209;
        tmp_i_349_reg_209_pp0_iter3_reg <= tmp_i_349_reg_209_pp0_iter2_reg;
        tmp_i_reg_196_pp0_iter2_reg <= tmp_i_reg_196_pp0_iter1_reg;
        tmp_i_reg_196_pp0_iter3_reg <= tmp_i_reg_196_pp0_iter2_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (tmp_i_349_reg_209_pp0_iter2_reg == 1'd1) & (tmp_i_reg_196_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        freePortTable_load_1_reg_238 <= freePortTable_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b1) & (tmp_i_349_reg_209_pp0_iter2_reg == 1'd0) & (tmp_i_reg_196_pp0_iter2_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        freePortTable_load_reg_234 <= freePortTable_q1;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        pt_cursor <= add_ln886_fu_176_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op17_read_state2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_V_reg_213 <= pt_portCheckUsed_req_fifo_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_reg_196 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_349_reg_209 <= tmp_i_349_nbreadreq_fu_76_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_reg_196 <= tmp_i_nbreadreq_fu_62_p3;
        tmp_i_reg_196_pp0_iter1_reg <= tmp_i_reg_196;
        tmp_reg_200_pp0_iter1_reg <= tmp_reg_200;
        trunc_ln714_reg_204_pp0_iter1_reg <= trunc_ln714_reg_204;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_62_p3 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_reg_200 <= sLookup2portTable_releasePort_dout[32'd15];
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_62_p3 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (tmp_fu_147_p3 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        trunc_ln714_reg_204 <= trunc_ln714_fu_155_p1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0_0to3 = 1'b1;
    end else begin
        ap_idle_pp0_0to3 = 1'b0;
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
    if (((ap_start == 1'b0) & (ap_idle_pp0_0to3 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        if (((tmp_reg_200_pp0_iter1_reg == 1'd1) & (tmp_i_reg_196_pp0_iter1_reg == 1'd1))) begin
            freePortTable_address1 = zext_ln714_fu_172_p1;
        end else if (((tmp_i_349_reg_209 == 1'd1) & (tmp_i_reg_196_pp0_iter1_reg == 1'd0))) begin
            freePortTable_address1 = zext_ln587_fu_168_p1;
        end else if (((tmp_i_349_reg_209 == 1'd0) & (tmp_i_reg_196_pp0_iter1_reg == 1'd0))) begin
            freePortTable_address1 = zext_ln587_16_fu_163_p1;
        end else begin
            freePortTable_address1 = 'bx;
        end
    end else begin
        freePortTable_address1 = 'bx;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        freePortTable_ce0 = 1'b1;
    end else begin
        freePortTable_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter2 == 1'b1) & (tmp_reg_200_pp0_iter1_reg == 1'd1) & (tmp_i_reg_196_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_i_349_reg_209 == 1'd1) & (ap_enable_reg_pp0_iter2 == 1'b1) & (tmp_i_reg_196_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_i_349_reg_209 == 1'd0) & (ap_enable_reg_pp0_iter2 == 1'b1) & (tmp_i_reg_196_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        freePortTable_ce1 = 1'b1;
    end else begin
        freePortTable_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_548_i_nbwritereq_fu_90_p3 == 1'd1) & (freePortTable_load_reg_234 == 1'd0) & (tmp_i_349_reg_209_pp0_iter3_reg == 1'd0) & (tmp_i_reg_196_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        freePortTable_we0 = 1'b1;
    end else begin
        freePortTable_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (tmp_reg_200_pp0_iter1_reg == 1'd1) & (tmp_i_reg_196_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        freePortTable_we1 = 1'b1;
    end else begin
        freePortTable_we1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_predicate_op56_write_state5 == 1'b1) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        portTable2txApp_port_rsp_blk_n = portTable2txApp_port_rsp_full_n;
    end else begin
        portTable2txApp_port_rsp_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op56_write_state5 == 1'b1) & (ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        portTable2txApp_port_rsp_write = 1'b1;
    end else begin
        portTable2txApp_port_rsp_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_predicate_op17_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        pt_portCheckUsed_req_fifo_blk_n = pt_portCheckUsed_req_fifo_empty_n;
    end else begin
        pt_portCheckUsed_req_fifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op17_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        pt_portCheckUsed_req_fifo_read = 1'b1;
    end else begin
        pt_portCheckUsed_req_fifo_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0) & (ap_predicate_op58_write_state5 == 1'b1))) begin
        pt_portCheckUsed_rsp_fifo_blk_n = pt_portCheckUsed_rsp_fifo_full_n;
    end else begin
        pt_portCheckUsed_rsp_fifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_predicate_op58_write_state5 == 1'b1))) begin
        pt_portCheckUsed_rsp_fifo_write = 1'b1;
    end else begin
        pt_portCheckUsed_rsp_fifo_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_done_reg == 1'b0) & (tmp_i_nbreadreq_fu_62_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        sLookup2portTable_releasePort_blk_n = sLookup2portTable_releasePort_empty_n;
    end else begin
        sLookup2portTable_releasePort_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((tmp_i_nbreadreq_fu_62_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sLookup2portTable_releasePort_read = 1'b1;
    end else begin
        sLookup2portTable_releasePort_read = 1'b0;
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

assign add_ln886_fu_176_p2 = (pt_cursor + 15'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_pp0 = ((ap_ST_fsm_pp0_stage0 == ap_CS_fsm) & (1'b1 == ap_block_pp0_stage0_subdone));
end

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_predicate_op17_read_state2 == 1'b1) & (pt_portCheckUsed_req_fifo_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_62_p3 == 1'd1) & (sLookup2portTable_releasePort_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (((ap_predicate_op56_write_state5 == 1'b1) & (portTable2txApp_port_rsp_full_n == 1'b0)) | ((ap_predicate_op58_write_state5 == 1'b1) & (pt_portCheckUsed_rsp_fifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_predicate_op17_read_state2 == 1'b1) & (pt_portCheckUsed_req_fifo_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_62_p3 == 1'd1) & (sLookup2portTable_releasePort_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (((ap_predicate_op56_write_state5 == 1'b1) & (portTable2txApp_port_rsp_full_n == 1'b0)) | ((ap_predicate_op58_write_state5 == 1'b1) & (pt_portCheckUsed_rsp_fifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_predicate_op17_read_state2 == 1'b1) & (pt_portCheckUsed_req_fifo_empty_n == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_62_p3 == 1'd1) & (sLookup2portTable_releasePort_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (((ap_predicate_op56_write_state5 == 1'b1) & (portTable2txApp_port_rsp_full_n == 1'b0)) | ((ap_predicate_op58_write_state5 == 1'b1) & (pt_portCheckUsed_rsp_fifo_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((tmp_i_nbreadreq_fu_62_p3 == 1'd1) & (sLookup2portTable_releasePort_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((ap_predicate_op17_read_state2 == 1'b1) & (pt_portCheckUsed_req_fifo_empty_n == 1'b0));
end

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state5_pp0_stage0_iter4 = (((ap_predicate_op56_write_state5 == 1'b1) & (portTable2txApp_port_rsp_full_n == 1'b0)) | ((ap_predicate_op58_write_state5 == 1'b1) & (pt_portCheckUsed_rsp_fifo_full_n == 1'b0)));
end

always @ (*) begin
    ap_enable_operation_39 = (ap_predicate_op39_load_state3 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_42 = (ap_predicate_op42_load_state3 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_45 = (ap_predicate_op45_store_state3 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_49 = (ap_predicate_op49_load_state4 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_51 = (ap_predicate_op51_load_state4 == 1'b1);
end

always @ (*) begin
    ap_enable_operation_55 = (ap_predicate_op55_store_state5 == 1'b1);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_enable_state3_pp0_iter2_stage0 = ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_enable_state4_pp0_iter3_stage0 = ((ap_enable_reg_pp0_iter3 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_enable_state5_pp0_iter4_stage0 = ((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

always @ (*) begin
    ap_predicate_op17_read_state2 = ((tmp_i_349_nbreadreq_fu_76_p3 == 1'd1) & (tmp_i_reg_196 == 1'd0));
end

always @ (*) begin
    ap_predicate_op39_load_state3 = ((tmp_i_349_reg_209 == 1'd0) & (tmp_i_reg_196_pp0_iter1_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op42_load_state3 = ((tmp_i_349_reg_209 == 1'd1) & (tmp_i_reg_196_pp0_iter1_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op45_store_state3 = ((tmp_reg_200_pp0_iter1_reg == 1'd1) & (tmp_i_reg_196_pp0_iter1_reg == 1'd1));
end

always @ (*) begin
    ap_predicate_op49_load_state4 = ((tmp_i_349_reg_209_pp0_iter2_reg == 1'd0) & (tmp_i_reg_196_pp0_iter2_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op51_load_state4 = ((tmp_i_349_reg_209_pp0_iter2_reg == 1'd1) & (tmp_i_reg_196_pp0_iter2_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op55_store_state5 = ((tmp_548_i_nbwritereq_fu_90_p3 == 1'd1) & (freePortTable_load_reg_234 == 1'd0) & (tmp_i_349_reg_209_pp0_iter3_reg == 1'd0) & (tmp_i_reg_196_pp0_iter3_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op56_write_state5 = ((tmp_548_i_nbwritereq_fu_90_p3 == 1'd1) & (freePortTable_load_reg_234 == 1'd0) & (tmp_i_349_reg_209_pp0_iter3_reg == 1'd0) & (tmp_i_reg_196_pp0_iter3_reg == 1'd0));
end

always @ (*) begin
    ap_predicate_op58_write_state5 = ((tmp_i_349_reg_209_pp0_iter3_reg == 1'd1) & (tmp_i_reg_196_pp0_iter3_reg == 1'd0));
end

assign freePortTable_address0 = freePortTable_addr_2_reg_223_pp0_iter3_reg;

assign portTable2txApp_port_rsp_din = {{1'd1}, {pt_cursor_load_reg_218_pp0_iter3_reg}};

assign pt_portCheckUsed_rsp_fifo_din = freePortTable_load_1_reg_238;

assign tmp_548_i_nbwritereq_fu_90_p3 = portTable2txApp_port_rsp_full_n;

assign tmp_fu_147_p3 = sLookup2portTable_releasePort_dout[32'd15];

assign tmp_i_349_nbreadreq_fu_76_p3 = pt_portCheckUsed_req_fifo_empty_n;

assign tmp_i_nbreadreq_fu_62_p3 = sLookup2portTable_releasePort_empty_n;

assign trunc_ln714_fu_155_p1 = sLookup2portTable_releasePort_dout[14:0];

assign zext_ln587_16_fu_163_p1 = pt_cursor;

assign zext_ln587_fu_168_p1 = tmp_V_reg_213;

assign zext_ln714_fu_172_p1 = trunc_ln714_reg_204_pp0_iter1_reg;

endmodule //toe_top_free_port_table
