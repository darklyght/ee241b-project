;buildInfoPackage: chisel3, version: 3.2.4, scalaVersion: 2.12.10, sbtVersion: 1.3.2
circuit toPositUnpacked : 
  module toPositUnpacked : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<16>, out : {sign : UInt<1>, exponent : UInt<28>, fraction : UInt<12>}}
    
    node _T = bits(io.in, 15, 15) @[Conversion.scala 16:29]
    io.out.sign <= _T @[Conversion.scala 16:21]
    wire others : UInt<15> @[Conversion.scala 17:26]
    node _T_1 = bits(io.in, 14, 0) @[Conversion.scala 18:25]
    node _T_2 = bits(io.out.sign, 0, 0) @[Bitwise.scala 71:15]
    node _T_3 = mux(_T_2, UInt<15>("h07fff"), UInt<15>("h00")) @[Bitwise.scala 71:12]
    node _T_4 = xor(_T_1, _T_3) @[Conversion.scala 18:45]
    node _T_5 = add(_T_4, io.out.sign) @[Conversion.scala 18:82]
    node _T_6 = tail(_T_5, 1) @[Conversion.scala 18:82]
    others <= _T_6 @[Conversion.scala 18:16]
    io.out.exponent <= others @[Conversion.scala 20:25]
    io.out.fraction <= others @[Conversion.scala 21:25]
    
