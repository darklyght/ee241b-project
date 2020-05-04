package project

import chisel3._
import chisel3.util._
import chisel3.experimental.FixedPoint
import Format._

object Multiplier {
    class linearMultiplier(val exponentWidth: Int, val fractionWidth: Int, val accumulatorWidth: Int, val radixPoint: Int) extends Module {
        val io = IO(new Bundle {
            val A = Input(Unpacked(exponentWidth, fractionWidth))
            val B = Input(Unpacked(exponentWidth, fractionWidth))
            val out = Output(Kulisch(accumulatorWidth))
        })
        val exponentSum = io.A.exponent +& io.B.exponent
        val fractionProduct = io.A.fraction * io.B.fraction
        val shift = radixPoint.S +& exponentSum -& (2 * (fractionWidth - 1)).S
        val number = Mux(shift < 0.S, fractionProduct >> (-shift).asUInt, fractionProduct << shift.asUInt)

        io.out.zero := io.A.zero | io.B.zero | (shift < -(2 * (fractionWidth - 1)).S)
        io.out.nan := io.A.nan | io.B.nan | (shift >= (accumulatorWidth - 2 * fractionWidth).S)
        io.out.number := Mux(io.out.zero | io.out.nan, 0.S, Mux((io.A.sign ^ io.B.sign).asBool, -number.asSInt, number.asSInt))
    }

    class linearMultiplierMAC(val exponentWidth: Int, val fractionWidth: Int, val accumulatorWidth: Int, val radixPoint: Int) extends Module {
        val io = IO(new Bundle {
            val A = Input(Unpacked(exponentWidth, fractionWidth))
            val B = Input(Unpacked(exponentWidth, fractionWidth))
            val C = Input(Kulisch(accumulatorWidth))
            val out = Output(Kulisch(accumulatorWidth))
        })

        val multiplier = Module(new linearMultiplier(exponentWidth, fractionWidth, accumulatorWidth, radixPoint))
        multiplier.io.A := io.A
        multiplier.io.B := io.B
        val sum = multiplier.io.out.number + io.C.number
        io.out.zero := (multiplier.io.out.zero & io.C.zero) | ((io.C.number(accumulatorWidth - 1) === multiplier.io.out.number(accumulatorWidth - 1)) && (io.C.number(accumulatorWidth - 1) === 1.U) && (sum(accumulatorWidth - 1) === 0.U)) 
        io.out.nan := multiplier.io.out.nan | io.C.nan | ((io.C.number(accumulatorWidth - 1) === multiplier.io.out.number(accumulatorWidth - 1)) && (io.C.number(accumulatorWidth - 1) === 0.U) && (sum(accumulatorWidth - 1) === 1.U)) 
        io.out.number := sum
    }

    object linearMultiplierMAC {
        def apply(exponentWidth: Int, fractionWidth: Int, accumulatorWidth: Int, radixPoint: Int): linearMultiplierMAC = new linearMultiplierMAC(exponentWidth, fractionWidth, accumulatorWidth, radixPoint)
    }

	class logMultiplier(val exponentWidth: Int, val fractionWidth: Int, val accumulatorWidth: Int, val radixPoint: Int, val lutInputWidth: Int, val lutOutputWidth: Int) extends Module {
		def pow2lut(inputWidth: Int, outputWidth: Int) = {
			val data = (0 until scala.math.pow(2, inputWidth).toInt).map(i => {
				(scala.math.pow(2, (i / scala.math.pow(2, inputWidth - 1)))) * scala.math.pow(2, outputWidth - 2)
			})
			val inits = data.map(t => scala.math.round(t).asUInt(outputWidth.W))
			VecInit(inits)
		}
		
		val io = IO(new Bundle {
			val A = Input(Unpacked(exponentWidth, fractionWidth))
			val B = Input(Unpacked(exponentWidth, fractionWidth))
			val out = Output(Kulisch(accumulatorWidth))
		})
		val exponentSum = io.A.exponent +& io.B.exponent
		val fractionSum = io.A.fraction(fractionWidth - 2, 0) +& io.B.fraction(fractionWidth - 2, 0)
		val fractionProduct = pow2lut(lutInputWidth, lutOutputWidth)(fractionSum(fractionSum.getWidth - 1, fractionSum.getWidth - lutInputWidth))
		val shift = radixPoint.S +& exponentSum -& (lutOutputWidth - 2).S
        val number = Mux(shift < 0.S, fractionProduct >> (-shift).asUInt, fractionProduct << shift.asUInt)

        io.out.zero := io.A.zero | io.B.zero | (shift < -(2 * (fractionWidth - 1)).S)
        io.out.nan := io.A.nan | io.B.nan | (shift >= (accumulatorWidth - lutOutputWidth).S)
        io.out.number := Mux(io.out.zero | io.out.nan, 0.S, Mux((io.A.sign ^ io.B.sign).asBool, -number.asSInt, number.asSInt))
	}

    class logMultiplierMAC(val exponentWidth: Int, val fractionWidth: Int, val accumulatorWidth: Int, val radixPoint: Int, val lutInputWidth: Int, val lutOutputWidth: Int) extends Module {
        val io = IO(new Bundle {
            val A = Input(Unpacked(exponentWidth, fractionWidth))
            val B = Input(Unpacked(exponentWidth, fractionWidth))
            val C = Input(Kulisch(accumulatorWidth))
            val out = Output(Kulisch(accumulatorWidth))
        })

        val multiplier = Module(new logMultiplier(exponentWidth, fractionWidth, accumulatorWidth, radixPoint, lutInputWidth, lutOutputWidth))
        multiplier.io.A := io.A
        multiplier.io.B := io.B
        val sum = multiplier.io.out.number + io.C.number
        io.out.zero := (multiplier.io.out.zero & io.C.zero) | ((io.C.number(accumulatorWidth - 1) === multiplier.io.out.number(accumulatorWidth - 1)) && (io.C.number(accumulatorWidth - 1) === 1.U) && (sum(accumulatorWidth - 1) === 0.U)) 
        io.out.nan := multiplier.io.out.nan | io.C.nan | ((io.C.number(accumulatorWidth - 1) === multiplier.io.out.number(accumulatorWidth - 1)) && (io.C.number(accumulatorWidth - 1) === 0.U) && (sum(accumulatorWidth - 1) === 1.U)) 
        io.out.number := sum
    }
	
	object logMultiplierMAC {
		def apply(exponentWidth: Int, fractionWidth: Int, accumulatorWidth: Int, radixPoint: Int, lutInputWidth: Int, lutOutputWidth: Int): logMultiplierMAC = new logMultiplierMAC(exponentWidth, fractionWidth, accumulatorWidth, radixPoint, lutInputWidth, lutOutputWidth)
	}
}
