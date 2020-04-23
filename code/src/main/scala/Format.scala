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
    
    object Unpacked {
        def apply(exponentWidth: Int, fractionWidth: Int): Unpacked = new Unpacked(exponentWidth, fractionWidth)
    }
    
    class Kulisch(val accumulatorWidth: Int) extends Bundle {
        val zero = Bool()
        val nan = Bool()
        val number = SInt(accumulatorWidth.W)
    }

    object Kulisch {
        def apply(accumulatorWidth: Int): Kulisch = new Kulisch(accumulatorWidth)
    }
}
