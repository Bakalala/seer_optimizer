module quartus_compile (
	  input logic resetn
	, input logic clock
	, input logic [0:0] fir8_latency_under_lut_start
	, output logic [0:0] fir8_latency_under_lut_busy
	, output logic [0:0] fir8_latency_under_lut_done
	, input logic [0:0] fir8_latency_under_lut_stall
	, output logic [31:0] fir8_latency_under_lut_returndata
	, input logic [31:0] fir8_latency_under_lut_in_x0
	, input logic [31:0] fir8_latency_under_lut_in_x1
	, input logic [31:0] fir8_latency_under_lut_in_x2
	, input logic [31:0] fir8_latency_under_lut_in_x3
	, input logic [31:0] fir8_latency_under_lut_in_x4
	, input logic [31:0] fir8_latency_under_lut_in_x5
	, input logic [31:0] fir8_latency_under_lut_in_x6
	, input logic [31:0] fir8_latency_under_lut_in_x7
	);

	logic [0:0] fir8_latency_under_lut_start_reg;
	logic [0:0] fir8_latency_under_lut_busy_reg;
	logic [0:0] fir8_latency_under_lut_done_reg;
	logic [0:0] fir8_latency_under_lut_stall_reg;
	logic [31:0] fir8_latency_under_lut_returndata_reg;
	logic [31:0] fir8_latency_under_lut_in_x0_reg;
	logic [31:0] fir8_latency_under_lut_in_x1_reg;
	logic [31:0] fir8_latency_under_lut_in_x2_reg;
	logic [31:0] fir8_latency_under_lut_in_x3_reg;
	logic [31:0] fir8_latency_under_lut_in_x4_reg;
	logic [31:0] fir8_latency_under_lut_in_x5_reg;
	logic [31:0] fir8_latency_under_lut_in_x6_reg;
	logic [31:0] fir8_latency_under_lut_in_x7_reg;


	always @(posedge clock) begin
		fir8_latency_under_lut_start_reg <= fir8_latency_under_lut_start;
		fir8_latency_under_lut_busy <= fir8_latency_under_lut_busy_reg;
		fir8_latency_under_lut_done <= fir8_latency_under_lut_done_reg;
		fir8_latency_under_lut_stall_reg <= fir8_latency_under_lut_stall;
		fir8_latency_under_lut_returndata <= fir8_latency_under_lut_returndata_reg;
		fir8_latency_under_lut_in_x0_reg <= fir8_latency_under_lut_in_x0;
		fir8_latency_under_lut_in_x1_reg <= fir8_latency_under_lut_in_x1;
		fir8_latency_under_lut_in_x2_reg <= fir8_latency_under_lut_in_x2;
		fir8_latency_under_lut_in_x3_reg <= fir8_latency_under_lut_in_x3;
		fir8_latency_under_lut_in_x4_reg <= fir8_latency_under_lut_in_x4;
		fir8_latency_under_lut_in_x5_reg <= fir8_latency_under_lut_in_x5;
		fir8_latency_under_lut_in_x6_reg <= fir8_latency_under_lut_in_x6;
		fir8_latency_under_lut_in_x7_reg <= fir8_latency_under_lut_in_x7;
	end


	reg [2:0] sync_resetn;
	always @(posedge clock or negedge resetn) begin
		if (!resetn) begin
			sync_resetn <= 3'b0;
		end else begin
			sync_resetn <= {sync_resetn[1:0], 1'b1};
		end
	end


	fir8_latency_under_lut fir8_latency_under_lut_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .start(fir8_latency_under_lut_start_reg)
		, .busy(fir8_latency_under_lut_busy_reg)
		, .done(fir8_latency_under_lut_done_reg)
		, .stall(fir8_latency_under_lut_stall_reg)
		, .returndata(fir8_latency_under_lut_returndata_reg)
		, .in_x0(fir8_latency_under_lut_in_x0_reg)
		, .in_x1(fir8_latency_under_lut_in_x1_reg)
		, .in_x2(fir8_latency_under_lut_in_x2_reg)
		, .in_x3(fir8_latency_under_lut_in_x3_reg)
		, .in_x4(fir8_latency_under_lut_in_x4_reg)
		, .in_x5(fir8_latency_under_lut_in_x5_reg)
		, .in_x6(fir8_latency_under_lut_in_x6_reg)
		, .in_x7(fir8_latency_under_lut_in_x7_reg)
	);



endmodule
