//lpm_mult CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" CBX_SINGLE_OUTPUT_FILE="OFF" DEDICATED_MULTIPLIER_CIRCUITRY="NO" DEVICE_FAMILY="Arria 10" INPUT_A_IS_CONSTANT="NO" INPUT_B_IS_CONSTANT="NO" LPM_REPRESENTATION="SIGNED" LPM_WIDTHA=32 LPM_WIDTHB=32 LPM_WIDTHP=64 LPM_WIDTHS=1 MAXIMIZE_SPEED=5 dataa datab result CARRY_CHAIN="MANUAL"
//VERSION_BEGIN 19.2 cbx_lpm_add_sub 2019:06:24:17:05:52:SJ cbx_lpm_mult 2019:06:24:17:05:52:SJ cbx_mgl 2019:06:24:18:19:52:SJ cbx_nadder 2019:06:24:17:05:52:SJ cbx_padd 2019:06:24:17:05:52:SJ cbx_stratix 2019:06:24:17:05:52:SJ cbx_stratixii 2019:06:24:17:05:52:SJ cbx_util_mgl 2019:06:24:17:05:52:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 2019  Intel Corporation. All rights reserved.
//  Your use of Intel Corporation's design tools, logic functions 
//  and other software and tools, and any partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Intel Program License 
//  Subscription Agreement, the Intel Quartus Prime License Agreement,
//  the Intel FPGA IP License Agreement, or other applicable license
//  agreement, including, without limitation, that your use is for
//  the sole purpose of programming logic devices manufactured by
//  Intel and sold by Intel or its authorized distributors.  Please
//  refer to the applicable agreement for further details, at
//  https://fpgasoftware.intel.com/eula.



//synthesis_resources = lut 1106 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mult_edu
	( 
	dataa,
	datab,
	result) /* synthesis synthesis_clearbox=1 */;
	input   [31:0]  dataa;
	input   [31:0]  datab;
	output   [63:0]  result;

	wire	[47:0]	wire_add12_result;
	wire	[39:0]	wire_add17_result;
	wire	[62:0]	wire_add2_result;
	wire	[31:0]	wire_add22_result;
	wire	[23:0]	wire_add27_result;
	wire	[15:0]	wire_add32_result;
	wire	[9:0]	wire_add37_result;
	wire	[55:0]	wire_add7_result;
	wire	[32:0]	wire_sum_adder1aa_0dataa;
	wire	[32:0]	wire_sum_adder1aa_0datab;
	wire	[32:0]	wire_sum_adder1aa_0result;
	wire	[32:0]	wire_sum_adder1aa_1dataa;
	wire	[32:0]	wire_sum_adder1aa_1datab;
	wire	[32:0]	wire_sum_adder1aa_1result;
	wire	[32:0]	wire_sum_adder1aa_2dataa;
	wire	[32:0]	wire_sum_adder1aa_2datab;
	wire	[32:0]	wire_sum_adder1aa_2result;
	wire	[32:0]	wire_sum_adder1aa_3dataa;
	wire	[32:0]	wire_sum_adder1aa_3datab;
	wire	[32:0]	wire_sum_adder1aa_3result;
	wire	[32:0]	wire_sum_adder1aa_4dataa;
	wire	[32:0]	wire_sum_adder1aa_4datab;
	wire	[32:0]	wire_sum_adder1aa_4result;
	wire	[32:0]	wire_sum_adder1aa_5dataa;
	wire	[32:0]	wire_sum_adder1aa_5datab;
	wire	[32:0]	wire_sum_adder1aa_5result;
	wire	[32:0]	wire_sum_adder1aa_6dataa;
	wire	[32:0]	wire_sum_adder1aa_6datab;
	wire	[32:0]	wire_sum_adder1aa_6result;
	wire	[32:0]	wire_sum_adder1aa_7dataa;
	wire	[32:0]	wire_sum_adder1aa_7datab;
	wire	[32:0]	wire_sum_adder1aa_7result;
	wire	[32:0]	wire_sum_adder1aa_8dataa;
	wire	[32:0]	wire_sum_adder1aa_8datab;
	wire	[32:0]	wire_sum_adder1aa_8result;
	wire	[32:0]	wire_sum_adder1aa_9dataa;
	wire	[32:0]	wire_sum_adder1aa_9datab;
	wire	[32:0]	wire_sum_adder1aa_9result;
	wire	[32:0]	wire_sum_adder1aa_10dataa;
	wire	[32:0]	wire_sum_adder1aa_10datab;
	wire	[32:0]	wire_sum_adder1aa_10result;
	wire	[32:0]	wire_sum_adder1aa_11dataa;
	wire	[32:0]	wire_sum_adder1aa_11datab;
	wire	[32:0]	wire_sum_adder1aa_11result;
	wire	[32:0]	wire_sum_adder1aa_12dataa;
	wire	[32:0]	wire_sum_adder1aa_12datab;
	wire	[32:0]	wire_sum_adder1aa_12result;
	wire	[32:0]	wire_sum_adder1aa_13dataa;
	wire	[32:0]	wire_sum_adder1aa_13datab;
	wire	[32:0]	wire_sum_adder1aa_13result;
	wire	[32:0]	wire_sum_adder1aa_14dataa;
	wire	[32:0]	wire_sum_adder1aa_14datab;
	wire	[32:0]	wire_sum_adder1aa_14result;
	wire	[33:0]	wire_sum_adder1aa_15result_int;
	wire	wire_sum_adder1aa_15cin;
	wire	[32:0]	wire_sum_adder1aa_15dataa;
	wire	[32:0]	wire_sum_adder1aa_15datab;
	wire	[32:0]	wire_sum_adder1aa_15result;
	wire  [55:0]   wire_sft10a_in;
	wire  [55:0]   wire_sft10a_out;
	wire  [55:0]   wire_sft11a_in;
	wire  [55:0]   wire_sft11a_out;
	wire  [47:0]   wire_sft13a_in;
	wire  [47:0]   wire_sft13a_out;
	wire  [47:0]   wire_sft14a_in;
	wire  [47:0]   wire_sft14a_out;
	wire  [47:0]   wire_sft15a_in;
	wire  [47:0]   wire_sft15a_out;
	wire  [47:0]   wire_sft16a_in;
	wire  [47:0]   wire_sft16a_out;
	wire  [39:0]   wire_sft18a_in;
	wire  [39:0]   wire_sft18a_out;
	wire  [39:0]   wire_sft19a_in;
	wire  [39:0]   wire_sft19a_out;
	wire  [39:0]   wire_sft20a_in;
	wire  [39:0]   wire_sft20a_out;
	wire  [39:0]   wire_sft21a_in;
	wire  [39:0]   wire_sft21a_out;
	wire  [31:0]   wire_sft23a_in;
	wire  [31:0]   wire_sft23a_out;
	wire  [31:0]   wire_sft24a_in;
	wire  [31:0]   wire_sft24a_out;
	wire  [31:0]   wire_sft25a_in;
	wire  [31:0]   wire_sft25a_out;
	wire  [31:0]   wire_sft26a_in;
	wire  [31:0]   wire_sft26a_out;
	wire  [23:0]   wire_sft28a_in;
	wire  [23:0]   wire_sft28a_out;
	wire  [23:0]   wire_sft29a_in;
	wire  [23:0]   wire_sft29a_out;
	wire  [23:0]   wire_sft30a_in;
	wire  [23:0]   wire_sft30a_out;
	wire  [23:0]   wire_sft31a_in;
	wire  [23:0]   wire_sft31a_out;
	wire  [15:0]   wire_sft33a_in;
	wire  [15:0]   wire_sft33a_out;
	wire  [15:0]   wire_sft34a_in;
	wire  [15:0]   wire_sft34a_out;
	wire  [15:0]   wire_sft35a_in;
	wire  [15:0]   wire_sft35a_out;
	wire  [15:0]   wire_sft36a_in;
	wire  [15:0]   wire_sft36a_out;
	wire  [9:0]   wire_sft38a_in;
	wire  [9:0]   wire_sft38a_out;
	wire  [9:0]   wire_sft39a_in;
	wire  [9:0]   wire_sft39a_out;
	wire  [62:0]   wire_sft3a_in;
	wire  [62:0]   wire_sft3a_out;
	wire  [9:0]   wire_sft40a_in;
	wire  [9:0]   wire_sft40a_out;
	wire  [9:0]   wire_sft41a_in;
	wire  [9:0]   wire_sft41a_out;
	wire  [62:0]   wire_sft4a_in;
	wire  [62:0]   wire_sft4a_out;
	wire  [62:0]   wire_sft5a_in;
	wire  [62:0]   wire_sft5a_out;
	wire  [62:0]   wire_sft6a_in;
	wire  [62:0]   wire_sft6a_out;
	wire  [55:0]   wire_sft8a_in;
	wire  [55:0]   wire_sft8a_out;
	wire  [55:0]   wire_sft9a_in;
	wire  [55:0]   wire_sft9a_out;
	wire  [31:0]  dataa_node;
	wire  [31:0]  datab_node;
	wire  [63:0]  final_result_node;
	wire  w1159w;
	wire  w1191w;
	wire  [64:0]  w2342w;
	wire  [1023:0]  w_decoder_node9w;
	wire  [31:0]  w_le_datab_node8w;
	wire  [543:0]  w_sum_node10w;

	assign
		wire_add12_result = wire_sft13a_out + wire_sft14a_out + wire_sft15a_out;
	assign
		wire_add17_result = wire_sft18a_out + wire_sft19a_out + wire_sft20a_out;
	assign
		wire_add2_result = wire_sft3a_out + wire_sft4a_out + wire_sft5a_out;
	assign
		wire_add22_result = wire_sft23a_out + wire_sft24a_out + wire_sft25a_out;
	assign
		wire_add27_result = wire_sft28a_out + wire_sft29a_out + wire_sft30a_out;
	assign
		wire_add32_result = wire_sft33a_out + wire_sft34a_out + wire_sft35a_out;
	assign
		wire_add37_result = wire_sft38a_out + wire_sft39a_out + wire_sft40a_out;
	assign
		wire_add7_result = wire_sft8a_out + wire_sft9a_out + wire_sft10a_out;
	assign
		wire_sum_adder1aa_0result = wire_sum_adder1aa_0dataa + wire_sum_adder1aa_0datab;
	assign
		wire_sum_adder1aa_0dataa = {w_decoder_node9w[63], w_decoder_node9w[63:32]},
		wire_sum_adder1aa_0datab = {{2{w_decoder_node9w[31]}}, w_decoder_node9w[31:1]};
	assign
		wire_sum_adder1aa_1result = wire_sum_adder1aa_1dataa + wire_sum_adder1aa_1datab;
	assign
		wire_sum_adder1aa_1dataa = {w_decoder_node9w[127], w_decoder_node9w[127:96]},
		wire_sum_adder1aa_1datab = {{2{w_decoder_node9w[95]}}, w_decoder_node9w[95:65]};
	assign
		wire_sum_adder1aa_2result = wire_sum_adder1aa_2dataa + wire_sum_adder1aa_2datab;
	assign
		wire_sum_adder1aa_2dataa = {w_decoder_node9w[191], w_decoder_node9w[191:160]},
		wire_sum_adder1aa_2datab = {{2{w_decoder_node9w[159]}}, w_decoder_node9w[159:129]};
	assign
		wire_sum_adder1aa_3result = wire_sum_adder1aa_3dataa + wire_sum_adder1aa_3datab;
	assign
		wire_sum_adder1aa_3dataa = {w_decoder_node9w[255], w_decoder_node9w[255:224]},
		wire_sum_adder1aa_3datab = {{2{w_decoder_node9w[223]}}, w_decoder_node9w[223:193]};
	assign
		wire_sum_adder1aa_4result = wire_sum_adder1aa_4dataa + wire_sum_adder1aa_4datab;
	assign
		wire_sum_adder1aa_4dataa = {w_decoder_node9w[319], w_decoder_node9w[319:288]},
		wire_sum_adder1aa_4datab = {{2{w_decoder_node9w[287]}}, w_decoder_node9w[287:257]};
	assign
		wire_sum_adder1aa_5result = wire_sum_adder1aa_5dataa + wire_sum_adder1aa_5datab;
	assign
		wire_sum_adder1aa_5dataa = {w_decoder_node9w[383], w_decoder_node9w[383:352]},
		wire_sum_adder1aa_5datab = {{2{w_decoder_node9w[351]}}, w_decoder_node9w[351:321]};
	assign
		wire_sum_adder1aa_6result = wire_sum_adder1aa_6dataa + wire_sum_adder1aa_6datab;
	assign
		wire_sum_adder1aa_6dataa = {w_decoder_node9w[447], w_decoder_node9w[447:416]},
		wire_sum_adder1aa_6datab = {{2{w_decoder_node9w[415]}}, w_decoder_node9w[415:385]};
	assign
		wire_sum_adder1aa_7result = wire_sum_adder1aa_7dataa + wire_sum_adder1aa_7datab;
	assign
		wire_sum_adder1aa_7dataa = {w_decoder_node9w[511], w_decoder_node9w[511:480]},
		wire_sum_adder1aa_7datab = {{2{w_decoder_node9w[479]}}, w_decoder_node9w[479:449]};
	assign
		wire_sum_adder1aa_8result = wire_sum_adder1aa_8dataa + wire_sum_adder1aa_8datab;
	assign
		wire_sum_adder1aa_8dataa = {w_decoder_node9w[575], w_decoder_node9w[575:544]},
		wire_sum_adder1aa_8datab = {{2{w_decoder_node9w[543]}}, w_decoder_node9w[543:513]};
	assign
		wire_sum_adder1aa_9result = wire_sum_adder1aa_9dataa + wire_sum_adder1aa_9datab;
	assign
		wire_sum_adder1aa_9dataa = {w_decoder_node9w[639], w_decoder_node9w[639:608]},
		wire_sum_adder1aa_9datab = {{2{w_decoder_node9w[607]}}, w_decoder_node9w[607:577]};
	assign
		wire_sum_adder1aa_10result = wire_sum_adder1aa_10dataa + wire_sum_adder1aa_10datab;
	assign
		wire_sum_adder1aa_10dataa = {w_decoder_node9w[703], w_decoder_node9w[703:672]},
		wire_sum_adder1aa_10datab = {{2{w_decoder_node9w[671]}}, w_decoder_node9w[671:641]};
	assign
		wire_sum_adder1aa_11result = wire_sum_adder1aa_11dataa + wire_sum_adder1aa_11datab;
	assign
		wire_sum_adder1aa_11dataa = {w_decoder_node9w[767], w_decoder_node9w[767:736]},
		wire_sum_adder1aa_11datab = {{2{w_decoder_node9w[735]}}, w_decoder_node9w[735:705]};
	assign
		wire_sum_adder1aa_12result = wire_sum_adder1aa_12dataa + wire_sum_adder1aa_12datab;
	assign
		wire_sum_adder1aa_12dataa = {w_decoder_node9w[831], w_decoder_node9w[831:800]},
		wire_sum_adder1aa_12datab = {{2{w_decoder_node9w[799]}}, w_decoder_node9w[799:769]};
	assign
		wire_sum_adder1aa_13result = wire_sum_adder1aa_13dataa + wire_sum_adder1aa_13datab;
	assign
		wire_sum_adder1aa_13dataa = {w_decoder_node9w[895], w_decoder_node9w[895:864]},
		wire_sum_adder1aa_13datab = {{2{w_decoder_node9w[863]}}, w_decoder_node9w[863:833]};
	assign
		wire_sum_adder1aa_14result = wire_sum_adder1aa_14dataa + wire_sum_adder1aa_14datab;
	assign
		wire_sum_adder1aa_14dataa = {w_decoder_node9w[959], w_decoder_node9w[959:928]},
		wire_sum_adder1aa_14datab = {{2{w_decoder_node9w[927]}}, w_decoder_node9w[927:897]};
	assign
		wire_sum_adder1aa_15result_int = {wire_sum_adder1aa_15dataa, wire_sum_adder1aa_15cin} + {wire_sum_adder1aa_15datab, wire_sum_adder1aa_15cin};
	assign
		wire_sum_adder1aa_15result = wire_sum_adder1aa_15result_int[33:1];
	assign
		wire_sum_adder1aa_15cin = 1'b1,
		wire_sum_adder1aa_15dataa = {(~ w_decoder_node9w[1023]), (~ w_decoder_node9w[1023:992])},
		wire_sum_adder1aa_15datab = {{2{w_decoder_node9w[991]}}, w_decoder_node9w[991:961]};
	soft   sft10a0
	( 
	.in(wire_sft10a_in[0:0]),
	.out(wire_sft10a_out[0:0]));
	soft   sft10a1
	( 
	.in(wire_sft10a_in[1:1]),
	.out(wire_sft10a_out[1:1]));
	soft   sft10a2
	( 
	.in(wire_sft10a_in[2:2]),
	.out(wire_sft10a_out[2:2]));
	soft   sft10a3
	( 
	.in(wire_sft10a_in[3:3]),
	.out(wire_sft10a_out[3:3]));
	soft   sft10a4
	( 
	.in(wire_sft10a_in[4:4]),
	.out(wire_sft10a_out[4:4]));
	soft   sft10a5
	( 
	.in(wire_sft10a_in[5:5]),
	.out(wire_sft10a_out[5:5]));
	soft   sft10a6
	( 
	.in(wire_sft10a_in[6:6]),
	.out(wire_sft10a_out[6:6]));
	soft   sft10a7
	( 
	.in(wire_sft10a_in[7:7]),
	.out(wire_sft10a_out[7:7]));
	soft   sft10a8
	( 
	.in(wire_sft10a_in[8:8]),
	.out(wire_sft10a_out[8:8]));
	soft   sft10a9
	( 
	.in(wire_sft10a_in[9:9]),
	.out(wire_sft10a_out[9:9]));
	soft   sft10a10
	( 
	.in(wire_sft10a_in[10:10]),
	.out(wire_sft10a_out[10:10]));
	soft   sft10a11
	( 
	.in(wire_sft10a_in[11:11]),
	.out(wire_sft10a_out[11:11]));
	soft   sft10a12
	( 
	.in(wire_sft10a_in[12:12]),
	.out(wire_sft10a_out[12:12]));
	soft   sft10a13
	( 
	.in(wire_sft10a_in[13:13]),
	.out(wire_sft10a_out[13:13]));
	soft   sft10a14
	( 
	.in(wire_sft10a_in[14:14]),
	.out(wire_sft10a_out[14:14]));
	soft   sft10a15
	( 
	.in(wire_sft10a_in[15:15]),
	.out(wire_sft10a_out[15:15]));
	soft   sft10a16
	( 
	.in(wire_sft10a_in[16:16]),
	.out(wire_sft10a_out[16:16]));
	soft   sft10a17
	( 
	.in(wire_sft10a_in[17:17]),
	.out(wire_sft10a_out[17:17]));
	soft   sft10a18
	( 
	.in(wire_sft10a_in[18:18]),
	.out(wire_sft10a_out[18:18]));
	soft   sft10a19
	( 
	.in(wire_sft10a_in[19:19]),
	.out(wire_sft10a_out[19:19]));
	soft   sft10a20
	( 
	.in(wire_sft10a_in[20:20]),
	.out(wire_sft10a_out[20:20]));
	soft   sft10a21
	( 
	.in(wire_sft10a_in[21:21]),
	.out(wire_sft10a_out[21:21]));
	soft   sft10a22
	( 
	.in(wire_sft10a_in[22:22]),
	.out(wire_sft10a_out[22:22]));
	soft   sft10a23
	( 
	.in(wire_sft10a_in[23:23]),
	.out(wire_sft10a_out[23:23]));
	soft   sft10a24
	( 
	.in(wire_sft10a_in[24:24]),
	.out(wire_sft10a_out[24:24]));
	soft   sft10a25
	( 
	.in(wire_sft10a_in[25:25]),
	.out(wire_sft10a_out[25:25]));
	soft   sft10a26
	( 
	.in(wire_sft10a_in[26:26]),
	.out(wire_sft10a_out[26:26]));
	soft   sft10a27
	( 
	.in(wire_sft10a_in[27:27]),
	.out(wire_sft10a_out[27:27]));
	soft   sft10a28
	( 
	.in(wire_sft10a_in[28:28]),
	.out(wire_sft10a_out[28:28]));
	soft   sft10a29
	( 
	.in(wire_sft10a_in[29:29]),
	.out(wire_sft10a_out[29:29]));
	soft   sft10a30
	( 
	.in(wire_sft10a_in[30:30]),
	.out(wire_sft10a_out[30:30]));
	soft   sft10a31
	( 
	.in(wire_sft10a_in[31:31]),
	.out(wire_sft10a_out[31:31]));
	soft   sft10a32
	( 
	.in(wire_sft10a_in[32:32]),
	.out(wire_sft10a_out[32:32]));
	soft   sft10a33
	( 
	.in(wire_sft10a_in[33:33]),
	.out(wire_sft10a_out[33:33]));
	soft   sft10a34
	( 
	.in(wire_sft10a_in[34:34]),
	.out(wire_sft10a_out[34:34]));
	soft   sft10a35
	( 
	.in(wire_sft10a_in[35:35]),
	.out(wire_sft10a_out[35:35]));
	soft   sft10a36
	( 
	.in(wire_sft10a_in[36:36]),
	.out(wire_sft10a_out[36:36]));
	soft   sft10a37
	( 
	.in(wire_sft10a_in[37:37]),
	.out(wire_sft10a_out[37:37]));
	soft   sft10a38
	( 
	.in(wire_sft10a_in[38:38]),
	.out(wire_sft10a_out[38:38]));
	soft   sft10a39
	( 
	.in(wire_sft10a_in[39:39]),
	.out(wire_sft10a_out[39:39]));
	soft   sft10a40
	( 
	.in(wire_sft10a_in[40:40]),
	.out(wire_sft10a_out[40:40]));
	soft   sft10a41
	( 
	.in(wire_sft10a_in[41:41]),
	.out(wire_sft10a_out[41:41]));
	soft   sft10a42
	( 
	.in(wire_sft10a_in[42:42]),
	.out(wire_sft10a_out[42:42]));
	soft   sft10a43
	( 
	.in(wire_sft10a_in[43:43]),
	.out(wire_sft10a_out[43:43]));
	soft   sft10a44
	( 
	.in(wire_sft10a_in[44:44]),
	.out(wire_sft10a_out[44:44]));
	soft   sft10a45
	( 
	.in(wire_sft10a_in[45:45]),
	.out(wire_sft10a_out[45:45]));
	soft   sft10a46
	( 
	.in(wire_sft10a_in[46:46]),
	.out(wire_sft10a_out[46:46]));
	soft   sft10a47
	( 
	.in(wire_sft10a_in[47:47]),
	.out(wire_sft10a_out[47:47]));
	soft   sft10a48
	( 
	.in(wire_sft10a_in[48:48]),
	.out(wire_sft10a_out[48:48]));
	soft   sft10a49
	( 
	.in(wire_sft10a_in[49:49]),
	.out(wire_sft10a_out[49:49]));
	soft   sft10a50
	( 
	.in(wire_sft10a_in[50:50]),
	.out(wire_sft10a_out[50:50]));
	soft   sft10a51
	( 
	.in(wire_sft10a_in[51:51]),
	.out(wire_sft10a_out[51:51]));
	soft   sft10a52
	( 
	.in(wire_sft10a_in[52:52]),
	.out(wire_sft10a_out[52:52]));
	soft   sft10a53
	( 
	.in(wire_sft10a_in[53:53]),
	.out(wire_sft10a_out[53:53]));
	soft   sft10a54
	( 
	.in(wire_sft10a_in[54:54]),
	.out(wire_sft10a_out[54:54]));
	soft   sft10a55
	( 
	.in(wire_sft10a_in[55:55]),
	.out(wire_sft10a_out[55:55]));
	assign
		wire_sft10a_in = {w1191w, {w1191w, {w1191w, {w1191w, {(~ w_sum_node10w[441]), {w1159w, {w_sum_node10w[535], {w_sum_node10w[534], {w_sum_node10w[501], {w_sum_node10w[500], {w_sum_node10w[467], {w_sum_node10w[466], {wire_sft26a_out[31], {wire_sft26a_out[30], {wire_sft26a_out[29], {wire_sft26a_out[28], {wire_sft26a_out[27], {wire_sft26a_out[26], {wire_sft26a_out[25], {wire_sft26a_out[24], {wire_sft26a_out[23], {wire_sft26a_out[22], {wire_sft26a_out[21], {wire_sft26a_out[20], {wire_sft26a_out[19], {wire_sft26a_out[18], {wire_sft26a_out[17], {wire_sft31a_out[12], {wire_sft31a_out[11], {wire_sft31a_out[10], {wire_sft31a_out[9], {wire_sft31a_out[8], {wire_sft26a_out[11], {wire_sft26a_out[10], {wire_sft26a_out[9], {wire_sft26a_out[8], {wire_sft26a_out[7], {wire_sft26a_out[6], {wire_sft26a_out[5], {wire_sft26a_out[4], {wire_sft26a_out[3], {wire_sft26a_out[2], {wire_sft26a_out[1], {wire_sft26a_out[0], {w_sum_node10w[145], {w_sum_node10w[144], {w_sum_node10w[143], {w_sum_node10w[142], {w_sum_node10w[141], {w_sum_node10w[140], {w_sum_node10w[139], {w_sum_node10w[138], {w_sum_node10w[137], {w_sum_node10w[136], {2{w1191w}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft11a0
	( 
	.in(wire_sft11a_in[0:0]),
	.out(wire_sft11a_out[0:0]));
	soft   sft11a1
	( 
	.in(wire_sft11a_in[1:1]),
	.out(wire_sft11a_out[1:1]));
	soft   sft11a2
	( 
	.in(wire_sft11a_in[2:2]),
	.out(wire_sft11a_out[2:2]));
	soft   sft11a3
	( 
	.in(wire_sft11a_in[3:3]),
	.out(wire_sft11a_out[3:3]));
	soft   sft11a4
	( 
	.in(wire_sft11a_in[4:4]),
	.out(wire_sft11a_out[4:4]));
	soft   sft11a5
	( 
	.in(wire_sft11a_in[5:5]),
	.out(wire_sft11a_out[5:5]));
	soft   sft11a6
	( 
	.in(wire_sft11a_in[6:6]),
	.out(wire_sft11a_out[6:6]));
	soft   sft11a7
	( 
	.in(wire_sft11a_in[7:7]),
	.out(wire_sft11a_out[7:7]));
	soft   sft11a8
	( 
	.in(wire_sft11a_in[8:8]),
	.out(wire_sft11a_out[8:8]));
	soft   sft11a9
	( 
	.in(wire_sft11a_in[9:9]),
	.out(wire_sft11a_out[9:9]));
	soft   sft11a10
	( 
	.in(wire_sft11a_in[10:10]),
	.out(wire_sft11a_out[10:10]));
	soft   sft11a11
	( 
	.in(wire_sft11a_in[11:11]),
	.out(wire_sft11a_out[11:11]));
	soft   sft11a12
	( 
	.in(wire_sft11a_in[12:12]),
	.out(wire_sft11a_out[12:12]));
	soft   sft11a13
	( 
	.in(wire_sft11a_in[13:13]),
	.out(wire_sft11a_out[13:13]));
	soft   sft11a14
	( 
	.in(wire_sft11a_in[14:14]),
	.out(wire_sft11a_out[14:14]));
	soft   sft11a15
	( 
	.in(wire_sft11a_in[15:15]),
	.out(wire_sft11a_out[15:15]));
	soft   sft11a16
	( 
	.in(wire_sft11a_in[16:16]),
	.out(wire_sft11a_out[16:16]));
	soft   sft11a17
	( 
	.in(wire_sft11a_in[17:17]),
	.out(wire_sft11a_out[17:17]));
	soft   sft11a18
	( 
	.in(wire_sft11a_in[18:18]),
	.out(wire_sft11a_out[18:18]));
	soft   sft11a19
	( 
	.in(wire_sft11a_in[19:19]),
	.out(wire_sft11a_out[19:19]));
	soft   sft11a20
	( 
	.in(wire_sft11a_in[20:20]),
	.out(wire_sft11a_out[20:20]));
	soft   sft11a21
	( 
	.in(wire_sft11a_in[21:21]),
	.out(wire_sft11a_out[21:21]));
	soft   sft11a22
	( 
	.in(wire_sft11a_in[22:22]),
	.out(wire_sft11a_out[22:22]));
	soft   sft11a23
	( 
	.in(wire_sft11a_in[23:23]),
	.out(wire_sft11a_out[23:23]));
	soft   sft11a24
	( 
	.in(wire_sft11a_in[24:24]),
	.out(wire_sft11a_out[24:24]));
	soft   sft11a25
	( 
	.in(wire_sft11a_in[25:25]),
	.out(wire_sft11a_out[25:25]));
	soft   sft11a26
	( 
	.in(wire_sft11a_in[26:26]),
	.out(wire_sft11a_out[26:26]));
	soft   sft11a27
	( 
	.in(wire_sft11a_in[27:27]),
	.out(wire_sft11a_out[27:27]));
	soft   sft11a28
	( 
	.in(wire_sft11a_in[28:28]),
	.out(wire_sft11a_out[28:28]));
	soft   sft11a29
	( 
	.in(wire_sft11a_in[29:29]),
	.out(wire_sft11a_out[29:29]));
	soft   sft11a30
	( 
	.in(wire_sft11a_in[30:30]),
	.out(wire_sft11a_out[30:30]));
	soft   sft11a31
	( 
	.in(wire_sft11a_in[31:31]),
	.out(wire_sft11a_out[31:31]));
	soft   sft11a32
	( 
	.in(wire_sft11a_in[32:32]),
	.out(wire_sft11a_out[32:32]));
	soft   sft11a33
	( 
	.in(wire_sft11a_in[33:33]),
	.out(wire_sft11a_out[33:33]));
	soft   sft11a34
	( 
	.in(wire_sft11a_in[34:34]),
	.out(wire_sft11a_out[34:34]));
	soft   sft11a35
	( 
	.in(wire_sft11a_in[35:35]),
	.out(wire_sft11a_out[35:35]));
	soft   sft11a36
	( 
	.in(wire_sft11a_in[36:36]),
	.out(wire_sft11a_out[36:36]));
	soft   sft11a37
	( 
	.in(wire_sft11a_in[37:37]),
	.out(wire_sft11a_out[37:37]));
	soft   sft11a38
	( 
	.in(wire_sft11a_in[38:38]),
	.out(wire_sft11a_out[38:38]));
	soft   sft11a39
	( 
	.in(wire_sft11a_in[39:39]),
	.out(wire_sft11a_out[39:39]));
	soft   sft11a40
	( 
	.in(wire_sft11a_in[40:40]),
	.out(wire_sft11a_out[40:40]));
	soft   sft11a41
	( 
	.in(wire_sft11a_in[41:41]),
	.out(wire_sft11a_out[41:41]));
	soft   sft11a42
	( 
	.in(wire_sft11a_in[42:42]),
	.out(wire_sft11a_out[42:42]));
	soft   sft11a43
	( 
	.in(wire_sft11a_in[43:43]),
	.out(wire_sft11a_out[43:43]));
	soft   sft11a44
	( 
	.in(wire_sft11a_in[44:44]),
	.out(wire_sft11a_out[44:44]));
	soft   sft11a45
	( 
	.in(wire_sft11a_in[45:45]),
	.out(wire_sft11a_out[45:45]));
	soft   sft11a46
	( 
	.in(wire_sft11a_in[46:46]),
	.out(wire_sft11a_out[46:46]));
	soft   sft11a47
	( 
	.in(wire_sft11a_in[47:47]),
	.out(wire_sft11a_out[47:47]));
	soft   sft11a48
	( 
	.in(wire_sft11a_in[48:48]),
	.out(wire_sft11a_out[48:48]));
	soft   sft11a49
	( 
	.in(wire_sft11a_in[49:49]),
	.out(wire_sft11a_out[49:49]));
	soft   sft11a50
	( 
	.in(wire_sft11a_in[50:50]),
	.out(wire_sft11a_out[50:50]));
	soft   sft11a51
	( 
	.in(wire_sft11a_in[51:51]),
	.out(wire_sft11a_out[51:51]));
	soft   sft11a52
	( 
	.in(wire_sft11a_in[52:52]),
	.out(wire_sft11a_out[52:52]));
	soft   sft11a53
	( 
	.in(wire_sft11a_in[53:53]),
	.out(wire_sft11a_out[53:53]));
	soft   sft11a54
	( 
	.in(wire_sft11a_in[54:54]),
	.out(wire_sft11a_out[54:54]));
	soft   sft11a55
	( 
	.in(wire_sft11a_in[55:55]),
	.out(wire_sft11a_out[55:55]));
	assign
		wire_sft11a_in = wire_add7_result;
	soft   sft13a0
	( 
	.in(wire_sft13a_in[0:0]),
	.out(wire_sft13a_out[0:0]));
	soft   sft13a1
	( 
	.in(wire_sft13a_in[1:1]),
	.out(wire_sft13a_out[1:1]));
	soft   sft13a2
	( 
	.in(wire_sft13a_in[2:2]),
	.out(wire_sft13a_out[2:2]));
	soft   sft13a3
	( 
	.in(wire_sft13a_in[3:3]),
	.out(wire_sft13a_out[3:3]));
	soft   sft13a4
	( 
	.in(wire_sft13a_in[4:4]),
	.out(wire_sft13a_out[4:4]));
	soft   sft13a5
	( 
	.in(wire_sft13a_in[5:5]),
	.out(wire_sft13a_out[5:5]));
	soft   sft13a6
	( 
	.in(wire_sft13a_in[6:6]),
	.out(wire_sft13a_out[6:6]));
	soft   sft13a7
	( 
	.in(wire_sft13a_in[7:7]),
	.out(wire_sft13a_out[7:7]));
	soft   sft13a8
	( 
	.in(wire_sft13a_in[8:8]),
	.out(wire_sft13a_out[8:8]));
	soft   sft13a9
	( 
	.in(wire_sft13a_in[9:9]),
	.out(wire_sft13a_out[9:9]));
	soft   sft13a10
	( 
	.in(wire_sft13a_in[10:10]),
	.out(wire_sft13a_out[10:10]));
	soft   sft13a11
	( 
	.in(wire_sft13a_in[11:11]),
	.out(wire_sft13a_out[11:11]));
	soft   sft13a12
	( 
	.in(wire_sft13a_in[12:12]),
	.out(wire_sft13a_out[12:12]));
	soft   sft13a13
	( 
	.in(wire_sft13a_in[13:13]),
	.out(wire_sft13a_out[13:13]));
	soft   sft13a14
	( 
	.in(wire_sft13a_in[14:14]),
	.out(wire_sft13a_out[14:14]));
	soft   sft13a15
	( 
	.in(wire_sft13a_in[15:15]),
	.out(wire_sft13a_out[15:15]));
	soft   sft13a16
	( 
	.in(wire_sft13a_in[16:16]),
	.out(wire_sft13a_out[16:16]));
	soft   sft13a17
	( 
	.in(wire_sft13a_in[17:17]),
	.out(wire_sft13a_out[17:17]));
	soft   sft13a18
	( 
	.in(wire_sft13a_in[18:18]),
	.out(wire_sft13a_out[18:18]));
	soft   sft13a19
	( 
	.in(wire_sft13a_in[19:19]),
	.out(wire_sft13a_out[19:19]));
	soft   sft13a20
	( 
	.in(wire_sft13a_in[20:20]),
	.out(wire_sft13a_out[20:20]));
	soft   sft13a21
	( 
	.in(wire_sft13a_in[21:21]),
	.out(wire_sft13a_out[21:21]));
	soft   sft13a22
	( 
	.in(wire_sft13a_in[22:22]),
	.out(wire_sft13a_out[22:22]));
	soft   sft13a23
	( 
	.in(wire_sft13a_in[23:23]),
	.out(wire_sft13a_out[23:23]));
	soft   sft13a24
	( 
	.in(wire_sft13a_in[24:24]),
	.out(wire_sft13a_out[24:24]));
	soft   sft13a25
	( 
	.in(wire_sft13a_in[25:25]),
	.out(wire_sft13a_out[25:25]));
	soft   sft13a26
	( 
	.in(wire_sft13a_in[26:26]),
	.out(wire_sft13a_out[26:26]));
	soft   sft13a27
	( 
	.in(wire_sft13a_in[27:27]),
	.out(wire_sft13a_out[27:27]));
	soft   sft13a28
	( 
	.in(wire_sft13a_in[28:28]),
	.out(wire_sft13a_out[28:28]));
	soft   sft13a29
	( 
	.in(wire_sft13a_in[29:29]),
	.out(wire_sft13a_out[29:29]));
	soft   sft13a30
	( 
	.in(wire_sft13a_in[30:30]),
	.out(wire_sft13a_out[30:30]));
	soft   sft13a31
	( 
	.in(wire_sft13a_in[31:31]),
	.out(wire_sft13a_out[31:31]));
	soft   sft13a32
	( 
	.in(wire_sft13a_in[32:32]),
	.out(wire_sft13a_out[32:32]));
	soft   sft13a33
	( 
	.in(wire_sft13a_in[33:33]),
	.out(wire_sft13a_out[33:33]));
	soft   sft13a34
	( 
	.in(wire_sft13a_in[34:34]),
	.out(wire_sft13a_out[34:34]));
	soft   sft13a35
	( 
	.in(wire_sft13a_in[35:35]),
	.out(wire_sft13a_out[35:35]));
	soft   sft13a36
	( 
	.in(wire_sft13a_in[36:36]),
	.out(wire_sft13a_out[36:36]));
	soft   sft13a37
	( 
	.in(wire_sft13a_in[37:37]),
	.out(wire_sft13a_out[37:37]));
	soft   sft13a38
	( 
	.in(wire_sft13a_in[38:38]),
	.out(wire_sft13a_out[38:38]));
	soft   sft13a39
	( 
	.in(wire_sft13a_in[39:39]),
	.out(wire_sft13a_out[39:39]));
	soft   sft13a40
	( 
	.in(wire_sft13a_in[40:40]),
	.out(wire_sft13a_out[40:40]));
	soft   sft13a41
	( 
	.in(wire_sft13a_in[41:41]),
	.out(wire_sft13a_out[41:41]));
	soft   sft13a42
	( 
	.in(wire_sft13a_in[42:42]),
	.out(wire_sft13a_out[42:42]));
	soft   sft13a43
	( 
	.in(wire_sft13a_in[43:43]),
	.out(wire_sft13a_out[43:43]));
	soft   sft13a44
	( 
	.in(wire_sft13a_in[44:44]),
	.out(wire_sft13a_out[44:44]));
	soft   sft13a45
	( 
	.in(wire_sft13a_in[45:45]),
	.out(wire_sft13a_out[45:45]));
	soft   sft13a46
	( 
	.in(wire_sft13a_in[46:46]),
	.out(wire_sft13a_out[46:46]));
	soft   sft13a47
	( 
	.in(wire_sft13a_in[47:47]),
	.out(wire_sft13a_out[47:47]));
	assign
		wire_sft13a_in = {w1191w, {w_sum_node10w[440], {(~ w_sum_node10w[407]), {w1159w, {w_sum_node10w[533], {w_sum_node10w[532], {w_sum_node10w[499], {w_sum_node10w[498], {w_sum_node10w[465], {w_sum_node10w[464], {w_sum_node10w[431], {w_sum_node10w[430], {w_sum_node10w[429], {w_sum_node10w[428], {w_sum_node10w[395], {w_sum_node10w[362], {w_sum_node10w[329], {w_sum_node10w[328], {w_sum_node10w[295], {w_sum_node10w[390], {w_sum_node10w[357], {w1159w, {w_sum_node10w[515], {w_sum_node10w[226], {w_sum_node10w[193], {w_sum_node10w[192], {w_sum_node10w[191], {w_sum_node10w[190], {w_sum_node10w[189], {w_sum_node10w[188], {w_sum_node10w[187], {w_sum_node10w[186], {w_sum_node10w[185], {w_sum_node10w[184], {w_sum_node10w[183], {w_sum_node10w[182], {w_sum_node10w[181], {w_sum_node10w[180], {w_sum_node10w[179], {w_sum_node10w[178], {w_sum_node10w[177], {w_sum_node10w[176], {w_sum_node10w[175], {w_sum_node10w[174], {w_sum_node10w[173], {w_sum_node10w[172], {w_sum_node10w[171:170]}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft14a0
	( 
	.in(wire_sft14a_in[0:0]),
	.out(wire_sft14a_out[0:0]));
	soft   sft14a1
	( 
	.in(wire_sft14a_in[1:1]),
	.out(wire_sft14a_out[1:1]));
	soft   sft14a2
	( 
	.in(wire_sft14a_in[2:2]),
	.out(wire_sft14a_out[2:2]));
	soft   sft14a3
	( 
	.in(wire_sft14a_in[3:3]),
	.out(wire_sft14a_out[3:3]));
	soft   sft14a4
	( 
	.in(wire_sft14a_in[4:4]),
	.out(wire_sft14a_out[4:4]));
	soft   sft14a5
	( 
	.in(wire_sft14a_in[5:5]),
	.out(wire_sft14a_out[5:5]));
	soft   sft14a6
	( 
	.in(wire_sft14a_in[6:6]),
	.out(wire_sft14a_out[6:6]));
	soft   sft14a7
	( 
	.in(wire_sft14a_in[7:7]),
	.out(wire_sft14a_out[7:7]));
	soft   sft14a8
	( 
	.in(wire_sft14a_in[8:8]),
	.out(wire_sft14a_out[8:8]));
	soft   sft14a9
	( 
	.in(wire_sft14a_in[9:9]),
	.out(wire_sft14a_out[9:9]));
	soft   sft14a10
	( 
	.in(wire_sft14a_in[10:10]),
	.out(wire_sft14a_out[10:10]));
	soft   sft14a11
	( 
	.in(wire_sft14a_in[11:11]),
	.out(wire_sft14a_out[11:11]));
	soft   sft14a12
	( 
	.in(wire_sft14a_in[12:12]),
	.out(wire_sft14a_out[12:12]));
	soft   sft14a13
	( 
	.in(wire_sft14a_in[13:13]),
	.out(wire_sft14a_out[13:13]));
	soft   sft14a14
	( 
	.in(wire_sft14a_in[14:14]),
	.out(wire_sft14a_out[14:14]));
	soft   sft14a15
	( 
	.in(wire_sft14a_in[15:15]),
	.out(wire_sft14a_out[15:15]));
	soft   sft14a16
	( 
	.in(wire_sft14a_in[16:16]),
	.out(wire_sft14a_out[16:16]));
	soft   sft14a17
	( 
	.in(wire_sft14a_in[17:17]),
	.out(wire_sft14a_out[17:17]));
	soft   sft14a18
	( 
	.in(wire_sft14a_in[18:18]),
	.out(wire_sft14a_out[18:18]));
	soft   sft14a19
	( 
	.in(wire_sft14a_in[19:19]),
	.out(wire_sft14a_out[19:19]));
	soft   sft14a20
	( 
	.in(wire_sft14a_in[20:20]),
	.out(wire_sft14a_out[20:20]));
	soft   sft14a21
	( 
	.in(wire_sft14a_in[21:21]),
	.out(wire_sft14a_out[21:21]));
	soft   sft14a22
	( 
	.in(wire_sft14a_in[22:22]),
	.out(wire_sft14a_out[22:22]));
	soft   sft14a23
	( 
	.in(wire_sft14a_in[23:23]),
	.out(wire_sft14a_out[23:23]));
	soft   sft14a24
	( 
	.in(wire_sft14a_in[24:24]),
	.out(wire_sft14a_out[24:24]));
	soft   sft14a25
	( 
	.in(wire_sft14a_in[25:25]),
	.out(wire_sft14a_out[25:25]));
	soft   sft14a26
	( 
	.in(wire_sft14a_in[26:26]),
	.out(wire_sft14a_out[26:26]));
	soft   sft14a27
	( 
	.in(wire_sft14a_in[27:27]),
	.out(wire_sft14a_out[27:27]));
	soft   sft14a28
	( 
	.in(wire_sft14a_in[28:28]),
	.out(wire_sft14a_out[28:28]));
	soft   sft14a29
	( 
	.in(wire_sft14a_in[29:29]),
	.out(wire_sft14a_out[29:29]));
	soft   sft14a30
	( 
	.in(wire_sft14a_in[30:30]),
	.out(wire_sft14a_out[30:30]));
	soft   sft14a31
	( 
	.in(wire_sft14a_in[31:31]),
	.out(wire_sft14a_out[31:31]));
	soft   sft14a32
	( 
	.in(wire_sft14a_in[32:32]),
	.out(wire_sft14a_out[32:32]));
	soft   sft14a33
	( 
	.in(wire_sft14a_in[33:33]),
	.out(wire_sft14a_out[33:33]));
	soft   sft14a34
	( 
	.in(wire_sft14a_in[34:34]),
	.out(wire_sft14a_out[34:34]));
	soft   sft14a35
	( 
	.in(wire_sft14a_in[35:35]),
	.out(wire_sft14a_out[35:35]));
	soft   sft14a36
	( 
	.in(wire_sft14a_in[36:36]),
	.out(wire_sft14a_out[36:36]));
	soft   sft14a37
	( 
	.in(wire_sft14a_in[37:37]),
	.out(wire_sft14a_out[37:37]));
	soft   sft14a38
	( 
	.in(wire_sft14a_in[38:38]),
	.out(wire_sft14a_out[38:38]));
	soft   sft14a39
	( 
	.in(wire_sft14a_in[39:39]),
	.out(wire_sft14a_out[39:39]));
	soft   sft14a40
	( 
	.in(wire_sft14a_in[40:40]),
	.out(wire_sft14a_out[40:40]));
	soft   sft14a41
	( 
	.in(wire_sft14a_in[41:41]),
	.out(wire_sft14a_out[41:41]));
	soft   sft14a42
	( 
	.in(wire_sft14a_in[42:42]),
	.out(wire_sft14a_out[42:42]));
	soft   sft14a43
	( 
	.in(wire_sft14a_in[43:43]),
	.out(wire_sft14a_out[43:43]));
	soft   sft14a44
	( 
	.in(wire_sft14a_in[44:44]),
	.out(wire_sft14a_out[44:44]));
	soft   sft14a45
	( 
	.in(wire_sft14a_in[45:45]),
	.out(wire_sft14a_out[45:45]));
	soft   sft14a46
	( 
	.in(wire_sft14a_in[46:46]),
	.out(wire_sft14a_out[46:46]));
	soft   sft14a47
	( 
	.in(wire_sft14a_in[47:47]),
	.out(wire_sft14a_out[47:47]));
	assign
		wire_sft14a_in = {w1191w, {w1191w, {w1191w, {w_sum_node10w[438], {w_sum_node10w[405], {w_sum_node10w[404], {w_sum_node10w[371], {w_sum_node10w[370], {w_sum_node10w[337], {w_sum_node10w[336], {w_sum_node10w[303], {w_sum_node10w[302], {w_sum_node10w[269], {w_sum_node10w[268], {w_sum_node10w[235], {w_sum_node10w[234], {w_sum_node10w[201], {w_sum_node10w[200], {w_sum_node10w[167], {wire_sft31a_out[16], {wire_sft31a_out[15], {wire_sft31a_out[14], {wire_sft31a_out[13], {w_sum_node10w[98], {w_sum_node10w[65], {w_sum_node10w[64], {w_sum_node10w[63], {w_sum_node10w[62], {w_sum_node10w[61], {w_sum_node10w[60], {w_sum_node10w[59], {w_sum_node10w[58], {w_sum_node10w[57], {w_sum_node10w[56], {w_sum_node10w[55], {w_sum_node10w[54], {w_sum_node10w[53], {w_sum_node10w[52], {w_sum_node10w[51], {w_sum_node10w[50], {w_sum_node10w[49], {w_sum_node10w[48], {w_sum_node10w[47], {w_sum_node10w[46], {w_sum_node10w[45], {w_sum_node10w[44], {w_sum_node10w[43:42]}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft15a0
	( 
	.in(wire_sft15a_in[0:0]),
	.out(wire_sft15a_out[0:0]));
	soft   sft15a1
	( 
	.in(wire_sft15a_in[1:1]),
	.out(wire_sft15a_out[1:1]));
	soft   sft15a2
	( 
	.in(wire_sft15a_in[2:2]),
	.out(wire_sft15a_out[2:2]));
	soft   sft15a3
	( 
	.in(wire_sft15a_in[3:3]),
	.out(wire_sft15a_out[3:3]));
	soft   sft15a4
	( 
	.in(wire_sft15a_in[4:4]),
	.out(wire_sft15a_out[4:4]));
	soft   sft15a5
	( 
	.in(wire_sft15a_in[5:5]),
	.out(wire_sft15a_out[5:5]));
	soft   sft15a6
	( 
	.in(wire_sft15a_in[6:6]),
	.out(wire_sft15a_out[6:6]));
	soft   sft15a7
	( 
	.in(wire_sft15a_in[7:7]),
	.out(wire_sft15a_out[7:7]));
	soft   sft15a8
	( 
	.in(wire_sft15a_in[8:8]),
	.out(wire_sft15a_out[8:8]));
	soft   sft15a9
	( 
	.in(wire_sft15a_in[9:9]),
	.out(wire_sft15a_out[9:9]));
	soft   sft15a10
	( 
	.in(wire_sft15a_in[10:10]),
	.out(wire_sft15a_out[10:10]));
	soft   sft15a11
	( 
	.in(wire_sft15a_in[11:11]),
	.out(wire_sft15a_out[11:11]));
	soft   sft15a12
	( 
	.in(wire_sft15a_in[12:12]),
	.out(wire_sft15a_out[12:12]));
	soft   sft15a13
	( 
	.in(wire_sft15a_in[13:13]),
	.out(wire_sft15a_out[13:13]));
	soft   sft15a14
	( 
	.in(wire_sft15a_in[14:14]),
	.out(wire_sft15a_out[14:14]));
	soft   sft15a15
	( 
	.in(wire_sft15a_in[15:15]),
	.out(wire_sft15a_out[15:15]));
	soft   sft15a16
	( 
	.in(wire_sft15a_in[16:16]),
	.out(wire_sft15a_out[16:16]));
	soft   sft15a17
	( 
	.in(wire_sft15a_in[17:17]),
	.out(wire_sft15a_out[17:17]));
	soft   sft15a18
	( 
	.in(wire_sft15a_in[18:18]),
	.out(wire_sft15a_out[18:18]));
	soft   sft15a19
	( 
	.in(wire_sft15a_in[19:19]),
	.out(wire_sft15a_out[19:19]));
	soft   sft15a20
	( 
	.in(wire_sft15a_in[20:20]),
	.out(wire_sft15a_out[20:20]));
	soft   sft15a21
	( 
	.in(wire_sft15a_in[21:21]),
	.out(wire_sft15a_out[21:21]));
	soft   sft15a22
	( 
	.in(wire_sft15a_in[22:22]),
	.out(wire_sft15a_out[22:22]));
	soft   sft15a23
	( 
	.in(wire_sft15a_in[23:23]),
	.out(wire_sft15a_out[23:23]));
	soft   sft15a24
	( 
	.in(wire_sft15a_in[24:24]),
	.out(wire_sft15a_out[24:24]));
	soft   sft15a25
	( 
	.in(wire_sft15a_in[25:25]),
	.out(wire_sft15a_out[25:25]));
	soft   sft15a26
	( 
	.in(wire_sft15a_in[26:26]),
	.out(wire_sft15a_out[26:26]));
	soft   sft15a27
	( 
	.in(wire_sft15a_in[27:27]),
	.out(wire_sft15a_out[27:27]));
	soft   sft15a28
	( 
	.in(wire_sft15a_in[28:28]),
	.out(wire_sft15a_out[28:28]));
	soft   sft15a29
	( 
	.in(wire_sft15a_in[29:29]),
	.out(wire_sft15a_out[29:29]));
	soft   sft15a30
	( 
	.in(wire_sft15a_in[30:30]),
	.out(wire_sft15a_out[30:30]));
	soft   sft15a31
	( 
	.in(wire_sft15a_in[31:31]),
	.out(wire_sft15a_out[31:31]));
	soft   sft15a32
	( 
	.in(wire_sft15a_in[32:32]),
	.out(wire_sft15a_out[32:32]));
	soft   sft15a33
	( 
	.in(wire_sft15a_in[33:33]),
	.out(wire_sft15a_out[33:33]));
	soft   sft15a34
	( 
	.in(wire_sft15a_in[34:34]),
	.out(wire_sft15a_out[34:34]));
	soft   sft15a35
	( 
	.in(wire_sft15a_in[35:35]),
	.out(wire_sft15a_out[35:35]));
	soft   sft15a36
	( 
	.in(wire_sft15a_in[36:36]),
	.out(wire_sft15a_out[36:36]));
	soft   sft15a37
	( 
	.in(wire_sft15a_in[37:37]),
	.out(wire_sft15a_out[37:37]));
	soft   sft15a38
	( 
	.in(wire_sft15a_in[38:38]),
	.out(wire_sft15a_out[38:38]));
	soft   sft15a39
	( 
	.in(wire_sft15a_in[39:39]),
	.out(wire_sft15a_out[39:39]));
	soft   sft15a40
	( 
	.in(wire_sft15a_in[40:40]),
	.out(wire_sft15a_out[40:40]));
	soft   sft15a41
	( 
	.in(wire_sft15a_in[41:41]),
	.out(wire_sft15a_out[41:41]));
	soft   sft15a42
	( 
	.in(wire_sft15a_in[42:42]),
	.out(wire_sft15a_out[42:42]));
	soft   sft15a43
	( 
	.in(wire_sft15a_in[43:43]),
	.out(wire_sft15a_out[43:43]));
	soft   sft15a44
	( 
	.in(wire_sft15a_in[44:44]),
	.out(wire_sft15a_out[44:44]));
	soft   sft15a45
	( 
	.in(wire_sft15a_in[45:45]),
	.out(wire_sft15a_out[45:45]));
	soft   sft15a46
	( 
	.in(wire_sft15a_in[46:46]),
	.out(wire_sft15a_out[46:46]));
	soft   sft15a47
	( 
	.in(wire_sft15a_in[47:47]),
	.out(wire_sft15a_out[47:47]));
	assign
		wire_sft15a_in = {w1191w, {w1191w, {w1191w, {w1191w, {(~ w_sum_node10w[373]), {w1159w, {w_sum_node10w[531], {w_sum_node10w[530], {w_sum_node10w[497], {w_sum_node10w[496], {w_sum_node10w[463], {w_sum_node10w[462], {wire_sft31a_out[23], {wire_sft31a_out[22], {wire_sft31a_out[21], {wire_sft31a_out[20], {wire_sft31a_out[19], {wire_sft31a_out[18], {wire_sft31a_out[17], {wire_sft36a_out[12], {wire_sft41a_out[7], {wire_sft36a_out[10], {wire_sft41a_out[5], {wire_sft36a_out[8], {wire_sft36a_out[7], {wire_sft36a_out[6], {wire_sft36a_out[5], {wire_sft36a_out[4], {wire_sft31a_out[7], {wire_sft31a_out[6], {wire_sft31a_out[5], {wire_sft31a_out[4], {wire_sft31a_out[3], {wire_sft31a_out[2], {wire_sft31a_out[1], {wire_sft31a_out[0], {w_sum_node10w[213], {w_sum_node10w[212], {w_sum_node10w[211], {w_sum_node10w[210], {w_sum_node10w[209], {w_sum_node10w[208], {w_sum_node10w[207], {w_sum_node10w[206], {w_sum_node10w[205], {w_sum_node10w[204], {2{w1191w}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft16a0
	( 
	.in(wire_sft16a_in[0:0]),
	.out(wire_sft16a_out[0:0]));
	soft   sft16a1
	( 
	.in(wire_sft16a_in[1:1]),
	.out(wire_sft16a_out[1:1]));
	soft   sft16a2
	( 
	.in(wire_sft16a_in[2:2]),
	.out(wire_sft16a_out[2:2]));
	soft   sft16a3
	( 
	.in(wire_sft16a_in[3:3]),
	.out(wire_sft16a_out[3:3]));
	soft   sft16a4
	( 
	.in(wire_sft16a_in[4:4]),
	.out(wire_sft16a_out[4:4]));
	soft   sft16a5
	( 
	.in(wire_sft16a_in[5:5]),
	.out(wire_sft16a_out[5:5]));
	soft   sft16a6
	( 
	.in(wire_sft16a_in[6:6]),
	.out(wire_sft16a_out[6:6]));
	soft   sft16a7
	( 
	.in(wire_sft16a_in[7:7]),
	.out(wire_sft16a_out[7:7]));
	soft   sft16a8
	( 
	.in(wire_sft16a_in[8:8]),
	.out(wire_sft16a_out[8:8]));
	soft   sft16a9
	( 
	.in(wire_sft16a_in[9:9]),
	.out(wire_sft16a_out[9:9]));
	soft   sft16a10
	( 
	.in(wire_sft16a_in[10:10]),
	.out(wire_sft16a_out[10:10]));
	soft   sft16a11
	( 
	.in(wire_sft16a_in[11:11]),
	.out(wire_sft16a_out[11:11]));
	soft   sft16a12
	( 
	.in(wire_sft16a_in[12:12]),
	.out(wire_sft16a_out[12:12]));
	soft   sft16a13
	( 
	.in(wire_sft16a_in[13:13]),
	.out(wire_sft16a_out[13:13]));
	soft   sft16a14
	( 
	.in(wire_sft16a_in[14:14]),
	.out(wire_sft16a_out[14:14]));
	soft   sft16a15
	( 
	.in(wire_sft16a_in[15:15]),
	.out(wire_sft16a_out[15:15]));
	soft   sft16a16
	( 
	.in(wire_sft16a_in[16:16]),
	.out(wire_sft16a_out[16:16]));
	soft   sft16a17
	( 
	.in(wire_sft16a_in[17:17]),
	.out(wire_sft16a_out[17:17]));
	soft   sft16a18
	( 
	.in(wire_sft16a_in[18:18]),
	.out(wire_sft16a_out[18:18]));
	soft   sft16a19
	( 
	.in(wire_sft16a_in[19:19]),
	.out(wire_sft16a_out[19:19]));
	soft   sft16a20
	( 
	.in(wire_sft16a_in[20:20]),
	.out(wire_sft16a_out[20:20]));
	soft   sft16a21
	( 
	.in(wire_sft16a_in[21:21]),
	.out(wire_sft16a_out[21:21]));
	soft   sft16a22
	( 
	.in(wire_sft16a_in[22:22]),
	.out(wire_sft16a_out[22:22]));
	soft   sft16a23
	( 
	.in(wire_sft16a_in[23:23]),
	.out(wire_sft16a_out[23:23]));
	soft   sft16a24
	( 
	.in(wire_sft16a_in[24:24]),
	.out(wire_sft16a_out[24:24]));
	soft   sft16a25
	( 
	.in(wire_sft16a_in[25:25]),
	.out(wire_sft16a_out[25:25]));
	soft   sft16a26
	( 
	.in(wire_sft16a_in[26:26]),
	.out(wire_sft16a_out[26:26]));
	soft   sft16a27
	( 
	.in(wire_sft16a_in[27:27]),
	.out(wire_sft16a_out[27:27]));
	soft   sft16a28
	( 
	.in(wire_sft16a_in[28:28]),
	.out(wire_sft16a_out[28:28]));
	soft   sft16a29
	( 
	.in(wire_sft16a_in[29:29]),
	.out(wire_sft16a_out[29:29]));
	soft   sft16a30
	( 
	.in(wire_sft16a_in[30:30]),
	.out(wire_sft16a_out[30:30]));
	soft   sft16a31
	( 
	.in(wire_sft16a_in[31:31]),
	.out(wire_sft16a_out[31:31]));
	soft   sft16a32
	( 
	.in(wire_sft16a_in[32:32]),
	.out(wire_sft16a_out[32:32]));
	soft   sft16a33
	( 
	.in(wire_sft16a_in[33:33]),
	.out(wire_sft16a_out[33:33]));
	soft   sft16a34
	( 
	.in(wire_sft16a_in[34:34]),
	.out(wire_sft16a_out[34:34]));
	soft   sft16a35
	( 
	.in(wire_sft16a_in[35:35]),
	.out(wire_sft16a_out[35:35]));
	soft   sft16a36
	( 
	.in(wire_sft16a_in[36:36]),
	.out(wire_sft16a_out[36:36]));
	soft   sft16a37
	( 
	.in(wire_sft16a_in[37:37]),
	.out(wire_sft16a_out[37:37]));
	soft   sft16a38
	( 
	.in(wire_sft16a_in[38:38]),
	.out(wire_sft16a_out[38:38]));
	soft   sft16a39
	( 
	.in(wire_sft16a_in[39:39]),
	.out(wire_sft16a_out[39:39]));
	soft   sft16a40
	( 
	.in(wire_sft16a_in[40:40]),
	.out(wire_sft16a_out[40:40]));
	soft   sft16a41
	( 
	.in(wire_sft16a_in[41:41]),
	.out(wire_sft16a_out[41:41]));
	soft   sft16a42
	( 
	.in(wire_sft16a_in[42:42]),
	.out(wire_sft16a_out[42:42]));
	soft   sft16a43
	( 
	.in(wire_sft16a_in[43:43]),
	.out(wire_sft16a_out[43:43]));
	soft   sft16a44
	( 
	.in(wire_sft16a_in[44:44]),
	.out(wire_sft16a_out[44:44]));
	soft   sft16a45
	( 
	.in(wire_sft16a_in[45:45]),
	.out(wire_sft16a_out[45:45]));
	soft   sft16a46
	( 
	.in(wire_sft16a_in[46:46]),
	.out(wire_sft16a_out[46:46]));
	soft   sft16a47
	( 
	.in(wire_sft16a_in[47:47]),
	.out(wire_sft16a_out[47:47]));
	assign
		wire_sft16a_in = wire_add12_result;
	soft   sft18a0
	( 
	.in(wire_sft18a_in[0:0]),
	.out(wire_sft18a_out[0:0]));
	soft   sft18a1
	( 
	.in(wire_sft18a_in[1:1]),
	.out(wire_sft18a_out[1:1]));
	soft   sft18a2
	( 
	.in(wire_sft18a_in[2:2]),
	.out(wire_sft18a_out[2:2]));
	soft   sft18a3
	( 
	.in(wire_sft18a_in[3:3]),
	.out(wire_sft18a_out[3:3]));
	soft   sft18a4
	( 
	.in(wire_sft18a_in[4:4]),
	.out(wire_sft18a_out[4:4]));
	soft   sft18a5
	( 
	.in(wire_sft18a_in[5:5]),
	.out(wire_sft18a_out[5:5]));
	soft   sft18a6
	( 
	.in(wire_sft18a_in[6:6]),
	.out(wire_sft18a_out[6:6]));
	soft   sft18a7
	( 
	.in(wire_sft18a_in[7:7]),
	.out(wire_sft18a_out[7:7]));
	soft   sft18a8
	( 
	.in(wire_sft18a_in[8:8]),
	.out(wire_sft18a_out[8:8]));
	soft   sft18a9
	( 
	.in(wire_sft18a_in[9:9]),
	.out(wire_sft18a_out[9:9]));
	soft   sft18a10
	( 
	.in(wire_sft18a_in[10:10]),
	.out(wire_sft18a_out[10:10]));
	soft   sft18a11
	( 
	.in(wire_sft18a_in[11:11]),
	.out(wire_sft18a_out[11:11]));
	soft   sft18a12
	( 
	.in(wire_sft18a_in[12:12]),
	.out(wire_sft18a_out[12:12]));
	soft   sft18a13
	( 
	.in(wire_sft18a_in[13:13]),
	.out(wire_sft18a_out[13:13]));
	soft   sft18a14
	( 
	.in(wire_sft18a_in[14:14]),
	.out(wire_sft18a_out[14:14]));
	soft   sft18a15
	( 
	.in(wire_sft18a_in[15:15]),
	.out(wire_sft18a_out[15:15]));
	soft   sft18a16
	( 
	.in(wire_sft18a_in[16:16]),
	.out(wire_sft18a_out[16:16]));
	soft   sft18a17
	( 
	.in(wire_sft18a_in[17:17]),
	.out(wire_sft18a_out[17:17]));
	soft   sft18a18
	( 
	.in(wire_sft18a_in[18:18]),
	.out(wire_sft18a_out[18:18]));
	soft   sft18a19
	( 
	.in(wire_sft18a_in[19:19]),
	.out(wire_sft18a_out[19:19]));
	soft   sft18a20
	( 
	.in(wire_sft18a_in[20:20]),
	.out(wire_sft18a_out[20:20]));
	soft   sft18a21
	( 
	.in(wire_sft18a_in[21:21]),
	.out(wire_sft18a_out[21:21]));
	soft   sft18a22
	( 
	.in(wire_sft18a_in[22:22]),
	.out(wire_sft18a_out[22:22]));
	soft   sft18a23
	( 
	.in(wire_sft18a_in[23:23]),
	.out(wire_sft18a_out[23:23]));
	soft   sft18a24
	( 
	.in(wire_sft18a_in[24:24]),
	.out(wire_sft18a_out[24:24]));
	soft   sft18a25
	( 
	.in(wire_sft18a_in[25:25]),
	.out(wire_sft18a_out[25:25]));
	soft   sft18a26
	( 
	.in(wire_sft18a_in[26:26]),
	.out(wire_sft18a_out[26:26]));
	soft   sft18a27
	( 
	.in(wire_sft18a_in[27:27]),
	.out(wire_sft18a_out[27:27]));
	soft   sft18a28
	( 
	.in(wire_sft18a_in[28:28]),
	.out(wire_sft18a_out[28:28]));
	soft   sft18a29
	( 
	.in(wire_sft18a_in[29:29]),
	.out(wire_sft18a_out[29:29]));
	soft   sft18a30
	( 
	.in(wire_sft18a_in[30:30]),
	.out(wire_sft18a_out[30:30]));
	soft   sft18a31
	( 
	.in(wire_sft18a_in[31:31]),
	.out(wire_sft18a_out[31:31]));
	soft   sft18a32
	( 
	.in(wire_sft18a_in[32:32]),
	.out(wire_sft18a_out[32:32]));
	soft   sft18a33
	( 
	.in(wire_sft18a_in[33:33]),
	.out(wire_sft18a_out[33:33]));
	soft   sft18a34
	( 
	.in(wire_sft18a_in[34:34]),
	.out(wire_sft18a_out[34:34]));
	soft   sft18a35
	( 
	.in(wire_sft18a_in[35:35]),
	.out(wire_sft18a_out[35:35]));
	soft   sft18a36
	( 
	.in(wire_sft18a_in[36:36]),
	.out(wire_sft18a_out[36:36]));
	soft   sft18a37
	( 
	.in(wire_sft18a_in[37:37]),
	.out(wire_sft18a_out[37:37]));
	soft   sft18a38
	( 
	.in(wire_sft18a_in[38:38]),
	.out(wire_sft18a_out[38:38]));
	soft   sft18a39
	( 
	.in(wire_sft18a_in[39:39]),
	.out(wire_sft18a_out[39:39]));
	assign
		wire_sft18a_in = {w1191w, {w_sum_node10w[372], {(~ w_sum_node10w[339]), {w1159w, {w_sum_node10w[529], {w_sum_node10w[528], {w_sum_node10w[495], {w_sum_node10w[494], {w_sum_node10w[461], {w_sum_node10w[460], {w_sum_node10w[427], {w_sum_node10w[426], {w_sum_node10w[425], {w_sum_node10w[424], {w_sum_node10w[391], {w_sum_node10w[358], {w_sum_node10w[325], {w_sum_node10w[324], {w_sum_node10w[291], {w_sum_node10w[290], {w_sum_node10w[257], {w_sum_node10w[256], {w_sum_node10w[255], {w_sum_node10w[254], {w_sum_node10w[253], {w_sum_node10w[252], {w_sum_node10w[251], {w_sum_node10w[250], {w_sum_node10w[249], {w_sum_node10w[248], {w_sum_node10w[247], {w_sum_node10w[246], {w_sum_node10w[245], {w_sum_node10w[244], {w_sum_node10w[243], {w_sum_node10w[242], {w_sum_node10w[241], {w_sum_node10w[240], {w_sum_node10w[239:238]}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft19a0
	( 
	.in(wire_sft19a_in[0:0]),
	.out(wire_sft19a_out[0:0]));
	soft   sft19a1
	( 
	.in(wire_sft19a_in[1:1]),
	.out(wire_sft19a_out[1:1]));
	soft   sft19a2
	( 
	.in(wire_sft19a_in[2:2]),
	.out(wire_sft19a_out[2:2]));
	soft   sft19a3
	( 
	.in(wire_sft19a_in[3:3]),
	.out(wire_sft19a_out[3:3]));
	soft   sft19a4
	( 
	.in(wire_sft19a_in[4:4]),
	.out(wire_sft19a_out[4:4]));
	soft   sft19a5
	( 
	.in(wire_sft19a_in[5:5]),
	.out(wire_sft19a_out[5:5]));
	soft   sft19a6
	( 
	.in(wire_sft19a_in[6:6]),
	.out(wire_sft19a_out[6:6]));
	soft   sft19a7
	( 
	.in(wire_sft19a_in[7:7]),
	.out(wire_sft19a_out[7:7]));
	soft   sft19a8
	( 
	.in(wire_sft19a_in[8:8]),
	.out(wire_sft19a_out[8:8]));
	soft   sft19a9
	( 
	.in(wire_sft19a_in[9:9]),
	.out(wire_sft19a_out[9:9]));
	soft   sft19a10
	( 
	.in(wire_sft19a_in[10:10]),
	.out(wire_sft19a_out[10:10]));
	soft   sft19a11
	( 
	.in(wire_sft19a_in[11:11]),
	.out(wire_sft19a_out[11:11]));
	soft   sft19a12
	( 
	.in(wire_sft19a_in[12:12]),
	.out(wire_sft19a_out[12:12]));
	soft   sft19a13
	( 
	.in(wire_sft19a_in[13:13]),
	.out(wire_sft19a_out[13:13]));
	soft   sft19a14
	( 
	.in(wire_sft19a_in[14:14]),
	.out(wire_sft19a_out[14:14]));
	soft   sft19a15
	( 
	.in(wire_sft19a_in[15:15]),
	.out(wire_sft19a_out[15:15]));
	soft   sft19a16
	( 
	.in(wire_sft19a_in[16:16]),
	.out(wire_sft19a_out[16:16]));
	soft   sft19a17
	( 
	.in(wire_sft19a_in[17:17]),
	.out(wire_sft19a_out[17:17]));
	soft   sft19a18
	( 
	.in(wire_sft19a_in[18:18]),
	.out(wire_sft19a_out[18:18]));
	soft   sft19a19
	( 
	.in(wire_sft19a_in[19:19]),
	.out(wire_sft19a_out[19:19]));
	soft   sft19a20
	( 
	.in(wire_sft19a_in[20:20]),
	.out(wire_sft19a_out[20:20]));
	soft   sft19a21
	( 
	.in(wire_sft19a_in[21:21]),
	.out(wire_sft19a_out[21:21]));
	soft   sft19a22
	( 
	.in(wire_sft19a_in[22:22]),
	.out(wire_sft19a_out[22:22]));
	soft   sft19a23
	( 
	.in(wire_sft19a_in[23:23]),
	.out(wire_sft19a_out[23:23]));
	soft   sft19a24
	( 
	.in(wire_sft19a_in[24:24]),
	.out(wire_sft19a_out[24:24]));
	soft   sft19a25
	( 
	.in(wire_sft19a_in[25:25]),
	.out(wire_sft19a_out[25:25]));
	soft   sft19a26
	( 
	.in(wire_sft19a_in[26:26]),
	.out(wire_sft19a_out[26:26]));
	soft   sft19a27
	( 
	.in(wire_sft19a_in[27:27]),
	.out(wire_sft19a_out[27:27]));
	soft   sft19a28
	( 
	.in(wire_sft19a_in[28:28]),
	.out(wire_sft19a_out[28:28]));
	soft   sft19a29
	( 
	.in(wire_sft19a_in[29:29]),
	.out(wire_sft19a_out[29:29]));
	soft   sft19a30
	( 
	.in(wire_sft19a_in[30:30]),
	.out(wire_sft19a_out[30:30]));
	soft   sft19a31
	( 
	.in(wire_sft19a_in[31:31]),
	.out(wire_sft19a_out[31:31]));
	soft   sft19a32
	( 
	.in(wire_sft19a_in[32:32]),
	.out(wire_sft19a_out[32:32]));
	soft   sft19a33
	( 
	.in(wire_sft19a_in[33:33]),
	.out(wire_sft19a_out[33:33]));
	soft   sft19a34
	( 
	.in(wire_sft19a_in[34:34]),
	.out(wire_sft19a_out[34:34]));
	soft   sft19a35
	( 
	.in(wire_sft19a_in[35:35]),
	.out(wire_sft19a_out[35:35]));
	soft   sft19a36
	( 
	.in(wire_sft19a_in[36:36]),
	.out(wire_sft19a_out[36:36]));
	soft   sft19a37
	( 
	.in(wire_sft19a_in[37:37]),
	.out(wire_sft19a_out[37:37]));
	soft   sft19a38
	( 
	.in(wire_sft19a_in[38:38]),
	.out(wire_sft19a_out[38:38]));
	soft   sft19a39
	( 
	.in(wire_sft19a_in[39:39]),
	.out(wire_sft19a_out[39:39]));
	assign
		wire_sft19a_in = {w1191w, {w1191w, {w1191w, {w_sum_node10w[338], {(~ w_sum_node10w[305]), {w_sum_node10w[304], {(~ w_sum_node10w[271]), {w_sum_node10w[270], {(~ w_sum_node10w[237]), {w_sum_node10w[236], {(~ w_sum_node10w[203]), {w_sum_node10w[202], {(~ w_sum_node10w[169]), {w_sum_node10w[168], {wire_sft36a_out[13], {w_sum_node10w[134], {(~ w_sum_node10w[101]), {w_sum_node10w[100], {(~ w_sum_node10w[67]), {w_sum_node10w[66], {(~ w_sum_node10w[33]), {w_sum_node10w[32], {w_sum_node10w[31], {w_sum_node10w[30], {w_sum_node10w[29], {w_sum_node10w[28], {w_sum_node10w[27], {w_sum_node10w[26], {w_sum_node10w[25], {w_sum_node10w[24], {w_sum_node10w[23], {w_sum_node10w[22], {w_sum_node10w[21], {w_sum_node10w[20], {w_sum_node10w[19], {w_sum_node10w[18], {w_sum_node10w[17], {w_sum_node10w[16], {w_sum_node10w[15:14]}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft20a0
	( 
	.in(wire_sft20a_in[0:0]),
	.out(wire_sft20a_out[0:0]));
	soft   sft20a1
	( 
	.in(wire_sft20a_in[1:1]),
	.out(wire_sft20a_out[1:1]));
	soft   sft20a2
	( 
	.in(wire_sft20a_in[2:2]),
	.out(wire_sft20a_out[2:2]));
	soft   sft20a3
	( 
	.in(wire_sft20a_in[3:3]),
	.out(wire_sft20a_out[3:3]));
	soft   sft20a4
	( 
	.in(wire_sft20a_in[4:4]),
	.out(wire_sft20a_out[4:4]));
	soft   sft20a5
	( 
	.in(wire_sft20a_in[5:5]),
	.out(wire_sft20a_out[5:5]));
	soft   sft20a6
	( 
	.in(wire_sft20a_in[6:6]),
	.out(wire_sft20a_out[6:6]));
	soft   sft20a7
	( 
	.in(wire_sft20a_in[7:7]),
	.out(wire_sft20a_out[7:7]));
	soft   sft20a8
	( 
	.in(wire_sft20a_in[8:8]),
	.out(wire_sft20a_out[8:8]));
	soft   sft20a9
	( 
	.in(wire_sft20a_in[9:9]),
	.out(wire_sft20a_out[9:9]));
	soft   sft20a10
	( 
	.in(wire_sft20a_in[10:10]),
	.out(wire_sft20a_out[10:10]));
	soft   sft20a11
	( 
	.in(wire_sft20a_in[11:11]),
	.out(wire_sft20a_out[11:11]));
	soft   sft20a12
	( 
	.in(wire_sft20a_in[12:12]),
	.out(wire_sft20a_out[12:12]));
	soft   sft20a13
	( 
	.in(wire_sft20a_in[13:13]),
	.out(wire_sft20a_out[13:13]));
	soft   sft20a14
	( 
	.in(wire_sft20a_in[14:14]),
	.out(wire_sft20a_out[14:14]));
	soft   sft20a15
	( 
	.in(wire_sft20a_in[15:15]),
	.out(wire_sft20a_out[15:15]));
	soft   sft20a16
	( 
	.in(wire_sft20a_in[16:16]),
	.out(wire_sft20a_out[16:16]));
	soft   sft20a17
	( 
	.in(wire_sft20a_in[17:17]),
	.out(wire_sft20a_out[17:17]));
	soft   sft20a18
	( 
	.in(wire_sft20a_in[18:18]),
	.out(wire_sft20a_out[18:18]));
	soft   sft20a19
	( 
	.in(wire_sft20a_in[19:19]),
	.out(wire_sft20a_out[19:19]));
	soft   sft20a20
	( 
	.in(wire_sft20a_in[20:20]),
	.out(wire_sft20a_out[20:20]));
	soft   sft20a21
	( 
	.in(wire_sft20a_in[21:21]),
	.out(wire_sft20a_out[21:21]));
	soft   sft20a22
	( 
	.in(wire_sft20a_in[22:22]),
	.out(wire_sft20a_out[22:22]));
	soft   sft20a23
	( 
	.in(wire_sft20a_in[23:23]),
	.out(wire_sft20a_out[23:23]));
	soft   sft20a24
	( 
	.in(wire_sft20a_in[24:24]),
	.out(wire_sft20a_out[24:24]));
	soft   sft20a25
	( 
	.in(wire_sft20a_in[25:25]),
	.out(wire_sft20a_out[25:25]));
	soft   sft20a26
	( 
	.in(wire_sft20a_in[26:26]),
	.out(wire_sft20a_out[26:26]));
	soft   sft20a27
	( 
	.in(wire_sft20a_in[27:27]),
	.out(wire_sft20a_out[27:27]));
	soft   sft20a28
	( 
	.in(wire_sft20a_in[28:28]),
	.out(wire_sft20a_out[28:28]));
	soft   sft20a29
	( 
	.in(wire_sft20a_in[29:29]),
	.out(wire_sft20a_out[29:29]));
	soft   sft20a30
	( 
	.in(wire_sft20a_in[30:30]),
	.out(wire_sft20a_out[30:30]));
	soft   sft20a31
	( 
	.in(wire_sft20a_in[31:31]),
	.out(wire_sft20a_out[31:31]));
	soft   sft20a32
	( 
	.in(wire_sft20a_in[32:32]),
	.out(wire_sft20a_out[32:32]));
	soft   sft20a33
	( 
	.in(wire_sft20a_in[33:33]),
	.out(wire_sft20a_out[33:33]));
	soft   sft20a34
	( 
	.in(wire_sft20a_in[34:34]),
	.out(wire_sft20a_out[34:34]));
	soft   sft20a35
	( 
	.in(wire_sft20a_in[35:35]),
	.out(wire_sft20a_out[35:35]));
	soft   sft20a36
	( 
	.in(wire_sft20a_in[36:36]),
	.out(wire_sft20a_out[36:36]));
	soft   sft20a37
	( 
	.in(wire_sft20a_in[37:37]),
	.out(wire_sft20a_out[37:37]));
	soft   sft20a38
	( 
	.in(wire_sft20a_in[38:38]),
	.out(wire_sft20a_out[38:38]));
	soft   sft20a39
	( 
	.in(wire_sft20a_in[39:39]),
	.out(wire_sft20a_out[39:39]));
	assign
		wire_sft20a_in = {w1191w, {w1191w, {w1191w, {w1191w, {w_sum_node10w[401], {w1159w, {w_sum_node10w[527], {w_sum_node10w[526], {w_sum_node10w[493], {w_sum_node10w[492], {w_sum_node10w[459], {w_sum_node10w[458], {wire_sft36a_out[15], {wire_sft36a_out[14], {wire_sft41a_out[9], {wire_sft41a_out[8], {wire_sft36a_out[11], {wire_sft41a_out[6], {wire_sft36a_out[9], {wire_sft41a_out[4], {wire_sft41a_out[3], {wire_sft41a_out[2], {wire_sft41a_out[1], {wire_sft41a_out[0], {wire_sft36a_out[3], {wire_sft36a_out[2], {wire_sft36a_out[1], {wire_sft36a_out[0], {w_sum_node10w[281], {w_sum_node10w[280], {w_sum_node10w[279], {w_sum_node10w[278], {w_sum_node10w[277], {w_sum_node10w[276], {w_sum_node10w[275], {w_sum_node10w[274], {w_sum_node10w[273], {w_sum_node10w[272], {2{w1191w}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft21a0
	( 
	.in(wire_sft21a_in[0:0]),
	.out(wire_sft21a_out[0:0]));
	soft   sft21a1
	( 
	.in(wire_sft21a_in[1:1]),
	.out(wire_sft21a_out[1:1]));
	soft   sft21a2
	( 
	.in(wire_sft21a_in[2:2]),
	.out(wire_sft21a_out[2:2]));
	soft   sft21a3
	( 
	.in(wire_sft21a_in[3:3]),
	.out(wire_sft21a_out[3:3]));
	soft   sft21a4
	( 
	.in(wire_sft21a_in[4:4]),
	.out(wire_sft21a_out[4:4]));
	soft   sft21a5
	( 
	.in(wire_sft21a_in[5:5]),
	.out(wire_sft21a_out[5:5]));
	soft   sft21a6
	( 
	.in(wire_sft21a_in[6:6]),
	.out(wire_sft21a_out[6:6]));
	soft   sft21a7
	( 
	.in(wire_sft21a_in[7:7]),
	.out(wire_sft21a_out[7:7]));
	soft   sft21a8
	( 
	.in(wire_sft21a_in[8:8]),
	.out(wire_sft21a_out[8:8]));
	soft   sft21a9
	( 
	.in(wire_sft21a_in[9:9]),
	.out(wire_sft21a_out[9:9]));
	soft   sft21a10
	( 
	.in(wire_sft21a_in[10:10]),
	.out(wire_sft21a_out[10:10]));
	soft   sft21a11
	( 
	.in(wire_sft21a_in[11:11]),
	.out(wire_sft21a_out[11:11]));
	soft   sft21a12
	( 
	.in(wire_sft21a_in[12:12]),
	.out(wire_sft21a_out[12:12]));
	soft   sft21a13
	( 
	.in(wire_sft21a_in[13:13]),
	.out(wire_sft21a_out[13:13]));
	soft   sft21a14
	( 
	.in(wire_sft21a_in[14:14]),
	.out(wire_sft21a_out[14:14]));
	soft   sft21a15
	( 
	.in(wire_sft21a_in[15:15]),
	.out(wire_sft21a_out[15:15]));
	soft   sft21a16
	( 
	.in(wire_sft21a_in[16:16]),
	.out(wire_sft21a_out[16:16]));
	soft   sft21a17
	( 
	.in(wire_sft21a_in[17:17]),
	.out(wire_sft21a_out[17:17]));
	soft   sft21a18
	( 
	.in(wire_sft21a_in[18:18]),
	.out(wire_sft21a_out[18:18]));
	soft   sft21a19
	( 
	.in(wire_sft21a_in[19:19]),
	.out(wire_sft21a_out[19:19]));
	soft   sft21a20
	( 
	.in(wire_sft21a_in[20:20]),
	.out(wire_sft21a_out[20:20]));
	soft   sft21a21
	( 
	.in(wire_sft21a_in[21:21]),
	.out(wire_sft21a_out[21:21]));
	soft   sft21a22
	( 
	.in(wire_sft21a_in[22:22]),
	.out(wire_sft21a_out[22:22]));
	soft   sft21a23
	( 
	.in(wire_sft21a_in[23:23]),
	.out(wire_sft21a_out[23:23]));
	soft   sft21a24
	( 
	.in(wire_sft21a_in[24:24]),
	.out(wire_sft21a_out[24:24]));
	soft   sft21a25
	( 
	.in(wire_sft21a_in[25:25]),
	.out(wire_sft21a_out[25:25]));
	soft   sft21a26
	( 
	.in(wire_sft21a_in[26:26]),
	.out(wire_sft21a_out[26:26]));
	soft   sft21a27
	( 
	.in(wire_sft21a_in[27:27]),
	.out(wire_sft21a_out[27:27]));
	soft   sft21a28
	( 
	.in(wire_sft21a_in[28:28]),
	.out(wire_sft21a_out[28:28]));
	soft   sft21a29
	( 
	.in(wire_sft21a_in[29:29]),
	.out(wire_sft21a_out[29:29]));
	soft   sft21a30
	( 
	.in(wire_sft21a_in[30:30]),
	.out(wire_sft21a_out[30:30]));
	soft   sft21a31
	( 
	.in(wire_sft21a_in[31:31]),
	.out(wire_sft21a_out[31:31]));
	soft   sft21a32
	( 
	.in(wire_sft21a_in[32:32]),
	.out(wire_sft21a_out[32:32]));
	soft   sft21a33
	( 
	.in(wire_sft21a_in[33:33]),
	.out(wire_sft21a_out[33:33]));
	soft   sft21a34
	( 
	.in(wire_sft21a_in[34:34]),
	.out(wire_sft21a_out[34:34]));
	soft   sft21a35
	( 
	.in(wire_sft21a_in[35:35]),
	.out(wire_sft21a_out[35:35]));
	soft   sft21a36
	( 
	.in(wire_sft21a_in[36:36]),
	.out(wire_sft21a_out[36:36]));
	soft   sft21a37
	( 
	.in(wire_sft21a_in[37:37]),
	.out(wire_sft21a_out[37:37]));
	soft   sft21a38
	( 
	.in(wire_sft21a_in[38:38]),
	.out(wire_sft21a_out[38:38]));
	soft   sft21a39
	( 
	.in(wire_sft21a_in[39:39]),
	.out(wire_sft21a_out[39:39]));
	assign
		wire_sft21a_in = wire_add17_result;
	soft   sft23a0
	( 
	.in(wire_sft23a_in[0:0]),
	.out(wire_sft23a_out[0:0]));
	soft   sft23a1
	( 
	.in(wire_sft23a_in[1:1]),
	.out(wire_sft23a_out[1:1]));
	soft   sft23a2
	( 
	.in(wire_sft23a_in[2:2]),
	.out(wire_sft23a_out[2:2]));
	soft   sft23a3
	( 
	.in(wire_sft23a_in[3:3]),
	.out(wire_sft23a_out[3:3]));
	soft   sft23a4
	( 
	.in(wire_sft23a_in[4:4]),
	.out(wire_sft23a_out[4:4]));
	soft   sft23a5
	( 
	.in(wire_sft23a_in[5:5]),
	.out(wire_sft23a_out[5:5]));
	soft   sft23a6
	( 
	.in(wire_sft23a_in[6:6]),
	.out(wire_sft23a_out[6:6]));
	soft   sft23a7
	( 
	.in(wire_sft23a_in[7:7]),
	.out(wire_sft23a_out[7:7]));
	soft   sft23a8
	( 
	.in(wire_sft23a_in[8:8]),
	.out(wire_sft23a_out[8:8]));
	soft   sft23a9
	( 
	.in(wire_sft23a_in[9:9]),
	.out(wire_sft23a_out[9:9]));
	soft   sft23a10
	( 
	.in(wire_sft23a_in[10:10]),
	.out(wire_sft23a_out[10:10]));
	soft   sft23a11
	( 
	.in(wire_sft23a_in[11:11]),
	.out(wire_sft23a_out[11:11]));
	soft   sft23a12
	( 
	.in(wire_sft23a_in[12:12]),
	.out(wire_sft23a_out[12:12]));
	soft   sft23a13
	( 
	.in(wire_sft23a_in[13:13]),
	.out(wire_sft23a_out[13:13]));
	soft   sft23a14
	( 
	.in(wire_sft23a_in[14:14]),
	.out(wire_sft23a_out[14:14]));
	soft   sft23a15
	( 
	.in(wire_sft23a_in[15:15]),
	.out(wire_sft23a_out[15:15]));
	soft   sft23a16
	( 
	.in(wire_sft23a_in[16:16]),
	.out(wire_sft23a_out[16:16]));
	soft   sft23a17
	( 
	.in(wire_sft23a_in[17:17]),
	.out(wire_sft23a_out[17:17]));
	soft   sft23a18
	( 
	.in(wire_sft23a_in[18:18]),
	.out(wire_sft23a_out[18:18]));
	soft   sft23a19
	( 
	.in(wire_sft23a_in[19:19]),
	.out(wire_sft23a_out[19:19]));
	soft   sft23a20
	( 
	.in(wire_sft23a_in[20:20]),
	.out(wire_sft23a_out[20:20]));
	soft   sft23a21
	( 
	.in(wire_sft23a_in[21:21]),
	.out(wire_sft23a_out[21:21]));
	soft   sft23a22
	( 
	.in(wire_sft23a_in[22:22]),
	.out(wire_sft23a_out[22:22]));
	soft   sft23a23
	( 
	.in(wire_sft23a_in[23:23]),
	.out(wire_sft23a_out[23:23]));
	soft   sft23a24
	( 
	.in(wire_sft23a_in[24:24]),
	.out(wire_sft23a_out[24:24]));
	soft   sft23a25
	( 
	.in(wire_sft23a_in[25:25]),
	.out(wire_sft23a_out[25:25]));
	soft   sft23a26
	( 
	.in(wire_sft23a_in[26:26]),
	.out(wire_sft23a_out[26:26]));
	soft   sft23a27
	( 
	.in(wire_sft23a_in[27:27]),
	.out(wire_sft23a_out[27:27]));
	soft   sft23a28
	( 
	.in(wire_sft23a_in[28:28]),
	.out(wire_sft23a_out[28:28]));
	soft   sft23a29
	( 
	.in(wire_sft23a_in[29:29]),
	.out(wire_sft23a_out[29:29]));
	soft   sft23a30
	( 
	.in(wire_sft23a_in[30:30]),
	.out(wire_sft23a_out[30:30]));
	soft   sft23a31
	( 
	.in(wire_sft23a_in[31:31]),
	.out(wire_sft23a_out[31:31]));
	assign
		wire_sft23a_in = {w1191w, {w_sum_node10w[400], {w_sum_node10w[367], {w1159w, {w_sum_node10w[525], {w_sum_node10w[524], {w_sum_node10w[491], {w_sum_node10w[490], {w_sum_node10w[457], {w_sum_node10w[456], {w_sum_node10w[423], {w_sum_node10w[422], {w_sum_node10w[389], {w_sum_node10w[388], {w_sum_node10w[355], {w_sum_node10w[354], {w_sum_node10w[321], {w_sum_node10w[320], {w_sum_node10w[319], {w_sum_node10w[318], {w_sum_node10w[317], {w_sum_node10w[316], {w_sum_node10w[315], {w_sum_node10w[314], {w_sum_node10w[313], {w_sum_node10w[312], {w_sum_node10w[311], {w_sum_node10w[310], {w_sum_node10w[309], {w_sum_node10w[308], {w_sum_node10w[307:306]}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft24a0
	( 
	.in(wire_sft24a_in[0:0]),
	.out(wire_sft24a_out[0:0]));
	soft   sft24a1
	( 
	.in(wire_sft24a_in[1:1]),
	.out(wire_sft24a_out[1:1]));
	soft   sft24a2
	( 
	.in(wire_sft24a_in[2:2]),
	.out(wire_sft24a_out[2:2]));
	soft   sft24a3
	( 
	.in(wire_sft24a_in[3:3]),
	.out(wire_sft24a_out[3:3]));
	soft   sft24a4
	( 
	.in(wire_sft24a_in[4:4]),
	.out(wire_sft24a_out[4:4]));
	soft   sft24a5
	( 
	.in(wire_sft24a_in[5:5]),
	.out(wire_sft24a_out[5:5]));
	soft   sft24a6
	( 
	.in(wire_sft24a_in[6:6]),
	.out(wire_sft24a_out[6:6]));
	soft   sft24a7
	( 
	.in(wire_sft24a_in[7:7]),
	.out(wire_sft24a_out[7:7]));
	soft   sft24a8
	( 
	.in(wire_sft24a_in[8:8]),
	.out(wire_sft24a_out[8:8]));
	soft   sft24a9
	( 
	.in(wire_sft24a_in[9:9]),
	.out(wire_sft24a_out[9:9]));
	soft   sft24a10
	( 
	.in(wire_sft24a_in[10:10]),
	.out(wire_sft24a_out[10:10]));
	soft   sft24a11
	( 
	.in(wire_sft24a_in[11:11]),
	.out(wire_sft24a_out[11:11]));
	soft   sft24a12
	( 
	.in(wire_sft24a_in[12:12]),
	.out(wire_sft24a_out[12:12]));
	soft   sft24a13
	( 
	.in(wire_sft24a_in[13:13]),
	.out(wire_sft24a_out[13:13]));
	soft   sft24a14
	( 
	.in(wire_sft24a_in[14:14]),
	.out(wire_sft24a_out[14:14]));
	soft   sft24a15
	( 
	.in(wire_sft24a_in[15:15]),
	.out(wire_sft24a_out[15:15]));
	soft   sft24a16
	( 
	.in(wire_sft24a_in[16:16]),
	.out(wire_sft24a_out[16:16]));
	soft   sft24a17
	( 
	.in(wire_sft24a_in[17:17]),
	.out(wire_sft24a_out[17:17]));
	soft   sft24a18
	( 
	.in(wire_sft24a_in[18:18]),
	.out(wire_sft24a_out[18:18]));
	soft   sft24a19
	( 
	.in(wire_sft24a_in[19:19]),
	.out(wire_sft24a_out[19:19]));
	soft   sft24a20
	( 
	.in(wire_sft24a_in[20:20]),
	.out(wire_sft24a_out[20:20]));
	soft   sft24a21
	( 
	.in(wire_sft24a_in[21:21]),
	.out(wire_sft24a_out[21:21]));
	soft   sft24a22
	( 
	.in(wire_sft24a_in[22:22]),
	.out(wire_sft24a_out[22:22]));
	soft   sft24a23
	( 
	.in(wire_sft24a_in[23:23]),
	.out(wire_sft24a_out[23:23]));
	soft   sft24a24
	( 
	.in(wire_sft24a_in[24:24]),
	.out(wire_sft24a_out[24:24]));
	soft   sft24a25
	( 
	.in(wire_sft24a_in[25:25]),
	.out(wire_sft24a_out[25:25]));
	soft   sft24a26
	( 
	.in(wire_sft24a_in[26:26]),
	.out(wire_sft24a_out[26:26]));
	soft   sft24a27
	( 
	.in(wire_sft24a_in[27:27]),
	.out(wire_sft24a_out[27:27]));
	soft   sft24a28
	( 
	.in(wire_sft24a_in[28:28]),
	.out(wire_sft24a_out[28:28]));
	soft   sft24a29
	( 
	.in(wire_sft24a_in[29:29]),
	.out(wire_sft24a_out[29:29]));
	soft   sft24a30
	( 
	.in(wire_sft24a_in[30:30]),
	.out(wire_sft24a_out[30:30]));
	soft   sft24a31
	( 
	.in(wire_sft24a_in[31:31]),
	.out(wire_sft24a_out[31:31]));
	assign
		wire_sft24a_in = {w1191w, {w1191w, {w1191w, {w_sum_node10w[398], {w_sum_node10w[365], {w_sum_node10w[364], {w_sum_node10w[331], {w_sum_node10w[330], {w_sum_node10w[297], {w_sum_node10w[296], {w_sum_node10w[263], {w_sum_node10w[262], {w_sum_node10w[229], {w_sum_node10w[228], {w_sum_node10w[195], {w_sum_node10w[194], {w_sum_node10w[161], {w_sum_node10w[160], {w_sum_node10w[159], {w_sum_node10w[158], {w_sum_node10w[157], {w_sum_node10w[156], {w_sum_node10w[155], {w_sum_node10w[154], {w_sum_node10w[153], {w_sum_node10w[152], {w_sum_node10w[151], {w_sum_node10w[150], {w_sum_node10w[149], {w_sum_node10w[148], {w_sum_node10w[147:146]}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft25a0
	( 
	.in(wire_sft25a_in[0:0]),
	.out(wire_sft25a_out[0:0]));
	soft   sft25a1
	( 
	.in(wire_sft25a_in[1:1]),
	.out(wire_sft25a_out[1:1]));
	soft   sft25a2
	( 
	.in(wire_sft25a_in[2:2]),
	.out(wire_sft25a_out[2:2]));
	soft   sft25a3
	( 
	.in(wire_sft25a_in[3:3]),
	.out(wire_sft25a_out[3:3]));
	soft   sft25a4
	( 
	.in(wire_sft25a_in[4:4]),
	.out(wire_sft25a_out[4:4]));
	soft   sft25a5
	( 
	.in(wire_sft25a_in[5:5]),
	.out(wire_sft25a_out[5:5]));
	soft   sft25a6
	( 
	.in(wire_sft25a_in[6:6]),
	.out(wire_sft25a_out[6:6]));
	soft   sft25a7
	( 
	.in(wire_sft25a_in[7:7]),
	.out(wire_sft25a_out[7:7]));
	soft   sft25a8
	( 
	.in(wire_sft25a_in[8:8]),
	.out(wire_sft25a_out[8:8]));
	soft   sft25a9
	( 
	.in(wire_sft25a_in[9:9]),
	.out(wire_sft25a_out[9:9]));
	soft   sft25a10
	( 
	.in(wire_sft25a_in[10:10]),
	.out(wire_sft25a_out[10:10]));
	soft   sft25a11
	( 
	.in(wire_sft25a_in[11:11]),
	.out(wire_sft25a_out[11:11]));
	soft   sft25a12
	( 
	.in(wire_sft25a_in[12:12]),
	.out(wire_sft25a_out[12:12]));
	soft   sft25a13
	( 
	.in(wire_sft25a_in[13:13]),
	.out(wire_sft25a_out[13:13]));
	soft   sft25a14
	( 
	.in(wire_sft25a_in[14:14]),
	.out(wire_sft25a_out[14:14]));
	soft   sft25a15
	( 
	.in(wire_sft25a_in[15:15]),
	.out(wire_sft25a_out[15:15]));
	soft   sft25a16
	( 
	.in(wire_sft25a_in[16:16]),
	.out(wire_sft25a_out[16:16]));
	soft   sft25a17
	( 
	.in(wire_sft25a_in[17:17]),
	.out(wire_sft25a_out[17:17]));
	soft   sft25a18
	( 
	.in(wire_sft25a_in[18:18]),
	.out(wire_sft25a_out[18:18]));
	soft   sft25a19
	( 
	.in(wire_sft25a_in[19:19]),
	.out(wire_sft25a_out[19:19]));
	soft   sft25a20
	( 
	.in(wire_sft25a_in[20:20]),
	.out(wire_sft25a_out[20:20]));
	soft   sft25a21
	( 
	.in(wire_sft25a_in[21:21]),
	.out(wire_sft25a_out[21:21]));
	soft   sft25a22
	( 
	.in(wire_sft25a_in[22:22]),
	.out(wire_sft25a_out[22:22]));
	soft   sft25a23
	( 
	.in(wire_sft25a_in[23:23]),
	.out(wire_sft25a_out[23:23]));
	soft   sft25a24
	( 
	.in(wire_sft25a_in[24:24]),
	.out(wire_sft25a_out[24:24]));
	soft   sft25a25
	( 
	.in(wire_sft25a_in[25:25]),
	.out(wire_sft25a_out[25:25]));
	soft   sft25a26
	( 
	.in(wire_sft25a_in[26:26]),
	.out(wire_sft25a_out[26:26]));
	soft   sft25a27
	( 
	.in(wire_sft25a_in[27:27]),
	.out(wire_sft25a_out[27:27]));
	soft   sft25a28
	( 
	.in(wire_sft25a_in[28:28]),
	.out(wire_sft25a_out[28:28]));
	soft   sft25a29
	( 
	.in(wire_sft25a_in[29:29]),
	.out(wire_sft25a_out[29:29]));
	soft   sft25a30
	( 
	.in(wire_sft25a_in[30:30]),
	.out(wire_sft25a_out[30:30]));
	soft   sft25a31
	( 
	.in(wire_sft25a_in[31:31]),
	.out(wire_sft25a_out[31:31]));
	assign
		wire_sft25a_in = {w1191w, {w1191w, {w1191w, {w1191w, {w_sum_node10w[397], {w1159w, {w_sum_node10w[523], {w_sum_node10w[522], {w_sum_node10w[489], {w_sum_node10w[488], {w_sum_node10w[455], {w_sum_node10w[454], {w_sum_node10w[421], {w_sum_node10w[420], {w_sum_node10w[387], {w_sum_node10w[386], {w_sum_node10w[353], {w_sum_node10w[352], {w_sum_node10w[351], {w_sum_node10w[350], {w_sum_node10w[349], {w_sum_node10w[348], {w_sum_node10w[347], {w_sum_node10w[346], {w_sum_node10w[345], {w_sum_node10w[344], {w_sum_node10w[343], {w_sum_node10w[342], {w_sum_node10w[341], {w_sum_node10w[340], {2{w1191w}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft26a0
	( 
	.in(wire_sft26a_in[0:0]),
	.out(wire_sft26a_out[0:0]));
	soft   sft26a1
	( 
	.in(wire_sft26a_in[1:1]),
	.out(wire_sft26a_out[1:1]));
	soft   sft26a2
	( 
	.in(wire_sft26a_in[2:2]),
	.out(wire_sft26a_out[2:2]));
	soft   sft26a3
	( 
	.in(wire_sft26a_in[3:3]),
	.out(wire_sft26a_out[3:3]));
	soft   sft26a4
	( 
	.in(wire_sft26a_in[4:4]),
	.out(wire_sft26a_out[4:4]));
	soft   sft26a5
	( 
	.in(wire_sft26a_in[5:5]),
	.out(wire_sft26a_out[5:5]));
	soft   sft26a6
	( 
	.in(wire_sft26a_in[6:6]),
	.out(wire_sft26a_out[6:6]));
	soft   sft26a7
	( 
	.in(wire_sft26a_in[7:7]),
	.out(wire_sft26a_out[7:7]));
	soft   sft26a8
	( 
	.in(wire_sft26a_in[8:8]),
	.out(wire_sft26a_out[8:8]));
	soft   sft26a9
	( 
	.in(wire_sft26a_in[9:9]),
	.out(wire_sft26a_out[9:9]));
	soft   sft26a10
	( 
	.in(wire_sft26a_in[10:10]),
	.out(wire_sft26a_out[10:10]));
	soft   sft26a11
	( 
	.in(wire_sft26a_in[11:11]),
	.out(wire_sft26a_out[11:11]));
	soft   sft26a12
	( 
	.in(wire_sft26a_in[12:12]),
	.out(wire_sft26a_out[12:12]));
	soft   sft26a13
	( 
	.in(wire_sft26a_in[13:13]),
	.out(wire_sft26a_out[13:13]));
	soft   sft26a14
	( 
	.in(wire_sft26a_in[14:14]),
	.out(wire_sft26a_out[14:14]));
	soft   sft26a15
	( 
	.in(wire_sft26a_in[15:15]),
	.out(wire_sft26a_out[15:15]));
	soft   sft26a16
	( 
	.in(wire_sft26a_in[16:16]),
	.out(wire_sft26a_out[16:16]));
	soft   sft26a17
	( 
	.in(wire_sft26a_in[17:17]),
	.out(wire_sft26a_out[17:17]));
	soft   sft26a18
	( 
	.in(wire_sft26a_in[18:18]),
	.out(wire_sft26a_out[18:18]));
	soft   sft26a19
	( 
	.in(wire_sft26a_in[19:19]),
	.out(wire_sft26a_out[19:19]));
	soft   sft26a20
	( 
	.in(wire_sft26a_in[20:20]),
	.out(wire_sft26a_out[20:20]));
	soft   sft26a21
	( 
	.in(wire_sft26a_in[21:21]),
	.out(wire_sft26a_out[21:21]));
	soft   sft26a22
	( 
	.in(wire_sft26a_in[22:22]),
	.out(wire_sft26a_out[22:22]));
	soft   sft26a23
	( 
	.in(wire_sft26a_in[23:23]),
	.out(wire_sft26a_out[23:23]));
	soft   sft26a24
	( 
	.in(wire_sft26a_in[24:24]),
	.out(wire_sft26a_out[24:24]));
	soft   sft26a25
	( 
	.in(wire_sft26a_in[25:25]),
	.out(wire_sft26a_out[25:25]));
	soft   sft26a26
	( 
	.in(wire_sft26a_in[26:26]),
	.out(wire_sft26a_out[26:26]));
	soft   sft26a27
	( 
	.in(wire_sft26a_in[27:27]),
	.out(wire_sft26a_out[27:27]));
	soft   sft26a28
	( 
	.in(wire_sft26a_in[28:28]),
	.out(wire_sft26a_out[28:28]));
	soft   sft26a29
	( 
	.in(wire_sft26a_in[29:29]),
	.out(wire_sft26a_out[29:29]));
	soft   sft26a30
	( 
	.in(wire_sft26a_in[30:30]),
	.out(wire_sft26a_out[30:30]));
	soft   sft26a31
	( 
	.in(wire_sft26a_in[31:31]),
	.out(wire_sft26a_out[31:31]));
	assign
		wire_sft26a_in = wire_add22_result;
	soft   sft28a0
	( 
	.in(wire_sft28a_in[0:0]),
	.out(wire_sft28a_out[0:0]));
	soft   sft28a1
	( 
	.in(wire_sft28a_in[1:1]),
	.out(wire_sft28a_out[1:1]));
	soft   sft28a2
	( 
	.in(wire_sft28a_in[2:2]),
	.out(wire_sft28a_out[2:2]));
	soft   sft28a3
	( 
	.in(wire_sft28a_in[3:3]),
	.out(wire_sft28a_out[3:3]));
	soft   sft28a4
	( 
	.in(wire_sft28a_in[4:4]),
	.out(wire_sft28a_out[4:4]));
	soft   sft28a5
	( 
	.in(wire_sft28a_in[5:5]),
	.out(wire_sft28a_out[5:5]));
	soft   sft28a6
	( 
	.in(wire_sft28a_in[6:6]),
	.out(wire_sft28a_out[6:6]));
	soft   sft28a7
	( 
	.in(wire_sft28a_in[7:7]),
	.out(wire_sft28a_out[7:7]));
	soft   sft28a8
	( 
	.in(wire_sft28a_in[8:8]),
	.out(wire_sft28a_out[8:8]));
	soft   sft28a9
	( 
	.in(wire_sft28a_in[9:9]),
	.out(wire_sft28a_out[9:9]));
	soft   sft28a10
	( 
	.in(wire_sft28a_in[10:10]),
	.out(wire_sft28a_out[10:10]));
	soft   sft28a11
	( 
	.in(wire_sft28a_in[11:11]),
	.out(wire_sft28a_out[11:11]));
	soft   sft28a12
	( 
	.in(wire_sft28a_in[12:12]),
	.out(wire_sft28a_out[12:12]));
	soft   sft28a13
	( 
	.in(wire_sft28a_in[13:13]),
	.out(wire_sft28a_out[13:13]));
	soft   sft28a14
	( 
	.in(wire_sft28a_in[14:14]),
	.out(wire_sft28a_out[14:14]));
	soft   sft28a15
	( 
	.in(wire_sft28a_in[15:15]),
	.out(wire_sft28a_out[15:15]));
	soft   sft28a16
	( 
	.in(wire_sft28a_in[16:16]),
	.out(wire_sft28a_out[16:16]));
	soft   sft28a17
	( 
	.in(wire_sft28a_in[17:17]),
	.out(wire_sft28a_out[17:17]));
	soft   sft28a18
	( 
	.in(wire_sft28a_in[18:18]),
	.out(wire_sft28a_out[18:18]));
	soft   sft28a19
	( 
	.in(wire_sft28a_in[19:19]),
	.out(wire_sft28a_out[19:19]));
	soft   sft28a20
	( 
	.in(wire_sft28a_in[20:20]),
	.out(wire_sft28a_out[20:20]));
	soft   sft28a21
	( 
	.in(wire_sft28a_in[21:21]),
	.out(wire_sft28a_out[21:21]));
	soft   sft28a22
	( 
	.in(wire_sft28a_in[22:22]),
	.out(wire_sft28a_out[22:22]));
	soft   sft28a23
	( 
	.in(wire_sft28a_in[23:23]),
	.out(wire_sft28a_out[23:23]));
	assign
		wire_sft28a_in = {w1191w, {w_sum_node10w[396], {w_sum_node10w[363], {w1159w, {w_sum_node10w[521], {w_sum_node10w[520], {w_sum_node10w[487], {w_sum_node10w[486], {w_sum_node10w[453], {w_sum_node10w[452], {w_sum_node10w[419], {w1159w, {w_sum_node10w[513], {w_sum_node10w[512], {w_sum_node10w[511], {w_sum_node10w[510], {w_sum_node10w[381], {w_sum_node10w[380], {w_sum_node10w[379], {w_sum_node10w[378], {w_sum_node10w[377], {w_sum_node10w[376], {w_sum_node10w[375:374]}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft29a0
	( 
	.in(wire_sft29a_in[0:0]),
	.out(wire_sft29a_out[0:0]));
	soft   sft29a1
	( 
	.in(wire_sft29a_in[1:1]),
	.out(wire_sft29a_out[1:1]));
	soft   sft29a2
	( 
	.in(wire_sft29a_in[2:2]),
	.out(wire_sft29a_out[2:2]));
	soft   sft29a3
	( 
	.in(wire_sft29a_in[3:3]),
	.out(wire_sft29a_out[3:3]));
	soft   sft29a4
	( 
	.in(wire_sft29a_in[4:4]),
	.out(wire_sft29a_out[4:4]));
	soft   sft29a5
	( 
	.in(wire_sft29a_in[5:5]),
	.out(wire_sft29a_out[5:5]));
	soft   sft29a6
	( 
	.in(wire_sft29a_in[6:6]),
	.out(wire_sft29a_out[6:6]));
	soft   sft29a7
	( 
	.in(wire_sft29a_in[7:7]),
	.out(wire_sft29a_out[7:7]));
	soft   sft29a8
	( 
	.in(wire_sft29a_in[8:8]),
	.out(wire_sft29a_out[8:8]));
	soft   sft29a9
	( 
	.in(wire_sft29a_in[9:9]),
	.out(wire_sft29a_out[9:9]));
	soft   sft29a10
	( 
	.in(wire_sft29a_in[10:10]),
	.out(wire_sft29a_out[10:10]));
	soft   sft29a11
	( 
	.in(wire_sft29a_in[11:11]),
	.out(wire_sft29a_out[11:11]));
	soft   sft29a12
	( 
	.in(wire_sft29a_in[12:12]),
	.out(wire_sft29a_out[12:12]));
	soft   sft29a13
	( 
	.in(wire_sft29a_in[13:13]),
	.out(wire_sft29a_out[13:13]));
	soft   sft29a14
	( 
	.in(wire_sft29a_in[14:14]),
	.out(wire_sft29a_out[14:14]));
	soft   sft29a15
	( 
	.in(wire_sft29a_in[15:15]),
	.out(wire_sft29a_out[15:15]));
	soft   sft29a16
	( 
	.in(wire_sft29a_in[16:16]),
	.out(wire_sft29a_out[16:16]));
	soft   sft29a17
	( 
	.in(wire_sft29a_in[17:17]),
	.out(wire_sft29a_out[17:17]));
	soft   sft29a18
	( 
	.in(wire_sft29a_in[18:18]),
	.out(wire_sft29a_out[18:18]));
	soft   sft29a19
	( 
	.in(wire_sft29a_in[19:19]),
	.out(wire_sft29a_out[19:19]));
	soft   sft29a20
	( 
	.in(wire_sft29a_in[20:20]),
	.out(wire_sft29a_out[20:20]));
	soft   sft29a21
	( 
	.in(wire_sft29a_in[21:21]),
	.out(wire_sft29a_out[21:21]));
	soft   sft29a22
	( 
	.in(wire_sft29a_in[22:22]),
	.out(wire_sft29a_out[22:22]));
	soft   sft29a23
	( 
	.in(wire_sft29a_in[23:23]),
	.out(wire_sft29a_out[23:23]));
	assign
		wire_sft29a_in = {w1191w, {w1191w, {w1191w, {w_sum_node10w[394], {w_sum_node10w[361], {w_sum_node10w[360], {w_sum_node10w[327], {w_sum_node10w[326], {w_sum_node10w[293], {w_sum_node10w[292], {w_sum_node10w[259], {w_sum_node10w[130], {w_sum_node10w[97], {w_sum_node10w[96], {w_sum_node10w[95], {w_sum_node10w[94], {w_sum_node10w[221], {w_sum_node10w[220], {w_sum_node10w[219], {w_sum_node10w[218], {w_sum_node10w[217], {w_sum_node10w[216], {w_sum_node10w[215:214]}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft30a0
	( 
	.in(wire_sft30a_in[0:0]),
	.out(wire_sft30a_out[0:0]));
	soft   sft30a1
	( 
	.in(wire_sft30a_in[1:1]),
	.out(wire_sft30a_out[1:1]));
	soft   sft30a2
	( 
	.in(wire_sft30a_in[2:2]),
	.out(wire_sft30a_out[2:2]));
	soft   sft30a3
	( 
	.in(wire_sft30a_in[3:3]),
	.out(wire_sft30a_out[3:3]));
	soft   sft30a4
	( 
	.in(wire_sft30a_in[4:4]),
	.out(wire_sft30a_out[4:4]));
	soft   sft30a5
	( 
	.in(wire_sft30a_in[5:5]),
	.out(wire_sft30a_out[5:5]));
	soft   sft30a6
	( 
	.in(wire_sft30a_in[6:6]),
	.out(wire_sft30a_out[6:6]));
	soft   sft30a7
	( 
	.in(wire_sft30a_in[7:7]),
	.out(wire_sft30a_out[7:7]));
	soft   sft30a8
	( 
	.in(wire_sft30a_in[8:8]),
	.out(wire_sft30a_out[8:8]));
	soft   sft30a9
	( 
	.in(wire_sft30a_in[9:9]),
	.out(wire_sft30a_out[9:9]));
	soft   sft30a10
	( 
	.in(wire_sft30a_in[10:10]),
	.out(wire_sft30a_out[10:10]));
	soft   sft30a11
	( 
	.in(wire_sft30a_in[11:11]),
	.out(wire_sft30a_out[11:11]));
	soft   sft30a12
	( 
	.in(wire_sft30a_in[12:12]),
	.out(wire_sft30a_out[12:12]));
	soft   sft30a13
	( 
	.in(wire_sft30a_in[13:13]),
	.out(wire_sft30a_out[13:13]));
	soft   sft30a14
	( 
	.in(wire_sft30a_in[14:14]),
	.out(wire_sft30a_out[14:14]));
	soft   sft30a15
	( 
	.in(wire_sft30a_in[15:15]),
	.out(wire_sft30a_out[15:15]));
	soft   sft30a16
	( 
	.in(wire_sft30a_in[16:16]),
	.out(wire_sft30a_out[16:16]));
	soft   sft30a17
	( 
	.in(wire_sft30a_in[17:17]),
	.out(wire_sft30a_out[17:17]));
	soft   sft30a18
	( 
	.in(wire_sft30a_in[18:18]),
	.out(wire_sft30a_out[18:18]));
	soft   sft30a19
	( 
	.in(wire_sft30a_in[19:19]),
	.out(wire_sft30a_out[19:19]));
	soft   sft30a20
	( 
	.in(wire_sft30a_in[20:20]),
	.out(wire_sft30a_out[20:20]));
	soft   sft30a21
	( 
	.in(wire_sft30a_in[21:21]),
	.out(wire_sft30a_out[21:21]));
	soft   sft30a22
	( 
	.in(wire_sft30a_in[22:22]),
	.out(wire_sft30a_out[22:22]));
	soft   sft30a23
	( 
	.in(wire_sft30a_in[23:23]),
	.out(wire_sft30a_out[23:23]));
	assign
		wire_sft30a_in = {w1191w, {w1191w, {w1191w, {w1191w, {w_sum_node10w[393], {w1159w, {w_sum_node10w[519], {w_sum_node10w[518], {w_sum_node10w[485], {w_sum_node10w[484], {w_sum_node10w[451], {w_sum_node10w[514], {w1159w, {w_sum_node10w[480], {w_sum_node10w[479], {w_sum_node10w[478], {w_sum_node10w[413], {w_sum_node10w[412], {w_sum_node10w[411], {w_sum_node10w[410], {w_sum_node10w[409], {w_sum_node10w[408], {2{w1191w}}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft31a0
	( 
	.in(wire_sft31a_in[0:0]),
	.out(wire_sft31a_out[0:0]));
	soft   sft31a1
	( 
	.in(wire_sft31a_in[1:1]),
	.out(wire_sft31a_out[1:1]));
	soft   sft31a2
	( 
	.in(wire_sft31a_in[2:2]),
	.out(wire_sft31a_out[2:2]));
	soft   sft31a3
	( 
	.in(wire_sft31a_in[3:3]),
	.out(wire_sft31a_out[3:3]));
	soft   sft31a4
	( 
	.in(wire_sft31a_in[4:4]),
	.out(wire_sft31a_out[4:4]));
	soft   sft31a5
	( 
	.in(wire_sft31a_in[5:5]),
	.out(wire_sft31a_out[5:5]));
	soft   sft31a6
	( 
	.in(wire_sft31a_in[6:6]),
	.out(wire_sft31a_out[6:6]));
	soft   sft31a7
	( 
	.in(wire_sft31a_in[7:7]),
	.out(wire_sft31a_out[7:7]));
	soft   sft31a8
	( 
	.in(wire_sft31a_in[8:8]),
	.out(wire_sft31a_out[8:8]));
	soft   sft31a9
	( 
	.in(wire_sft31a_in[9:9]),
	.out(wire_sft31a_out[9:9]));
	soft   sft31a10
	( 
	.in(wire_sft31a_in[10:10]),
	.out(wire_sft31a_out[10:10]));
	soft   sft31a11
	( 
	.in(wire_sft31a_in[11:11]),
	.out(wire_sft31a_out[11:11]));
	soft   sft31a12
	( 
	.in(wire_sft31a_in[12:12]),
	.out(wire_sft31a_out[12:12]));
	soft   sft31a13
	( 
	.in(wire_sft31a_in[13:13]),
	.out(wire_sft31a_out[13:13]));
	soft   sft31a14
	( 
	.in(wire_sft31a_in[14:14]),
	.out(wire_sft31a_out[14:14]));
	soft   sft31a15
	( 
	.in(wire_sft31a_in[15:15]),
	.out(wire_sft31a_out[15:15]));
	soft   sft31a16
	( 
	.in(wire_sft31a_in[16:16]),
	.out(wire_sft31a_out[16:16]));
	soft   sft31a17
	( 
	.in(wire_sft31a_in[17:17]),
	.out(wire_sft31a_out[17:17]));
	soft   sft31a18
	( 
	.in(wire_sft31a_in[18:18]),
	.out(wire_sft31a_out[18:18]));
	soft   sft31a19
	( 
	.in(wire_sft31a_in[19:19]),
	.out(wire_sft31a_out[19:19]));
	soft   sft31a20
	( 
	.in(wire_sft31a_in[20:20]),
	.out(wire_sft31a_out[20:20]));
	soft   sft31a21
	( 
	.in(wire_sft31a_in[21:21]),
	.out(wire_sft31a_out[21:21]));
	soft   sft31a22
	( 
	.in(wire_sft31a_in[22:22]),
	.out(wire_sft31a_out[22:22]));
	soft   sft31a23
	( 
	.in(wire_sft31a_in[23:23]),
	.out(wire_sft31a_out[23:23]));
	assign
		wire_sft31a_in = wire_add27_result;
	soft   sft33a0
	( 
	.in(wire_sft33a_in[0:0]),
	.out(wire_sft33a_out[0:0]));
	soft   sft33a1
	( 
	.in(wire_sft33a_in[1:1]),
	.out(wire_sft33a_out[1:1]));
	soft   sft33a2
	( 
	.in(wire_sft33a_in[2:2]),
	.out(wire_sft33a_out[2:2]));
	soft   sft33a3
	( 
	.in(wire_sft33a_in[3:3]),
	.out(wire_sft33a_out[3:3]));
	soft   sft33a4
	( 
	.in(wire_sft33a_in[4:4]),
	.out(wire_sft33a_out[4:4]));
	soft   sft33a5
	( 
	.in(wire_sft33a_in[5:5]),
	.out(wire_sft33a_out[5:5]));
	soft   sft33a6
	( 
	.in(wire_sft33a_in[6:6]),
	.out(wire_sft33a_out[6:6]));
	soft   sft33a7
	( 
	.in(wire_sft33a_in[7:7]),
	.out(wire_sft33a_out[7:7]));
	soft   sft33a8
	( 
	.in(wire_sft33a_in[8:8]),
	.out(wire_sft33a_out[8:8]));
	soft   sft33a9
	( 
	.in(wire_sft33a_in[9:9]),
	.out(wire_sft33a_out[9:9]));
	soft   sft33a10
	( 
	.in(wire_sft33a_in[10:10]),
	.out(wire_sft33a_out[10:10]));
	soft   sft33a11
	( 
	.in(wire_sft33a_in[11:11]),
	.out(wire_sft33a_out[11:11]));
	soft   sft33a12
	( 
	.in(wire_sft33a_in[12:12]),
	.out(wire_sft33a_out[12:12]));
	soft   sft33a13
	( 
	.in(wire_sft33a_in[13:13]),
	.out(wire_sft33a_out[13:13]));
	soft   sft33a14
	( 
	.in(wire_sft33a_in[14:14]),
	.out(wire_sft33a_out[14:14]));
	soft   sft33a15
	( 
	.in(wire_sft33a_in[15:15]),
	.out(wire_sft33a_out[15:15]));
	assign
		wire_sft33a_in = {w1191w, {w_sum_node10w[392], {w_sum_node10w[359], {w_sum_node10w[294], {w1191w, {w_sum_node10w[260], {w_sum_node10w[483], {w_sum_node10w[418], {w_sum_node10w[385], {w_sum_node10w[384], {w_sum_node10w[383], {w_sum_node10w[382], {w_sum_node10w[445], {w_sum_node10w[444], {w_sum_node10w[443:442]}}}}}}}}}}}}}}};
	soft   sft34a0
	( 
	.in(wire_sft34a_in[0:0]),
	.out(wire_sft34a_out[0:0]));
	soft   sft34a1
	( 
	.in(wire_sft34a_in[1:1]),
	.out(wire_sft34a_out[1:1]));
	soft   sft34a2
	( 
	.in(wire_sft34a_in[2:2]),
	.out(wire_sft34a_out[2:2]));
	soft   sft34a3
	( 
	.in(wire_sft34a_in[3:3]),
	.out(wire_sft34a_out[3:3]));
	soft   sft34a4
	( 
	.in(wire_sft34a_in[4:4]),
	.out(wire_sft34a_out[4:4]));
	soft   sft34a5
	( 
	.in(wire_sft34a_in[5:5]),
	.out(wire_sft34a_out[5:5]));
	soft   sft34a6
	( 
	.in(wire_sft34a_in[6:6]),
	.out(wire_sft34a_out[6:6]));
	soft   sft34a7
	( 
	.in(wire_sft34a_in[7:7]),
	.out(wire_sft34a_out[7:7]));
	soft   sft34a8
	( 
	.in(wire_sft34a_in[8:8]),
	.out(wire_sft34a_out[8:8]));
	soft   sft34a9
	( 
	.in(wire_sft34a_in[9:9]),
	.out(wire_sft34a_out[9:9]));
	soft   sft34a10
	( 
	.in(wire_sft34a_in[10:10]),
	.out(wire_sft34a_out[10:10]));
	soft   sft34a11
	( 
	.in(wire_sft34a_in[11:11]),
	.out(wire_sft34a_out[11:11]));
	soft   sft34a12
	( 
	.in(wire_sft34a_in[12:12]),
	.out(wire_sft34a_out[12:12]));
	soft   sft34a13
	( 
	.in(wire_sft34a_in[13:13]),
	.out(wire_sft34a_out[13:13]));
	soft   sft34a14
	( 
	.in(wire_sft34a_in[14:14]),
	.out(wire_sft34a_out[14:14]));
	soft   sft34a15
	( 
	.in(wire_sft34a_in[15:15]),
	.out(wire_sft34a_out[15:15]));
	assign
		wire_sft34a_in = {w1191w, {w1191w, {(~ w_sum_node10w[135]), {w_sum_node10w[166], {w1191w, {w_sum_node10w[132], {w1191w, {w_sum_node10w[258], {w_sum_node10w[225], {w_sum_node10w[224], {w_sum_node10w[223], {w_sum_node10w[222], {w_sum_node10w[285], {w_sum_node10w[284], {w_sum_node10w[283:282]}}}}}}}}}}}}}}};
	soft   sft35a0
	( 
	.in(wire_sft35a_in[0:0]),
	.out(wire_sft35a_out[0:0]));
	soft   sft35a1
	( 
	.in(wire_sft35a_in[1:1]),
	.out(wire_sft35a_out[1:1]));
	soft   sft35a2
	( 
	.in(wire_sft35a_in[2:2]),
	.out(wire_sft35a_out[2:2]));
	soft   sft35a3
	( 
	.in(wire_sft35a_in[3:3]),
	.out(wire_sft35a_out[3:3]));
	soft   sft35a4
	( 
	.in(wire_sft35a_in[4:4]),
	.out(wire_sft35a_out[4:4]));
	soft   sft35a5
	( 
	.in(wire_sft35a_in[5:5]),
	.out(wire_sft35a_out[5:5]));
	soft   sft35a6
	( 
	.in(wire_sft35a_in[6:6]),
	.out(wire_sft35a_out[6:6]));
	soft   sft35a7
	( 
	.in(wire_sft35a_in[7:7]),
	.out(wire_sft35a_out[7:7]));
	soft   sft35a8
	( 
	.in(wire_sft35a_in[8:8]),
	.out(wire_sft35a_out[8:8]));
	soft   sft35a9
	( 
	.in(wire_sft35a_in[9:9]),
	.out(wire_sft35a_out[9:9]));
	soft   sft35a10
	( 
	.in(wire_sft35a_in[10:10]),
	.out(wire_sft35a_out[10:10]));
	soft   sft35a11
	( 
	.in(wire_sft35a_in[11:11]),
	.out(wire_sft35a_out[11:11]));
	soft   sft35a12
	( 
	.in(wire_sft35a_in[12:12]),
	.out(wire_sft35a_out[12:12]));
	soft   sft35a13
	( 
	.in(wire_sft35a_in[13:13]),
	.out(wire_sft35a_out[13:13]));
	soft   sft35a14
	( 
	.in(wire_sft35a_in[14:14]),
	.out(wire_sft35a_out[14:14]));
	soft   sft35a15
	( 
	.in(wire_sft35a_in[15:15]),
	.out(wire_sft35a_out[15:15]));
	assign
		wire_sft35a_in = {w1191w, {w1191w, {w1191w, {w1159w, {w1191w, {w_sum_node10w[356], {w1191w, {w_sum_node10w[450], {w_sum_node10w[417], {w_sum_node10w[416], {w_sum_node10w[415], {w_sum_node10w[414], {w_sum_node10w[477], {w_sum_node10w[476], {2{w1191w}}}}}}}}}}}}}}}};
	soft   sft36a0
	( 
	.in(wire_sft36a_in[0:0]),
	.out(wire_sft36a_out[0:0]));
	soft   sft36a1
	( 
	.in(wire_sft36a_in[1:1]),
	.out(wire_sft36a_out[1:1]));
	soft   sft36a2
	( 
	.in(wire_sft36a_in[2:2]),
	.out(wire_sft36a_out[2:2]));
	soft   sft36a3
	( 
	.in(wire_sft36a_in[3:3]),
	.out(wire_sft36a_out[3:3]));
	soft   sft36a4
	( 
	.in(wire_sft36a_in[4:4]),
	.out(wire_sft36a_out[4:4]));
	soft   sft36a5
	( 
	.in(wire_sft36a_in[5:5]),
	.out(wire_sft36a_out[5:5]));
	soft   sft36a6
	( 
	.in(wire_sft36a_in[6:6]),
	.out(wire_sft36a_out[6:6]));
	soft   sft36a7
	( 
	.in(wire_sft36a_in[7:7]),
	.out(wire_sft36a_out[7:7]));
	soft   sft36a8
	( 
	.in(wire_sft36a_in[8:8]),
	.out(wire_sft36a_out[8:8]));
	soft   sft36a9
	( 
	.in(wire_sft36a_in[9:9]),
	.out(wire_sft36a_out[9:9]));
	soft   sft36a10
	( 
	.in(wire_sft36a_in[10:10]),
	.out(wire_sft36a_out[10:10]));
	soft   sft36a11
	( 
	.in(wire_sft36a_in[11:11]),
	.out(wire_sft36a_out[11:11]));
	soft   sft36a12
	( 
	.in(wire_sft36a_in[12:12]),
	.out(wire_sft36a_out[12:12]));
	soft   sft36a13
	( 
	.in(wire_sft36a_in[13:13]),
	.out(wire_sft36a_out[13:13]));
	soft   sft36a14
	( 
	.in(wire_sft36a_in[14:14]),
	.out(wire_sft36a_out[14:14]));
	soft   sft36a15
	( 
	.in(wire_sft36a_in[15:15]),
	.out(wire_sft36a_out[15:15]));
	assign
		wire_sft36a_in = wire_add32_result;
	soft   sft38a0
	( 
	.in(wire_sft38a_in[0:0]),
	.out(wire_sft38a_out[0:0]));
	soft   sft38a1
	( 
	.in(wire_sft38a_in[1:1]),
	.out(wire_sft38a_out[1:1]));
	soft   sft38a2
	( 
	.in(wire_sft38a_in[2:2]),
	.out(wire_sft38a_out[2:2]));
	soft   sft38a3
	( 
	.in(wire_sft38a_in[3:3]),
	.out(wire_sft38a_out[3:3]));
	soft   sft38a4
	( 
	.in(wire_sft38a_in[4:4]),
	.out(wire_sft38a_out[4:4]));
	soft   sft38a5
	( 
	.in(wire_sft38a_in[5:5]),
	.out(wire_sft38a_out[5:5]));
	soft   sft38a6
	( 
	.in(wire_sft38a_in[6:6]),
	.out(wire_sft38a_out[6:6]));
	soft   sft38a7
	( 
	.in(wire_sft38a_in[7:7]),
	.out(wire_sft38a_out[7:7]));
	soft   sft38a8
	( 
	.in(wire_sft38a_in[8:8]),
	.out(wire_sft38a_out[8:8]));
	soft   sft38a9
	( 
	.in(wire_sft38a_in[9:9]),
	.out(wire_sft38a_out[9:9]));
	assign
		wire_sft38a_in = {w1191w, {w1191w, {w_sum_node10w[261], {w_sum_node10w[516], {w_sum_node10w[227], {w_sum_node10w[482], {w_sum_node10w[449], {w_sum_node10w[448], {w_sum_node10w[447:446]}}}}}}}}};
	soft   sft39a0
	( 
	.in(wire_sft39a_in[0:0]),
	.out(wire_sft39a_out[0:0]));
	soft   sft39a1
	( 
	.in(wire_sft39a_in[1:1]),
	.out(wire_sft39a_out[1:1]));
	soft   sft39a2
	( 
	.in(wire_sft39a_in[2:2]),
	.out(wire_sft39a_out[2:2]));
	soft   sft39a3
	( 
	.in(wire_sft39a_in[3:3]),
	.out(wire_sft39a_out[3:3]));
	soft   sft39a4
	( 
	.in(wire_sft39a_in[4:4]),
	.out(wire_sft39a_out[4:4]));
	soft   sft39a5
	( 
	.in(wire_sft39a_in[5:5]),
	.out(wire_sft39a_out[5:5]));
	soft   sft39a6
	( 
	.in(wire_sft39a_in[6:6]),
	.out(wire_sft39a_out[6:6]));
	soft   sft39a7
	( 
	.in(wire_sft39a_in[7:7]),
	.out(wire_sft39a_out[7:7]));
	soft   sft39a8
	( 
	.in(wire_sft39a_in[8:8]),
	.out(wire_sft39a_out[8:8]));
	soft   sft39a9
	( 
	.in(wire_sft39a_in[9:9]),
	.out(wire_sft39a_out[9:9]));
	assign
		wire_sft39a_in = {w1191w, {w1191w, {w_sum_node10w[133], {w1191w, {w_sum_node10w[99], {w_sum_node10w[322], {w_sum_node10w[289], {w_sum_node10w[288], {w_sum_node10w[287:286]}}}}}}}}};
	soft   sft3a0
	( 
	.in(wire_sft3a_in[0:0]),
	.out(wire_sft3a_out[0:0]));
	soft   sft3a1
	( 
	.in(wire_sft3a_in[1:1]),
	.out(wire_sft3a_out[1:1]));
	soft   sft3a2
	( 
	.in(wire_sft3a_in[2:2]),
	.out(wire_sft3a_out[2:2]));
	soft   sft3a3
	( 
	.in(wire_sft3a_in[3:3]),
	.out(wire_sft3a_out[3:3]));
	soft   sft3a4
	( 
	.in(wire_sft3a_in[4:4]),
	.out(wire_sft3a_out[4:4]));
	soft   sft3a5
	( 
	.in(wire_sft3a_in[5:5]),
	.out(wire_sft3a_out[5:5]));
	soft   sft3a6
	( 
	.in(wire_sft3a_in[6:6]),
	.out(wire_sft3a_out[6:6]));
	soft   sft3a7
	( 
	.in(wire_sft3a_in[7:7]),
	.out(wire_sft3a_out[7:7]));
	soft   sft3a8
	( 
	.in(wire_sft3a_in[8:8]),
	.out(wire_sft3a_out[8:8]));
	soft   sft3a9
	( 
	.in(wire_sft3a_in[9:9]),
	.out(wire_sft3a_out[9:9]));
	soft   sft3a10
	( 
	.in(wire_sft3a_in[10:10]),
	.out(wire_sft3a_out[10:10]));
	soft   sft3a11
	( 
	.in(wire_sft3a_in[11:11]),
	.out(wire_sft3a_out[11:11]));
	soft   sft3a12
	( 
	.in(wire_sft3a_in[12:12]),
	.out(wire_sft3a_out[12:12]));
	soft   sft3a13
	( 
	.in(wire_sft3a_in[13:13]),
	.out(wire_sft3a_out[13:13]));
	soft   sft3a14
	( 
	.in(wire_sft3a_in[14:14]),
	.out(wire_sft3a_out[14:14]));
	soft   sft3a15
	( 
	.in(wire_sft3a_in[15:15]),
	.out(wire_sft3a_out[15:15]));
	soft   sft3a16
	( 
	.in(wire_sft3a_in[16:16]),
	.out(wire_sft3a_out[16:16]));
	soft   sft3a17
	( 
	.in(wire_sft3a_in[17:17]),
	.out(wire_sft3a_out[17:17]));
	soft   sft3a18
	( 
	.in(wire_sft3a_in[18:18]),
	.out(wire_sft3a_out[18:18]));
	soft   sft3a19
	( 
	.in(wire_sft3a_in[19:19]),
	.out(wire_sft3a_out[19:19]));
	soft   sft3a20
	( 
	.in(wire_sft3a_in[20:20]),
	.out(wire_sft3a_out[20:20]));
	soft   sft3a21
	( 
	.in(wire_sft3a_in[21:21]),
	.out(wire_sft3a_out[21:21]));
	soft   sft3a22
	( 
	.in(wire_sft3a_in[22:22]),
	.out(wire_sft3a_out[22:22]));
	soft   sft3a23
	( 
	.in(wire_sft3a_in[23:23]),
	.out(wire_sft3a_out[23:23]));
	soft   sft3a24
	( 
	.in(wire_sft3a_in[24:24]),
	.out(wire_sft3a_out[24:24]));
	soft   sft3a25
	( 
	.in(wire_sft3a_in[25:25]),
	.out(wire_sft3a_out[25:25]));
	soft   sft3a26
	( 
	.in(wire_sft3a_in[26:26]),
	.out(wire_sft3a_out[26:26]));
	soft   sft3a27
	( 
	.in(wire_sft3a_in[27:27]),
	.out(wire_sft3a_out[27:27]));
	soft   sft3a28
	( 
	.in(wire_sft3a_in[28:28]),
	.out(wire_sft3a_out[28:28]));
	soft   sft3a29
	( 
	.in(wire_sft3a_in[29:29]),
	.out(wire_sft3a_out[29:29]));
	soft   sft3a30
	( 
	.in(wire_sft3a_in[30:30]),
	.out(wire_sft3a_out[30:30]));
	soft   sft3a31
	( 
	.in(wire_sft3a_in[31:31]),
	.out(wire_sft3a_out[31:31]));
	soft   sft3a32
	( 
	.in(wire_sft3a_in[32:32]),
	.out(wire_sft3a_out[32:32]));
	soft   sft3a33
	( 
	.in(wire_sft3a_in[33:33]),
	.out(wire_sft3a_out[33:33]));
	soft   sft3a34
	( 
	.in(wire_sft3a_in[34:34]),
	.out(wire_sft3a_out[34:34]));
	soft   sft3a35
	( 
	.in(wire_sft3a_in[35:35]),
	.out(wire_sft3a_out[35:35]));
	soft   sft3a36
	( 
	.in(wire_sft3a_in[36:36]),
	.out(wire_sft3a_out[36:36]));
	soft   sft3a37
	( 
	.in(wire_sft3a_in[37:37]),
	.out(wire_sft3a_out[37:37]));
	soft   sft3a38
	( 
	.in(wire_sft3a_in[38:38]),
	.out(wire_sft3a_out[38:38]));
	soft   sft3a39
	( 
	.in(wire_sft3a_in[39:39]),
	.out(wire_sft3a_out[39:39]));
	soft   sft3a40
	( 
	.in(wire_sft3a_in[40:40]),
	.out(wire_sft3a_out[40:40]));
	soft   sft3a41
	( 
	.in(wire_sft3a_in[41:41]),
	.out(wire_sft3a_out[41:41]));
	soft   sft3a42
	( 
	.in(wire_sft3a_in[42:42]),
	.out(wire_sft3a_out[42:42]));
	soft   sft3a43
	( 
	.in(wire_sft3a_in[43:43]),
	.out(wire_sft3a_out[43:43]));
	soft   sft3a44
	( 
	.in(wire_sft3a_in[44:44]),
	.out(wire_sft3a_out[44:44]));
	soft   sft3a45
	( 
	.in(wire_sft3a_in[45:45]),
	.out(wire_sft3a_out[45:45]));
	soft   sft3a46
	( 
	.in(wire_sft3a_in[46:46]),
	.out(wire_sft3a_out[46:46]));
	soft   sft3a47
	( 
	.in(wire_sft3a_in[47:47]),
	.out(wire_sft3a_out[47:47]));
	soft   sft3a48
	( 
	.in(wire_sft3a_in[48:48]),
	.out(wire_sft3a_out[48:48]));
	soft   sft3a49
	( 
	.in(wire_sft3a_in[49:49]),
	.out(wire_sft3a_out[49:49]));
	soft   sft3a50
	( 
	.in(wire_sft3a_in[50:50]),
	.out(wire_sft3a_out[50:50]));
	soft   sft3a51
	( 
	.in(wire_sft3a_in[51:51]),
	.out(wire_sft3a_out[51:51]));
	soft   sft3a52
	( 
	.in(wire_sft3a_in[52:52]),
	.out(wire_sft3a_out[52:52]));
	soft   sft3a53
	( 
	.in(wire_sft3a_in[53:53]),
	.out(wire_sft3a_out[53:53]));
	soft   sft3a54
	( 
	.in(wire_sft3a_in[54:54]),
	.out(wire_sft3a_out[54:54]));
	soft   sft3a55
	( 
	.in(wire_sft3a_in[55:55]),
	.out(wire_sft3a_out[55:55]));
	soft   sft3a56
	( 
	.in(wire_sft3a_in[56:56]),
	.out(wire_sft3a_out[56:56]));
	soft   sft3a57
	( 
	.in(wire_sft3a_in[57:57]),
	.out(wire_sft3a_out[57:57]));
	soft   sft3a58
	( 
	.in(wire_sft3a_in[58:58]),
	.out(wire_sft3a_out[58:58]));
	soft   sft3a59
	( 
	.in(wire_sft3a_in[59:59]),
	.out(wire_sft3a_out[59:59]));
	soft   sft3a60
	( 
	.in(wire_sft3a_in[60:60]),
	.out(wire_sft3a_out[60:60]));
	soft   sft3a61
	( 
	.in(wire_sft3a_in[61:61]),
	.out(wire_sft3a_out[61:61]));
	soft   sft3a62
	( 
	.in(wire_sft3a_in[62:62]),
	.out(wire_sft3a_out[62:62]));
	assign
		wire_sft3a_in = {w1159w, {(~ w_sum_node10w[543]), {w_sum_node10w[542], {(~ w_sum_node10w[509]), {w1159w, {w_sum_node10w[539], {w_sum_node10w[474], {w_sum_node10w[473], {w_sum_node10w[472], {w_sum_node10w[439], {w_sum_node10w[406], {wire_sft11a_out[47], {wire_sft11a_out[46], {wire_sft11a_out[45], {wire_sft11a_out[44], {wire_sft11a_out[43], {wire_sft11a_out[42], {wire_sft11a_out[41], {wire_sft11a_out[40], {wire_sft11a_out[39], {wire_sft11a_out[38], {wire_sft11a_out[37], {wire_sft11a_out[36], {wire_sft11a_out[35], {wire_sft11a_out[34], {wire_sft11a_out[33], {wire_sft11a_out[32], {wire_sft11a_out[31], {wire_sft11a_out[30], {wire_sft11a_out[29], {wire_sft11a_out[28], {wire_sft11a_out[27], {wire_sft11a_out[26], {wire_sft11a_out[25], {wire_sft11a_out[24], {wire_sft11a_out[23], {wire_sft11a_out[22], {wire_sft11a_out[21], {wire_sft11a_out[20], {wire_sft11a_out[19], {wire_sft11a_out[18], {wire_sft11a_out[17], {wire_sft11a_out[16], {wire_sft11a_out[15], {wire_sft11a_out[14], {wire_sft11a_out[13], {wire_sft11a_out[12], {wire_sft11a_out[11], {wire_sft11a_out[10], {wire_sft11a_out[9], {wire_sft11a_out[8], {w_sum_node10w[13], {w_sum_node10w[12], {w_sum_node10w[11], {w_sum_node10w[10], {w_sum_node10w[9], {w_sum_node10w[8], {w_sum_node10w[7], {w_sum_node10w[6], {w_sum_node10w[5], {w_sum_node10w[4], {w_sum_node10w[3:2]}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft40a0
	( 
	.in(wire_sft40a_in[0:0]),
	.out(wire_sft40a_out[0:0]));
	soft   sft40a1
	( 
	.in(wire_sft40a_in[1:1]),
	.out(wire_sft40a_out[1:1]));
	soft   sft40a2
	( 
	.in(wire_sft40a_in[2:2]),
	.out(wire_sft40a_out[2:2]));
	soft   sft40a3
	( 
	.in(wire_sft40a_in[3:3]),
	.out(wire_sft40a_out[3:3]));
	soft   sft40a4
	( 
	.in(wire_sft40a_in[4:4]),
	.out(wire_sft40a_out[4:4]));
	soft   sft40a5
	( 
	.in(wire_sft40a_in[5:5]),
	.out(wire_sft40a_out[5:5]));
	soft   sft40a6
	( 
	.in(wire_sft40a_in[6:6]),
	.out(wire_sft40a_out[6:6]));
	soft   sft40a7
	( 
	.in(wire_sft40a_in[7:7]),
	.out(wire_sft40a_out[7:7]));
	soft   sft40a8
	( 
	.in(wire_sft40a_in[8:8]),
	.out(wire_sft40a_out[8:8]));
	soft   sft40a9
	( 
	.in(wire_sft40a_in[9:9]),
	.out(wire_sft40a_out[9:9]));
	assign
		wire_sft40a_in = {w1191w, {w1191w, {w_sum_node10w[517], {w1191w, {w_sum_node10w[323], {w1191w, {w_sum_node10w[481], {w1191w, {2{w1191w}}}}}}}}}};
	soft   sft41a0
	( 
	.in(wire_sft41a_in[0:0]),
	.out(wire_sft41a_out[0:0]));
	soft   sft41a1
	( 
	.in(wire_sft41a_in[1:1]),
	.out(wire_sft41a_out[1:1]));
	soft   sft41a2
	( 
	.in(wire_sft41a_in[2:2]),
	.out(wire_sft41a_out[2:2]));
	soft   sft41a3
	( 
	.in(wire_sft41a_in[3:3]),
	.out(wire_sft41a_out[3:3]));
	soft   sft41a4
	( 
	.in(wire_sft41a_in[4:4]),
	.out(wire_sft41a_out[4:4]));
	soft   sft41a5
	( 
	.in(wire_sft41a_in[5:5]),
	.out(wire_sft41a_out[5:5]));
	soft   sft41a6
	( 
	.in(wire_sft41a_in[6:6]),
	.out(wire_sft41a_out[6:6]));
	soft   sft41a7
	( 
	.in(wire_sft41a_in[7:7]),
	.out(wire_sft41a_out[7:7]));
	soft   sft41a8
	( 
	.in(wire_sft41a_in[8:8]),
	.out(wire_sft41a_out[8:8]));
	soft   sft41a9
	( 
	.in(wire_sft41a_in[9:9]),
	.out(wire_sft41a_out[9:9]));
	assign
		wire_sft41a_in = wire_add37_result;
	soft   sft4a0
	( 
	.in(wire_sft4a_in[0:0]),
	.out(wire_sft4a_out[0:0]));
	soft   sft4a1
	( 
	.in(wire_sft4a_in[1:1]),
	.out(wire_sft4a_out[1:1]));
	soft   sft4a2
	( 
	.in(wire_sft4a_in[2:2]),
	.out(wire_sft4a_out[2:2]));
	soft   sft4a3
	( 
	.in(wire_sft4a_in[3:3]),
	.out(wire_sft4a_out[3:3]));
	soft   sft4a4
	( 
	.in(wire_sft4a_in[4:4]),
	.out(wire_sft4a_out[4:4]));
	soft   sft4a5
	( 
	.in(wire_sft4a_in[5:5]),
	.out(wire_sft4a_out[5:5]));
	soft   sft4a6
	( 
	.in(wire_sft4a_in[6:6]),
	.out(wire_sft4a_out[6:6]));
	soft   sft4a7
	( 
	.in(wire_sft4a_in[7:7]),
	.out(wire_sft4a_out[7:7]));
	soft   sft4a8
	( 
	.in(wire_sft4a_in[8:8]),
	.out(wire_sft4a_out[8:8]));
	soft   sft4a9
	( 
	.in(wire_sft4a_in[9:9]),
	.out(wire_sft4a_out[9:9]));
	soft   sft4a10
	( 
	.in(wire_sft4a_in[10:10]),
	.out(wire_sft4a_out[10:10]));
	soft   sft4a11
	( 
	.in(wire_sft4a_in[11:11]),
	.out(wire_sft4a_out[11:11]));
	soft   sft4a12
	( 
	.in(wire_sft4a_in[12:12]),
	.out(wire_sft4a_out[12:12]));
	soft   sft4a13
	( 
	.in(wire_sft4a_in[13:13]),
	.out(wire_sft4a_out[13:13]));
	soft   sft4a14
	( 
	.in(wire_sft4a_in[14:14]),
	.out(wire_sft4a_out[14:14]));
	soft   sft4a15
	( 
	.in(wire_sft4a_in[15:15]),
	.out(wire_sft4a_out[15:15]));
	soft   sft4a16
	( 
	.in(wire_sft4a_in[16:16]),
	.out(wire_sft4a_out[16:16]));
	soft   sft4a17
	( 
	.in(wire_sft4a_in[17:17]),
	.out(wire_sft4a_out[17:17]));
	soft   sft4a18
	( 
	.in(wire_sft4a_in[18:18]),
	.out(wire_sft4a_out[18:18]));
	soft   sft4a19
	( 
	.in(wire_sft4a_in[19:19]),
	.out(wire_sft4a_out[19:19]));
	soft   sft4a20
	( 
	.in(wire_sft4a_in[20:20]),
	.out(wire_sft4a_out[20:20]));
	soft   sft4a21
	( 
	.in(wire_sft4a_in[21:21]),
	.out(wire_sft4a_out[21:21]));
	soft   sft4a22
	( 
	.in(wire_sft4a_in[22:22]),
	.out(wire_sft4a_out[22:22]));
	soft   sft4a23
	( 
	.in(wire_sft4a_in[23:23]),
	.out(wire_sft4a_out[23:23]));
	soft   sft4a24
	( 
	.in(wire_sft4a_in[24:24]),
	.out(wire_sft4a_out[24:24]));
	soft   sft4a25
	( 
	.in(wire_sft4a_in[25:25]),
	.out(wire_sft4a_out[25:25]));
	soft   sft4a26
	( 
	.in(wire_sft4a_in[26:26]),
	.out(wire_sft4a_out[26:26]));
	soft   sft4a27
	( 
	.in(wire_sft4a_in[27:27]),
	.out(wire_sft4a_out[27:27]));
	soft   sft4a28
	( 
	.in(wire_sft4a_in[28:28]),
	.out(wire_sft4a_out[28:28]));
	soft   sft4a29
	( 
	.in(wire_sft4a_in[29:29]),
	.out(wire_sft4a_out[29:29]));
	soft   sft4a30
	( 
	.in(wire_sft4a_in[30:30]),
	.out(wire_sft4a_out[30:30]));
	soft   sft4a31
	( 
	.in(wire_sft4a_in[31:31]),
	.out(wire_sft4a_out[31:31]));
	soft   sft4a32
	( 
	.in(wire_sft4a_in[32:32]),
	.out(wire_sft4a_out[32:32]));
	soft   sft4a33
	( 
	.in(wire_sft4a_in[33:33]),
	.out(wire_sft4a_out[33:33]));
	soft   sft4a34
	( 
	.in(wire_sft4a_in[34:34]),
	.out(wire_sft4a_out[34:34]));
	soft   sft4a35
	( 
	.in(wire_sft4a_in[35:35]),
	.out(wire_sft4a_out[35:35]));
	soft   sft4a36
	( 
	.in(wire_sft4a_in[36:36]),
	.out(wire_sft4a_out[36:36]));
	soft   sft4a37
	( 
	.in(wire_sft4a_in[37:37]),
	.out(wire_sft4a_out[37:37]));
	soft   sft4a38
	( 
	.in(wire_sft4a_in[38:38]),
	.out(wire_sft4a_out[38:38]));
	soft   sft4a39
	( 
	.in(wire_sft4a_in[39:39]),
	.out(wire_sft4a_out[39:39]));
	soft   sft4a40
	( 
	.in(wire_sft4a_in[40:40]),
	.out(wire_sft4a_out[40:40]));
	soft   sft4a41
	( 
	.in(wire_sft4a_in[41:41]),
	.out(wire_sft4a_out[41:41]));
	soft   sft4a42
	( 
	.in(wire_sft4a_in[42:42]),
	.out(wire_sft4a_out[42:42]));
	soft   sft4a43
	( 
	.in(wire_sft4a_in[43:43]),
	.out(wire_sft4a_out[43:43]));
	soft   sft4a44
	( 
	.in(wire_sft4a_in[44:44]),
	.out(wire_sft4a_out[44:44]));
	soft   sft4a45
	( 
	.in(wire_sft4a_in[45:45]),
	.out(wire_sft4a_out[45:45]));
	soft   sft4a46
	( 
	.in(wire_sft4a_in[46:46]),
	.out(wire_sft4a_out[46:46]));
	soft   sft4a47
	( 
	.in(wire_sft4a_in[47:47]),
	.out(wire_sft4a_out[47:47]));
	soft   sft4a48
	( 
	.in(wire_sft4a_in[48:48]),
	.out(wire_sft4a_out[48:48]));
	soft   sft4a49
	( 
	.in(wire_sft4a_in[49:49]),
	.out(wire_sft4a_out[49:49]));
	soft   sft4a50
	( 
	.in(wire_sft4a_in[50:50]),
	.out(wire_sft4a_out[50:50]));
	soft   sft4a51
	( 
	.in(wire_sft4a_in[51:51]),
	.out(wire_sft4a_out[51:51]));
	soft   sft4a52
	( 
	.in(wire_sft4a_in[52:52]),
	.out(wire_sft4a_out[52:52]));
	soft   sft4a53
	( 
	.in(wire_sft4a_in[53:53]),
	.out(wire_sft4a_out[53:53]));
	soft   sft4a54
	( 
	.in(wire_sft4a_in[54:54]),
	.out(wire_sft4a_out[54:54]));
	soft   sft4a55
	( 
	.in(wire_sft4a_in[55:55]),
	.out(wire_sft4a_out[55:55]));
	soft   sft4a56
	( 
	.in(wire_sft4a_in[56:56]),
	.out(wire_sft4a_out[56:56]));
	soft   sft4a57
	( 
	.in(wire_sft4a_in[57:57]),
	.out(wire_sft4a_out[57:57]));
	soft   sft4a58
	( 
	.in(wire_sft4a_in[58:58]),
	.out(wire_sft4a_out[58:58]));
	soft   sft4a59
	( 
	.in(wire_sft4a_in[59:59]),
	.out(wire_sft4a_out[59:59]));
	soft   sft4a60
	( 
	.in(wire_sft4a_in[60:60]),
	.out(wire_sft4a_out[60:60]));
	soft   sft4a61
	( 
	.in(wire_sft4a_in[61:61]),
	.out(wire_sft4a_out[61:61]));
	soft   sft4a62
	( 
	.in(wire_sft4a_in[62:62]),
	.out(wire_sft4a_out[62:62]));
	assign
		wire_sft4a_in = {w1191w, {w1191w, {w1159w, {w_sum_node10w[541], {w_sum_node10w[540], {w_sum_node10w[507], {w_sum_node10w[506], {wire_sft11a_out[51], {wire_sft11a_out[50], {wire_sft11a_out[49], {wire_sft11a_out[48], {wire_sft16a_out[43], {wire_sft16a_out[42], {wire_sft16a_out[41], {wire_sft16a_out[40], {wire_sft16a_out[39], {wire_sft16a_out[38], {wire_sft16a_out[37], {wire_sft16a_out[36], {wire_sft16a_out[35], {wire_sft16a_out[34], {wire_sft16a_out[33], {wire_sft16a_out[32], {wire_sft16a_out[31], {wire_sft16a_out[30], {wire_sft16a_out[29], {wire_sft16a_out[28], {wire_sft16a_out[27], {wire_sft16a_out[26], {wire_sft16a_out[25], {wire_sft16a_out[24], {wire_sft16a_out[23], {wire_sft16a_out[22], {wire_sft16a_out[21], {wire_sft16a_out[20], {wire_sft16a_out[19], {wire_sft16a_out[18], {wire_sft16a_out[17], {wire_sft16a_out[16], {wire_sft16a_out[15], {wire_sft16a_out[14], {wire_sft16a_out[13], {wire_sft16a_out[12], {wire_sft16a_out[11], {wire_sft16a_out[10], {wire_sft16a_out[9], {wire_sft16a_out[8], {wire_sft16a_out[7], {wire_sft16a_out[6], {wire_sft16a_out[5], {wire_sft16a_out[4], {wire_sft11a_out[7], {wire_sft11a_out[6], {wire_sft11a_out[5], {wire_sft11a_out[4], {w_sum_node10w[41], {w_sum_node10w[40], {w_sum_node10w[39], {w_sum_node10w[38], {w_sum_node10w[37], {w_sum_node10w[36], {w_sum_node10w[35:34]}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft5a0
	( 
	.in(wire_sft5a_in[0:0]),
	.out(wire_sft5a_out[0:0]));
	soft   sft5a1
	( 
	.in(wire_sft5a_in[1:1]),
	.out(wire_sft5a_out[1:1]));
	soft   sft5a2
	( 
	.in(wire_sft5a_in[2:2]),
	.out(wire_sft5a_out[2:2]));
	soft   sft5a3
	( 
	.in(wire_sft5a_in[3:3]),
	.out(wire_sft5a_out[3:3]));
	soft   sft5a4
	( 
	.in(wire_sft5a_in[4:4]),
	.out(wire_sft5a_out[4:4]));
	soft   sft5a5
	( 
	.in(wire_sft5a_in[5:5]),
	.out(wire_sft5a_out[5:5]));
	soft   sft5a6
	( 
	.in(wire_sft5a_in[6:6]),
	.out(wire_sft5a_out[6:6]));
	soft   sft5a7
	( 
	.in(wire_sft5a_in[7:7]),
	.out(wire_sft5a_out[7:7]));
	soft   sft5a8
	( 
	.in(wire_sft5a_in[8:8]),
	.out(wire_sft5a_out[8:8]));
	soft   sft5a9
	( 
	.in(wire_sft5a_in[9:9]),
	.out(wire_sft5a_out[9:9]));
	soft   sft5a10
	( 
	.in(wire_sft5a_in[10:10]),
	.out(wire_sft5a_out[10:10]));
	soft   sft5a11
	( 
	.in(wire_sft5a_in[11:11]),
	.out(wire_sft5a_out[11:11]));
	soft   sft5a12
	( 
	.in(wire_sft5a_in[12:12]),
	.out(wire_sft5a_out[12:12]));
	soft   sft5a13
	( 
	.in(wire_sft5a_in[13:13]),
	.out(wire_sft5a_out[13:13]));
	soft   sft5a14
	( 
	.in(wire_sft5a_in[14:14]),
	.out(wire_sft5a_out[14:14]));
	soft   sft5a15
	( 
	.in(wire_sft5a_in[15:15]),
	.out(wire_sft5a_out[15:15]));
	soft   sft5a16
	( 
	.in(wire_sft5a_in[16:16]),
	.out(wire_sft5a_out[16:16]));
	soft   sft5a17
	( 
	.in(wire_sft5a_in[17:17]),
	.out(wire_sft5a_out[17:17]));
	soft   sft5a18
	( 
	.in(wire_sft5a_in[18:18]),
	.out(wire_sft5a_out[18:18]));
	soft   sft5a19
	( 
	.in(wire_sft5a_in[19:19]),
	.out(wire_sft5a_out[19:19]));
	soft   sft5a20
	( 
	.in(wire_sft5a_in[20:20]),
	.out(wire_sft5a_out[20:20]));
	soft   sft5a21
	( 
	.in(wire_sft5a_in[21:21]),
	.out(wire_sft5a_out[21:21]));
	soft   sft5a22
	( 
	.in(wire_sft5a_in[22:22]),
	.out(wire_sft5a_out[22:22]));
	soft   sft5a23
	( 
	.in(wire_sft5a_in[23:23]),
	.out(wire_sft5a_out[23:23]));
	soft   sft5a24
	( 
	.in(wire_sft5a_in[24:24]),
	.out(wire_sft5a_out[24:24]));
	soft   sft5a25
	( 
	.in(wire_sft5a_in[25:25]),
	.out(wire_sft5a_out[25:25]));
	soft   sft5a26
	( 
	.in(wire_sft5a_in[26:26]),
	.out(wire_sft5a_out[26:26]));
	soft   sft5a27
	( 
	.in(wire_sft5a_in[27:27]),
	.out(wire_sft5a_out[27:27]));
	soft   sft5a28
	( 
	.in(wire_sft5a_in[28:28]),
	.out(wire_sft5a_out[28:28]));
	soft   sft5a29
	( 
	.in(wire_sft5a_in[29:29]),
	.out(wire_sft5a_out[29:29]));
	soft   sft5a30
	( 
	.in(wire_sft5a_in[30:30]),
	.out(wire_sft5a_out[30:30]));
	soft   sft5a31
	( 
	.in(wire_sft5a_in[31:31]),
	.out(wire_sft5a_out[31:31]));
	soft   sft5a32
	( 
	.in(wire_sft5a_in[32:32]),
	.out(wire_sft5a_out[32:32]));
	soft   sft5a33
	( 
	.in(wire_sft5a_in[33:33]),
	.out(wire_sft5a_out[33:33]));
	soft   sft5a34
	( 
	.in(wire_sft5a_in[34:34]),
	.out(wire_sft5a_out[34:34]));
	soft   sft5a35
	( 
	.in(wire_sft5a_in[35:35]),
	.out(wire_sft5a_out[35:35]));
	soft   sft5a36
	( 
	.in(wire_sft5a_in[36:36]),
	.out(wire_sft5a_out[36:36]));
	soft   sft5a37
	( 
	.in(wire_sft5a_in[37:37]),
	.out(wire_sft5a_out[37:37]));
	soft   sft5a38
	( 
	.in(wire_sft5a_in[38:38]),
	.out(wire_sft5a_out[38:38]));
	soft   sft5a39
	( 
	.in(wire_sft5a_in[39:39]),
	.out(wire_sft5a_out[39:39]));
	soft   sft5a40
	( 
	.in(wire_sft5a_in[40:40]),
	.out(wire_sft5a_out[40:40]));
	soft   sft5a41
	( 
	.in(wire_sft5a_in[41:41]),
	.out(wire_sft5a_out[41:41]));
	soft   sft5a42
	( 
	.in(wire_sft5a_in[42:42]),
	.out(wire_sft5a_out[42:42]));
	soft   sft5a43
	( 
	.in(wire_sft5a_in[43:43]),
	.out(wire_sft5a_out[43:43]));
	soft   sft5a44
	( 
	.in(wire_sft5a_in[44:44]),
	.out(wire_sft5a_out[44:44]));
	soft   sft5a45
	( 
	.in(wire_sft5a_in[45:45]),
	.out(wire_sft5a_out[45:45]));
	soft   sft5a46
	( 
	.in(wire_sft5a_in[46:46]),
	.out(wire_sft5a_out[46:46]));
	soft   sft5a47
	( 
	.in(wire_sft5a_in[47:47]),
	.out(wire_sft5a_out[47:47]));
	soft   sft5a48
	( 
	.in(wire_sft5a_in[48:48]),
	.out(wire_sft5a_out[48:48]));
	soft   sft5a49
	( 
	.in(wire_sft5a_in[49:49]),
	.out(wire_sft5a_out[49:49]));
	soft   sft5a50
	( 
	.in(wire_sft5a_in[50:50]),
	.out(wire_sft5a_out[50:50]));
	soft   sft5a51
	( 
	.in(wire_sft5a_in[51:51]),
	.out(wire_sft5a_out[51:51]));
	soft   sft5a52
	( 
	.in(wire_sft5a_in[52:52]),
	.out(wire_sft5a_out[52:52]));
	soft   sft5a53
	( 
	.in(wire_sft5a_in[53:53]),
	.out(wire_sft5a_out[53:53]));
	soft   sft5a54
	( 
	.in(wire_sft5a_in[54:54]),
	.out(wire_sft5a_out[54:54]));
	soft   sft5a55
	( 
	.in(wire_sft5a_in[55:55]),
	.out(wire_sft5a_out[55:55]));
	soft   sft5a56
	( 
	.in(wire_sft5a_in[56:56]),
	.out(wire_sft5a_out[56:56]));
	soft   sft5a57
	( 
	.in(wire_sft5a_in[57:57]),
	.out(wire_sft5a_out[57:57]));
	soft   sft5a58
	( 
	.in(wire_sft5a_in[58:58]),
	.out(wire_sft5a_out[58:58]));
	soft   sft5a59
	( 
	.in(wire_sft5a_in[59:59]),
	.out(wire_sft5a_out[59:59]));
	soft   sft5a60
	( 
	.in(wire_sft5a_in[60:60]),
	.out(wire_sft5a_out[60:60]));
	soft   sft5a61
	( 
	.in(wire_sft5a_in[61:61]),
	.out(wire_sft5a_out[61:61]));
	soft   sft5a62
	( 
	.in(wire_sft5a_in[62:62]),
	.out(wire_sft5a_out[62:62]));
	assign
		wire_sft5a_in = {w1191w, {w1191w, {w1191w, {wire_sft11a_out[55], {wire_sft11a_out[54], {wire_sft11a_out[53], {wire_sft11a_out[52], {wire_sft16a_out[47], {wire_sft16a_out[46], {wire_sft16a_out[45], {wire_sft16a_out[44], {wire_sft21a_out[39], {wire_sft21a_out[38], {wire_sft21a_out[37], {wire_sft21a_out[36], {wire_sft21a_out[35], {wire_sft21a_out[34], {wire_sft21a_out[33], {wire_sft21a_out[32], {wire_sft21a_out[31], {wire_sft21a_out[30], {wire_sft21a_out[29], {wire_sft21a_out[28], {wire_sft21a_out[27], {wire_sft21a_out[26], {wire_sft21a_out[25], {wire_sft21a_out[24], {wire_sft21a_out[23], {wire_sft21a_out[22], {wire_sft21a_out[21], {wire_sft21a_out[20], {wire_sft21a_out[19], {wire_sft21a_out[18], {wire_sft21a_out[17], {wire_sft21a_out[16], {wire_sft21a_out[15], {wire_sft21a_out[14], {wire_sft21a_out[13], {wire_sft21a_out[12], {wire_sft21a_out[11], {wire_sft21a_out[10], {wire_sft21a_out[9], {wire_sft21a_out[8], {wire_sft21a_out[7], {wire_sft21a_out[6], {wire_sft21a_out[5], {wire_sft21a_out[4], {wire_sft21a_out[3], {wire_sft21a_out[2], {wire_sft21a_out[1], {wire_sft21a_out[0], {wire_sft16a_out[3], {wire_sft16a_out[2], {wire_sft16a_out[1], {wire_sft16a_out[0], {wire_sft11a_out[3], {wire_sft11a_out[2], {wire_sft11a_out[1], {wire_sft11a_out[0], {w_sum_node10w[69], {w_sum_node10w[68], {2{w1191w}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft6a0
	( 
	.in(wire_sft6a_in[0:0]),
	.out(wire_sft6a_out[0:0]));
	soft   sft6a1
	( 
	.in(wire_sft6a_in[1:1]),
	.out(wire_sft6a_out[1:1]));
	soft   sft6a2
	( 
	.in(wire_sft6a_in[2:2]),
	.out(wire_sft6a_out[2:2]));
	soft   sft6a3
	( 
	.in(wire_sft6a_in[3:3]),
	.out(wire_sft6a_out[3:3]));
	soft   sft6a4
	( 
	.in(wire_sft6a_in[4:4]),
	.out(wire_sft6a_out[4:4]));
	soft   sft6a5
	( 
	.in(wire_sft6a_in[5:5]),
	.out(wire_sft6a_out[5:5]));
	soft   sft6a6
	( 
	.in(wire_sft6a_in[6:6]),
	.out(wire_sft6a_out[6:6]));
	soft   sft6a7
	( 
	.in(wire_sft6a_in[7:7]),
	.out(wire_sft6a_out[7:7]));
	soft   sft6a8
	( 
	.in(wire_sft6a_in[8:8]),
	.out(wire_sft6a_out[8:8]));
	soft   sft6a9
	( 
	.in(wire_sft6a_in[9:9]),
	.out(wire_sft6a_out[9:9]));
	soft   sft6a10
	( 
	.in(wire_sft6a_in[10:10]),
	.out(wire_sft6a_out[10:10]));
	soft   sft6a11
	( 
	.in(wire_sft6a_in[11:11]),
	.out(wire_sft6a_out[11:11]));
	soft   sft6a12
	( 
	.in(wire_sft6a_in[12:12]),
	.out(wire_sft6a_out[12:12]));
	soft   sft6a13
	( 
	.in(wire_sft6a_in[13:13]),
	.out(wire_sft6a_out[13:13]));
	soft   sft6a14
	( 
	.in(wire_sft6a_in[14:14]),
	.out(wire_sft6a_out[14:14]));
	soft   sft6a15
	( 
	.in(wire_sft6a_in[15:15]),
	.out(wire_sft6a_out[15:15]));
	soft   sft6a16
	( 
	.in(wire_sft6a_in[16:16]),
	.out(wire_sft6a_out[16:16]));
	soft   sft6a17
	( 
	.in(wire_sft6a_in[17:17]),
	.out(wire_sft6a_out[17:17]));
	soft   sft6a18
	( 
	.in(wire_sft6a_in[18:18]),
	.out(wire_sft6a_out[18:18]));
	soft   sft6a19
	( 
	.in(wire_sft6a_in[19:19]),
	.out(wire_sft6a_out[19:19]));
	soft   sft6a20
	( 
	.in(wire_sft6a_in[20:20]),
	.out(wire_sft6a_out[20:20]));
	soft   sft6a21
	( 
	.in(wire_sft6a_in[21:21]),
	.out(wire_sft6a_out[21:21]));
	soft   sft6a22
	( 
	.in(wire_sft6a_in[22:22]),
	.out(wire_sft6a_out[22:22]));
	soft   sft6a23
	( 
	.in(wire_sft6a_in[23:23]),
	.out(wire_sft6a_out[23:23]));
	soft   sft6a24
	( 
	.in(wire_sft6a_in[24:24]),
	.out(wire_sft6a_out[24:24]));
	soft   sft6a25
	( 
	.in(wire_sft6a_in[25:25]),
	.out(wire_sft6a_out[25:25]));
	soft   sft6a26
	( 
	.in(wire_sft6a_in[26:26]),
	.out(wire_sft6a_out[26:26]));
	soft   sft6a27
	( 
	.in(wire_sft6a_in[27:27]),
	.out(wire_sft6a_out[27:27]));
	soft   sft6a28
	( 
	.in(wire_sft6a_in[28:28]),
	.out(wire_sft6a_out[28:28]));
	soft   sft6a29
	( 
	.in(wire_sft6a_in[29:29]),
	.out(wire_sft6a_out[29:29]));
	soft   sft6a30
	( 
	.in(wire_sft6a_in[30:30]),
	.out(wire_sft6a_out[30:30]));
	soft   sft6a31
	( 
	.in(wire_sft6a_in[31:31]),
	.out(wire_sft6a_out[31:31]));
	soft   sft6a32
	( 
	.in(wire_sft6a_in[32:32]),
	.out(wire_sft6a_out[32:32]));
	soft   sft6a33
	( 
	.in(wire_sft6a_in[33:33]),
	.out(wire_sft6a_out[33:33]));
	soft   sft6a34
	( 
	.in(wire_sft6a_in[34:34]),
	.out(wire_sft6a_out[34:34]));
	soft   sft6a35
	( 
	.in(wire_sft6a_in[35:35]),
	.out(wire_sft6a_out[35:35]));
	soft   sft6a36
	( 
	.in(wire_sft6a_in[36:36]),
	.out(wire_sft6a_out[36:36]));
	soft   sft6a37
	( 
	.in(wire_sft6a_in[37:37]),
	.out(wire_sft6a_out[37:37]));
	soft   sft6a38
	( 
	.in(wire_sft6a_in[38:38]),
	.out(wire_sft6a_out[38:38]));
	soft   sft6a39
	( 
	.in(wire_sft6a_in[39:39]),
	.out(wire_sft6a_out[39:39]));
	soft   sft6a40
	( 
	.in(wire_sft6a_in[40:40]),
	.out(wire_sft6a_out[40:40]));
	soft   sft6a41
	( 
	.in(wire_sft6a_in[41:41]),
	.out(wire_sft6a_out[41:41]));
	soft   sft6a42
	( 
	.in(wire_sft6a_in[42:42]),
	.out(wire_sft6a_out[42:42]));
	soft   sft6a43
	( 
	.in(wire_sft6a_in[43:43]),
	.out(wire_sft6a_out[43:43]));
	soft   sft6a44
	( 
	.in(wire_sft6a_in[44:44]),
	.out(wire_sft6a_out[44:44]));
	soft   sft6a45
	( 
	.in(wire_sft6a_in[45:45]),
	.out(wire_sft6a_out[45:45]));
	soft   sft6a46
	( 
	.in(wire_sft6a_in[46:46]),
	.out(wire_sft6a_out[46:46]));
	soft   sft6a47
	( 
	.in(wire_sft6a_in[47:47]),
	.out(wire_sft6a_out[47:47]));
	soft   sft6a48
	( 
	.in(wire_sft6a_in[48:48]),
	.out(wire_sft6a_out[48:48]));
	soft   sft6a49
	( 
	.in(wire_sft6a_in[49:49]),
	.out(wire_sft6a_out[49:49]));
	soft   sft6a50
	( 
	.in(wire_sft6a_in[50:50]),
	.out(wire_sft6a_out[50:50]));
	soft   sft6a51
	( 
	.in(wire_sft6a_in[51:51]),
	.out(wire_sft6a_out[51:51]));
	soft   sft6a52
	( 
	.in(wire_sft6a_in[52:52]),
	.out(wire_sft6a_out[52:52]));
	soft   sft6a53
	( 
	.in(wire_sft6a_in[53:53]),
	.out(wire_sft6a_out[53:53]));
	soft   sft6a54
	( 
	.in(wire_sft6a_in[54:54]),
	.out(wire_sft6a_out[54:54]));
	soft   sft6a55
	( 
	.in(wire_sft6a_in[55:55]),
	.out(wire_sft6a_out[55:55]));
	soft   sft6a56
	( 
	.in(wire_sft6a_in[56:56]),
	.out(wire_sft6a_out[56:56]));
	soft   sft6a57
	( 
	.in(wire_sft6a_in[57:57]),
	.out(wire_sft6a_out[57:57]));
	soft   sft6a58
	( 
	.in(wire_sft6a_in[58:58]),
	.out(wire_sft6a_out[58:58]));
	soft   sft6a59
	( 
	.in(wire_sft6a_in[59:59]),
	.out(wire_sft6a_out[59:59]));
	soft   sft6a60
	( 
	.in(wire_sft6a_in[60:60]),
	.out(wire_sft6a_out[60:60]));
	soft   sft6a61
	( 
	.in(wire_sft6a_in[61:61]),
	.out(wire_sft6a_out[61:61]));
	soft   sft6a62
	( 
	.in(wire_sft6a_in[62:62]),
	.out(wire_sft6a_out[62:62]));
	assign
		wire_sft6a_in = wire_add2_result;
	soft   sft8a0
	( 
	.in(wire_sft8a_in[0:0]),
	.out(wire_sft8a_out[0:0]));
	soft   sft8a1
	( 
	.in(wire_sft8a_in[1:1]),
	.out(wire_sft8a_out[1:1]));
	soft   sft8a2
	( 
	.in(wire_sft8a_in[2:2]),
	.out(wire_sft8a_out[2:2]));
	soft   sft8a3
	( 
	.in(wire_sft8a_in[3:3]),
	.out(wire_sft8a_out[3:3]));
	soft   sft8a4
	( 
	.in(wire_sft8a_in[4:4]),
	.out(wire_sft8a_out[4:4]));
	soft   sft8a5
	( 
	.in(wire_sft8a_in[5:5]),
	.out(wire_sft8a_out[5:5]));
	soft   sft8a6
	( 
	.in(wire_sft8a_in[6:6]),
	.out(wire_sft8a_out[6:6]));
	soft   sft8a7
	( 
	.in(wire_sft8a_in[7:7]),
	.out(wire_sft8a_out[7:7]));
	soft   sft8a8
	( 
	.in(wire_sft8a_in[8:8]),
	.out(wire_sft8a_out[8:8]));
	soft   sft8a9
	( 
	.in(wire_sft8a_in[9:9]),
	.out(wire_sft8a_out[9:9]));
	soft   sft8a10
	( 
	.in(wire_sft8a_in[10:10]),
	.out(wire_sft8a_out[10:10]));
	soft   sft8a11
	( 
	.in(wire_sft8a_in[11:11]),
	.out(wire_sft8a_out[11:11]));
	soft   sft8a12
	( 
	.in(wire_sft8a_in[12:12]),
	.out(wire_sft8a_out[12:12]));
	soft   sft8a13
	( 
	.in(wire_sft8a_in[13:13]),
	.out(wire_sft8a_out[13:13]));
	soft   sft8a14
	( 
	.in(wire_sft8a_in[14:14]),
	.out(wire_sft8a_out[14:14]));
	soft   sft8a15
	( 
	.in(wire_sft8a_in[15:15]),
	.out(wire_sft8a_out[15:15]));
	soft   sft8a16
	( 
	.in(wire_sft8a_in[16:16]),
	.out(wire_sft8a_out[16:16]));
	soft   sft8a17
	( 
	.in(wire_sft8a_in[17:17]),
	.out(wire_sft8a_out[17:17]));
	soft   sft8a18
	( 
	.in(wire_sft8a_in[18:18]),
	.out(wire_sft8a_out[18:18]));
	soft   sft8a19
	( 
	.in(wire_sft8a_in[19:19]),
	.out(wire_sft8a_out[19:19]));
	soft   sft8a20
	( 
	.in(wire_sft8a_in[20:20]),
	.out(wire_sft8a_out[20:20]));
	soft   sft8a21
	( 
	.in(wire_sft8a_in[21:21]),
	.out(wire_sft8a_out[21:21]));
	soft   sft8a22
	( 
	.in(wire_sft8a_in[22:22]),
	.out(wire_sft8a_out[22:22]));
	soft   sft8a23
	( 
	.in(wire_sft8a_in[23:23]),
	.out(wire_sft8a_out[23:23]));
	soft   sft8a24
	( 
	.in(wire_sft8a_in[24:24]),
	.out(wire_sft8a_out[24:24]));
	soft   sft8a25
	( 
	.in(wire_sft8a_in[25:25]),
	.out(wire_sft8a_out[25:25]));
	soft   sft8a26
	( 
	.in(wire_sft8a_in[26:26]),
	.out(wire_sft8a_out[26:26]));
	soft   sft8a27
	( 
	.in(wire_sft8a_in[27:27]),
	.out(wire_sft8a_out[27:27]));
	soft   sft8a28
	( 
	.in(wire_sft8a_in[28:28]),
	.out(wire_sft8a_out[28:28]));
	soft   sft8a29
	( 
	.in(wire_sft8a_in[29:29]),
	.out(wire_sft8a_out[29:29]));
	soft   sft8a30
	( 
	.in(wire_sft8a_in[30:30]),
	.out(wire_sft8a_out[30:30]));
	soft   sft8a31
	( 
	.in(wire_sft8a_in[31:31]),
	.out(wire_sft8a_out[31:31]));
	soft   sft8a32
	( 
	.in(wire_sft8a_in[32:32]),
	.out(wire_sft8a_out[32:32]));
	soft   sft8a33
	( 
	.in(wire_sft8a_in[33:33]),
	.out(wire_sft8a_out[33:33]));
	soft   sft8a34
	( 
	.in(wire_sft8a_in[34:34]),
	.out(wire_sft8a_out[34:34]));
	soft   sft8a35
	( 
	.in(wire_sft8a_in[35:35]),
	.out(wire_sft8a_out[35:35]));
	soft   sft8a36
	( 
	.in(wire_sft8a_in[36:36]),
	.out(wire_sft8a_out[36:36]));
	soft   sft8a37
	( 
	.in(wire_sft8a_in[37:37]),
	.out(wire_sft8a_out[37:37]));
	soft   sft8a38
	( 
	.in(wire_sft8a_in[38:38]),
	.out(wire_sft8a_out[38:38]));
	soft   sft8a39
	( 
	.in(wire_sft8a_in[39:39]),
	.out(wire_sft8a_out[39:39]));
	soft   sft8a40
	( 
	.in(wire_sft8a_in[40:40]),
	.out(wire_sft8a_out[40:40]));
	soft   sft8a41
	( 
	.in(wire_sft8a_in[41:41]),
	.out(wire_sft8a_out[41:41]));
	soft   sft8a42
	( 
	.in(wire_sft8a_in[42:42]),
	.out(wire_sft8a_out[42:42]));
	soft   sft8a43
	( 
	.in(wire_sft8a_in[43:43]),
	.out(wire_sft8a_out[43:43]));
	soft   sft8a44
	( 
	.in(wire_sft8a_in[44:44]),
	.out(wire_sft8a_out[44:44]));
	soft   sft8a45
	( 
	.in(wire_sft8a_in[45:45]),
	.out(wire_sft8a_out[45:45]));
	soft   sft8a46
	( 
	.in(wire_sft8a_in[46:46]),
	.out(wire_sft8a_out[46:46]));
	soft   sft8a47
	( 
	.in(wire_sft8a_in[47:47]),
	.out(wire_sft8a_out[47:47]));
	soft   sft8a48
	( 
	.in(wire_sft8a_in[48:48]),
	.out(wire_sft8a_out[48:48]));
	soft   sft8a49
	( 
	.in(wire_sft8a_in[49:49]),
	.out(wire_sft8a_out[49:49]));
	soft   sft8a50
	( 
	.in(wire_sft8a_in[50:50]),
	.out(wire_sft8a_out[50:50]));
	soft   sft8a51
	( 
	.in(wire_sft8a_in[51:51]),
	.out(wire_sft8a_out[51:51]));
	soft   sft8a52
	( 
	.in(wire_sft8a_in[52:52]),
	.out(wire_sft8a_out[52:52]));
	soft   sft8a53
	( 
	.in(wire_sft8a_in[53:53]),
	.out(wire_sft8a_out[53:53]));
	soft   sft8a54
	( 
	.in(wire_sft8a_in[54:54]),
	.out(wire_sft8a_out[54:54]));
	soft   sft8a55
	( 
	.in(wire_sft8a_in[55:55]),
	.out(wire_sft8a_out[55:55]));
	assign
		wire_sft8a_in = {w1191w, {w_sum_node10w[508], {(~ w_sum_node10w[475]), {w1159w, {w_sum_node10w[537], {w_sum_node10w[536], {w_sum_node10w[503], {w_sum_node10w[502], {w_sum_node10w[469], {w_sum_node10w[468], {w_sum_node10w[435], {w_sum_node10w[434], {w_sum_node10w[433], {w_sum_node10w[432], {w_sum_node10w[399], {w_sum_node10w[366], {w_sum_node10w[333], {w_sum_node10w[332], {w_sum_node10w[299], {w_sum_node10w[298], {w_sum_node10w[265], {w_sum_node10w[264], {w_sum_node10w[231], {w_sum_node10w[230], {w_sum_node10w[197], {w_sum_node10w[196], {w_sum_node10w[163], {w_sum_node10w[162], {w_sum_node10w[129], {w_sum_node10w[128], {w_sum_node10w[127], {w_sum_node10w[126], {w_sum_node10w[125], {w_sum_node10w[124], {w_sum_node10w[123], {w_sum_node10w[122], {w_sum_node10w[121], {w_sum_node10w[120], {w_sum_node10w[119], {w_sum_node10w[118], {w_sum_node10w[117], {w_sum_node10w[116], {w_sum_node10w[115], {w_sum_node10w[114], {w_sum_node10w[113], {w_sum_node10w[112], {w_sum_node10w[111], {w_sum_node10w[110], {w_sum_node10w[109], {w_sum_node10w[108], {w_sum_node10w[107], {w_sum_node10w[106], {w_sum_node10w[105], {w_sum_node10w[104], {w_sum_node10w[103:102]}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	soft   sft9a0
	( 
	.in(wire_sft9a_in[0:0]),
	.out(wire_sft9a_out[0:0]));
	soft   sft9a1
	( 
	.in(wire_sft9a_in[1:1]),
	.out(wire_sft9a_out[1:1]));
	soft   sft9a2
	( 
	.in(wire_sft9a_in[2:2]),
	.out(wire_sft9a_out[2:2]));
	soft   sft9a3
	( 
	.in(wire_sft9a_in[3:3]),
	.out(wire_sft9a_out[3:3]));
	soft   sft9a4
	( 
	.in(wire_sft9a_in[4:4]),
	.out(wire_sft9a_out[4:4]));
	soft   sft9a5
	( 
	.in(wire_sft9a_in[5:5]),
	.out(wire_sft9a_out[5:5]));
	soft   sft9a6
	( 
	.in(wire_sft9a_in[6:6]),
	.out(wire_sft9a_out[6:6]));
	soft   sft9a7
	( 
	.in(wire_sft9a_in[7:7]),
	.out(wire_sft9a_out[7:7]));
	soft   sft9a8
	( 
	.in(wire_sft9a_in[8:8]),
	.out(wire_sft9a_out[8:8]));
	soft   sft9a9
	( 
	.in(wire_sft9a_in[9:9]),
	.out(wire_sft9a_out[9:9]));
	soft   sft9a10
	( 
	.in(wire_sft9a_in[10:10]),
	.out(wire_sft9a_out[10:10]));
	soft   sft9a11
	( 
	.in(wire_sft9a_in[11:11]),
	.out(wire_sft9a_out[11:11]));
	soft   sft9a12
	( 
	.in(wire_sft9a_in[12:12]),
	.out(wire_sft9a_out[12:12]));
	soft   sft9a13
	( 
	.in(wire_sft9a_in[13:13]),
	.out(wire_sft9a_out[13:13]));
	soft   sft9a14
	( 
	.in(wire_sft9a_in[14:14]),
	.out(wire_sft9a_out[14:14]));
	soft   sft9a15
	( 
	.in(wire_sft9a_in[15:15]),
	.out(wire_sft9a_out[15:15]));
	soft   sft9a16
	( 
	.in(wire_sft9a_in[16:16]),
	.out(wire_sft9a_out[16:16]));
	soft   sft9a17
	( 
	.in(wire_sft9a_in[17:17]),
	.out(wire_sft9a_out[17:17]));
	soft   sft9a18
	( 
	.in(wire_sft9a_in[18:18]),
	.out(wire_sft9a_out[18:18]));
	soft   sft9a19
	( 
	.in(wire_sft9a_in[19:19]),
	.out(wire_sft9a_out[19:19]));
	soft   sft9a20
	( 
	.in(wire_sft9a_in[20:20]),
	.out(wire_sft9a_out[20:20]));
	soft   sft9a21
	( 
	.in(wire_sft9a_in[21:21]),
	.out(wire_sft9a_out[21:21]));
	soft   sft9a22
	( 
	.in(wire_sft9a_in[22:22]),
	.out(wire_sft9a_out[22:22]));
	soft   sft9a23
	( 
	.in(wire_sft9a_in[23:23]),
	.out(wire_sft9a_out[23:23]));
	soft   sft9a24
	( 
	.in(wire_sft9a_in[24:24]),
	.out(wire_sft9a_out[24:24]));
	soft   sft9a25
	( 
	.in(wire_sft9a_in[25:25]),
	.out(wire_sft9a_out[25:25]));
	soft   sft9a26
	( 
	.in(wire_sft9a_in[26:26]),
	.out(wire_sft9a_out[26:26]));
	soft   sft9a27
	( 
	.in(wire_sft9a_in[27:27]),
	.out(wire_sft9a_out[27:27]));
	soft   sft9a28
	( 
	.in(wire_sft9a_in[28:28]),
	.out(wire_sft9a_out[28:28]));
	soft   sft9a29
	( 
	.in(wire_sft9a_in[29:29]),
	.out(wire_sft9a_out[29:29]));
	soft   sft9a30
	( 
	.in(wire_sft9a_in[30:30]),
	.out(wire_sft9a_out[30:30]));
	soft   sft9a31
	( 
	.in(wire_sft9a_in[31:31]),
	.out(wire_sft9a_out[31:31]));
	soft   sft9a32
	( 
	.in(wire_sft9a_in[32:32]),
	.out(wire_sft9a_out[32:32]));
	soft   sft9a33
	( 
	.in(wire_sft9a_in[33:33]),
	.out(wire_sft9a_out[33:33]));
	soft   sft9a34
	( 
	.in(wire_sft9a_in[34:34]),
	.out(wire_sft9a_out[34:34]));
	soft   sft9a35
	( 
	.in(wire_sft9a_in[35:35]),
	.out(wire_sft9a_out[35:35]));
	soft   sft9a36
	( 
	.in(wire_sft9a_in[36:36]),
	.out(wire_sft9a_out[36:36]));
	soft   sft9a37
	( 
	.in(wire_sft9a_in[37:37]),
	.out(wire_sft9a_out[37:37]));
	soft   sft9a38
	( 
	.in(wire_sft9a_in[38:38]),
	.out(wire_sft9a_out[38:38]));
	soft   sft9a39
	( 
	.in(wire_sft9a_in[39:39]),
	.out(wire_sft9a_out[39:39]));
	soft   sft9a40
	( 
	.in(wire_sft9a_in[40:40]),
	.out(wire_sft9a_out[40:40]));
	soft   sft9a41
	( 
	.in(wire_sft9a_in[41:41]),
	.out(wire_sft9a_out[41:41]));
	soft   sft9a42
	( 
	.in(wire_sft9a_in[42:42]),
	.out(wire_sft9a_out[42:42]));
	soft   sft9a43
	( 
	.in(wire_sft9a_in[43:43]),
	.out(wire_sft9a_out[43:43]));
	soft   sft9a44
	( 
	.in(wire_sft9a_in[44:44]),
	.out(wire_sft9a_out[44:44]));
	soft   sft9a45
	( 
	.in(wire_sft9a_in[45:45]),
	.out(wire_sft9a_out[45:45]));
	soft   sft9a46
	( 
	.in(wire_sft9a_in[46:46]),
	.out(wire_sft9a_out[46:46]));
	soft   sft9a47
	( 
	.in(wire_sft9a_in[47:47]),
	.out(wire_sft9a_out[47:47]));
	soft   sft9a48
	( 
	.in(wire_sft9a_in[48:48]),
	.out(wire_sft9a_out[48:48]));
	soft   sft9a49
	( 
	.in(wire_sft9a_in[49:49]),
	.out(wire_sft9a_out[49:49]));
	soft   sft9a50
	( 
	.in(wire_sft9a_in[50:50]),
	.out(wire_sft9a_out[50:50]));
	soft   sft9a51
	( 
	.in(wire_sft9a_in[51:51]),
	.out(wire_sft9a_out[51:51]));
	soft   sft9a52
	( 
	.in(wire_sft9a_in[52:52]),
	.out(wire_sft9a_out[52:52]));
	soft   sft9a53
	( 
	.in(wire_sft9a_in[53:53]),
	.out(wire_sft9a_out[53:53]));
	soft   sft9a54
	( 
	.in(wire_sft9a_in[54:54]),
	.out(wire_sft9a_out[54:54]));
	soft   sft9a55
	( 
	.in(wire_sft9a_in[55:55]),
	.out(wire_sft9a_out[55:55]));
	assign
		wire_sft9a_in = {w1191w, {w1191w, {w1191w, {w_sum_node10w[538], {w_sum_node10w[505], {w_sum_node10w[504], {w_sum_node10w[471], {w_sum_node10w[470], {w_sum_node10w[437], {w_sum_node10w[436], {w_sum_node10w[403], {w_sum_node10w[402], {w_sum_node10w[369], {w_sum_node10w[368], {w_sum_node10w[335], {w_sum_node10w[334], {w_sum_node10w[301], {w_sum_node10w[300], {w_sum_node10w[267], {w_sum_node10w[266], {w_sum_node10w[233], {w_sum_node10w[232], {w_sum_node10w[199], {w_sum_node10w[198], {w_sum_node10w[165], {w_sum_node10w[164], {w_sum_node10w[131], {wire_sft26a_out[16], {wire_sft26a_out[15], {wire_sft26a_out[14], {wire_sft26a_out[13], {wire_sft26a_out[12], {w_sum_node10w[93], {w_sum_node10w[92], {w_sum_node10w[91], {w_sum_node10w[90], {w_sum_node10w[89], {w_sum_node10w[88], {w_sum_node10w[87], {w_sum_node10w[86], {w_sum_node10w[85], {w_sum_node10w[84], {w_sum_node10w[83], {w_sum_node10w[82], {w_sum_node10w[81], {w_sum_node10w[80], {w_sum_node10w[79], {w_sum_node10w[78], {w_sum_node10w[77], {w_sum_node10w[76], {w_sum_node10w[75], {w_sum_node10w[74], {w_sum_node10w[73], {w_sum_node10w[72], {w_sum_node10w[71:70]}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}};
	assign
		dataa_node = {dataa[31:0]},
		datab_node = {datab[31:0]},
		final_result_node = {w2342w[63:0]},
		result = {final_result_node[63:0]},
		w1159w = 1'b1,
		w1191w = 1'b0,
		w2342w = {wire_sft6a_out[62:61], wire_sft6a_out[60:59], wire_sft6a_out[58:57], wire_sft6a_out[56:55], wire_sft6a_out[54:53], wire_sft6a_out[52:51], wire_sft6a_out[50:49], wire_sft6a_out[48:47], wire_sft6a_out[46:45], wire_sft6a_out[44:43], wire_sft6a_out[42:41], wire_sft6a_out[40:39], wire_sft6a_out[38:37], wire_sft6a_out[36:35], wire_sft6a_out[34:33], wire_sft6a_out[32:31], wire_sft6a_out[30:29], wire_sft6a_out[28:27], wire_sft6a_out[26:25], wire_sft6a_out[24:23], wire_sft6a_out[22:21], wire_sft6a_out[20:19], wire_sft6a_out[18:17], wire_sft6a_out[16:15], wire_sft6a_out[14:13], wire_sft6a_out[12:11], wire_sft6a_out[10:9], wire_sft6a_out[8:7], wire_sft6a_out[6:5], wire_sft6a_out[4:3], wire_sft6a_out[2:1], wire_sft6a_out[0], w_sum_node10w[1], w_sum_node10w[0]},
		w_decoder_node9w = {({dataa_node[31:0]} & {32{w_le_datab_node8w[31]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[30]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[29]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[28]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[27]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[26]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[25]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[24]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[23]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[22]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[21]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[20]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[19]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[18]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[17]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[16]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[15]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[14]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[13]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[12]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[11]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[10]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[9]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[8]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[7]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[6]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[5]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[4]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[3]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[2]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[1]}}), ({dataa_node[31:0]} & {32{w_le_datab_node8w[0]}})},
		w_le_datab_node8w = {datab_node[31:0]},
		w_sum_node10w = {wire_sum_adder1aa_15result[32:0], w_decoder_node9w[960], wire_sum_adder1aa_14result[32:0], w_decoder_node9w[896], wire_sum_adder1aa_13result[32:0], w_decoder_node9w[832], wire_sum_adder1aa_12result[32:0], w_decoder_node9w[768], wire_sum_adder1aa_11result[32:0], w_decoder_node9w[704], wire_sum_adder1aa_10result[32:0], w_decoder_node9w[640], wire_sum_adder1aa_9result[32:0], w_decoder_node9w[576], wire_sum_adder1aa_8result[32:0], w_decoder_node9w[512], wire_sum_adder1aa_7result[32:0], w_decoder_node9w[448], wire_sum_adder1aa_6result[32:0], w_decoder_node9w[384], wire_sum_adder1aa_5result[32:0], w_decoder_node9w[320], wire_sum_adder1aa_4result[32:0], w_decoder_node9w[256], wire_sum_adder1aa_3result[32:0], w_decoder_node9w[192], wire_sum_adder1aa_2result[32:0], w_decoder_node9w[128], wire_sum_adder1aa_1result[32:0], w_decoder_node9w[64], wire_sum_adder1aa_0result[32:0], w_decoder_node9w[0]};
endmodule //mult_edu
//VALID FILE
