;buildInfoPackage: chisel3, version: 3.2.4, scalaVersion: 2.12.10, sbtVersion: 1.3.2
circuit Multiplier : 
  module Multiplier : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : {sign : UInt<1>, exponent : UInt<5>, mantissa : UInt<10>}, out : {sign : UInt<1>, exponent : UInt<5>, mantissa : UInt<10>}}
    
    io.out.sign <= io.in.sign @[Multplier.scala 12:21]
    io.out.exponent <= io.in.exponent @[Multplier.scala 13:25]
    io.out.mantissa <= io.in.mantissa @[Multplier.scala 14:25]
    
