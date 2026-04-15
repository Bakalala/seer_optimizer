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

// SystemVerilog created from dot16_latency_unconstrained_i_sfc_logic_0001tency_unconstrained0
// SystemVerilog created on Wed Apr 15 12:37:09 2026


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module dot16_latency_unconstrained_i_sfc_logic_0001tency_unconstrained0 (
    output wire [0:0] out_c1_exi1_0_tpl,
    output wire [31:0] out_c1_exi1_1_tpl,
    output wire [0:0] out_o_valid,
    output wire [0:0] out_unnamed_dot16_latency_unconstrained1,
    input wire [0:0] in_c1_eni1_0_tpl,
    input wire [31:0] in_c1_eni1_1_tpl,
    input wire [31:0] in_c1_eni1_2_tpl,
    input wire [31:0] in_c1_eni1_3_tpl,
    input wire [31:0] in_c1_eni1_4_tpl,
    input wire [31:0] in_c1_eni1_5_tpl,
    input wire [31:0] in_c1_eni1_6_tpl,
    input wire [31:0] in_c1_eni1_7_tpl,
    input wire [31:0] in_c1_eni1_8_tpl,
    input wire [31:0] in_c1_eni1_9_tpl,
    input wire [31:0] in_c1_eni1_10_tpl,
    input wire [31:0] in_c1_eni1_11_tpl,
    input wire [31:0] in_c1_eni1_12_tpl,
    input wire [31:0] in_c1_eni1_13_tpl,
    input wire [31:0] in_c1_eni1_14_tpl,
    input wire [31:0] in_c1_eni1_15_tpl,
    input wire [31:0] in_c1_eni1_16_tpl,
    input wire [31:0] in_c1_eni1_17_tpl,
    input wire [31:0] in_c1_eni1_18_tpl,
    input wire [31:0] in_c1_eni1_19_tpl,
    input wire [31:0] in_c1_eni1_20_tpl,
    input wire [31:0] in_c1_eni1_21_tpl,
    input wire [31:0] in_c1_eni1_22_tpl,
    input wire [31:0] in_c1_eni1_23_tpl,
    input wire [31:0] in_c1_eni1_24_tpl,
    input wire [31:0] in_c1_eni1_25_tpl,
    input wire [31:0] in_c1_eni1_26_tpl,
    input wire [31:0] in_c1_eni1_27_tpl,
    input wire [31:0] in_c1_eni1_28_tpl,
    input wire [31:0] in_c1_eni1_29_tpl,
    input wire [31:0] in_c1_eni1_30_tpl,
    input wire [31:0] in_c1_eni1_31_tpl,
    input wire [31:0] in_c1_eni1_32_tpl,
    input wire [0:0] in_enable,
    input wire [0:0] in_i_valid,
    input wire clock,
    input wire resetn
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [32:0] i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19_a;
    wire [32:0] i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19_b;
    logic [32:0] i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19_o;
    wire [32:0] i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19_q;
    wire [32:0] i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_a;
    wire [32:0] i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_b;
    logic [32:0] i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_o;
    wire [32:0] i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_q;
    wire [32:0] i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_a;
    wire [32:0] i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_b;
    logic [32:0] i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_o;
    wire [32:0] i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_q;
    wire [32:0] i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31_a;
    wire [32:0] i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31_b;
    logic [32:0] i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31_o;
    wire [32:0] i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31_q;
    wire [32:0] i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32_a;
    wire [32:0] i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32_b;
    logic [32:0] i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32_o;
    wire [32:0] i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32_q;
    wire [32:0] i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33_a;
    wire [32:0] i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33_b;
    logic [32:0] i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33_o;
    wire [32:0] i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33_q;
    wire [32:0] i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20_a;
    wire [32:0] i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20_b;
    logic [32:0] i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20_o;
    wire [32:0] i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20_q;
    wire [32:0] i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21_a;
    wire [32:0] i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21_b;
    logic [32:0] i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21_o;
    wire [32:0] i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21_q;
    wire [32:0] i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22_a;
    wire [32:0] i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22_b;
    logic [32:0] i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22_o;
    wire [32:0] i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22_q;
    wire [32:0] i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23_a;
    wire [32:0] i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23_b;
    logic [32:0] i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23_o;
    wire [32:0] i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23_q;
    wire [32:0] i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24_a;
    wire [32:0] i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24_b;
    logic [32:0] i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24_o;
    wire [32:0] i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24_q;
    wire [32:0] i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25_a;
    wire [32:0] i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25_b;
    logic [32:0] i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25_o;
    wire [32:0] i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25_q;
    wire [32:0] i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26_a;
    wire [32:0] i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26_b;
    logic [32:0] i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26_o;
    wire [32:0] i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26_q;
    wire [32:0] i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_a;
    wire [32:0] i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_b;
    logic [32:0] i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_o;
    wire [32:0] i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_q;
    wire [32:0] i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_a;
    wire [32:0] i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_b;
    logic [32:0] i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_o;
    wire [32:0] i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_q;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_sel_x_b;
    wire [63:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_result_add_0_0_q;
    wire i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_q;
    wire i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_q;
    wire i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_q;
    wire i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_q;
    wire i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_q;
    wire i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_q;
    wire i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_q;
    wire i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_q;
    wire i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_q;
    wire i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_q;
    wire i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_q;
    wire i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_q;
    wire i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_q;
    wire i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_q;
    wire i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_q;
    wire i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_q;
    wire i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_q;
    wire i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_q;
    wire i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_q;
    wire i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_q;
    wire i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_q;
    wire i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_q;
    wire i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_q;
    wire i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_q;
    wire i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_q;
    wire i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_q;
    wire i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_q;
    wire i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_q;
    wire i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_q;
    wire i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_q;
    wire i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_q;
    wire i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_q;
    wire i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_ena2;
    wire [13:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs1_merged_bit_select_c;
    reg [0:0] redist0_sync_together39_aunroll_x_in_i_valid_5_q;
    reg [0:0] redist0_sync_together39_aunroll_x_in_i_valid_5_delay_0;
    reg [0:0] redist0_sync_together39_aunroll_x_in_i_valid_5_delay_1;
    reg [0:0] redist0_sync_together39_aunroll_x_in_i_valid_5_delay_2;
    reg [0:0] redist0_sync_together39_aunroll_x_in_i_valid_5_delay_3;
    reg [31:0] redist1_bgTrunc_i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_sel_x_b_1_q;
    reg [31:0] redist2_bgTrunc_i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_sel_x_b_1_q;
    reg [31:0] redist3_bgTrunc_i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_sel_x_b_1_q;
    reg [31:0] redist4_bgTrunc_i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_sel_x_b_1_q;
    reg [31:0] redist5_bgTrunc_i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sel_x_b_1_q;
    reg [31:0] redist6_bgTrunc_i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sel_x_b_1_q;
    reg [31:0] redist7_bgTrunc_i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sel_x_b_1_q;
    reg [31:0] redist8_bgTrunc_i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sel_x_b_1_q;
    reg [31:0] redist9_bgTrunc_i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sel_x_b_1_q;
    reg [31:0] redist10_bgTrunc_i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sel_x_b_1_q;
    reg [31:0] redist11_bgTrunc_i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sel_x_b_1_q;
    reg [31:0] redist12_bgTrunc_i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sel_x_b_1_q;
    reg [31:0] redist13_bgTrunc_i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sel_x_b_1_q;
    reg [31:0] redist14_bgTrunc_i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sel_x_b_1_q;
    reg [31:0] redist15_bgTrunc_i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sel_x_b_1_q;
    reg [31:0] redist16_bgTrunc_i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sel_x_b_1_q;
    reg [31:0] redist17_bgTrunc_i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sel_x_b_1_q;
    reg [31:0] redist18_bgTrunc_i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sel_x_b_1_q;
    reg [31:0] redist19_bgTrunc_i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sel_x_b_1_q;
    reg [31:0] redist20_bgTrunc_i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sel_x_b_1_q;


    // redist0_sync_together39_aunroll_x_in_i_valid_5(DELAY,451)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist0_sync_together39_aunroll_x_in_i_valid_5_delay_0 <= '0;
            redist0_sync_together39_aunroll_x_in_i_valid_5_delay_1 <= '0;
            redist0_sync_together39_aunroll_x_in_i_valid_5_delay_2 <= '0;
            redist0_sync_together39_aunroll_x_in_i_valid_5_delay_3 <= '0;
            redist0_sync_together39_aunroll_x_in_i_valid_5_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist0_sync_together39_aunroll_x_in_i_valid_5_delay_0 <= $unsigned(in_i_valid);
            redist0_sync_together39_aunroll_x_in_i_valid_5_delay_1 <= redist0_sync_together39_aunroll_x_in_i_valid_5_delay_0;
            redist0_sync_together39_aunroll_x_in_i_valid_5_delay_2 <= redist0_sync_together39_aunroll_x_in_i_valid_5_delay_1;
            redist0_sync_together39_aunroll_x_in_i_valid_5_delay_3 <= redist0_sync_together39_aunroll_x_in_i_valid_5_delay_2;
            redist0_sync_together39_aunroll_x_in_i_valid_5_q <= redist0_sync_together39_aunroll_x_in_i_valid_5_delay_3;
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs2_merged_bit_select(BITSELECT,434)@1
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs2_merged_bit_select_b = in_c1_eni1_16_tpl[31:18];
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs2_merged_bit_select_c = in_c1_eni1_16_tpl[17:0];

    // i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs1_merged_bit_select(BITSELECT,450)@1
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs1_merged_bit_select_b = in_c1_eni1_32_tpl[31:18];
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs1_merged_bit_select_c = in_c1_eni1_32_tpl[17:0];

    // i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma(CHAINMULTADD,412)@1 + 3
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_ena1 = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_ena2 = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_a0 = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_c0 = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_a1 = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_c1 = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs1_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_sumof2"),
        .use_chainadder("false"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .by_clock("0"),
        .by_width(14),
        .ax_clock("0"),
        .bx_clock("0"),
        .ax_width(18),
        .bx_width(18),
        .signed_may("false"),
        .signed_mby("false"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(33)
    ) i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_ena2, i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_ena1, i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_reset, i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_align_1(BITSHIFT,278)@4
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_align_1_qint = { i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_align_1_q = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma(CHAINMULTADD,389)@1 + 3
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_ena1 = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_ena2 = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_a0 = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_c0 = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs2_merged_bit_select_b;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .ax_clock("0"),
        .ax_width(14),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(28)
    ) i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_ena2, i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_ena1, i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_reset, i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma(CHAINMULTADD,390)@1 + 3
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_ena1 = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_ena2 = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_a0 = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_c0 = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_bs2_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(18),
        .ax_clock("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(36)
    ) i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_ena2, i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_ena1, i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_reset, i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_join_0(BITJOIN,277)@4
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_join_0_q = {i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im0_cma_q, i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_im8_cma_q};

    // i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_result_add_0_0(ADD,280)@4
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sel_x(BITSELECT,76)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sel_x_in = i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sel_x_in[31:0];

    // redist11_bgTrunc_i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sel_x_b_1(DELAY,462)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist11_bgTrunc_i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist11_bgTrunc_i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sel_x_b);
        end
    end

    // i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs2_merged_bit_select(BITSELECT,433)@1
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs2_merged_bit_select_b = in_c1_eni1_15_tpl[31:18];
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs2_merged_bit_select_c = in_c1_eni1_15_tpl[17:0];

    // i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs1_merged_bit_select(BITSELECT,449)@1
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs1_merged_bit_select_b = in_c1_eni1_31_tpl[31:18];
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs1_merged_bit_select_c = in_c1_eni1_31_tpl[17:0];

    // i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma(CHAINMULTADD,411)@1 + 3
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_ena1 = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_ena2 = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_a0 = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_c0 = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_a1 = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_c1 = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs1_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_sumof2"),
        .use_chainadder("false"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .by_clock("0"),
        .by_width(14),
        .ax_clock("0"),
        .bx_clock("0"),
        .ax_width(18),
        .bx_width(18),
        .signed_may("false"),
        .signed_mby("false"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(33)
    ) i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_ena2, i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_ena1, i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_reset, i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_align_1(BITSHIFT,263)@4
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_align_1_qint = { i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_align_1_q = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma(CHAINMULTADD,387)@1 + 3
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_ena1 = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_ena2 = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_a0 = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_c0 = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs2_merged_bit_select_b;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .ax_clock("0"),
        .ax_width(14),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(28)
    ) i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_ena2, i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_ena1, i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_reset, i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma(CHAINMULTADD,388)@1 + 3
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_ena1 = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_ena2 = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_a0 = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_c0 = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_bs2_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(18),
        .ax_clock("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(36)
    ) i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_ena2, i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_ena1, i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_reset, i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_join_0(BITJOIN,262)@4
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_join_0_q = {i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im0_cma_q, i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_im8_cma_q};

    // i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_result_add_0_0(ADD,265)@4
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sel_x(BITSELECT,75)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sel_x_in = i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sel_x_in[31:0];

    // redist12_bgTrunc_i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sel_x_b_1(DELAY,463)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist12_bgTrunc_i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist12_bgTrunc_i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sel_x_b);
        end
    end

    // i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26(ADD,63)@5
    assign i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26_a = {1'b0, redist12_bgTrunc_i_mul_i_i_i_i_i_i490_dot16_latency_unconstrained10_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26_b = {1'b0, redist11_bgTrunc_i_mul_i_i_i_i_i_i504_dot16_latency_unconstrained9_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26_o = $unsigned(i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26_a) + $unsigned(i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26_b);
    assign i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26_q = i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26_o[32:0];

    // bgTrunc_i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26_sel_x(BITSELECT,95)@5
    assign bgTrunc_i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26_sel_x_b = i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26_q[31:0];

    // i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs2_merged_bit_select(BITSELECT,432)@1
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs2_merged_bit_select_b = in_c1_eni1_14_tpl[31:18];
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs2_merged_bit_select_c = in_c1_eni1_14_tpl[17:0];

    // i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs1_merged_bit_select(BITSELECT,448)@1
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs1_merged_bit_select_b = in_c1_eni1_30_tpl[31:18];
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs1_merged_bit_select_c = in_c1_eni1_30_tpl[17:0];

    // i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma(CHAINMULTADD,410)@1 + 3
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_ena1 = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_ena2 = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_a0 = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_c0 = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_a1 = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_c1 = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs1_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_sumof2"),
        .use_chainadder("false"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .by_clock("0"),
        .by_width(14),
        .ax_clock("0"),
        .bx_clock("0"),
        .ax_width(18),
        .bx_width(18),
        .signed_may("false"),
        .signed_mby("false"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(33)
    ) i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_ena2, i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_ena1, i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_reset, i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_align_1(BITSHIFT,248)@4
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_align_1_qint = { i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_align_1_q = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma(CHAINMULTADD,385)@1 + 3
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_ena1 = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_ena2 = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_a0 = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_c0 = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs2_merged_bit_select_b;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .ax_clock("0"),
        .ax_width(14),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(28)
    ) i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_ena2, i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_ena1, i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_reset, i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma(CHAINMULTADD,386)@1 + 3
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_ena1 = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_ena2 = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_a0 = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_c0 = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_bs2_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(18),
        .ax_clock("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(36)
    ) i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_ena2, i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_ena1, i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_reset, i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_join_0(BITJOIN,247)@4
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_join_0_q = {i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im0_cma_q, i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_im8_cma_q};

    // i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_result_add_0_0(ADD,250)@4
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sel_x(BITSELECT,74)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sel_x_in = i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sel_x_in[31:0];

    // redist13_bgTrunc_i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sel_x_b_1(DELAY,464)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist13_bgTrunc_i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist13_bgTrunc_i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sel_x_b);
        end
    end

    // i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs2_merged_bit_select(BITSELECT,431)@1
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs2_merged_bit_select_b = in_c1_eni1_13_tpl[31:18];
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs2_merged_bit_select_c = in_c1_eni1_13_tpl[17:0];

    // i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs1_merged_bit_select(BITSELECT,447)@1
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs1_merged_bit_select_b = in_c1_eni1_29_tpl[31:18];
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs1_merged_bit_select_c = in_c1_eni1_29_tpl[17:0];

    // i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma(CHAINMULTADD,409)@1 + 3
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_ena1 = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_ena2 = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_a0 = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_c0 = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_a1 = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_c1 = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs1_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_sumof2"),
        .use_chainadder("false"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .by_clock("0"),
        .by_width(14),
        .ax_clock("0"),
        .bx_clock("0"),
        .ax_width(18),
        .bx_width(18),
        .signed_may("false"),
        .signed_mby("false"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(33)
    ) i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_ena2, i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_ena1, i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_reset, i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_align_1(BITSHIFT,233)@4
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_align_1_qint = { i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_align_1_q = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma(CHAINMULTADD,383)@1 + 3
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_ena1 = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_ena2 = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_a0 = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_c0 = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs2_merged_bit_select_b;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .ax_clock("0"),
        .ax_width(14),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(28)
    ) i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_ena2, i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_ena1, i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_reset, i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma(CHAINMULTADD,384)@1 + 3
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_ena1 = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_ena2 = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_a0 = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_c0 = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_bs2_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(18),
        .ax_clock("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(36)
    ) i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_ena2, i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_ena1, i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_reset, i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_join_0(BITJOIN,232)@4
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_join_0_q = {i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im0_cma_q, i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_im8_cma_q};

    // i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_result_add_0_0(ADD,235)@4
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sel_x(BITSELECT,73)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sel_x_in = i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sel_x_in[31:0];

    // redist14_bgTrunc_i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sel_x_b_1(DELAY,465)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist14_bgTrunc_i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist14_bgTrunc_i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sel_x_b);
        end
    end

    // i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25(ADD,62)@5
    assign i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25_a = {1'b0, redist14_bgTrunc_i_mul_i_i_i_i_i_i462_dot16_latency_unconstrained12_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25_b = {1'b0, redist13_bgTrunc_i_mul_i_i_i_i_i_i476_dot16_latency_unconstrained11_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25_o = $unsigned(i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25_a) + $unsigned(i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25_b);
    assign i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25_q = i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25_o[32:0];

    // bgTrunc_i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25_sel_x(BITSELECT,94)@5
    assign bgTrunc_i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25_sel_x_b = i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25_q[31:0];

    // i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30(ADD,53)@5
    assign i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_a = {1'b0, bgTrunc_i_reduction_dot16_latency_unconstrained_6_dot16_latency_unconstrained25_sel_x_b};
    assign i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_b = {1'b0, bgTrunc_i_reduction_dot16_latency_unconstrained_7_dot16_latency_unconstrained26_sel_x_b};
    assign i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_o = $unsigned(i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_a) + $unsigned(i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_b);
    assign i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_q = i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_o[32:0];

    // bgTrunc_i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_sel_x(BITSELECT,85)@5
    assign bgTrunc_i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_sel_x_b = i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_q[31:0];

    // redist3_bgTrunc_i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_sel_x_b_1(DELAY,454)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist3_bgTrunc_i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist3_bgTrunc_i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_sel_x_b_1_q <= $unsigned(bgTrunc_i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_sel_x_b);
        end
    end

    // i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs2_merged_bit_select(BITSELECT,430)@1
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs2_merged_bit_select_b = in_c1_eni1_12_tpl[31:18];
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs2_merged_bit_select_c = in_c1_eni1_12_tpl[17:0];

    // i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs1_merged_bit_select(BITSELECT,446)@1
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs1_merged_bit_select_b = in_c1_eni1_28_tpl[31:18];
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs1_merged_bit_select_c = in_c1_eni1_28_tpl[17:0];

    // i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma(CHAINMULTADD,408)@1 + 3
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_ena1 = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_ena2 = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_a0 = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_c0 = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_a1 = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_c1 = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs1_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_sumof2"),
        .use_chainadder("false"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .by_clock("0"),
        .by_width(14),
        .ax_clock("0"),
        .bx_clock("0"),
        .ax_width(18),
        .bx_width(18),
        .signed_may("false"),
        .signed_mby("false"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(33)
    ) i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_ena2, i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_ena1, i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_reset, i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_align_1(BITSHIFT,218)@4
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_align_1_qint = { i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_align_1_q = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma(CHAINMULTADD,381)@1 + 3
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_ena1 = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_ena2 = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_a0 = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_c0 = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs2_merged_bit_select_b;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .ax_clock("0"),
        .ax_width(14),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(28)
    ) i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_ena2, i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_ena1, i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_reset, i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma(CHAINMULTADD,382)@1 + 3
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_ena1 = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_ena2 = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_a0 = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_c0 = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_bs2_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(18),
        .ax_clock("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(36)
    ) i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_ena2, i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_ena1, i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_reset, i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_join_0(BITJOIN,217)@4
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_join_0_q = {i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im0_cma_q, i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_im8_cma_q};

    // i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_result_add_0_0(ADD,220)@4
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sel_x(BITSELECT,72)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sel_x_in = i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sel_x_in[31:0];

    // redist15_bgTrunc_i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sel_x_b_1(DELAY,466)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist15_bgTrunc_i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist15_bgTrunc_i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sel_x_b);
        end
    end

    // i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs2_merged_bit_select(BITSELECT,429)@1
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs2_merged_bit_select_b = in_c1_eni1_11_tpl[31:18];
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs2_merged_bit_select_c = in_c1_eni1_11_tpl[17:0];

    // i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs1_merged_bit_select(BITSELECT,445)@1
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs1_merged_bit_select_b = in_c1_eni1_27_tpl[31:18];
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs1_merged_bit_select_c = in_c1_eni1_27_tpl[17:0];

    // i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma(CHAINMULTADD,407)@1 + 3
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_ena1 = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_ena2 = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_a0 = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_c0 = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_a1 = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_c1 = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs1_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_sumof2"),
        .use_chainadder("false"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .by_clock("0"),
        .by_width(14),
        .ax_clock("0"),
        .bx_clock("0"),
        .ax_width(18),
        .bx_width(18),
        .signed_may("false"),
        .signed_mby("false"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(33)
    ) i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_ena2, i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_ena1, i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_reset, i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_align_1(BITSHIFT,203)@4
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_align_1_qint = { i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_align_1_q = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma(CHAINMULTADD,379)@1 + 3
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_ena1 = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_ena2 = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_a0 = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_c0 = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs2_merged_bit_select_b;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .ax_clock("0"),
        .ax_width(14),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(28)
    ) i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_ena2, i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_ena1, i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_reset, i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma(CHAINMULTADD,380)@1 + 3
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_ena1 = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_ena2 = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_a0 = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_c0 = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_bs2_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(18),
        .ax_clock("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(36)
    ) i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_ena2, i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_ena1, i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_reset, i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_join_0(BITJOIN,202)@4
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_join_0_q = {i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im0_cma_q, i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_im8_cma_q};

    // i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_result_add_0_0(ADD,205)@4
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sel_x(BITSELECT,71)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sel_x_in = i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sel_x_in[31:0];

    // redist16_bgTrunc_i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sel_x_b_1(DELAY,467)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist16_bgTrunc_i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist16_bgTrunc_i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sel_x_b);
        end
    end

    // i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24(ADD,61)@5
    assign i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24_a = {1'b0, redist16_bgTrunc_i_mul_i_i_i_i_i_i434_dot16_latency_unconstrained14_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24_b = {1'b0, redist15_bgTrunc_i_mul_i_i_i_i_i_i448_dot16_latency_unconstrained13_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24_o = $unsigned(i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24_a) + $unsigned(i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24_b);
    assign i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24_q = i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24_o[32:0];

    // bgTrunc_i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24_sel_x(BITSELECT,93)@5
    assign bgTrunc_i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24_sel_x_b = i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24_q[31:0];

    // i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs2_merged_bit_select(BITSELECT,428)@1
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs2_merged_bit_select_b = in_c1_eni1_10_tpl[31:18];
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs2_merged_bit_select_c = in_c1_eni1_10_tpl[17:0];

    // i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs1_merged_bit_select(BITSELECT,444)@1
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs1_merged_bit_select_b = in_c1_eni1_26_tpl[31:18];
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs1_merged_bit_select_c = in_c1_eni1_26_tpl[17:0];

    // i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma(CHAINMULTADD,406)@1 + 3
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_ena1 = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_ena2 = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_a0 = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_c0 = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_a1 = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_c1 = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs1_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_sumof2"),
        .use_chainadder("false"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .by_clock("0"),
        .by_width(14),
        .ax_clock("0"),
        .bx_clock("0"),
        .ax_width(18),
        .bx_width(18),
        .signed_may("false"),
        .signed_mby("false"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(33)
    ) i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_ena2, i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_ena1, i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_reset, i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_align_1(BITSHIFT,188)@4
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_align_1_qint = { i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_align_1_q = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma(CHAINMULTADD,377)@1 + 3
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_ena1 = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_ena2 = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_a0 = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_c0 = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs2_merged_bit_select_b;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .ax_clock("0"),
        .ax_width(14),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(28)
    ) i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_ena2, i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_ena1, i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_reset, i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma(CHAINMULTADD,378)@1 + 3
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_ena1 = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_ena2 = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_a0 = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_c0 = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_bs2_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(18),
        .ax_clock("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(36)
    ) i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_ena2, i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_ena1, i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_reset, i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_join_0(BITJOIN,187)@4
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_join_0_q = {i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im0_cma_q, i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_im8_cma_q};

    // i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_result_add_0_0(ADD,190)@4
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sel_x(BITSELECT,70)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sel_x_in = i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sel_x_in[31:0];

    // redist17_bgTrunc_i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sel_x_b_1(DELAY,468)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist17_bgTrunc_i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist17_bgTrunc_i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sel_x_b);
        end
    end

    // i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs2_merged_bit_select(BITSELECT,427)@1
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs2_merged_bit_select_b = in_c1_eni1_9_tpl[31:18];
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs2_merged_bit_select_c = in_c1_eni1_9_tpl[17:0];

    // i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs1_merged_bit_select(BITSELECT,443)@1
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs1_merged_bit_select_b = in_c1_eni1_25_tpl[31:18];
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs1_merged_bit_select_c = in_c1_eni1_25_tpl[17:0];

    // i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma(CHAINMULTADD,405)@1 + 3
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_ena1 = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_ena2 = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_a0 = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_c0 = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_a1 = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_c1 = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs1_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_sumof2"),
        .use_chainadder("false"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .by_clock("0"),
        .by_width(14),
        .ax_clock("0"),
        .bx_clock("0"),
        .ax_width(18),
        .bx_width(18),
        .signed_may("false"),
        .signed_mby("false"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(33)
    ) i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_ena2, i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_ena1, i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_reset, i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_align_1(BITSHIFT,173)@4
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_align_1_qint = { i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_align_1_q = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma(CHAINMULTADD,375)@1 + 3
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_ena1 = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_ena2 = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_a0 = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_c0 = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs2_merged_bit_select_b;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .ax_clock("0"),
        .ax_width(14),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(28)
    ) i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_ena2, i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_ena1, i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_reset, i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma(CHAINMULTADD,376)@1 + 3
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_ena1 = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_ena2 = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_a0 = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_c0 = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_bs2_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(18),
        .ax_clock("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(36)
    ) i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_ena2, i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_ena1, i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_reset, i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_join_0(BITJOIN,172)@4
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_join_0_q = {i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im0_cma_q, i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_im8_cma_q};

    // i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_result_add_0_0(ADD,175)@4
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sel_x(BITSELECT,69)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sel_x_in = i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sel_x_in[31:0];

    // redist18_bgTrunc_i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sel_x_b_1(DELAY,469)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist18_bgTrunc_i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist18_bgTrunc_i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sel_x_b);
        end
    end

    // i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23(ADD,60)@5
    assign i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23_a = {1'b0, redist18_bgTrunc_i_mul_i_i_i_i_i_i406_dot16_latency_unconstrained16_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23_b = {1'b0, redist17_bgTrunc_i_mul_i_i_i_i_i_i420_dot16_latency_unconstrained15_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23_o = $unsigned(i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23_a) + $unsigned(i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23_b);
    assign i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23_q = i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23_o[32:0];

    // bgTrunc_i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23_sel_x(BITSELECT,92)@5
    assign bgTrunc_i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23_sel_x_b = i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23_q[31:0];

    // i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29(ADD,52)@5
    assign i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_a = {1'b0, bgTrunc_i_reduction_dot16_latency_unconstrained_4_dot16_latency_unconstrained23_sel_x_b};
    assign i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_b = {1'b0, bgTrunc_i_reduction_dot16_latency_unconstrained_5_dot16_latency_unconstrained24_sel_x_b};
    assign i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_o = $unsigned(i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_a) + $unsigned(i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_b);
    assign i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_q = i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_o[32:0];

    // bgTrunc_i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_sel_x(BITSELECT,84)@5
    assign bgTrunc_i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_sel_x_b = i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_q[31:0];

    // redist4_bgTrunc_i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_sel_x_b_1(DELAY,455)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist4_bgTrunc_i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist4_bgTrunc_i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_sel_x_b_1_q <= $unsigned(bgTrunc_i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_sel_x_b);
        end
    end

    // i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32(ADD,55)@6
    assign i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32_a = {1'b0, redist4_bgTrunc_i_reduction_dot16_latency_unconstrained_10_dot16_latency_unconstrained29_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32_b = {1'b0, redist3_bgTrunc_i_reduction_dot16_latency_unconstrained_11_dot16_latency_unconstrained30_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32_o = $unsigned(i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32_a) + $unsigned(i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32_b);
    assign i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32_q = i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32_o[32:0];

    // bgTrunc_i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32_sel_x(BITSELECT,87)@6
    assign bgTrunc_i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32_sel_x_b = i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32_q[31:0];

    // i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs2_merged_bit_select(BITSELECT,426)@1
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs2_merged_bit_select_b = in_c1_eni1_8_tpl[31:18];
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs2_merged_bit_select_c = in_c1_eni1_8_tpl[17:0];

    // i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs1_merged_bit_select(BITSELECT,442)@1
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs1_merged_bit_select_b = in_c1_eni1_24_tpl[31:18];
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs1_merged_bit_select_c = in_c1_eni1_24_tpl[17:0];

    // i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma(CHAINMULTADD,418)@1 + 3
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_ena1 = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_ena2 = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_a0 = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_c0 = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_a1 = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_c1 = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs1_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_sumof2"),
        .use_chainadder("false"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .by_clock("0"),
        .by_width(14),
        .ax_clock("0"),
        .bx_clock("0"),
        .ax_width(18),
        .bx_width(18),
        .signed_may("false"),
        .signed_mby("false"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(33)
    ) i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_ena2, i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_ena1, i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_reset, i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_align_1(BITSHIFT,368)@4
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_align_1_qint = { i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_align_1_q = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma(CHAINMULTADD,401)@1 + 3
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_ena1 = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_ena2 = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_a0 = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_c0 = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs2_merged_bit_select_b;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .ax_clock("0"),
        .ax_width(14),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(28)
    ) i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_ena2, i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_ena1, i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_reset, i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma(CHAINMULTADD,402)@1 + 3
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_ena1 = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_ena2 = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_a0 = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_c0 = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_bs2_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(18),
        .ax_clock("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(36)
    ) i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_ena2, i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_ena1, i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_reset, i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_join_0(BITJOIN,367)@4
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_join_0_q = {i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im0_cma_q, i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_im8_cma_q};

    // i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_result_add_0_0(ADD,370)@4
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sel_x(BITSELECT,82)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sel_x_in = i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sel_x_in[31:0];

    // redist5_bgTrunc_i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sel_x_b_1(DELAY,456)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist5_bgTrunc_i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist5_bgTrunc_i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sel_x_b);
        end
    end

    // i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs2_merged_bit_select(BITSELECT,425)@1
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs2_merged_bit_select_b = in_c1_eni1_7_tpl[31:18];
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs2_merged_bit_select_c = in_c1_eni1_7_tpl[17:0];

    // i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs1_merged_bit_select(BITSELECT,441)@1
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs1_merged_bit_select_b = in_c1_eni1_23_tpl[31:18];
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs1_merged_bit_select_c = in_c1_eni1_23_tpl[17:0];

    // i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma(CHAINMULTADD,417)@1 + 3
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_ena1 = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_ena2 = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_a0 = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_c0 = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_a1 = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_c1 = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs1_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_sumof2"),
        .use_chainadder("false"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .by_clock("0"),
        .by_width(14),
        .ax_clock("0"),
        .bx_clock("0"),
        .ax_width(18),
        .bx_width(18),
        .signed_may("false"),
        .signed_mby("false"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(33)
    ) i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_ena2, i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_ena1, i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_reset, i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_align_1(BITSHIFT,353)@4
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_align_1_qint = { i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_align_1_q = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma(CHAINMULTADD,399)@1 + 3
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_ena1 = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_ena2 = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_a0 = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_c0 = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs2_merged_bit_select_b;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .ax_clock("0"),
        .ax_width(14),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(28)
    ) i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_ena2, i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_ena1, i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_reset, i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma(CHAINMULTADD,400)@1 + 3
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_ena1 = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_ena2 = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_a0 = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_c0 = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_bs2_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(18),
        .ax_clock("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(36)
    ) i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_ena2, i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_ena1, i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_reset, i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_join_0(BITJOIN,352)@4
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_join_0_q = {i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im0_cma_q, i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_im8_cma_q};

    // i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_result_add_0_0(ADD,355)@4
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sel_x(BITSELECT,81)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sel_x_in = i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sel_x_in[31:0];

    // redist6_bgTrunc_i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sel_x_b_1(DELAY,457)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist6_bgTrunc_i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist6_bgTrunc_i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sel_x_b);
        end
    end

    // i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22(ADD,59)@5
    assign i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22_a = {1'b0, redist6_bgTrunc_i_mul_i_i_i_i_i_i574_dot16_latency_unconstrained4_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22_b = {1'b0, redist5_bgTrunc_i_mul_i_i_i_i_i_i_dot16_latency_unconstrained3_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22_o = $unsigned(i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22_a) + $unsigned(i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22_b);
    assign i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22_q = i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22_o[32:0];

    // bgTrunc_i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22_sel_x(BITSELECT,91)@5
    assign bgTrunc_i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22_sel_x_b = i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22_q[31:0];

    // i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs2_merged_bit_select(BITSELECT,424)@1
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs2_merged_bit_select_b = in_c1_eni1_6_tpl[31:18];
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs2_merged_bit_select_c = in_c1_eni1_6_tpl[17:0];

    // i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs1_merged_bit_select(BITSELECT,440)@1
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs1_merged_bit_select_b = in_c1_eni1_22_tpl[31:18];
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs1_merged_bit_select_c = in_c1_eni1_22_tpl[17:0];

    // i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma(CHAINMULTADD,416)@1 + 3
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_ena1 = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_ena2 = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_a0 = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_c0 = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_a1 = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_c1 = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs1_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_sumof2"),
        .use_chainadder("false"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .by_clock("0"),
        .by_width(14),
        .ax_clock("0"),
        .bx_clock("0"),
        .ax_width(18),
        .bx_width(18),
        .signed_may("false"),
        .signed_mby("false"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(33)
    ) i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_ena2, i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_ena1, i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_reset, i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_align_1(BITSHIFT,338)@4
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_align_1_qint = { i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_align_1_q = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma(CHAINMULTADD,397)@1 + 3
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_ena1 = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_ena2 = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_a0 = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_c0 = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs2_merged_bit_select_b;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .ax_clock("0"),
        .ax_width(14),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(28)
    ) i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_ena2, i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_ena1, i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_reset, i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma(CHAINMULTADD,398)@1 + 3
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_ena1 = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_ena2 = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_a0 = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_c0 = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_bs2_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(18),
        .ax_clock("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(36)
    ) i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_ena2, i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_ena1, i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_reset, i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_join_0(BITJOIN,337)@4
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_join_0_q = {i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im0_cma_q, i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_im8_cma_q};

    // i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_result_add_0_0(ADD,340)@4
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sel_x(BITSELECT,80)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sel_x_in = i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sel_x_in[31:0];

    // redist7_bgTrunc_i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sel_x_b_1(DELAY,458)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist7_bgTrunc_i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist7_bgTrunc_i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sel_x_b);
        end
    end

    // i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs2_merged_bit_select(BITSELECT,423)@1
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs2_merged_bit_select_b = in_c1_eni1_5_tpl[31:18];
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs2_merged_bit_select_c = in_c1_eni1_5_tpl[17:0];

    // i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs1_merged_bit_select(BITSELECT,439)@1
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs1_merged_bit_select_b = in_c1_eni1_21_tpl[31:18];
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs1_merged_bit_select_c = in_c1_eni1_21_tpl[17:0];

    // i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma(CHAINMULTADD,415)@1 + 3
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_ena1 = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_ena2 = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_a0 = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_c0 = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_a1 = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_c1 = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs1_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_sumof2"),
        .use_chainadder("false"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .by_clock("0"),
        .by_width(14),
        .ax_clock("0"),
        .bx_clock("0"),
        .ax_width(18),
        .bx_width(18),
        .signed_may("false"),
        .signed_mby("false"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(33)
    ) i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_ena2, i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_ena1, i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_reset, i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_align_1(BITSHIFT,323)@4
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_align_1_qint = { i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_align_1_q = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma(CHAINMULTADD,395)@1 + 3
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_ena1 = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_ena2 = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_a0 = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_c0 = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs2_merged_bit_select_b;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .ax_clock("0"),
        .ax_width(14),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(28)
    ) i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_ena2, i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_ena1, i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_reset, i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma(CHAINMULTADD,396)@1 + 3
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_ena1 = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_ena2 = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_a0 = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_c0 = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_bs2_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(18),
        .ax_clock("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(36)
    ) i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_ena2, i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_ena1, i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_reset, i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_join_0(BITJOIN,322)@4
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_join_0_q = {i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im0_cma_q, i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_im8_cma_q};

    // i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_result_add_0_0(ADD,325)@4
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sel_x(BITSELECT,79)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sel_x_in = i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sel_x_in[31:0];

    // redist8_bgTrunc_i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sel_x_b_1(DELAY,459)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist8_bgTrunc_i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist8_bgTrunc_i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sel_x_b);
        end
    end

    // i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21(ADD,58)@5
    assign i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21_a = {1'b0, redist8_bgTrunc_i_mul_i_i_i_i_i_i546_dot16_latency_unconstrained6_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21_b = {1'b0, redist7_bgTrunc_i_mul_i_i_i_i_i_i560_dot16_latency_unconstrained5_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21_o = $unsigned(i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21_a) + $unsigned(i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21_b);
    assign i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21_q = i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21_o[32:0];

    // bgTrunc_i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21_sel_x(BITSELECT,90)@5
    assign bgTrunc_i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21_sel_x_b = i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21_q[31:0];

    // i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28(ADD,65)@5
    assign i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_a = {1'b0, bgTrunc_i_reduction_dot16_latency_unconstrained_2_dot16_latency_unconstrained21_sel_x_b};
    assign i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_b = {1'b0, bgTrunc_i_reduction_dot16_latency_unconstrained_3_dot16_latency_unconstrained22_sel_x_b};
    assign i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_o = $unsigned(i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_a) + $unsigned(i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_b);
    assign i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_q = i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_o[32:0];

    // bgTrunc_i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_sel_x(BITSELECT,97)@5
    assign bgTrunc_i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_sel_x_b = i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_q[31:0];

    // redist1_bgTrunc_i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_sel_x_b_1(DELAY,452)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist1_bgTrunc_i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist1_bgTrunc_i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_sel_x_b_1_q <= $unsigned(bgTrunc_i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_sel_x_b);
        end
    end

    // i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs2_merged_bit_select(BITSELECT,422)@1
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs2_merged_bit_select_b = in_c1_eni1_4_tpl[31:18];
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs2_merged_bit_select_c = in_c1_eni1_4_tpl[17:0];

    // i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs1_merged_bit_select(BITSELECT,438)@1
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs1_merged_bit_select_b = in_c1_eni1_20_tpl[31:18];
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs1_merged_bit_select_c = in_c1_eni1_20_tpl[17:0];

    // i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma(CHAINMULTADD,414)@1 + 3
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_ena1 = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_ena2 = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_a0 = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_c0 = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_a1 = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_c1 = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs1_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_sumof2"),
        .use_chainadder("false"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .by_clock("0"),
        .by_width(14),
        .ax_clock("0"),
        .bx_clock("0"),
        .ax_width(18),
        .bx_width(18),
        .signed_may("false"),
        .signed_mby("false"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(33)
    ) i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_ena2, i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_ena1, i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_reset, i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_align_1(BITSHIFT,308)@4
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_align_1_qint = { i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_align_1_q = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma(CHAINMULTADD,393)@1 + 3
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_ena1 = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_ena2 = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_a0 = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_c0 = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs2_merged_bit_select_b;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .ax_clock("0"),
        .ax_width(14),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(28)
    ) i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_ena2, i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_ena1, i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_reset, i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma(CHAINMULTADD,394)@1 + 3
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_ena1 = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_ena2 = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_a0 = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_c0 = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_bs2_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(18),
        .ax_clock("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(36)
    ) i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_ena2, i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_ena1, i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_reset, i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_join_0(BITJOIN,307)@4
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_join_0_q = {i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im0_cma_q, i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_im8_cma_q};

    // i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_result_add_0_0(ADD,310)@4
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sel_x(BITSELECT,78)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sel_x_in = i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sel_x_in[31:0];

    // redist9_bgTrunc_i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sel_x_b_1(DELAY,460)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist9_bgTrunc_i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist9_bgTrunc_i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sel_x_b);
        end
    end

    // i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs2_merged_bit_select(BITSELECT,421)@1
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs2_merged_bit_select_b = in_c1_eni1_3_tpl[31:18];
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs2_merged_bit_select_c = in_c1_eni1_3_tpl[17:0];

    // i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs1_merged_bit_select(BITSELECT,437)@1
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs1_merged_bit_select_b = in_c1_eni1_19_tpl[31:18];
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs1_merged_bit_select_c = in_c1_eni1_19_tpl[17:0];

    // i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma(CHAINMULTADD,413)@1 + 3
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_ena1 = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_ena2 = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_a0 = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_c0 = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_a1 = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_c1 = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs1_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_sumof2"),
        .use_chainadder("false"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .by_clock("0"),
        .by_width(14),
        .ax_clock("0"),
        .bx_clock("0"),
        .ax_width(18),
        .bx_width(18),
        .signed_may("false"),
        .signed_mby("false"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(33)
    ) i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_ena2, i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_ena1, i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_reset, i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_align_1(BITSHIFT,293)@4
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_align_1_qint = { i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_align_1_q = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma(CHAINMULTADD,391)@1 + 3
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_ena1 = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_ena2 = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_a0 = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_c0 = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs2_merged_bit_select_b;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .ax_clock("0"),
        .ax_width(14),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(28)
    ) i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_ena2, i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_ena1, i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_reset, i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma(CHAINMULTADD,392)@1 + 3
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_ena1 = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_ena2 = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_a0 = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_c0 = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_bs2_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(18),
        .ax_clock("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(36)
    ) i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_ena2, i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_ena1, i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_reset, i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_join_0(BITJOIN,292)@4
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_join_0_q = {i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im0_cma_q, i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_im8_cma_q};

    // i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_result_add_0_0(ADD,295)@4
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sel_x(BITSELECT,77)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sel_x_in = i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sel_x_in[31:0];

    // redist10_bgTrunc_i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sel_x_b_1(DELAY,461)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist10_bgTrunc_i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist10_bgTrunc_i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sel_x_b);
        end
    end

    // i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20(ADD,57)@5
    assign i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20_a = {1'b0, redist10_bgTrunc_i_mul_i_i_i_i_i_i518_dot16_latency_unconstrained8_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20_b = {1'b0, redist9_bgTrunc_i_mul_i_i_i_i_i_i532_dot16_latency_unconstrained7_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20_o = $unsigned(i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20_a) + $unsigned(i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20_b);
    assign i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20_q = i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20_o[32:0];

    // bgTrunc_i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20_sel_x(BITSELECT,89)@5
    assign bgTrunc_i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20_sel_x_b = i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20_q[31:0];

    // i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs2_merged_bit_select(BITSELECT,419)@1
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs2_merged_bit_select_b = in_c1_eni1_1_tpl[31:18];
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs2_merged_bit_select_c = in_c1_eni1_1_tpl[17:0];

    // i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs1_merged_bit_select(BITSELECT,435)@1
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs1_merged_bit_select_b = in_c1_eni1_17_tpl[31:18];
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs1_merged_bit_select_c = in_c1_eni1_17_tpl[17:0];

    // i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma(CHAINMULTADD,404)@1 + 3
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_ena1 = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_ena2 = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_a0 = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_c0 = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_a1 = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_c1 = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs1_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_sumof2"),
        .use_chainadder("false"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .by_clock("0"),
        .by_width(14),
        .ax_clock("0"),
        .bx_clock("0"),
        .ax_width(18),
        .bx_width(18),
        .signed_may("false"),
        .signed_mby("false"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(33)
    ) i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_ena2, i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_ena1, i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_reset, i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_align_1(BITSHIFT,158)@4
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_align_1_qint = { i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_align_1_q = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma(CHAINMULTADD,373)@1 + 3
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_ena1 = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_ena2 = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_a0 = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_c0 = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs2_merged_bit_select_b;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .ax_clock("0"),
        .ax_width(14),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(28)
    ) i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_ena2, i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_ena1, i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_reset, i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma(CHAINMULTADD,374)@1 + 3
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_ena1 = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_ena2 = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_a0 = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_c0 = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_bs2_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(18),
        .ax_clock("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(36)
    ) i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_ena2, i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_ena1, i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_reset, i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_join_0(BITJOIN,157)@4
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_join_0_q = {i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im0_cma_q, i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_im8_cma_q};

    // i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_result_add_0_0(ADD,160)@4
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sel_x(BITSELECT,68)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sel_x_in = i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sel_x_in[31:0];

    // redist19_bgTrunc_i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sel_x_b_1(DELAY,470)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist19_bgTrunc_i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist19_bgTrunc_i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sel_x_b);
        end
    end

    // i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs2_merged_bit_select(BITSELECT,420)@1
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs2_merged_bit_select_b = in_c1_eni1_2_tpl[31:18];
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs2_merged_bit_select_c = in_c1_eni1_2_tpl[17:0];

    // i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs1_merged_bit_select(BITSELECT,436)@1
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs1_merged_bit_select_b = in_c1_eni1_18_tpl[31:18];
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs1_merged_bit_select_c = in_c1_eni1_18_tpl[17:0];

    // i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma(CHAINMULTADD,403)@1 + 3
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_ena1 = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_ena2 = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_a0 = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_c0 = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_a1 = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_c1 = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs1_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_sumof2"),
        .use_chainadder("false"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .by_clock("0"),
        .by_width(14),
        .ax_clock("0"),
        .bx_clock("0"),
        .ax_width(18),
        .bx_width(18),
        .signed_may("false"),
        .signed_mby("false"),
        .signed_max("false"),
        .signed_mbx("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(33)
    ) i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_ena2, i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_ena1, i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_reset, i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(33), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_align_1(BITSHIFT,143)@4
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_align_1_qint = { i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_align_1_q = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma(CHAINMULTADD,371)@1 + 3
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_ena1 = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_ena2 = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_a0 = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_c0 = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs2_merged_bit_select_b;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(14),
        .ax_clock("0"),
        .ax_width(14),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(28)
    ) i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_ena2, i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_ena1, i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_reset, i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(28), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma(CHAINMULTADD,372)@1 + 3
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_ena1 = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_ena2 = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_a0 = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_c0 = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_bs2_merged_bit_select_c;
    twentynm_mac #(
        .operation_mode("m18x18_full"),
        .ay_scan_in_clock("0"),
        .ay_scan_in_width(18),
        .ax_clock("0"),
        .ax_width(18),
        .signed_may("false"),
        .signed_max("false"),
        .input_pipeline_clock("2"),
        .output_clock("1"),
        .result_a_width(36)
    ) i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_ena2, i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_ena1, i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_reset, i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_s0),
        .accumulate(),
        .loadconst(),
        .negate(),
        .sub(),
        .az(),
        .coefsela(),
        .bx(),
        .by(),
        .bz(),
        .coefselb(),
        .scanin(),
        .scanout(),
        .chainin(),
        .chainout(),
        .resultb(),
        .dftout()
    );
    dspba_delay_ver #( .width(36), .depth(0), .reset_kind("ASYNC"), .phase(0), .modulus(1), .reset_high(1'b0) )
    i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_join_0(BITJOIN,142)@4
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_join_0_q = {i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im0_cma_q, i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_im8_cma_q};

    // i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_result_add_0_0(ADD,145)@4
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sel_x(BITSELECT,67)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sel_x_in = i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sel_x_in[31:0];

    // redist20_bgTrunc_i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sel_x_b_1(DELAY,471)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist20_bgTrunc_i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist20_bgTrunc_i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sel_x_b);
        end
    end

    // i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19(ADD,51)@5
    assign i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19_a = {1'b0, redist20_bgTrunc_i_mul_i_i_i_i_i_i378_dot16_latency_unconstrained18_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19_b = {1'b0, redist19_bgTrunc_i_mul_i_i_i_i_i_i392_dot16_latency_unconstrained17_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19_o = $unsigned(i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19_a) + $unsigned(i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19_b);
    assign i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19_q = i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19_o[32:0];

    // bgTrunc_i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19_sel_x(BITSELECT,83)@5
    assign bgTrunc_i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19_sel_x_b = i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19_q[31:0];

    // i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27(ADD,64)@5
    assign i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_a = {1'b0, bgTrunc_i_reduction_dot16_latency_unconstrained_0_dot16_latency_unconstrained19_sel_x_b};
    assign i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_b = {1'b0, bgTrunc_i_reduction_dot16_latency_unconstrained_1_dot16_latency_unconstrained20_sel_x_b};
    assign i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_o = $unsigned(i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_a) + $unsigned(i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_b);
    assign i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_q = i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_o[32:0];

    // bgTrunc_i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_sel_x(BITSELECT,96)@5
    assign bgTrunc_i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_sel_x_b = i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_q[31:0];

    // redist2_bgTrunc_i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_sel_x_b_1(DELAY,453)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist2_bgTrunc_i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist2_bgTrunc_i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_sel_x_b_1_q <= $unsigned(bgTrunc_i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_sel_x_b);
        end
    end

    // i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31(ADD,54)@6
    assign i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31_a = {1'b0, redist2_bgTrunc_i_reduction_dot16_latency_unconstrained_8_dot16_latency_unconstrained27_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31_b = {1'b0, redist1_bgTrunc_i_reduction_dot16_latency_unconstrained_9_dot16_latency_unconstrained28_sel_x_b_1_q};
    assign i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31_o = $unsigned(i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31_a) + $unsigned(i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31_b);
    assign i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31_q = i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31_o[32:0];

    // bgTrunc_i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31_sel_x(BITSELECT,86)@6
    assign bgTrunc_i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31_sel_x_b = i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31_q[31:0];

    // i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33(ADD,56)@6
    assign i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33_a = {1'b0, bgTrunc_i_reduction_dot16_latency_unconstrained_12_dot16_latency_unconstrained31_sel_x_b};
    assign i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33_b = {1'b0, bgTrunc_i_reduction_dot16_latency_unconstrained_13_dot16_latency_unconstrained32_sel_x_b};
    assign i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33_o = $unsigned(i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33_a) + $unsigned(i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33_b);
    assign i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33_q = i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33_o[32:0];

    // bgTrunc_i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33_sel_x(BITSELECT,88)@6
    assign bgTrunc_i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33_sel_x_b = i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33_q[31:0];

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // sync_out_aunroll_x(GPOUT,98)@6
    assign out_c1_exi1_0_tpl = GND_q;
    assign out_c1_exi1_1_tpl = bgTrunc_i_reduction_dot16_latency_unconstrained_14_dot16_latency_unconstrained33_sel_x_b;
    assign out_o_valid = redist0_sync_together39_aunroll_x_in_i_valid_5_q;
    assign out_unnamed_dot16_latency_unconstrained1 = GND_q;

endmodule
