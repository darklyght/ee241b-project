package project

import chisel3._
import chisel3.util._
import chisel3.experimental.FixedPoint
import Format._
import Multiplier._
import Conversion._
import Tile._

object Array {
	class linearFloatingPointArray(val size: Int, val exponentWidth: Int, val fractionWidth: Int, val accumulatorWidth: Int, val radixPoint: Int) extends Module {
		val io = IO(new Bundle {
			val A_in = Input(Vec(size, UInt((1 + exponentWidth + fractionWidth).W)))
			val B_in = Input(Vec(size, UInt((1 + exponentWidth + fractionWidth).W)))
			val C_in = Input(Vec(size, Kulisch(accumulatorWidth)))
			val prop_in = Input(Vec(size, Bool()))
			val C_out = Output(Vec(size, Kulisch(accumulatorWidth)))
		})

		val array: Seq[Seq[linearTile]] = Seq.fill(size, size)(Module(new linearTile(exponentWidth + 1, fractionWidth + 1, accumulatorWidth, radixPoint)))
		val A = Vec(size, Unpacked(exponentWidth + 1, fractionWidth + 1))
		val B = Vec(size, Unpacked(exponentWidth + 1, fractionWidth + 1))
		val A_convert: Seq[toFloatingPointUnpacked] = Seq.fill(size)(Module(new toFloatingPointUnpacked(exponentWidth, fractionWidth)))
		val B_convert: Seq[toFloatingPointUnpacked] = Seq.fill(size)(Module(new toFloatingPointUnpacked(exponentWidth, fractionWidth)))

		for (c <- 0 until size) {
			A_convert(c).io.in := io.A_in(c)
			array(0)(c).io.A_in := A_convert(c).io.out
			array(0)(c).io.C_in := io.C_in(c)
			array(0)(c).io.prop_in := io.prop_in(c)
			for (r <- 1 until size) {
				array(r)(c).io.A_in := array(r-1)(c).io.A_out
				array(r)(c).io.C_in := array(r-1)(c).io.C_out
				array(r)(c).io.prop_in := array(r-1)(c).io.prop_out
			}
			io.C_out(c) := array(size-1)(c).io.C_out
		}

		for (r <- 0 until size) {
			B_convert(r).io.in := io.B_in(r)
			array(r)(0).io.B_in := B_convert(r).io.out
			for (c <- 1 until size) {
				array(r)(c).io.B_in := array(r)(c-1).io.B_out
			}
		}
	}

	class linearPositArray(val size: Int, val bitWidth: Int, val exponentWidth: Int, val accumulatorWidth: Int, val radixPoint: Int) extends Module {
		val io = IO(new Bundle {
			val A_in = Input(Vec(size, UInt(bitWidth.W)))
			val B_in = Input(Vec(size, UInt(bitWidth.W)))
			val C_in = Input(Vec(size, Kulisch(accumulatorWidth)))
			val prop_in = Input(Vec(size, Bool()))
			val C_out = Output(Vec(size, Kulisch(accumulatorWidth)))
		})

		val array: Seq[Seq[linearTile]] = Seq.fill(size, size)(Module(new linearTile(log2Ceil(math.pow(2, exponentWidth).toInt * (bitWidth - 2) + 1) + 1, if (bitWidth - 3 - exponentWidth <= 0) (1) else (bitWidth - 3 - exponentWidth + 1), accumulatorWidth, radixPoint)))
		val A = Vec(size, Unpacked(log2Ceil(math.pow(2, exponentWidth).toInt * (bitWidth - 2) + 1) + 1, if (bitWidth - 3 - exponentWidth <= 0) (1) else (bitWidth - 3 - exponentWidth + 1)))
		val B = Vec(size, Unpacked(log2Ceil(math.pow(2, exponentWidth).toInt * (bitWidth - 2) + 1) + 1, if (bitWidth - 3 - exponentWidth <= 0) (1) else (bitWidth - 3 - exponentWidth + 1)))
		val A_convert: Seq[toPositUnpacked] = Seq.fill(size)(Module(new toPositUnpacked(bitWidth, exponentWidth)))
		val B_convert: Seq[toPositUnpacked] = Seq.fill(size)(Module(new toPositUnpacked(bitWidth, exponentWidth)))

		for (c <- 0 until size) {
			A_convert(c).io.in := io.A_in(c)
			array(0)(c).io.A_in := A_convert(c).io.out
			array(0)(c).io.C_in := io.C_in(c)
			array(0)(c).io.prop_in := io.prop_in(c)
			for (r <- 1 until size) {
				array(r)(c).io.A_in := array(r-1)(c).io.A_out
				array(r)(c).io.C_in := array(r-1)(c).io.C_out
				array(r)(c).io.prop_in := array(r-1)(c).io.prop_out
			}
			io.C_out(c) := array(size-1)(c).io.C_out
		}

		for (r <- 0 until size) {
			B_convert(r).io.in := io.B_in(r)
			array(r)(0).io.B_in := B_convert(r).io.out
			for (c <- 1 until size) {
				array(r)(c).io.B_in := array(r)(c-1).io.B_out
			}
		}
	}

	class logPositArray(val size: Int, val bitWidth: Int, val exponentWidth: Int, val accumulatorWidth: Int, val radixPoint: Int,  val lutInputWidth: Int, val lutOutputWidth: Int) extends Module {
		val io = IO(new Bundle {
			val A_in = Input(Vec(size, UInt(bitWidth.W)))
			val B_in = Input(Vec(size, UInt(bitWidth.W)))
			val C_in = Input(Vec(size, Kulisch(accumulatorWidth)))
			val prop_in = Input(Vec(size, Bool()))
			val C_out = Output(Vec(size, Kulisch(accumulatorWidth)))
		})

		val array: Seq[Seq[logTile]] = Seq.fill(size, size)(Module(new logTile(log2Ceil(math.pow(2, exponentWidth).toInt * (bitWidth - 2) + 1) + 1, if (bitWidth - 3 - exponentWidth <= 0) (1) else (bitWidth - 3 - exponentWidth + 1), accumulatorWidth, radixPoint, lutInputWidth, lutOutputWidth)))
		val A = Vec(size, Unpacked(log2Ceil(math.pow(2, exponentWidth).toInt * (bitWidth - 2) + 1) + 1, if (bitWidth - 3 - exponentWidth <= 0) (1) else (bitWidth - 3 - exponentWidth + 1)))
		val B = Vec(size, Unpacked(log2Ceil(math.pow(2, exponentWidth).toInt * (bitWidth - 2) + 1) + 1, if (bitWidth - 3 - exponentWidth <= 0) (1) else (bitWidth - 3 - exponentWidth + 1)))
		val A_convert: Seq[toPositUnpacked] = Seq.fill(size)(Module(new toPositUnpacked(bitWidth, exponentWidth)))
		val B_convert: Seq[toPositUnpacked] = Seq.fill(size)(Module(new toPositUnpacked(bitWidth, exponentWidth)))

		for (c <- 0 until size) {
			A_convert(c).io.in := io.A_in(c)
			array(0)(c).io.A_in := A_convert(c).io.out
			array(0)(c).io.C_in := io.C_in(c)
			array(0)(c).io.prop_in := io.prop_in(c)
			for (r <- 1 until size) {
				array(r)(c).io.A_in := array(r-1)(c).io.A_out
				array(r)(c).io.C_in := array(r-1)(c).io.C_out
				array(r)(c).io.prop_in := array(r-1)(c).io.prop_out
			}
			io.C_out(c) := array(size-1)(c).io.C_out
		}

		for (r <- 0 until size) {
			B_convert(r).io.in := io.B_in(r)
			array(r)(0).io.B_in := B_convert(r).io.out
			for (c <- 1 until size) {
				array(r)(c).io.B_in := array(r)(c-1).io.B_out
			}
		}
	}
}

object ArrayDriver extends App {
	chisel3.Driver.execute(args, () => new Array.logPositArray(4, 16, 1, 129, 56, 11, 10))
}
