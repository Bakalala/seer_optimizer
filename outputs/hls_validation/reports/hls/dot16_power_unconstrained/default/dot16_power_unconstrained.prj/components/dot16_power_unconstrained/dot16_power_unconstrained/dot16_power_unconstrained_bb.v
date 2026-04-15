module dot16_power_unconstrained (
		input  wire        clock,      //      clock.clk
		input  wire        resetn,     //      reset.reset_n
		input  wire        start,      //       call.valid
		output wire        busy,       //           .stall
		output wire        done,       //     return.valid
		input  wire        stall,      //           .stall
		output wire [31:0] returndata, // returndata.data
		input  wire [31:0] in_a0,      //      in_a0.data
		input  wire [31:0] in_a1,      //      in_a1.data
		input  wire [31:0] in_a10,     //     in_a10.data
		input  wire [31:0] in_a11,     //     in_a11.data
		input  wire [31:0] in_a12,     //     in_a12.data
		input  wire [31:0] in_a13,     //     in_a13.data
		input  wire [31:0] in_a14,     //     in_a14.data
		input  wire [31:0] in_a15,     //     in_a15.data
		input  wire [31:0] in_a2,      //      in_a2.data
		input  wire [31:0] in_a3,      //      in_a3.data
		input  wire [31:0] in_a4,      //      in_a4.data
		input  wire [31:0] in_a5,      //      in_a5.data
		input  wire [31:0] in_a6,      //      in_a6.data
		input  wire [31:0] in_a7,      //      in_a7.data
		input  wire [31:0] in_a8,      //      in_a8.data
		input  wire [31:0] in_a9,      //      in_a9.data
		input  wire [31:0] in_b0,      //      in_b0.data
		input  wire [31:0] in_b1,      //      in_b1.data
		input  wire [31:0] in_b10,     //     in_b10.data
		input  wire [31:0] in_b11,     //     in_b11.data
		input  wire [31:0] in_b12,     //     in_b12.data
		input  wire [31:0] in_b13,     //     in_b13.data
		input  wire [31:0] in_b14,     //     in_b14.data
		input  wire [31:0] in_b15,     //     in_b15.data
		input  wire [31:0] in_b2,      //      in_b2.data
		input  wire [31:0] in_b3,      //      in_b3.data
		input  wire [31:0] in_b4,      //      in_b4.data
		input  wire [31:0] in_b5,      //      in_b5.data
		input  wire [31:0] in_b6,      //      in_b6.data
		input  wire [31:0] in_b7,      //      in_b7.data
		input  wire [31:0] in_b8,      //      in_b8.data
		input  wire [31:0] in_b9       //      in_b9.data
	);
endmodule

