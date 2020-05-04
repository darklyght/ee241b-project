package project

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import Format._
import Conversion._
import Multiplier._

class toPositUnpackedTester(c: toPositUnpacked) extends PeekPokeTester(c) {
    poke(c.io.in, 0)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 1)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 22818)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 32767)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 32768)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 32769)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 43585)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 65535)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
}

class toFloatingPointTester(c: toFloatingPointUnpacked) extends PeekPokeTester(c) {
    poke(c.io.in, 0)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 1)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 1023)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 1024)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 31743)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 15359)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 15360)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 15361)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 13653)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 49152)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 32768)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 31744)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
    poke(c.io.in, 64512)
    println(s"Input: ${peek(c.io.in)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.sign)} ${peek(c.io.out.exponent)} ${peek(c.io.out.fraction)}")
}

class linearMultiplierTester(c: linearMultiplier) extends PeekPokeTester(c) {
    poke(c.io.A.zero, 0)
    poke(c.io.A.nan, 0)
    poke(c.io.A.sign, 1)
    poke(c.io.A.exponent, 15)
    poke(c.io.A.fraction, 2047)
    poke(c.io.B.zero, 0)
    poke(c.io.B.nan, 0)
    poke(c.io.B.sign, 1)
    poke(c.io.B.exponent, 15)
    poke(c.io.B.fraction, 2047)
    println(s"Input: ${peek(c.io.A.sign)} ${peek(c.io.A.exponent)} ${peek(c.io.A.fraction)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.number)}")
}

class logMultiplierTester(c: logMultiplier) extends PeekPokeTester(c) {
    poke(c.io.A.zero, 0)
    poke(c.io.A.nan, 0)
    poke(c.io.A.sign, 1)
    poke(c.io.A.exponent, -2)
    poke(c.io.A.fraction, 512)
    poke(c.io.B.zero, 0)
    poke(c.io.B.nan, 0)
    poke(c.io.B.sign, 1)
    poke(c.io.B.exponent, -2)
    poke(c.io.B.fraction, 512)
    println(s"Input: ${peek(c.io.A.sign)} ${peek(c.io.A.exponent)} ${peek(c.io.A.fraction)} Output: ${peek(c.io.out.zero)} ${peek(c.io.out.nan)} ${peek(c.io.out.number)}")
}

/*
object ProjectTest extends App {
  iotesters.Driver.execute(args, () => new logMultiplier(6, 11, 81, 48, 11, 10)) {
    c => new logMultiplierTester(c)
  }
}
*/
