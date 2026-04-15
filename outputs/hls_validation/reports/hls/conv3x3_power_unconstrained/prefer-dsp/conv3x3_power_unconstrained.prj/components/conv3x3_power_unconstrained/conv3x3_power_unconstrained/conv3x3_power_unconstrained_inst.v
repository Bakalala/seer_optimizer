	conv3x3_power_unconstrained u0 (
		.clock      (_connected_to_clock_),      //   input,   width = 1,      clock.clk
		.resetn     (_connected_to_resetn_),     //   input,   width = 1,      reset.reset_n
		.start      (_connected_to_start_),      //   input,   width = 1,       call.valid
		.busy       (_connected_to_busy_),       //  output,   width = 1,           .stall
		.done       (_connected_to_done_),       //  output,   width = 1,     return.valid
		.stall      (_connected_to_stall_),      //   input,   width = 1,           .stall
		.returndata (_connected_to_returndata_), //  output,  width = 32, returndata.data
		.in_p00     (_connected_to_in_p00_),     //   input,  width = 32,     in_p00.data
		.in_p01     (_connected_to_in_p01_),     //   input,  width = 32,     in_p01.data
		.in_p02     (_connected_to_in_p02_),     //   input,  width = 32,     in_p02.data
		.in_p10     (_connected_to_in_p10_),     //   input,  width = 32,     in_p10.data
		.in_p11     (_connected_to_in_p11_),     //   input,  width = 32,     in_p11.data
		.in_p12     (_connected_to_in_p12_),     //   input,  width = 32,     in_p12.data
		.in_p20     (_connected_to_in_p20_),     //   input,  width = 32,     in_p20.data
		.in_p21     (_connected_to_in_p21_),     //   input,  width = 32,     in_p21.data
		.in_p22     (_connected_to_in_p22_)      //   input,  width = 32,     in_p22.data
	);

