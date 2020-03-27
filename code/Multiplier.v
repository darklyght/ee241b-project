module Multiplier(
  input        clock,
  input        reset,
  input        io_in_sign,
  input  [4:0] io_in_exponent,
  input  [9:0] io_in_mantissa,
  output       io_out_sign,
  output [4:0] io_out_exponent,
  output [9:0] io_out_mantissa
);
  assign io_out_sign = io_in_sign; // @[Multplier.scala 12:21]
  assign io_out_exponent = io_in_exponent; // @[Multplier.scala 13:25]
  assign io_out_mantissa = io_in_mantissa; // @[Multplier.scala 14:25]
endmodule
