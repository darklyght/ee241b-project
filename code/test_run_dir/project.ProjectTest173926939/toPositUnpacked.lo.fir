circuit toPositUnpacked :
  module toPositUnpacked :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<16>
    output io_out_sign : UInt<1>
    output io_out_exponent : UInt<28>
    output io_out_fraction : UInt<12>
  
    node _T = bits(io_in, 15, 15) @[Conversion.scala 16:29]
    node _T_1 = bits(io_in, 14, 0) @[Conversion.scala 18:25]
    node _T_2 = bits(io_out_sign, 0, 0) @[Bitwise.scala 71:15]
    node _T_3 = mux(_T_2, UInt<15>("h7fff"), UInt<15>("h0")) @[Bitwise.scala 71:12]
    node _T_4 = xor(_T_1, _T_3) @[Conversion.scala 18:45]
    node _T_5 = add(_T_4, io_out_sign) @[Conversion.scala 18:82]
    node _T_6 = tail(_T_5, 1) @[Conversion.scala 18:82]
    node others = _T_6 @[Conversion.scala 17:26 Conversion.scala 18:16]
    io_out_sign <= _T @[Conversion.scala 16:21]
    io_out_exponent <= others @[Conversion.scala 20:25]
    io_out_fraction <= bits(others, 11, 0) @[Conversion.scala 21:25]
