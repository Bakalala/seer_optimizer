module quartus_compile (
	  input logic resetn
	, input logic clock
	, input logic [0:0] gemm_blocked_k8_original_start
	, output logic [0:0] gemm_blocked_k8_original_busy
	, output logic [0:0] gemm_blocked_k8_original_done
	, input logic [0:0] gemm_blocked_k8_original_stall
	, output logic [31:0] gemm_blocked_k8_original_returndata
	, input logic [31:0] gemm_blocked_k8_original_in_BA0
	, input logic [31:0] gemm_blocked_k8_original_in_BA1
	, input logic [31:0] gemm_blocked_k8_original_in_BA2
	, input logic [31:0] gemm_blocked_k8_original_in_BA3
	, input logic [31:0] gemm_blocked_k8_original_in_BA4
	, input logic [31:0] gemm_blocked_k8_original_in_BA5
	, input logic [31:0] gemm_blocked_k8_original_in_BA6
	, input logic [31:0] gemm_blocked_k8_original_in_BA7
	, input logic [31:0] gemm_blocked_k8_original_in_BB0
	, input logic [31:0] gemm_blocked_k8_original_in_BB1
	, input logic [31:0] gemm_blocked_k8_original_in_BB2
	, input logic [31:0] gemm_blocked_k8_original_in_BB3
	, input logic [31:0] gemm_blocked_k8_original_in_BB4
	, input logic [31:0] gemm_blocked_k8_original_in_BB5
	, input logic [31:0] gemm_blocked_k8_original_in_BB6
	, input logic [31:0] gemm_blocked_k8_original_in_BB7
	);

	logic [0:0] gemm_blocked_k8_original_start_reg;
	logic [0:0] gemm_blocked_k8_original_busy_reg;
	logic [0:0] gemm_blocked_k8_original_done_reg;
	logic [0:0] gemm_blocked_k8_original_stall_reg;
	logic [31:0] gemm_blocked_k8_original_returndata_reg;
	logic [31:0] gemm_blocked_k8_original_in_BA0_reg;
	logic [31:0] gemm_blocked_k8_original_in_BA1_reg;
	logic [31:0] gemm_blocked_k8_original_in_BA2_reg;
	logic [31:0] gemm_blocked_k8_original_in_BA3_reg;
	logic [31:0] gemm_blocked_k8_original_in_BA4_reg;
	logic [31:0] gemm_blocked_k8_original_in_BA5_reg;
	logic [31:0] gemm_blocked_k8_original_in_BA6_reg;
	logic [31:0] gemm_blocked_k8_original_in_BA7_reg;
	logic [31:0] gemm_blocked_k8_original_in_BB0_reg;
	logic [31:0] gemm_blocked_k8_original_in_BB1_reg;
	logic [31:0] gemm_blocked_k8_original_in_BB2_reg;
	logic [31:0] gemm_blocked_k8_original_in_BB3_reg;
	logic [31:0] gemm_blocked_k8_original_in_BB4_reg;
	logic [31:0] gemm_blocked_k8_original_in_BB5_reg;
	logic [31:0] gemm_blocked_k8_original_in_BB6_reg;
	logic [31:0] gemm_blocked_k8_original_in_BB7_reg;


	always @(posedge clock) begin
		gemm_blocked_k8_original_start_reg <= gemm_blocked_k8_original_start;
		gemm_blocked_k8_original_busy <= gemm_blocked_k8_original_busy_reg;
		gemm_blocked_k8_original_done <= gemm_blocked_k8_original_done_reg;
		gemm_blocked_k8_original_stall_reg <= gemm_blocked_k8_original_stall;
		gemm_blocked_k8_original_returndata <= gemm_blocked_k8_original_returndata_reg;
		gemm_blocked_k8_original_in_BA0_reg <= gemm_blocked_k8_original_in_BA0;
		gemm_blocked_k8_original_in_BA1_reg <= gemm_blocked_k8_original_in_BA1;
		gemm_blocked_k8_original_in_BA2_reg <= gemm_blocked_k8_original_in_BA2;
		gemm_blocked_k8_original_in_BA3_reg <= gemm_blocked_k8_original_in_BA3;
		gemm_blocked_k8_original_in_BA4_reg <= gemm_blocked_k8_original_in_BA4;
		gemm_blocked_k8_original_in_BA5_reg <= gemm_blocked_k8_original_in_BA5;
		gemm_blocked_k8_original_in_BA6_reg <= gemm_blocked_k8_original_in_BA6;
		gemm_blocked_k8_original_in_BA7_reg <= gemm_blocked_k8_original_in_BA7;
		gemm_blocked_k8_original_in_BB0_reg <= gemm_blocked_k8_original_in_BB0;
		gemm_blocked_k8_original_in_BB1_reg <= gemm_blocked_k8_original_in_BB1;
		gemm_blocked_k8_original_in_BB2_reg <= gemm_blocked_k8_original_in_BB2;
		gemm_blocked_k8_original_in_BB3_reg <= gemm_blocked_k8_original_in_BB3;
		gemm_blocked_k8_original_in_BB4_reg <= gemm_blocked_k8_original_in_BB4;
		gemm_blocked_k8_original_in_BB5_reg <= gemm_blocked_k8_original_in_BB5;
		gemm_blocked_k8_original_in_BB6_reg <= gemm_blocked_k8_original_in_BB6;
		gemm_blocked_k8_original_in_BB7_reg <= gemm_blocked_k8_original_in_BB7;
	end


	reg [2:0] sync_resetn;
	always @(posedge clock or negedge resetn) begin
		if (!resetn) begin
			sync_resetn <= 3'b0;
		end else begin
			sync_resetn <= {sync_resetn[1:0], 1'b1};
		end
	end


	gemm_blocked_k8_original gemm_blocked_k8_original_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .start(gemm_blocked_k8_original_start_reg)
		, .busy(gemm_blocked_k8_original_busy_reg)
		, .done(gemm_blocked_k8_original_done_reg)
		, .stall(gemm_blocked_k8_original_stall_reg)
		, .returndata(gemm_blocked_k8_original_returndata_reg)
		, .in_BA0(gemm_blocked_k8_original_in_BA0_reg)
		, .in_BA1(gemm_blocked_k8_original_in_BA1_reg)
		, .in_BA2(gemm_blocked_k8_original_in_BA2_reg)
		, .in_BA3(gemm_blocked_k8_original_in_BA3_reg)
		, .in_BA4(gemm_blocked_k8_original_in_BA4_reg)
		, .in_BA5(gemm_blocked_k8_original_in_BA5_reg)
		, .in_BA6(gemm_blocked_k8_original_in_BA6_reg)
		, .in_BA7(gemm_blocked_k8_original_in_BA7_reg)
		, .in_BB0(gemm_blocked_k8_original_in_BB0_reg)
		, .in_BB1(gemm_blocked_k8_original_in_BB1_reg)
		, .in_BB2(gemm_blocked_k8_original_in_BB2_reg)
		, .in_BB3(gemm_blocked_k8_original_in_BB3_reg)
		, .in_BB4(gemm_blocked_k8_original_in_BB4_reg)
		, .in_BB5(gemm_blocked_k8_original_in_BB5_reg)
		, .in_BB6(gemm_blocked_k8_original_in_BB6_reg)
		, .in_BB7(gemm_blocked_k8_original_in_BB7_reg)
	);



endmodule
