module quartus_compile (
	  input logic resetn
	, input logic clock
	, input logic [0:0] dot16_original_start
	, output logic [0:0] dot16_original_busy
	, output logic [0:0] dot16_original_done
	, input logic [0:0] dot16_original_stall
	, output logic [31:0] dot16_original_returndata
	, input logic [31:0] dot16_original_in_a0
	, input logic [31:0] dot16_original_in_a1
	, input logic [31:0] dot16_original_in_a10
	, input logic [31:0] dot16_original_in_a11
	, input logic [31:0] dot16_original_in_a12
	, input logic [31:0] dot16_original_in_a13
	, input logic [31:0] dot16_original_in_a14
	, input logic [31:0] dot16_original_in_a15
	, input logic [31:0] dot16_original_in_a2
	, input logic [31:0] dot16_original_in_a3
	, input logic [31:0] dot16_original_in_a4
	, input logic [31:0] dot16_original_in_a5
	, input logic [31:0] dot16_original_in_a6
	, input logic [31:0] dot16_original_in_a7
	, input logic [31:0] dot16_original_in_a8
	, input logic [31:0] dot16_original_in_a9
	, input logic [31:0] dot16_original_in_b0
	, input logic [31:0] dot16_original_in_b1
	, input logic [31:0] dot16_original_in_b10
	, input logic [31:0] dot16_original_in_b11
	, input logic [31:0] dot16_original_in_b12
	, input logic [31:0] dot16_original_in_b13
	, input logic [31:0] dot16_original_in_b14
	, input logic [31:0] dot16_original_in_b15
	, input logic [31:0] dot16_original_in_b2
	, input logic [31:0] dot16_original_in_b3
	, input logic [31:0] dot16_original_in_b4
	, input logic [31:0] dot16_original_in_b5
	, input logic [31:0] dot16_original_in_b6
	, input logic [31:0] dot16_original_in_b7
	, input logic [31:0] dot16_original_in_b8
	, input logic [31:0] dot16_original_in_b9
	);

	logic [0:0] dot16_original_start_reg;
	logic [0:0] dot16_original_busy_reg;
	logic [0:0] dot16_original_done_reg;
	logic [0:0] dot16_original_stall_reg;
	logic [31:0] dot16_original_returndata_reg;
	logic [31:0] dot16_original_in_a0_reg;
	logic [31:0] dot16_original_in_a1_reg;
	logic [31:0] dot16_original_in_a10_reg;
	logic [31:0] dot16_original_in_a11_reg;
	logic [31:0] dot16_original_in_a12_reg;
	logic [31:0] dot16_original_in_a13_reg;
	logic [31:0] dot16_original_in_a14_reg;
	logic [31:0] dot16_original_in_a15_reg;
	logic [31:0] dot16_original_in_a2_reg;
	logic [31:0] dot16_original_in_a3_reg;
	logic [31:0] dot16_original_in_a4_reg;
	logic [31:0] dot16_original_in_a5_reg;
	logic [31:0] dot16_original_in_a6_reg;
	logic [31:0] dot16_original_in_a7_reg;
	logic [31:0] dot16_original_in_a8_reg;
	logic [31:0] dot16_original_in_a9_reg;
	logic [31:0] dot16_original_in_b0_reg;
	logic [31:0] dot16_original_in_b1_reg;
	logic [31:0] dot16_original_in_b10_reg;
	logic [31:0] dot16_original_in_b11_reg;
	logic [31:0] dot16_original_in_b12_reg;
	logic [31:0] dot16_original_in_b13_reg;
	logic [31:0] dot16_original_in_b14_reg;
	logic [31:0] dot16_original_in_b15_reg;
	logic [31:0] dot16_original_in_b2_reg;
	logic [31:0] dot16_original_in_b3_reg;
	logic [31:0] dot16_original_in_b4_reg;
	logic [31:0] dot16_original_in_b5_reg;
	logic [31:0] dot16_original_in_b6_reg;
	logic [31:0] dot16_original_in_b7_reg;
	logic [31:0] dot16_original_in_b8_reg;
	logic [31:0] dot16_original_in_b9_reg;


	always @(posedge clock) begin
		dot16_original_start_reg <= dot16_original_start;
		dot16_original_busy <= dot16_original_busy_reg;
		dot16_original_done <= dot16_original_done_reg;
		dot16_original_stall_reg <= dot16_original_stall;
		dot16_original_returndata <= dot16_original_returndata_reg;
		dot16_original_in_a0_reg <= dot16_original_in_a0;
		dot16_original_in_a1_reg <= dot16_original_in_a1;
		dot16_original_in_a10_reg <= dot16_original_in_a10;
		dot16_original_in_a11_reg <= dot16_original_in_a11;
		dot16_original_in_a12_reg <= dot16_original_in_a12;
		dot16_original_in_a13_reg <= dot16_original_in_a13;
		dot16_original_in_a14_reg <= dot16_original_in_a14;
		dot16_original_in_a15_reg <= dot16_original_in_a15;
		dot16_original_in_a2_reg <= dot16_original_in_a2;
		dot16_original_in_a3_reg <= dot16_original_in_a3;
		dot16_original_in_a4_reg <= dot16_original_in_a4;
		dot16_original_in_a5_reg <= dot16_original_in_a5;
		dot16_original_in_a6_reg <= dot16_original_in_a6;
		dot16_original_in_a7_reg <= dot16_original_in_a7;
		dot16_original_in_a8_reg <= dot16_original_in_a8;
		dot16_original_in_a9_reg <= dot16_original_in_a9;
		dot16_original_in_b0_reg <= dot16_original_in_b0;
		dot16_original_in_b1_reg <= dot16_original_in_b1;
		dot16_original_in_b10_reg <= dot16_original_in_b10;
		dot16_original_in_b11_reg <= dot16_original_in_b11;
		dot16_original_in_b12_reg <= dot16_original_in_b12;
		dot16_original_in_b13_reg <= dot16_original_in_b13;
		dot16_original_in_b14_reg <= dot16_original_in_b14;
		dot16_original_in_b15_reg <= dot16_original_in_b15;
		dot16_original_in_b2_reg <= dot16_original_in_b2;
		dot16_original_in_b3_reg <= dot16_original_in_b3;
		dot16_original_in_b4_reg <= dot16_original_in_b4;
		dot16_original_in_b5_reg <= dot16_original_in_b5;
		dot16_original_in_b6_reg <= dot16_original_in_b6;
		dot16_original_in_b7_reg <= dot16_original_in_b7;
		dot16_original_in_b8_reg <= dot16_original_in_b8;
		dot16_original_in_b9_reg <= dot16_original_in_b9;
	end


	reg [2:0] sync_resetn;
	always @(posedge clock or negedge resetn) begin
		if (!resetn) begin
			sync_resetn <= 3'b0;
		end else begin
			sync_resetn <= {sync_resetn[1:0], 1'b1};
		end
	end


	dot16_original dot16_original_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .start(dot16_original_start_reg)
		, .busy(dot16_original_busy_reg)
		, .done(dot16_original_done_reg)
		, .stall(dot16_original_stall_reg)
		, .returndata(dot16_original_returndata_reg)
		, .in_a0(dot16_original_in_a0_reg)
		, .in_a1(dot16_original_in_a1_reg)
		, .in_a10(dot16_original_in_a10_reg)
		, .in_a11(dot16_original_in_a11_reg)
		, .in_a12(dot16_original_in_a12_reg)
		, .in_a13(dot16_original_in_a13_reg)
		, .in_a14(dot16_original_in_a14_reg)
		, .in_a15(dot16_original_in_a15_reg)
		, .in_a2(dot16_original_in_a2_reg)
		, .in_a3(dot16_original_in_a3_reg)
		, .in_a4(dot16_original_in_a4_reg)
		, .in_a5(dot16_original_in_a5_reg)
		, .in_a6(dot16_original_in_a6_reg)
		, .in_a7(dot16_original_in_a7_reg)
		, .in_a8(dot16_original_in_a8_reg)
		, .in_a9(dot16_original_in_a9_reg)
		, .in_b0(dot16_original_in_b0_reg)
		, .in_b1(dot16_original_in_b1_reg)
		, .in_b10(dot16_original_in_b10_reg)
		, .in_b11(dot16_original_in_b11_reg)
		, .in_b12(dot16_original_in_b12_reg)
		, .in_b13(dot16_original_in_b13_reg)
		, .in_b14(dot16_original_in_b14_reg)
		, .in_b15(dot16_original_in_b15_reg)
		, .in_b2(dot16_original_in_b2_reg)
		, .in_b3(dot16_original_in_b3_reg)
		, .in_b4(dot16_original_in_b4_reg)
		, .in_b5(dot16_original_in_b5_reg)
		, .in_b6(dot16_original_in_b6_reg)
		, .in_b7(dot16_original_in_b7_reg)
		, .in_b8(dot16_original_in_b8_reg)
		, .in_b9(dot16_original_in_b9_reg)
	);



endmodule
