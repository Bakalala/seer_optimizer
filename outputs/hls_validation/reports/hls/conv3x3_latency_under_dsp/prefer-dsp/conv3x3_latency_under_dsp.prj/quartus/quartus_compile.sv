module quartus_compile (
	  input logic resetn
	, input logic clock
	, input logic [0:0] conv3x3_latency_under_dsp_start
	, output logic [0:0] conv3x3_latency_under_dsp_busy
	, output logic [0:0] conv3x3_latency_under_dsp_done
	, input logic [0:0] conv3x3_latency_under_dsp_stall
	, output logic [31:0] conv3x3_latency_under_dsp_returndata
	, input logic [31:0] conv3x3_latency_under_dsp_in_p00
	, input logic [31:0] conv3x3_latency_under_dsp_in_p01
	, input logic [31:0] conv3x3_latency_under_dsp_in_p02
	, input logic [31:0] conv3x3_latency_under_dsp_in_p10
	, input logic [31:0] conv3x3_latency_under_dsp_in_p11
	, input logic [31:0] conv3x3_latency_under_dsp_in_p12
	, input logic [31:0] conv3x3_latency_under_dsp_in_p20
	, input logic [31:0] conv3x3_latency_under_dsp_in_p21
	, input logic [31:0] conv3x3_latency_under_dsp_in_p22
	);

	logic [0:0] conv3x3_latency_under_dsp_start_reg;
	logic [0:0] conv3x3_latency_under_dsp_busy_reg;
	logic [0:0] conv3x3_latency_under_dsp_done_reg;
	logic [0:0] conv3x3_latency_under_dsp_stall_reg;
	logic [31:0] conv3x3_latency_under_dsp_returndata_reg;
	logic [31:0] conv3x3_latency_under_dsp_in_p00_reg;
	logic [31:0] conv3x3_latency_under_dsp_in_p01_reg;
	logic [31:0] conv3x3_latency_under_dsp_in_p02_reg;
	logic [31:0] conv3x3_latency_under_dsp_in_p10_reg;
	logic [31:0] conv3x3_latency_under_dsp_in_p11_reg;
	logic [31:0] conv3x3_latency_under_dsp_in_p12_reg;
	logic [31:0] conv3x3_latency_under_dsp_in_p20_reg;
	logic [31:0] conv3x3_latency_under_dsp_in_p21_reg;
	logic [31:0] conv3x3_latency_under_dsp_in_p22_reg;


	always @(posedge clock) begin
		conv3x3_latency_under_dsp_start_reg <= conv3x3_latency_under_dsp_start;
		conv3x3_latency_under_dsp_busy <= conv3x3_latency_under_dsp_busy_reg;
		conv3x3_latency_under_dsp_done <= conv3x3_latency_under_dsp_done_reg;
		conv3x3_latency_under_dsp_stall_reg <= conv3x3_latency_under_dsp_stall;
		conv3x3_latency_under_dsp_returndata <= conv3x3_latency_under_dsp_returndata_reg;
		conv3x3_latency_under_dsp_in_p00_reg <= conv3x3_latency_under_dsp_in_p00;
		conv3x3_latency_under_dsp_in_p01_reg <= conv3x3_latency_under_dsp_in_p01;
		conv3x3_latency_under_dsp_in_p02_reg <= conv3x3_latency_under_dsp_in_p02;
		conv3x3_latency_under_dsp_in_p10_reg <= conv3x3_latency_under_dsp_in_p10;
		conv3x3_latency_under_dsp_in_p11_reg <= conv3x3_latency_under_dsp_in_p11;
		conv3x3_latency_under_dsp_in_p12_reg <= conv3x3_latency_under_dsp_in_p12;
		conv3x3_latency_under_dsp_in_p20_reg <= conv3x3_latency_under_dsp_in_p20;
		conv3x3_latency_under_dsp_in_p21_reg <= conv3x3_latency_under_dsp_in_p21;
		conv3x3_latency_under_dsp_in_p22_reg <= conv3x3_latency_under_dsp_in_p22;
	end


	reg [2:0] sync_resetn;
	always @(posedge clock or negedge resetn) begin
		if (!resetn) begin
			sync_resetn <= 3'b0;
		end else begin
			sync_resetn <= {sync_resetn[1:0], 1'b1};
		end
	end


	conv3x3_latency_under_dsp conv3x3_latency_under_dsp_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .start(conv3x3_latency_under_dsp_start_reg)
		, .busy(conv3x3_latency_under_dsp_busy_reg)
		, .done(conv3x3_latency_under_dsp_done_reg)
		, .stall(conv3x3_latency_under_dsp_stall_reg)
		, .returndata(conv3x3_latency_under_dsp_returndata_reg)
		, .in_p00(conv3x3_latency_under_dsp_in_p00_reg)
		, .in_p01(conv3x3_latency_under_dsp_in_p01_reg)
		, .in_p02(conv3x3_latency_under_dsp_in_p02_reg)
		, .in_p10(conv3x3_latency_under_dsp_in_p10_reg)
		, .in_p11(conv3x3_latency_under_dsp_in_p11_reg)
		, .in_p12(conv3x3_latency_under_dsp_in_p12_reg)
		, .in_p20(conv3x3_latency_under_dsp_in_p20_reg)
		, .in_p21(conv3x3_latency_under_dsp_in_p21_reg)
		, .in_p22(conv3x3_latency_under_dsp_in_p22_reg)
	);



endmodule
