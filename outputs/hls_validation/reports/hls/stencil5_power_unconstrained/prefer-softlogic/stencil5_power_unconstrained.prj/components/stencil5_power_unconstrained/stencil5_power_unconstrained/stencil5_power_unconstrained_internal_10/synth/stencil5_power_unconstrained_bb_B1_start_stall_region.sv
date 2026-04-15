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

// SystemVerilog created from stencil5_power_unconstrained_bb_B1_start_stall_region
// SystemVerilog created on Wed Apr 15 12:46:34 2026


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module stencil5_power_unconstrained_bb_B1_start_stall_region (
    input wire [159:0] in_iord_bl_call_stencil5_power_unconstrained_i_fifodata,
    input wire [0:0] in_iord_bl_call_stencil5_power_unconstrained_i_fifovalid,
    output wire [0:0] out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_stencil5_power_unconstrained1_exiting_valid_out,
    output wire [0:0] out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_stencil5_power_unconstrained1_exiting_stall_out,
    input wire [0:0] in_pipeline_stall_in,
    output wire [0:0] out_pipeline_valid_out,
    input wire [0:0] in_stall_in,
    output wire [0:0] out_stall_out,
    input wire [0:0] in_valid_in,
    input wire [0:0] in_iowr_bl_return_stencil5_power_unconstrained_i_fifoready,
    output wire [0:0] out_iord_bl_call_stencil5_power_unconstrained_o_fifoready,
    output wire [0:0] out_iord_bl_call_stencil5_power_unconstrained_o_fifoalmost_full,
    output wire [0:0] out_valid_out,
    output wire [31:0] out_iowr_bl_return_stencil5_power_unconstrained_o_fifodata,
    output wire [0:0] out_iowr_bl_return_stencil5_power_unconstrained_o_fifovalid,
    input wire clock,
    input wire resetn
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [32:0] i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4_a;
    wire [32:0] i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4_b;
    logic [32:0] i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4_o;
    wire [32:0] i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4_q;
    wire [32:0] i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6_a;
    wire [32:0] i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6_b;
    logic [32:0] i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6_o;
    wire [32:0] i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6_q;
    wire [32:0] i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_a;
    wire [32:0] i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_b;
    logic [32:0] i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_o;
    wire [32:0] i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_q;
    wire [32:0] i_add_i_i_i_i_i_i_stencil5_power_unconstrained7_a;
    wire [32:0] i_add_i_i_i_i_i_i_stencil5_power_unconstrained7_b;
    logic [32:0] i_add_i_i_i_i_i_i_stencil5_power_unconstrained7_o;
    wire [32:0] i_add_i_i_i_i_i_i_stencil5_power_unconstrained7_q;
    wire [31:0] i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_out_iowr_bl_return_stencil5_power_unconstrained_o_fifodata;
    wire [0:0] i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_out_iowr_bl_return_stencil5_power_unconstrained_o_fifovalid;
    wire [0:0] i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_out_o_stall;
    wire [0:0] i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_out_o_valid;
    wire [1:0] i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained3_vt_const_1_q;
    wire [31:0] i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained3_vt_join_q;
    wire [29:0] i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained3_vt_select_31_b;
    wire [0:0] stencil5_power_unconstrained_B1_start_merge_reg_out_stall_out;
    wire [0:0] stencil5_power_unconstrained_B1_start_merge_reg_out_valid_out;
    wire [31:0] bgTrunc_i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4_sel_x_b;
    wire [31:0] bgTrunc_i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6_sel_x_b;
    wire [31:0] bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b;
    wire [31:0] bgTrunc_i_add_i_i_i_i_i_i_stencil5_power_unconstrained7_sel_x_b;
    wire [0:0] i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_iord_bl_call_stencil5_power_unconstrained_o_fifoalmost_full;
    wire [0:0] i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_iord_bl_call_stencil5_power_unconstrained_o_fifoready;
    wire [0:0] i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_stall;
    wire [0:0] i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_valid;
    wire [31:0] i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_data_0_tpl;
    wire [31:0] i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_data_1_tpl;
    wire [31:0] i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_data_2_tpl;
    wire [31:0] i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_data_3_tpl;
    wire [31:0] i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_data_4_tpl;
    wire [0:0] i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_stencil5_power_unconstrained1_exiting_stall_out;
    wire [0:0] i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_stencil5_power_unconstrained1_exiting_valid_out;
    wire [0:0] i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_out_o_stall;
    wire [0:0] i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_out_o_valid;
    wire [0:0] i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_out_pipeline_valid_out;
    wire [29:0] leftShiftStage0Idx1Rng2_uid60_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_in;
    wire [29:0] leftShiftStage0Idx1Rng2_uid60_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_b;
    wire [31:0] leftShiftStage0Idx1_uid61_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_q;
    wire [0:0] leftShiftStage0_uid63_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_s;
    reg [31:0] leftShiftStage0_uid63_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_q;
    wire [63:0] join_for_coalesced_delay_0_q;
    wire [31:0] sel_for_coalesced_delay_0_b;
    wire [31:0] sel_for_coalesced_delay_0_c;
    reg [31:0] redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_q;
    reg [63:0] coalesced_delay_0_0_q;
    wire [159:0] bubble_join_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_q;
    wire [31:0] bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_b;
    wire [31:0] bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_c;
    wire [31:0] bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_d;
    wire [31:0] bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_e;
    wire [31:0] bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_f;
    wire [0:0] SE_out_i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_wireValid;
    wire [0:0] SE_out_i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_backStall;
    wire [0:0] SE_stall_entry_wireValid;
    wire [0:0] SE_stall_entry_backStall;
    wire [0:0] SE_stall_entry_V0;
    wire [0:0] SE_out_stencil5_power_unconstrained_B1_start_merge_reg_wireValid;
    wire [0:0] SE_out_stencil5_power_unconstrained_B1_start_merge_reg_backStall;
    wire [0:0] SE_out_stencil5_power_unconstrained_B1_start_merge_reg_V0;
    wire [0:0] SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_wireValid;
    wire [0:0] SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_wireStall;
    wire [0:0] SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_StallValid;
    wire [0:0] SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_toReg0;
    reg [0:0] SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_fromReg0;
    wire [0:0] SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_consumed0;
    wire [0:0] SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_toReg1;
    reg [0:0] SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_fromReg1;
    wire [0:0] SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_consumed1;
    wire [0:0] SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_or0;
    wire [0:0] SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_backStall;
    wire [0:0] SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_V0;
    wire [0:0] SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_V1;
    wire [0:0] SE_out_i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_wireValid;
    wire [0:0] SE_out_i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_backStall;
    wire [0:0] SE_out_i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_V0;
    reg [0:0] SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_R_v_0;
    wire [0:0] SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_v_s_0;
    wire [0:0] SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_s_tv_0;
    wire [0:0] SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_backEN;
    wire [0:0] SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_backStall;
    wire [0:0] SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_V0;


    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // SE_stall_entry(STALLENABLE,87)
    // Valid signal propagation
    assign SE_stall_entry_V0 = SE_stall_entry_wireValid;
    // Backward Stall generation
    assign SE_stall_entry_backStall = stencil5_power_unconstrained_B1_start_merge_reg_out_stall_out | ~ (SE_stall_entry_wireValid);
    // Computing multiple Valid(s)
    assign SE_stall_entry_wireValid = in_valid_in;

    // stencil5_power_unconstrained_B1_start_merge_reg(BLACKBOX,34)@0
    // in in_stall_in@20000000
    // out out_data_out@1
    // out out_stall_out@20000000
    // out out_valid_out@1
    stencil5_power_unconstrained_B1_start_merge_reg thestencil5_power_unconstrained_B1_start_merge_reg (
        .in_data_in(GND_q),
        .in_stall_in(SE_out_stencil5_power_unconstrained_B1_start_merge_reg_backStall),
        .in_valid_in(SE_stall_entry_V0),
        .out_data_out(),
        .out_stall_out(stencil5_power_unconstrained_B1_start_merge_reg_out_stall_out),
        .out_valid_out(stencil5_power_unconstrained_B1_start_merge_reg_out_valid_out),
        .clock(clock),
        .resetn(resetn)
    );

    // SE_out_stencil5_power_unconstrained_B1_start_merge_reg(STALLENABLE,90)
    // Valid signal propagation
    assign SE_out_stencil5_power_unconstrained_B1_start_merge_reg_V0 = SE_out_stencil5_power_unconstrained_B1_start_merge_reg_wireValid;
    // Backward Stall generation
    assign SE_out_stencil5_power_unconstrained_B1_start_merge_reg_backStall = i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_out_o_stall | ~ (SE_out_stencil5_power_unconstrained_B1_start_merge_reg_wireValid);
    // Computing multiple Valid(s)
    assign SE_out_stencil5_power_unconstrained_B1_start_merge_reg_wireValid = stencil5_power_unconstrained_B1_start_merge_reg_out_valid_out;

    // SE_out_i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8(STALLENABLE,84)
    // Backward Stall generation
    assign SE_out_i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_backStall = $unsigned(1'b0);
    // Computing multiple Valid(s)
    assign SE_out_i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_wireValid = i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_out_o_valid;

    // bubble_join_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x(BITJOIN,75)
    assign bubble_join_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_q = {i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_data_4_tpl, i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_data_3_tpl, i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_data_2_tpl, i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_data_1_tpl, i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_data_0_tpl};

    // bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x(BITSELECT,76)
    assign bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_b = $unsigned(bubble_join_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_q[31:0]);
    assign bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_c = $unsigned(bubble_join_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_q[63:32]);
    assign bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_d = $unsigned(bubble_join_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_q[95:64]);
    assign bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_e = $unsigned(bubble_join_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_q[127:96]);
    assign bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_f = $unsigned(bubble_join_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_q[159:128]);

    // join_for_coalesced_delay_0(BITJOIN,68)
    assign join_for_coalesced_delay_0_q = {bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_f, bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_e};

    // coalesced_delay_0_0(REG,71)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            coalesced_delay_0_0_q <= $unsigned(64'b0000000000000000000000000000000000000000000000000000000000000000);
        end
        else if (SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_backEN == 1'b1)
        begin
            coalesced_delay_0_0_q <= $unsigned(join_for_coalesced_delay_0_q);
        end
    end

    // sel_for_coalesced_delay_0(BITSELECT,69)
    assign sel_for_coalesced_delay_0_b = $unsigned(coalesced_delay_0_0_q[31:0]);
    assign sel_for_coalesced_delay_0_c = $unsigned(coalesced_delay_0_0_q[63:32]);

    // leftShiftStage0Idx1Rng2_uid60_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x(BITSELECT,59)@1
    assign leftShiftStage0Idx1Rng2_uid60_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_in = bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_b[29:0];
    assign leftShiftStage0Idx1Rng2_uid60_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_b = leftShiftStage0Idx1Rng2_uid60_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_in[29:0];

    // leftShiftStage0Idx1_uid61_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x(BITJOIN,60)@1
    assign leftShiftStage0Idx1_uid61_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_q = {leftShiftStage0Idx1Rng2_uid60_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_b, i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained3_vt_const_1_q};

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // leftShiftStage0_uid63_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x(MUX,62)@1
    assign leftShiftStage0_uid63_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_s = VCC_q;
    always @(leftShiftStage0_uid63_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_s or bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_b or leftShiftStage0Idx1_uid61_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_q)
    begin
        unique case (leftShiftStage0_uid63_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_s)
            1'b0 : leftShiftStage0_uid63_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_q = bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_b;
            1'b1 : leftShiftStage0_uid63_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_q = leftShiftStage0Idx1_uid61_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_q;
            default : leftShiftStage0_uid63_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_q = 32'b0;
        endcase
    end

    // i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained3_vt_select_31(BITSELECT,20)@1
    assign i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained3_vt_select_31_b = leftShiftStage0_uid63_i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained0_shift_x_q[31:2];

    // i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained3_vt_const_1(CONSTANT,18)
    assign i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained3_vt_const_1_q = $unsigned(2'b00);

    // i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained3_vt_join(BITJOIN,19)@1
    assign i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained3_vt_join_q = {i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained3_vt_select_31_b, i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained3_vt_const_1_q};

    // i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4(SUB,13)@1
    assign i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4_a = {1'b0, i_mul_i_i_i_i_i_i114_stencil5_power_unconstrained3_vt_join_q};
    assign i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4_b = {1'b0, bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_c};
    assign i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4_o = $unsigned(i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4_a) - $unsigned(i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4_b);
    assign i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4_q = i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4_o[32:0];

    // bgTrunc_i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4_sel_x(BITSELECT,37)@1
    assign bgTrunc_i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4_sel_x_b = $unsigned(i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4_q[31:0]);

    // i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5(SUB,15)@1
    assign i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_a = {1'b0, bgTrunc_i_add_i_i_i_i_i_i100_stencil5_power_unconstrained4_sel_x_b};
    assign i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_b = {1'b0, bubble_select_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_d};
    assign i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_o = $unsigned(i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_a) - $unsigned(i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_b);
    assign i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_q = i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_o[32:0];

    // bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x(BITSELECT,39)@1
    assign bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b = $unsigned(i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_q[31:0]);

    // redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0(REG,70)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_q <= $unsigned(32'b00000000000000000000000000000000);
        end
        else if (SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_backEN == 1'b1)
        begin
            redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_q <= $unsigned(bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b);
        end
    end

    // i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6(SUB,14)@2
    assign i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6_a = {1'b0, redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_q};
    assign i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6_b = {1'b0, sel_for_coalesced_delay_0_b};
    assign i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6_o = $unsigned(i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6_a) - $unsigned(i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6_b);
    assign i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6_q = i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6_o[32:0];

    // bgTrunc_i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6_sel_x(BITSELECT,38)@2
    assign bgTrunc_i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6_sel_x_b = $unsigned(i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6_q[31:0]);

    // i_add_i_i_i_i_i_i_stencil5_power_unconstrained7(SUB,16)@2
    assign i_add_i_i_i_i_i_i_stencil5_power_unconstrained7_a = {1'b0, bgTrunc_i_add_i_i_i_i_i_i72_stencil5_power_unconstrained6_sel_x_b};
    assign i_add_i_i_i_i_i_i_stencil5_power_unconstrained7_b = {1'b0, sel_for_coalesced_delay_0_c};
    assign i_add_i_i_i_i_i_i_stencil5_power_unconstrained7_o = $unsigned(i_add_i_i_i_i_i_i_stencil5_power_unconstrained7_a) - $unsigned(i_add_i_i_i_i_i_i_stencil5_power_unconstrained7_b);
    assign i_add_i_i_i_i_i_i_stencil5_power_unconstrained7_q = i_add_i_i_i_i_i_i_stencil5_power_unconstrained7_o[32:0];

    // bgTrunc_i_add_i_i_i_i_i_i_stencil5_power_unconstrained7_sel_x(BITSELECT,40)@2
    assign bgTrunc_i_add_i_i_i_i_i_i_stencil5_power_unconstrained7_sel_x_b = $unsigned(i_add_i_i_i_i_i_i_stencil5_power_unconstrained7_q[31:0]);

    // i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8(BLACKBOX,17)@2
    // in in_i_stall@20000000
    // out out_iowr_bl_return_stencil5_power_unconstrained_o_fifodata@20000000
    // out out_iowr_bl_return_stencil5_power_unconstrained_o_fifovalid@20000000
    // out out_o_stall@20000000
    stencil5_power_unconstrained_i_iowr_bl_r0000power_unconstrained0 thei_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8 (
        .in_i_data(bgTrunc_i_add_i_i_i_i_i_i_stencil5_power_unconstrained7_sel_x_b),
        .in_i_stall(SE_out_i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_backStall),
        .in_i_valid(SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_V0),
        .in_iowr_bl_return_stencil5_power_unconstrained_i_fifoready(in_iowr_bl_return_stencil5_power_unconstrained_i_fifoready),
        .out_iowr_bl_return_stencil5_power_unconstrained_o_fifodata(i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_out_iowr_bl_return_stencil5_power_unconstrained_o_fifodata),
        .out_iowr_bl_return_stencil5_power_unconstrained_o_fifovalid(i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_out_iowr_bl_return_stencil5_power_unconstrained_o_fifovalid),
        .out_o_ack(),
        .out_o_stall(i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_out_o_stall),
        .out_o_valid(i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_out_o_valid),
        .clock(clock),
        .resetn(resetn)
    );

    // SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0(STALLENABLE,104)
    // Valid signal propagation
    assign SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_V0 = SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_R_v_0;
    // Stall signal propagation
    assign SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_s_tv_0 = i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_out_o_stall & SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_R_v_0;
    // Backward Enable generation
    assign SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_backEN = ~ (SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_s_tv_0);
    // Determine whether to write valid data into the first register stage
    assign SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_v_s_0 = SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_backEN & SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_V1;
    // Backward Stall generation
    assign SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_backStall = ~ (SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_v_s_0);
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_R_v_0 <= 1'b0;
        end
        else
        begin
            if (SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_backEN == 1'b0)
            begin
                SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_R_v_0 <= SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_R_v_0 & SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_s_tv_0;
            end
            else
            begin
                SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_R_v_0 <= SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_v_s_0;
            end

        end
    end

    // SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x(STALLENABLE,96)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_fromReg0 <= '0;
            SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_fromReg1 <= '0;
        end
        else
        begin
            // Successor 0
            SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_fromReg0 <= SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_toReg0;
            // Successor 1
            SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_fromReg1 <= SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_toReg1;
        end
    end
    // Input Stall processing
    assign SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_consumed0 = (~ (in_stall_in) & SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_wireValid) | SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_fromReg0;
    assign SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_consumed1 = (~ (SE_redist2_bgTrunc_i_add_i_i_i_i_i_i86_stencil5_power_unconstrained5_sel_x_b_1_0_backStall) & SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_wireValid) | SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_fromReg1;
    // Consuming
    assign SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_StallValid = SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_backStall & SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_wireValid;
    assign SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_toReg0 = SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_StallValid & SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_consumed0;
    assign SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_toReg1 = SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_StallValid & SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_consumed1;
    // Backward Stall generation
    assign SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_or0 = SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_consumed0;
    assign SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_wireStall = ~ (SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_consumed1 & SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_or0);
    assign SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_backStall = SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_wireStall;
    // Valid signal propagation
    assign SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_V0 = SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_wireValid & ~ (SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_fromReg0);
    assign SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_V1 = SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_wireValid & ~ (SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_fromReg1);
    // Computing multiple Valid(s)
    assign SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_wireValid = i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_valid;

    // i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x(BLACKBOX,45)@1
    // in in_i_stall@20000000
    // out out_iord_bl_call_stencil5_power_unconstrained_o_fifoalmost_full@20000000
    // out out_iord_bl_call_stencil5_power_unconstrained_o_fifoready@20000000
    // out out_o_stall@20000000
    stencil5_power_unconstrained_i_iord_bl_c0000power_unconstrained0 thei_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x (
        .in_i_stall(SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_backStall),
        .in_i_valid(SE_out_i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_V0),
        .in_iord_bl_call_stencil5_power_unconstrained_i_fifodata(in_iord_bl_call_stencil5_power_unconstrained_i_fifodata),
        .in_iord_bl_call_stencil5_power_unconstrained_i_fifovalid(in_iord_bl_call_stencil5_power_unconstrained_i_fifovalid),
        .out_iord_bl_call_stencil5_power_unconstrained_o_fifoalmost_full(i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_iord_bl_call_stencil5_power_unconstrained_o_fifoalmost_full),
        .out_iord_bl_call_stencil5_power_unconstrained_o_fifoready(i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_iord_bl_call_stencil5_power_unconstrained_o_fifoready),
        .out_o_stall(i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_stall),
        .out_o_valid(i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_valid),
        .out_o_data_0_tpl(i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_data_0_tpl),
        .out_o_data_1_tpl(i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_data_1_tpl),
        .out_o_data_2_tpl(i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_data_2_tpl),
        .out_o_data_3_tpl(i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_data_3_tpl),
        .out_o_data_4_tpl(i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_data_4_tpl),
        .clock(clock),
        .resetn(resetn)
    );

    // SE_out_i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x(STALLENABLE,98)
    // Valid signal propagation
    assign SE_out_i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_V0 = SE_out_i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_wireValid;
    // Backward Stall generation
    assign SE_out_i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_backStall = i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_o_stall | ~ (SE_out_i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_wireValid);
    // Computing multiple Valid(s)
    assign SE_out_i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_wireValid = i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_out_o_valid;

    // i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x(BLACKBOX,50)@1
    // in in_i_stall@20000000
    // out out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_stencil5_power_unconstrained1_exiting_stall_out@20000000
    // out out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_stencil5_power_unconstrained1_exiting_valid_out@20000000
    // out out_o_stall@20000000
    // out out_pipeline_valid_out@20000000
    stencil5_power_unconstrained_i_sfc_s_c0_0000power_unconstrained0 thei_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x (
        .in_i_stall(SE_out_i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_backStall),
        .in_i_valid(SE_out_stencil5_power_unconstrained_B1_start_merge_reg_V0),
        .in_pipeline_stall_in(in_pipeline_stall_in),
        .in_unnamed_stencil5_power_unconstrained0_0_tpl(GND_q),
        .out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_stencil5_power_unconstrained1_exiting_stall_out(i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_stencil5_power_unconstrained1_exiting_stall_out),
        .out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_stencil5_power_unconstrained1_exiting_valid_out(i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_stencil5_power_unconstrained1_exiting_valid_out),
        .out_o_stall(i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_out_o_stall),
        .out_o_valid(i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_out_o_valid),
        .out_pipeline_valid_out(i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_out_pipeline_valid_out),
        .out_c0_exit_0_tpl(),
        .out_c0_exit_1_tpl(),
        .clock(clock),
        .resetn(resetn)
    );

    // ext_sig_sync_out(GPOUT,12)
    assign out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_stencil5_power_unconstrained1_exiting_valid_out = i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_stencil5_power_unconstrained1_exiting_valid_out;
    assign out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_stencil5_power_unconstrained1_exiting_stall_out = i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_stencil5_power_unconstrained1_exiting_stall_out;

    // pipeline_valid_out_sync(GPOUT,30)
    assign out_pipeline_valid_out = i_sfc_s_c0_in_wt_entry_stencil5_power_unconstraineds_c0_enter1_stencil5_power_unconstrained0_aunroll_x_out_pipeline_valid_out;

    // sync_out(GPOUT,35)@0
    assign out_stall_out = SE_stall_entry_backStall;

    // dupName_0_ext_sig_sync_out_x(GPOUT,42)
    assign out_iord_bl_call_stencil5_power_unconstrained_o_fifoready = i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_iord_bl_call_stencil5_power_unconstrained_o_fifoready;
    assign out_iord_bl_call_stencil5_power_unconstrained_o_fifoalmost_full = i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_out_iord_bl_call_stencil5_power_unconstrained_o_fifoalmost_full;

    // dupName_0_sync_out_x(GPOUT,43)@1
    assign out_valid_out = SE_out_i_iord_bl_call_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained2_stencil5_power_unconstrained1_aunroll_x_V0;

    // dupName_1_ext_sig_sync_out_x(GPOUT,44)
    assign out_iowr_bl_return_stencil5_power_unconstrained_o_fifodata = i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_out_iowr_bl_return_stencil5_power_unconstrained_o_fifodata;
    assign out_iowr_bl_return_stencil5_power_unconstrained_o_fifovalid = i_iowr_bl_return_stencil5_power_unconstrained_unnamed_stencil5_power_unconstrained3_stencil5_power_unconstrained8_out_iowr_bl_return_stencil5_power_unconstrained_o_fifovalid;

endmodule
