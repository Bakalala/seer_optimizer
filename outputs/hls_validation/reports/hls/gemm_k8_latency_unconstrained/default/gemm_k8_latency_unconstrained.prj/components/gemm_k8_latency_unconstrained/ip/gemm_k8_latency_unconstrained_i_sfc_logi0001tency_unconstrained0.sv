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

// SystemVerilog created from gemm_k8_latency_unconstrained_i_sfc_logi0001tency_unconstrained0
// SystemVerilog created on Wed Apr 15 12:32:33 2026


(* altera_attribute = "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007; -name MESSAGE_DISABLE 10958" *)
module gemm_k8_latency_unconstrained_i_sfc_logi0001tency_unconstrained0 (
    output wire [0:0] out_c1_exi1_0_tpl,
    output wire [31:0] out_c1_exi1_1_tpl,
    output wire [0:0] out_o_valid,
    output wire [0:0] out_unnamed_gemm_k8_latency_unconstrained1,
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
    input wire [0:0] in_enable,
    input wire [0:0] in_i_valid,
    input wire clock,
    input wire resetn
    );

    wire [0:0] GND_q;
    wire [0:0] VCC_q;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11_a;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11_b;
    logic [32:0] i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11_o;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11_q;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12_a;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12_b;
    logic [32:0] i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12_o;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12_q;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13_a;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13_b;
    logic [32:0] i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13_o;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13_q;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14_a;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14_b;
    logic [32:0] i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14_o;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14_q;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_a;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_b;
    logic [32:0] i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_o;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_q;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_a;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_b;
    logic [32:0] i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_o;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_q;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17_a;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17_b;
    logic [32:0] i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17_o;
    wire [32:0] i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17_q;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sel_x_b;
    wire [63:0] bgTrunc_i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sel_x_in;
    wire [31:0] bgTrunc_i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_sel_x_b;
    wire [31:0] bgTrunc_i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17_sel_x_b;
    wire [63:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_result_add_0_0_q;
    wire [63:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_join_0_q;
    wire [50:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_align_1_q;
    wire [50:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_align_1_qint;
    wire [64:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_result_add_0_0_a;
    wire [64:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_result_add_0_0_b;
    logic [64:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_result_add_0_0_o;
    wire [64:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_result_add_0_0_q;
    wire i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_q;
    wire i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_q;
    wire i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_q;
    wire i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_q;
    wire i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_q;
    wire i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_q;
    wire i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_q;
    wire i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_q;
    wire i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_q;
    wire i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_q;
    wire i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_q;
    wire i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_q;
    wire i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_q;
    wire i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_q;
    wire i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_a0;
    wire [13:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_c0;
    wire [27:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_s0;
    wire [27:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_qq;
    wire [27:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_q;
    wire i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_ena0;
    wire i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_ena1;
    wire i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_ena2;
    wire i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_reset;
    wire [17:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_c0;
    wire [35:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_s0;
    wire [35:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_qq;
    wire [35:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_q;
    wire i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_ena0;
    wire i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_ena1;
    wire i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_ena2;
    wire i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_ena2;
    wire i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_reset;
    wire [13:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_a0;
    wire [17:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_c0;
    wire [13:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_a1;
    wire [17:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_c1;
    wire [32:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_s0;
    wire [32:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_qq;
    wire [32:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_q;
    wire i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_ena0;
    wire i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_ena1;
    wire i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_ena2;
    wire [13:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs2_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs2_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs1_merged_bit_select_c;
    wire [13:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs1_merged_bit_select_b;
    wire [17:0] i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs1_merged_bit_select_c;
    reg [0:0] redist0_sync_together23_aunroll_x_in_i_valid_5_q;
    reg [0:0] redist0_sync_together23_aunroll_x_in_i_valid_5_delay_0;
    reg [0:0] redist0_sync_together23_aunroll_x_in_i_valid_5_delay_1;
    reg [0:0] redist0_sync_together23_aunroll_x_in_i_valid_5_delay_2;
    reg [0:0] redist0_sync_together23_aunroll_x_in_i_valid_5_delay_3;
    reg [31:0] redist1_bgTrunc_i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_sel_x_b_1_q;
    reg [31:0] redist2_bgTrunc_i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_sel_x_b_1_q;
    reg [31:0] redist3_bgTrunc_i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sel_x_b_1_q;
    reg [31:0] redist4_bgTrunc_i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sel_x_b_1_q;
    reg [31:0] redist5_bgTrunc_i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sel_x_b_1_q;
    reg [31:0] redist6_bgTrunc_i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sel_x_b_1_q;
    reg [31:0] redist7_bgTrunc_i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sel_x_b_1_q;
    reg [31:0] redist8_bgTrunc_i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sel_x_b_1_q;
    reg [31:0] redist9_bgTrunc_i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sel_x_b_1_q;
    reg [31:0] redist10_bgTrunc_i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sel_x_b_1_q;


    // redist0_sync_together23_aunroll_x_in_i_valid_5(DELAY,227)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist0_sync_together23_aunroll_x_in_i_valid_5_delay_0 <= '0;
            redist0_sync_together23_aunroll_x_in_i_valid_5_delay_1 <= '0;
            redist0_sync_together23_aunroll_x_in_i_valid_5_delay_2 <= '0;
            redist0_sync_together23_aunroll_x_in_i_valid_5_delay_3 <= '0;
            redist0_sync_together23_aunroll_x_in_i_valid_5_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist0_sync_together23_aunroll_x_in_i_valid_5_delay_0 <= $unsigned(in_i_valid);
            redist0_sync_together23_aunroll_x_in_i_valid_5_delay_1 <= redist0_sync_together23_aunroll_x_in_i_valid_5_delay_0;
            redist0_sync_together23_aunroll_x_in_i_valid_5_delay_2 <= redist0_sync_together23_aunroll_x_in_i_valid_5_delay_1;
            redist0_sync_together23_aunroll_x_in_i_valid_5_delay_3 <= redist0_sync_together23_aunroll_x_in_i_valid_5_delay_2;
            redist0_sync_together23_aunroll_x_in_i_valid_5_q <= redist0_sync_together23_aunroll_x_in_i_valid_5_delay_3;
        end
    end

    // VCC(CONSTANT,1)
    assign VCC_q = $unsigned(1'b1);

    // i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs2_merged_bit_select(BITSELECT,218)@1
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs2_merged_bit_select_b = in_c1_eni1_8_tpl[31:18];
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs2_merged_bit_select_c = in_c1_eni1_8_tpl[17:0];

    // i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs1_merged_bit_select(BITSELECT,226)@1
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs1_merged_bit_select_b = in_c1_eni1_16_tpl[31:18];
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs1_merged_bit_select_c = in_c1_eni1_16_tpl[17:0];

    // i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma(CHAINMULTADD,210)@1 + 3
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_ena1 = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_ena2 = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_a0 = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_c0 = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_a1 = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_c1 = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs1_merged_bit_select_c;
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
    ) i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_ena2, i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_ena1, i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_reset, i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_s0),
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
    i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_align_1(BITSHIFT,184)@4
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_align_1_qint = { i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_align_1_q = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma(CHAINMULTADD,201)@1 + 3
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_ena1 = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_ena2 = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_a0 = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_c0 = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs2_merged_bit_select_b;
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
    ) i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_ena2, i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_ena1, i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_reset, i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_s0),
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
    i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma(CHAINMULTADD,202)@1 + 3
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_ena1 = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_ena2 = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_a0 = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_c0 = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_bs2_merged_bit_select_c;
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
    ) i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_ena2, i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_ena1, i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_reset, i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_s0),
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
    i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_join_0(BITJOIN,183)@4
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_join_0_q = {i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im0_cma_q, i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_im8_cma_q};

    // i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_result_add_0_0(ADD,186)@4
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sel_x(BITSELECT,42)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sel_x_in = i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sel_x_in[31:0];

    // redist3_bgTrunc_i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sel_x_b_1(DELAY,230)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist3_bgTrunc_i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist3_bgTrunc_i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sel_x_b);
        end
    end

    // i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs2_merged_bit_select(BITSELECT,217)@1
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs2_merged_bit_select_b = in_c1_eni1_7_tpl[31:18];
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs2_merged_bit_select_c = in_c1_eni1_7_tpl[17:0];

    // i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs1_merged_bit_select(BITSELECT,225)@1
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs1_merged_bit_select_b = in_c1_eni1_15_tpl[31:18];
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs1_merged_bit_select_c = in_c1_eni1_15_tpl[17:0];

    // i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma(CHAINMULTADD,209)@1 + 3
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_ena1 = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_ena2 = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_a0 = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_c0 = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_a1 = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_c1 = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs1_merged_bit_select_c;
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
    ) i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_ena2, i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_ena1, i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_reset, i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_s0),
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
    i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_align_1(BITSHIFT,169)@4
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_align_1_qint = { i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_align_1_q = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma(CHAINMULTADD,199)@1 + 3
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_ena1 = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_ena2 = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_a0 = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_c0 = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs2_merged_bit_select_b;
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
    ) i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_ena2, i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_ena1, i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_reset, i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_s0),
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
    i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma(CHAINMULTADD,200)@1 + 3
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_ena1 = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_ena2 = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_a0 = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_c0 = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_bs2_merged_bit_select_c;
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
    ) i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_ena2, i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_ena1, i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_reset, i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_s0),
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
    i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_join_0(BITJOIN,168)@4
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_join_0_q = {i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im0_cma_q, i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_im8_cma_q};

    // i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_result_add_0_0(ADD,171)@4
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sel_x(BITSELECT,41)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sel_x_in = i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sel_x_in[31:0];

    // redist4_bgTrunc_i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sel_x_b_1(DELAY,231)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist4_bgTrunc_i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist4_bgTrunc_i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sel_x_b);
        end
    end

    // i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14(ADD,30)@5
    assign i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14_a = {1'b0, redist4_bgTrunc_i_mul_i_i_i_i_i_i270_gemm_k8_latency_unconstrained4_sel_x_b_1_q};
    assign i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14_b = {1'b0, redist3_bgTrunc_i_mul_i_i_i_i_i_i_gemm_k8_latency_unconstrained3_sel_x_b_1_q};
    assign i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14_o = $unsigned(i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14_a) + $unsigned(i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14_b);
    assign i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14_q = i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14_o[32:0];

    // bgTrunc_i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14_sel_x(BITSELECT,46)@5
    assign bgTrunc_i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14_sel_x_b = i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14_q[31:0];

    // i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs2_merged_bit_select(BITSELECT,216)@1
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs2_merged_bit_select_b = in_c1_eni1_6_tpl[31:18];
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs2_merged_bit_select_c = in_c1_eni1_6_tpl[17:0];

    // i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs1_merged_bit_select(BITSELECT,224)@1
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs1_merged_bit_select_b = in_c1_eni1_14_tpl[31:18];
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs1_merged_bit_select_c = in_c1_eni1_14_tpl[17:0];

    // i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma(CHAINMULTADD,208)@1 + 3
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_ena1 = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_ena2 = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_a0 = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_c0 = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_a1 = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_c1 = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs1_merged_bit_select_c;
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
    ) i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_ena2, i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_ena1, i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_reset, i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_s0),
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
    i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_align_1(BITSHIFT,154)@4
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_align_1_qint = { i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_align_1_q = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma(CHAINMULTADD,197)@1 + 3
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_ena1 = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_ena2 = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_a0 = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_c0 = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs2_merged_bit_select_b;
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
    ) i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_ena2, i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_ena1, i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_reset, i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_s0),
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
    i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma(CHAINMULTADD,198)@1 + 3
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_ena1 = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_ena2 = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_a0 = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_c0 = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_bs2_merged_bit_select_c;
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
    ) i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_ena2, i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_ena1, i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_reset, i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_s0),
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
    i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_join_0(BITJOIN,153)@4
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_join_0_q = {i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im0_cma_q, i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_im8_cma_q};

    // i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_result_add_0_0(ADD,156)@4
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sel_x(BITSELECT,40)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sel_x_in = i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sel_x_in[31:0];

    // redist5_bgTrunc_i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sel_x_b_1(DELAY,232)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist5_bgTrunc_i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist5_bgTrunc_i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sel_x_b);
        end
    end

    // i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs2_merged_bit_select(BITSELECT,215)@1
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs2_merged_bit_select_b = in_c1_eni1_5_tpl[31:18];
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs2_merged_bit_select_c = in_c1_eni1_5_tpl[17:0];

    // i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs1_merged_bit_select(BITSELECT,223)@1
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs1_merged_bit_select_b = in_c1_eni1_13_tpl[31:18];
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs1_merged_bit_select_c = in_c1_eni1_13_tpl[17:0];

    // i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma(CHAINMULTADD,207)@1 + 3
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_ena1 = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_ena2 = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_a0 = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_c0 = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_a1 = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_c1 = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs1_merged_bit_select_c;
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
    ) i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_ena2, i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_ena1, i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_reset, i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_s0),
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
    i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_align_1(BITSHIFT,139)@4
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_align_1_qint = { i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_align_1_q = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma(CHAINMULTADD,195)@1 + 3
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_ena1 = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_ena2 = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_a0 = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_c0 = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs2_merged_bit_select_b;
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
    ) i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_ena2, i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_ena1, i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_reset, i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_s0),
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
    i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma(CHAINMULTADD,196)@1 + 3
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_ena1 = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_ena2 = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_a0 = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_c0 = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_bs2_merged_bit_select_c;
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
    ) i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_ena2, i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_ena1, i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_reset, i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_s0),
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
    i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_join_0(BITJOIN,138)@4
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_join_0_q = {i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im0_cma_q, i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_im8_cma_q};

    // i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_result_add_0_0(ADD,141)@4
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sel_x(BITSELECT,39)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sel_x_in = i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sel_x_in[31:0];

    // redist6_bgTrunc_i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sel_x_b_1(DELAY,233)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist6_bgTrunc_i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist6_bgTrunc_i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sel_x_b);
        end
    end

    // i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13(ADD,29)@5
    assign i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13_a = {1'b0, redist6_bgTrunc_i_mul_i_i_i_i_i_i242_gemm_k8_latency_unconstrained6_sel_x_b_1_q};
    assign i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13_b = {1'b0, redist5_bgTrunc_i_mul_i_i_i_i_i_i256_gemm_k8_latency_unconstrained5_sel_x_b_1_q};
    assign i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13_o = $unsigned(i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13_a) + $unsigned(i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13_b);
    assign i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13_q = i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13_o[32:0];

    // bgTrunc_i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13_sel_x(BITSELECT,45)@5
    assign bgTrunc_i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13_sel_x_b = i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13_q[31:0];

    // i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16(ADD,32)@5
    assign i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_a = {1'b0, bgTrunc_i_reduction_gemm_k8_latency_unconstrained_2_gemm_k8_latency_unconstrained13_sel_x_b};
    assign i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_b = {1'b0, bgTrunc_i_reduction_gemm_k8_latency_unconstrained_3_gemm_k8_latency_unconstrained14_sel_x_b};
    assign i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_o = $unsigned(i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_a) + $unsigned(i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_b);
    assign i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_q = i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_o[32:0];

    // bgTrunc_i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_sel_x(BITSELECT,48)@5
    assign bgTrunc_i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_sel_x_b = i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_q[31:0];

    // redist1_bgTrunc_i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_sel_x_b_1(DELAY,228)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist1_bgTrunc_i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist1_bgTrunc_i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_sel_x_b_1_q <= $unsigned(bgTrunc_i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_sel_x_b);
        end
    end

    // i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs2_merged_bit_select(BITSELECT,214)@1
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs2_merged_bit_select_b = in_c1_eni1_4_tpl[31:18];
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs2_merged_bit_select_c = in_c1_eni1_4_tpl[17:0];

    // i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs1_merged_bit_select(BITSELECT,222)@1
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs1_merged_bit_select_b = in_c1_eni1_12_tpl[31:18];
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs1_merged_bit_select_c = in_c1_eni1_12_tpl[17:0];

    // i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma(CHAINMULTADD,206)@1 + 3
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_ena1 = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_ena2 = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_a0 = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_c0 = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_a1 = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_c1 = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs1_merged_bit_select_c;
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
    ) i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_ena2, i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_ena1, i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_reset, i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_s0),
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
    i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_align_1(BITSHIFT,124)@4
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_align_1_qint = { i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_align_1_q = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma(CHAINMULTADD,193)@1 + 3
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_ena1 = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_ena2 = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_a0 = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_c0 = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs2_merged_bit_select_b;
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
    ) i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_ena2, i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_ena1, i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_reset, i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_s0),
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
    i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma(CHAINMULTADD,194)@1 + 3
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_ena1 = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_ena2 = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_a0 = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_c0 = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_bs2_merged_bit_select_c;
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
    ) i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_ena2, i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_ena1, i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_reset, i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_s0),
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
    i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_join_0(BITJOIN,123)@4
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_join_0_q = {i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im0_cma_q, i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_im8_cma_q};

    // i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_result_add_0_0(ADD,126)@4
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sel_x(BITSELECT,38)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sel_x_in = i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sel_x_in[31:0];

    // redist7_bgTrunc_i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sel_x_b_1(DELAY,234)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist7_bgTrunc_i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist7_bgTrunc_i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sel_x_b);
        end
    end

    // i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs2_merged_bit_select(BITSELECT,213)@1
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs2_merged_bit_select_b = in_c1_eni1_3_tpl[31:18];
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs2_merged_bit_select_c = in_c1_eni1_3_tpl[17:0];

    // i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs1_merged_bit_select(BITSELECT,221)@1
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs1_merged_bit_select_b = in_c1_eni1_11_tpl[31:18];
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs1_merged_bit_select_c = in_c1_eni1_11_tpl[17:0];

    // i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma(CHAINMULTADD,205)@1 + 3
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_ena1 = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_ena2 = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_a0 = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_c0 = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_a1 = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_c1 = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs1_merged_bit_select_c;
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
    ) i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_ena2, i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_ena1, i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_reset, i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_s0),
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
    i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_align_1(BITSHIFT,109)@4
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_align_1_qint = { i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_align_1_q = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma(CHAINMULTADD,191)@1 + 3
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_ena1 = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_ena2 = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_a0 = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_c0 = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs2_merged_bit_select_b;
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
    ) i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_ena2, i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_ena1, i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_reset, i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_s0),
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
    i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma(CHAINMULTADD,192)@1 + 3
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_ena1 = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_ena2 = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_a0 = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_c0 = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_bs2_merged_bit_select_c;
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
    ) i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_ena2, i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_ena1, i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_reset, i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_s0),
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
    i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_join_0(BITJOIN,108)@4
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_join_0_q = {i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im0_cma_q, i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_im8_cma_q};

    // i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_result_add_0_0(ADD,111)@4
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sel_x(BITSELECT,37)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sel_x_in = i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sel_x_in[31:0];

    // redist8_bgTrunc_i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sel_x_b_1(DELAY,235)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist8_bgTrunc_i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist8_bgTrunc_i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sel_x_b);
        end
    end

    // i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12(ADD,28)@5
    assign i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12_a = {1'b0, redist8_bgTrunc_i_mul_i_i_i_i_i_i214_gemm_k8_latency_unconstrained8_sel_x_b_1_q};
    assign i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12_b = {1'b0, redist7_bgTrunc_i_mul_i_i_i_i_i_i228_gemm_k8_latency_unconstrained7_sel_x_b_1_q};
    assign i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12_o = $unsigned(i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12_a) + $unsigned(i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12_b);
    assign i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12_q = i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12_o[32:0];

    // bgTrunc_i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12_sel_x(BITSELECT,44)@5
    assign bgTrunc_i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12_sel_x_b = i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12_q[31:0];

    // i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs2_merged_bit_select(BITSELECT,211)@1
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs2_merged_bit_select_b = in_c1_eni1_1_tpl[31:18];
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs2_merged_bit_select_c = in_c1_eni1_1_tpl[17:0];

    // i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs1_merged_bit_select(BITSELECT,219)@1
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs1_merged_bit_select_b = in_c1_eni1_9_tpl[31:18];
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs1_merged_bit_select_c = in_c1_eni1_9_tpl[17:0];

    // i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma(CHAINMULTADD,204)@1 + 3
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_ena1 = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_ena2 = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_a0 = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_c0 = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_a1 = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_c1 = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs1_merged_bit_select_c;
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
    ) i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_ena2, i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_ena1, i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_reset, i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_s0),
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
    i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_align_1(BITSHIFT,94)@4
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_align_1_qint = { i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_align_1_q = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma(CHAINMULTADD,189)@1 + 3
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_ena1 = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_ena2 = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_a0 = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_c0 = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs2_merged_bit_select_b;
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
    ) i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_ena2, i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_ena1, i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_reset, i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_s0),
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
    i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma(CHAINMULTADD,190)@1 + 3
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_ena1 = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_ena2 = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_a0 = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_c0 = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_bs2_merged_bit_select_c;
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
    ) i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_ena2, i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_ena1, i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_reset, i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_s0),
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
    i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_join_0(BITJOIN,93)@4
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_join_0_q = {i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im0_cma_q, i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_im8_cma_q};

    // i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_result_add_0_0(ADD,96)@4
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sel_x(BITSELECT,36)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sel_x_in = i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sel_x_in[31:0];

    // redist9_bgTrunc_i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sel_x_b_1(DELAY,236)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist9_bgTrunc_i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist9_bgTrunc_i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sel_x_b);
        end
    end

    // i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs2_merged_bit_select(BITSELECT,212)@1
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs2_merged_bit_select_b = in_c1_eni1_2_tpl[31:18];
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs2_merged_bit_select_c = in_c1_eni1_2_tpl[17:0];

    // i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs1_merged_bit_select(BITSELECT,220)@1
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs1_merged_bit_select_b = in_c1_eni1_10_tpl[31:18];
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs1_merged_bit_select_c = in_c1_eni1_10_tpl[17:0];

    // i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma(CHAINMULTADD,203)@1 + 3
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_ena1 = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_ena0;
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_ena2 = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_ena0;

    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_a0 = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_c0 = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs2_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_a1 = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs2_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_c1 = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs1_merged_bit_select_c;
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
    ) i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_ena2, i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_ena1, i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_reset, i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_a1),
        .by(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_a0),
        .ax(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_c1),
        .bx(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_s0),
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
    i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_delay ( .xin(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_s0), .xout(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_q = $unsigned(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_qq[32:0]);

    // i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_align_1(BITSHIFT,79)@4
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_align_1_qint = { i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_ma3_cma_q, 18'b000000000000000000 };
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_align_1_q = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_align_1_qint[50:0];

    // i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma(CHAINMULTADD,187)@1 + 3
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_ena1 = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_ena0;
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_ena2 = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_ena0;

    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_a0 = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs1_merged_bit_select_b;
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_c0 = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs2_merged_bit_select_b;
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
    ) i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_ena2, i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_ena1, i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_reset, i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_a0),
        .ax(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_s0),
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
    i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_delay ( .xin(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_s0), .xout(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_q = $unsigned(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_qq[27:0]);

    // i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma(CHAINMULTADD,188)@1 + 3
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_reset = ~ (resetn);
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_ena0 = in_enable[0];
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_ena1 = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_ena0;
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_ena2 = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_ena0;

    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_a0 = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs1_merged_bit_select_c;
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_c0 = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_bs2_merged_bit_select_c;
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
    ) i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_DSP0 (
        .clk({clock,clock,clock}),
        .ena({ i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_ena2, i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_ena1, i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_ena0 }),
        .aclr({ i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_reset, i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_reset }),
        .ay(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_a0),
        .ax(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_c0),
        .resulta(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_s0),
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
    i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_delay ( .xin(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_s0), .xout(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_qq), .ena(in_enable[0]), .clk(clock), .aclr(resetn) );
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_q = $unsigned(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_qq[35:0]);

    // i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_join_0(BITJOIN,78)@4
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_join_0_q = {i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im0_cma_q, i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_im8_cma_q};

    // i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_result_add_0_0(ADD,81)@4
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_result_add_0_0_a = {1'b0, i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_join_0_q};
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_result_add_0_0_b = {14'b00000000000000, i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_align_1_q};
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_result_add_0_0_o = $unsigned(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_result_add_0_0_a) + $unsigned(i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_result_add_0_0_b);
    assign i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_result_add_0_0_q = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_result_add_0_0_o[64:0];

    // bgTrunc_i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sel_x(BITSELECT,35)@4
    assign bgTrunc_i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sel_x_in = i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sums_result_add_0_0_q[63:0];
    assign bgTrunc_i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sel_x_b = bgTrunc_i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sel_x_in[31:0];

    // redist10_bgTrunc_i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sel_x_b_1(DELAY,237)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist10_bgTrunc_i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist10_bgTrunc_i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sel_x_b_1_q <= $unsigned(bgTrunc_i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sel_x_b);
        end
    end

    // i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11(ADD,27)@5
    assign i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11_a = {1'b0, redist10_bgTrunc_i_mul_i_i_i_i_i_i186_gemm_k8_latency_unconstrained10_sel_x_b_1_q};
    assign i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11_b = {1'b0, redist9_bgTrunc_i_mul_i_i_i_i_i_i200_gemm_k8_latency_unconstrained9_sel_x_b_1_q};
    assign i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11_o = $unsigned(i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11_a) + $unsigned(i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11_b);
    assign i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11_q = i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11_o[32:0];

    // bgTrunc_i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11_sel_x(BITSELECT,43)@5
    assign bgTrunc_i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11_sel_x_b = i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11_q[31:0];

    // i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15(ADD,31)@5
    assign i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_a = {1'b0, bgTrunc_i_reduction_gemm_k8_latency_unconstrained_0_gemm_k8_latency_unconstrained11_sel_x_b};
    assign i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_b = {1'b0, bgTrunc_i_reduction_gemm_k8_latency_unconstrained_1_gemm_k8_latency_unconstrained12_sel_x_b};
    assign i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_o = $unsigned(i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_a) + $unsigned(i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_b);
    assign i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_q = i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_o[32:0];

    // bgTrunc_i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_sel_x(BITSELECT,47)@5
    assign bgTrunc_i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_sel_x_b = i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_q[31:0];

    // redist2_bgTrunc_i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_sel_x_b_1(DELAY,229)
    always @ (posedge clock or negedge resetn)
    begin
        if (!resetn)
        begin
            redist2_bgTrunc_i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_sel_x_b_1_q <= '0;
        end
        else if (in_enable == 1'b1)
        begin
            redist2_bgTrunc_i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_sel_x_b_1_q <= $unsigned(bgTrunc_i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_sel_x_b);
        end
    end

    // i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17(ADD,33)@6
    assign i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17_a = {1'b0, redist2_bgTrunc_i_reduction_gemm_k8_latency_unconstrained_4_gemm_k8_latency_unconstrained15_sel_x_b_1_q};
    assign i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17_b = {1'b0, redist1_bgTrunc_i_reduction_gemm_k8_latency_unconstrained_5_gemm_k8_latency_unconstrained16_sel_x_b_1_q};
    assign i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17_o = $unsigned(i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17_a) + $unsigned(i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17_b);
    assign i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17_q = i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17_o[32:0];

    // bgTrunc_i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17_sel_x(BITSELECT,49)@6
    assign bgTrunc_i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17_sel_x_b = i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17_q[31:0];

    // GND(CONSTANT,0)
    assign GND_q = $unsigned(1'b0);

    // sync_out_aunroll_x(GPOUT,50)@6
    assign out_c1_exi1_0_tpl = GND_q;
    assign out_c1_exi1_1_tpl = bgTrunc_i_reduction_gemm_k8_latency_unconstrained_6_gemm_k8_latency_unconstrained17_sel_x_b;
    assign out_o_valid = redist0_sync_together23_aunroll_x_in_i_valid_5_q;
    assign out_unnamed_gemm_k8_latency_unconstrained1 = GND_q;

endmodule
