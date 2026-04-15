	gemm_blocked_k8_power_unconstrained u0 (
		.clock      (_connected_to_clock_),      //   input,   width = 1,      clock.clk
		.resetn     (_connected_to_resetn_),     //   input,   width = 1,      reset.reset_n
		.start      (_connected_to_start_),      //   input,   width = 1,       call.valid
		.busy       (_connected_to_busy_),       //  output,   width = 1,           .stall
		.done       (_connected_to_done_),       //  output,   width = 1,     return.valid
		.stall      (_connected_to_stall_),      //   input,   width = 1,           .stall
		.returndata (_connected_to_returndata_), //  output,  width = 32, returndata.data
		.in_BA0     (_connected_to_in_BA0_),     //   input,  width = 32,     in_BA0.data
		.in_BA1     (_connected_to_in_BA1_),     //   input,  width = 32,     in_BA1.data
		.in_BA2     (_connected_to_in_BA2_),     //   input,  width = 32,     in_BA2.data
		.in_BA3     (_connected_to_in_BA3_),     //   input,  width = 32,     in_BA3.data
		.in_BA4     (_connected_to_in_BA4_),     //   input,  width = 32,     in_BA4.data
		.in_BA5     (_connected_to_in_BA5_),     //   input,  width = 32,     in_BA5.data
		.in_BA6     (_connected_to_in_BA6_),     //   input,  width = 32,     in_BA6.data
		.in_BA7     (_connected_to_in_BA7_),     //   input,  width = 32,     in_BA7.data
		.in_BB0     (_connected_to_in_BB0_),     //   input,  width = 32,     in_BB0.data
		.in_BB1     (_connected_to_in_BB1_),     //   input,  width = 32,     in_BB1.data
		.in_BB2     (_connected_to_in_BB2_),     //   input,  width = 32,     in_BB2.data
		.in_BB3     (_connected_to_in_BB3_),     //   input,  width = 32,     in_BB3.data
		.in_BB4     (_connected_to_in_BB4_),     //   input,  width = 32,     in_BB4.data
		.in_BB5     (_connected_to_in_BB5_),     //   input,  width = 32,     in_BB5.data
		.in_BB6     (_connected_to_in_BB6_),     //   input,  width = 32,     in_BB6.data
		.in_BB7     (_connected_to_in_BB7_)      //   input,  width = 32,     in_BB7.data
	);

