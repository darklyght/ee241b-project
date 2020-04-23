module linearMultiplier(
  input          io_A_zero,
  input          io_A_nan,
  input          io_A_sign,
  input  [5:0]   io_A_exponent,
  input  [12:0]  io_A_fraction,
  input          io_B_zero,
  input          io_B_nan,
  input          io_B_sign,
  input  [5:0]   io_B_exponent,
  input  [12:0]  io_B_fraction,
  output         io_out_zero,
  output         io_out_nan,
  output [128:0] io_out_number
);
  wire [6:0] exponentSum; // @[Multiplier.scala 15:41]
  wire [25:0] fractionProduct; // @[Multiplier.scala 16:45]
  wire [7:0] _T; // @[Multiplier.scala 17:34]
  wire [8:0] shift; // @[Multiplier.scala 17:49]
  wire  _T_1; // @[Multiplier.scala 18:32]
  wire [8:0] _T_5; // @[Multiplier.scala 18:67]
  wire [25:0] _T_6; // @[Multiplier.scala 18:55]
  wire [8:0] _T_7; // @[Multiplier.scala 18:100]
  wire [536:0] _GEN_0; // @[Multiplier.scala 18:91]
  wire [536:0] _T_8; // @[Multiplier.scala 18:91]
  wire  _T_9; // @[Multiplier.scala 20:34]
  wire [5:0] _T_12; // @[Multiplier.scala 20:57]
  wire [8:0] _GEN_1; // @[Multiplier.scala 20:55]
  wire  _T_13; // @[Multiplier.scala 20:55]
  wire  _T_15; // @[Multiplier.scala 21:32]
  wire  _T_16; // @[Multiplier.scala 21:52]
  wire  _T_18; // @[Multiplier.scala 22:42]
  wire  _T_19; // @[Multiplier.scala 22:76]
  wire [536:0] _T_21; // @[Multiplier.scala 22:105]
  wire [536:0] _T_24; // @[Multiplier.scala 22:97]
  wire [536:0] _T_26; // @[Multiplier.scala 22:64]
  wire [536:0] _T_27; // @[Multiplier.scala 22:29]
  assign exponentSum = $signed(io_A_exponent) + $signed(io_B_exponent); // @[Multiplier.scala 15:41]
  assign fractionProduct = io_A_fraction * io_B_fraction; // @[Multiplier.scala 16:45]
  assign _T = 7'sh38 + $signed(exponentSum); // @[Multiplier.scala 17:34]
  assign shift = $signed(_T) - 8'sh18; // @[Multiplier.scala 17:49]
  assign _T_1 = $signed(shift) < 9'sh0; // @[Multiplier.scala 18:32]
  assign _T_5 = 9'sh0 - $signed(shift); // @[Multiplier.scala 18:67]
  assign _T_6 = fractionProduct >> _T_5; // @[Multiplier.scala 18:55]
  assign _T_7 = $signed(_T) - 8'sh18; // @[Multiplier.scala 18:100]
  assign _GEN_0 = {{511'd0}, fractionProduct}; // @[Multiplier.scala 18:91]
  assign _T_8 = _GEN_0 << _T_7; // @[Multiplier.scala 18:91]
  assign _T_9 = io_A_zero | io_B_zero; // @[Multiplier.scala 20:34]
  assign _T_12 = 6'sh0 - 6'sh18; // @[Multiplier.scala 20:57]
  assign _GEN_1 = {{3{_T_12[5]}},_T_12}; // @[Multiplier.scala 20:55]
  assign _T_13 = $signed(shift) < $signed(_GEN_1); // @[Multiplier.scala 20:55]
  assign _T_15 = io_A_nan | io_B_nan; // @[Multiplier.scala 21:32]
  assign _T_16 = $signed(shift) >= 9'sh67; // @[Multiplier.scala 21:52]
  assign _T_18 = io_out_zero | io_out_nan; // @[Multiplier.scala 22:42]
  assign _T_19 = io_A_sign ^ io_B_sign; // @[Multiplier.scala 22:76]
  assign _T_21 = _T_1 ? {{511'd0}, _T_6} : _T_8; // @[Multiplier.scala 22:105]
  assign _T_24 = 537'sh0 - $signed(_T_21); // @[Multiplier.scala 22:97]
  assign _T_26 = _T_19 ? $signed(_T_24) : $signed(_T_21); // @[Multiplier.scala 22:64]
  assign _T_27 = _T_18 ? $signed(537'sh0) : $signed(_T_26); // @[Multiplier.scala 22:29]
  assign io_out_zero = _T_9 | _T_13; // @[Multiplier.scala 20:21]
  assign io_out_nan = _T_15 | _T_16; // @[Multiplier.scala 21:20]
  assign io_out_number = _T_27[128:0]; // @[Multiplier.scala 22:23]
endmodule
module linearMultiplierMAC(
  input          io_A_zero,
  input          io_A_nan,
  input          io_A_sign,
  input  [5:0]   io_A_exponent,
  input  [12:0]  io_A_fraction,
  input          io_B_zero,
  input          io_B_nan,
  input          io_B_sign,
  input  [5:0]   io_B_exponent,
  input  [12:0]  io_B_fraction,
  input          io_C_zero,
  input          io_C_nan,
  input  [128:0] io_C_number,
  output         io_out_zero,
  output         io_out_nan,
  output [128:0] io_out_number
);
  wire  multiplier_io_A_zero; // @[Multiplier.scala 33:32]
  wire  multiplier_io_A_nan; // @[Multiplier.scala 33:32]
  wire  multiplier_io_A_sign; // @[Multiplier.scala 33:32]
  wire [5:0] multiplier_io_A_exponent; // @[Multiplier.scala 33:32]
  wire [12:0] multiplier_io_A_fraction; // @[Multiplier.scala 33:32]
  wire  multiplier_io_B_zero; // @[Multiplier.scala 33:32]
  wire  multiplier_io_B_nan; // @[Multiplier.scala 33:32]
  wire  multiplier_io_B_sign; // @[Multiplier.scala 33:32]
  wire [5:0] multiplier_io_B_exponent; // @[Multiplier.scala 33:32]
  wire [12:0] multiplier_io_B_fraction; // @[Multiplier.scala 33:32]
  wire  multiplier_io_out_zero; // @[Multiplier.scala 33:32]
  wire  multiplier_io_out_nan; // @[Multiplier.scala 33:32]
  wire [128:0] multiplier_io_out_number; // @[Multiplier.scala 33:32]
  wire [128:0] sum; // @[Multiplier.scala 36:44]
  wire  _T_2; // @[Multiplier.scala 37:48]
  wire  _T_5; // @[Multiplier.scala 37:99]
  wire  _T_8; // @[Multiplier.scala 37:151]
  wire  _T_10; // @[Multiplier.scala 37:228]
  wire  _T_11; // @[Multiplier.scala 37:198]
  wire  _T_13; // @[Multiplier.scala 38:45]
  wire  _T_18; // @[Multiplier.scala 38:184]
  wire  _T_19; // @[Multiplier.scala 38:146]
  wire  _T_22; // @[Multiplier.scala 38:193]
  linearMultiplier multiplier ( // @[Multiplier.scala 33:32]
    .io_A_zero(multiplier_io_A_zero),
    .io_A_nan(multiplier_io_A_nan),
    .io_A_sign(multiplier_io_A_sign),
    .io_A_exponent(multiplier_io_A_exponent),
    .io_A_fraction(multiplier_io_A_fraction),
    .io_B_zero(multiplier_io_B_zero),
    .io_B_nan(multiplier_io_B_nan),
    .io_B_sign(multiplier_io_B_sign),
    .io_B_exponent(multiplier_io_B_exponent),
    .io_B_fraction(multiplier_io_B_fraction),
    .io_out_zero(multiplier_io_out_zero),
    .io_out_nan(multiplier_io_out_nan),
    .io_out_number(multiplier_io_out_number)
  );
  assign sum = $signed(multiplier_io_out_number) + $signed(io_C_number); // @[Multiplier.scala 36:44]
  assign _T_2 = multiplier_io_out_zero & io_C_zero; // @[Multiplier.scala 37:48]
  assign _T_5 = io_C_number[128] == multiplier_io_out_number[128]; // @[Multiplier.scala 37:99]
  assign _T_8 = _T_5 & io_C_number[128]; // @[Multiplier.scala 37:151]
  assign _T_10 = ~sum[128]; // @[Multiplier.scala 37:228]
  assign _T_11 = _T_8 & _T_10; // @[Multiplier.scala 37:198]
  assign _T_13 = multiplier_io_out_nan | io_C_nan; // @[Multiplier.scala 38:45]
  assign _T_18 = ~io_C_number[128]; // @[Multiplier.scala 38:184]
  assign _T_19 = _T_5 & _T_18; // @[Multiplier.scala 38:146]
  assign _T_22 = _T_19 & sum[128]; // @[Multiplier.scala 38:193]
  assign io_out_zero = _T_2 | _T_11; // @[Multiplier.scala 37:21]
  assign io_out_nan = _T_13 | _T_22; // @[Multiplier.scala 38:20]
  assign io_out_number = $signed(multiplier_io_out_number) + $signed(io_C_number); // @[Multiplier.scala 39:23]
  assign multiplier_io_A_zero = io_A_zero; // @[Multiplier.scala 34:25]
  assign multiplier_io_A_nan = io_A_nan; // @[Multiplier.scala 34:25]
  assign multiplier_io_A_sign = io_A_sign; // @[Multiplier.scala 34:25]
  assign multiplier_io_A_exponent = io_A_exponent; // @[Multiplier.scala 34:25]
  assign multiplier_io_A_fraction = io_A_fraction; // @[Multiplier.scala 34:25]
  assign multiplier_io_B_zero = io_B_zero; // @[Multiplier.scala 35:25]
  assign multiplier_io_B_nan = io_B_nan; // @[Multiplier.scala 35:25]
  assign multiplier_io_B_sign = io_B_sign; // @[Multiplier.scala 35:25]
  assign multiplier_io_B_exponent = io_B_exponent; // @[Multiplier.scala 35:25]
  assign multiplier_io_B_fraction = io_B_fraction; // @[Multiplier.scala 35:25]
endmodule
module linearTile(
  input          clock,
  input          io_A_in_zero,
  input          io_A_in_nan,
  input          io_A_in_sign,
  input  [5:0]   io_A_in_exponent,
  input  [12:0]  io_A_in_fraction,
  input          io_B_in_zero,
  input          io_B_in_nan,
  input          io_B_in_sign,
  input  [5:0]   io_B_in_exponent,
  input  [12:0]  io_B_in_fraction,
  input          io_C_in_zero,
  input          io_C_in_nan,
  input  [128:0] io_C_in_number,
  input          io_prop_in,
  output         io_A_out_zero,
  output         io_A_out_nan,
  output         io_A_out_sign,
  output [5:0]   io_A_out_exponent,
  output [12:0]  io_A_out_fraction,
  output         io_B_out_zero,
  output         io_B_out_nan,
  output         io_B_out_sign,
  output [5:0]   io_B_out_exponent,
  output [12:0]  io_B_out_fraction,
  output         io_C_out_zero,
  output         io_C_out_nan,
  output [128:0] io_C_out_number,
  output         io_prop_out
);
  wire  mac_io_A_zero; // @[Tile.scala 29:33]
  wire  mac_io_A_nan; // @[Tile.scala 29:33]
  wire  mac_io_A_sign; // @[Tile.scala 29:33]
  wire [5:0] mac_io_A_exponent; // @[Tile.scala 29:33]
  wire [12:0] mac_io_A_fraction; // @[Tile.scala 29:33]
  wire  mac_io_B_zero; // @[Tile.scala 29:33]
  wire  mac_io_B_nan; // @[Tile.scala 29:33]
  wire  mac_io_B_sign; // @[Tile.scala 29:33]
  wire [5:0] mac_io_B_exponent; // @[Tile.scala 29:33]
  wire [12:0] mac_io_B_fraction; // @[Tile.scala 29:33]
  wire  mac_io_C_zero; // @[Tile.scala 29:33]
  wire  mac_io_C_nan; // @[Tile.scala 29:33]
  wire [128:0] mac_io_C_number; // @[Tile.scala 29:33]
  wire  mac_io_out_zero; // @[Tile.scala 29:33]
  wire  mac_io_out_nan; // @[Tile.scala 29:33]
  wire [128:0] mac_io_out_number; // @[Tile.scala 29:33]
  wire  _T; // @[Tile.scala 22:45]
  reg  A0_zero; // @[Reg.scala 15:16]
  reg [31:0] _RAND_0;
  reg  A0_nan; // @[Reg.scala 15:16]
  reg [31:0] _RAND_1;
  reg  A0_sign; // @[Reg.scala 15:16]
  reg [31:0] _RAND_2;
  reg [5:0] A0_exponent; // @[Reg.scala 15:16]
  reg [31:0] _RAND_3;
  reg [12:0] A0_fraction; // @[Reg.scala 15:16]
  reg [31:0] _RAND_4;
  reg  A1_zero; // @[Reg.scala 15:16]
  reg [31:0] _RAND_5;
  reg  A1_nan; // @[Reg.scala 15:16]
  reg [31:0] _RAND_6;
  reg  A1_sign; // @[Reg.scala 15:16]
  reg [31:0] _RAND_7;
  reg [5:0] A1_exponent; // @[Reg.scala 15:16]
  reg [31:0] _RAND_8;
  reg [12:0] A1_fraction; // @[Reg.scala 15:16]
  reg [31:0] _RAND_9;
  reg  A_zero; // @[Tile.scala 25:32]
  reg [31:0] _RAND_10;
  reg  A_nan; // @[Tile.scala 25:32]
  reg [31:0] _RAND_11;
  reg  A_sign; // @[Tile.scala 25:32]
  reg [31:0] _RAND_12;
  reg [5:0] A_exponent; // @[Tile.scala 25:32]
  reg [31:0] _RAND_13;
  reg [12:0] A_fraction; // @[Tile.scala 25:32]
  reg [31:0] _RAND_14;
  reg  B_zero; // @[Tile.scala 26:32]
  reg [31:0] _RAND_15;
  reg  B_nan; // @[Tile.scala 26:32]
  reg [31:0] _RAND_16;
  reg  B_sign; // @[Tile.scala 26:32]
  reg [31:0] _RAND_17;
  reg [5:0] B_exponent; // @[Tile.scala 26:32]
  reg [31:0] _RAND_18;
  reg [12:0] B_fraction; // @[Tile.scala 26:32]
  reg [31:0] _RAND_19;
  reg  prop; // @[Tile.scala 27:35]
  reg [31:0] _RAND_20;
  reg  C_zero; // @[Tile.scala 34:32]
  reg [31:0] _RAND_21;
  reg  C_nan; // @[Tile.scala 34:32]
  reg [31:0] _RAND_22;
  reg [128:0] C_number; // @[Tile.scala 34:32]
  reg [159:0] _RAND_23;
  linearMultiplierMAC mac ( // @[Tile.scala 29:33]
    .io_A_zero(mac_io_A_zero),
    .io_A_nan(mac_io_A_nan),
    .io_A_sign(mac_io_A_sign),
    .io_A_exponent(mac_io_A_exponent),
    .io_A_fraction(mac_io_A_fraction),
    .io_B_zero(mac_io_B_zero),
    .io_B_nan(mac_io_B_nan),
    .io_B_sign(mac_io_B_sign),
    .io_B_exponent(mac_io_B_exponent),
    .io_B_fraction(mac_io_B_fraction),
    .io_C_zero(mac_io_C_zero),
    .io_C_nan(mac_io_C_nan),
    .io_C_number(mac_io_C_number),
    .io_out_zero(mac_io_out_zero),
    .io_out_nan(mac_io_out_nan),
    .io_out_number(mac_io_out_number)
  );
  assign _T = ~io_prop_in; // @[Tile.scala 22:45]
  assign io_A_out_zero = A_zero; // @[Tile.scala 36:26]
  assign io_A_out_nan = A_nan; // @[Tile.scala 36:26]
  assign io_A_out_sign = A_sign; // @[Tile.scala 36:26]
  assign io_A_out_exponent = A_exponent; // @[Tile.scala 36:26]
  assign io_A_out_fraction = A_fraction; // @[Tile.scala 36:26]
  assign io_B_out_zero = B_zero; // @[Tile.scala 37:26]
  assign io_B_out_nan = B_nan; // @[Tile.scala 37:26]
  assign io_B_out_sign = B_sign; // @[Tile.scala 37:26]
  assign io_B_out_exponent = B_exponent; // @[Tile.scala 37:26]
  assign io_B_out_fraction = B_fraction; // @[Tile.scala 37:26]
  assign io_C_out_zero = C_zero; // @[Tile.scala 38:26]
  assign io_C_out_nan = C_nan; // @[Tile.scala 38:26]
  assign io_C_out_number = C_number; // @[Tile.scala 38:26]
  assign io_prop_out = prop; // @[Tile.scala 39:29]
  assign mac_io_A_zero = io_prop_in ? A0_zero : A1_zero; // @[Tile.scala 30:26]
  assign mac_io_A_nan = io_prop_in ? A0_nan : A1_nan; // @[Tile.scala 30:26]
  assign mac_io_A_sign = io_prop_in ? A0_sign : A1_sign; // @[Tile.scala 30:26]
  assign mac_io_A_exponent = io_prop_in ? $signed(A0_exponent) : $signed(A1_exponent); // @[Tile.scala 30:26]
  assign mac_io_A_fraction = io_prop_in ? A0_fraction : A1_fraction; // @[Tile.scala 30:26]
  assign mac_io_B_zero = io_B_in_zero; // @[Tile.scala 31:26]
  assign mac_io_B_nan = io_B_in_nan; // @[Tile.scala 31:26]
  assign mac_io_B_sign = io_B_in_sign; // @[Tile.scala 31:26]
  assign mac_io_B_exponent = io_B_in_exponent; // @[Tile.scala 31:26]
  assign mac_io_B_fraction = io_B_in_fraction; // @[Tile.scala 31:26]
  assign mac_io_C_zero = io_C_in_zero; // @[Tile.scala 32:26]
  assign mac_io_C_nan = io_C_in_nan; // @[Tile.scala 32:26]
  assign mac_io_C_number = io_C_in_number; // @[Tile.scala 32:26]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  A0_zero = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  A0_nan = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  A0_sign = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  A0_exponent = _RAND_3[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  A0_fraction = _RAND_4[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  A1_zero = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  A1_nan = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  A1_sign = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  A1_exponent = _RAND_8[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  A1_fraction = _RAND_9[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  A_zero = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  A_nan = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  A_sign = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  A_exponent = _RAND_13[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  A_fraction = _RAND_14[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  B_zero = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  B_nan = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  B_sign = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  B_exponent = _RAND_18[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  B_fraction = _RAND_19[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  prop = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  C_zero = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  C_nan = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {5{`RANDOM}};
  C_number = _RAND_23[128:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (_T) begin
      A0_zero <= io_A_in_zero;
    end
    if (_T) begin
      A0_nan <= io_A_in_nan;
    end
    if (_T) begin
      A0_sign <= io_A_in_sign;
    end
    if (_T) begin
      A0_exponent <= io_A_in_exponent;
    end
    if (_T) begin
      A0_fraction <= io_A_in_fraction;
    end
    if (io_prop_in) begin
      A1_zero <= io_A_in_zero;
    end
    if (io_prop_in) begin
      A1_nan <= io_A_in_nan;
    end
    if (io_prop_in) begin
      A1_sign <= io_A_in_sign;
    end
    if (io_prop_in) begin
      A1_exponent <= io_A_in_exponent;
    end
    if (io_prop_in) begin
      A1_fraction <= io_A_in_fraction;
    end
    if (io_prop_in) begin
      A_zero <= A1_zero;
    end else begin
      A_zero <= A0_zero;
    end
    if (io_prop_in) begin
      A_nan <= A1_nan;
    end else begin
      A_nan <= A0_nan;
    end
    if (io_prop_in) begin
      A_sign <= A1_sign;
    end else begin
      A_sign <= A0_sign;
    end
    if (io_prop_in) begin
      A_exponent <= A1_exponent;
    end else begin
      A_exponent <= A0_exponent;
    end
    if (io_prop_in) begin
      A_fraction <= A1_fraction;
    end else begin
      A_fraction <= A0_fraction;
    end
    B_zero <= io_B_in_zero;
    B_nan <= io_B_in_nan;
    B_sign <= io_B_in_sign;
    B_exponent <= io_B_in_exponent;
    B_fraction <= io_B_in_fraction;
    prop <= io_prop_in;
    C_zero <= mac_io_out_zero;
    C_nan <= mac_io_out_nan;
    C_number <= mac_io_out_number;
  end
endmodule
module toPositUnpacked(
  input  [15:0] io_in,
  output        io_out_zero,
  output        io_out_nan,
  output        io_out_sign,
  output [5:0]  io_out_exponent,
  output [12:0] io_out_fraction
);
  wire [14:0] _T_2; // @[Bitwise.scala 71:12]
  wire [14:0] _T_3; // @[Conversion.scala 20:43]
  wire [14:0] _GEN_0; // @[Conversion.scala 20:78]
  wire [14:0] others; // @[Conversion.scala 20:78]
  wire [14:0] _T_7; // @[Conversion.scala 21:77]
  wire [7:0] _T_12; // @[Bitwise.scala 102:31]
  wire [7:0] _T_14; // @[Bitwise.scala 102:65]
  wire [7:0] _T_16; // @[Bitwise.scala 102:75]
  wire [7:0] _T_17; // @[Bitwise.scala 102:39]
  wire [7:0] _GEN_1; // @[Bitwise.scala 102:31]
  wire [7:0] _T_22; // @[Bitwise.scala 102:31]
  wire [7:0] _T_24; // @[Bitwise.scala 102:65]
  wire [7:0] _T_26; // @[Bitwise.scala 102:75]
  wire [7:0] _T_27; // @[Bitwise.scala 102:39]
  wire [7:0] _GEN_2; // @[Bitwise.scala 102:31]
  wire [7:0] _T_32; // @[Bitwise.scala 102:31]
  wire [7:0] _T_34; // @[Bitwise.scala 102:65]
  wire [7:0] _T_36; // @[Bitwise.scala 102:75]
  wire [7:0] _T_37; // @[Bitwise.scala 102:39]
  wire [14:0] _T_57; // @[Cat.scala 29:58]
  wire [3:0] _T_73; // @[Mux.scala 47:69]
  wire [3:0] _T_74; // @[Mux.scala 47:69]
  wire [3:0] _T_75; // @[Mux.scala 47:69]
  wire [3:0] _T_76; // @[Mux.scala 47:69]
  wire [3:0] _T_77; // @[Mux.scala 47:69]
  wire [3:0] _T_78; // @[Mux.scala 47:69]
  wire [3:0] _T_79; // @[Mux.scala 47:69]
  wire [3:0] _T_80; // @[Mux.scala 47:69]
  wire [3:0] _T_81; // @[Mux.scala 47:69]
  wire [3:0] _T_82; // @[Mux.scala 47:69]
  wire [3:0] _T_83; // @[Mux.scala 47:69]
  wire [3:0] _T_84; // @[Mux.scala 47:69]
  wire [3:0] _T_85; // @[Mux.scala 47:69]
  wire [3:0] _T_86; // @[Mux.scala 47:69]
  wire [7:0] _T_91; // @[Bitwise.scala 102:31]
  wire [7:0] _T_93; // @[Bitwise.scala 102:65]
  wire [7:0] _T_95; // @[Bitwise.scala 102:75]
  wire [7:0] _T_96; // @[Bitwise.scala 102:39]
  wire [7:0] _GEN_3; // @[Bitwise.scala 102:31]
  wire [7:0] _T_101; // @[Bitwise.scala 102:31]
  wire [7:0] _T_103; // @[Bitwise.scala 102:65]
  wire [7:0] _T_105; // @[Bitwise.scala 102:75]
  wire [7:0] _T_106; // @[Bitwise.scala 102:39]
  wire [7:0] _GEN_4; // @[Bitwise.scala 102:31]
  wire [7:0] _T_111; // @[Bitwise.scala 102:31]
  wire [7:0] _T_113; // @[Bitwise.scala 102:65]
  wire [7:0] _T_115; // @[Bitwise.scala 102:75]
  wire [7:0] _T_116; // @[Bitwise.scala 102:39]
  wire [14:0] _T_136; // @[Cat.scala 29:58]
  wire [3:0] _T_152; // @[Mux.scala 47:69]
  wire [3:0] _T_153; // @[Mux.scala 47:69]
  wire [3:0] _T_154; // @[Mux.scala 47:69]
  wire [3:0] _T_155; // @[Mux.scala 47:69]
  wire [3:0] _T_156; // @[Mux.scala 47:69]
  wire [3:0] _T_157; // @[Mux.scala 47:69]
  wire [3:0] _T_158; // @[Mux.scala 47:69]
  wire [3:0] _T_159; // @[Mux.scala 47:69]
  wire [3:0] _T_160; // @[Mux.scala 47:69]
  wire [3:0] _T_161; // @[Mux.scala 47:69]
  wire [3:0] _T_162; // @[Mux.scala 47:69]
  wire [3:0] _T_163; // @[Mux.scala 47:69]
  wire [3:0] _T_164; // @[Mux.scala 47:69]
  wire [3:0] _T_165; // @[Mux.scala 47:69]
  wire [3:0] _T_166; // @[Conversion.scala 21:23]
  wire  _T_167; // @[Conversion.scala 21:132]
  wire  _T_168; // @[Conversion.scala 21:147]
  wire  _T_169; // @[Conversion.scala 21:139]
  wire  _T_170; // @[Conversion.scala 21:137]
  wire [3:0] _GEN_5; // @[Conversion.scala 21:122]
  wire [3:0] _T_172; // @[Conversion.scala 21:122]
  wire [4:0] leading; // @[Conversion.scala 14:27 Conversion.scala 21:17]
  wire [4:0] _T_174; // @[Conversion.scala 22:60]
  wire [4:0] _T_177; // @[Conversion.scala 22:67]
  wire [4:0] _T_181; // @[Conversion.scala 22:74]
  wire [4:0] _T_182; // @[Conversion.scala 22:22]
  wire [4:0] _T_184; // @[Conversion.scala 23:48]
  wire [45:0] _GEN_6; // @[Conversion.scala 23:36]
  wire [45:0] _T_185; // @[Conversion.scala 23:36]
  wire [12:0] exponentFraction; // @[Conversion.scala 16:36 Conversion.scala 23:26]
  wire  exponent; // @[Conversion.scala 24:37]
  wire  _T_190; // @[Conversion.scala 27:24]
  wire  _T_192; // @[Conversion.scala 27:71]
  wire  _T_193; // @[Conversion.scala 27:47]
  wire [5:0] regime; // @[Conversion.scala 15:26 Conversion.scala 22:16]
  wire [6:0] _T_201; // @[Conversion.scala 30:36]
  wire [1:0] _T_202; // @[Conversion.scala 30:99]
  wire [6:0] _GEN_7; // @[Conversion.scala 30:88]
  wire [6:0] _T_205; // @[Conversion.scala 30:88]
  assign _T_2 = io_out_sign ? 15'h7fff : 15'h0; // @[Bitwise.scala 71:12]
  assign _T_3 = io_in[14:0] ^ _T_2; // @[Conversion.scala 20:43]
  assign _GEN_0 = {{14'd0}, io_out_sign}; // @[Conversion.scala 20:78]
  assign others = _T_3 + _GEN_0; // @[Conversion.scala 20:78]
  assign _T_7 = ~others; // @[Conversion.scala 21:77]
  assign _T_12 = {{4'd0}, _T_7[7:4]}; // @[Bitwise.scala 102:31]
  assign _T_14 = {_T_7[3:0], 4'h0}; // @[Bitwise.scala 102:65]
  assign _T_16 = _T_14 & 8'hf0; // @[Bitwise.scala 102:75]
  assign _T_17 = _T_12 | _T_16; // @[Bitwise.scala 102:39]
  assign _GEN_1 = {{2'd0}, _T_17[7:2]}; // @[Bitwise.scala 102:31]
  assign _T_22 = _GEN_1 & 8'h33; // @[Bitwise.scala 102:31]
  assign _T_24 = {_T_17[5:0], 2'h0}; // @[Bitwise.scala 102:65]
  assign _T_26 = _T_24 & 8'hcc; // @[Bitwise.scala 102:75]
  assign _T_27 = _T_22 | _T_26; // @[Bitwise.scala 102:39]
  assign _GEN_2 = {{1'd0}, _T_27[7:1]}; // @[Bitwise.scala 102:31]
  assign _T_32 = _GEN_2 & 8'h55; // @[Bitwise.scala 102:31]
  assign _T_34 = {_T_27[6:0], 1'h0}; // @[Bitwise.scala 102:65]
  assign _T_36 = _T_34 & 8'haa; // @[Bitwise.scala 102:75]
  assign _T_37 = _T_32 | _T_36; // @[Bitwise.scala 102:39]
  assign _T_57 = {_T_37,_T_7[8],_T_7[9],_T_7[10],_T_7[11],_T_7[12],_T_7[13],_T_7[14]}; // @[Cat.scala 29:58]
  assign _T_73 = _T_57[13] ? 4'hd : 4'he; // @[Mux.scala 47:69]
  assign _T_74 = _T_57[12] ? 4'hc : _T_73; // @[Mux.scala 47:69]
  assign _T_75 = _T_57[11] ? 4'hb : _T_74; // @[Mux.scala 47:69]
  assign _T_76 = _T_57[10] ? 4'ha : _T_75; // @[Mux.scala 47:69]
  assign _T_77 = _T_57[9] ? 4'h9 : _T_76; // @[Mux.scala 47:69]
  assign _T_78 = _T_57[8] ? 4'h8 : _T_77; // @[Mux.scala 47:69]
  assign _T_79 = _T_57[7] ? 4'h7 : _T_78; // @[Mux.scala 47:69]
  assign _T_80 = _T_57[6] ? 4'h6 : _T_79; // @[Mux.scala 47:69]
  assign _T_81 = _T_57[5] ? 4'h5 : _T_80; // @[Mux.scala 47:69]
  assign _T_82 = _T_57[4] ? 4'h4 : _T_81; // @[Mux.scala 47:69]
  assign _T_83 = _T_57[3] ? 4'h3 : _T_82; // @[Mux.scala 47:69]
  assign _T_84 = _T_57[2] ? 4'h2 : _T_83; // @[Mux.scala 47:69]
  assign _T_85 = _T_57[1] ? 4'h1 : _T_84; // @[Mux.scala 47:69]
  assign _T_86 = _T_57[0] ? 4'h0 : _T_85; // @[Mux.scala 47:69]
  assign _T_91 = {{4'd0}, others[7:4]}; // @[Bitwise.scala 102:31]
  assign _T_93 = {others[3:0], 4'h0}; // @[Bitwise.scala 102:65]
  assign _T_95 = _T_93 & 8'hf0; // @[Bitwise.scala 102:75]
  assign _T_96 = _T_91 | _T_95; // @[Bitwise.scala 102:39]
  assign _GEN_3 = {{2'd0}, _T_96[7:2]}; // @[Bitwise.scala 102:31]
  assign _T_101 = _GEN_3 & 8'h33; // @[Bitwise.scala 102:31]
  assign _T_103 = {_T_96[5:0], 2'h0}; // @[Bitwise.scala 102:65]
  assign _T_105 = _T_103 & 8'hcc; // @[Bitwise.scala 102:75]
  assign _T_106 = _T_101 | _T_105; // @[Bitwise.scala 102:39]
  assign _GEN_4 = {{1'd0}, _T_106[7:1]}; // @[Bitwise.scala 102:31]
  assign _T_111 = _GEN_4 & 8'h55; // @[Bitwise.scala 102:31]
  assign _T_113 = {_T_106[6:0], 1'h0}; // @[Bitwise.scala 102:65]
  assign _T_115 = _T_113 & 8'haa; // @[Bitwise.scala 102:75]
  assign _T_116 = _T_111 | _T_115; // @[Bitwise.scala 102:39]
  assign _T_136 = {_T_116,others[8],others[9],others[10],others[11],others[12],others[13],others[14]}; // @[Cat.scala 29:58]
  assign _T_152 = _T_136[13] ? 4'hd : 4'he; // @[Mux.scala 47:69]
  assign _T_153 = _T_136[12] ? 4'hc : _T_152; // @[Mux.scala 47:69]
  assign _T_154 = _T_136[11] ? 4'hb : _T_153; // @[Mux.scala 47:69]
  assign _T_155 = _T_136[10] ? 4'ha : _T_154; // @[Mux.scala 47:69]
  assign _T_156 = _T_136[9] ? 4'h9 : _T_155; // @[Mux.scala 47:69]
  assign _T_157 = _T_136[8] ? 4'h8 : _T_156; // @[Mux.scala 47:69]
  assign _T_158 = _T_136[7] ? 4'h7 : _T_157; // @[Mux.scala 47:69]
  assign _T_159 = _T_136[6] ? 4'h6 : _T_158; // @[Mux.scala 47:69]
  assign _T_160 = _T_136[5] ? 4'h5 : _T_159; // @[Mux.scala 47:69]
  assign _T_161 = _T_136[4] ? 4'h4 : _T_160; // @[Mux.scala 47:69]
  assign _T_162 = _T_136[3] ? 4'h3 : _T_161; // @[Mux.scala 47:69]
  assign _T_163 = _T_136[2] ? 4'h2 : _T_162; // @[Mux.scala 47:69]
  assign _T_164 = _T_136[1] ? 4'h1 : _T_163; // @[Mux.scala 47:69]
  assign _T_165 = _T_136[0] ? 4'h0 : _T_164; // @[Mux.scala 47:69]
  assign _T_166 = others[14] ? _T_86 : _T_165; // @[Conversion.scala 21:23]
  assign _T_167 = others == 15'h7fff; // @[Conversion.scala 21:132]
  assign _T_168 = others != 15'h0; // @[Conversion.scala 21:147]
  assign _T_169 = ~_T_168; // @[Conversion.scala 21:139]
  assign _T_170 = _T_167 | _T_169; // @[Conversion.scala 21:137]
  assign _GEN_5 = {{3'd0}, _T_170}; // @[Conversion.scala 21:122]
  assign _T_172 = _T_166 + _GEN_5; // @[Conversion.scala 21:122]
  assign leading = {{1'd0}, _T_172}; // @[Conversion.scala 14:27 Conversion.scala 21:17]
  assign _T_174 = {{1'd0}, _T_172}; // @[Conversion.scala 22:60]
  assign _T_177 = $signed(_T_174) - 5'sh1; // @[Conversion.scala 22:67]
  assign _T_181 = 5'sh0 - $signed(_T_174); // @[Conversion.scala 22:74]
  assign _T_182 = others[14] ? $signed(_T_177) : $signed(_T_181); // @[Conversion.scala 22:22]
  assign _T_184 = leading - 5'h1; // @[Conversion.scala 23:48]
  assign _GEN_6 = {{31'd0}, others}; // @[Conversion.scala 23:36]
  assign _T_185 = _GEN_6 << _T_184; // @[Conversion.scala 23:36]
  assign exponentFraction = _T_185[12:0]; // @[Conversion.scala 16:36 Conversion.scala 23:26]
  assign exponent = exponentFraction[12]; // @[Conversion.scala 24:37]
  assign _T_190 = ~io_in[15]; // @[Conversion.scala 27:24]
  assign _T_192 = io_in[14:0] != 15'h0; // @[Conversion.scala 27:71]
  assign _T_193 = ~_T_192; // @[Conversion.scala 27:47]
  assign regime = {{1{_T_182[4]}},_T_182}; // @[Conversion.scala 15:26 Conversion.scala 22:16]
  assign _T_201 = {$signed(regime), 1'h0}; // @[Conversion.scala 30:36]
  assign _T_202 = {1'b0,$signed(exponent)}; // @[Conversion.scala 30:99]
  assign _GEN_7 = {{5{_T_202[1]}},_T_202}; // @[Conversion.scala 30:88]
  assign _T_205 = $signed(_T_201) + $signed(_GEN_7); // @[Conversion.scala 30:88]
  assign io_out_zero = _T_190 & _T_193; // @[Conversion.scala 27:21]
  assign io_out_nan = io_in[15] & _T_193; // @[Conversion.scala 28:20]
  assign io_out_sign = io_in[15]; // @[Conversion.scala 29:21]
  assign io_out_exponent = _T_205[5:0]; // @[Conversion.scala 30:25]
  assign io_out_fraction = {1'h1,exponentFraction[11:0]}; // @[Conversion.scala 31:25]
endmodule
module linearPositArray(
  input          clock,
  input          reset,
  input  [15:0]  io_A_in_0,
  input  [15:0]  io_A_in_1,
  input  [15:0]  io_A_in_2,
  input  [15:0]  io_A_in_3,
  input  [15:0]  io_B_in_0,
  input  [15:0]  io_B_in_1,
  input  [15:0]  io_B_in_2,
  input  [15:0]  io_B_in_3,
  input          io_C_in_0_zero,
  input          io_C_in_0_nan,
  input  [128:0] io_C_in_0_number,
  input          io_C_in_1_zero,
  input          io_C_in_1_nan,
  input  [128:0] io_C_in_1_number,
  input          io_C_in_2_zero,
  input          io_C_in_2_nan,
  input  [128:0] io_C_in_2_number,
  input          io_C_in_3_zero,
  input          io_C_in_3_nan,
  input  [128:0] io_C_in_3_number,
  input          io_prop_in_0,
  input          io_prop_in_1,
  input          io_prop_in_2,
  input          io_prop_in_3,
  output         io_C_out_0_zero,
  output         io_C_out_0_nan,
  output [128:0] io_C_out_0_number,
  output         io_C_out_1_zero,
  output         io_C_out_1_nan,
  output [128:0] io_C_out_1_number,
  output         io_C_out_2_zero,
  output         io_C_out_2_nan,
  output [128:0] io_C_out_2_number,
  output         io_C_out_3_zero,
  output         io_C_out_3_nan,
  output [128:0] io_C_out_3_number
);
  wire  array_0_0_clock; // @[Array.scala 58:78]
  wire  array_0_0_io_A_in_zero; // @[Array.scala 58:78]
  wire  array_0_0_io_A_in_nan; // @[Array.scala 58:78]
  wire  array_0_0_io_A_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_0_0_io_A_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_0_0_io_A_in_fraction; // @[Array.scala 58:78]
  wire  array_0_0_io_B_in_zero; // @[Array.scala 58:78]
  wire  array_0_0_io_B_in_nan; // @[Array.scala 58:78]
  wire  array_0_0_io_B_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_0_0_io_B_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_0_0_io_B_in_fraction; // @[Array.scala 58:78]
  wire  array_0_0_io_C_in_zero; // @[Array.scala 58:78]
  wire  array_0_0_io_C_in_nan; // @[Array.scala 58:78]
  wire [128:0] array_0_0_io_C_in_number; // @[Array.scala 58:78]
  wire  array_0_0_io_prop_in; // @[Array.scala 58:78]
  wire  array_0_0_io_A_out_zero; // @[Array.scala 58:78]
  wire  array_0_0_io_A_out_nan; // @[Array.scala 58:78]
  wire  array_0_0_io_A_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_0_0_io_A_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_0_0_io_A_out_fraction; // @[Array.scala 58:78]
  wire  array_0_0_io_B_out_zero; // @[Array.scala 58:78]
  wire  array_0_0_io_B_out_nan; // @[Array.scala 58:78]
  wire  array_0_0_io_B_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_0_0_io_B_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_0_0_io_B_out_fraction; // @[Array.scala 58:78]
  wire  array_0_0_io_C_out_zero; // @[Array.scala 58:78]
  wire  array_0_0_io_C_out_nan; // @[Array.scala 58:78]
  wire [128:0] array_0_0_io_C_out_number; // @[Array.scala 58:78]
  wire  array_0_0_io_prop_out; // @[Array.scala 58:78]
  wire  array_0_1_clock; // @[Array.scala 58:78]
  wire  array_0_1_io_A_in_zero; // @[Array.scala 58:78]
  wire  array_0_1_io_A_in_nan; // @[Array.scala 58:78]
  wire  array_0_1_io_A_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_0_1_io_A_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_0_1_io_A_in_fraction; // @[Array.scala 58:78]
  wire  array_0_1_io_B_in_zero; // @[Array.scala 58:78]
  wire  array_0_1_io_B_in_nan; // @[Array.scala 58:78]
  wire  array_0_1_io_B_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_0_1_io_B_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_0_1_io_B_in_fraction; // @[Array.scala 58:78]
  wire  array_0_1_io_C_in_zero; // @[Array.scala 58:78]
  wire  array_0_1_io_C_in_nan; // @[Array.scala 58:78]
  wire [128:0] array_0_1_io_C_in_number; // @[Array.scala 58:78]
  wire  array_0_1_io_prop_in; // @[Array.scala 58:78]
  wire  array_0_1_io_A_out_zero; // @[Array.scala 58:78]
  wire  array_0_1_io_A_out_nan; // @[Array.scala 58:78]
  wire  array_0_1_io_A_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_0_1_io_A_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_0_1_io_A_out_fraction; // @[Array.scala 58:78]
  wire  array_0_1_io_B_out_zero; // @[Array.scala 58:78]
  wire  array_0_1_io_B_out_nan; // @[Array.scala 58:78]
  wire  array_0_1_io_B_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_0_1_io_B_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_0_1_io_B_out_fraction; // @[Array.scala 58:78]
  wire  array_0_1_io_C_out_zero; // @[Array.scala 58:78]
  wire  array_0_1_io_C_out_nan; // @[Array.scala 58:78]
  wire [128:0] array_0_1_io_C_out_number; // @[Array.scala 58:78]
  wire  array_0_1_io_prop_out; // @[Array.scala 58:78]
  wire  array_0_2_clock; // @[Array.scala 58:78]
  wire  array_0_2_io_A_in_zero; // @[Array.scala 58:78]
  wire  array_0_2_io_A_in_nan; // @[Array.scala 58:78]
  wire  array_0_2_io_A_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_0_2_io_A_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_0_2_io_A_in_fraction; // @[Array.scala 58:78]
  wire  array_0_2_io_B_in_zero; // @[Array.scala 58:78]
  wire  array_0_2_io_B_in_nan; // @[Array.scala 58:78]
  wire  array_0_2_io_B_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_0_2_io_B_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_0_2_io_B_in_fraction; // @[Array.scala 58:78]
  wire  array_0_2_io_C_in_zero; // @[Array.scala 58:78]
  wire  array_0_2_io_C_in_nan; // @[Array.scala 58:78]
  wire [128:0] array_0_2_io_C_in_number; // @[Array.scala 58:78]
  wire  array_0_2_io_prop_in; // @[Array.scala 58:78]
  wire  array_0_2_io_A_out_zero; // @[Array.scala 58:78]
  wire  array_0_2_io_A_out_nan; // @[Array.scala 58:78]
  wire  array_0_2_io_A_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_0_2_io_A_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_0_2_io_A_out_fraction; // @[Array.scala 58:78]
  wire  array_0_2_io_B_out_zero; // @[Array.scala 58:78]
  wire  array_0_2_io_B_out_nan; // @[Array.scala 58:78]
  wire  array_0_2_io_B_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_0_2_io_B_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_0_2_io_B_out_fraction; // @[Array.scala 58:78]
  wire  array_0_2_io_C_out_zero; // @[Array.scala 58:78]
  wire  array_0_2_io_C_out_nan; // @[Array.scala 58:78]
  wire [128:0] array_0_2_io_C_out_number; // @[Array.scala 58:78]
  wire  array_0_2_io_prop_out; // @[Array.scala 58:78]
  wire  array_0_3_clock; // @[Array.scala 58:78]
  wire  array_0_3_io_A_in_zero; // @[Array.scala 58:78]
  wire  array_0_3_io_A_in_nan; // @[Array.scala 58:78]
  wire  array_0_3_io_A_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_0_3_io_A_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_0_3_io_A_in_fraction; // @[Array.scala 58:78]
  wire  array_0_3_io_B_in_zero; // @[Array.scala 58:78]
  wire  array_0_3_io_B_in_nan; // @[Array.scala 58:78]
  wire  array_0_3_io_B_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_0_3_io_B_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_0_3_io_B_in_fraction; // @[Array.scala 58:78]
  wire  array_0_3_io_C_in_zero; // @[Array.scala 58:78]
  wire  array_0_3_io_C_in_nan; // @[Array.scala 58:78]
  wire [128:0] array_0_3_io_C_in_number; // @[Array.scala 58:78]
  wire  array_0_3_io_prop_in; // @[Array.scala 58:78]
  wire  array_0_3_io_A_out_zero; // @[Array.scala 58:78]
  wire  array_0_3_io_A_out_nan; // @[Array.scala 58:78]
  wire  array_0_3_io_A_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_0_3_io_A_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_0_3_io_A_out_fraction; // @[Array.scala 58:78]
  wire  array_0_3_io_B_out_zero; // @[Array.scala 58:78]
  wire  array_0_3_io_B_out_nan; // @[Array.scala 58:78]
  wire  array_0_3_io_B_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_0_3_io_B_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_0_3_io_B_out_fraction; // @[Array.scala 58:78]
  wire  array_0_3_io_C_out_zero; // @[Array.scala 58:78]
  wire  array_0_3_io_C_out_nan; // @[Array.scala 58:78]
  wire [128:0] array_0_3_io_C_out_number; // @[Array.scala 58:78]
  wire  array_0_3_io_prop_out; // @[Array.scala 58:78]
  wire  array_1_0_clock; // @[Array.scala 58:78]
  wire  array_1_0_io_A_in_zero; // @[Array.scala 58:78]
  wire  array_1_0_io_A_in_nan; // @[Array.scala 58:78]
  wire  array_1_0_io_A_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_1_0_io_A_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_1_0_io_A_in_fraction; // @[Array.scala 58:78]
  wire  array_1_0_io_B_in_zero; // @[Array.scala 58:78]
  wire  array_1_0_io_B_in_nan; // @[Array.scala 58:78]
  wire  array_1_0_io_B_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_1_0_io_B_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_1_0_io_B_in_fraction; // @[Array.scala 58:78]
  wire  array_1_0_io_C_in_zero; // @[Array.scala 58:78]
  wire  array_1_0_io_C_in_nan; // @[Array.scala 58:78]
  wire [128:0] array_1_0_io_C_in_number; // @[Array.scala 58:78]
  wire  array_1_0_io_prop_in; // @[Array.scala 58:78]
  wire  array_1_0_io_A_out_zero; // @[Array.scala 58:78]
  wire  array_1_0_io_A_out_nan; // @[Array.scala 58:78]
  wire  array_1_0_io_A_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_1_0_io_A_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_1_0_io_A_out_fraction; // @[Array.scala 58:78]
  wire  array_1_0_io_B_out_zero; // @[Array.scala 58:78]
  wire  array_1_0_io_B_out_nan; // @[Array.scala 58:78]
  wire  array_1_0_io_B_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_1_0_io_B_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_1_0_io_B_out_fraction; // @[Array.scala 58:78]
  wire  array_1_0_io_C_out_zero; // @[Array.scala 58:78]
  wire  array_1_0_io_C_out_nan; // @[Array.scala 58:78]
  wire [128:0] array_1_0_io_C_out_number; // @[Array.scala 58:78]
  wire  array_1_0_io_prop_out; // @[Array.scala 58:78]
  wire  array_1_1_clock; // @[Array.scala 58:78]
  wire  array_1_1_io_A_in_zero; // @[Array.scala 58:78]
  wire  array_1_1_io_A_in_nan; // @[Array.scala 58:78]
  wire  array_1_1_io_A_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_1_1_io_A_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_1_1_io_A_in_fraction; // @[Array.scala 58:78]
  wire  array_1_1_io_B_in_zero; // @[Array.scala 58:78]
  wire  array_1_1_io_B_in_nan; // @[Array.scala 58:78]
  wire  array_1_1_io_B_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_1_1_io_B_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_1_1_io_B_in_fraction; // @[Array.scala 58:78]
  wire  array_1_1_io_C_in_zero; // @[Array.scala 58:78]
  wire  array_1_1_io_C_in_nan; // @[Array.scala 58:78]
  wire [128:0] array_1_1_io_C_in_number; // @[Array.scala 58:78]
  wire  array_1_1_io_prop_in; // @[Array.scala 58:78]
  wire  array_1_1_io_A_out_zero; // @[Array.scala 58:78]
  wire  array_1_1_io_A_out_nan; // @[Array.scala 58:78]
  wire  array_1_1_io_A_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_1_1_io_A_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_1_1_io_A_out_fraction; // @[Array.scala 58:78]
  wire  array_1_1_io_B_out_zero; // @[Array.scala 58:78]
  wire  array_1_1_io_B_out_nan; // @[Array.scala 58:78]
  wire  array_1_1_io_B_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_1_1_io_B_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_1_1_io_B_out_fraction; // @[Array.scala 58:78]
  wire  array_1_1_io_C_out_zero; // @[Array.scala 58:78]
  wire  array_1_1_io_C_out_nan; // @[Array.scala 58:78]
  wire [128:0] array_1_1_io_C_out_number; // @[Array.scala 58:78]
  wire  array_1_1_io_prop_out; // @[Array.scala 58:78]
  wire  array_1_2_clock; // @[Array.scala 58:78]
  wire  array_1_2_io_A_in_zero; // @[Array.scala 58:78]
  wire  array_1_2_io_A_in_nan; // @[Array.scala 58:78]
  wire  array_1_2_io_A_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_1_2_io_A_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_1_2_io_A_in_fraction; // @[Array.scala 58:78]
  wire  array_1_2_io_B_in_zero; // @[Array.scala 58:78]
  wire  array_1_2_io_B_in_nan; // @[Array.scala 58:78]
  wire  array_1_2_io_B_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_1_2_io_B_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_1_2_io_B_in_fraction; // @[Array.scala 58:78]
  wire  array_1_2_io_C_in_zero; // @[Array.scala 58:78]
  wire  array_1_2_io_C_in_nan; // @[Array.scala 58:78]
  wire [128:0] array_1_2_io_C_in_number; // @[Array.scala 58:78]
  wire  array_1_2_io_prop_in; // @[Array.scala 58:78]
  wire  array_1_2_io_A_out_zero; // @[Array.scala 58:78]
  wire  array_1_2_io_A_out_nan; // @[Array.scala 58:78]
  wire  array_1_2_io_A_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_1_2_io_A_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_1_2_io_A_out_fraction; // @[Array.scala 58:78]
  wire  array_1_2_io_B_out_zero; // @[Array.scala 58:78]
  wire  array_1_2_io_B_out_nan; // @[Array.scala 58:78]
  wire  array_1_2_io_B_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_1_2_io_B_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_1_2_io_B_out_fraction; // @[Array.scala 58:78]
  wire  array_1_2_io_C_out_zero; // @[Array.scala 58:78]
  wire  array_1_2_io_C_out_nan; // @[Array.scala 58:78]
  wire [128:0] array_1_2_io_C_out_number; // @[Array.scala 58:78]
  wire  array_1_2_io_prop_out; // @[Array.scala 58:78]
  wire  array_1_3_clock; // @[Array.scala 58:78]
  wire  array_1_3_io_A_in_zero; // @[Array.scala 58:78]
  wire  array_1_3_io_A_in_nan; // @[Array.scala 58:78]
  wire  array_1_3_io_A_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_1_3_io_A_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_1_3_io_A_in_fraction; // @[Array.scala 58:78]
  wire  array_1_3_io_B_in_zero; // @[Array.scala 58:78]
  wire  array_1_3_io_B_in_nan; // @[Array.scala 58:78]
  wire  array_1_3_io_B_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_1_3_io_B_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_1_3_io_B_in_fraction; // @[Array.scala 58:78]
  wire  array_1_3_io_C_in_zero; // @[Array.scala 58:78]
  wire  array_1_3_io_C_in_nan; // @[Array.scala 58:78]
  wire [128:0] array_1_3_io_C_in_number; // @[Array.scala 58:78]
  wire  array_1_3_io_prop_in; // @[Array.scala 58:78]
  wire  array_1_3_io_A_out_zero; // @[Array.scala 58:78]
  wire  array_1_3_io_A_out_nan; // @[Array.scala 58:78]
  wire  array_1_3_io_A_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_1_3_io_A_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_1_3_io_A_out_fraction; // @[Array.scala 58:78]
  wire  array_1_3_io_B_out_zero; // @[Array.scala 58:78]
  wire  array_1_3_io_B_out_nan; // @[Array.scala 58:78]
  wire  array_1_3_io_B_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_1_3_io_B_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_1_3_io_B_out_fraction; // @[Array.scala 58:78]
  wire  array_1_3_io_C_out_zero; // @[Array.scala 58:78]
  wire  array_1_3_io_C_out_nan; // @[Array.scala 58:78]
  wire [128:0] array_1_3_io_C_out_number; // @[Array.scala 58:78]
  wire  array_1_3_io_prop_out; // @[Array.scala 58:78]
  wire  array_2_0_clock; // @[Array.scala 58:78]
  wire  array_2_0_io_A_in_zero; // @[Array.scala 58:78]
  wire  array_2_0_io_A_in_nan; // @[Array.scala 58:78]
  wire  array_2_0_io_A_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_2_0_io_A_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_2_0_io_A_in_fraction; // @[Array.scala 58:78]
  wire  array_2_0_io_B_in_zero; // @[Array.scala 58:78]
  wire  array_2_0_io_B_in_nan; // @[Array.scala 58:78]
  wire  array_2_0_io_B_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_2_0_io_B_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_2_0_io_B_in_fraction; // @[Array.scala 58:78]
  wire  array_2_0_io_C_in_zero; // @[Array.scala 58:78]
  wire  array_2_0_io_C_in_nan; // @[Array.scala 58:78]
  wire [128:0] array_2_0_io_C_in_number; // @[Array.scala 58:78]
  wire  array_2_0_io_prop_in; // @[Array.scala 58:78]
  wire  array_2_0_io_A_out_zero; // @[Array.scala 58:78]
  wire  array_2_0_io_A_out_nan; // @[Array.scala 58:78]
  wire  array_2_0_io_A_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_2_0_io_A_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_2_0_io_A_out_fraction; // @[Array.scala 58:78]
  wire  array_2_0_io_B_out_zero; // @[Array.scala 58:78]
  wire  array_2_0_io_B_out_nan; // @[Array.scala 58:78]
  wire  array_2_0_io_B_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_2_0_io_B_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_2_0_io_B_out_fraction; // @[Array.scala 58:78]
  wire  array_2_0_io_C_out_zero; // @[Array.scala 58:78]
  wire  array_2_0_io_C_out_nan; // @[Array.scala 58:78]
  wire [128:0] array_2_0_io_C_out_number; // @[Array.scala 58:78]
  wire  array_2_0_io_prop_out; // @[Array.scala 58:78]
  wire  array_2_1_clock; // @[Array.scala 58:78]
  wire  array_2_1_io_A_in_zero; // @[Array.scala 58:78]
  wire  array_2_1_io_A_in_nan; // @[Array.scala 58:78]
  wire  array_2_1_io_A_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_2_1_io_A_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_2_1_io_A_in_fraction; // @[Array.scala 58:78]
  wire  array_2_1_io_B_in_zero; // @[Array.scala 58:78]
  wire  array_2_1_io_B_in_nan; // @[Array.scala 58:78]
  wire  array_2_1_io_B_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_2_1_io_B_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_2_1_io_B_in_fraction; // @[Array.scala 58:78]
  wire  array_2_1_io_C_in_zero; // @[Array.scala 58:78]
  wire  array_2_1_io_C_in_nan; // @[Array.scala 58:78]
  wire [128:0] array_2_1_io_C_in_number; // @[Array.scala 58:78]
  wire  array_2_1_io_prop_in; // @[Array.scala 58:78]
  wire  array_2_1_io_A_out_zero; // @[Array.scala 58:78]
  wire  array_2_1_io_A_out_nan; // @[Array.scala 58:78]
  wire  array_2_1_io_A_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_2_1_io_A_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_2_1_io_A_out_fraction; // @[Array.scala 58:78]
  wire  array_2_1_io_B_out_zero; // @[Array.scala 58:78]
  wire  array_2_1_io_B_out_nan; // @[Array.scala 58:78]
  wire  array_2_1_io_B_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_2_1_io_B_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_2_1_io_B_out_fraction; // @[Array.scala 58:78]
  wire  array_2_1_io_C_out_zero; // @[Array.scala 58:78]
  wire  array_2_1_io_C_out_nan; // @[Array.scala 58:78]
  wire [128:0] array_2_1_io_C_out_number; // @[Array.scala 58:78]
  wire  array_2_1_io_prop_out; // @[Array.scala 58:78]
  wire  array_2_2_clock; // @[Array.scala 58:78]
  wire  array_2_2_io_A_in_zero; // @[Array.scala 58:78]
  wire  array_2_2_io_A_in_nan; // @[Array.scala 58:78]
  wire  array_2_2_io_A_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_2_2_io_A_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_2_2_io_A_in_fraction; // @[Array.scala 58:78]
  wire  array_2_2_io_B_in_zero; // @[Array.scala 58:78]
  wire  array_2_2_io_B_in_nan; // @[Array.scala 58:78]
  wire  array_2_2_io_B_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_2_2_io_B_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_2_2_io_B_in_fraction; // @[Array.scala 58:78]
  wire  array_2_2_io_C_in_zero; // @[Array.scala 58:78]
  wire  array_2_2_io_C_in_nan; // @[Array.scala 58:78]
  wire [128:0] array_2_2_io_C_in_number; // @[Array.scala 58:78]
  wire  array_2_2_io_prop_in; // @[Array.scala 58:78]
  wire  array_2_2_io_A_out_zero; // @[Array.scala 58:78]
  wire  array_2_2_io_A_out_nan; // @[Array.scala 58:78]
  wire  array_2_2_io_A_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_2_2_io_A_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_2_2_io_A_out_fraction; // @[Array.scala 58:78]
  wire  array_2_2_io_B_out_zero; // @[Array.scala 58:78]
  wire  array_2_2_io_B_out_nan; // @[Array.scala 58:78]
  wire  array_2_2_io_B_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_2_2_io_B_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_2_2_io_B_out_fraction; // @[Array.scala 58:78]
  wire  array_2_2_io_C_out_zero; // @[Array.scala 58:78]
  wire  array_2_2_io_C_out_nan; // @[Array.scala 58:78]
  wire [128:0] array_2_2_io_C_out_number; // @[Array.scala 58:78]
  wire  array_2_2_io_prop_out; // @[Array.scala 58:78]
  wire  array_2_3_clock; // @[Array.scala 58:78]
  wire  array_2_3_io_A_in_zero; // @[Array.scala 58:78]
  wire  array_2_3_io_A_in_nan; // @[Array.scala 58:78]
  wire  array_2_3_io_A_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_2_3_io_A_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_2_3_io_A_in_fraction; // @[Array.scala 58:78]
  wire  array_2_3_io_B_in_zero; // @[Array.scala 58:78]
  wire  array_2_3_io_B_in_nan; // @[Array.scala 58:78]
  wire  array_2_3_io_B_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_2_3_io_B_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_2_3_io_B_in_fraction; // @[Array.scala 58:78]
  wire  array_2_3_io_C_in_zero; // @[Array.scala 58:78]
  wire  array_2_3_io_C_in_nan; // @[Array.scala 58:78]
  wire [128:0] array_2_3_io_C_in_number; // @[Array.scala 58:78]
  wire  array_2_3_io_prop_in; // @[Array.scala 58:78]
  wire  array_2_3_io_A_out_zero; // @[Array.scala 58:78]
  wire  array_2_3_io_A_out_nan; // @[Array.scala 58:78]
  wire  array_2_3_io_A_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_2_3_io_A_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_2_3_io_A_out_fraction; // @[Array.scala 58:78]
  wire  array_2_3_io_B_out_zero; // @[Array.scala 58:78]
  wire  array_2_3_io_B_out_nan; // @[Array.scala 58:78]
  wire  array_2_3_io_B_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_2_3_io_B_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_2_3_io_B_out_fraction; // @[Array.scala 58:78]
  wire  array_2_3_io_C_out_zero; // @[Array.scala 58:78]
  wire  array_2_3_io_C_out_nan; // @[Array.scala 58:78]
  wire [128:0] array_2_3_io_C_out_number; // @[Array.scala 58:78]
  wire  array_2_3_io_prop_out; // @[Array.scala 58:78]
  wire  array_3_0_clock; // @[Array.scala 58:78]
  wire  array_3_0_io_A_in_zero; // @[Array.scala 58:78]
  wire  array_3_0_io_A_in_nan; // @[Array.scala 58:78]
  wire  array_3_0_io_A_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_3_0_io_A_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_3_0_io_A_in_fraction; // @[Array.scala 58:78]
  wire  array_3_0_io_B_in_zero; // @[Array.scala 58:78]
  wire  array_3_0_io_B_in_nan; // @[Array.scala 58:78]
  wire  array_3_0_io_B_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_3_0_io_B_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_3_0_io_B_in_fraction; // @[Array.scala 58:78]
  wire  array_3_0_io_C_in_zero; // @[Array.scala 58:78]
  wire  array_3_0_io_C_in_nan; // @[Array.scala 58:78]
  wire [128:0] array_3_0_io_C_in_number; // @[Array.scala 58:78]
  wire  array_3_0_io_prop_in; // @[Array.scala 58:78]
  wire  array_3_0_io_A_out_zero; // @[Array.scala 58:78]
  wire  array_3_0_io_A_out_nan; // @[Array.scala 58:78]
  wire  array_3_0_io_A_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_3_0_io_A_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_3_0_io_A_out_fraction; // @[Array.scala 58:78]
  wire  array_3_0_io_B_out_zero; // @[Array.scala 58:78]
  wire  array_3_0_io_B_out_nan; // @[Array.scala 58:78]
  wire  array_3_0_io_B_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_3_0_io_B_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_3_0_io_B_out_fraction; // @[Array.scala 58:78]
  wire  array_3_0_io_C_out_zero; // @[Array.scala 58:78]
  wire  array_3_0_io_C_out_nan; // @[Array.scala 58:78]
  wire [128:0] array_3_0_io_C_out_number; // @[Array.scala 58:78]
  wire  array_3_0_io_prop_out; // @[Array.scala 58:78]
  wire  array_3_1_clock; // @[Array.scala 58:78]
  wire  array_3_1_io_A_in_zero; // @[Array.scala 58:78]
  wire  array_3_1_io_A_in_nan; // @[Array.scala 58:78]
  wire  array_3_1_io_A_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_3_1_io_A_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_3_1_io_A_in_fraction; // @[Array.scala 58:78]
  wire  array_3_1_io_B_in_zero; // @[Array.scala 58:78]
  wire  array_3_1_io_B_in_nan; // @[Array.scala 58:78]
  wire  array_3_1_io_B_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_3_1_io_B_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_3_1_io_B_in_fraction; // @[Array.scala 58:78]
  wire  array_3_1_io_C_in_zero; // @[Array.scala 58:78]
  wire  array_3_1_io_C_in_nan; // @[Array.scala 58:78]
  wire [128:0] array_3_1_io_C_in_number; // @[Array.scala 58:78]
  wire  array_3_1_io_prop_in; // @[Array.scala 58:78]
  wire  array_3_1_io_A_out_zero; // @[Array.scala 58:78]
  wire  array_3_1_io_A_out_nan; // @[Array.scala 58:78]
  wire  array_3_1_io_A_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_3_1_io_A_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_3_1_io_A_out_fraction; // @[Array.scala 58:78]
  wire  array_3_1_io_B_out_zero; // @[Array.scala 58:78]
  wire  array_3_1_io_B_out_nan; // @[Array.scala 58:78]
  wire  array_3_1_io_B_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_3_1_io_B_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_3_1_io_B_out_fraction; // @[Array.scala 58:78]
  wire  array_3_1_io_C_out_zero; // @[Array.scala 58:78]
  wire  array_3_1_io_C_out_nan; // @[Array.scala 58:78]
  wire [128:0] array_3_1_io_C_out_number; // @[Array.scala 58:78]
  wire  array_3_1_io_prop_out; // @[Array.scala 58:78]
  wire  array_3_2_clock; // @[Array.scala 58:78]
  wire  array_3_2_io_A_in_zero; // @[Array.scala 58:78]
  wire  array_3_2_io_A_in_nan; // @[Array.scala 58:78]
  wire  array_3_2_io_A_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_3_2_io_A_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_3_2_io_A_in_fraction; // @[Array.scala 58:78]
  wire  array_3_2_io_B_in_zero; // @[Array.scala 58:78]
  wire  array_3_2_io_B_in_nan; // @[Array.scala 58:78]
  wire  array_3_2_io_B_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_3_2_io_B_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_3_2_io_B_in_fraction; // @[Array.scala 58:78]
  wire  array_3_2_io_C_in_zero; // @[Array.scala 58:78]
  wire  array_3_2_io_C_in_nan; // @[Array.scala 58:78]
  wire [128:0] array_3_2_io_C_in_number; // @[Array.scala 58:78]
  wire  array_3_2_io_prop_in; // @[Array.scala 58:78]
  wire  array_3_2_io_A_out_zero; // @[Array.scala 58:78]
  wire  array_3_2_io_A_out_nan; // @[Array.scala 58:78]
  wire  array_3_2_io_A_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_3_2_io_A_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_3_2_io_A_out_fraction; // @[Array.scala 58:78]
  wire  array_3_2_io_B_out_zero; // @[Array.scala 58:78]
  wire  array_3_2_io_B_out_nan; // @[Array.scala 58:78]
  wire  array_3_2_io_B_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_3_2_io_B_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_3_2_io_B_out_fraction; // @[Array.scala 58:78]
  wire  array_3_2_io_C_out_zero; // @[Array.scala 58:78]
  wire  array_3_2_io_C_out_nan; // @[Array.scala 58:78]
  wire [128:0] array_3_2_io_C_out_number; // @[Array.scala 58:78]
  wire  array_3_2_io_prop_out; // @[Array.scala 58:78]
  wire  array_3_3_clock; // @[Array.scala 58:78]
  wire  array_3_3_io_A_in_zero; // @[Array.scala 58:78]
  wire  array_3_3_io_A_in_nan; // @[Array.scala 58:78]
  wire  array_3_3_io_A_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_3_3_io_A_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_3_3_io_A_in_fraction; // @[Array.scala 58:78]
  wire  array_3_3_io_B_in_zero; // @[Array.scala 58:78]
  wire  array_3_3_io_B_in_nan; // @[Array.scala 58:78]
  wire  array_3_3_io_B_in_sign; // @[Array.scala 58:78]
  wire [5:0] array_3_3_io_B_in_exponent; // @[Array.scala 58:78]
  wire [12:0] array_3_3_io_B_in_fraction; // @[Array.scala 58:78]
  wire  array_3_3_io_C_in_zero; // @[Array.scala 58:78]
  wire  array_3_3_io_C_in_nan; // @[Array.scala 58:78]
  wire [128:0] array_3_3_io_C_in_number; // @[Array.scala 58:78]
  wire  array_3_3_io_prop_in; // @[Array.scala 58:78]
  wire  array_3_3_io_A_out_zero; // @[Array.scala 58:78]
  wire  array_3_3_io_A_out_nan; // @[Array.scala 58:78]
  wire  array_3_3_io_A_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_3_3_io_A_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_3_3_io_A_out_fraction; // @[Array.scala 58:78]
  wire  array_3_3_io_B_out_zero; // @[Array.scala 58:78]
  wire  array_3_3_io_B_out_nan; // @[Array.scala 58:78]
  wire  array_3_3_io_B_out_sign; // @[Array.scala 58:78]
  wire [5:0] array_3_3_io_B_out_exponent; // @[Array.scala 58:78]
  wire [12:0] array_3_3_io_B_out_fraction; // @[Array.scala 58:78]
  wire  array_3_3_io_C_out_zero; // @[Array.scala 58:78]
  wire  array_3_3_io_C_out_nan; // @[Array.scala 58:78]
  wire [128:0] array_3_3_io_C_out_number; // @[Array.scala 58:78]
  wire  array_3_3_io_prop_out; // @[Array.scala 58:78]
  wire [15:0] A_convert_0_io_in; // @[Array.scala 61:76]
  wire  A_convert_0_io_out_zero; // @[Array.scala 61:76]
  wire  A_convert_0_io_out_nan; // @[Array.scala 61:76]
  wire  A_convert_0_io_out_sign; // @[Array.scala 61:76]
  wire [5:0] A_convert_0_io_out_exponent; // @[Array.scala 61:76]
  wire [12:0] A_convert_0_io_out_fraction; // @[Array.scala 61:76]
  wire [15:0] A_convert_1_io_in; // @[Array.scala 61:76]
  wire  A_convert_1_io_out_zero; // @[Array.scala 61:76]
  wire  A_convert_1_io_out_nan; // @[Array.scala 61:76]
  wire  A_convert_1_io_out_sign; // @[Array.scala 61:76]
  wire [5:0] A_convert_1_io_out_exponent; // @[Array.scala 61:76]
  wire [12:0] A_convert_1_io_out_fraction; // @[Array.scala 61:76]
  wire [15:0] A_convert_2_io_in; // @[Array.scala 61:76]
  wire  A_convert_2_io_out_zero; // @[Array.scala 61:76]
  wire  A_convert_2_io_out_nan; // @[Array.scala 61:76]
  wire  A_convert_2_io_out_sign; // @[Array.scala 61:76]
  wire [5:0] A_convert_2_io_out_exponent; // @[Array.scala 61:76]
  wire [12:0] A_convert_2_io_out_fraction; // @[Array.scala 61:76]
  wire [15:0] A_convert_3_io_in; // @[Array.scala 61:76]
  wire  A_convert_3_io_out_zero; // @[Array.scala 61:76]
  wire  A_convert_3_io_out_nan; // @[Array.scala 61:76]
  wire  A_convert_3_io_out_sign; // @[Array.scala 61:76]
  wire [5:0] A_convert_3_io_out_exponent; // @[Array.scala 61:76]
  wire [12:0] A_convert_3_io_out_fraction; // @[Array.scala 61:76]
  wire [15:0] B_convert_0_io_in; // @[Array.scala 62:76]
  wire  B_convert_0_io_out_zero; // @[Array.scala 62:76]
  wire  B_convert_0_io_out_nan; // @[Array.scala 62:76]
  wire  B_convert_0_io_out_sign; // @[Array.scala 62:76]
  wire [5:0] B_convert_0_io_out_exponent; // @[Array.scala 62:76]
  wire [12:0] B_convert_0_io_out_fraction; // @[Array.scala 62:76]
  wire [15:0] B_convert_1_io_in; // @[Array.scala 62:76]
  wire  B_convert_1_io_out_zero; // @[Array.scala 62:76]
  wire  B_convert_1_io_out_nan; // @[Array.scala 62:76]
  wire  B_convert_1_io_out_sign; // @[Array.scala 62:76]
  wire [5:0] B_convert_1_io_out_exponent; // @[Array.scala 62:76]
  wire [12:0] B_convert_1_io_out_fraction; // @[Array.scala 62:76]
  wire [15:0] B_convert_2_io_in; // @[Array.scala 62:76]
  wire  B_convert_2_io_out_zero; // @[Array.scala 62:76]
  wire  B_convert_2_io_out_nan; // @[Array.scala 62:76]
  wire  B_convert_2_io_out_sign; // @[Array.scala 62:76]
  wire [5:0] B_convert_2_io_out_exponent; // @[Array.scala 62:76]
  wire [12:0] B_convert_2_io_out_fraction; // @[Array.scala 62:76]
  wire [15:0] B_convert_3_io_in; // @[Array.scala 62:76]
  wire  B_convert_3_io_out_zero; // @[Array.scala 62:76]
  wire  B_convert_3_io_out_nan; // @[Array.scala 62:76]
  wire  B_convert_3_io_out_sign; // @[Array.scala 62:76]
  wire [5:0] B_convert_3_io_out_exponent; // @[Array.scala 62:76]
  wire [12:0] B_convert_3_io_out_fraction; // @[Array.scala 62:76]
  linearTile array_0_0 ( // @[Array.scala 58:78]
    .clock(array_0_0_clock),
    .io_A_in_zero(array_0_0_io_A_in_zero),
    .io_A_in_nan(array_0_0_io_A_in_nan),
    .io_A_in_sign(array_0_0_io_A_in_sign),
    .io_A_in_exponent(array_0_0_io_A_in_exponent),
    .io_A_in_fraction(array_0_0_io_A_in_fraction),
    .io_B_in_zero(array_0_0_io_B_in_zero),
    .io_B_in_nan(array_0_0_io_B_in_nan),
    .io_B_in_sign(array_0_0_io_B_in_sign),
    .io_B_in_exponent(array_0_0_io_B_in_exponent),
    .io_B_in_fraction(array_0_0_io_B_in_fraction),
    .io_C_in_zero(array_0_0_io_C_in_zero),
    .io_C_in_nan(array_0_0_io_C_in_nan),
    .io_C_in_number(array_0_0_io_C_in_number),
    .io_prop_in(array_0_0_io_prop_in),
    .io_A_out_zero(array_0_0_io_A_out_zero),
    .io_A_out_nan(array_0_0_io_A_out_nan),
    .io_A_out_sign(array_0_0_io_A_out_sign),
    .io_A_out_exponent(array_0_0_io_A_out_exponent),
    .io_A_out_fraction(array_0_0_io_A_out_fraction),
    .io_B_out_zero(array_0_0_io_B_out_zero),
    .io_B_out_nan(array_0_0_io_B_out_nan),
    .io_B_out_sign(array_0_0_io_B_out_sign),
    .io_B_out_exponent(array_0_0_io_B_out_exponent),
    .io_B_out_fraction(array_0_0_io_B_out_fraction),
    .io_C_out_zero(array_0_0_io_C_out_zero),
    .io_C_out_nan(array_0_0_io_C_out_nan),
    .io_C_out_number(array_0_0_io_C_out_number),
    .io_prop_out(array_0_0_io_prop_out)
  );
  linearTile array_0_1 ( // @[Array.scala 58:78]
    .clock(array_0_1_clock),
    .io_A_in_zero(array_0_1_io_A_in_zero),
    .io_A_in_nan(array_0_1_io_A_in_nan),
    .io_A_in_sign(array_0_1_io_A_in_sign),
    .io_A_in_exponent(array_0_1_io_A_in_exponent),
    .io_A_in_fraction(array_0_1_io_A_in_fraction),
    .io_B_in_zero(array_0_1_io_B_in_zero),
    .io_B_in_nan(array_0_1_io_B_in_nan),
    .io_B_in_sign(array_0_1_io_B_in_sign),
    .io_B_in_exponent(array_0_1_io_B_in_exponent),
    .io_B_in_fraction(array_0_1_io_B_in_fraction),
    .io_C_in_zero(array_0_1_io_C_in_zero),
    .io_C_in_nan(array_0_1_io_C_in_nan),
    .io_C_in_number(array_0_1_io_C_in_number),
    .io_prop_in(array_0_1_io_prop_in),
    .io_A_out_zero(array_0_1_io_A_out_zero),
    .io_A_out_nan(array_0_1_io_A_out_nan),
    .io_A_out_sign(array_0_1_io_A_out_sign),
    .io_A_out_exponent(array_0_1_io_A_out_exponent),
    .io_A_out_fraction(array_0_1_io_A_out_fraction),
    .io_B_out_zero(array_0_1_io_B_out_zero),
    .io_B_out_nan(array_0_1_io_B_out_nan),
    .io_B_out_sign(array_0_1_io_B_out_sign),
    .io_B_out_exponent(array_0_1_io_B_out_exponent),
    .io_B_out_fraction(array_0_1_io_B_out_fraction),
    .io_C_out_zero(array_0_1_io_C_out_zero),
    .io_C_out_nan(array_0_1_io_C_out_nan),
    .io_C_out_number(array_0_1_io_C_out_number),
    .io_prop_out(array_0_1_io_prop_out)
  );
  linearTile array_0_2 ( // @[Array.scala 58:78]
    .clock(array_0_2_clock),
    .io_A_in_zero(array_0_2_io_A_in_zero),
    .io_A_in_nan(array_0_2_io_A_in_nan),
    .io_A_in_sign(array_0_2_io_A_in_sign),
    .io_A_in_exponent(array_0_2_io_A_in_exponent),
    .io_A_in_fraction(array_0_2_io_A_in_fraction),
    .io_B_in_zero(array_0_2_io_B_in_zero),
    .io_B_in_nan(array_0_2_io_B_in_nan),
    .io_B_in_sign(array_0_2_io_B_in_sign),
    .io_B_in_exponent(array_0_2_io_B_in_exponent),
    .io_B_in_fraction(array_0_2_io_B_in_fraction),
    .io_C_in_zero(array_0_2_io_C_in_zero),
    .io_C_in_nan(array_0_2_io_C_in_nan),
    .io_C_in_number(array_0_2_io_C_in_number),
    .io_prop_in(array_0_2_io_prop_in),
    .io_A_out_zero(array_0_2_io_A_out_zero),
    .io_A_out_nan(array_0_2_io_A_out_nan),
    .io_A_out_sign(array_0_2_io_A_out_sign),
    .io_A_out_exponent(array_0_2_io_A_out_exponent),
    .io_A_out_fraction(array_0_2_io_A_out_fraction),
    .io_B_out_zero(array_0_2_io_B_out_zero),
    .io_B_out_nan(array_0_2_io_B_out_nan),
    .io_B_out_sign(array_0_2_io_B_out_sign),
    .io_B_out_exponent(array_0_2_io_B_out_exponent),
    .io_B_out_fraction(array_0_2_io_B_out_fraction),
    .io_C_out_zero(array_0_2_io_C_out_zero),
    .io_C_out_nan(array_0_2_io_C_out_nan),
    .io_C_out_number(array_0_2_io_C_out_number),
    .io_prop_out(array_0_2_io_prop_out)
  );
  linearTile array_0_3 ( // @[Array.scala 58:78]
    .clock(array_0_3_clock),
    .io_A_in_zero(array_0_3_io_A_in_zero),
    .io_A_in_nan(array_0_3_io_A_in_nan),
    .io_A_in_sign(array_0_3_io_A_in_sign),
    .io_A_in_exponent(array_0_3_io_A_in_exponent),
    .io_A_in_fraction(array_0_3_io_A_in_fraction),
    .io_B_in_zero(array_0_3_io_B_in_zero),
    .io_B_in_nan(array_0_3_io_B_in_nan),
    .io_B_in_sign(array_0_3_io_B_in_sign),
    .io_B_in_exponent(array_0_3_io_B_in_exponent),
    .io_B_in_fraction(array_0_3_io_B_in_fraction),
    .io_C_in_zero(array_0_3_io_C_in_zero),
    .io_C_in_nan(array_0_3_io_C_in_nan),
    .io_C_in_number(array_0_3_io_C_in_number),
    .io_prop_in(array_0_3_io_prop_in),
    .io_A_out_zero(array_0_3_io_A_out_zero),
    .io_A_out_nan(array_0_3_io_A_out_nan),
    .io_A_out_sign(array_0_3_io_A_out_sign),
    .io_A_out_exponent(array_0_3_io_A_out_exponent),
    .io_A_out_fraction(array_0_3_io_A_out_fraction),
    .io_B_out_zero(array_0_3_io_B_out_zero),
    .io_B_out_nan(array_0_3_io_B_out_nan),
    .io_B_out_sign(array_0_3_io_B_out_sign),
    .io_B_out_exponent(array_0_3_io_B_out_exponent),
    .io_B_out_fraction(array_0_3_io_B_out_fraction),
    .io_C_out_zero(array_0_3_io_C_out_zero),
    .io_C_out_nan(array_0_3_io_C_out_nan),
    .io_C_out_number(array_0_3_io_C_out_number),
    .io_prop_out(array_0_3_io_prop_out)
  );
  linearTile array_1_0 ( // @[Array.scala 58:78]
    .clock(array_1_0_clock),
    .io_A_in_zero(array_1_0_io_A_in_zero),
    .io_A_in_nan(array_1_0_io_A_in_nan),
    .io_A_in_sign(array_1_0_io_A_in_sign),
    .io_A_in_exponent(array_1_0_io_A_in_exponent),
    .io_A_in_fraction(array_1_0_io_A_in_fraction),
    .io_B_in_zero(array_1_0_io_B_in_zero),
    .io_B_in_nan(array_1_0_io_B_in_nan),
    .io_B_in_sign(array_1_0_io_B_in_sign),
    .io_B_in_exponent(array_1_0_io_B_in_exponent),
    .io_B_in_fraction(array_1_0_io_B_in_fraction),
    .io_C_in_zero(array_1_0_io_C_in_zero),
    .io_C_in_nan(array_1_0_io_C_in_nan),
    .io_C_in_number(array_1_0_io_C_in_number),
    .io_prop_in(array_1_0_io_prop_in),
    .io_A_out_zero(array_1_0_io_A_out_zero),
    .io_A_out_nan(array_1_0_io_A_out_nan),
    .io_A_out_sign(array_1_0_io_A_out_sign),
    .io_A_out_exponent(array_1_0_io_A_out_exponent),
    .io_A_out_fraction(array_1_0_io_A_out_fraction),
    .io_B_out_zero(array_1_0_io_B_out_zero),
    .io_B_out_nan(array_1_0_io_B_out_nan),
    .io_B_out_sign(array_1_0_io_B_out_sign),
    .io_B_out_exponent(array_1_0_io_B_out_exponent),
    .io_B_out_fraction(array_1_0_io_B_out_fraction),
    .io_C_out_zero(array_1_0_io_C_out_zero),
    .io_C_out_nan(array_1_0_io_C_out_nan),
    .io_C_out_number(array_1_0_io_C_out_number),
    .io_prop_out(array_1_0_io_prop_out)
  );
  linearTile array_1_1 ( // @[Array.scala 58:78]
    .clock(array_1_1_clock),
    .io_A_in_zero(array_1_1_io_A_in_zero),
    .io_A_in_nan(array_1_1_io_A_in_nan),
    .io_A_in_sign(array_1_1_io_A_in_sign),
    .io_A_in_exponent(array_1_1_io_A_in_exponent),
    .io_A_in_fraction(array_1_1_io_A_in_fraction),
    .io_B_in_zero(array_1_1_io_B_in_zero),
    .io_B_in_nan(array_1_1_io_B_in_nan),
    .io_B_in_sign(array_1_1_io_B_in_sign),
    .io_B_in_exponent(array_1_1_io_B_in_exponent),
    .io_B_in_fraction(array_1_1_io_B_in_fraction),
    .io_C_in_zero(array_1_1_io_C_in_zero),
    .io_C_in_nan(array_1_1_io_C_in_nan),
    .io_C_in_number(array_1_1_io_C_in_number),
    .io_prop_in(array_1_1_io_prop_in),
    .io_A_out_zero(array_1_1_io_A_out_zero),
    .io_A_out_nan(array_1_1_io_A_out_nan),
    .io_A_out_sign(array_1_1_io_A_out_sign),
    .io_A_out_exponent(array_1_1_io_A_out_exponent),
    .io_A_out_fraction(array_1_1_io_A_out_fraction),
    .io_B_out_zero(array_1_1_io_B_out_zero),
    .io_B_out_nan(array_1_1_io_B_out_nan),
    .io_B_out_sign(array_1_1_io_B_out_sign),
    .io_B_out_exponent(array_1_1_io_B_out_exponent),
    .io_B_out_fraction(array_1_1_io_B_out_fraction),
    .io_C_out_zero(array_1_1_io_C_out_zero),
    .io_C_out_nan(array_1_1_io_C_out_nan),
    .io_C_out_number(array_1_1_io_C_out_number),
    .io_prop_out(array_1_1_io_prop_out)
  );
  linearTile array_1_2 ( // @[Array.scala 58:78]
    .clock(array_1_2_clock),
    .io_A_in_zero(array_1_2_io_A_in_zero),
    .io_A_in_nan(array_1_2_io_A_in_nan),
    .io_A_in_sign(array_1_2_io_A_in_sign),
    .io_A_in_exponent(array_1_2_io_A_in_exponent),
    .io_A_in_fraction(array_1_2_io_A_in_fraction),
    .io_B_in_zero(array_1_2_io_B_in_zero),
    .io_B_in_nan(array_1_2_io_B_in_nan),
    .io_B_in_sign(array_1_2_io_B_in_sign),
    .io_B_in_exponent(array_1_2_io_B_in_exponent),
    .io_B_in_fraction(array_1_2_io_B_in_fraction),
    .io_C_in_zero(array_1_2_io_C_in_zero),
    .io_C_in_nan(array_1_2_io_C_in_nan),
    .io_C_in_number(array_1_2_io_C_in_number),
    .io_prop_in(array_1_2_io_prop_in),
    .io_A_out_zero(array_1_2_io_A_out_zero),
    .io_A_out_nan(array_1_2_io_A_out_nan),
    .io_A_out_sign(array_1_2_io_A_out_sign),
    .io_A_out_exponent(array_1_2_io_A_out_exponent),
    .io_A_out_fraction(array_1_2_io_A_out_fraction),
    .io_B_out_zero(array_1_2_io_B_out_zero),
    .io_B_out_nan(array_1_2_io_B_out_nan),
    .io_B_out_sign(array_1_2_io_B_out_sign),
    .io_B_out_exponent(array_1_2_io_B_out_exponent),
    .io_B_out_fraction(array_1_2_io_B_out_fraction),
    .io_C_out_zero(array_1_2_io_C_out_zero),
    .io_C_out_nan(array_1_2_io_C_out_nan),
    .io_C_out_number(array_1_2_io_C_out_number),
    .io_prop_out(array_1_2_io_prop_out)
  );
  linearTile array_1_3 ( // @[Array.scala 58:78]
    .clock(array_1_3_clock),
    .io_A_in_zero(array_1_3_io_A_in_zero),
    .io_A_in_nan(array_1_3_io_A_in_nan),
    .io_A_in_sign(array_1_3_io_A_in_sign),
    .io_A_in_exponent(array_1_3_io_A_in_exponent),
    .io_A_in_fraction(array_1_3_io_A_in_fraction),
    .io_B_in_zero(array_1_3_io_B_in_zero),
    .io_B_in_nan(array_1_3_io_B_in_nan),
    .io_B_in_sign(array_1_3_io_B_in_sign),
    .io_B_in_exponent(array_1_3_io_B_in_exponent),
    .io_B_in_fraction(array_1_3_io_B_in_fraction),
    .io_C_in_zero(array_1_3_io_C_in_zero),
    .io_C_in_nan(array_1_3_io_C_in_nan),
    .io_C_in_number(array_1_3_io_C_in_number),
    .io_prop_in(array_1_3_io_prop_in),
    .io_A_out_zero(array_1_3_io_A_out_zero),
    .io_A_out_nan(array_1_3_io_A_out_nan),
    .io_A_out_sign(array_1_3_io_A_out_sign),
    .io_A_out_exponent(array_1_3_io_A_out_exponent),
    .io_A_out_fraction(array_1_3_io_A_out_fraction),
    .io_B_out_zero(array_1_3_io_B_out_zero),
    .io_B_out_nan(array_1_3_io_B_out_nan),
    .io_B_out_sign(array_1_3_io_B_out_sign),
    .io_B_out_exponent(array_1_3_io_B_out_exponent),
    .io_B_out_fraction(array_1_3_io_B_out_fraction),
    .io_C_out_zero(array_1_3_io_C_out_zero),
    .io_C_out_nan(array_1_3_io_C_out_nan),
    .io_C_out_number(array_1_3_io_C_out_number),
    .io_prop_out(array_1_3_io_prop_out)
  );
  linearTile array_2_0 ( // @[Array.scala 58:78]
    .clock(array_2_0_clock),
    .io_A_in_zero(array_2_0_io_A_in_zero),
    .io_A_in_nan(array_2_0_io_A_in_nan),
    .io_A_in_sign(array_2_0_io_A_in_sign),
    .io_A_in_exponent(array_2_0_io_A_in_exponent),
    .io_A_in_fraction(array_2_0_io_A_in_fraction),
    .io_B_in_zero(array_2_0_io_B_in_zero),
    .io_B_in_nan(array_2_0_io_B_in_nan),
    .io_B_in_sign(array_2_0_io_B_in_sign),
    .io_B_in_exponent(array_2_0_io_B_in_exponent),
    .io_B_in_fraction(array_2_0_io_B_in_fraction),
    .io_C_in_zero(array_2_0_io_C_in_zero),
    .io_C_in_nan(array_2_0_io_C_in_nan),
    .io_C_in_number(array_2_0_io_C_in_number),
    .io_prop_in(array_2_0_io_prop_in),
    .io_A_out_zero(array_2_0_io_A_out_zero),
    .io_A_out_nan(array_2_0_io_A_out_nan),
    .io_A_out_sign(array_2_0_io_A_out_sign),
    .io_A_out_exponent(array_2_0_io_A_out_exponent),
    .io_A_out_fraction(array_2_0_io_A_out_fraction),
    .io_B_out_zero(array_2_0_io_B_out_zero),
    .io_B_out_nan(array_2_0_io_B_out_nan),
    .io_B_out_sign(array_2_0_io_B_out_sign),
    .io_B_out_exponent(array_2_0_io_B_out_exponent),
    .io_B_out_fraction(array_2_0_io_B_out_fraction),
    .io_C_out_zero(array_2_0_io_C_out_zero),
    .io_C_out_nan(array_2_0_io_C_out_nan),
    .io_C_out_number(array_2_0_io_C_out_number),
    .io_prop_out(array_2_0_io_prop_out)
  );
  linearTile array_2_1 ( // @[Array.scala 58:78]
    .clock(array_2_1_clock),
    .io_A_in_zero(array_2_1_io_A_in_zero),
    .io_A_in_nan(array_2_1_io_A_in_nan),
    .io_A_in_sign(array_2_1_io_A_in_sign),
    .io_A_in_exponent(array_2_1_io_A_in_exponent),
    .io_A_in_fraction(array_2_1_io_A_in_fraction),
    .io_B_in_zero(array_2_1_io_B_in_zero),
    .io_B_in_nan(array_2_1_io_B_in_nan),
    .io_B_in_sign(array_2_1_io_B_in_sign),
    .io_B_in_exponent(array_2_1_io_B_in_exponent),
    .io_B_in_fraction(array_2_1_io_B_in_fraction),
    .io_C_in_zero(array_2_1_io_C_in_zero),
    .io_C_in_nan(array_2_1_io_C_in_nan),
    .io_C_in_number(array_2_1_io_C_in_number),
    .io_prop_in(array_2_1_io_prop_in),
    .io_A_out_zero(array_2_1_io_A_out_zero),
    .io_A_out_nan(array_2_1_io_A_out_nan),
    .io_A_out_sign(array_2_1_io_A_out_sign),
    .io_A_out_exponent(array_2_1_io_A_out_exponent),
    .io_A_out_fraction(array_2_1_io_A_out_fraction),
    .io_B_out_zero(array_2_1_io_B_out_zero),
    .io_B_out_nan(array_2_1_io_B_out_nan),
    .io_B_out_sign(array_2_1_io_B_out_sign),
    .io_B_out_exponent(array_2_1_io_B_out_exponent),
    .io_B_out_fraction(array_2_1_io_B_out_fraction),
    .io_C_out_zero(array_2_1_io_C_out_zero),
    .io_C_out_nan(array_2_1_io_C_out_nan),
    .io_C_out_number(array_2_1_io_C_out_number),
    .io_prop_out(array_2_1_io_prop_out)
  );
  linearTile array_2_2 ( // @[Array.scala 58:78]
    .clock(array_2_2_clock),
    .io_A_in_zero(array_2_2_io_A_in_zero),
    .io_A_in_nan(array_2_2_io_A_in_nan),
    .io_A_in_sign(array_2_2_io_A_in_sign),
    .io_A_in_exponent(array_2_2_io_A_in_exponent),
    .io_A_in_fraction(array_2_2_io_A_in_fraction),
    .io_B_in_zero(array_2_2_io_B_in_zero),
    .io_B_in_nan(array_2_2_io_B_in_nan),
    .io_B_in_sign(array_2_2_io_B_in_sign),
    .io_B_in_exponent(array_2_2_io_B_in_exponent),
    .io_B_in_fraction(array_2_2_io_B_in_fraction),
    .io_C_in_zero(array_2_2_io_C_in_zero),
    .io_C_in_nan(array_2_2_io_C_in_nan),
    .io_C_in_number(array_2_2_io_C_in_number),
    .io_prop_in(array_2_2_io_prop_in),
    .io_A_out_zero(array_2_2_io_A_out_zero),
    .io_A_out_nan(array_2_2_io_A_out_nan),
    .io_A_out_sign(array_2_2_io_A_out_sign),
    .io_A_out_exponent(array_2_2_io_A_out_exponent),
    .io_A_out_fraction(array_2_2_io_A_out_fraction),
    .io_B_out_zero(array_2_2_io_B_out_zero),
    .io_B_out_nan(array_2_2_io_B_out_nan),
    .io_B_out_sign(array_2_2_io_B_out_sign),
    .io_B_out_exponent(array_2_2_io_B_out_exponent),
    .io_B_out_fraction(array_2_2_io_B_out_fraction),
    .io_C_out_zero(array_2_2_io_C_out_zero),
    .io_C_out_nan(array_2_2_io_C_out_nan),
    .io_C_out_number(array_2_2_io_C_out_number),
    .io_prop_out(array_2_2_io_prop_out)
  );
  linearTile array_2_3 ( // @[Array.scala 58:78]
    .clock(array_2_3_clock),
    .io_A_in_zero(array_2_3_io_A_in_zero),
    .io_A_in_nan(array_2_3_io_A_in_nan),
    .io_A_in_sign(array_2_3_io_A_in_sign),
    .io_A_in_exponent(array_2_3_io_A_in_exponent),
    .io_A_in_fraction(array_2_3_io_A_in_fraction),
    .io_B_in_zero(array_2_3_io_B_in_zero),
    .io_B_in_nan(array_2_3_io_B_in_nan),
    .io_B_in_sign(array_2_3_io_B_in_sign),
    .io_B_in_exponent(array_2_3_io_B_in_exponent),
    .io_B_in_fraction(array_2_3_io_B_in_fraction),
    .io_C_in_zero(array_2_3_io_C_in_zero),
    .io_C_in_nan(array_2_3_io_C_in_nan),
    .io_C_in_number(array_2_3_io_C_in_number),
    .io_prop_in(array_2_3_io_prop_in),
    .io_A_out_zero(array_2_3_io_A_out_zero),
    .io_A_out_nan(array_2_3_io_A_out_nan),
    .io_A_out_sign(array_2_3_io_A_out_sign),
    .io_A_out_exponent(array_2_3_io_A_out_exponent),
    .io_A_out_fraction(array_2_3_io_A_out_fraction),
    .io_B_out_zero(array_2_3_io_B_out_zero),
    .io_B_out_nan(array_2_3_io_B_out_nan),
    .io_B_out_sign(array_2_3_io_B_out_sign),
    .io_B_out_exponent(array_2_3_io_B_out_exponent),
    .io_B_out_fraction(array_2_3_io_B_out_fraction),
    .io_C_out_zero(array_2_3_io_C_out_zero),
    .io_C_out_nan(array_2_3_io_C_out_nan),
    .io_C_out_number(array_2_3_io_C_out_number),
    .io_prop_out(array_2_3_io_prop_out)
  );
  linearTile array_3_0 ( // @[Array.scala 58:78]
    .clock(array_3_0_clock),
    .io_A_in_zero(array_3_0_io_A_in_zero),
    .io_A_in_nan(array_3_0_io_A_in_nan),
    .io_A_in_sign(array_3_0_io_A_in_sign),
    .io_A_in_exponent(array_3_0_io_A_in_exponent),
    .io_A_in_fraction(array_3_0_io_A_in_fraction),
    .io_B_in_zero(array_3_0_io_B_in_zero),
    .io_B_in_nan(array_3_0_io_B_in_nan),
    .io_B_in_sign(array_3_0_io_B_in_sign),
    .io_B_in_exponent(array_3_0_io_B_in_exponent),
    .io_B_in_fraction(array_3_0_io_B_in_fraction),
    .io_C_in_zero(array_3_0_io_C_in_zero),
    .io_C_in_nan(array_3_0_io_C_in_nan),
    .io_C_in_number(array_3_0_io_C_in_number),
    .io_prop_in(array_3_0_io_prop_in),
    .io_A_out_zero(array_3_0_io_A_out_zero),
    .io_A_out_nan(array_3_0_io_A_out_nan),
    .io_A_out_sign(array_3_0_io_A_out_sign),
    .io_A_out_exponent(array_3_0_io_A_out_exponent),
    .io_A_out_fraction(array_3_0_io_A_out_fraction),
    .io_B_out_zero(array_3_0_io_B_out_zero),
    .io_B_out_nan(array_3_0_io_B_out_nan),
    .io_B_out_sign(array_3_0_io_B_out_sign),
    .io_B_out_exponent(array_3_0_io_B_out_exponent),
    .io_B_out_fraction(array_3_0_io_B_out_fraction),
    .io_C_out_zero(array_3_0_io_C_out_zero),
    .io_C_out_nan(array_3_0_io_C_out_nan),
    .io_C_out_number(array_3_0_io_C_out_number),
    .io_prop_out(array_3_0_io_prop_out)
  );
  linearTile array_3_1 ( // @[Array.scala 58:78]
    .clock(array_3_1_clock),
    .io_A_in_zero(array_3_1_io_A_in_zero),
    .io_A_in_nan(array_3_1_io_A_in_nan),
    .io_A_in_sign(array_3_1_io_A_in_sign),
    .io_A_in_exponent(array_3_1_io_A_in_exponent),
    .io_A_in_fraction(array_3_1_io_A_in_fraction),
    .io_B_in_zero(array_3_1_io_B_in_zero),
    .io_B_in_nan(array_3_1_io_B_in_nan),
    .io_B_in_sign(array_3_1_io_B_in_sign),
    .io_B_in_exponent(array_3_1_io_B_in_exponent),
    .io_B_in_fraction(array_3_1_io_B_in_fraction),
    .io_C_in_zero(array_3_1_io_C_in_zero),
    .io_C_in_nan(array_3_1_io_C_in_nan),
    .io_C_in_number(array_3_1_io_C_in_number),
    .io_prop_in(array_3_1_io_prop_in),
    .io_A_out_zero(array_3_1_io_A_out_zero),
    .io_A_out_nan(array_3_1_io_A_out_nan),
    .io_A_out_sign(array_3_1_io_A_out_sign),
    .io_A_out_exponent(array_3_1_io_A_out_exponent),
    .io_A_out_fraction(array_3_1_io_A_out_fraction),
    .io_B_out_zero(array_3_1_io_B_out_zero),
    .io_B_out_nan(array_3_1_io_B_out_nan),
    .io_B_out_sign(array_3_1_io_B_out_sign),
    .io_B_out_exponent(array_3_1_io_B_out_exponent),
    .io_B_out_fraction(array_3_1_io_B_out_fraction),
    .io_C_out_zero(array_3_1_io_C_out_zero),
    .io_C_out_nan(array_3_1_io_C_out_nan),
    .io_C_out_number(array_3_1_io_C_out_number),
    .io_prop_out(array_3_1_io_prop_out)
  );
  linearTile array_3_2 ( // @[Array.scala 58:78]
    .clock(array_3_2_clock),
    .io_A_in_zero(array_3_2_io_A_in_zero),
    .io_A_in_nan(array_3_2_io_A_in_nan),
    .io_A_in_sign(array_3_2_io_A_in_sign),
    .io_A_in_exponent(array_3_2_io_A_in_exponent),
    .io_A_in_fraction(array_3_2_io_A_in_fraction),
    .io_B_in_zero(array_3_2_io_B_in_zero),
    .io_B_in_nan(array_3_2_io_B_in_nan),
    .io_B_in_sign(array_3_2_io_B_in_sign),
    .io_B_in_exponent(array_3_2_io_B_in_exponent),
    .io_B_in_fraction(array_3_2_io_B_in_fraction),
    .io_C_in_zero(array_3_2_io_C_in_zero),
    .io_C_in_nan(array_3_2_io_C_in_nan),
    .io_C_in_number(array_3_2_io_C_in_number),
    .io_prop_in(array_3_2_io_prop_in),
    .io_A_out_zero(array_3_2_io_A_out_zero),
    .io_A_out_nan(array_3_2_io_A_out_nan),
    .io_A_out_sign(array_3_2_io_A_out_sign),
    .io_A_out_exponent(array_3_2_io_A_out_exponent),
    .io_A_out_fraction(array_3_2_io_A_out_fraction),
    .io_B_out_zero(array_3_2_io_B_out_zero),
    .io_B_out_nan(array_3_2_io_B_out_nan),
    .io_B_out_sign(array_3_2_io_B_out_sign),
    .io_B_out_exponent(array_3_2_io_B_out_exponent),
    .io_B_out_fraction(array_3_2_io_B_out_fraction),
    .io_C_out_zero(array_3_2_io_C_out_zero),
    .io_C_out_nan(array_3_2_io_C_out_nan),
    .io_C_out_number(array_3_2_io_C_out_number),
    .io_prop_out(array_3_2_io_prop_out)
  );
  linearTile array_3_3 ( // @[Array.scala 58:78]
    .clock(array_3_3_clock),
    .io_A_in_zero(array_3_3_io_A_in_zero),
    .io_A_in_nan(array_3_3_io_A_in_nan),
    .io_A_in_sign(array_3_3_io_A_in_sign),
    .io_A_in_exponent(array_3_3_io_A_in_exponent),
    .io_A_in_fraction(array_3_3_io_A_in_fraction),
    .io_B_in_zero(array_3_3_io_B_in_zero),
    .io_B_in_nan(array_3_3_io_B_in_nan),
    .io_B_in_sign(array_3_3_io_B_in_sign),
    .io_B_in_exponent(array_3_3_io_B_in_exponent),
    .io_B_in_fraction(array_3_3_io_B_in_fraction),
    .io_C_in_zero(array_3_3_io_C_in_zero),
    .io_C_in_nan(array_3_3_io_C_in_nan),
    .io_C_in_number(array_3_3_io_C_in_number),
    .io_prop_in(array_3_3_io_prop_in),
    .io_A_out_zero(array_3_3_io_A_out_zero),
    .io_A_out_nan(array_3_3_io_A_out_nan),
    .io_A_out_sign(array_3_3_io_A_out_sign),
    .io_A_out_exponent(array_3_3_io_A_out_exponent),
    .io_A_out_fraction(array_3_3_io_A_out_fraction),
    .io_B_out_zero(array_3_3_io_B_out_zero),
    .io_B_out_nan(array_3_3_io_B_out_nan),
    .io_B_out_sign(array_3_3_io_B_out_sign),
    .io_B_out_exponent(array_3_3_io_B_out_exponent),
    .io_B_out_fraction(array_3_3_io_B_out_fraction),
    .io_C_out_zero(array_3_3_io_C_out_zero),
    .io_C_out_nan(array_3_3_io_C_out_nan),
    .io_C_out_number(array_3_3_io_C_out_number),
    .io_prop_out(array_3_3_io_prop_out)
  );
  toPositUnpacked A_convert_0 ( // @[Array.scala 61:76]
    .io_in(A_convert_0_io_in),
    .io_out_zero(A_convert_0_io_out_zero),
    .io_out_nan(A_convert_0_io_out_nan),
    .io_out_sign(A_convert_0_io_out_sign),
    .io_out_exponent(A_convert_0_io_out_exponent),
    .io_out_fraction(A_convert_0_io_out_fraction)
  );
  toPositUnpacked A_convert_1 ( // @[Array.scala 61:76]
    .io_in(A_convert_1_io_in),
    .io_out_zero(A_convert_1_io_out_zero),
    .io_out_nan(A_convert_1_io_out_nan),
    .io_out_sign(A_convert_1_io_out_sign),
    .io_out_exponent(A_convert_1_io_out_exponent),
    .io_out_fraction(A_convert_1_io_out_fraction)
  );
  toPositUnpacked A_convert_2 ( // @[Array.scala 61:76]
    .io_in(A_convert_2_io_in),
    .io_out_zero(A_convert_2_io_out_zero),
    .io_out_nan(A_convert_2_io_out_nan),
    .io_out_sign(A_convert_2_io_out_sign),
    .io_out_exponent(A_convert_2_io_out_exponent),
    .io_out_fraction(A_convert_2_io_out_fraction)
  );
  toPositUnpacked A_convert_3 ( // @[Array.scala 61:76]
    .io_in(A_convert_3_io_in),
    .io_out_zero(A_convert_3_io_out_zero),
    .io_out_nan(A_convert_3_io_out_nan),
    .io_out_sign(A_convert_3_io_out_sign),
    .io_out_exponent(A_convert_3_io_out_exponent),
    .io_out_fraction(A_convert_3_io_out_fraction)
  );
  toPositUnpacked B_convert_0 ( // @[Array.scala 62:76]
    .io_in(B_convert_0_io_in),
    .io_out_zero(B_convert_0_io_out_zero),
    .io_out_nan(B_convert_0_io_out_nan),
    .io_out_sign(B_convert_0_io_out_sign),
    .io_out_exponent(B_convert_0_io_out_exponent),
    .io_out_fraction(B_convert_0_io_out_fraction)
  );
  toPositUnpacked B_convert_1 ( // @[Array.scala 62:76]
    .io_in(B_convert_1_io_in),
    .io_out_zero(B_convert_1_io_out_zero),
    .io_out_nan(B_convert_1_io_out_nan),
    .io_out_sign(B_convert_1_io_out_sign),
    .io_out_exponent(B_convert_1_io_out_exponent),
    .io_out_fraction(B_convert_1_io_out_fraction)
  );
  toPositUnpacked B_convert_2 ( // @[Array.scala 62:76]
    .io_in(B_convert_2_io_in),
    .io_out_zero(B_convert_2_io_out_zero),
    .io_out_nan(B_convert_2_io_out_nan),
    .io_out_sign(B_convert_2_io_out_sign),
    .io_out_exponent(B_convert_2_io_out_exponent),
    .io_out_fraction(B_convert_2_io_out_fraction)
  );
  toPositUnpacked B_convert_3 ( // @[Array.scala 62:76]
    .io_in(B_convert_3_io_in),
    .io_out_zero(B_convert_3_io_out_zero),
    .io_out_nan(B_convert_3_io_out_nan),
    .io_out_sign(B_convert_3_io_out_sign),
    .io_out_exponent(B_convert_3_io_out_exponent),
    .io_out_fraction(B_convert_3_io_out_fraction)
  );
  assign io_C_out_0_zero = array_3_0_io_C_out_zero; // @[Array.scala 74:37]
  assign io_C_out_0_nan = array_3_0_io_C_out_nan; // @[Array.scala 74:37]
  assign io_C_out_0_number = array_3_0_io_C_out_number; // @[Array.scala 74:37]
  assign io_C_out_1_zero = array_3_1_io_C_out_zero; // @[Array.scala 74:37]
  assign io_C_out_1_nan = array_3_1_io_C_out_nan; // @[Array.scala 74:37]
  assign io_C_out_1_number = array_3_1_io_C_out_number; // @[Array.scala 74:37]
  assign io_C_out_2_zero = array_3_2_io_C_out_zero; // @[Array.scala 74:37]
  assign io_C_out_2_nan = array_3_2_io_C_out_nan; // @[Array.scala 74:37]
  assign io_C_out_2_number = array_3_2_io_C_out_number; // @[Array.scala 74:37]
  assign io_C_out_3_zero = array_3_3_io_C_out_zero; // @[Array.scala 74:37]
  assign io_C_out_3_nan = array_3_3_io_C_out_nan; // @[Array.scala 74:37]
  assign io_C_out_3_number = array_3_3_io_C_out_number; // @[Array.scala 74:37]
  assign array_0_0_clock = clock;
  assign array_0_0_io_A_in_zero = A_convert_0_io_out_zero; // @[Array.scala 66:45]
  assign array_0_0_io_A_in_nan = A_convert_0_io_out_nan; // @[Array.scala 66:45]
  assign array_0_0_io_A_in_sign = A_convert_0_io_out_sign; // @[Array.scala 66:45]
  assign array_0_0_io_A_in_exponent = A_convert_0_io_out_exponent; // @[Array.scala 66:45]
  assign array_0_0_io_A_in_fraction = A_convert_0_io_out_fraction; // @[Array.scala 66:45]
  assign array_0_0_io_B_in_zero = B_convert_0_io_out_zero; // @[Array.scala 79:45]
  assign array_0_0_io_B_in_nan = B_convert_0_io_out_nan; // @[Array.scala 79:45]
  assign array_0_0_io_B_in_sign = B_convert_0_io_out_sign; // @[Array.scala 79:45]
  assign array_0_0_io_B_in_exponent = B_convert_0_io_out_exponent; // @[Array.scala 79:45]
  assign array_0_0_io_B_in_fraction = B_convert_0_io_out_fraction; // @[Array.scala 79:45]
  assign array_0_0_io_C_in_zero = io_C_in_0_zero; // @[Array.scala 67:45]
  assign array_0_0_io_C_in_nan = io_C_in_0_nan; // @[Array.scala 67:45]
  assign array_0_0_io_C_in_number = io_C_in_0_number; // @[Array.scala 67:45]
  assign array_0_0_io_prop_in = io_prop_in_0; // @[Array.scala 68:48]
  assign array_0_1_clock = clock;
  assign array_0_1_io_A_in_zero = A_convert_1_io_out_zero; // @[Array.scala 66:45]
  assign array_0_1_io_A_in_nan = A_convert_1_io_out_nan; // @[Array.scala 66:45]
  assign array_0_1_io_A_in_sign = A_convert_1_io_out_sign; // @[Array.scala 66:45]
  assign array_0_1_io_A_in_exponent = A_convert_1_io_out_exponent; // @[Array.scala 66:45]
  assign array_0_1_io_A_in_fraction = A_convert_1_io_out_fraction; // @[Array.scala 66:45]
  assign array_0_1_io_B_in_zero = array_0_0_io_B_out_zero; // @[Array.scala 81:53]
  assign array_0_1_io_B_in_nan = array_0_0_io_B_out_nan; // @[Array.scala 81:53]
  assign array_0_1_io_B_in_sign = array_0_0_io_B_out_sign; // @[Array.scala 81:53]
  assign array_0_1_io_B_in_exponent = array_0_0_io_B_out_exponent; // @[Array.scala 81:53]
  assign array_0_1_io_B_in_fraction = array_0_0_io_B_out_fraction; // @[Array.scala 81:53]
  assign array_0_1_io_C_in_zero = io_C_in_1_zero; // @[Array.scala 67:45]
  assign array_0_1_io_C_in_nan = io_C_in_1_nan; // @[Array.scala 67:45]
  assign array_0_1_io_C_in_number = io_C_in_1_number; // @[Array.scala 67:45]
  assign array_0_1_io_prop_in = io_prop_in_1; // @[Array.scala 68:48]
  assign array_0_2_clock = clock;
  assign array_0_2_io_A_in_zero = A_convert_2_io_out_zero; // @[Array.scala 66:45]
  assign array_0_2_io_A_in_nan = A_convert_2_io_out_nan; // @[Array.scala 66:45]
  assign array_0_2_io_A_in_sign = A_convert_2_io_out_sign; // @[Array.scala 66:45]
  assign array_0_2_io_A_in_exponent = A_convert_2_io_out_exponent; // @[Array.scala 66:45]
  assign array_0_2_io_A_in_fraction = A_convert_2_io_out_fraction; // @[Array.scala 66:45]
  assign array_0_2_io_B_in_zero = array_0_1_io_B_out_zero; // @[Array.scala 81:53]
  assign array_0_2_io_B_in_nan = array_0_1_io_B_out_nan; // @[Array.scala 81:53]
  assign array_0_2_io_B_in_sign = array_0_1_io_B_out_sign; // @[Array.scala 81:53]
  assign array_0_2_io_B_in_exponent = array_0_1_io_B_out_exponent; // @[Array.scala 81:53]
  assign array_0_2_io_B_in_fraction = array_0_1_io_B_out_fraction; // @[Array.scala 81:53]
  assign array_0_2_io_C_in_zero = io_C_in_2_zero; // @[Array.scala 67:45]
  assign array_0_2_io_C_in_nan = io_C_in_2_nan; // @[Array.scala 67:45]
  assign array_0_2_io_C_in_number = io_C_in_2_number; // @[Array.scala 67:45]
  assign array_0_2_io_prop_in = io_prop_in_2; // @[Array.scala 68:48]
  assign array_0_3_clock = clock;
  assign array_0_3_io_A_in_zero = A_convert_3_io_out_zero; // @[Array.scala 66:45]
  assign array_0_3_io_A_in_nan = A_convert_3_io_out_nan; // @[Array.scala 66:45]
  assign array_0_3_io_A_in_sign = A_convert_3_io_out_sign; // @[Array.scala 66:45]
  assign array_0_3_io_A_in_exponent = A_convert_3_io_out_exponent; // @[Array.scala 66:45]
  assign array_0_3_io_A_in_fraction = A_convert_3_io_out_fraction; // @[Array.scala 66:45]
  assign array_0_3_io_B_in_zero = array_0_2_io_B_out_zero; // @[Array.scala 81:53]
  assign array_0_3_io_B_in_nan = array_0_2_io_B_out_nan; // @[Array.scala 81:53]
  assign array_0_3_io_B_in_sign = array_0_2_io_B_out_sign; // @[Array.scala 81:53]
  assign array_0_3_io_B_in_exponent = array_0_2_io_B_out_exponent; // @[Array.scala 81:53]
  assign array_0_3_io_B_in_fraction = array_0_2_io_B_out_fraction; // @[Array.scala 81:53]
  assign array_0_3_io_C_in_zero = io_C_in_3_zero; // @[Array.scala 67:45]
  assign array_0_3_io_C_in_nan = io_C_in_3_nan; // @[Array.scala 67:45]
  assign array_0_3_io_C_in_number = io_C_in_3_number; // @[Array.scala 67:45]
  assign array_0_3_io_prop_in = io_prop_in_3; // @[Array.scala 68:48]
  assign array_1_0_clock = clock;
  assign array_1_0_io_A_in_zero = array_0_0_io_A_out_zero; // @[Array.scala 70:53]
  assign array_1_0_io_A_in_nan = array_0_0_io_A_out_nan; // @[Array.scala 70:53]
  assign array_1_0_io_A_in_sign = array_0_0_io_A_out_sign; // @[Array.scala 70:53]
  assign array_1_0_io_A_in_exponent = array_0_0_io_A_out_exponent; // @[Array.scala 70:53]
  assign array_1_0_io_A_in_fraction = array_0_0_io_A_out_fraction; // @[Array.scala 70:53]
  assign array_1_0_io_B_in_zero = B_convert_1_io_out_zero; // @[Array.scala 79:45]
  assign array_1_0_io_B_in_nan = B_convert_1_io_out_nan; // @[Array.scala 79:45]
  assign array_1_0_io_B_in_sign = B_convert_1_io_out_sign; // @[Array.scala 79:45]
  assign array_1_0_io_B_in_exponent = B_convert_1_io_out_exponent; // @[Array.scala 79:45]
  assign array_1_0_io_B_in_fraction = B_convert_1_io_out_fraction; // @[Array.scala 79:45]
  assign array_1_0_io_C_in_zero = array_0_0_io_C_out_zero; // @[Array.scala 71:53]
  assign array_1_0_io_C_in_nan = array_0_0_io_C_out_nan; // @[Array.scala 71:53]
  assign array_1_0_io_C_in_number = array_0_0_io_C_out_number; // @[Array.scala 71:53]
  assign array_1_0_io_prop_in = array_0_0_io_prop_out; // @[Array.scala 72:56]
  assign array_1_1_clock = clock;
  assign array_1_1_io_A_in_zero = array_0_1_io_A_out_zero; // @[Array.scala 70:53]
  assign array_1_1_io_A_in_nan = array_0_1_io_A_out_nan; // @[Array.scala 70:53]
  assign array_1_1_io_A_in_sign = array_0_1_io_A_out_sign; // @[Array.scala 70:53]
  assign array_1_1_io_A_in_exponent = array_0_1_io_A_out_exponent; // @[Array.scala 70:53]
  assign array_1_1_io_A_in_fraction = array_0_1_io_A_out_fraction; // @[Array.scala 70:53]
  assign array_1_1_io_B_in_zero = array_1_0_io_B_out_zero; // @[Array.scala 81:53]
  assign array_1_1_io_B_in_nan = array_1_0_io_B_out_nan; // @[Array.scala 81:53]
  assign array_1_1_io_B_in_sign = array_1_0_io_B_out_sign; // @[Array.scala 81:53]
  assign array_1_1_io_B_in_exponent = array_1_0_io_B_out_exponent; // @[Array.scala 81:53]
  assign array_1_1_io_B_in_fraction = array_1_0_io_B_out_fraction; // @[Array.scala 81:53]
  assign array_1_1_io_C_in_zero = array_0_1_io_C_out_zero; // @[Array.scala 71:53]
  assign array_1_1_io_C_in_nan = array_0_1_io_C_out_nan; // @[Array.scala 71:53]
  assign array_1_1_io_C_in_number = array_0_1_io_C_out_number; // @[Array.scala 71:53]
  assign array_1_1_io_prop_in = array_0_1_io_prop_out; // @[Array.scala 72:56]
  assign array_1_2_clock = clock;
  assign array_1_2_io_A_in_zero = array_0_2_io_A_out_zero; // @[Array.scala 70:53]
  assign array_1_2_io_A_in_nan = array_0_2_io_A_out_nan; // @[Array.scala 70:53]
  assign array_1_2_io_A_in_sign = array_0_2_io_A_out_sign; // @[Array.scala 70:53]
  assign array_1_2_io_A_in_exponent = array_0_2_io_A_out_exponent; // @[Array.scala 70:53]
  assign array_1_2_io_A_in_fraction = array_0_2_io_A_out_fraction; // @[Array.scala 70:53]
  assign array_1_2_io_B_in_zero = array_1_1_io_B_out_zero; // @[Array.scala 81:53]
  assign array_1_2_io_B_in_nan = array_1_1_io_B_out_nan; // @[Array.scala 81:53]
  assign array_1_2_io_B_in_sign = array_1_1_io_B_out_sign; // @[Array.scala 81:53]
  assign array_1_2_io_B_in_exponent = array_1_1_io_B_out_exponent; // @[Array.scala 81:53]
  assign array_1_2_io_B_in_fraction = array_1_1_io_B_out_fraction; // @[Array.scala 81:53]
  assign array_1_2_io_C_in_zero = array_0_2_io_C_out_zero; // @[Array.scala 71:53]
  assign array_1_2_io_C_in_nan = array_0_2_io_C_out_nan; // @[Array.scala 71:53]
  assign array_1_2_io_C_in_number = array_0_2_io_C_out_number; // @[Array.scala 71:53]
  assign array_1_2_io_prop_in = array_0_2_io_prop_out; // @[Array.scala 72:56]
  assign array_1_3_clock = clock;
  assign array_1_3_io_A_in_zero = array_0_3_io_A_out_zero; // @[Array.scala 70:53]
  assign array_1_3_io_A_in_nan = array_0_3_io_A_out_nan; // @[Array.scala 70:53]
  assign array_1_3_io_A_in_sign = array_0_3_io_A_out_sign; // @[Array.scala 70:53]
  assign array_1_3_io_A_in_exponent = array_0_3_io_A_out_exponent; // @[Array.scala 70:53]
  assign array_1_3_io_A_in_fraction = array_0_3_io_A_out_fraction; // @[Array.scala 70:53]
  assign array_1_3_io_B_in_zero = array_1_2_io_B_out_zero; // @[Array.scala 81:53]
  assign array_1_3_io_B_in_nan = array_1_2_io_B_out_nan; // @[Array.scala 81:53]
  assign array_1_3_io_B_in_sign = array_1_2_io_B_out_sign; // @[Array.scala 81:53]
  assign array_1_3_io_B_in_exponent = array_1_2_io_B_out_exponent; // @[Array.scala 81:53]
  assign array_1_3_io_B_in_fraction = array_1_2_io_B_out_fraction; // @[Array.scala 81:53]
  assign array_1_3_io_C_in_zero = array_0_3_io_C_out_zero; // @[Array.scala 71:53]
  assign array_1_3_io_C_in_nan = array_0_3_io_C_out_nan; // @[Array.scala 71:53]
  assign array_1_3_io_C_in_number = array_0_3_io_C_out_number; // @[Array.scala 71:53]
  assign array_1_3_io_prop_in = array_0_3_io_prop_out; // @[Array.scala 72:56]
  assign array_2_0_clock = clock;
  assign array_2_0_io_A_in_zero = array_1_0_io_A_out_zero; // @[Array.scala 70:53]
  assign array_2_0_io_A_in_nan = array_1_0_io_A_out_nan; // @[Array.scala 70:53]
  assign array_2_0_io_A_in_sign = array_1_0_io_A_out_sign; // @[Array.scala 70:53]
  assign array_2_0_io_A_in_exponent = array_1_0_io_A_out_exponent; // @[Array.scala 70:53]
  assign array_2_0_io_A_in_fraction = array_1_0_io_A_out_fraction; // @[Array.scala 70:53]
  assign array_2_0_io_B_in_zero = B_convert_2_io_out_zero; // @[Array.scala 79:45]
  assign array_2_0_io_B_in_nan = B_convert_2_io_out_nan; // @[Array.scala 79:45]
  assign array_2_0_io_B_in_sign = B_convert_2_io_out_sign; // @[Array.scala 79:45]
  assign array_2_0_io_B_in_exponent = B_convert_2_io_out_exponent; // @[Array.scala 79:45]
  assign array_2_0_io_B_in_fraction = B_convert_2_io_out_fraction; // @[Array.scala 79:45]
  assign array_2_0_io_C_in_zero = array_1_0_io_C_out_zero; // @[Array.scala 71:53]
  assign array_2_0_io_C_in_nan = array_1_0_io_C_out_nan; // @[Array.scala 71:53]
  assign array_2_0_io_C_in_number = array_1_0_io_C_out_number; // @[Array.scala 71:53]
  assign array_2_0_io_prop_in = array_1_0_io_prop_out; // @[Array.scala 72:56]
  assign array_2_1_clock = clock;
  assign array_2_1_io_A_in_zero = array_1_1_io_A_out_zero; // @[Array.scala 70:53]
  assign array_2_1_io_A_in_nan = array_1_1_io_A_out_nan; // @[Array.scala 70:53]
  assign array_2_1_io_A_in_sign = array_1_1_io_A_out_sign; // @[Array.scala 70:53]
  assign array_2_1_io_A_in_exponent = array_1_1_io_A_out_exponent; // @[Array.scala 70:53]
  assign array_2_1_io_A_in_fraction = array_1_1_io_A_out_fraction; // @[Array.scala 70:53]
  assign array_2_1_io_B_in_zero = array_2_0_io_B_out_zero; // @[Array.scala 81:53]
  assign array_2_1_io_B_in_nan = array_2_0_io_B_out_nan; // @[Array.scala 81:53]
  assign array_2_1_io_B_in_sign = array_2_0_io_B_out_sign; // @[Array.scala 81:53]
  assign array_2_1_io_B_in_exponent = array_2_0_io_B_out_exponent; // @[Array.scala 81:53]
  assign array_2_1_io_B_in_fraction = array_2_0_io_B_out_fraction; // @[Array.scala 81:53]
  assign array_2_1_io_C_in_zero = array_1_1_io_C_out_zero; // @[Array.scala 71:53]
  assign array_2_1_io_C_in_nan = array_1_1_io_C_out_nan; // @[Array.scala 71:53]
  assign array_2_1_io_C_in_number = array_1_1_io_C_out_number; // @[Array.scala 71:53]
  assign array_2_1_io_prop_in = array_1_1_io_prop_out; // @[Array.scala 72:56]
  assign array_2_2_clock = clock;
  assign array_2_2_io_A_in_zero = array_1_2_io_A_out_zero; // @[Array.scala 70:53]
  assign array_2_2_io_A_in_nan = array_1_2_io_A_out_nan; // @[Array.scala 70:53]
  assign array_2_2_io_A_in_sign = array_1_2_io_A_out_sign; // @[Array.scala 70:53]
  assign array_2_2_io_A_in_exponent = array_1_2_io_A_out_exponent; // @[Array.scala 70:53]
  assign array_2_2_io_A_in_fraction = array_1_2_io_A_out_fraction; // @[Array.scala 70:53]
  assign array_2_2_io_B_in_zero = array_2_1_io_B_out_zero; // @[Array.scala 81:53]
  assign array_2_2_io_B_in_nan = array_2_1_io_B_out_nan; // @[Array.scala 81:53]
  assign array_2_2_io_B_in_sign = array_2_1_io_B_out_sign; // @[Array.scala 81:53]
  assign array_2_2_io_B_in_exponent = array_2_1_io_B_out_exponent; // @[Array.scala 81:53]
  assign array_2_2_io_B_in_fraction = array_2_1_io_B_out_fraction; // @[Array.scala 81:53]
  assign array_2_2_io_C_in_zero = array_1_2_io_C_out_zero; // @[Array.scala 71:53]
  assign array_2_2_io_C_in_nan = array_1_2_io_C_out_nan; // @[Array.scala 71:53]
  assign array_2_2_io_C_in_number = array_1_2_io_C_out_number; // @[Array.scala 71:53]
  assign array_2_2_io_prop_in = array_1_2_io_prop_out; // @[Array.scala 72:56]
  assign array_2_3_clock = clock;
  assign array_2_3_io_A_in_zero = array_1_3_io_A_out_zero; // @[Array.scala 70:53]
  assign array_2_3_io_A_in_nan = array_1_3_io_A_out_nan; // @[Array.scala 70:53]
  assign array_2_3_io_A_in_sign = array_1_3_io_A_out_sign; // @[Array.scala 70:53]
  assign array_2_3_io_A_in_exponent = array_1_3_io_A_out_exponent; // @[Array.scala 70:53]
  assign array_2_3_io_A_in_fraction = array_1_3_io_A_out_fraction; // @[Array.scala 70:53]
  assign array_2_3_io_B_in_zero = array_2_2_io_B_out_zero; // @[Array.scala 81:53]
  assign array_2_3_io_B_in_nan = array_2_2_io_B_out_nan; // @[Array.scala 81:53]
  assign array_2_3_io_B_in_sign = array_2_2_io_B_out_sign; // @[Array.scala 81:53]
  assign array_2_3_io_B_in_exponent = array_2_2_io_B_out_exponent; // @[Array.scala 81:53]
  assign array_2_3_io_B_in_fraction = array_2_2_io_B_out_fraction; // @[Array.scala 81:53]
  assign array_2_3_io_C_in_zero = array_1_3_io_C_out_zero; // @[Array.scala 71:53]
  assign array_2_3_io_C_in_nan = array_1_3_io_C_out_nan; // @[Array.scala 71:53]
  assign array_2_3_io_C_in_number = array_1_3_io_C_out_number; // @[Array.scala 71:53]
  assign array_2_3_io_prop_in = array_1_3_io_prop_out; // @[Array.scala 72:56]
  assign array_3_0_clock = clock;
  assign array_3_0_io_A_in_zero = array_2_0_io_A_out_zero; // @[Array.scala 70:53]
  assign array_3_0_io_A_in_nan = array_2_0_io_A_out_nan; // @[Array.scala 70:53]
  assign array_3_0_io_A_in_sign = array_2_0_io_A_out_sign; // @[Array.scala 70:53]
  assign array_3_0_io_A_in_exponent = array_2_0_io_A_out_exponent; // @[Array.scala 70:53]
  assign array_3_0_io_A_in_fraction = array_2_0_io_A_out_fraction; // @[Array.scala 70:53]
  assign array_3_0_io_B_in_zero = B_convert_3_io_out_zero; // @[Array.scala 79:45]
  assign array_3_0_io_B_in_nan = B_convert_3_io_out_nan; // @[Array.scala 79:45]
  assign array_3_0_io_B_in_sign = B_convert_3_io_out_sign; // @[Array.scala 79:45]
  assign array_3_0_io_B_in_exponent = B_convert_3_io_out_exponent; // @[Array.scala 79:45]
  assign array_3_0_io_B_in_fraction = B_convert_3_io_out_fraction; // @[Array.scala 79:45]
  assign array_3_0_io_C_in_zero = array_2_0_io_C_out_zero; // @[Array.scala 71:53]
  assign array_3_0_io_C_in_nan = array_2_0_io_C_out_nan; // @[Array.scala 71:53]
  assign array_3_0_io_C_in_number = array_2_0_io_C_out_number; // @[Array.scala 71:53]
  assign array_3_0_io_prop_in = array_2_0_io_prop_out; // @[Array.scala 72:56]
  assign array_3_1_clock = clock;
  assign array_3_1_io_A_in_zero = array_2_1_io_A_out_zero; // @[Array.scala 70:53]
  assign array_3_1_io_A_in_nan = array_2_1_io_A_out_nan; // @[Array.scala 70:53]
  assign array_3_1_io_A_in_sign = array_2_1_io_A_out_sign; // @[Array.scala 70:53]
  assign array_3_1_io_A_in_exponent = array_2_1_io_A_out_exponent; // @[Array.scala 70:53]
  assign array_3_1_io_A_in_fraction = array_2_1_io_A_out_fraction; // @[Array.scala 70:53]
  assign array_3_1_io_B_in_zero = array_3_0_io_B_out_zero; // @[Array.scala 81:53]
  assign array_3_1_io_B_in_nan = array_3_0_io_B_out_nan; // @[Array.scala 81:53]
  assign array_3_1_io_B_in_sign = array_3_0_io_B_out_sign; // @[Array.scala 81:53]
  assign array_3_1_io_B_in_exponent = array_3_0_io_B_out_exponent; // @[Array.scala 81:53]
  assign array_3_1_io_B_in_fraction = array_3_0_io_B_out_fraction; // @[Array.scala 81:53]
  assign array_3_1_io_C_in_zero = array_2_1_io_C_out_zero; // @[Array.scala 71:53]
  assign array_3_1_io_C_in_nan = array_2_1_io_C_out_nan; // @[Array.scala 71:53]
  assign array_3_1_io_C_in_number = array_2_1_io_C_out_number; // @[Array.scala 71:53]
  assign array_3_1_io_prop_in = array_2_1_io_prop_out; // @[Array.scala 72:56]
  assign array_3_2_clock = clock;
  assign array_3_2_io_A_in_zero = array_2_2_io_A_out_zero; // @[Array.scala 70:53]
  assign array_3_2_io_A_in_nan = array_2_2_io_A_out_nan; // @[Array.scala 70:53]
  assign array_3_2_io_A_in_sign = array_2_2_io_A_out_sign; // @[Array.scala 70:53]
  assign array_3_2_io_A_in_exponent = array_2_2_io_A_out_exponent; // @[Array.scala 70:53]
  assign array_3_2_io_A_in_fraction = array_2_2_io_A_out_fraction; // @[Array.scala 70:53]
  assign array_3_2_io_B_in_zero = array_3_1_io_B_out_zero; // @[Array.scala 81:53]
  assign array_3_2_io_B_in_nan = array_3_1_io_B_out_nan; // @[Array.scala 81:53]
  assign array_3_2_io_B_in_sign = array_3_1_io_B_out_sign; // @[Array.scala 81:53]
  assign array_3_2_io_B_in_exponent = array_3_1_io_B_out_exponent; // @[Array.scala 81:53]
  assign array_3_2_io_B_in_fraction = array_3_1_io_B_out_fraction; // @[Array.scala 81:53]
  assign array_3_2_io_C_in_zero = array_2_2_io_C_out_zero; // @[Array.scala 71:53]
  assign array_3_2_io_C_in_nan = array_2_2_io_C_out_nan; // @[Array.scala 71:53]
  assign array_3_2_io_C_in_number = array_2_2_io_C_out_number; // @[Array.scala 71:53]
  assign array_3_2_io_prop_in = array_2_2_io_prop_out; // @[Array.scala 72:56]
  assign array_3_3_clock = clock;
  assign array_3_3_io_A_in_zero = array_2_3_io_A_out_zero; // @[Array.scala 70:53]
  assign array_3_3_io_A_in_nan = array_2_3_io_A_out_nan; // @[Array.scala 70:53]
  assign array_3_3_io_A_in_sign = array_2_3_io_A_out_sign; // @[Array.scala 70:53]
  assign array_3_3_io_A_in_exponent = array_2_3_io_A_out_exponent; // @[Array.scala 70:53]
  assign array_3_3_io_A_in_fraction = array_2_3_io_A_out_fraction; // @[Array.scala 70:53]
  assign array_3_3_io_B_in_zero = array_3_2_io_B_out_zero; // @[Array.scala 81:53]
  assign array_3_3_io_B_in_nan = array_3_2_io_B_out_nan; // @[Array.scala 81:53]
  assign array_3_3_io_B_in_sign = array_3_2_io_B_out_sign; // @[Array.scala 81:53]
  assign array_3_3_io_B_in_exponent = array_3_2_io_B_out_exponent; // @[Array.scala 81:53]
  assign array_3_3_io_B_in_fraction = array_3_2_io_B_out_fraction; // @[Array.scala 81:53]
  assign array_3_3_io_C_in_zero = array_2_3_io_C_out_zero; // @[Array.scala 71:53]
  assign array_3_3_io_C_in_nan = array_2_3_io_C_out_nan; // @[Array.scala 71:53]
  assign array_3_3_io_C_in_number = array_2_3_io_C_out_number; // @[Array.scala 71:53]
  assign array_3_3_io_prop_in = array_2_3_io_prop_out; // @[Array.scala 72:56]
  assign A_convert_0_io_in = io_A_in_0; // @[Array.scala 65:44]
  assign A_convert_1_io_in = io_A_in_1; // @[Array.scala 65:44]
  assign A_convert_2_io_in = io_A_in_2; // @[Array.scala 65:44]
  assign A_convert_3_io_in = io_A_in_3; // @[Array.scala 65:44]
  assign B_convert_0_io_in = io_B_in_0; // @[Array.scala 78:44]
  assign B_convert_1_io_in = io_B_in_1; // @[Array.scala 78:44]
  assign B_convert_2_io_in = io_B_in_2; // @[Array.scala 78:44]
  assign B_convert_3_io_in = io_B_in_3; // @[Array.scala 78:44]
endmodule
