module fir8_power_unconstrained (
		input  wire        clock,      //      clock.clk
		input  wire        resetn,     //      reset.reset_n
		input  wire        start,      //       call.valid
		output wire        busy,       //           .stall
		output wire        done,       //     return.valid
		input  wire        stall,      //           .stall
		output wire [31:0] returndata, // returndata.data
		input  wire [31:0] in_x0,      //      in_x0.data
		input  wire [31:0] in_x1,      //      in_x1.data
		input  wire [31:0] in_x2,      //      in_x2.data
		input  wire [31:0] in_x3,      //      in_x3.data
		input  wire [31:0] in_x4,      //      in_x4.data
		input  wire [31:0] in_x5,      //      in_x5.data
		input  wire [31:0] in_x6,      //      in_x6.data
		input  wire [31:0] in_x7       //      in_x7.data
	);
endmodule

