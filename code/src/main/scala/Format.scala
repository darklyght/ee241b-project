package project

import chisel3._
import chisel3.util._

object Format {
	class FloatingPoint(val exponentWidth: Int, val mantissaWidth: Int) extends Bundle {
		val sign = UInt(1.W)
		val exponent = SInt((exponentWidth + 1).W)
        val mantissa = UInt(mantissaWidth.W)
	}
    
    object FloatingPoint {
        def apply(exponentWidth: Int, mantissaWidth: Int): FloatingPoint = new FloatingPoint(exponentWidth, mantissaWidth)
    }

    class PositUnpacked(val bitWidth: Int, val exponentWidth: Int) extends Bundle {
        val regimeWidth = bitWidth - 2
        val exponentMax = math.pow(2, exponentWidth).toInt * regimeWidth
        val fractionWidth = if (bitWidth - 3 - exponentWidth <= 0) (1) else (bitWidth - 3 - exponentWidth + 5)
        val sign = UInt(1.W)
        val exponent = SInt((log2Ceil(exponentMax + 1) + 1).W)
        val fraction = UInt(fractionWidth.W)
    }

    object PositUnpacked {
        def apply(bitWidth: Int, exponentWidth: Int): PositUnpacked = new PositUnpacked(bitWidth, exponentWidth)
    }
}
