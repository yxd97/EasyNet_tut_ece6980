`timescale 1 ns / 1 ps

module toe_top_hls_deadlock_idx17_monitor ( // for module toe_top_toe_top_inst.tasi_metaLoader_U0
    input wire clock,
    input wire reset,
    input wire [24:0] axis_block_sigs,
    input wire [88:0] inst_idle_sigs,
    input wire [68:0] inst_block_sigs,
    output wire block
);

// signal declare
reg monitor_find_block;
wire pp_is_axis_block;

assign block = monitor_find_block;
assign pp_is_axis_block = 1'b0 | axis_block_sigs[19] | axis_block_sigs[20];

always @(posedge clock) begin
    if (reset == 1'b1)
        monitor_find_block <= 1'b0;
    else if (pp_is_axis_block == 1'b1)
        monitor_find_block <= 1'b1;
    else
        monitor_find_block <= 1'b0;
end


// instant sub module
endmodule
