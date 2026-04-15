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

// SystemVerilog created from gemm_blocked_k8_weighted_function_wrapper
// SystemVerilog created on Wed Apr 15 12:42:39 2026


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module gemm_blocked_k8_weighted_function_wrapper (
    input wire [511:0] avst_iord_bl_call_gemm_blocked_k8_weighted_data,
    input wire [0:0] avst_iord_bl_call_gemm_blocked_k8_weighted_valid,
    input wire [0:0] avst_iowr_bl_return_gemm_blocked_k8_weighted_almostfull,
    input wire [0:0] avst_iowr_bl_return_gemm_blocked_k8_weighted_ready,
    input wire [31:0] in_BA0,
    input wire [31:0] in_BA1,
    input wire [31:0] in_BA2,
    input wire [31:0] in_BA3,
    input wire [31:0] in_BA4,
    input wire [31:0] in_BA5,
    input wire [31:0] in_BA6,
    input wire [31:0] in_BA7,
    input wire [31:0] in_BB0,
    input wire [31:0] in_BB1,
    input wire [31:0] in_BB2,
    input wire [31:0] in_BB3,
    input wire [31:0] in_BB4,
    input wire [31:0] in_BB5,
    input wire [31:0] in_BB6,
    input wire [31:0] in_BB7,
    input wire [0:0] stall,
    input wire [0:0] stall_in,
    input wire [0:0] start,
    input wire [0:0] valid_in,
    output wire [0:0] avst_iord_bl_call_gemm_blocked_k8_weighted_almost_full,
    output wire [0:0] avst_iord_bl_call_gemm_blocked_k8_weighted_ready,
    output wire [31:0] avst_iowr_bl_return_gemm_blocked_k8_weighted_data,
    output wire [0:0] avst_iowr_bl_return_gemm_blocked_k8_weighted_valid,
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
    wire [0:0] gemm_blocked_k8_weighted_function_out_iord_bl_call_gemm_blocked_k8_weighted_o_fifoalmost_full;
    wire [0:0] gemm_blocked_k8_weighted_function_out_iord_bl_call_gemm_blocked_k8_weighted_o_fifoready;
    wire [31:0] gemm_blocked_k8_weighted_function_out_iowr_bl_return_gemm_blocked_k8_weighted_o_fifodata;
    wire [0:0] gemm_blocked_k8_weighted_function_out_iowr_bl_return_gemm_blocked_k8_weighted_o_fifovalid;
    wire [511:0] implicit_input_q;
    wire [0:0] not_ready_q;
    wire [0:0] not_stall_q;
    wire [0:0] pos_reset_q;
    wire [0:0] reset_wire_inst_o_resetn;
    wire reset_wire_inst_o_resetn_bitsignaltemp;


    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // not_stall(LOGICAL,34)
    assign not_stall_q = ~ (stall);

    // implicit_input(BITJOIN,8)
    assign implicit_input_q = {in_BB7, in_BB6, in_BB5, in_BB4, in_BB3, in_BB2, in_BB1, in_BB0, in_BA7, in_BA6, in_BA5, in_BA4, in_BA3, in_BA2, in_BA1, in_BA0};

    // call_const(CONSTANT,4)
    assign call_const_q = $unsigned(64'b0000000000000000000000000000000000000000000000000000000000000000);

    // gemm_blocked_k8_weighted_function(BLACKBOX,7)
    gemm_blocked_k8_weighted_function thegemm_blocked_k8_weighted_function (
        .in_arg_call(call_const_q),
        .in_arg_return(call_const_q),
        .in_iord_bl_call_gemm_blocked_k8_weighted_i_fifodata(implicit_input_q),
        .in_iord_bl_call_gemm_blocked_k8_weighted_i_fifovalid(start),
        .in_iowr_bl_return_gemm_blocked_k8_weighted_i_fifoready(not_stall_q),
        .in_stall_in(GND_q),
        .in_valid_in(VCC_q),
        .out_iord_bl_call_gemm_blocked_k8_weighted_o_fifoalmost_full(gemm_blocked_k8_weighted_function_out_iord_bl_call_gemm_blocked_k8_weighted_o_fifoalmost_full),
        .out_iord_bl_call_gemm_blocked_k8_weighted_o_fifoready(gemm_blocked_k8_weighted_function_out_iord_bl_call_gemm_blocked_k8_weighted_o_fifoready),
        .out_iowr_bl_return_gemm_blocked_k8_weighted_o_fifodata(gemm_blocked_k8_weighted_function_out_iowr_bl_return_gemm_blocked_k8_weighted_o_fifodata),
        .out_iowr_bl_return_gemm_blocked_k8_weighted_o_fifovalid(gemm_blocked_k8_weighted_function_out_iowr_bl_return_gemm_blocked_k8_weighted_o_fifovalid),
        .out_stall_out(),
        .out_valid_out(),
        .clock(clock),
        .resetn(resetn)
    );

    // avst_iord_bl_call_gemm_blocked_k8_weighted_almost_full(GPOUT,35)
    assign avst_iord_bl_call_gemm_blocked_k8_weighted_almost_full = gemm_blocked_k8_weighted_function_out_iord_bl_call_gemm_blocked_k8_weighted_o_fifoalmost_full;

    // avst_iord_bl_call_gemm_blocked_k8_weighted_ready(GPOUT,36)
    assign avst_iord_bl_call_gemm_blocked_k8_weighted_ready = gemm_blocked_k8_weighted_function_out_iord_bl_call_gemm_blocked_k8_weighted_o_fifoready;

    // avst_iowr_bl_return_gemm_blocked_k8_weighted_data(GPOUT,37)
    assign avst_iowr_bl_return_gemm_blocked_k8_weighted_data = gemm_blocked_k8_weighted_function_out_iowr_bl_return_gemm_blocked_k8_weighted_o_fifodata;

    // avst_iowr_bl_return_gemm_blocked_k8_weighted_valid(GPOUT,38)
    assign avst_iowr_bl_return_gemm_blocked_k8_weighted_valid = gemm_blocked_k8_weighted_function_out_iowr_bl_return_gemm_blocked_k8_weighted_o_fifovalid;

    // not_ready(LOGICAL,33)
    assign not_ready_q = ~ (gemm_blocked_k8_weighted_function_out_iord_bl_call_gemm_blocked_k8_weighted_o_fifoready);

    // busy_and(LOGICAL,2)
    assign busy_and_q = not_ready_q & start;

    // reset_wire_inst(EXTIFACE,43)
    assign reset_wire_inst_o_resetn[0] = reset_wire_inst_o_resetn_bitsignaltemp;
    acl_reset_wire thereset_wire_inst (
        .o_resetn(reset_wire_inst_o_resetn_bitsignaltemp),
        .clock(clock),
        .resetn(resetn)
    );

    // pos_reset(LOGICAL,42)
    assign pos_reset_q = ~ (reset_wire_inst_o_resetn);

    // busy_or(LOGICAL,3)
    assign busy_or_q = pos_reset_q | busy_and_q;

    // busy(GPOUT,39)
    assign busy = busy_or_q;

    // done(GPOUT,40)
    assign done = gemm_blocked_k8_weighted_function_out_iowr_bl_return_gemm_blocked_k8_weighted_o_fifovalid;

    // returndata(GPOUT,41)
    assign returndata = gemm_blocked_k8_weighted_function_out_iowr_bl_return_gemm_blocked_k8_weighted_o_fifodata;

endmodule
