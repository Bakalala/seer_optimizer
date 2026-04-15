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

// SystemVerilog created from conv3x3_weighted_bb_B1_start_stall_region
// SystemVerilog created on Wed Apr 15 12:29:24 2026


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module conv3x3_weighted_bb_B1_start_stall_region (
    input wire [287:0] in_iord_bl_call_conv3x3_weighted_i_fifodata,
    input wire [0:0] in_iord_bl_call_conv3x3_weighted_i_fifovalid,
    output wire [0:0] out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_valid_out,
    output wire [0:0] out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_stall_out,
    input wire [0:0] in_pipeline_stall_in,
    output wire [0:0] out_pipeline_valid_out,
    input wire [0:0] in_stall_in,
    output wire [0:0] out_stall_out,
    input wire [0:0] in_valid_in,
    input wire [0:0] in_iowr_bl_return_conv3x3_weighted_i_fifoready,
    output wire [0:0] out_iord_bl_call_conv3x3_weighted_o_fifoready,
    output wire [0:0] out_iord_bl_call_conv3x3_weighted_o_fifoalmost_full,
    output wire [0:0] out_valid_out,
    output wire [31:0] out_iowr_bl_return_conv3x3_weighted_o_fifodata,
    output wire [0:0] out_iowr_bl_return_conv3x3_weighted_o_fifovalid,
    input wire clock,
    input wire resetn
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [0:0] conv3x3_weighted_B1_start_merge_reg_out_stall_out;
    wire [0:0] conv3x3_weighted_B1_start_merge_reg_out_valid_out;
    wire [31:0] i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_out_iowr_bl_return_conv3x3_weighted_o_fifodata;
    wire [0:0] i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_out_iowr_bl_return_conv3x3_weighted_o_fifovalid;
    wire [0:0] i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_out_o_stall;
    wire [0:0] i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_out_o_valid;
    wire [1:0] i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_const_1_q;
    wire [31:0] i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_join_q;
    wire [29:0] i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_select_31_b;
    wire [31:0] i_reass_mul_conv3x3_weighted10_vt_join_q;
    wire [30:0] i_reass_mul_conv3x3_weighted10_vt_select_31_b;
    wire [32:0] i_reduction_conv3x3_weighted_0_conv3x3_weighted4_a;
    wire [32:0] i_reduction_conv3x3_weighted_0_conv3x3_weighted4_b;
    logic [32:0] i_reduction_conv3x3_weighted_0_conv3x3_weighted4_o;
    wire [32:0] i_reduction_conv3x3_weighted_0_conv3x3_weighted4_q;
    wire [32:0] i_reduction_conv3x3_weighted_1_conv3x3_weighted6_a;
    wire [32:0] i_reduction_conv3x3_weighted_1_conv3x3_weighted6_b;
    logic [32:0] i_reduction_conv3x3_weighted_1_conv3x3_weighted6_o;
    wire [32:0] i_reduction_conv3x3_weighted_1_conv3x3_weighted6_q;
    wire [32:0] i_reduction_conv3x3_weighted_2_conv3x3_weighted8_a;
    wire [32:0] i_reduction_conv3x3_weighted_2_conv3x3_weighted8_b;
    logic [32:0] i_reduction_conv3x3_weighted_2_conv3x3_weighted8_o;
    wire [32:0] i_reduction_conv3x3_weighted_2_conv3x3_weighted8_q;
    wire [32:0] i_reduction_conv3x3_weighted_3_conv3x3_weighted3_a;
    wire [32:0] i_reduction_conv3x3_weighted_3_conv3x3_weighted3_b;
    logic [32:0] i_reduction_conv3x3_weighted_3_conv3x3_weighted3_o;
    wire [32:0] i_reduction_conv3x3_weighted_3_conv3x3_weighted3_q;
    wire [32:0] i_reduction_conv3x3_weighted_4_conv3x3_weighted7_a;
    wire [32:0] i_reduction_conv3x3_weighted_4_conv3x3_weighted7_b;
    logic [32:0] i_reduction_conv3x3_weighted_4_conv3x3_weighted7_o;
    wire [32:0] i_reduction_conv3x3_weighted_4_conv3x3_weighted7_q;
    wire [32:0] i_reduction_conv3x3_weighted_5_conv3x3_weighted9_a;
    wire [32:0] i_reduction_conv3x3_weighted_5_conv3x3_weighted9_b;
    logic [32:0] i_reduction_conv3x3_weighted_5_conv3x3_weighted9_o;
    wire [32:0] i_reduction_conv3x3_weighted_5_conv3x3_weighted9_q;
    wire [32:0] i_reduction_conv3x3_weighted_6_conv3x3_weighted11_a;
    wire [32:0] i_reduction_conv3x3_weighted_6_conv3x3_weighted11_b;
    logic [32:0] i_reduction_conv3x3_weighted_6_conv3x3_weighted11_o;
    wire [32:0] i_reduction_conv3x3_weighted_6_conv3x3_weighted11_q;
    wire [31:0] i_reduction_conv3x3_weighted_6_conv3x3_weighted11_vt_join_q;
    wire [30:0] i_reduction_conv3x3_weighted_6_conv3x3_weighted11_vt_select_31_b;
    wire [32:0] i_reduction_conv3x3_weighted_7_conv3x3_weighted12_a;
    wire [32:0] i_reduction_conv3x3_weighted_7_conv3x3_weighted12_b;
    logic [32:0] i_reduction_conv3x3_weighted_7_conv3x3_weighted12_o;
    wire [32:0] i_reduction_conv3x3_weighted_7_conv3x3_weighted12_q;
    wire [31:0] bgTrunc_i_reduction_conv3x3_weighted_0_conv3x3_weighted4_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_conv3x3_weighted_1_conv3x3_weighted6_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_conv3x3_weighted_2_conv3x3_weighted8_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_conv3x3_weighted_3_conv3x3_weighted3_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_conv3x3_weighted_4_conv3x3_weighted7_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_conv3x3_weighted_6_conv3x3_weighted11_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_conv3x3_weighted_7_conv3x3_weighted12_sel_x_b;
    wire [0:0] i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_iord_bl_call_conv3x3_weighted_o_fifoalmost_full;
    wire [0:0] i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_iord_bl_call_conv3x3_weighted_o_fifoready;
    wire [0:0] i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_stall;
    wire [0:0] i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_valid;
    wire [31:0] i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_0_tpl;
    wire [31:0] i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_1_tpl;
    wire [31:0] i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_2_tpl;
    wire [31:0] i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_3_tpl;
    wire [31:0] i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_4_tpl;
    wire [31:0] i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_5_tpl;
    wire [31:0] i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_6_tpl;
    wire [31:0] i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_7_tpl;
    wire [31:0] i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_8_tpl;
    wire [0:0] i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_stall_out;
    wire [0:0] i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_valid_out;
    wire [0:0] i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_out_o_stall;
    wire [0:0] i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_out_o_valid;
    wire [0:0] i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_out_pipeline_valid_out;
    wire [29:0] leftShiftStage0Idx1Rng2_uid88_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_in;
    wire [29:0] leftShiftStage0Idx1Rng2_uid88_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_b;
    wire [31:0] leftShiftStage0Idx1_uid89_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_q;
    wire [0:0] leftShiftStage0_uid91_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_s;
    reg [31:0] leftShiftStage0_uid91_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_q;
    wire [30:0] leftShiftStage0Idx1Rng1_uid96_i_reass_mul_conv3x3_weighted0_shift_x_in;
    wire [30:0] leftShiftStage0Idx1Rng1_uid96_i_reass_mul_conv3x3_weighted0_shift_x_b;
    wire [31:0] leftShiftStage0Idx1_uid97_i_reass_mul_conv3x3_weighted0_shift_x_q;
    wire [0:0] leftShiftStage0_uid99_i_reass_mul_conv3x3_weighted0_shift_x_s;
    reg [31:0] leftShiftStage0_uid99_i_reass_mul_conv3x3_weighted0_shift_x_q;
    reg [31:0] redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_q;
    reg [30:0] redist1_i_reass_mul_conv3x3_weighted10_vt_select_31_b_1_0_q;
    reg [29:0] redist2_i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_select_31_b_1_0_q;
    wire [287:0] bubble_join_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_q;
    wire [31:0] bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_b;
    wire [31:0] bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_c;
    wire [31:0] bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_d;
    wire [31:0] bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_e;
    wire [31:0] bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_f;
    wire [31:0] bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_g;
    wire [31:0] bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_h;
    wire [31:0] bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_i;
    wire [31:0] bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_j;
    wire [0:0] SE_out_conv3x3_weighted_B1_start_merge_reg_wireValid;
    wire [0:0] SE_out_conv3x3_weighted_B1_start_merge_reg_backStall;
    wire [0:0] SE_out_conv3x3_weighted_B1_start_merge_reg_V0;
    wire [0:0] SE_out_i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_wireValid;
    wire [0:0] SE_out_i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_backStall;
    wire [0:0] SE_stall_entry_wireValid;
    wire [0:0] SE_stall_entry_backStall;
    wire [0:0] SE_stall_entry_V0;
    wire [0:0] SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_wireValid;
    wire [0:0] SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_wireStall;
    wire [0:0] SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_StallValid;
    wire [0:0] SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_toReg0;
    reg [0:0] SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_fromReg0;
    wire [0:0] SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_consumed0;
    wire [0:0] SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_toReg1;
    reg [0:0] SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_fromReg1;
    wire [0:0] SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_consumed1;
    wire [0:0] SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_or0;
    wire [0:0] SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_backStall;
    wire [0:0] SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_V0;
    wire [0:0] SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_V1;
    wire [0:0] SE_out_i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_wireValid;
    wire [0:0] SE_out_i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_backStall;
    wire [0:0] SE_out_i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_V0;
    reg [0:0] SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_R_v_0;
    wire [0:0] SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_v_s_0;
    wire [0:0] SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_s_tv_0;
    wire [0:0] SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_backEN;
    wire [0:0] SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_backStall;
    wire [0:0] SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_V0;


    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // SE_stall_entry(STALLENABLE,131)
    // Valid signal propagation
    assign SE_stall_entry_V0 = SE_stall_entry_wireValid;
    // Backward Stall generation
    assign SE_stall_entry_backStall = conv3x3_weighted_B1_start_merge_reg_out_stall_out | ~ (SE_stall_entry_wireValid);
    // Computing multiple Valid(s)
    assign SE_stall_entry_wireValid = in_valid_in;

    // conv3x3_weighted_B1_start_merge_reg(BLACKBOX,14)@0
    // in in_stall_in@20000000
    // out out_data_out@1
    // out out_stall_out@20000000
    // out out_valid_out@1
    conv3x3_weighted_B1_start_merge_reg theconv3x3_weighted_B1_start_merge_reg (
        .in_data_in(GND_q),
        .in_stall_in(SE_out_conv3x3_weighted_B1_start_merge_reg_backStall),
        .in_valid_in(SE_stall_entry_V0),
        .out_data_out(),
        .out_stall_out(conv3x3_weighted_B1_start_merge_reg_out_stall_out),
        .out_valid_out(conv3x3_weighted_B1_start_merge_reg_out_valid_out),
        .clock(clock),
        .resetn(resetn)
    );

    // SE_out_conv3x3_weighted_B1_start_merge_reg(STALLENABLE,114)
    // Valid signal propagation
    assign SE_out_conv3x3_weighted_B1_start_merge_reg_V0 = SE_out_conv3x3_weighted_B1_start_merge_reg_wireValid;
    // Backward Stall generation
    assign SE_out_conv3x3_weighted_B1_start_merge_reg_backStall = i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_out_o_stall | ~ (SE_out_conv3x3_weighted_B1_start_merge_reg_wireValid);
    // Computing multiple Valid(s)
    assign SE_out_conv3x3_weighted_B1_start_merge_reg_wireValid = conv3x3_weighted_B1_start_merge_reg_out_valid_out;

    // SE_out_i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13(STALLENABLE,116)
    // Backward Stall generation
    assign SE_out_i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_backStall = $unsigned(1'b0);
    // Computing multiple Valid(s)
    assign SE_out_i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_wireValid = i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_out_o_valid;

    // leftShiftStage0Idx1Rng1_uid96_i_reass_mul_conv3x3_weighted0_shift_x(BITSELECT,95)@1
    assign leftShiftStage0Idx1Rng1_uid96_i_reass_mul_conv3x3_weighted0_shift_x_in = bgTrunc_i_reduction_conv3x3_weighted_2_conv3x3_weighted8_sel_x_b[30:0];
    assign leftShiftStage0Idx1Rng1_uid96_i_reass_mul_conv3x3_weighted0_shift_x_b = leftShiftStage0Idx1Rng1_uid96_i_reass_mul_conv3x3_weighted0_shift_x_in[30:0];

    // leftShiftStage0Idx1_uid97_i_reass_mul_conv3x3_weighted0_shift_x(BITJOIN,96)@1
    assign leftShiftStage0Idx1_uid97_i_reass_mul_conv3x3_weighted0_shift_x_q = {leftShiftStage0Idx1Rng1_uid96_i_reass_mul_conv3x3_weighted0_shift_x_b, GND_q};

    // bubble_join_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x(BITJOIN,109)
    assign bubble_join_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_q = {i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_8_tpl, i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_7_tpl, i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_6_tpl, i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_5_tpl, i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_4_tpl, i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_3_tpl, i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_2_tpl, i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_1_tpl, i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_0_tpl};

    // bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x(BITSELECT,110)
    assign bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_b = $unsigned(bubble_join_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_q[31:0]);
    assign bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_c = $unsigned(bubble_join_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_q[63:32]);
    assign bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_d = $unsigned(bubble_join_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_q[95:64]);
    assign bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_e = $unsigned(bubble_join_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_q[127:96]);
    assign bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_f = $unsigned(bubble_join_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_q[159:128]);
    assign bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_g = $unsigned(bubble_join_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_q[191:160]);
    assign bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_h = $unsigned(bubble_join_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_q[223:192]);
    assign bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_i = $unsigned(bubble_join_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_q[255:224]);
    assign bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_j = $unsigned(bubble_join_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_q[287:256]);

    // i_reduction_conv3x3_weighted_1_conv3x3_weighted6(ADD,27)@1
    assign i_reduction_conv3x3_weighted_1_conv3x3_weighted6_a = {1'b0, bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_g};
    assign i_reduction_conv3x3_weighted_1_conv3x3_weighted6_b = {1'b0, bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_i};
    assign i_reduction_conv3x3_weighted_1_conv3x3_weighted6_o = $unsigned(i_reduction_conv3x3_weighted_1_conv3x3_weighted6_a) + $unsigned(i_reduction_conv3x3_weighted_1_conv3x3_weighted6_b);
    assign i_reduction_conv3x3_weighted_1_conv3x3_weighted6_q = i_reduction_conv3x3_weighted_1_conv3x3_weighted6_o[32:0];

    // bgTrunc_i_reduction_conv3x3_weighted_1_conv3x3_weighted6_sel_x(BITSELECT,53)@1
    assign bgTrunc_i_reduction_conv3x3_weighted_1_conv3x3_weighted6_sel_x_b = i_reduction_conv3x3_weighted_1_conv3x3_weighted6_q[31:0];

    // i_reduction_conv3x3_weighted_0_conv3x3_weighted4(ADD,26)@1
    assign i_reduction_conv3x3_weighted_0_conv3x3_weighted4_a = {1'b0, bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_e};
    assign i_reduction_conv3x3_weighted_0_conv3x3_weighted4_b = {1'b0, bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_c};
    assign i_reduction_conv3x3_weighted_0_conv3x3_weighted4_o = $unsigned(i_reduction_conv3x3_weighted_0_conv3x3_weighted4_a) + $unsigned(i_reduction_conv3x3_weighted_0_conv3x3_weighted4_b);
    assign i_reduction_conv3x3_weighted_0_conv3x3_weighted4_q = i_reduction_conv3x3_weighted_0_conv3x3_weighted4_o[32:0];

    // bgTrunc_i_reduction_conv3x3_weighted_0_conv3x3_weighted4_sel_x(BITSELECT,52)@1
    assign bgTrunc_i_reduction_conv3x3_weighted_0_conv3x3_weighted4_sel_x_b = i_reduction_conv3x3_weighted_0_conv3x3_weighted4_q[31:0];

    // i_reduction_conv3x3_weighted_2_conv3x3_weighted8(ADD,28)@1
    assign i_reduction_conv3x3_weighted_2_conv3x3_weighted8_a = {1'b0, bgTrunc_i_reduction_conv3x3_weighted_0_conv3x3_weighted4_sel_x_b};
    assign i_reduction_conv3x3_weighted_2_conv3x3_weighted8_b = {1'b0, bgTrunc_i_reduction_conv3x3_weighted_1_conv3x3_weighted6_sel_x_b};
    assign i_reduction_conv3x3_weighted_2_conv3x3_weighted8_o = $unsigned(i_reduction_conv3x3_weighted_2_conv3x3_weighted8_a) + $unsigned(i_reduction_conv3x3_weighted_2_conv3x3_weighted8_b);
    assign i_reduction_conv3x3_weighted_2_conv3x3_weighted8_q = i_reduction_conv3x3_weighted_2_conv3x3_weighted8_o[32:0];

    // bgTrunc_i_reduction_conv3x3_weighted_2_conv3x3_weighted8_sel_x(BITSELECT,54)@1
    assign bgTrunc_i_reduction_conv3x3_weighted_2_conv3x3_weighted8_sel_x_b = i_reduction_conv3x3_weighted_2_conv3x3_weighted8_q[31:0];

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // leftShiftStage0_uid99_i_reass_mul_conv3x3_weighted0_shift_x(MUX,98)@1
    assign leftShiftStage0_uid99_i_reass_mul_conv3x3_weighted0_shift_x_s = VCC_q;
    always @(leftShiftStage0_uid99_i_reass_mul_conv3x3_weighted0_shift_x_s or bgTrunc_i_reduction_conv3x3_weighted_2_conv3x3_weighted8_sel_x_b or leftShiftStage0Idx1_uid97_i_reass_mul_conv3x3_weighted0_shift_x_q)
    begin
        unique case (leftShiftStage0_uid99_i_reass_mul_conv3x3_weighted0_shift_x_s)
            1'b0 : leftShiftStage0_uid99_i_reass_mul_conv3x3_weighted0_shift_x_q = bgTrunc_i_reduction_conv3x3_weighted_2_conv3x3_weighted8_sel_x_b;
            1'b1 : leftShiftStage0_uid99_i_reass_mul_conv3x3_weighted0_shift_x_q = leftShiftStage0Idx1_uid97_i_reass_mul_conv3x3_weighted0_shift_x_q;
            default : leftShiftStage0_uid99_i_reass_mul_conv3x3_weighted0_shift_x_q = 32'b0;
        endcase
    end

    // i_reass_mul_conv3x3_weighted10_vt_select_31(BITSELECT,25)@1
    assign i_reass_mul_conv3x3_weighted10_vt_select_31_b = leftShiftStage0_uid99_i_reass_mul_conv3x3_weighted0_shift_x_q[31:1];

    // redist1_i_reass_mul_conv3x3_weighted10_vt_select_31_b_1_0(REG,104)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist1_i_reass_mul_conv3x3_weighted10_vt_select_31_b_1_0_q <= $unsigned(31'b0000000000000000000000000000000);
        end
        else if (SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_backEN == 1'b1)
        begin
            redist1_i_reass_mul_conv3x3_weighted10_vt_select_31_b_1_0_q <= $unsigned(i_reass_mul_conv3x3_weighted10_vt_select_31_b);
        end
    end

    // i_reass_mul_conv3x3_weighted10_vt_join(BITJOIN,24)@2
    assign i_reass_mul_conv3x3_weighted10_vt_join_q = {redist1_i_reass_mul_conv3x3_weighted10_vt_select_31_b_1_0_q, GND_q};

    // leftShiftStage0Idx1Rng2_uid88_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x(BITSELECT,87)@1
    assign leftShiftStage0Idx1Rng2_uid88_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_in = bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_f[29:0];
    assign leftShiftStage0Idx1Rng2_uid88_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_b = leftShiftStage0Idx1Rng2_uid88_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_in[29:0];

    // leftShiftStage0Idx1_uid89_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x(BITJOIN,88)@1
    assign leftShiftStage0Idx1_uid89_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_q = {leftShiftStage0Idx1Rng2_uid88_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_b, i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_const_1_q};

    // leftShiftStage0_uid91_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x(MUX,90)@1
    assign leftShiftStage0_uid91_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_s = VCC_q;
    always @(leftShiftStage0_uid91_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_s or bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_f or leftShiftStage0Idx1_uid89_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_q)
    begin
        unique case (leftShiftStage0_uid91_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_s)
            1'b0 : leftShiftStage0_uid91_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_q = bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_f;
            1'b1 : leftShiftStage0_uid91_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_q = leftShiftStage0Idx1_uid89_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_q;
            default : leftShiftStage0_uid91_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_q = 32'b0;
        endcase
    end

    // i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_select_31(BITSELECT,22)@1
    assign i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_select_31_b = leftShiftStage0_uid91_i_mul_i_i_i_i_i_i_conv3x3_weighted0_shift_x_q[31:2];

    // redist2_i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_select_31_b_1_0(REG,105)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist2_i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_select_31_b_1_0_q <= $unsigned(30'b000000000000000000000000000000);
        end
        else if (SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_backEN == 1'b1)
        begin
            redist2_i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_select_31_b_1_0_q <= $unsigned(i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_select_31_b);
        end
    end

    // i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_const_1(CONSTANT,20)
    assign i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_const_1_q = $unsigned(2'b00);

    // i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_join(BITJOIN,21)@2
    assign i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_join_q = {redist2_i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_select_31_b_1_0_q, i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_const_1_q};

    // i_reduction_conv3x3_weighted_6_conv3x3_weighted11(ADD,32)@2
    assign i_reduction_conv3x3_weighted_6_conv3x3_weighted11_a = {1'b0, i_mul_i_i_i_i_i_i_conv3x3_weighted5_vt_join_q};
    assign i_reduction_conv3x3_weighted_6_conv3x3_weighted11_b = {1'b0, i_reass_mul_conv3x3_weighted10_vt_join_q};
    assign i_reduction_conv3x3_weighted_6_conv3x3_weighted11_o = $unsigned(i_reduction_conv3x3_weighted_6_conv3x3_weighted11_a) + $unsigned(i_reduction_conv3x3_weighted_6_conv3x3_weighted11_b);
    assign i_reduction_conv3x3_weighted_6_conv3x3_weighted11_q = i_reduction_conv3x3_weighted_6_conv3x3_weighted11_o[32:0];

    // bgTrunc_i_reduction_conv3x3_weighted_6_conv3x3_weighted11_sel_x(BITSELECT,58)@2
    assign bgTrunc_i_reduction_conv3x3_weighted_6_conv3x3_weighted11_sel_x_b = i_reduction_conv3x3_weighted_6_conv3x3_weighted11_q[31:0];

    // i_reduction_conv3x3_weighted_6_conv3x3_weighted11_vt_select_31(BITSELECT,35)@2
    assign i_reduction_conv3x3_weighted_6_conv3x3_weighted11_vt_select_31_b = bgTrunc_i_reduction_conv3x3_weighted_6_conv3x3_weighted11_sel_x_b[31:1];

    // i_reduction_conv3x3_weighted_6_conv3x3_weighted11_vt_join(BITJOIN,34)@2
    assign i_reduction_conv3x3_weighted_6_conv3x3_weighted11_vt_join_q = {i_reduction_conv3x3_weighted_6_conv3x3_weighted11_vt_select_31_b, GND_q};

    // i_reduction_conv3x3_weighted_4_conv3x3_weighted7(ADD,30)@1
    assign i_reduction_conv3x3_weighted_4_conv3x3_weighted7_a = {1'b0, bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_h};
    assign i_reduction_conv3x3_weighted_4_conv3x3_weighted7_b = {1'b0, bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_j};
    assign i_reduction_conv3x3_weighted_4_conv3x3_weighted7_o = $unsigned(i_reduction_conv3x3_weighted_4_conv3x3_weighted7_a) + $unsigned(i_reduction_conv3x3_weighted_4_conv3x3_weighted7_b);
    assign i_reduction_conv3x3_weighted_4_conv3x3_weighted7_q = i_reduction_conv3x3_weighted_4_conv3x3_weighted7_o[32:0];

    // bgTrunc_i_reduction_conv3x3_weighted_4_conv3x3_weighted7_sel_x(BITSELECT,56)@1
    assign bgTrunc_i_reduction_conv3x3_weighted_4_conv3x3_weighted7_sel_x_b = i_reduction_conv3x3_weighted_4_conv3x3_weighted7_q[31:0];

    // i_reduction_conv3x3_weighted_3_conv3x3_weighted3(ADD,29)@1
    assign i_reduction_conv3x3_weighted_3_conv3x3_weighted3_a = {1'b0, bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_d};
    assign i_reduction_conv3x3_weighted_3_conv3x3_weighted3_b = {1'b0, bubble_select_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_b};
    assign i_reduction_conv3x3_weighted_3_conv3x3_weighted3_o = $unsigned(i_reduction_conv3x3_weighted_3_conv3x3_weighted3_a) + $unsigned(i_reduction_conv3x3_weighted_3_conv3x3_weighted3_b);
    assign i_reduction_conv3x3_weighted_3_conv3x3_weighted3_q = i_reduction_conv3x3_weighted_3_conv3x3_weighted3_o[32:0];

    // bgTrunc_i_reduction_conv3x3_weighted_3_conv3x3_weighted3_sel_x(BITSELECT,55)@1
    assign bgTrunc_i_reduction_conv3x3_weighted_3_conv3x3_weighted3_sel_x_b = i_reduction_conv3x3_weighted_3_conv3x3_weighted3_q[31:0];

    // i_reduction_conv3x3_weighted_5_conv3x3_weighted9(ADD,31)@1
    assign i_reduction_conv3x3_weighted_5_conv3x3_weighted9_a = {1'b0, bgTrunc_i_reduction_conv3x3_weighted_3_conv3x3_weighted3_sel_x_b};
    assign i_reduction_conv3x3_weighted_5_conv3x3_weighted9_b = {1'b0, bgTrunc_i_reduction_conv3x3_weighted_4_conv3x3_weighted7_sel_x_b};
    assign i_reduction_conv3x3_weighted_5_conv3x3_weighted9_o = $unsigned(i_reduction_conv3x3_weighted_5_conv3x3_weighted9_a) + $unsigned(i_reduction_conv3x3_weighted_5_conv3x3_weighted9_b);
    assign i_reduction_conv3x3_weighted_5_conv3x3_weighted9_q = i_reduction_conv3x3_weighted_5_conv3x3_weighted9_o[32:0];

    // bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x(BITSELECT,57)@1
    assign bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b = i_reduction_conv3x3_weighted_5_conv3x3_weighted9_q[31:0];

    // redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0(REG,103)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_q <= $unsigned(32'b00000000000000000000000000000000);
        end
        else if (SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_backEN == 1'b1)
        begin
            redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_q <= $unsigned(bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b);
        end
    end

    // i_reduction_conv3x3_weighted_7_conv3x3_weighted12(ADD,36)@2
    assign i_reduction_conv3x3_weighted_7_conv3x3_weighted12_a = {1'b0, redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_q};
    assign i_reduction_conv3x3_weighted_7_conv3x3_weighted12_b = {1'b0, i_reduction_conv3x3_weighted_6_conv3x3_weighted11_vt_join_q};
    assign i_reduction_conv3x3_weighted_7_conv3x3_weighted12_o = $unsigned(i_reduction_conv3x3_weighted_7_conv3x3_weighted12_a) + $unsigned(i_reduction_conv3x3_weighted_7_conv3x3_weighted12_b);
    assign i_reduction_conv3x3_weighted_7_conv3x3_weighted12_q = i_reduction_conv3x3_weighted_7_conv3x3_weighted12_o[32:0];

    // bgTrunc_i_reduction_conv3x3_weighted_7_conv3x3_weighted12_sel_x(BITSELECT,59)@2
    assign bgTrunc_i_reduction_conv3x3_weighted_7_conv3x3_weighted12_sel_x_b = i_reduction_conv3x3_weighted_7_conv3x3_weighted12_q[31:0];

    // i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13(BLACKBOX,19)@2
    // in in_i_stall@20000000
    // out out_iowr_bl_return_conv3x3_weighted_o_fifodata@20000000
    // out out_iowr_bl_return_conv3x3_weighted_o_fifovalid@20000000
    // out out_o_stall@20000000
    conv3x3_weighted_i_iowr_bl_return_unname0000d3_conv3x3_weighted0 thei_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13 (
        .in_i_data(bgTrunc_i_reduction_conv3x3_weighted_7_conv3x3_weighted12_sel_x_b),
        .in_i_stall(SE_out_i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_backStall),
        .in_i_valid(SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_V0),
        .in_iowr_bl_return_conv3x3_weighted_i_fifoready(in_iowr_bl_return_conv3x3_weighted_i_fifoready),
        .out_iowr_bl_return_conv3x3_weighted_o_fifodata(i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_out_iowr_bl_return_conv3x3_weighted_o_fifodata),
        .out_iowr_bl_return_conv3x3_weighted_o_fifovalid(i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_out_iowr_bl_return_conv3x3_weighted_o_fifovalid),
        .out_o_ack(),
        .out_o_stall(i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_out_o_stall),
        .out_o_valid(i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_out_o_valid),
        .clock(clock),
        .resetn(resetn)
    );

    // SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0(STALLENABLE,151)
    // Valid signal propagation
    assign SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_V0 = SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_R_v_0;
    // Stall signal propagation
    assign SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_s_tv_0 = i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_out_o_stall & SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_R_v_0;
    // Backward Enable generation
    assign SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_backEN = ~ (SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_s_tv_0);
    // Determine whether to write valid data into the first register stage
    assign SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_v_s_0 = SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_backEN & SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_V1;
    // Backward Stall generation
    assign SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_backStall = ~ (SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_v_s_0);
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_R_v_0 <= 1'b0;
        end
        else
        begin
            if (SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_backEN == 1'b0)
            begin
                SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_R_v_0 <= SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_R_v_0 & SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_s_tv_0;
            end
            else
            begin
                SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_R_v_0 <= SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_v_s_0;
            end

        end
    end

    // SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x(STALLENABLE,142)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_fromReg0 <= '0;
            SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_fromReg1 <= '0;
        end
        else
        begin
            // Successor 0
            SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_fromReg0 <= SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_toReg0;
            // Successor 1
            SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_fromReg1 <= SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_toReg1;
        end
    end
    // Input Stall processing
    assign SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_consumed0 = (~ (in_stall_in) & SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_wireValid) | SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_fromReg0;
    assign SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_consumed1 = (~ (SE_redist0_bgTrunc_i_reduction_conv3x3_weighted_5_conv3x3_weighted9_sel_x_b_1_0_backStall) & SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_wireValid) | SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_fromReg1;
    // Consuming
    assign SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_StallValid = SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_backStall & SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_wireValid;
    assign SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_toReg0 = SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_StallValid & SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_consumed0;
    assign SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_toReg1 = SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_StallValid & SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_consumed1;
    // Backward Stall generation
    assign SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_or0 = SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_consumed0;
    assign SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_wireStall = ~ (SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_consumed1 & SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_or0);
    assign SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_backStall = SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_wireStall;
    // Valid signal propagation
    assign SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_V0 = SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_wireValid & ~ (SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_fromReg0);
    assign SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_V1 = SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_wireValid & ~ (SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_fromReg1);
    // Computing multiple Valid(s)
    assign SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_wireValid = i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_valid;

    // i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x(BLACKBOX,64)@1
    // in in_i_stall@20000000
    // out out_iord_bl_call_conv3x3_weighted_o_fifoalmost_full@20000000
    // out out_iord_bl_call_conv3x3_weighted_o_fifoready@20000000
    // out out_o_stall@20000000
    conv3x3_weighted_i_iord_bl_call_unnamed_0000d2_conv3x3_weighted0 thei_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x (
        .in_i_stall(SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_backStall),
        .in_i_valid(SE_out_i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_V0),
        .in_iord_bl_call_conv3x3_weighted_i_fifodata(in_iord_bl_call_conv3x3_weighted_i_fifodata),
        .in_iord_bl_call_conv3x3_weighted_i_fifovalid(in_iord_bl_call_conv3x3_weighted_i_fifovalid),
        .out_iord_bl_call_conv3x3_weighted_o_fifoalmost_full(i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_iord_bl_call_conv3x3_weighted_o_fifoalmost_full),
        .out_iord_bl_call_conv3x3_weighted_o_fifoready(i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_iord_bl_call_conv3x3_weighted_o_fifoready),
        .out_o_stall(i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_stall),
        .out_o_valid(i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_valid),
        .out_o_data_0_tpl(i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_0_tpl),
        .out_o_data_1_tpl(i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_1_tpl),
        .out_o_data_2_tpl(i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_2_tpl),
        .out_o_data_3_tpl(i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_3_tpl),
        .out_o_data_4_tpl(i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_4_tpl),
        .out_o_data_5_tpl(i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_5_tpl),
        .out_o_data_6_tpl(i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_6_tpl),
        .out_o_data_7_tpl(i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_7_tpl),
        .out_o_data_8_tpl(i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_data_8_tpl),
        .clock(clock),
        .resetn(resetn)
    );

    // SE_out_i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x(STALLENABLE,144)
    // Valid signal propagation
    assign SE_out_i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_V0 = SE_out_i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_wireValid;
    // Backward Stall generation
    assign SE_out_i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_backStall = i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_o_stall | ~ (SE_out_i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_wireValid);
    // Computing multiple Valid(s)
    assign SE_out_i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_wireValid = i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_out_o_valid;

    // i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x(BLACKBOX,73)@1
    // in in_i_stall@20000000
    // out out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_stall_out@20000000
    // out out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_valid_out@20000000
    // out out_o_stall@20000000
    // out out_pipeline_valid_out@20000000
    conv3x3_weighted_i_sfc_s_c0_in_wt_entry_0000r1_conv3x3_weighted0 thei_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x (
        .in_i_stall(SE_out_i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_backStall),
        .in_i_valid(SE_out_conv3x3_weighted_B1_start_merge_reg_V0),
        .in_pipeline_stall_in(in_pipeline_stall_in),
        .in_unnamed_conv3x3_weighted0_0_tpl(GND_q),
        .out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_stall_out(i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_stall_out),
        .out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_valid_out(i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_valid_out),
        .out_o_stall(i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_out_o_stall),
        .out_o_valid(i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_out_o_valid),
        .out_pipeline_valid_out(i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_out_pipeline_valid_out),
        .out_c0_exit_0_tpl(),
        .out_c0_exit_1_tpl(),
        .clock(clock),
        .resetn(resetn)
    );

    // ext_sig_sync_out(GPOUT,18)
    assign out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_valid_out = i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_valid_out;
    assign out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_stall_out = i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_out_aclp_to_limiter_i_llvm_fpga_pipeline_keep_going_conv3x3_weighted1_exiting_stall_out;

    // pipeline_valid_out_sync(GPOUT,46)
    assign out_pipeline_valid_out = i_sfc_s_c0_in_wt_entry_conv3x3_weighteds_c0_enter1_conv3x3_weighted0_aunroll_x_out_pipeline_valid_out;

    // sync_out(GPOUT,50)@0
    assign out_stall_out = SE_stall_entry_backStall;

    // dupName_0_ext_sig_sync_out_x(GPOUT,61)
    assign out_iord_bl_call_conv3x3_weighted_o_fifoready = i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_iord_bl_call_conv3x3_weighted_o_fifoready;
    assign out_iord_bl_call_conv3x3_weighted_o_fifoalmost_full = i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_out_iord_bl_call_conv3x3_weighted_o_fifoalmost_full;

    // dupName_0_sync_out_x(GPOUT,62)@1
    assign out_valid_out = SE_out_i_iord_bl_call_conv3x3_weighted_unnamed_conv3x3_weighted2_conv3x3_weighted1_aunroll_x_V0;

    // dupName_1_ext_sig_sync_out_x(GPOUT,63)
    assign out_iowr_bl_return_conv3x3_weighted_o_fifodata = i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_out_iowr_bl_return_conv3x3_weighted_o_fifodata;
    assign out_iowr_bl_return_conv3x3_weighted_o_fifovalid = i_iowr_bl_return_conv3x3_weighted_unnamed_conv3x3_weighted3_conv3x3_weighted13_out_iowr_bl_return_conv3x3_weighted_o_fifovalid;

endmodule
