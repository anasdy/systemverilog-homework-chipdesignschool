//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux_2_1
(
  input  [3:0] d0, d1,
  input        sel,
  output [3:0] y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module mux_4_1
(
  input  [3:0] d0, d1, d2, d3,
  input  [1:0] sel,
  output [3:0] y
);

  // Task:
  // Implement mux_4_1 using three instances of mux_2_1

  logic [3:0] mux_d0_d1_out, mux_d2_d3_out;

  mux_2_1 mux_d0_d1 (
    .d0(d0),
    .d1(d1),
    .sel(sel[0]),
    .y(mux_d0_d1_out)
  );

  mux_2_1 mux_d2_d3 (
    .d0(d2),
    .d1(d3),
    .sel(sel[0]),
    .y(mux_d2_d3_out)
  );

  assign y = sel[1] ? mux_d2_d3_out : mux_d0_d1_out;

endmodule
