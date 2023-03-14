// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module toe_top_insert_checksum_512_s (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        txEng_tcpChecksumFifo_dout,
        txEng_tcpChecksumFifo_num_data_valid,
        txEng_tcpChecksumFifo_fifo_cap,
        txEng_tcpChecksumFifo_empty_n,
        txEng_tcpChecksumFifo_read,
        txEng_tcpPkgBuffer4_dout,
        txEng_tcpPkgBuffer4_num_data_valid,
        txEng_tcpPkgBuffer4_fifo_cap,
        txEng_tcpPkgBuffer4_empty_n,
        txEng_tcpPkgBuffer4_read,
        txEng_tcpPkgBuffer5_din,
        txEng_tcpPkgBuffer5_num_data_valid,
        txEng_tcpPkgBuffer5_fifo_cap,
        txEng_tcpPkgBuffer5_full_n,
        txEng_tcpPkgBuffer5_write
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] txEng_tcpChecksumFifo_dout;
input  [2:0] txEng_tcpChecksumFifo_num_data_valid;
input  [2:0] txEng_tcpChecksumFifo_fifo_cap;
input   txEng_tcpChecksumFifo_empty_n;
output   txEng_tcpChecksumFifo_read;
input  [576:0] txEng_tcpPkgBuffer4_dout;
input  [1:0] txEng_tcpPkgBuffer4_num_data_valid;
input  [1:0] txEng_tcpPkgBuffer4_fifo_cap;
input   txEng_tcpPkgBuffer4_empty_n;
output   txEng_tcpPkgBuffer4_read;
output  [576:0] txEng_tcpPkgBuffer5_din;
input  [1:0] txEng_tcpPkgBuffer5_num_data_valid;
input  [1:0] txEng_tcpPkgBuffer5_fifo_cap;
input   txEng_tcpPkgBuffer5_full_n;
output   txEng_tcpPkgBuffer5_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg txEng_tcpChecksumFifo_read;
reg txEng_tcpPkgBuffer4_read;
reg[576:0] txEng_tcpPkgBuffer5_din;
reg txEng_tcpPkgBuffer5_write;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire   [0:0] icmp_ln1543_fu_107_p2;
wire   [0:0] tmp_i_nbreadreq_fu_60_p3;
wire   [0:0] grp_nbreadreq_fu_68_p3;
reg    ap_predicate_op23_read_state1;
reg    ap_predicate_op24_read_state1;
reg    ap_predicate_op37_read_state1;
reg    ap_done_reg;
reg    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] icmp_ln1543_reg_188;
reg   [0:0] tmp_i_reg_192;
reg   [0:0] tmp_540_i_reg_196;
reg    ap_predicate_op45_write_state2;
reg   [0:0] tmp_539_i_reg_210;
reg    ap_predicate_op47_write_state2;
reg    ap_block_state2_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_subdone;
reg   [1:0] state_V;
reg    txEng_tcpChecksumFifo_blk_n;
wire    ap_block_pp0_stage0;
reg    txEng_tcpPkgBuffer4_blk_n;
reg    txEng_tcpPkgBuffer5_blk_n;
reg    ap_block_pp0_stage0_11001;
wire   [511:0] p_Result_203_fu_139_p5;
reg   [511:0] p_Result_203_reg_200;
reg   [64:0] tmp_reg_205;
reg   [576:0] txEng_tcpPkgBuffer4_read_reg_214;
wire   [1:0] select_ln1581_fu_161_p3;
wire   [0:0] grp_fu_95_p3;
wire   [576:0] p_0_fu_181_p3;
reg    ap_block_pp0_stage0_01001;
wire   [7:0] trunc_ln674_fu_127_p1;
wire   [7:0] tmp_541_i6_fu_117_p4;
wire   [511:0] tmp_data_V_fu_113_p1;
wire   [15:0] p_Result_s_fu_131_p3;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to0;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_245;
reg    ap_condition_167;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
#0 state_V = 2'd1;
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
    if ((1'b1 == ap_condition_245)) begin
        if (((icmp_ln1543_fu_107_p2 == 1'd1) & (grp_fu_95_p3 == 1'd1))) begin
            state_V <= 2'd1;
        end else if (((tmp_i_nbreadreq_fu_60_p3 == 1'd1) & (icmp_ln1543_fu_107_p2 == 1'd0))) begin
            state_V <= select_ln1581_fu_161_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln1543_reg_188 <= icmp_ln1543_fu_107_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_nbreadreq_fu_68_p3 == 1'd1) & (tmp_i_nbreadreq_fu_60_p3 == 1'd1) & (icmp_ln1543_fu_107_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        p_Result_203_reg_200 <= p_Result_203_fu_139_p5;
        tmp_reg_205 <= {{txEng_tcpPkgBuffer4_dout[576:512]}};
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1543_fu_107_p2 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_539_i_reg_210 <= grp_nbreadreq_fu_68_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_i_nbreadreq_fu_60_p3 == 1'd1) & (icmp_ln1543_fu_107_p2 == 1'd0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_540_i_reg_196 <= grp_nbreadreq_fu_68_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln1543_fu_107_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_i_reg_192 <= tmp_i_nbreadreq_fu_60_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op37_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        txEng_tcpPkgBuffer4_read_reg_214 <= txEng_tcpPkgBuffer4_dout;
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
    if (((ap_done_reg == 1'b0) & (ap_predicate_op23_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        txEng_tcpChecksumFifo_blk_n = txEng_tcpChecksumFifo_empty_n;
    end else begin
        txEng_tcpChecksumFifo_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op23_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        txEng_tcpChecksumFifo_read = 1'b1;
    end else begin
        txEng_tcpChecksumFifo_read = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_done_reg == 1'b0) & (ap_predicate_op37_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_done_reg == 1'b0) & (ap_predicate_op24_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        txEng_tcpPkgBuffer4_blk_n = txEng_tcpPkgBuffer4_empty_n;
    end else begin
        txEng_tcpPkgBuffer4_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_predicate_op37_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op24_read_state1 == 1'b1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        txEng_tcpPkgBuffer4_read = 1'b1;
    end else begin
        txEng_tcpPkgBuffer4_read = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_predicate_op47_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)) | ((ap_predicate_op45_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0)))) begin
        txEng_tcpPkgBuffer5_blk_n = txEng_tcpPkgBuffer5_full_n;
    end else begin
        txEng_tcpPkgBuffer5_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_167)) begin
        if ((ap_predicate_op47_write_state2 == 1'b1)) begin
            txEng_tcpPkgBuffer5_din = txEng_tcpPkgBuffer4_read_reg_214;
        end else if ((ap_predicate_op45_write_state2 == 1'b1)) begin
            txEng_tcpPkgBuffer5_din = p_0_fu_181_p3;
        end else begin
            txEng_tcpPkgBuffer5_din = 'bx;
        end
    end else begin
        txEng_tcpPkgBuffer5_din = 'bx;
    end
end

always @ (*) begin
    if ((((ap_predicate_op47_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_predicate_op45_write_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        txEng_tcpPkgBuffer5_write = 1'b1;
    end else begin
        txEng_tcpPkgBuffer5_write = 1'b0;
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
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op37_read_state1 == 1'b1) & (txEng_tcpPkgBuffer4_empty_n == 1'b0)) | ((ap_predicate_op24_read_state1 == 1'b1) & (txEng_tcpPkgBuffer4_empty_n == 1'b0)) | ((ap_predicate_op23_read_state1 == 1'b1) & (txEng_tcpChecksumFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op47_write_state2 == 1'b1) & (txEng_tcpPkgBuffer5_full_n == 1'b0)) | ((ap_predicate_op45_write_state2 == 1'b1) & (txEng_tcpPkgBuffer5_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op37_read_state1 == 1'b1) & (txEng_tcpPkgBuffer4_empty_n == 1'b0)) | ((ap_predicate_op24_read_state1 == 1'b1) & (txEng_tcpPkgBuffer4_empty_n == 1'b0)) | ((ap_predicate_op23_read_state1 == 1'b1) & (txEng_tcpChecksumFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op47_write_state2 == 1'b1) & (txEng_tcpPkgBuffer5_full_n == 1'b0)) | ((ap_predicate_op45_write_state2 == 1'b1) & (txEng_tcpPkgBuffer5_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_start == 1'b1) & ((ap_done_reg == 1'b1) | ((ap_predicate_op37_read_state1 == 1'b1) & (txEng_tcpPkgBuffer4_empty_n == 1'b0)) | ((ap_predicate_op24_read_state1 == 1'b1) & (txEng_tcpPkgBuffer4_empty_n == 1'b0)) | ((ap_predicate_op23_read_state1 == 1'b1) & (txEng_tcpChecksumFifo_empty_n == 1'b0)))) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (((ap_predicate_op47_write_state2 == 1'b1) & (txEng_tcpPkgBuffer5_full_n == 1'b0)) | ((ap_predicate_op45_write_state2 == 1'b1) & (txEng_tcpPkgBuffer5_full_n == 1'b0)))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_done_reg == 1'b1) | ((ap_predicate_op37_read_state1 == 1'b1) & (txEng_tcpPkgBuffer4_empty_n == 1'b0)) | ((ap_predicate_op24_read_state1 == 1'b1) & (txEng_tcpPkgBuffer4_empty_n == 1'b0)) | ((ap_predicate_op23_read_state1 == 1'b1) & (txEng_tcpChecksumFifo_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = (((ap_predicate_op47_write_state2 == 1'b1) & (txEng_tcpPkgBuffer5_full_n == 1'b0)) | ((ap_predicate_op45_write_state2 == 1'b1) & (txEng_tcpPkgBuffer5_full_n == 1'b0)));
end

always @ (*) begin
    ap_condition_167 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_01001));
end

always @ (*) begin
    ap_condition_245 = ((grp_nbreadreq_fu_68_p3 == 1'd1) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

always @ (*) begin
    ap_predicate_op23_read_state1 = ((grp_nbreadreq_fu_68_p3 == 1'd1) & (tmp_i_nbreadreq_fu_60_p3 == 1'd1) & (icmp_ln1543_fu_107_p2 == 1'd0));
end

always @ (*) begin
    ap_predicate_op24_read_state1 = ((grp_nbreadreq_fu_68_p3 == 1'd1) & (tmp_i_nbreadreq_fu_60_p3 == 1'd1) & (icmp_ln1543_fu_107_p2 == 1'd0));
end

always @ (*) begin
    ap_predicate_op37_read_state1 = ((grp_nbreadreq_fu_68_p3 == 1'd1) & (icmp_ln1543_fu_107_p2 == 1'd1));
end

always @ (*) begin
    ap_predicate_op45_write_state2 = ((tmp_540_i_reg_196 == 1'd1) & (tmp_i_reg_192 == 1'd1) & (icmp_ln1543_reg_188 == 1'd0));
end

always @ (*) begin
    ap_predicate_op47_write_state2 = ((tmp_539_i_reg_210 == 1'd1) & (icmp_ln1543_reg_188 == 1'd1));
end

assign grp_fu_95_p3 = txEng_tcpPkgBuffer4_dout[32'd576];

assign grp_nbreadreq_fu_68_p3 = txEng_tcpPkgBuffer4_empty_n;

assign icmp_ln1543_fu_107_p2 = ((state_V == 2'd2) ? 1'b1 : 1'b0);

assign p_0_fu_181_p3 = {{tmp_reg_205}, {p_Result_203_reg_200}};

assign p_Result_203_fu_139_p5 = {{tmp_data_V_fu_113_p1[511:144]}, {p_Result_s_fu_131_p3}, {tmp_data_V_fu_113_p1[127:0]}};

assign p_Result_s_fu_131_p3 = {{trunc_ln674_fu_127_p1}, {tmp_541_i6_fu_117_p4}};

assign select_ln1581_fu_161_p3 = ((grp_fu_95_p3[0:0] == 1'b1) ? 2'd1 : 2'd2);

assign tmp_541_i6_fu_117_p4 = {{txEng_tcpChecksumFifo_dout[15:8]}};

assign tmp_data_V_fu_113_p1 = txEng_tcpPkgBuffer4_dout[511:0];

assign tmp_i_nbreadreq_fu_60_p3 = txEng_tcpChecksumFifo_empty_n;

assign trunc_ln674_fu_127_p1 = txEng_tcpChecksumFifo_dout[7:0];

endmodule //toe_top_insert_checksum_512_s