// ------------------------------------------------------------------------- 
// High Level Design Compiler for Intel(R) FPGAs Version 21.1 (Release Build #173.3)
// 
// Legal Notice: Copyright 2021 Intel Corporation.  All rights reserved.
// Your use of  Intel Corporation's design tools,  logic functions and other
// software and  tools, and its AMPP partner logic functions, and any output
// files any  of the foregoing (including  device programming  or simulation
// files), and  any associated  documentation  or information  are expressly
// subject  to the terms and  conditions of the  Intel FPGA Software License
// Agreement, Intel MegaCore Function License Agreement, or other applicable
// license agreement,  including,  without limitation,  that your use is for
// the  sole  purpose of  programming  logic devices  manufactured by  Intel
// and  sold by Intel  or its authorized  distributors. Please refer  to the
// applicable agreement for further details.
// ---------------------------------------------------------------------------

// SystemVerilog created from stencil5_latency_unconstrained_function_wrapper
// SystemVerilog created on Wed Apr 15 12:45:04 2026


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module stencil5_latency_unconstrained_function_wrapper (
    input wire [159:0] avst_iord_bl_call_stencil5_latency_unconstrained_data,
    input wire [0:0] avst_iord_bl_call_stencil5_latency_unconstrained_valid,
    input wire [0:0] avst_iowr_bl_return_stencil5_latency_unconstrained_almostfull,
    input wire [0:0] avst_iowr_bl_return_stencil5_latency_unconstrained_ready,
    input wire [31:0] in_center,
    input wire [31:0] in_east,
    input wire [31:0] in_north,
    input wire [31:0] in_south,
    input wire [31:0] in_west,
    input wire [0:0] stall,
    input wire [0:0] stall_in,
    input wire [0:0] start,
    input wire [0:0] valid_in,
    output wire [0:0] avst_iord_bl_call_stencil5_latency_unconstrained_almost_full,
    output wire [0:0] avst_iord_bl_call_stencil5_latency_unconstrained_ready,
    output wire [31:0] avst_iowr_bl_return_stencil5_latency_unconstrained_data,
    output wire [0:0] avst_iowr_bl_return_stencil5_latency_unconstrained_valid,
    output wire [0:0] busy,
    output wire [0:0] done,
    output wire [31:0] returndata,
    input wire clock,
    input wire resetn
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [0:0] busy_and_q;
    wire [0:0] busy_or_q;
    wire [63:0] call_const_q;
    wire [159:0] implicit_input_q;
    wire [0:0] not_ready_q;
    wire [0:0] not_stall_q;
    wire [0:0] pos_reset_q;
    wire [0:0] reset_wire_inst_o_resetn;
    wire reset_wire_inst_o_resetn_bitsignaltemp;
    wire [0:0] stencil5_latency_unconstrained_function_out_iord_bl_call_stencil5_latency_unconstrained_o_fifoalmost_full;
    wire [0:0] stencil5_latency_unconstrained_function_out_iord_bl_call_stencil5_latency_unconstrained_o_fifoready;
    wire [31:0] stencil5_latency_unconstrained_function_out_iowr_bl_return_stencil5_latency_unconstrained_o_fifodata;
    wire [0:0] stencil5_latency_unconstrained_function_out_iowr_bl_return_stencil5_latency_unconstrained_o_fifovalid;


    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // not_stall(LOGICAL,22)
    assign not_stall_q = ~ (stall);

    // implicit_input(BITJOIN,7)
    assign implicit_input_q = {in_west, in_south, in_north, in_east, in_center};

    // call_const(CONSTANT,4)
    assign call_const_q = $unsigned(64'b0000000000000000000000000000000000000000000000000000000000000000);

    // stencil5_latency_unconstrained_function(BLACKBOX,34)
    stencil5_latency_unconstrained_function thestencil5_latency_unconstrained_function (
        .in_arg_call(call_const_q),
        .in_arg_return(call_const_q),
        .in_iord_bl_call_stencil5_latency_unconstrained_i_fifodata(implicit_input_q),
        .in_iord_bl_call_stencil5_latency_unconstrained_i_fifovalid(start),
        .in_iowr_bl_return_stencil5_latency_unconstrained_i_fifoready(not_stall_q),
        .in_stall_in(GND_q),
        .in_valid_in(VCC_q),
        .out_iord_bl_call_stencil5_latency_unconstrained_o_fifoalmost_full(stencil5_latency_unconstrained_function_out_iord_bl_call_stencil5_latency_unconstrained_o_fifoalmost_full),
        .out_iord_bl_call_stencil5_latency_unconstrained_o_fifoready(stencil5_latency_unconstrained_function_out_iord_bl_call_stencil5_latency_unconstrained_o_fifoready),
        .out_iowr_bl_return_stencil5_latency_unconstrained_o_fifodata(stencil5_latency_unconstrained_function_out_iowr_bl_return_stencil5_latency_unconstrained_o_fifodata),
        .out_iowr_bl_return_stencil5_latency_unconstrained_o_fifovalid(stencil5_latency_unconstrained_function_out_iowr_bl_return_stencil5_latency_unconstrained_o_fifovalid),
        .out_stall_out(),
        .out_valid_out(),
        .clock(clock),
        .resetn(resetn)
    );

    // avst_iord_bl_call_stencil5_latency_unconstrained_almost_full(GPOUT,23)
    assign avst_iord_bl_call_stencil5_latency_unconstrained_almost_full = stencil5_latency_unconstrained_function_out_iord_bl_call_stencil5_latency_unconstrained_o_fifoalmost_full;

    // avst_iord_bl_call_stencil5_latency_unconstrained_ready(GPOUT,24)
    assign avst_iord_bl_call_stencil5_latency_unconstrained_ready = stencil5_latency_unconstrained_function_out_iord_bl_call_stencil5_latency_unconstrained_o_fifoready;

    // avst_iowr_bl_return_stencil5_latency_unconstrained_data(GPOUT,25)
    assign avst_iowr_bl_return_stencil5_latency_unconstrained_data = stencil5_latency_unconstrained_function_out_iowr_bl_return_stencil5_latency_unconstrained_o_fifodata;

    // avst_iowr_bl_return_stencil5_latency_unconstrained_valid(GPOUT,26)
    assign avst_iowr_bl_return_stencil5_latency_unconstrained_valid = stencil5_latency_unconstrained_function_out_iowr_bl_return_stencil5_latency_unconstrained_o_fifovalid;

    // not_ready(LOGICAL,21)
    assign not_ready_q = ~ (stencil5_latency_unconstrained_function_out_iord_bl_call_stencil5_latency_unconstrained_o_fifoready);

    // busy_and(LOGICAL,2)
    assign busy_and_q = not_ready_q & start;

    // reset_wire_inst(EXTIFACE,31)
    assign reset_wire_inst_o_resetn[0] = reset_wire_inst_o_resetn_bitsignaltemp;
    acl_reset_wire thereset_wire_inst (
        .o_resetn(reset_wire_inst_o_resetn_bitsignaltemp),
        .clock(clock),
        .resetn(resetn)
    );

    // pos_reset(LOGICAL,30)
    assign pos_reset_q = ~ (reset_wire_inst_o_resetn);

    // busy_or(LOGICAL,3)
    assign busy_or_q = pos_reset_q | busy_and_q;

    // busy(GPOUT,27)
    assign busy = busy_or_q;

    // done(GPOUT,28)
    assign done = stencil5_latency_unconstrained_function_out_iowr_bl_return_stencil5_latency_unconstrained_o_fifovalid;

    // returndata(GPOUT,29)
    assign returndata = stencil5_latency_unconstrained_function_out_iowr_bl_return_stencil5_latency_unconstrained_o_fifodata;

endmodule
