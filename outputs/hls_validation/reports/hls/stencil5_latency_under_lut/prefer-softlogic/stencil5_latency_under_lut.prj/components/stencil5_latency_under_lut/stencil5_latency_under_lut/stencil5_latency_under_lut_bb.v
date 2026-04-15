module stencil5_latency_under_lut (
		input  wire        clock,      //      clock.clk
		input  wire        resetn,     //      reset.reset_n
		input  wire        start,      //       call.valid
		output wire        busy,       //           .stall
		output wire        done,       //     return.valid
		input  wire        stall,      //           .stall
		output wire [31:0] returndata, // returndata.data
		input  wire [31:0] in_center,  //  in_center.data
		input  wire [31:0] in_east,    //    in_east.data
		input  wire [31:0] in_north,   //   in_north.data
		input  wire [31:0] in_south,   //   in_south.data
		input  wire [31:0] in_west     //    in_west.data
	);
endmodule

