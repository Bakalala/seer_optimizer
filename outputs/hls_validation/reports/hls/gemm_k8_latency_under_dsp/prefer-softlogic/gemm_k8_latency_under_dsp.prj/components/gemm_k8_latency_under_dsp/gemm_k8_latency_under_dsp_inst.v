// Example instance of the top level module for: 
//     gemm_k8_latency_under_dsp
// To include this component in your design, include: 
//     gemm_k8_latency_under_dsp.qsys
// in your Quartus project and follow the template 
// below to instantiate the IP.  Alternatively, the IP core 
// can be generated from a Qsys system.

gemm_k8_latency_under_dsp gemm_k8_latency_under_dsp_inst (
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
  // Interface: in_A0 (conduit sink)
  .in_A0     ( ), // 32-bit data input
  // Interface: in_A1 (conduit sink)
  .in_A1     ( ), // 32-bit data input
  // Interface: in_A2 (conduit sink)
  .in_A2     ( ), // 32-bit data input
  // Interface: in_A3 (conduit sink)
  .in_A3     ( ), // 32-bit data input
  // Interface: in_A4 (conduit sink)
  .in_A4     ( ), // 32-bit data input
  // Interface: in_A5 (conduit sink)
  .in_A5     ( ), // 32-bit data input
  // Interface: in_A6 (conduit sink)
  .in_A6     ( ), // 32-bit data input
  // Interface: in_A7 (conduit sink)
  .in_A7     ( ), // 32-bit data input
  // Interface: in_B0 (conduit sink)
  .in_B0     ( ), // 32-bit data input
  // Interface: in_B1 (conduit sink)
  .in_B1     ( ), // 32-bit data input
  // Interface: in_B2 (conduit sink)
  .in_B2     ( ), // 32-bit data input
  // Interface: in_B3 (conduit sink)
  .in_B3     ( ), // 32-bit data input
  // Interface: in_B4 (conduit sink)
  .in_B4     ( ), // 32-bit data input
  // Interface: in_B5 (conduit sink)
  .in_B5     ( ), // 32-bit data input
  // Interface: in_B6 (conduit sink)
  .in_B6     ( ), // 32-bit data input
  // Interface: in_B7 (conduit sink)
  .in_B7     ( )  // 32-bit data input
);
