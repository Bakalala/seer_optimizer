module gemm_k8_latency_under_dsp (
		input  wire        clock,      //      clock.clk
		input  wire        resetn,     //      reset.reset_n
		input  wire        start,      //       call.valid
		output wire        busy,       //           .stall
		output wire        done,       //     return.valid
		input  wire        stall,      //           .stall
		output wire [31:0] returndata, // returndata.data
		input  wire [31:0] in_A0,      //      in_A0.data
		input  wire [31:0] in_A1,      //      in_A1.data
		input  wire [31:0] in_A2,      //      in_A2.data
		input  wire [31:0] in_A3,      //      in_A3.data
		input  wire [31:0] in_A4,      //      in_A4.data
		input  wire [31:0] in_A5,      //      in_A5.data
		input  wire [31:0] in_A6,      //      in_A6.data
		input  wire [31:0] in_A7,      //      in_A7.data
		input  wire [31:0] in_B0,      //      in_B0.data
		input  wire [31:0] in_B1,      //      in_B1.data
		input  wire [31:0] in_B2,      //      in_B2.data
		input  wire [31:0] in_B3,      //      in_B3.data
		input  wire [31:0] in_B4,      //      in_B4.data
		input  wire [31:0] in_B5,      //      in_B5.data
		input  wire [31:0] in_B6,      //      in_B6.data
		input  wire [31:0] in_B7       //      in_B7.data
	);
endmodule

