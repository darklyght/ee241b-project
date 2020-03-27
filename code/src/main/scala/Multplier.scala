package project

import chisel3._
import chisel3.util._
import Format._

class Multiplier(val exponentWidth: Int, val mantissaWidth: Int) extends Module {
    val io = IO(new Bundle {
		val in = Input(FloatingPoint(exponentWidth, mantissaWidth))
		val out = Output(FloatingPoint(exponentWidth, mantissaWidth))
    })
	io.out.sign := io.in.sign
	io.out.exponent := io.in.exponent
	io.out.mantissa := io.in.mantissa
}
