module linearMultiplier(
  input         io_A_zero,
  input         io_A_nan,
  input         io_A_sign,
  input  [5:0]  io_A_exponent,
  input  [10:0] io_A_fraction,
  input         io_B_zero,
  input         io_B_nan,
  input         io_B_sign,
  input  [5:0]  io_B_exponent,
  input  [10:0] io_B_fraction,
  output        io_out_zero,
  output        io_out_nan,
  output [80:0] io_out_number
);
  wire [6:0] exponentSum; // @[Multiplier.scala 15:41]
  wire [21:0] fractionProduct; // @[Multiplier.scala 16:45]
  wire [7:0] _T; // @[Multiplier.scala 17:34]
  wire [8:0] shift; // @[Multiplier.scala 17:49]
  wire  _T_1; // @[Multiplier.scala 18:32]
  wire [8:0] _T_5; // @[Multiplier.scala 18:67]
  wire [21:0] _T_6; // @[Multiplier.scala 18:55]
  wire [8:0] _T_7; // @[Multiplier.scala 18:100]
  wire [532:0] _GEN_0; // @[Multiplier.scala 18:91]
  wire [532:0] _T_8; // @[Multiplier.scala 18:91]
  wire  _T_9; // @[Multiplier.scala 20:34]
  wire [5:0] _T_12; // @[Multiplier.scala 20:57]
  wire [8:0] _GEN_1; // @[Multiplier.scala 20:55]
  wire  _T_13; // @[Multiplier.scala 20:55]
  wire  _T_15; // @[Multiplier.scala 21:32]
  wire  _T_16; // @[Multiplier.scala 21:52]
  wire  _T_18; // @[Multiplier.scala 22:41]
  wire [532:0] _T_20; // @[Multiplier.scala 22:70]
  wire [532:0] _T_23; // @[Multiplier.scala 22:62]
  wire [532:0] _T_25; // @[Multiplier.scala 22:29]
  assign exponentSum = $signed(io_A_exponent) + $signed(io_B_exponent); // @[Multiplier.scala 15:41]
  assign fractionProduct = io_A_fraction * io_B_fraction; // @[Multiplier.scala 16:45]
  assign _T = 7'sh30 + $signed(exponentSum); // @[Multiplier.scala 17:34]
  assign shift = $signed(_T) - 8'sh14; // @[Multiplier.scala 17:49]
  assign _T_1 = $signed(shift) < 9'sh0; // @[Multiplier.scala 18:32]
  assign _T_5 = 9'sh0 - $signed(shift); // @[Multiplier.scala 18:67]
  assign _T_6 = fractionProduct >> _T_5; // @[Multiplier.scala 18:55]
  assign _T_7 = $signed(_T) - 8'sh14; // @[Multiplier.scala 18:100]
  assign _GEN_0 = {{511'd0}, fractionProduct}; // @[Multiplier.scala 18:91]
  assign _T_8 = _GEN_0 << _T_7; // @[Multiplier.scala 18:91]
  assign _T_9 = io_A_zero | io_B_zero; // @[Multiplier.scala 20:34]
  assign _T_12 = 6'sh0 - 6'sh14; // @[Multiplier.scala 20:57]
  assign _GEN_1 = {{3{_T_12[5]}},_T_12}; // @[Multiplier.scala 20:55]
  assign _T_13 = $signed(shift) < $signed(_GEN_1); // @[Multiplier.scala 20:55]
  assign _T_15 = io_A_nan | io_B_nan; // @[Multiplier.scala 21:32]
  assign _T_16 = $signed(shift) >= 9'sh3b; // @[Multiplier.scala 21:52]
  assign _T_18 = io_A_sign ^ io_B_sign; // @[Multiplier.scala 22:41]
  assign _T_20 = _T_1 ? {{511'd0}, _T_6} : _T_8; // @[Multiplier.scala 22:70]
  assign _T_23 = 533'sh0 - $signed(_T_20); // @[Multiplier.scala 22:62]
  assign _T_25 = _T_18 ? $signed(_T_23) : $signed(_T_20); // @[Multiplier.scala 22:29]
  assign io_out_zero = _T_9 | _T_13; // @[Multiplier.scala 20:21]
  assign io_out_nan = _T_15 | _T_16; // @[Multiplier.scala 21:20]
  assign io_out_number = _T_25[80:0]; // @[Multiplier.scala 22:23]
endmodule
module linearMultiplierMAC(
  input         io_A_zero,
  input         io_A_nan,
  input         io_A_sign,
  input  [5:0]  io_A_exponent,
  input  [10:0] io_A_fraction,
  input         io_B_zero,
  input         io_B_nan,
  input         io_B_sign,
  input  [5:0]  io_B_exponent,
  input  [10:0] io_B_fraction,
  input         io_C_zero,
  input         io_C_nan,
  input  [80:0] io_C_number,
  output        io_out_zero,
  output        io_out_nan,
  output [80:0] io_out_number
);
  wire  multiplier_io_A_zero; // @[Multiplier.scala 33:32]
  wire  multiplier_io_A_nan; // @[Multiplier.scala 33:32]
  wire  multiplier_io_A_sign; // @[Multiplier.scala 33:32]
  wire [5:0] multiplier_io_A_exponent; // @[Multiplier.scala 33:32]
  wire [10:0] multiplier_io_A_fraction; // @[Multiplier.scala 33:32]
  wire  multiplier_io_B_zero; // @[Multiplier.scala 33:32]
  wire  multiplier_io_B_nan; // @[Multiplier.scala 33:32]
  wire  multiplier_io_B_sign; // @[Multiplier.scala 33:32]
  wire [5:0] multiplier_io_B_exponent; // @[Multiplier.scala 33:32]
  wire [10:0] multiplier_io_B_fraction; // @[Multiplier.scala 33:32]
  wire  multiplier_io_out_zero; // @[Multiplier.scala 33:32]
  wire  multiplier_io_out_nan; // @[Multiplier.scala 33:32]
  wire [80:0] multiplier_io_out_number; // @[Multiplier.scala 33:32]
  wire [80:0] sum; // @[Multiplier.scala 36:44]
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
  assign _T_5 = io_C_number[80] == multiplier_io_out_number[80]; // @[Multiplier.scala 37:99]
  assign _T_8 = _T_5 & io_C_number[80]; // @[Multiplier.scala 37:151]
  assign _T_10 = ~sum[80]; // @[Multiplier.scala 37:228]
  assign _T_11 = _T_8 & _T_10; // @[Multiplier.scala 37:198]
  assign _T_13 = multiplier_io_out_nan | io_C_nan; // @[Multiplier.scala 38:45]
  assign _T_18 = ~io_C_number[80]; // @[Multiplier.scala 38:184]
  assign _T_19 = _T_5 & _T_18; // @[Multiplier.scala 38:146]
  assign _T_22 = _T_19 & sum[80]; // @[Multiplier.scala 38:193]
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
  input         clock,
  input         io_A_in_zero,
  input         io_A_in_nan,
  input         io_A_in_sign,
  input  [5:0]  io_A_in_exponent,
  input  [10:0] io_A_in_fraction,
  input         io_B_in_zero,
  input         io_B_in_nan,
  input         io_B_in_sign,
  input  [5:0]  io_B_in_exponent,
  input  [10:0] io_B_in_fraction,
  input         io_C_in_zero,
  input         io_C_in_nan,
  input  [80:0] io_C_in_number,
  input         io_prop_in,
  output        io_A_out_zero,
  output        io_A_out_nan,
  output        io_A_out_sign,
  output [5:0]  io_A_out_exponent,
  output [10:0] io_A_out_fraction,
  output        io_B_out_zero,
  output        io_B_out_nan,
  output        io_B_out_sign,
  output [5:0]  io_B_out_exponent,
  output [10:0] io_B_out_fraction,
  output        io_C_out_zero,
  output        io_C_out_nan,
  output [80:0] io_C_out_number,
  output        io_prop_out
);
  wire  mac_io_A_zero; // @[Tile.scala 29:33]
  wire  mac_io_A_nan; // @[Tile.scala 29:33]
  wire  mac_io_A_sign; // @[Tile.scala 29:33]
  wire [5:0] mac_io_A_exponent; // @[Tile.scala 29:33]
  wire [10:0] mac_io_A_fraction; // @[Tile.scala 29:33]
  wire  mac_io_B_zero; // @[Tile.scala 29:33]
  wire  mac_io_B_nan; // @[Tile.scala 29:33]
  wire  mac_io_B_sign; // @[Tile.scala 29:33]
  wire [5:0] mac_io_B_exponent; // @[Tile.scala 29:33]
  wire [10:0] mac_io_B_fraction; // @[Tile.scala 29:33]
  wire  mac_io_C_zero; // @[Tile.scala 29:33]
  wire  mac_io_C_nan; // @[Tile.scala 29:33]
  wire [80:0] mac_io_C_number; // @[Tile.scala 29:33]
  wire  mac_io_out_zero; // @[Tile.scala 29:33]
  wire  mac_io_out_nan; // @[Tile.scala 29:33]
  wire [80:0] mac_io_out_number; // @[Tile.scala 29:33]
  wire  _T; // @[Tile.scala 22:45]
  reg  A0_zero; // @[Reg.scala 15:16]
  reg [31:0] _RAND_0;
  reg  A0_nan; // @[Reg.scala 15:16]
  reg [31:0] _RAND_1;
  reg  A0_sign; // @[Reg.scala 15:16]
  reg [31:0] _RAND_2;
  reg [5:0] A0_exponent; // @[Reg.scala 15:16]
  reg [31:0] _RAND_3;
  reg [10:0] A0_fraction; // @[Reg.scala 15:16]
  reg [31:0] _RAND_4;
  reg  A1_zero; // @[Reg.scala 15:16]
  reg [31:0] _RAND_5;
  reg  A1_nan; // @[Reg.scala 15:16]
  reg [31:0] _RAND_6;
  reg  A1_sign; // @[Reg.scala 15:16]
  reg [31:0] _RAND_7;
  reg [5:0] A1_exponent; // @[Reg.scala 15:16]
  reg [31:0] _RAND_8;
  reg [10:0] A1_fraction; // @[Reg.scala 15:16]
  reg [31:0] _RAND_9;
  reg  A_zero; // @[Tile.scala 25:32]
  reg [31:0] _RAND_10;
  reg  A_nan; // @[Tile.scala 25:32]
  reg [31:0] _RAND_11;
  reg  A_sign; // @[Tile.scala 25:32]
  reg [31:0] _RAND_12;
  reg [5:0] A_exponent; // @[Tile.scala 25:32]
  reg [31:0] _RAND_13;
  reg [10:0] A_fraction; // @[Tile.scala 25:32]
  reg [31:0] _RAND_14;
  reg  B_zero; // @[Tile.scala 26:32]
  reg [31:0] _RAND_15;
  reg  B_nan; // @[Tile.scala 26:32]
  reg [31:0] _RAND_16;
  reg  B_sign; // @[Tile.scala 26:32]
  reg [31:0] _RAND_17;
  reg [5:0] B_exponent; // @[Tile.scala 26:32]
  reg [31:0] _RAND_18;
  reg [10:0] B_fraction; // @[Tile.scala 26:32]
  reg [31:0] _RAND_19;
  reg  prop; // @[Tile.scala 27:35]
  reg [31:0] _RAND_20;
  reg  C_zero; // @[Tile.scala 34:32]
  reg [31:0] _RAND_21;
  reg  C_nan; // @[Tile.scala 34:32]
  reg [31:0] _RAND_22;
  reg [80:0] C_number; // @[Tile.scala 34:32]
  reg [95:0] _RAND_23;
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
  A0_fraction = _RAND_4[10:0];
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
  A1_fraction = _RAND_9[10:0];
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
  A_fraction = _RAND_14[10:0];
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
  B_fraction = _RAND_19[10:0];
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
  _RAND_23 = {3{`RANDOM}};
  C_number = _RAND_23[80:0];
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
module toFloatingPointUnpacked(
  input  [15:0] io_in,
  output        io_out_zero,
  output        io_out_nan,
  output        io_out_sign,
  output [5:0]  io_out_exponent,
  output [10:0] io_out_fraction
);
  wire  _T_1; // @[Conversion.scala 47:77]
  wire  _T_2; // @[Conversion.scala 47:26]
  wire [7:0] _T_8; // @[Bitwise.scala 102:31]
  wire [7:0] _T_10; // @[Bitwise.scala 102:65]
  wire [7:0] _T_12; // @[Bitwise.scala 102:75]
  wire [7:0] _T_13; // @[Bitwise.scala 102:39]
  wire [7:0] _GEN_0; // @[Bitwise.scala 102:31]
  wire [7:0] _T_18; // @[Bitwise.scala 102:31]
  wire [7:0] _T_20; // @[Bitwise.scala 102:65]
  wire [7:0] _T_22; // @[Bitwise.scala 102:75]
  wire [7:0] _T_23; // @[Bitwise.scala 102:39]
  wire [7:0] _GEN_1; // @[Bitwise.scala 102:31]
  wire [7:0] _T_28; // @[Bitwise.scala 102:31]
  wire [7:0] _T_30; // @[Bitwise.scala 102:65]
  wire [7:0] _T_32; // @[Bitwise.scala 102:75]
  wire [7:0] _T_33; // @[Bitwise.scala 102:39]
  wire [9:0] _T_38; // @[Cat.scala 29:58]
  wire [3:0] _T_49; // @[Mux.scala 47:69]
  wire [3:0] _T_50; // @[Mux.scala 47:69]
  wire [3:0] _T_51; // @[Mux.scala 47:69]
  wire [3:0] _T_52; // @[Mux.scala 47:69]
  wire [3:0] _T_53; // @[Mux.scala 47:69]
  wire [3:0] _T_54; // @[Mux.scala 47:69]
  wire [3:0] _T_55; // @[Mux.scala 47:69]
  wire [3:0] _T_56; // @[Mux.scala 47:69]
  wire [3:0] _T_57; // @[Mux.scala 47:69]
  wire [3:0] subnormal; // @[Conversion.scala 47:25]
  wire  _T_60; // @[Conversion.scala 49:48]
  wire [5:0] _T_66; // @[Conversion.scala 52:78]
  wire [5:0] _T_69; // @[Conversion.scala 52:83]
  wire [4:0] _T_70; // @[Conversion.scala 52:104]
  wire [5:0] _GEN_2; // @[Conversion.scala 52:92]
  wire [24:0] _GEN_3; // @[Conversion.scala 53:131]
  wire [24:0] _T_78; // @[Conversion.scala 53:131]
  wire [25:0] _T_79; // @[Cat.scala 29:58]
  wire [10:0] _T_81; // @[Cat.scala 29:58]
  wire [25:0] _T_82; // @[Conversion.scala 53:31]
  assign _T_1 = io_in[14:10] != 5'h0; // @[Conversion.scala 47:77]
  assign _T_2 = ~_T_1; // @[Conversion.scala 47:26]
  assign _T_8 = {{4'd0}, io_in[7:4]}; // @[Bitwise.scala 102:31]
  assign _T_10 = {io_in[3:0], 4'h0}; // @[Bitwise.scala 102:65]
  assign _T_12 = _T_10 & 8'hf0; // @[Bitwise.scala 102:75]
  assign _T_13 = _T_8 | _T_12; // @[Bitwise.scala 102:39]
  assign _GEN_0 = {{2'd0}, _T_13[7:2]}; // @[Bitwise.scala 102:31]
  assign _T_18 = _GEN_0 & 8'h33; // @[Bitwise.scala 102:31]
  assign _T_20 = {_T_13[5:0], 2'h0}; // @[Bitwise.scala 102:65]
  assign _T_22 = _T_20 & 8'hcc; // @[Bitwise.scala 102:75]
  assign _T_23 = _T_18 | _T_22; // @[Bitwise.scala 102:39]
  assign _GEN_1 = {{1'd0}, _T_23[7:1]}; // @[Bitwise.scala 102:31]
  assign _T_28 = _GEN_1 & 8'h55; // @[Bitwise.scala 102:31]
  assign _T_30 = {_T_23[6:0], 1'h0}; // @[Bitwise.scala 102:65]
  assign _T_32 = _T_30 & 8'haa; // @[Bitwise.scala 102:75]
  assign _T_33 = _T_28 | _T_32; // @[Bitwise.scala 102:39]
  assign _T_38 = {_T_33,io_in[8],io_in[9]}; // @[Cat.scala 29:58]
  assign _T_49 = _T_38[8] ? 4'h8 : 4'h9; // @[Mux.scala 47:69]
  assign _T_50 = _T_38[7] ? 4'h7 : _T_49; // @[Mux.scala 47:69]
  assign _T_51 = _T_38[6] ? 4'h6 : _T_50; // @[Mux.scala 47:69]
  assign _T_52 = _T_38[5] ? 4'h5 : _T_51; // @[Mux.scala 47:69]
  assign _T_53 = _T_38[4] ? 4'h4 : _T_52; // @[Mux.scala 47:69]
  assign _T_54 = _T_38[3] ? 4'h3 : _T_53; // @[Mux.scala 47:69]
  assign _T_55 = _T_38[2] ? 4'h2 : _T_54; // @[Mux.scala 47:69]
  assign _T_56 = _T_38[1] ? 4'h1 : _T_55; // @[Mux.scala 47:69]
  assign _T_57 = _T_38[0] ? 4'h0 : _T_56; // @[Mux.scala 47:69]
  assign subnormal = _T_2 ? _T_57 : 4'h0; // @[Conversion.scala 47:25]
  assign _T_60 = io_in[14:0] != 15'h0; // @[Conversion.scala 49:48]
  assign _T_66 = {1'b0,$signed(io_in[14:10])}; // @[Conversion.scala 52:78]
  assign _T_69 = $signed(_T_66) - 6'shf; // @[Conversion.scala 52:83]
  assign _T_70 = {1'b0,$signed(subnormal)}; // @[Conversion.scala 52:104]
  assign _GEN_2 = {{1{_T_70[4]}},_T_70}; // @[Conversion.scala 52:92]
  assign _GEN_3 = {{15'd0}, io_in[9:0]}; // @[Conversion.scala 53:131]
  assign _T_78 = _GEN_3 << subnormal; // @[Conversion.scala 53:131]
  assign _T_79 = {_T_78,1'h0}; // @[Cat.scala 29:58]
  assign _T_81 = {1'h1,io_in[9:0]}; // @[Cat.scala 29:58]
  assign _T_82 = _T_2 ? _T_79 : {{15'd0}, _T_81}; // @[Conversion.scala 53:31]
  assign io_out_zero = ~_T_60; // @[Conversion.scala 49:21]
  assign io_out_nan = io_in[14:10] == 5'h1f; // @[Conversion.scala 50:20]
  assign io_out_sign = io_in[15]; // @[Conversion.scala 51:21]
  assign io_out_exponent = $signed(_T_69) - $signed(_GEN_2); // @[Conversion.scala 52:25]
  assign io_out_fraction = _T_82[10:0]; // @[Conversion.scala 53:25]
endmodule
module linearFloatingPointArray(
  input         clock,
  input         reset,
  input  [15:0] io_A_in_0,
  input  [15:0] io_A_in_1,
  input  [15:0] io_A_in_2,
  input  [15:0] io_A_in_3,
  input  [15:0] io_B_in_0,
  input  [15:0] io_B_in_1,
  input  [15:0] io_B_in_2,
  input  [15:0] io_B_in_3,
  input         io_C_in_0_zero,
  input         io_C_in_0_nan,
  input  [80:0] io_C_in_0_number,
  input         io_C_in_1_zero,
  input         io_C_in_1_nan,
  input  [80:0] io_C_in_1_number,
  input         io_C_in_2_zero,
  input         io_C_in_2_nan,
  input  [80:0] io_C_in_2_number,
  input         io_C_in_3_zero,
  input         io_C_in_3_nan,
  input  [80:0] io_C_in_3_number,
  input         io_prop_in_0,
  input         io_prop_in_1,
  input         io_prop_in_2,
  input         io_prop_in_3,
  output        io_C_out_0_zero,
  output        io_C_out_0_nan,
  output [80:0] io_C_out_0_number,
  output        io_C_out_1_zero,
  output        io_C_out_1_nan,
  output [80:0] io_C_out_1_number,
  output        io_C_out_2_zero,
  output        io_C_out_2_nan,
  output [80:0] io_C_out_2_number,
  output        io_C_out_3_zero,
  output        io_C_out_3_nan,
  output [80:0] io_C_out_3_number
);
  wire  array_0_0_clock; // @[Array.scala 21:78]
  wire  array_0_0_io_A_in_zero; // @[Array.scala 21:78]
  wire  array_0_0_io_A_in_nan; // @[Array.scala 21:78]
  wire  array_0_0_io_A_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_0_0_io_A_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_0_0_io_A_in_fraction; // @[Array.scala 21:78]
  wire  array_0_0_io_B_in_zero; // @[Array.scala 21:78]
  wire  array_0_0_io_B_in_nan; // @[Array.scala 21:78]
  wire  array_0_0_io_B_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_0_0_io_B_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_0_0_io_B_in_fraction; // @[Array.scala 21:78]
  wire  array_0_0_io_C_in_zero; // @[Array.scala 21:78]
  wire  array_0_0_io_C_in_nan; // @[Array.scala 21:78]
  wire [80:0] array_0_0_io_C_in_number; // @[Array.scala 21:78]
  wire  array_0_0_io_prop_in; // @[Array.scala 21:78]
  wire  array_0_0_io_A_out_zero; // @[Array.scala 21:78]
  wire  array_0_0_io_A_out_nan; // @[Array.scala 21:78]
  wire  array_0_0_io_A_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_0_0_io_A_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_0_0_io_A_out_fraction; // @[Array.scala 21:78]
  wire  array_0_0_io_B_out_zero; // @[Array.scala 21:78]
  wire  array_0_0_io_B_out_nan; // @[Array.scala 21:78]
  wire  array_0_0_io_B_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_0_0_io_B_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_0_0_io_B_out_fraction; // @[Array.scala 21:78]
  wire  array_0_0_io_C_out_zero; // @[Array.scala 21:78]
  wire  array_0_0_io_C_out_nan; // @[Array.scala 21:78]
  wire [80:0] array_0_0_io_C_out_number; // @[Array.scala 21:78]
  wire  array_0_0_io_prop_out; // @[Array.scala 21:78]
  wire  array_0_1_clock; // @[Array.scala 21:78]
  wire  array_0_1_io_A_in_zero; // @[Array.scala 21:78]
  wire  array_0_1_io_A_in_nan; // @[Array.scala 21:78]
  wire  array_0_1_io_A_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_0_1_io_A_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_0_1_io_A_in_fraction; // @[Array.scala 21:78]
  wire  array_0_1_io_B_in_zero; // @[Array.scala 21:78]
  wire  array_0_1_io_B_in_nan; // @[Array.scala 21:78]
  wire  array_0_1_io_B_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_0_1_io_B_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_0_1_io_B_in_fraction; // @[Array.scala 21:78]
  wire  array_0_1_io_C_in_zero; // @[Array.scala 21:78]
  wire  array_0_1_io_C_in_nan; // @[Array.scala 21:78]
  wire [80:0] array_0_1_io_C_in_number; // @[Array.scala 21:78]
  wire  array_0_1_io_prop_in; // @[Array.scala 21:78]
  wire  array_0_1_io_A_out_zero; // @[Array.scala 21:78]
  wire  array_0_1_io_A_out_nan; // @[Array.scala 21:78]
  wire  array_0_1_io_A_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_0_1_io_A_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_0_1_io_A_out_fraction; // @[Array.scala 21:78]
  wire  array_0_1_io_B_out_zero; // @[Array.scala 21:78]
  wire  array_0_1_io_B_out_nan; // @[Array.scala 21:78]
  wire  array_0_1_io_B_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_0_1_io_B_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_0_1_io_B_out_fraction; // @[Array.scala 21:78]
  wire  array_0_1_io_C_out_zero; // @[Array.scala 21:78]
  wire  array_0_1_io_C_out_nan; // @[Array.scala 21:78]
  wire [80:0] array_0_1_io_C_out_number; // @[Array.scala 21:78]
  wire  array_0_1_io_prop_out; // @[Array.scala 21:78]
  wire  array_0_2_clock; // @[Array.scala 21:78]
  wire  array_0_2_io_A_in_zero; // @[Array.scala 21:78]
  wire  array_0_2_io_A_in_nan; // @[Array.scala 21:78]
  wire  array_0_2_io_A_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_0_2_io_A_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_0_2_io_A_in_fraction; // @[Array.scala 21:78]
  wire  array_0_2_io_B_in_zero; // @[Array.scala 21:78]
  wire  array_0_2_io_B_in_nan; // @[Array.scala 21:78]
  wire  array_0_2_io_B_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_0_2_io_B_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_0_2_io_B_in_fraction; // @[Array.scala 21:78]
  wire  array_0_2_io_C_in_zero; // @[Array.scala 21:78]
  wire  array_0_2_io_C_in_nan; // @[Array.scala 21:78]
  wire [80:0] array_0_2_io_C_in_number; // @[Array.scala 21:78]
  wire  array_0_2_io_prop_in; // @[Array.scala 21:78]
  wire  array_0_2_io_A_out_zero; // @[Array.scala 21:78]
  wire  array_0_2_io_A_out_nan; // @[Array.scala 21:78]
  wire  array_0_2_io_A_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_0_2_io_A_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_0_2_io_A_out_fraction; // @[Array.scala 21:78]
  wire  array_0_2_io_B_out_zero; // @[Array.scala 21:78]
  wire  array_0_2_io_B_out_nan; // @[Array.scala 21:78]
  wire  array_0_2_io_B_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_0_2_io_B_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_0_2_io_B_out_fraction; // @[Array.scala 21:78]
  wire  array_0_2_io_C_out_zero; // @[Array.scala 21:78]
  wire  array_0_2_io_C_out_nan; // @[Array.scala 21:78]
  wire [80:0] array_0_2_io_C_out_number; // @[Array.scala 21:78]
  wire  array_0_2_io_prop_out; // @[Array.scala 21:78]
  wire  array_0_3_clock; // @[Array.scala 21:78]
  wire  array_0_3_io_A_in_zero; // @[Array.scala 21:78]
  wire  array_0_3_io_A_in_nan; // @[Array.scala 21:78]
  wire  array_0_3_io_A_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_0_3_io_A_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_0_3_io_A_in_fraction; // @[Array.scala 21:78]
  wire  array_0_3_io_B_in_zero; // @[Array.scala 21:78]
  wire  array_0_3_io_B_in_nan; // @[Array.scala 21:78]
  wire  array_0_3_io_B_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_0_3_io_B_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_0_3_io_B_in_fraction; // @[Array.scala 21:78]
  wire  array_0_3_io_C_in_zero; // @[Array.scala 21:78]
  wire  array_0_3_io_C_in_nan; // @[Array.scala 21:78]
  wire [80:0] array_0_3_io_C_in_number; // @[Array.scala 21:78]
  wire  array_0_3_io_prop_in; // @[Array.scala 21:78]
  wire  array_0_3_io_A_out_zero; // @[Array.scala 21:78]
  wire  array_0_3_io_A_out_nan; // @[Array.scala 21:78]
  wire  array_0_3_io_A_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_0_3_io_A_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_0_3_io_A_out_fraction; // @[Array.scala 21:78]
  wire  array_0_3_io_B_out_zero; // @[Array.scala 21:78]
  wire  array_0_3_io_B_out_nan; // @[Array.scala 21:78]
  wire  array_0_3_io_B_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_0_3_io_B_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_0_3_io_B_out_fraction; // @[Array.scala 21:78]
  wire  array_0_3_io_C_out_zero; // @[Array.scala 21:78]
  wire  array_0_3_io_C_out_nan; // @[Array.scala 21:78]
  wire [80:0] array_0_3_io_C_out_number; // @[Array.scala 21:78]
  wire  array_0_3_io_prop_out; // @[Array.scala 21:78]
  wire  array_1_0_clock; // @[Array.scala 21:78]
  wire  array_1_0_io_A_in_zero; // @[Array.scala 21:78]
  wire  array_1_0_io_A_in_nan; // @[Array.scala 21:78]
  wire  array_1_0_io_A_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_1_0_io_A_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_1_0_io_A_in_fraction; // @[Array.scala 21:78]
  wire  array_1_0_io_B_in_zero; // @[Array.scala 21:78]
  wire  array_1_0_io_B_in_nan; // @[Array.scala 21:78]
  wire  array_1_0_io_B_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_1_0_io_B_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_1_0_io_B_in_fraction; // @[Array.scala 21:78]
  wire  array_1_0_io_C_in_zero; // @[Array.scala 21:78]
  wire  array_1_0_io_C_in_nan; // @[Array.scala 21:78]
  wire [80:0] array_1_0_io_C_in_number; // @[Array.scala 21:78]
  wire  array_1_0_io_prop_in; // @[Array.scala 21:78]
  wire  array_1_0_io_A_out_zero; // @[Array.scala 21:78]
  wire  array_1_0_io_A_out_nan; // @[Array.scala 21:78]
  wire  array_1_0_io_A_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_1_0_io_A_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_1_0_io_A_out_fraction; // @[Array.scala 21:78]
  wire  array_1_0_io_B_out_zero; // @[Array.scala 21:78]
  wire  array_1_0_io_B_out_nan; // @[Array.scala 21:78]
  wire  array_1_0_io_B_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_1_0_io_B_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_1_0_io_B_out_fraction; // @[Array.scala 21:78]
  wire  array_1_0_io_C_out_zero; // @[Array.scala 21:78]
  wire  array_1_0_io_C_out_nan; // @[Array.scala 21:78]
  wire [80:0] array_1_0_io_C_out_number; // @[Array.scala 21:78]
  wire  array_1_0_io_prop_out; // @[Array.scala 21:78]
  wire  array_1_1_clock; // @[Array.scala 21:78]
  wire  array_1_1_io_A_in_zero; // @[Array.scala 21:78]
  wire  array_1_1_io_A_in_nan; // @[Array.scala 21:78]
  wire  array_1_1_io_A_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_1_1_io_A_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_1_1_io_A_in_fraction; // @[Array.scala 21:78]
  wire  array_1_1_io_B_in_zero; // @[Array.scala 21:78]
  wire  array_1_1_io_B_in_nan; // @[Array.scala 21:78]
  wire  array_1_1_io_B_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_1_1_io_B_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_1_1_io_B_in_fraction; // @[Array.scala 21:78]
  wire  array_1_1_io_C_in_zero; // @[Array.scala 21:78]
  wire  array_1_1_io_C_in_nan; // @[Array.scala 21:78]
  wire [80:0] array_1_1_io_C_in_number; // @[Array.scala 21:78]
  wire  array_1_1_io_prop_in; // @[Array.scala 21:78]
  wire  array_1_1_io_A_out_zero; // @[Array.scala 21:78]
  wire  array_1_1_io_A_out_nan; // @[Array.scala 21:78]
  wire  array_1_1_io_A_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_1_1_io_A_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_1_1_io_A_out_fraction; // @[Array.scala 21:78]
  wire  array_1_1_io_B_out_zero; // @[Array.scala 21:78]
  wire  array_1_1_io_B_out_nan; // @[Array.scala 21:78]
  wire  array_1_1_io_B_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_1_1_io_B_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_1_1_io_B_out_fraction; // @[Array.scala 21:78]
  wire  array_1_1_io_C_out_zero; // @[Array.scala 21:78]
  wire  array_1_1_io_C_out_nan; // @[Array.scala 21:78]
  wire [80:0] array_1_1_io_C_out_number; // @[Array.scala 21:78]
  wire  array_1_1_io_prop_out; // @[Array.scala 21:78]
  wire  array_1_2_clock; // @[Array.scala 21:78]
  wire  array_1_2_io_A_in_zero; // @[Array.scala 21:78]
  wire  array_1_2_io_A_in_nan; // @[Array.scala 21:78]
  wire  array_1_2_io_A_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_1_2_io_A_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_1_2_io_A_in_fraction; // @[Array.scala 21:78]
  wire  array_1_2_io_B_in_zero; // @[Array.scala 21:78]
  wire  array_1_2_io_B_in_nan; // @[Array.scala 21:78]
  wire  array_1_2_io_B_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_1_2_io_B_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_1_2_io_B_in_fraction; // @[Array.scala 21:78]
  wire  array_1_2_io_C_in_zero; // @[Array.scala 21:78]
  wire  array_1_2_io_C_in_nan; // @[Array.scala 21:78]
  wire [80:0] array_1_2_io_C_in_number; // @[Array.scala 21:78]
  wire  array_1_2_io_prop_in; // @[Array.scala 21:78]
  wire  array_1_2_io_A_out_zero; // @[Array.scala 21:78]
  wire  array_1_2_io_A_out_nan; // @[Array.scala 21:78]
  wire  array_1_2_io_A_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_1_2_io_A_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_1_2_io_A_out_fraction; // @[Array.scala 21:78]
  wire  array_1_2_io_B_out_zero; // @[Array.scala 21:78]
  wire  array_1_2_io_B_out_nan; // @[Array.scala 21:78]
  wire  array_1_2_io_B_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_1_2_io_B_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_1_2_io_B_out_fraction; // @[Array.scala 21:78]
  wire  array_1_2_io_C_out_zero; // @[Array.scala 21:78]
  wire  array_1_2_io_C_out_nan; // @[Array.scala 21:78]
  wire [80:0] array_1_2_io_C_out_number; // @[Array.scala 21:78]
  wire  array_1_2_io_prop_out; // @[Array.scala 21:78]
  wire  array_1_3_clock; // @[Array.scala 21:78]
  wire  array_1_3_io_A_in_zero; // @[Array.scala 21:78]
  wire  array_1_3_io_A_in_nan; // @[Array.scala 21:78]
  wire  array_1_3_io_A_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_1_3_io_A_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_1_3_io_A_in_fraction; // @[Array.scala 21:78]
  wire  array_1_3_io_B_in_zero; // @[Array.scala 21:78]
  wire  array_1_3_io_B_in_nan; // @[Array.scala 21:78]
  wire  array_1_3_io_B_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_1_3_io_B_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_1_3_io_B_in_fraction; // @[Array.scala 21:78]
  wire  array_1_3_io_C_in_zero; // @[Array.scala 21:78]
  wire  array_1_3_io_C_in_nan; // @[Array.scala 21:78]
  wire [80:0] array_1_3_io_C_in_number; // @[Array.scala 21:78]
  wire  array_1_3_io_prop_in; // @[Array.scala 21:78]
  wire  array_1_3_io_A_out_zero; // @[Array.scala 21:78]
  wire  array_1_3_io_A_out_nan; // @[Array.scala 21:78]
  wire  array_1_3_io_A_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_1_3_io_A_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_1_3_io_A_out_fraction; // @[Array.scala 21:78]
  wire  array_1_3_io_B_out_zero; // @[Array.scala 21:78]
  wire  array_1_3_io_B_out_nan; // @[Array.scala 21:78]
  wire  array_1_3_io_B_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_1_3_io_B_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_1_3_io_B_out_fraction; // @[Array.scala 21:78]
  wire  array_1_3_io_C_out_zero; // @[Array.scala 21:78]
  wire  array_1_3_io_C_out_nan; // @[Array.scala 21:78]
  wire [80:0] array_1_3_io_C_out_number; // @[Array.scala 21:78]
  wire  array_1_3_io_prop_out; // @[Array.scala 21:78]
  wire  array_2_0_clock; // @[Array.scala 21:78]
  wire  array_2_0_io_A_in_zero; // @[Array.scala 21:78]
  wire  array_2_0_io_A_in_nan; // @[Array.scala 21:78]
  wire  array_2_0_io_A_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_2_0_io_A_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_2_0_io_A_in_fraction; // @[Array.scala 21:78]
  wire  array_2_0_io_B_in_zero; // @[Array.scala 21:78]
  wire  array_2_0_io_B_in_nan; // @[Array.scala 21:78]
  wire  array_2_0_io_B_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_2_0_io_B_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_2_0_io_B_in_fraction; // @[Array.scala 21:78]
  wire  array_2_0_io_C_in_zero; // @[Array.scala 21:78]
  wire  array_2_0_io_C_in_nan; // @[Array.scala 21:78]
  wire [80:0] array_2_0_io_C_in_number; // @[Array.scala 21:78]
  wire  array_2_0_io_prop_in; // @[Array.scala 21:78]
  wire  array_2_0_io_A_out_zero; // @[Array.scala 21:78]
  wire  array_2_0_io_A_out_nan; // @[Array.scala 21:78]
  wire  array_2_0_io_A_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_2_0_io_A_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_2_0_io_A_out_fraction; // @[Array.scala 21:78]
  wire  array_2_0_io_B_out_zero; // @[Array.scala 21:78]
  wire  array_2_0_io_B_out_nan; // @[Array.scala 21:78]
  wire  array_2_0_io_B_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_2_0_io_B_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_2_0_io_B_out_fraction; // @[Array.scala 21:78]
  wire  array_2_0_io_C_out_zero; // @[Array.scala 21:78]
  wire  array_2_0_io_C_out_nan; // @[Array.scala 21:78]
  wire [80:0] array_2_0_io_C_out_number; // @[Array.scala 21:78]
  wire  array_2_0_io_prop_out; // @[Array.scala 21:78]
  wire  array_2_1_clock; // @[Array.scala 21:78]
  wire  array_2_1_io_A_in_zero; // @[Array.scala 21:78]
  wire  array_2_1_io_A_in_nan; // @[Array.scala 21:78]
  wire  array_2_1_io_A_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_2_1_io_A_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_2_1_io_A_in_fraction; // @[Array.scala 21:78]
  wire  array_2_1_io_B_in_zero; // @[Array.scala 21:78]
  wire  array_2_1_io_B_in_nan; // @[Array.scala 21:78]
  wire  array_2_1_io_B_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_2_1_io_B_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_2_1_io_B_in_fraction; // @[Array.scala 21:78]
  wire  array_2_1_io_C_in_zero; // @[Array.scala 21:78]
  wire  array_2_1_io_C_in_nan; // @[Array.scala 21:78]
  wire [80:0] array_2_1_io_C_in_number; // @[Array.scala 21:78]
  wire  array_2_1_io_prop_in; // @[Array.scala 21:78]
  wire  array_2_1_io_A_out_zero; // @[Array.scala 21:78]
  wire  array_2_1_io_A_out_nan; // @[Array.scala 21:78]
  wire  array_2_1_io_A_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_2_1_io_A_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_2_1_io_A_out_fraction; // @[Array.scala 21:78]
  wire  array_2_1_io_B_out_zero; // @[Array.scala 21:78]
  wire  array_2_1_io_B_out_nan; // @[Array.scala 21:78]
  wire  array_2_1_io_B_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_2_1_io_B_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_2_1_io_B_out_fraction; // @[Array.scala 21:78]
  wire  array_2_1_io_C_out_zero; // @[Array.scala 21:78]
  wire  array_2_1_io_C_out_nan; // @[Array.scala 21:78]
  wire [80:0] array_2_1_io_C_out_number; // @[Array.scala 21:78]
  wire  array_2_1_io_prop_out; // @[Array.scala 21:78]
  wire  array_2_2_clock; // @[Array.scala 21:78]
  wire  array_2_2_io_A_in_zero; // @[Array.scala 21:78]
  wire  array_2_2_io_A_in_nan; // @[Array.scala 21:78]
  wire  array_2_2_io_A_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_2_2_io_A_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_2_2_io_A_in_fraction; // @[Array.scala 21:78]
  wire  array_2_2_io_B_in_zero; // @[Array.scala 21:78]
  wire  array_2_2_io_B_in_nan; // @[Array.scala 21:78]
  wire  array_2_2_io_B_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_2_2_io_B_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_2_2_io_B_in_fraction; // @[Array.scala 21:78]
  wire  array_2_2_io_C_in_zero; // @[Array.scala 21:78]
  wire  array_2_2_io_C_in_nan; // @[Array.scala 21:78]
  wire [80:0] array_2_2_io_C_in_number; // @[Array.scala 21:78]
  wire  array_2_2_io_prop_in; // @[Array.scala 21:78]
  wire  array_2_2_io_A_out_zero; // @[Array.scala 21:78]
  wire  array_2_2_io_A_out_nan; // @[Array.scala 21:78]
  wire  array_2_2_io_A_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_2_2_io_A_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_2_2_io_A_out_fraction; // @[Array.scala 21:78]
  wire  array_2_2_io_B_out_zero; // @[Array.scala 21:78]
  wire  array_2_2_io_B_out_nan; // @[Array.scala 21:78]
  wire  array_2_2_io_B_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_2_2_io_B_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_2_2_io_B_out_fraction; // @[Array.scala 21:78]
  wire  array_2_2_io_C_out_zero; // @[Array.scala 21:78]
  wire  array_2_2_io_C_out_nan; // @[Array.scala 21:78]
  wire [80:0] array_2_2_io_C_out_number; // @[Array.scala 21:78]
  wire  array_2_2_io_prop_out; // @[Array.scala 21:78]
  wire  array_2_3_clock; // @[Array.scala 21:78]
  wire  array_2_3_io_A_in_zero; // @[Array.scala 21:78]
  wire  array_2_3_io_A_in_nan; // @[Array.scala 21:78]
  wire  array_2_3_io_A_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_2_3_io_A_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_2_3_io_A_in_fraction; // @[Array.scala 21:78]
  wire  array_2_3_io_B_in_zero; // @[Array.scala 21:78]
  wire  array_2_3_io_B_in_nan; // @[Array.scala 21:78]
  wire  array_2_3_io_B_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_2_3_io_B_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_2_3_io_B_in_fraction; // @[Array.scala 21:78]
  wire  array_2_3_io_C_in_zero; // @[Array.scala 21:78]
  wire  array_2_3_io_C_in_nan; // @[Array.scala 21:78]
  wire [80:0] array_2_3_io_C_in_number; // @[Array.scala 21:78]
  wire  array_2_3_io_prop_in; // @[Array.scala 21:78]
  wire  array_2_3_io_A_out_zero; // @[Array.scala 21:78]
  wire  array_2_3_io_A_out_nan; // @[Array.scala 21:78]
  wire  array_2_3_io_A_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_2_3_io_A_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_2_3_io_A_out_fraction; // @[Array.scala 21:78]
  wire  array_2_3_io_B_out_zero; // @[Array.scala 21:78]
  wire  array_2_3_io_B_out_nan; // @[Array.scala 21:78]
  wire  array_2_3_io_B_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_2_3_io_B_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_2_3_io_B_out_fraction; // @[Array.scala 21:78]
  wire  array_2_3_io_C_out_zero; // @[Array.scala 21:78]
  wire  array_2_3_io_C_out_nan; // @[Array.scala 21:78]
  wire [80:0] array_2_3_io_C_out_number; // @[Array.scala 21:78]
  wire  array_2_3_io_prop_out; // @[Array.scala 21:78]
  wire  array_3_0_clock; // @[Array.scala 21:78]
  wire  array_3_0_io_A_in_zero; // @[Array.scala 21:78]
  wire  array_3_0_io_A_in_nan; // @[Array.scala 21:78]
  wire  array_3_0_io_A_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_3_0_io_A_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_3_0_io_A_in_fraction; // @[Array.scala 21:78]
  wire  array_3_0_io_B_in_zero; // @[Array.scala 21:78]
  wire  array_3_0_io_B_in_nan; // @[Array.scala 21:78]
  wire  array_3_0_io_B_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_3_0_io_B_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_3_0_io_B_in_fraction; // @[Array.scala 21:78]
  wire  array_3_0_io_C_in_zero; // @[Array.scala 21:78]
  wire  array_3_0_io_C_in_nan; // @[Array.scala 21:78]
  wire [80:0] array_3_0_io_C_in_number; // @[Array.scala 21:78]
  wire  array_3_0_io_prop_in; // @[Array.scala 21:78]
  wire  array_3_0_io_A_out_zero; // @[Array.scala 21:78]
  wire  array_3_0_io_A_out_nan; // @[Array.scala 21:78]
  wire  array_3_0_io_A_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_3_0_io_A_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_3_0_io_A_out_fraction; // @[Array.scala 21:78]
  wire  array_3_0_io_B_out_zero; // @[Array.scala 21:78]
  wire  array_3_0_io_B_out_nan; // @[Array.scala 21:78]
  wire  array_3_0_io_B_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_3_0_io_B_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_3_0_io_B_out_fraction; // @[Array.scala 21:78]
  wire  array_3_0_io_C_out_zero; // @[Array.scala 21:78]
  wire  array_3_0_io_C_out_nan; // @[Array.scala 21:78]
  wire [80:0] array_3_0_io_C_out_number; // @[Array.scala 21:78]
  wire  array_3_0_io_prop_out; // @[Array.scala 21:78]
  wire  array_3_1_clock; // @[Array.scala 21:78]
  wire  array_3_1_io_A_in_zero; // @[Array.scala 21:78]
  wire  array_3_1_io_A_in_nan; // @[Array.scala 21:78]
  wire  array_3_1_io_A_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_3_1_io_A_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_3_1_io_A_in_fraction; // @[Array.scala 21:78]
  wire  array_3_1_io_B_in_zero; // @[Array.scala 21:78]
  wire  array_3_1_io_B_in_nan; // @[Array.scala 21:78]
  wire  array_3_1_io_B_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_3_1_io_B_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_3_1_io_B_in_fraction; // @[Array.scala 21:78]
  wire  array_3_1_io_C_in_zero; // @[Array.scala 21:78]
  wire  array_3_1_io_C_in_nan; // @[Array.scala 21:78]
  wire [80:0] array_3_1_io_C_in_number; // @[Array.scala 21:78]
  wire  array_3_1_io_prop_in; // @[Array.scala 21:78]
  wire  array_3_1_io_A_out_zero; // @[Array.scala 21:78]
  wire  array_3_1_io_A_out_nan; // @[Array.scala 21:78]
  wire  array_3_1_io_A_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_3_1_io_A_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_3_1_io_A_out_fraction; // @[Array.scala 21:78]
  wire  array_3_1_io_B_out_zero; // @[Array.scala 21:78]
  wire  array_3_1_io_B_out_nan; // @[Array.scala 21:78]
  wire  array_3_1_io_B_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_3_1_io_B_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_3_1_io_B_out_fraction; // @[Array.scala 21:78]
  wire  array_3_1_io_C_out_zero; // @[Array.scala 21:78]
  wire  array_3_1_io_C_out_nan; // @[Array.scala 21:78]
  wire [80:0] array_3_1_io_C_out_number; // @[Array.scala 21:78]
  wire  array_3_1_io_prop_out; // @[Array.scala 21:78]
  wire  array_3_2_clock; // @[Array.scala 21:78]
  wire  array_3_2_io_A_in_zero; // @[Array.scala 21:78]
  wire  array_3_2_io_A_in_nan; // @[Array.scala 21:78]
  wire  array_3_2_io_A_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_3_2_io_A_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_3_2_io_A_in_fraction; // @[Array.scala 21:78]
  wire  array_3_2_io_B_in_zero; // @[Array.scala 21:78]
  wire  array_3_2_io_B_in_nan; // @[Array.scala 21:78]
  wire  array_3_2_io_B_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_3_2_io_B_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_3_2_io_B_in_fraction; // @[Array.scala 21:78]
  wire  array_3_2_io_C_in_zero; // @[Array.scala 21:78]
  wire  array_3_2_io_C_in_nan; // @[Array.scala 21:78]
  wire [80:0] array_3_2_io_C_in_number; // @[Array.scala 21:78]
  wire  array_3_2_io_prop_in; // @[Array.scala 21:78]
  wire  array_3_2_io_A_out_zero; // @[Array.scala 21:78]
  wire  array_3_2_io_A_out_nan; // @[Array.scala 21:78]
  wire  array_3_2_io_A_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_3_2_io_A_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_3_2_io_A_out_fraction; // @[Array.scala 21:78]
  wire  array_3_2_io_B_out_zero; // @[Array.scala 21:78]
  wire  array_3_2_io_B_out_nan; // @[Array.scala 21:78]
  wire  array_3_2_io_B_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_3_2_io_B_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_3_2_io_B_out_fraction; // @[Array.scala 21:78]
  wire  array_3_2_io_C_out_zero; // @[Array.scala 21:78]
  wire  array_3_2_io_C_out_nan; // @[Array.scala 21:78]
  wire [80:0] array_3_2_io_C_out_number; // @[Array.scala 21:78]
  wire  array_3_2_io_prop_out; // @[Array.scala 21:78]
  wire  array_3_3_clock; // @[Array.scala 21:78]
  wire  array_3_3_io_A_in_zero; // @[Array.scala 21:78]
  wire  array_3_3_io_A_in_nan; // @[Array.scala 21:78]
  wire  array_3_3_io_A_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_3_3_io_A_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_3_3_io_A_in_fraction; // @[Array.scala 21:78]
  wire  array_3_3_io_B_in_zero; // @[Array.scala 21:78]
  wire  array_3_3_io_B_in_nan; // @[Array.scala 21:78]
  wire  array_3_3_io_B_in_sign; // @[Array.scala 21:78]
  wire [5:0] array_3_3_io_B_in_exponent; // @[Array.scala 21:78]
  wire [10:0] array_3_3_io_B_in_fraction; // @[Array.scala 21:78]
  wire  array_3_3_io_C_in_zero; // @[Array.scala 21:78]
  wire  array_3_3_io_C_in_nan; // @[Array.scala 21:78]
  wire [80:0] array_3_3_io_C_in_number; // @[Array.scala 21:78]
  wire  array_3_3_io_prop_in; // @[Array.scala 21:78]
  wire  array_3_3_io_A_out_zero; // @[Array.scala 21:78]
  wire  array_3_3_io_A_out_nan; // @[Array.scala 21:78]
  wire  array_3_3_io_A_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_3_3_io_A_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_3_3_io_A_out_fraction; // @[Array.scala 21:78]
  wire  array_3_3_io_B_out_zero; // @[Array.scala 21:78]
  wire  array_3_3_io_B_out_nan; // @[Array.scala 21:78]
  wire  array_3_3_io_B_out_sign; // @[Array.scala 21:78]
  wire [5:0] array_3_3_io_B_out_exponent; // @[Array.scala 21:78]
  wire [10:0] array_3_3_io_B_out_fraction; // @[Array.scala 21:78]
  wire  array_3_3_io_C_out_zero; // @[Array.scala 21:78]
  wire  array_3_3_io_C_out_nan; // @[Array.scala 21:78]
  wire [80:0] array_3_3_io_C_out_number; // @[Array.scala 21:78]
  wire  array_3_3_io_prop_out; // @[Array.scala 21:78]
  wire [15:0] A_convert_0_io_in; // @[Array.scala 24:84]
  wire  A_convert_0_io_out_zero; // @[Array.scala 24:84]
  wire  A_convert_0_io_out_nan; // @[Array.scala 24:84]
  wire  A_convert_0_io_out_sign; // @[Array.scala 24:84]
  wire [5:0] A_convert_0_io_out_exponent; // @[Array.scala 24:84]
  wire [10:0] A_convert_0_io_out_fraction; // @[Array.scala 24:84]
  wire [15:0] A_convert_1_io_in; // @[Array.scala 24:84]
  wire  A_convert_1_io_out_zero; // @[Array.scala 24:84]
  wire  A_convert_1_io_out_nan; // @[Array.scala 24:84]
  wire  A_convert_1_io_out_sign; // @[Array.scala 24:84]
  wire [5:0] A_convert_1_io_out_exponent; // @[Array.scala 24:84]
  wire [10:0] A_convert_1_io_out_fraction; // @[Array.scala 24:84]
  wire [15:0] A_convert_2_io_in; // @[Array.scala 24:84]
  wire  A_convert_2_io_out_zero; // @[Array.scala 24:84]
  wire  A_convert_2_io_out_nan; // @[Array.scala 24:84]
  wire  A_convert_2_io_out_sign; // @[Array.scala 24:84]
  wire [5:0] A_convert_2_io_out_exponent; // @[Array.scala 24:84]
  wire [10:0] A_convert_2_io_out_fraction; // @[Array.scala 24:84]
  wire [15:0] A_convert_3_io_in; // @[Array.scala 24:84]
  wire  A_convert_3_io_out_zero; // @[Array.scala 24:84]
  wire  A_convert_3_io_out_nan; // @[Array.scala 24:84]
  wire  A_convert_3_io_out_sign; // @[Array.scala 24:84]
  wire [5:0] A_convert_3_io_out_exponent; // @[Array.scala 24:84]
  wire [10:0] A_convert_3_io_out_fraction; // @[Array.scala 24:84]
  wire [15:0] B_convert_0_io_in; // @[Array.scala 25:84]
  wire  B_convert_0_io_out_zero; // @[Array.scala 25:84]
  wire  B_convert_0_io_out_nan; // @[Array.scala 25:84]
  wire  B_convert_0_io_out_sign; // @[Array.scala 25:84]
  wire [5:0] B_convert_0_io_out_exponent; // @[Array.scala 25:84]
  wire [10:0] B_convert_0_io_out_fraction; // @[Array.scala 25:84]
  wire [15:0] B_convert_1_io_in; // @[Array.scala 25:84]
  wire  B_convert_1_io_out_zero; // @[Array.scala 25:84]
  wire  B_convert_1_io_out_nan; // @[Array.scala 25:84]
  wire  B_convert_1_io_out_sign; // @[Array.scala 25:84]
  wire [5:0] B_convert_1_io_out_exponent; // @[Array.scala 25:84]
  wire [10:0] B_convert_1_io_out_fraction; // @[Array.scala 25:84]
  wire [15:0] B_convert_2_io_in; // @[Array.scala 25:84]
  wire  B_convert_2_io_out_zero; // @[Array.scala 25:84]
  wire  B_convert_2_io_out_nan; // @[Array.scala 25:84]
  wire  B_convert_2_io_out_sign; // @[Array.scala 25:84]
  wire [5:0] B_convert_2_io_out_exponent; // @[Array.scala 25:84]
  wire [10:0] B_convert_2_io_out_fraction; // @[Array.scala 25:84]
  wire [15:0] B_convert_3_io_in; // @[Array.scala 25:84]
  wire  B_convert_3_io_out_zero; // @[Array.scala 25:84]
  wire  B_convert_3_io_out_nan; // @[Array.scala 25:84]
  wire  B_convert_3_io_out_sign; // @[Array.scala 25:84]
  wire [5:0] B_convert_3_io_out_exponent; // @[Array.scala 25:84]
  wire [10:0] B_convert_3_io_out_fraction; // @[Array.scala 25:84]
  linearTile array_0_0 ( // @[Array.scala 21:78]
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
  linearTile array_0_1 ( // @[Array.scala 21:78]
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
  linearTile array_0_2 ( // @[Array.scala 21:78]
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
  linearTile array_0_3 ( // @[Array.scala 21:78]
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
  linearTile array_1_0 ( // @[Array.scala 21:78]
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
  linearTile array_1_1 ( // @[Array.scala 21:78]
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
  linearTile array_1_2 ( // @[Array.scala 21:78]
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
  linearTile array_1_3 ( // @[Array.scala 21:78]
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
  linearTile array_2_0 ( // @[Array.scala 21:78]
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
  linearTile array_2_1 ( // @[Array.scala 21:78]
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
  linearTile array_2_2 ( // @[Array.scala 21:78]
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
  linearTile array_2_3 ( // @[Array.scala 21:78]
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
  linearTile array_3_0 ( // @[Array.scala 21:78]
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
  linearTile array_3_1 ( // @[Array.scala 21:78]
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
  linearTile array_3_2 ( // @[Array.scala 21:78]
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
  linearTile array_3_3 ( // @[Array.scala 21:78]
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
  toFloatingPointUnpacked A_convert_0 ( // @[Array.scala 24:84]
    .io_in(A_convert_0_io_in),
    .io_out_zero(A_convert_0_io_out_zero),
    .io_out_nan(A_convert_0_io_out_nan),
    .io_out_sign(A_convert_0_io_out_sign),
    .io_out_exponent(A_convert_0_io_out_exponent),
    .io_out_fraction(A_convert_0_io_out_fraction)
  );
  toFloatingPointUnpacked A_convert_1 ( // @[Array.scala 24:84]
    .io_in(A_convert_1_io_in),
    .io_out_zero(A_convert_1_io_out_zero),
    .io_out_nan(A_convert_1_io_out_nan),
    .io_out_sign(A_convert_1_io_out_sign),
    .io_out_exponent(A_convert_1_io_out_exponent),
    .io_out_fraction(A_convert_1_io_out_fraction)
  );
  toFloatingPointUnpacked A_convert_2 ( // @[Array.scala 24:84]
    .io_in(A_convert_2_io_in),
    .io_out_zero(A_convert_2_io_out_zero),
    .io_out_nan(A_convert_2_io_out_nan),
    .io_out_sign(A_convert_2_io_out_sign),
    .io_out_exponent(A_convert_2_io_out_exponent),
    .io_out_fraction(A_convert_2_io_out_fraction)
  );
  toFloatingPointUnpacked A_convert_3 ( // @[Array.scala 24:84]
    .io_in(A_convert_3_io_in),
    .io_out_zero(A_convert_3_io_out_zero),
    .io_out_nan(A_convert_3_io_out_nan),
    .io_out_sign(A_convert_3_io_out_sign),
    .io_out_exponent(A_convert_3_io_out_exponent),
    .io_out_fraction(A_convert_3_io_out_fraction)
  );
  toFloatingPointUnpacked B_convert_0 ( // @[Array.scala 25:84]
    .io_in(B_convert_0_io_in),
    .io_out_zero(B_convert_0_io_out_zero),
    .io_out_nan(B_convert_0_io_out_nan),
    .io_out_sign(B_convert_0_io_out_sign),
    .io_out_exponent(B_convert_0_io_out_exponent),
    .io_out_fraction(B_convert_0_io_out_fraction)
  );
  toFloatingPointUnpacked B_convert_1 ( // @[Array.scala 25:84]
    .io_in(B_convert_1_io_in),
    .io_out_zero(B_convert_1_io_out_zero),
    .io_out_nan(B_convert_1_io_out_nan),
    .io_out_sign(B_convert_1_io_out_sign),
    .io_out_exponent(B_convert_1_io_out_exponent),
    .io_out_fraction(B_convert_1_io_out_fraction)
  );
  toFloatingPointUnpacked B_convert_2 ( // @[Array.scala 25:84]
    .io_in(B_convert_2_io_in),
    .io_out_zero(B_convert_2_io_out_zero),
    .io_out_nan(B_convert_2_io_out_nan),
    .io_out_sign(B_convert_2_io_out_sign),
    .io_out_exponent(B_convert_2_io_out_exponent),
    .io_out_fraction(B_convert_2_io_out_fraction)
  );
  toFloatingPointUnpacked B_convert_3 ( // @[Array.scala 25:84]
    .io_in(B_convert_3_io_in),
    .io_out_zero(B_convert_3_io_out_zero),
    .io_out_nan(B_convert_3_io_out_nan),
    .io_out_sign(B_convert_3_io_out_sign),
    .io_out_exponent(B_convert_3_io_out_exponent),
    .io_out_fraction(B_convert_3_io_out_fraction)
  );
  assign io_C_out_0_zero = array_3_0_io_C_out_zero; // @[Array.scala 37:37]
  assign io_C_out_0_nan = array_3_0_io_C_out_nan; // @[Array.scala 37:37]
  assign io_C_out_0_number = array_3_0_io_C_out_number; // @[Array.scala 37:37]
  assign io_C_out_1_zero = array_3_1_io_C_out_zero; // @[Array.scala 37:37]
  assign io_C_out_1_nan = array_3_1_io_C_out_nan; // @[Array.scala 37:37]
  assign io_C_out_1_number = array_3_1_io_C_out_number; // @[Array.scala 37:37]
  assign io_C_out_2_zero = array_3_2_io_C_out_zero; // @[Array.scala 37:37]
  assign io_C_out_2_nan = array_3_2_io_C_out_nan; // @[Array.scala 37:37]
  assign io_C_out_2_number = array_3_2_io_C_out_number; // @[Array.scala 37:37]
  assign io_C_out_3_zero = array_3_3_io_C_out_zero; // @[Array.scala 37:37]
  assign io_C_out_3_nan = array_3_3_io_C_out_nan; // @[Array.scala 37:37]
  assign io_C_out_3_number = array_3_3_io_C_out_number; // @[Array.scala 37:37]
  assign array_0_0_clock = clock;
  assign array_0_0_io_A_in_zero = A_convert_0_io_out_zero; // @[Array.scala 29:45]
  assign array_0_0_io_A_in_nan = A_convert_0_io_out_nan; // @[Array.scala 29:45]
  assign array_0_0_io_A_in_sign = A_convert_0_io_out_sign; // @[Array.scala 29:45]
  assign array_0_0_io_A_in_exponent = A_convert_0_io_out_exponent; // @[Array.scala 29:45]
  assign array_0_0_io_A_in_fraction = A_convert_0_io_out_fraction; // @[Array.scala 29:45]
  assign array_0_0_io_B_in_zero = B_convert_0_io_out_zero; // @[Array.scala 42:45]
  assign array_0_0_io_B_in_nan = B_convert_0_io_out_nan; // @[Array.scala 42:45]
  assign array_0_0_io_B_in_sign = B_convert_0_io_out_sign; // @[Array.scala 42:45]
  assign array_0_0_io_B_in_exponent = B_convert_0_io_out_exponent; // @[Array.scala 42:45]
  assign array_0_0_io_B_in_fraction = B_convert_0_io_out_fraction; // @[Array.scala 42:45]
  assign array_0_0_io_C_in_zero = io_C_in_0_zero; // @[Array.scala 30:45]
  assign array_0_0_io_C_in_nan = io_C_in_0_nan; // @[Array.scala 30:45]
  assign array_0_0_io_C_in_number = io_C_in_0_number; // @[Array.scala 30:45]
  assign array_0_0_io_prop_in = io_prop_in_0; // @[Array.scala 31:48]
  assign array_0_1_clock = clock;
  assign array_0_1_io_A_in_zero = A_convert_1_io_out_zero; // @[Array.scala 29:45]
  assign array_0_1_io_A_in_nan = A_convert_1_io_out_nan; // @[Array.scala 29:45]
  assign array_0_1_io_A_in_sign = A_convert_1_io_out_sign; // @[Array.scala 29:45]
  assign array_0_1_io_A_in_exponent = A_convert_1_io_out_exponent; // @[Array.scala 29:45]
  assign array_0_1_io_A_in_fraction = A_convert_1_io_out_fraction; // @[Array.scala 29:45]
  assign array_0_1_io_B_in_zero = array_0_0_io_B_out_zero; // @[Array.scala 44:53]
  assign array_0_1_io_B_in_nan = array_0_0_io_B_out_nan; // @[Array.scala 44:53]
  assign array_0_1_io_B_in_sign = array_0_0_io_B_out_sign; // @[Array.scala 44:53]
  assign array_0_1_io_B_in_exponent = array_0_0_io_B_out_exponent; // @[Array.scala 44:53]
  assign array_0_1_io_B_in_fraction = array_0_0_io_B_out_fraction; // @[Array.scala 44:53]
  assign array_0_1_io_C_in_zero = io_C_in_1_zero; // @[Array.scala 30:45]
  assign array_0_1_io_C_in_nan = io_C_in_1_nan; // @[Array.scala 30:45]
  assign array_0_1_io_C_in_number = io_C_in_1_number; // @[Array.scala 30:45]
  assign array_0_1_io_prop_in = io_prop_in_1; // @[Array.scala 31:48]
  assign array_0_2_clock = clock;
  assign array_0_2_io_A_in_zero = A_convert_2_io_out_zero; // @[Array.scala 29:45]
  assign array_0_2_io_A_in_nan = A_convert_2_io_out_nan; // @[Array.scala 29:45]
  assign array_0_2_io_A_in_sign = A_convert_2_io_out_sign; // @[Array.scala 29:45]
  assign array_0_2_io_A_in_exponent = A_convert_2_io_out_exponent; // @[Array.scala 29:45]
  assign array_0_2_io_A_in_fraction = A_convert_2_io_out_fraction; // @[Array.scala 29:45]
  assign array_0_2_io_B_in_zero = array_0_1_io_B_out_zero; // @[Array.scala 44:53]
  assign array_0_2_io_B_in_nan = array_0_1_io_B_out_nan; // @[Array.scala 44:53]
  assign array_0_2_io_B_in_sign = array_0_1_io_B_out_sign; // @[Array.scala 44:53]
  assign array_0_2_io_B_in_exponent = array_0_1_io_B_out_exponent; // @[Array.scala 44:53]
  assign array_0_2_io_B_in_fraction = array_0_1_io_B_out_fraction; // @[Array.scala 44:53]
  assign array_0_2_io_C_in_zero = io_C_in_2_zero; // @[Array.scala 30:45]
  assign array_0_2_io_C_in_nan = io_C_in_2_nan; // @[Array.scala 30:45]
  assign array_0_2_io_C_in_number = io_C_in_2_number; // @[Array.scala 30:45]
  assign array_0_2_io_prop_in = io_prop_in_2; // @[Array.scala 31:48]
  assign array_0_3_clock = clock;
  assign array_0_3_io_A_in_zero = A_convert_3_io_out_zero; // @[Array.scala 29:45]
  assign array_0_3_io_A_in_nan = A_convert_3_io_out_nan; // @[Array.scala 29:45]
  assign array_0_3_io_A_in_sign = A_convert_3_io_out_sign; // @[Array.scala 29:45]
  assign array_0_3_io_A_in_exponent = A_convert_3_io_out_exponent; // @[Array.scala 29:45]
  assign array_0_3_io_A_in_fraction = A_convert_3_io_out_fraction; // @[Array.scala 29:45]
  assign array_0_3_io_B_in_zero = array_0_2_io_B_out_zero; // @[Array.scala 44:53]
  assign array_0_3_io_B_in_nan = array_0_2_io_B_out_nan; // @[Array.scala 44:53]
  assign array_0_3_io_B_in_sign = array_0_2_io_B_out_sign; // @[Array.scala 44:53]
  assign array_0_3_io_B_in_exponent = array_0_2_io_B_out_exponent; // @[Array.scala 44:53]
  assign array_0_3_io_B_in_fraction = array_0_2_io_B_out_fraction; // @[Array.scala 44:53]
  assign array_0_3_io_C_in_zero = io_C_in_3_zero; // @[Array.scala 30:45]
  assign array_0_3_io_C_in_nan = io_C_in_3_nan; // @[Array.scala 30:45]
  assign array_0_3_io_C_in_number = io_C_in_3_number; // @[Array.scala 30:45]
  assign array_0_3_io_prop_in = io_prop_in_3; // @[Array.scala 31:48]
  assign array_1_0_clock = clock;
  assign array_1_0_io_A_in_zero = array_0_0_io_A_out_zero; // @[Array.scala 33:53]
  assign array_1_0_io_A_in_nan = array_0_0_io_A_out_nan; // @[Array.scala 33:53]
  assign array_1_0_io_A_in_sign = array_0_0_io_A_out_sign; // @[Array.scala 33:53]
  assign array_1_0_io_A_in_exponent = array_0_0_io_A_out_exponent; // @[Array.scala 33:53]
  assign array_1_0_io_A_in_fraction = array_0_0_io_A_out_fraction; // @[Array.scala 33:53]
  assign array_1_0_io_B_in_zero = B_convert_1_io_out_zero; // @[Array.scala 42:45]
  assign array_1_0_io_B_in_nan = B_convert_1_io_out_nan; // @[Array.scala 42:45]
  assign array_1_0_io_B_in_sign = B_convert_1_io_out_sign; // @[Array.scala 42:45]
  assign array_1_0_io_B_in_exponent = B_convert_1_io_out_exponent; // @[Array.scala 42:45]
  assign array_1_0_io_B_in_fraction = B_convert_1_io_out_fraction; // @[Array.scala 42:45]
  assign array_1_0_io_C_in_zero = array_0_0_io_C_out_zero; // @[Array.scala 34:53]
  assign array_1_0_io_C_in_nan = array_0_0_io_C_out_nan; // @[Array.scala 34:53]
  assign array_1_0_io_C_in_number = array_0_0_io_C_out_number; // @[Array.scala 34:53]
  assign array_1_0_io_prop_in = array_0_0_io_prop_out; // @[Array.scala 35:56]
  assign array_1_1_clock = clock;
  assign array_1_1_io_A_in_zero = array_0_1_io_A_out_zero; // @[Array.scala 33:53]
  assign array_1_1_io_A_in_nan = array_0_1_io_A_out_nan; // @[Array.scala 33:53]
  assign array_1_1_io_A_in_sign = array_0_1_io_A_out_sign; // @[Array.scala 33:53]
  assign array_1_1_io_A_in_exponent = array_0_1_io_A_out_exponent; // @[Array.scala 33:53]
  assign array_1_1_io_A_in_fraction = array_0_1_io_A_out_fraction; // @[Array.scala 33:53]
  assign array_1_1_io_B_in_zero = array_1_0_io_B_out_zero; // @[Array.scala 44:53]
  assign array_1_1_io_B_in_nan = array_1_0_io_B_out_nan; // @[Array.scala 44:53]
  assign array_1_1_io_B_in_sign = array_1_0_io_B_out_sign; // @[Array.scala 44:53]
  assign array_1_1_io_B_in_exponent = array_1_0_io_B_out_exponent; // @[Array.scala 44:53]
  assign array_1_1_io_B_in_fraction = array_1_0_io_B_out_fraction; // @[Array.scala 44:53]
  assign array_1_1_io_C_in_zero = array_0_1_io_C_out_zero; // @[Array.scala 34:53]
  assign array_1_1_io_C_in_nan = array_0_1_io_C_out_nan; // @[Array.scala 34:53]
  assign array_1_1_io_C_in_number = array_0_1_io_C_out_number; // @[Array.scala 34:53]
  assign array_1_1_io_prop_in = array_0_1_io_prop_out; // @[Array.scala 35:56]
  assign array_1_2_clock = clock;
  assign array_1_2_io_A_in_zero = array_0_2_io_A_out_zero; // @[Array.scala 33:53]
  assign array_1_2_io_A_in_nan = array_0_2_io_A_out_nan; // @[Array.scala 33:53]
  assign array_1_2_io_A_in_sign = array_0_2_io_A_out_sign; // @[Array.scala 33:53]
  assign array_1_2_io_A_in_exponent = array_0_2_io_A_out_exponent; // @[Array.scala 33:53]
  assign array_1_2_io_A_in_fraction = array_0_2_io_A_out_fraction; // @[Array.scala 33:53]
  assign array_1_2_io_B_in_zero = array_1_1_io_B_out_zero; // @[Array.scala 44:53]
  assign array_1_2_io_B_in_nan = array_1_1_io_B_out_nan; // @[Array.scala 44:53]
  assign array_1_2_io_B_in_sign = array_1_1_io_B_out_sign; // @[Array.scala 44:53]
  assign array_1_2_io_B_in_exponent = array_1_1_io_B_out_exponent; // @[Array.scala 44:53]
  assign array_1_2_io_B_in_fraction = array_1_1_io_B_out_fraction; // @[Array.scala 44:53]
  assign array_1_2_io_C_in_zero = array_0_2_io_C_out_zero; // @[Array.scala 34:53]
  assign array_1_2_io_C_in_nan = array_0_2_io_C_out_nan; // @[Array.scala 34:53]
  assign array_1_2_io_C_in_number = array_0_2_io_C_out_number; // @[Array.scala 34:53]
  assign array_1_2_io_prop_in = array_0_2_io_prop_out; // @[Array.scala 35:56]
  assign array_1_3_clock = clock;
  assign array_1_3_io_A_in_zero = array_0_3_io_A_out_zero; // @[Array.scala 33:53]
  assign array_1_3_io_A_in_nan = array_0_3_io_A_out_nan; // @[Array.scala 33:53]
  assign array_1_3_io_A_in_sign = array_0_3_io_A_out_sign; // @[Array.scala 33:53]
  assign array_1_3_io_A_in_exponent = array_0_3_io_A_out_exponent; // @[Array.scala 33:53]
  assign array_1_3_io_A_in_fraction = array_0_3_io_A_out_fraction; // @[Array.scala 33:53]
  assign array_1_3_io_B_in_zero = array_1_2_io_B_out_zero; // @[Array.scala 44:53]
  assign array_1_3_io_B_in_nan = array_1_2_io_B_out_nan; // @[Array.scala 44:53]
  assign array_1_3_io_B_in_sign = array_1_2_io_B_out_sign; // @[Array.scala 44:53]
  assign array_1_3_io_B_in_exponent = array_1_2_io_B_out_exponent; // @[Array.scala 44:53]
  assign array_1_3_io_B_in_fraction = array_1_2_io_B_out_fraction; // @[Array.scala 44:53]
  assign array_1_3_io_C_in_zero = array_0_3_io_C_out_zero; // @[Array.scala 34:53]
  assign array_1_3_io_C_in_nan = array_0_3_io_C_out_nan; // @[Array.scala 34:53]
  assign array_1_3_io_C_in_number = array_0_3_io_C_out_number; // @[Array.scala 34:53]
  assign array_1_3_io_prop_in = array_0_3_io_prop_out; // @[Array.scala 35:56]
  assign array_2_0_clock = clock;
  assign array_2_0_io_A_in_zero = array_1_0_io_A_out_zero; // @[Array.scala 33:53]
  assign array_2_0_io_A_in_nan = array_1_0_io_A_out_nan; // @[Array.scala 33:53]
  assign array_2_0_io_A_in_sign = array_1_0_io_A_out_sign; // @[Array.scala 33:53]
  assign array_2_0_io_A_in_exponent = array_1_0_io_A_out_exponent; // @[Array.scala 33:53]
  assign array_2_0_io_A_in_fraction = array_1_0_io_A_out_fraction; // @[Array.scala 33:53]
  assign array_2_0_io_B_in_zero = B_convert_2_io_out_zero; // @[Array.scala 42:45]
  assign array_2_0_io_B_in_nan = B_convert_2_io_out_nan; // @[Array.scala 42:45]
  assign array_2_0_io_B_in_sign = B_convert_2_io_out_sign; // @[Array.scala 42:45]
  assign array_2_0_io_B_in_exponent = B_convert_2_io_out_exponent; // @[Array.scala 42:45]
  assign array_2_0_io_B_in_fraction = B_convert_2_io_out_fraction; // @[Array.scala 42:45]
  assign array_2_0_io_C_in_zero = array_1_0_io_C_out_zero; // @[Array.scala 34:53]
  assign array_2_0_io_C_in_nan = array_1_0_io_C_out_nan; // @[Array.scala 34:53]
  assign array_2_0_io_C_in_number = array_1_0_io_C_out_number; // @[Array.scala 34:53]
  assign array_2_0_io_prop_in = array_1_0_io_prop_out; // @[Array.scala 35:56]
  assign array_2_1_clock = clock;
  assign array_2_1_io_A_in_zero = array_1_1_io_A_out_zero; // @[Array.scala 33:53]
  assign array_2_1_io_A_in_nan = array_1_1_io_A_out_nan; // @[Array.scala 33:53]
  assign array_2_1_io_A_in_sign = array_1_1_io_A_out_sign; // @[Array.scala 33:53]
  assign array_2_1_io_A_in_exponent = array_1_1_io_A_out_exponent; // @[Array.scala 33:53]
  assign array_2_1_io_A_in_fraction = array_1_1_io_A_out_fraction; // @[Array.scala 33:53]
  assign array_2_1_io_B_in_zero = array_2_0_io_B_out_zero; // @[Array.scala 44:53]
  assign array_2_1_io_B_in_nan = array_2_0_io_B_out_nan; // @[Array.scala 44:53]
  assign array_2_1_io_B_in_sign = array_2_0_io_B_out_sign; // @[Array.scala 44:53]
  assign array_2_1_io_B_in_exponent = array_2_0_io_B_out_exponent; // @[Array.scala 44:53]
  assign array_2_1_io_B_in_fraction = array_2_0_io_B_out_fraction; // @[Array.scala 44:53]
  assign array_2_1_io_C_in_zero = array_1_1_io_C_out_zero; // @[Array.scala 34:53]
  assign array_2_1_io_C_in_nan = array_1_1_io_C_out_nan; // @[Array.scala 34:53]
  assign array_2_1_io_C_in_number = array_1_1_io_C_out_number; // @[Array.scala 34:53]
  assign array_2_1_io_prop_in = array_1_1_io_prop_out; // @[Array.scala 35:56]
  assign array_2_2_clock = clock;
  assign array_2_2_io_A_in_zero = array_1_2_io_A_out_zero; // @[Array.scala 33:53]
  assign array_2_2_io_A_in_nan = array_1_2_io_A_out_nan; // @[Array.scala 33:53]
  assign array_2_2_io_A_in_sign = array_1_2_io_A_out_sign; // @[Array.scala 33:53]
  assign array_2_2_io_A_in_exponent = array_1_2_io_A_out_exponent; // @[Array.scala 33:53]
  assign array_2_2_io_A_in_fraction = array_1_2_io_A_out_fraction; // @[Array.scala 33:53]
  assign array_2_2_io_B_in_zero = array_2_1_io_B_out_zero; // @[Array.scala 44:53]
  assign array_2_2_io_B_in_nan = array_2_1_io_B_out_nan; // @[Array.scala 44:53]
  assign array_2_2_io_B_in_sign = array_2_1_io_B_out_sign; // @[Array.scala 44:53]
  assign array_2_2_io_B_in_exponent = array_2_1_io_B_out_exponent; // @[Array.scala 44:53]
  assign array_2_2_io_B_in_fraction = array_2_1_io_B_out_fraction; // @[Array.scala 44:53]
  assign array_2_2_io_C_in_zero = array_1_2_io_C_out_zero; // @[Array.scala 34:53]
  assign array_2_2_io_C_in_nan = array_1_2_io_C_out_nan; // @[Array.scala 34:53]
  assign array_2_2_io_C_in_number = array_1_2_io_C_out_number; // @[Array.scala 34:53]
  assign array_2_2_io_prop_in = array_1_2_io_prop_out; // @[Array.scala 35:56]
  assign array_2_3_clock = clock;
  assign array_2_3_io_A_in_zero = array_1_3_io_A_out_zero; // @[Array.scala 33:53]
  assign array_2_3_io_A_in_nan = array_1_3_io_A_out_nan; // @[Array.scala 33:53]
  assign array_2_3_io_A_in_sign = array_1_3_io_A_out_sign; // @[Array.scala 33:53]
  assign array_2_3_io_A_in_exponent = array_1_3_io_A_out_exponent; // @[Array.scala 33:53]
  assign array_2_3_io_A_in_fraction = array_1_3_io_A_out_fraction; // @[Array.scala 33:53]
  assign array_2_3_io_B_in_zero = array_2_2_io_B_out_zero; // @[Array.scala 44:53]
  assign array_2_3_io_B_in_nan = array_2_2_io_B_out_nan; // @[Array.scala 44:53]
  assign array_2_3_io_B_in_sign = array_2_2_io_B_out_sign; // @[Array.scala 44:53]
  assign array_2_3_io_B_in_exponent = array_2_2_io_B_out_exponent; // @[Array.scala 44:53]
  assign array_2_3_io_B_in_fraction = array_2_2_io_B_out_fraction; // @[Array.scala 44:53]
  assign array_2_3_io_C_in_zero = array_1_3_io_C_out_zero; // @[Array.scala 34:53]
  assign array_2_3_io_C_in_nan = array_1_3_io_C_out_nan; // @[Array.scala 34:53]
  assign array_2_3_io_C_in_number = array_1_3_io_C_out_number; // @[Array.scala 34:53]
  assign array_2_3_io_prop_in = array_1_3_io_prop_out; // @[Array.scala 35:56]
  assign array_3_0_clock = clock;
  assign array_3_0_io_A_in_zero = array_2_0_io_A_out_zero; // @[Array.scala 33:53]
  assign array_3_0_io_A_in_nan = array_2_0_io_A_out_nan; // @[Array.scala 33:53]
  assign array_3_0_io_A_in_sign = array_2_0_io_A_out_sign; // @[Array.scala 33:53]
  assign array_3_0_io_A_in_exponent = array_2_0_io_A_out_exponent; // @[Array.scala 33:53]
  assign array_3_0_io_A_in_fraction = array_2_0_io_A_out_fraction; // @[Array.scala 33:53]
  assign array_3_0_io_B_in_zero = B_convert_3_io_out_zero; // @[Array.scala 42:45]
  assign array_3_0_io_B_in_nan = B_convert_3_io_out_nan; // @[Array.scala 42:45]
  assign array_3_0_io_B_in_sign = B_convert_3_io_out_sign; // @[Array.scala 42:45]
  assign array_3_0_io_B_in_exponent = B_convert_3_io_out_exponent; // @[Array.scala 42:45]
  assign array_3_0_io_B_in_fraction = B_convert_3_io_out_fraction; // @[Array.scala 42:45]
  assign array_3_0_io_C_in_zero = array_2_0_io_C_out_zero; // @[Array.scala 34:53]
  assign array_3_0_io_C_in_nan = array_2_0_io_C_out_nan; // @[Array.scala 34:53]
  assign array_3_0_io_C_in_number = array_2_0_io_C_out_number; // @[Array.scala 34:53]
  assign array_3_0_io_prop_in = array_2_0_io_prop_out; // @[Array.scala 35:56]
  assign array_3_1_clock = clock;
  assign array_3_1_io_A_in_zero = array_2_1_io_A_out_zero; // @[Array.scala 33:53]
  assign array_3_1_io_A_in_nan = array_2_1_io_A_out_nan; // @[Array.scala 33:53]
  assign array_3_1_io_A_in_sign = array_2_1_io_A_out_sign; // @[Array.scala 33:53]
  assign array_3_1_io_A_in_exponent = array_2_1_io_A_out_exponent; // @[Array.scala 33:53]
  assign array_3_1_io_A_in_fraction = array_2_1_io_A_out_fraction; // @[Array.scala 33:53]
  assign array_3_1_io_B_in_zero = array_3_0_io_B_out_zero; // @[Array.scala 44:53]
  assign array_3_1_io_B_in_nan = array_3_0_io_B_out_nan; // @[Array.scala 44:53]
  assign array_3_1_io_B_in_sign = array_3_0_io_B_out_sign; // @[Array.scala 44:53]
  assign array_3_1_io_B_in_exponent = array_3_0_io_B_out_exponent; // @[Array.scala 44:53]
  assign array_3_1_io_B_in_fraction = array_3_0_io_B_out_fraction; // @[Array.scala 44:53]
  assign array_3_1_io_C_in_zero = array_2_1_io_C_out_zero; // @[Array.scala 34:53]
  assign array_3_1_io_C_in_nan = array_2_1_io_C_out_nan; // @[Array.scala 34:53]
  assign array_3_1_io_C_in_number = array_2_1_io_C_out_number; // @[Array.scala 34:53]
  assign array_3_1_io_prop_in = array_2_1_io_prop_out; // @[Array.scala 35:56]
  assign array_3_2_clock = clock;
  assign array_3_2_io_A_in_zero = array_2_2_io_A_out_zero; // @[Array.scala 33:53]
  assign array_3_2_io_A_in_nan = array_2_2_io_A_out_nan; // @[Array.scala 33:53]
  assign array_3_2_io_A_in_sign = array_2_2_io_A_out_sign; // @[Array.scala 33:53]
  assign array_3_2_io_A_in_exponent = array_2_2_io_A_out_exponent; // @[Array.scala 33:53]
  assign array_3_2_io_A_in_fraction = array_2_2_io_A_out_fraction; // @[Array.scala 33:53]
  assign array_3_2_io_B_in_zero = array_3_1_io_B_out_zero; // @[Array.scala 44:53]
  assign array_3_2_io_B_in_nan = array_3_1_io_B_out_nan; // @[Array.scala 44:53]
  assign array_3_2_io_B_in_sign = array_3_1_io_B_out_sign; // @[Array.scala 44:53]
  assign array_3_2_io_B_in_exponent = array_3_1_io_B_out_exponent; // @[Array.scala 44:53]
  assign array_3_2_io_B_in_fraction = array_3_1_io_B_out_fraction; // @[Array.scala 44:53]
  assign array_3_2_io_C_in_zero = array_2_2_io_C_out_zero; // @[Array.scala 34:53]
  assign array_3_2_io_C_in_nan = array_2_2_io_C_out_nan; // @[Array.scala 34:53]
  assign array_3_2_io_C_in_number = array_2_2_io_C_out_number; // @[Array.scala 34:53]
  assign array_3_2_io_prop_in = array_2_2_io_prop_out; // @[Array.scala 35:56]
  assign array_3_3_clock = clock;
  assign array_3_3_io_A_in_zero = array_2_3_io_A_out_zero; // @[Array.scala 33:53]
  assign array_3_3_io_A_in_nan = array_2_3_io_A_out_nan; // @[Array.scala 33:53]
  assign array_3_3_io_A_in_sign = array_2_3_io_A_out_sign; // @[Array.scala 33:53]
  assign array_3_3_io_A_in_exponent = array_2_3_io_A_out_exponent; // @[Array.scala 33:53]
  assign array_3_3_io_A_in_fraction = array_2_3_io_A_out_fraction; // @[Array.scala 33:53]
  assign array_3_3_io_B_in_zero = array_3_2_io_B_out_zero; // @[Array.scala 44:53]
  assign array_3_3_io_B_in_nan = array_3_2_io_B_out_nan; // @[Array.scala 44:53]
  assign array_3_3_io_B_in_sign = array_3_2_io_B_out_sign; // @[Array.scala 44:53]
  assign array_3_3_io_B_in_exponent = array_3_2_io_B_out_exponent; // @[Array.scala 44:53]
  assign array_3_3_io_B_in_fraction = array_3_2_io_B_out_fraction; // @[Array.scala 44:53]
  assign array_3_3_io_C_in_zero = array_2_3_io_C_out_zero; // @[Array.scala 34:53]
  assign array_3_3_io_C_in_nan = array_2_3_io_C_out_nan; // @[Array.scala 34:53]
  assign array_3_3_io_C_in_number = array_2_3_io_C_out_number; // @[Array.scala 34:53]
  assign array_3_3_io_prop_in = array_2_3_io_prop_out; // @[Array.scala 35:56]
  assign A_convert_0_io_in = io_A_in_0; // @[Array.scala 28:44]
  assign A_convert_1_io_in = io_A_in_1; // @[Array.scala 28:44]
  assign A_convert_2_io_in = io_A_in_2; // @[Array.scala 28:44]
  assign A_convert_3_io_in = io_A_in_3; // @[Array.scala 28:44]
  assign B_convert_0_io_in = io_B_in_0; // @[Array.scala 41:44]
  assign B_convert_1_io_in = io_B_in_1; // @[Array.scala 41:44]
  assign B_convert_2_io_in = io_B_in_2; // @[Array.scala 41:44]
  assign B_convert_3_io_in = io_B_in_3; // @[Array.scala 41:44]
endmodule
