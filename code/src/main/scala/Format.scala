package project

import chisel3._
import chisel3.util._

object Format {
    class Unpacked(val exponentWidth: Int, val fractionWidth: Int) extends Bundle {
        val zero = Bool()
        val nan = Bool()
        val sign = UInt(1.W)
        val exponent = SInt(exponentWidth.W)
        val fraction = UInt(fractionWidth.W)
    }

    class FloatingPoint(val exponentWidthFP: Int, val fractionWidthFP: Int) extends Unpacked(exponentWidthFP + 1, fractionWidthFP + 1) {
    }
    
    object FloatingPoint {
        def apply(exponentWidth: Int, fractionWidth: Int): FloatingPoint = new FloatingPoint(exponentWidth, fractionWidth)
    }

    class PositUnpacked(val bitWidthP: Int, val exponentWidthP: Int) extends Unpacked(log2Ceil(math.pow(2, exponentWidthP).toInt * (bitWidthP - 2) + 1) + 1, if (bitWidthP - 3 - exponentWidthP <= 0) (1) else (bitWidthP - 3 - exponentWidthP + 1)) {
    }

    object PositUnpacked {
        def apply(bitWidth: Int, exponentWidth: Int): PositUnpacked = new PositUnpacked(bitWidth, exponentWidth)
    }
}
