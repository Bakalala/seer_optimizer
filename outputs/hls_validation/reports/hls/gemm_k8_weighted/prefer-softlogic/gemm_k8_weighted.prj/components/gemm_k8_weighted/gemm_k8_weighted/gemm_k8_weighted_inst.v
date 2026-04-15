	gemm_k8_weighted u0 (
		.clock      (_connected_to_clock_),      //   input,   width = 1,      clock.clk
		.resetn     (_connected_to_resetn_),     //   input,   width = 1,      reset.reset_n
		.start      (_connected_to_start_),      //   input,   width = 1,       call.valid
		.busy       (_connected_to_busy_),       //  output,   width = 1,           .stall
		.done       (_connected_to_done_),       //  output,   width = 1,     return.valid
		.stall      (_connected_to_stall_),      //   input,   width = 1,           .stall
		.returndata (_connected_to_returndata_), //  output,  width = 32, returndata.data
		.in_A0      (_connected_to_in_A0_),      //   input,  width = 32,      in_A0.data
		.in_A1      (_connected_to_in_A1_),      //   input,  width = 32,      in_A1.data
		.in_A2      (_connected_to_in_A2_),      //   input,  width = 32,      in_A2.data
		.in_A3      (_connected_to_in_A3_),      //   input,  width = 32,      in_A3.data
		.in_A4      (_connected_to_in_A4_),      //   input,  width = 32,      in_A4.data
		.in_A5      (_connected_to_in_A5_),      //   input,  width = 32,      in_A5.data
		.in_A6      (_connected_to_in_A6_),      //   input,  width = 32,      in_A6.data
		.in_A7      (_connected_to_in_A7_),      //   input,  width = 32,      in_A7.data
		.in_B0      (_connected_to_in_B0_),      //   input,  width = 32,      in_B0.data
		.in_B1      (_connected_to_in_B1_),      //   input,  width = 32,      in_B1.data
		.in_B2      (_connected_to_in_B2_),      //   input,  width = 32,      in_B2.data
		.in_B3      (_connected_to_in_B3_),      //   input,  width = 32,      in_B3.data
		.in_B4      (_connected_to_in_B4_),      //   input,  width = 32,      in_B4.data
		.in_B5      (_connected_to_in_B5_),      //   input,  width = 32,      in_B5.data
		.in_B6      (_connected_to_in_B6_),      //   input,  width = 32,      in_B6.data
		.in_B7      (_connected_to_in_B7_)       //   input,  width = 32,      in_B7.data
	);

