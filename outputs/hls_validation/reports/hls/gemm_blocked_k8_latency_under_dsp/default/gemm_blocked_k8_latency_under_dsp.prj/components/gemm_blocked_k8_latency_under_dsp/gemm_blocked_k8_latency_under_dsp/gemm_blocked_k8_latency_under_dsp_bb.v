module gemm_blocked_k8_latency_under_dsp (
		input  wire        clock,      //      clock.clk
		input  wire        resetn,     //      reset.reset_n
		input  wire        start,      //       call.valid
		output wire        busy,       //           .stall
		output wire        done,       //     return.valid
		input  wire        stall,      //           .stall
		output wire [31:0] returndata, // returndata.data
		input  wire [31:0] in_BA0,     //     in_BA0.data
		input  wire [31:0] in_BA1,     //     in_BA1.data
		input  wire [31:0] in_BA2,     //     in_BA2.data
		input  wire [31:0] in_BA3,     //     in_BA3.data
		input  wire [31:0] in_BA4,     //     in_BA4.data
		input  wire [31:0] in_BA5,     //     in_BA5.data
		input  wire [31:0] in_BA6,     //     in_BA6.data
		input  wire [31:0] in_BA7,     //     in_BA7.data
		input  wire [31:0] in_BB0,     //     in_BB0.data
		input  wire [31:0] in_BB1,     //     in_BB1.data
		input  wire [31:0] in_BB2,     //     in_BB2.data
		input  wire [31:0] in_BB3,     //     in_BB3.data
		input  wire [31:0] in_BB4,     //     in_BB4.data
		input  wire [31:0] in_BB5,     //     in_BB5.data
		input  wire [31:0] in_BB6,     //     in_BB6.data
		input  wire [31:0] in_BB7      //     in_BB7.data
	);
endmodule

