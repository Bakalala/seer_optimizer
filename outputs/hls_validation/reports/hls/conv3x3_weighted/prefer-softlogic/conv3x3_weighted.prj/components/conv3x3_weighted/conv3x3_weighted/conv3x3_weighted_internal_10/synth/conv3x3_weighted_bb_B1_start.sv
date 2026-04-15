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

// SystemVerilog created from conv3x3_weighted_bb_B1_start
// SystemVerilog created on Wed Apr 15 12:36:59 2026


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module conv3x3_weighted_bb_B1_start (
    input wire [287:0] in_iord_bl_call_conv3x3_weighted_i_fifodata,
    input wire [0:0] in_iord_bl_call_conv3x3_weighted_i_fifovalid,
    input wire [0:0] in_iowr_bl_return_conv3x3_weighted_i_fifoready,
    input wire [0:0] in_stall_in_0,
    input wire [0:0] in_valid_in_0,
    input wire [0:0] in_valid_in_1,
    output wire [0:0] out_exiting_stall_out,
    output wire [0:0] out_exiting_valid_out,
    output wire [0:0] out_iord_bl_call_conv3x3_weighted_o_fifoalmost_full,
    output wire [0:0] out_iord_bl_call_conv3x3_weighted_o_fifoready,
    output wire [31:0] out_iowr_bl_return_conv3x3_weighted_o_fifodata,
    output wire [0:0] out_iowr_bl_return_conv3x3_weighted_o_fifovalid,
    output wire [0:0] out_stall_in_0,
    output wire [0:0] out_stall_out_0,
    output wire [0:0] out_stall_out_1,
    output wire [0:0] out_valid_in_0,
    output wire [0:0] out_valid_in_1,
    output wire [0:0] out_valid_out_0,
    input wire [0:0] in_pipeline_stall_in,
    output wire [0:0] out_pipeline_valid_out,
    input wire clock,
    input wire resetn
    );

    wire [0:0] bb_conv3x3_weighted_B1_start_stall_region_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_stall_out;
    wire [0:0] bb_conv3x3_weighted_B1_start_stall_region_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_valid_out;
    wire [0:0] bb_conv3x3_weighted_B1_start_stall_region_out_iord_bl_call_conv3x3_weighted_o_fifoalmost_full;
    wire [0:0] bb_conv3x3_weighted_B1_start_stall_region_out_iord_bl_call_conv3x3_weighted_o_fifoready;
    wire [31:0] bb_conv3x3_weighted_B1_start_stall_region_out_iowr_bl_return_conv3x3_weighted_o_fifodata;
    wire [0:0] bb_conv3x3_weighted_B1_start_stall_region_out_iowr_bl_return_conv3x3_weighted_o_fifovalid;
    wire [0:0] bb_conv3x3_weighted_B1_start_stall_region_out_pipeline_valid_out;
    wire [0:0] bb_conv3x3_weighted_B1_start_stall_region_out_stall_out;
    wire [0:0] bb_conv3x3_weighted_B1_start_stall_region_out_valid_out;
    wire [0:0] conv3x3_weighted_B1_start_branch_out_stall_out;
    wire [0:0] conv3x3_weighted_B1_start_branch_out_valid_out_0;
    wire [0:0] conv3x3_weighted_B1_start_merge_out_stall_out_0;
    wire [0:0] conv3x3_weighted_B1_start_merge_out_stall_out_1;
    wire [0:0] conv3x3_weighted_B1_start_merge_out_valid_out;


    // conv3x3_weighted_B1_start_merge(BLACKBOX,4)
    conv3x3_weighted_B1_start_merge theconv3x3_weighted_B1_start_merge (
        .in_stall_in(bb_conv3x3_weighted_B1_start_stall_region_out_stall_out),
        .in_valid_in_0(in_valid_in_0),
        .in_valid_in_1(in_valid_in_1),
        .out_stall_out_0(conv3x3_weighted_B1_start_merge_out_stall_out_0),
        .out_stall_out_1(conv3x3_weighted_B1_start_merge_out_stall_out_1),
        .out_valid_out(conv3x3_weighted_B1_start_merge_out_valid_out),
        .clock(clock),
        .resetn(resetn)
    );

    // conv3x3_weighted_B1_start_branch(BLACKBOX,3)
    conv3x3_weighted_B1_start_branch theconv3x3_weighted_B1_start_branch (
        .in_stall_in_0(in_stall_in_0),
        .in_valid_in(bb_conv3x3_weighted_B1_start_stall_region_out_valid_out),
        .out_stall_out(conv3x3_weighted_B1_start_branch_out_stall_out),
        .out_valid_out_0(conv3x3_weighted_B1_start_branch_out_valid_out_0),
        .clock(clock),
        .resetn(resetn)
    );

    // bb_conv3x3_weighted_B1_start_stall_region(BLACKBOX,2)
    conv3x3_weighted_bb_B1_start_stall_region thebb_conv3x3_weighted_B1_start_stall_region (
        .in_iord_bl_call_conv3x3_weighted_i_fifodata(in_iord_bl_call_conv3x3_weighted_i_fifodata),
        .in_iord_bl_call_conv3x3_weighted_i_fifovalid(in_iord_bl_call_conv3x3_weighted_i_fifovalid),
        .in_iowr_bl_return_conv3x3_weighted_i_fifoready(in_iowr_bl_return_conv3x3_weighted_i_fifoready),
        .in_pipeline_stall_in(in_pipeline_stall_in),
        .in_stall_in(conv3x3_weighted_B1_start_branch_out_stall_out),
        .in_valid_in(conv3x3_weighted_B1_start_merge_out_valid_out),
        .out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_stall_out(bb_conv3x3_weighted_B1_start_stall_region_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_stall_out),
        .out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_valid_out(bb_conv3x3_weighted_B1_start_stall_region_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_valid_out),
        .out_iord_bl_call_conv3x3_weighted_o_fifoalmost_full(bb_conv3x3_weighted_B1_start_stall_region_out_iord_bl_call_conv3x3_weighted_o_fifoalmost_full),
        .out_iord_bl_call_conv3x3_weighted_o_fifoready(bb_conv3x3_weighted_B1_start_stall_region_out_iord_bl_call_conv3x3_weighted_o_fifoready),
        .out_iowr_bl_return_conv3x3_weighted_o_fifodata(bb_conv3x3_weighted_B1_start_stall_region_out_iowr_bl_return_conv3x3_weighted_o_fifodata),
        .out_iowr_bl_return_conv3x3_weighted_o_fifovalid(bb_conv3x3_weighted_B1_start_stall_region_out_iowr_bl_return_conv3x3_weighted_o_fifovalid),
        .out_pipeline_valid_out(bb_conv3x3_weighted_B1_start_stall_region_out_pipeline_valid_out),
        .out_stall_out(bb_conv3x3_weighted_B1_start_stall_region_out_stall_out),
        .out_valid_out(bb_conv3x3_weighted_B1_start_stall_region_out_valid_out),
        .clock(clock),
        .resetn(resetn)
    );

    // out_exiting_stall_out(GPOUT,11)
    assign out_exiting_stall_out = bb_conv3x3_weighted_B1_start_stall_region_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_stall_out;

    // out_exiting_valid_out(GPOUT,12)
    assign out_exiting_valid_out = bb_conv3x3_weighted_B1_start_stall_region_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_valid_out;

    // out_iord_bl_call_conv3x3_weighted_o_fifoalmost_full(GPOUT,13)
    assign out_iord_bl_call_conv3x3_weighted_o_fifoalmost_full = bb_conv3x3_weighted_B1_start_stall_region_out_iord_bl_call_conv3x3_weighted_o_fifoalmost_full;

    // out_iord_bl_call_conv3x3_weighted_o_fifoready(GPOUT,14)
    assign out_iord_bl_call_conv3x3_weighted_o_fifoready = bb_conv3x3_weighted_B1_start_stall_region_out_iord_bl_call_conv3x3_weighted_o_fifoready;

    // out_iowr_bl_return_conv3x3_weighted_o_fifodata(GPOUT,15)
    assign out_iowr_bl_return_conv3x3_weighted_o_fifodata = bb_conv3x3_weighted_B1_start_stall_region_out_iowr_bl_return_conv3x3_weighted_o_fifodata;

    // out_iowr_bl_return_conv3x3_weighted_o_fifovalid(GPOUT,16)
    assign out_iowr_bl_return_conv3x3_weighted_o_fifovalid = bb_conv3x3_weighted_B1_start_stall_region_out_iowr_bl_return_conv3x3_weighted_o_fifovalid;

    // out_stall_in_0(GPOUT,17)
    assign out_stall_in_0 = in_stall_in_0;

    // out_stall_out_0(GPOUT,18)
    assign out_stall_out_0 = conv3x3_weighted_B1_start_merge_out_stall_out_0;

    // out_stall_out_1(GPOUT,19)
    assign out_stall_out_1 = conv3x3_weighted_B1_start_merge_out_stall_out_1;

    // out_valid_in_0(GPOUT,20)
    assign out_valid_in_0 = in_valid_in_0;

    // out_valid_in_1(GPOUT,21)
    assign out_valid_in_1 = in_valid_in_1;

    // out_valid_out_0(GPOUT,22)
    assign out_valid_out_0 = conv3x3_weighted_B1_start_branch_out_valid_out_0;

    // pipeline_valid_out_sync(GPOUT,24)
    assign out_pipeline_valid_out = bb_conv3x3_weighted_B1_start_stall_region_out_pipeline_valid_out;

endmodule
