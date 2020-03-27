// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VGCD__Syms.h"


//======================

void VGCD::traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    VGCD* t=(VGCD*)userthis;
    VGCD__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (vlSymsp->getClearActivity()) {
	t->traceChgThis(vlSymsp, vcdp, code);
    }
}

//======================


void VGCD::traceChgThis(VGCD__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGCD* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	if (VL_UNLIKELY((2U & vlTOPp->__Vm_traceActivity))) {
	    vlTOPp->traceChgThis__2(vlSymsp, vcdp, code);
	}
	vlTOPp->traceChgThis__3(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void VGCD::traceChgThis__2(VGCD__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGCD* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBus  (c+1,(vlTOPp->GCD__DOT__x),16);
	vcdp->chgBus  (c+2,(vlTOPp->GCD__DOT__y),16);
    }
}

void VGCD::traceChgThis__3(VGCD__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGCD* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->chgBit  (c+3,(vlTOPp->clock));
	vcdp->chgBit  (c+4,(vlTOPp->reset));
	vcdp->chgBus  (c+5,(vlTOPp->io_value1),16);
	vcdp->chgBus  (c+6,(vlTOPp->io_value2),16);
	vcdp->chgBit  (c+7,(vlTOPp->io_loadingValues));
	vcdp->chgBus  (c+8,(vlTOPp->io_outputGCD),16);
	vcdp->chgBit  (c+9,(vlTOPp->io_outputValid));
    }
}
