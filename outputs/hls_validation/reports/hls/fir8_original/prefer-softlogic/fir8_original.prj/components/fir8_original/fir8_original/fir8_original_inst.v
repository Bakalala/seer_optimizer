	fir8_original u0 (
		.clock      (_connected_to_clock_),      //   input,   width = 1,      clock.clk
		.resetn     (_connected_to_resetn_),     //   input,   width = 1,      reset.reset_n
		.start      (_connected_to_start_),      //   input,   width = 1,       call.valid
		.busy       (_connected_to_busy_),       //  output,   width = 1,           .stall
		.done       (_connected_to_done_),       //  output,   width = 1,     return.valid
		.stall      (_connected_to_stall_),      //   input,   width = 1,           .stall
		.returndata (_connected_to_returndata_), //  output,  width = 32, returndata.data
		.in_x0      (_connected_to_in_x0_),      //   input,  width = 32,      in_x0.data
		.in_x1      (_connected_to_in_x1_),      //   input,  width = 32,      in_x1.data
		.in_x2      (_connected_to_in_x2_),      //   input,  width = 32,      in_x2.data
		.in_x3      (_connected_to_in_x3_),      //   input,  width = 32,      in_x3.data
		.in_x4      (_connected_to_in_x4_),      //   input,  width = 32,      in_x4.data
		.in_x5      (_connected_to_in_x5_),      //   input,  width = 32,      in_x5.data
		.in_x6      (_connected_to_in_x6_),      //   input,  width = 32,      in_x6.data
		.in_x7      (_connected_to_in_x7_)       //   input,  width = 32,      in_x7.data
	);

