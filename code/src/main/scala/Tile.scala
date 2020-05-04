package project

import chisel3._
import chisel3.util._
import chisel3.experimental.FixedPoint
import Format._
import Multiplier._

object Tile {
	class linearTile(val exponentWidth: Int, val fractionWidth: Int, val accumulatorWidth: Int, val radixPoint: Int) extends Module {
		val io = IO(new Bundle {
			val A_in = Input(Unpacked(exponentWidth, fractionWidth))
			val B_in = Input(Unpacked(exponentWidth, fractionWidth))
			val C_in = Input(Kulisch(accumulatorWidth))
			val prop_in = Input(Bool())
			val A_out = Output(Unpacked(exponentWidth, fractionWidth))
			val B_out = Output(Unpacked(exponentWidth, fractionWidth))
			val C_out = Output(Kulisch(accumulatorWidth))
			val prop_out = Output(Bool())
		})

		val A0 = RegEnable(io.A_in, ~io.prop_in)
		val A1 = RegEnable(io.A_in, io.prop_in)

		val A = RegNext(Mux(io.prop_in, A1, A0))
		val B = RegNext(io.B_in)
		val prop = RegNext(io.prop_in)
		
		val mac = Module(new linearMultiplierMAC(exponentWidth, fractionWidth, accumulatorWidth, radixPoint))
		mac.io.A := Mux(io.prop_in, A0, A1)
		mac.io.B := io.B_in
		mac.io.C := io.C_in
		
		val C = RegNext(mac.io.out)

		io.A_out := A
		io.B_out := B
		io.C_out := C
		io.prop_out := prop
	}

    object linearTile{
        def apply(exponentWidth: Int, fractionWidth: Int, accumulatorWidth: Int, radixPoint: Int): linearTile = new linearTile(exponentWidth, fractionWidth, accumulatorWidth, radixPoint)
    }

	class logTile(val exponentWidth: Int, val fractionWidth: Int, val accumulatorWidth: Int, val radixPoint: Int, val lutInputWidth: Int, val lutOutputWidth: Int) extends Module {
		val io = IO(new Bundle {
			val A_in = Input(Unpacked(exponentWidth, fractionWidth))
			val B_in = Input(Unpacked(exponentWidth, fractionWidth))
			val C_in = Input(Kulisch(accumulatorWidth))
			val prop_in = Input(Bool())
			val A_out = Output(Unpacked(exponentWidth, fractionWidth))
			val B_out = Output(Unpacked(exponentWidth, fractionWidth))
			val C_out = Output(Kulisch(accumulatorWidth))
			val prop_out = Output(Bool())
		})

		val A0 = RegEnable(io.A_in, ~io.prop_in)
		val A1 = RegEnable(io.A_in, io.prop_in)

		val A = RegNext(Mux(io.prop_in, A1, A0))
		val B = RegNext(io.B_in)
		val prop = RegNext(io.prop_in)
		
		val mac = Module(new logMultiplierMAC(exponentWidth, fractionWidth, accumulatorWidth, radixPoint, lutInputWidth, lutOutputWidth))
		mac.io.A := Mux(io.prop_in, A0, A1)
		mac.io.B := io.B_in
		mac.io.C := io.C_in
		
		val C = RegNext(mac.io.out)

		io.A_out := A
		io.B_out := B
		io.C_out := C
		io.prop_out := prop
	}

    object logTile{
        def apply(exponentWidth: Int, fractionWidth: Int, accumulatorWidth: Int, radixPoint: Int, lutInputWidth: Int, lutOutputWidth: Int): logTile = new logTile(exponentWidth, fractionWidth, accumulatorWidth, radixPoint, lutInputWidth, lutOutputWidth)
    }
}

