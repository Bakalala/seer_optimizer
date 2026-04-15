module quartus_compile (
	  input logic resetn
	, input logic clock
	, input logic [0:0] gemm_k8_weighted_start
	, output logic [0:0] gemm_k8_weighted_busy
	, output logic [0:0] gemm_k8_weighted_done
	, input logic [0:0] gemm_k8_weighted_stall
	, output logic [31:0] gemm_k8_weighted_returndata
	, input logic [31:0] gemm_k8_weighted_in_A0
	, input logic [31:0] gemm_k8_weighted_in_A1
	, input logic [31:0] gemm_k8_weighted_in_A2
	, input logic [31:0] gemm_k8_weighted_in_A3
	, input logic [31:0] gemm_k8_weighted_in_A4
	, input logic [31:0] gemm_k8_weighted_in_A5
	, input logic [31:0] gemm_k8_weighted_in_A6
	, input logic [31:0] gemm_k8_weighted_in_A7
	, input logic [31:0] gemm_k8_weighted_in_B0
	, input logic [31:0] gemm_k8_weighted_in_B1
	, input logic [31:0] gemm_k8_weighted_in_B2
	, input logic [31:0] gemm_k8_weighted_in_B3
	, input logic [31:0] gemm_k8_weighted_in_B4
	, input logic [31:0] gemm_k8_weighted_in_B5
	, input logic [31:0] gemm_k8_weighted_in_B6
	, input logic [31:0] gemm_k8_weighted_in_B7
	);

	logic [0:0] gemm_k8_weighted_start_reg;
	logic [0:0] gemm_k8_weighted_busy_reg;
	logic [0:0] gemm_k8_weighted_done_reg;
	logic [0:0] gemm_k8_weighted_stall_reg;
	logic [31:0] gemm_k8_weighted_returndata_reg;
	logic [31:0] gemm_k8_weighted_in_A0_reg;
	logic [31:0] gemm_k8_weighted_in_A1_reg;
	logic [31:0] gemm_k8_weighted_in_A2_reg;
	logic [31:0] gemm_k8_weighted_in_A3_reg;
	logic [31:0] gemm_k8_weighted_in_A4_reg;
	logic [31:0] gemm_k8_weighted_in_A5_reg;
	logic [31:0] gemm_k8_weighted_in_A6_reg;
	logic [31:0] gemm_k8_weighted_in_A7_reg;
	logic [31:0] gemm_k8_weighted_in_B0_reg;
	logic [31:0] gemm_k8_weighted_in_B1_reg;
	logic [31:0] gemm_k8_weighted_in_B2_reg;
	logic [31:0] gemm_k8_weighted_in_B3_reg;
	logic [31:0] gemm_k8_weighted_in_B4_reg;
	logic [31:0] gemm_k8_weighted_in_B5_reg;
	logic [31:0] gemm_k8_weighted_in_B6_reg;
	logic [31:0] gemm_k8_weighted_in_B7_reg;


	always @(posedge clock) begin
		gemm_k8_weighted_start_reg <= gemm_k8_weighted_start;
		gemm_k8_weighted_busy <= gemm_k8_weighted_busy_reg;
		gemm_k8_weighted_done <= gemm_k8_weighted_done_reg;
		gemm_k8_weighted_stall_reg <= gemm_k8_weighted_stall;
		gemm_k8_weighted_returndata <= gemm_k8_weighted_returndata_reg;
		gemm_k8_weighted_in_A0_reg <= gemm_k8_weighted_in_A0;
		gemm_k8_weighted_in_A1_reg <= gemm_k8_weighted_in_A1;
		gemm_k8_weighted_in_A2_reg <= gemm_k8_weighted_in_A2;
		gemm_k8_weighted_in_A3_reg <= gemm_k8_weighted_in_A3;
		gemm_k8_weighted_in_A4_reg <= gemm_k8_weighted_in_A4;
		gemm_k8_weighted_in_A5_reg <= gemm_k8_weighted_in_A5;
		gemm_k8_weighted_in_A6_reg <= gemm_k8_weighted_in_A6;
		gemm_k8_weighted_in_A7_reg <= gemm_k8_weighted_in_A7;
		gemm_k8_weighted_in_B0_reg <= gemm_k8_weighted_in_B0;
		gemm_k8_weighted_in_B1_reg <= gemm_k8_weighted_in_B1;
		gemm_k8_weighted_in_B2_reg <= gemm_k8_weighted_in_B2;
		gemm_k8_weighted_in_B3_reg <= gemm_k8_weighted_in_B3;
		gemm_k8_weighted_in_B4_reg <= gemm_k8_weighted_in_B4;
		gemm_k8_weighted_in_B5_reg <= gemm_k8_weighted_in_B5;
		gemm_k8_weighted_in_B6_reg <= gemm_k8_weighted_in_B6;
		gemm_k8_weighted_in_B7_reg <= gemm_k8_weighted_in_B7;
	end


	reg [2:0] sync_resetn;
	always @(posedge clock or negedge resetn) begin
		if (!resetn) begin
			sync_resetn <= 3'b0;
		end else begin
			sync_resetn <= {sync_resetn[1:0], 1'b1};
		end
	end


	gemm_k8_weighted gemm_k8_weighted_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .start(gemm_k8_weighted_start_reg)
		, .busy(gemm_k8_weighted_busy_reg)
		, .done(gemm_k8_weighted_done_reg)
		, .stall(gemm_k8_weighted_stall_reg)
		, .returndata(gemm_k8_weighted_returndata_reg)
		, .in_A0(gemm_k8_weighted_in_A0_reg)
		, .in_A1(gemm_k8_weighted_in_A1_reg)
		, .in_A2(gemm_k8_weighted_in_A2_reg)
		, .in_A3(gemm_k8_weighted_in_A3_reg)
		, .in_A4(gemm_k8_weighted_in_A4_reg)
		, .in_A5(gemm_k8_weighted_in_A5_reg)
		, .in_A6(gemm_k8_weighted_in_A6_reg)
		, .in_A7(gemm_k8_weighted_in_A7_reg)
		, .in_B0(gemm_k8_weighted_in_B0_reg)
		, .in_B1(gemm_k8_weighted_in_B1_reg)
		, .in_B2(gemm_k8_weighted_in_B2_reg)
		, .in_B3(gemm_k8_weighted_in_B3_reg)
		, .in_B4(gemm_k8_weighted_in_B4_reg)
		, .in_B5(gemm_k8_weighted_in_B5_reg)
		, .in_B6(gemm_k8_weighted_in_B6_reg)
		, .in_B7(gemm_k8_weighted_in_B7_reg)
	);



endmodule
