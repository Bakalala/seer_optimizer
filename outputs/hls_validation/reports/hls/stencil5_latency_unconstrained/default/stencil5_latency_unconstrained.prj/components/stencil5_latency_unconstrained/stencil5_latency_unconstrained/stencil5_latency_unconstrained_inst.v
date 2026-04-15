	stencil5_latency_unconstrained u0 (
		.clock      (_connected_to_clock_),      //   input,   width = 1,      clock.clk
		.resetn     (_connected_to_resetn_),     //   input,   width = 1,      reset.reset_n
		.start      (_connected_to_start_),      //   input,   width = 1,       call.valid
		.busy       (_connected_to_busy_),       //  output,   width = 1,           .stall
		.done       (_connected_to_done_),       //  output,   width = 1,     return.valid
		.stall      (_connected_to_stall_),      //   input,   width = 1,           .stall
		.returndata (_connected_to_returndata_), //  output,  width = 32, returndata.data
		.in_center  (_connected_to_in_center_),  //   input,  width = 32,  in_center.data
		.in_east    (_connected_to_in_east_),    //   input,  width = 32,    in_east.data
		.in_north   (_connected_to_in_north_),   //   input,  width = 32,   in_north.data
		.in_south   (_connected_to_in_south_),   //   input,  width = 32,   in_south.data
		.in_west    (_connected_to_in_west_)     //   input,  width = 32,    in_west.data
	);

