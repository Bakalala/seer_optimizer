module quartus_compile (
	  input logic resetn
	, input logic clock
	, input logic [0:0] stencil5_latency_under_lut_start
	, output logic [0:0] stencil5_latency_under_lut_busy
	, output logic [0:0] stencil5_latency_under_lut_done
	, input logic [0:0] stencil5_latency_under_lut_stall
	, output logic [31:0] stencil5_latency_under_lut_returndata
	, input logic [31:0] stencil5_latency_under_lut_in_center
	, input logic [31:0] stencil5_latency_under_lut_in_east
	, input logic [31:0] stencil5_latency_under_lut_in_north
	, input logic [31:0] stencil5_latency_under_lut_in_south
	, input logic [31:0] stencil5_latency_under_lut_in_west
	);

	logic [0:0] stencil5_latency_under_lut_start_reg;
	logic [0:0] stencil5_latency_under_lut_busy_reg;
	logic [0:0] stencil5_latency_under_lut_done_reg;
	logic [0:0] stencil5_latency_under_lut_stall_reg;
	logic [31:0] stencil5_latency_under_lut_returndata_reg;
	logic [31:0] stencil5_latency_under_lut_in_center_reg;
	logic [31:0] stencil5_latency_under_lut_in_east_reg;
	logic [31:0] stencil5_latency_under_lut_in_north_reg;
	logic [31:0] stencil5_latency_under_lut_in_south_reg;
	logic [31:0] stencil5_latency_under_lut_in_west_reg;


	always @(posedge clock) begin
		stencil5_latency_under_lut_start_reg <= stencil5_latency_under_lut_start;
		stencil5_latency_under_lut_busy <= stencil5_latency_under_lut_busy_reg;
		stencil5_latency_under_lut_done <= stencil5_latency_under_lut_done_reg;
		stencil5_latency_under_lut_stall_reg <= stencil5_latency_under_lut_stall;
		stencil5_latency_under_lut_returndata <= stencil5_latency_under_lut_returndata_reg;
		stencil5_latency_under_lut_in_center_reg <= stencil5_latency_under_lut_in_center;
		stencil5_latency_under_lut_in_east_reg <= stencil5_latency_under_lut_in_east;
		stencil5_latency_under_lut_in_north_reg <= stencil5_latency_under_lut_in_north;
		stencil5_latency_under_lut_in_south_reg <= stencil5_latency_under_lut_in_south;
		stencil5_latency_under_lut_in_west_reg <= stencil5_latency_under_lut_in_west;
	end


	reg [2:0] sync_resetn;
	always @(posedge clock or negedge resetn) begin
		if (!resetn) begin
			sync_resetn <= 3'b0;
		end else begin
			sync_resetn <= {sync_resetn[1:0], 1'b1};
		end
	end


	stencil5_latency_under_lut stencil5_latency_under_lut_inst (
		  .resetn(sync_resetn[2])
		, .clock(clock)
		, .start(stencil5_latency_under_lut_start_reg)
		, .busy(stencil5_latency_under_lut_busy_reg)
		, .done(stencil5_latency_under_lut_done_reg)
		, .stall(stencil5_latency_under_lut_stall_reg)
		, .returndata(stencil5_latency_under_lut_returndata_reg)
		, .in_center(stencil5_latency_under_lut_in_center_reg)
		, .in_east(stencil5_latency_under_lut_in_east_reg)
		, .in_north(stencil5_latency_under_lut_in_north_reg)
		, .in_south(stencil5_latency_under_lut_in_south_reg)
		, .in_west(stencil5_latency_under_lut_in_west_reg)
	);



endmodule
