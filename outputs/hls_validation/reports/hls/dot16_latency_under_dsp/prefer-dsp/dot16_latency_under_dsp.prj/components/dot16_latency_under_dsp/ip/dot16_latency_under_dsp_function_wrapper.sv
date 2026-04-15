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

// SystemVerilog created from dot16_latency_under_dsp_function_wrapper
// SystemVerilog created on Wed Apr 15 12:37:30 2026


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module dot16_latency_under_dsp_function_wrapper (
    input wire [1023:0] avst_iord_bl_call_dot16_latency_under_dsp_data,
    input wire [0:0] avst_iord_bl_call_dot16_latency_under_dsp_valid,
    input wire [0:0] avst_iowr_bl_return_dot16_latency_under_dsp_almostfull,
    input wire [0:0] avst_iowr_bl_return_dot16_latency_under_dsp_ready,
    input wire [31:0] in_a0,
    input wire [31:0] in_a1,
    input wire [31:0] in_a10,
    input wire [31:0] in_a11,
    input wire [31:0] in_a12,
    input wire [31:0] in_a13,
    input wire [31:0] in_a14,
    input wire [31:0] in_a15,
    input wire [31:0] in_a2,
    input wire [31:0] in_a3,
    input wire [31:0] in_a4,
    input wire [31:0] in_a5,
    input wire [31:0] in_a6,
    input wire [31:0] in_a7,
    input wire [31:0] in_a8,
    input wire [31:0] in_a9,
    input wire [31:0] in_b0,
    input wire [31:0] in_b1,
    input wire [31:0] in_b10,
    input wire [31:0] in_b11,
    input wire [31:0] in_b12,
    input wire [31:0] in_b13,
    input wire [31:0] in_b14,
    input wire [31:0] in_b15,
    input wire [31:0] in_b2,
    input wire [31:0] in_b3,
    input wire [31:0] in_b4,
    input wire [31:0] in_b5,
    input wire [31:0] in_b6,
    input wire [31:0] in_b7,
    input wire [31:0] in_b8,
    input wire [31:0] in_b9,
    input wire [0:0] stall,
    input wire [0:0] stall_in,
    input wire [0:0] start,
    input wire [0:0] valid_in,
    output wire [0:0] avst_iord_bl_call_dot16_latency_under_dsp_almost_full,
    output wire [0:0] avst_iord_bl_call_dot16_latency_under_dsp_ready,
    output wire [31:0] avst_iowr_bl_return_dot16_latency_under_dsp_data,
    output wire [0:0] avst_iowr_bl_return_dot16_latency_under_dsp_valid,
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
    wire [0:0] dot16_latency_under_dsp_function_out_iord_bl_call_dot16_latency_under_dsp_o_fifoalmost_full;
    wire [0:0] dot16_latency_under_dsp_function_out_iord_bl_call_dot16_latency_under_dsp_o_fifoready;
    wire [31:0] dot16_latency_under_dsp_function_out_iowr_bl_return_dot16_latency_under_dsp_o_fifodata;
    wire [0:0] dot16_latency_under_dsp_function_out_iowr_bl_return_dot16_latency_under_dsp_o_fifovalid;
    wire [1023:0] implicit_input_q;
    wire [0:0] not_ready_q;
    wire [0:0] not_stall_q;
    wire [0:0] pos_reset_q;
    wire [0:0] reset_wire_inst_o_resetn;
    wire reset_wire_inst_o_resetn_bitsignaltemp;


    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // not_stall(LOGICAL,50)
    assign not_stall_q = ~ (stall);

    // implicit_input(BITJOIN,8)
    assign implicit_input_q = {in_b9, in_b8, in_b7, in_b6, in_b5, in_b4, in_b3, in_b2, in_b15, in_b14, in_b13, in_b12, in_b11, in_b10, in_b1, in_b0, in_a9, in_a8, in_a7, in_a6, in_a5, in_a4, in_a3, in_a2, in_a15, in_a14, in_a13, in_a12, in_a11, in_a10, in_a1, in_a0};

    // call_const(CONSTANT,4)
    assign call_const_q = $unsigned(64'b0000000000000000000000000000000000000000000000000000000000000000);

    // dot16_latency_under_dsp_function(BLACKBOX,7)
    dot16_latency_under_dsp_function thedot16_latency_under_dsp_function (
        .in_arg_call(call_const_q),
        .in_arg_return(call_const_q),
        .in_iord_bl_call_dot16_latency_under_dsp_i_fifodata(implicit_input_q),
        .in_iord_bl_call_dot16_latency_under_dsp_i_fifovalid(start),
        .in_iowr_bl_return_dot16_latency_under_dsp_i_fifoready(not_stall_q),
        .in_stall_in(GND_q),
        .in_valid_in(VCC_q),
        .out_iord_bl_call_dot16_latency_under_dsp_o_fifoalmost_full(dot16_latency_under_dsp_function_out_iord_bl_call_dot16_latency_under_dsp_o_fifoalmost_full),
        .out_iord_bl_call_dot16_latency_under_dsp_o_fifoready(dot16_latency_under_dsp_function_out_iord_bl_call_dot16_latency_under_dsp_o_fifoready),
        .out_iowr_bl_return_dot16_latency_under_dsp_o_fifodata(dot16_latency_under_dsp_function_out_iowr_bl_return_dot16_latency_under_dsp_o_fifodata),
        .out_iowr_bl_return_dot16_latency_under_dsp_o_fifovalid(dot16_latency_under_dsp_function_out_iowr_bl_return_dot16_latency_under_dsp_o_fifovalid),
        .out_stall_out(),
        .out_valid_out(),
        .clock(clock),
        .resetn(resetn)
    );

    // avst_iord_bl_call_dot16_latency_under_dsp_almost_full(GPOUT,51)
    assign avst_iord_bl_call_dot16_latency_under_dsp_almost_full = dot16_latency_under_dsp_function_out_iord_bl_call_dot16_latency_under_dsp_o_fifoalmost_full;

    // avst_iord_bl_call_dot16_latency_under_dsp_ready(GPOUT,52)
    assign avst_iord_bl_call_dot16_latency_under_dsp_ready = dot16_latency_under_dsp_function_out_iord_bl_call_dot16_latency_under_dsp_o_fifoready;

    // avst_iowr_bl_return_dot16_latency_under_dsp_data(GPOUT,53)
    assign avst_iowr_bl_return_dot16_latency_under_dsp_data = dot16_latency_under_dsp_function_out_iowr_bl_return_dot16_latency_under_dsp_o_fifodata;

    // avst_iowr_bl_return_dot16_latency_under_dsp_valid(GPOUT,54)
    assign avst_iowr_bl_return_dot16_latency_under_dsp_valid = dot16_latency_under_dsp_function_out_iowr_bl_return_dot16_latency_under_dsp_o_fifovalid;

    // not_ready(LOGICAL,49)
    assign not_ready_q = ~ (dot16_latency_under_dsp_function_out_iord_bl_call_dot16_latency_under_dsp_o_fifoready);

    // busy_and(LOGICAL,2)
    assign busy_and_q = not_ready_q & start;

    // reset_wire_inst(EXTIFACE,59)
    assign reset_wire_inst_o_resetn[0] = reset_wire_inst_o_resetn_bitsignaltemp;
    acl_reset_wire thereset_wire_inst (
        .o_resetn(reset_wire_inst_o_resetn_bitsignaltemp),
        .clock(clock),
        .resetn(resetn)
    );

    // pos_reset(LOGICAL,58)
    assign pos_reset_q = ~ (reset_wire_inst_o_resetn);

    // busy_or(LOGICAL,3)
    assign busy_or_q = pos_reset_q | busy_and_q;

    // busy(GPOUT,55)
    assign busy = busy_or_q;

    // done(GPOUT,56)
    assign done = dot16_latency_under_dsp_function_out_iowr_bl_return_dot16_latency_under_dsp_o_fifovalid;

    // returndata(GPOUT,57)
    assign returndata = dot16_latency_under_dsp_function_out_iowr_bl_return_dot16_latency_under_dsp_o_fifodata;

endmodule
