package project

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import Format._
import Conversion._

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

object ProjectTest extends App {
  iotesters.Driver.execute(args, () => new toFloatingPointUnpacked(5, 10)) {
    c => new toFloatingPointTester(c)
  }
}
