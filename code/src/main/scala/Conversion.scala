package project

import chisel3._
import chisel3.util._
import Format._

object Conversion {
	class toPositUnpacked(val bitWidth: Int, val exponentWidth: Int) extends Module {
        val io = IO(new Bundle {
            val in = Input(UInt(bitWidth.W))
            val out = Output(PositUnpacked(bitWidth, exponentWidth))
        })

        val others = Wire(UInt((bitWidth - 1).W))
        val leading = Wire(UInt(log2Ceil(bitWidth + 1).W))
        val regime = Wire(SInt((leading.getWidth + 1).W))
        val exponentFraction = Wire(UInt((bitWidth - 3).W))
        val exponent = Wire(UInt(exponentWidth.W))
        val fraction = Wire(UInt((bitWidth - 3 - exponentWidth + 1).W))

        others := (io.in(bitWidth - 2, 0) ^ Fill(bitWidth - 1, io.out.sign)) + io.out.sign
        leading := Mux(others(others.getWidth - 1), PriorityEncoder(Reverse(~others)), PriorityEncoder(Reverse(others))) + (others.andR | ~others.orR).asUInt
        regime := Mux(others(others.getWidth - 1), leading.asSInt - 1.S, -leading.asSInt)
        exponentFraction := others << (leading - 1.U)
        exponent := exponentFraction(exponentFraction.getWidth - 1, exponentFraction.getWidth - exponentWidth)
        fraction := Cat(1.U, exponentFraction(exponentFraction.getWidth - exponentWidth - 1, 0))

        io.out.sign := io.in(bitWidth - 1)
        io.out.exponent := (regime << (math.pow(2, exponentWidth - 1).toInt).U).asSInt + exponent.zext
        io.out.fraction := fraction
    }

    class toFloatingPoint(val exponentWidth: Int, val mantissaWidth: Int) extends Module {
        val io = IO(new Bundle {
            val in = Input(UInt((1 + exponentWidth + mantissaWidth).W))
            val out = Output(FloatingPoint(exponentWidth, mantissaWidth))
        })
        val bitWidth = 1 + exponentWidth + mantissaWidth
        val bias = math.pow(2, exponentWidth - 1).toInt - 1

        io.out.sign := io.in(bitWidth - 1)
        io.out.exponent := io.in(bitWidth - 2, bitWidth - exponentWidth - 1).zext - bias.S
        io.out.mantissa := io.in(bitWidth - exponentWidth - 2, 0)
    }
}
