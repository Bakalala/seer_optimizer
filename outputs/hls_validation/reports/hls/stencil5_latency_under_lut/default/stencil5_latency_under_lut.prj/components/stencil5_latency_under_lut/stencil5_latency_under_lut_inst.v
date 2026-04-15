// Example instance of the top level module for: 
//     stencil5_latency_under_lut
// To include this component in your design, include: 
//     stencil5_latency_under_lut.qsys
// in your Quartus project and follow the template 
// below to instantiate the IP.  Alternatively, the IP core 
// can be generated from a Qsys system.

stencil5_latency_under_lut stencil5_latency_under_lut_inst (
  // Interface: clock (clock end)
  .clock     ( ), // 1-bit clk input
  // Interface: reset (reset end)
  .resetn    ( ), // 1-bit reset_n input
  // Interface: call (conduit sink)
  .start     ( ), // 1-bit valid input
  .busy      ( ), // 1-bit stall output
  // Interface: return (conduit source)
  .done      ( ), // 1-bit valid output
  .stall     ( ), // 1-bit stall input
  // Interface: returndata (conduit source)
  .returndata( ), // 32-bit data output
  // Interface: in_center (conduit sink)
  .in_center ( ), // 32-bit data input
  // Interface: in_east (conduit sink)
  .in_east   ( ), // 32-bit data input
  // Interface: in_north (conduit sink)
  .in_north  ( ), // 32-bit data input
  // Interface: in_south (conduit sink)
  .in_south  ( ), // 32-bit data input
  // Interface: in_west (conduit sink)
  .in_west   ( )  // 32-bit data input
);
