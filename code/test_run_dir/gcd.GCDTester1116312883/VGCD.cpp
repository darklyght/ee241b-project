// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VGCD.h for the primary calling header

#include "VGCD.h"              // For This
#include "VGCD__Syms.h"


//--------------------
// STATIC VARIABLES


//--------------------

VL_CTOR_IMP(VGCD) {
    VGCD__Syms* __restrict vlSymsp = __VlSymsp = new VGCD__Syms(this, name());
    VGCD* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void VGCD::__Vconfigure(VGCD__Syms* vlSymsp, bool first) {
    if (0 && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
}

VGCD::~VGCD() {
    delete __VlSymsp; __VlSymsp=NULL;
}

//--------------------


void VGCD::eval() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate VGCD::eval\n"); );
    VGCD__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    VGCD* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
	VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
	vlSymsp->__Vm_activity = true;
	_eval(vlSymsp);
	if (VL_UNLIKELY(++__VclockLoop > 100)) {
	    // About to fail, so enable debug to see what's not settling.
	    // Note you must run make with OPT=-DVL_DEBUG for debug prints.
	    int __Vsaved_debug = Verilated::debug();
	    Verilated::debug(1);
	    __Vchange = _change_request(vlSymsp);
	    Verilated::debug(__Vsaved_debug);
	    VL_FATAL_MT(__FILE__,__LINE__,__FILE__,"Verilated model didn't converge");
	} else {
	    __Vchange = _change_request(vlSymsp);
	}
    } while (VL_UNLIKELY(__Vchange));
}

void VGCD::_eval_initial_loop(VGCD__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    vlSymsp->__Vm_activity = true;
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
	_eval_settle(vlSymsp);
	_eval(vlSymsp);
	if (VL_UNLIKELY(++__VclockLoop > 100)) {
	    // About to fail, so enable debug to see what's not settling.
	    // Note you must run make with OPT=-DVL_DEBUG for debug prints.
	    int __Vsaved_debug = Verilated::debug();
	    Verilated::debug(1);
	    __Vchange = _change_request(vlSymsp);
	    Verilated::debug(__Vsaved_debug);
	    VL_FATAL_MT(__FILE__,__LINE__,__FILE__,"Verilated model didn't DC converge");
	} else {
	    __Vchange = _change_request(vlSymsp);
	}
    } while (VL_UNLIKELY(__Vchange));
}

//--------------------
// Internal Methods

VL_INLINE_OPT void VGCD::_sequent__TOP__1(VGCD__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGCD::_sequent__TOP__1\n"); );
    VGCD* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // ALWAYS at GCD.v:64
    if (vlTOPp->io_loadingValues) {
	vlTOPp->GCD__DOT__x = vlTOPp->io_value1;
    } else {
	if (vlTOPp->GCD__DOT___T) {
	    vlTOPp->GCD__DOT__x = vlTOPp->GCD__DOT___T_2;
	}
    }
    if (vlTOPp->io_loadingValues) {
	vlTOPp->GCD__DOT__y = vlTOPp->io_value2;
    } else {
	if ((1U & (~ (IData)(vlTOPp->GCD__DOT___T)))) {
	    vlTOPp->GCD__DOT__y = vlTOPp->GCD__DOT___T_4;
	}
    }
    vlTOPp->io_outputGCD = vlTOPp->GCD__DOT__x;
    vlTOPp->io_outputValid = (0U == (IData)(vlTOPp->GCD__DOT__y));
    vlTOPp->GCD__DOT___T = ((IData)(vlTOPp->GCD__DOT__x) 
			    > (IData)(vlTOPp->GCD__DOT__y));
    vlTOPp->GCD__DOT___T_2 = (0xffffU & ((IData)(vlTOPp->GCD__DOT__x) 
					 - (IData)(vlTOPp->GCD__DOT__y)));
    vlTOPp->GCD__DOT___T_4 = (0xffffU & ((IData)(vlTOPp->GCD__DOT__y) 
					 - (IData)(vlTOPp->GCD__DOT__x)));
}

void VGCD::_settle__TOP__2(VGCD__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGCD::_settle__TOP__2\n"); );
    VGCD* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->io_outputGCD = vlTOPp->GCD__DOT__x;
    vlTOPp->io_outputValid = (0U == (IData)(vlTOPp->GCD__DOT__y));
    vlTOPp->GCD__DOT___T = ((IData)(vlTOPp->GCD__DOT__x) 
			    > (IData)(vlTOPp->GCD__DOT__y));
    vlTOPp->GCD__DOT___T_2 = (0xffffU & ((IData)(vlTOPp->GCD__DOT__x) 
					 - (IData)(vlTOPp->GCD__DOT__y)));
    vlTOPp->GCD__DOT___T_4 = (0xffffU & ((IData)(vlTOPp->GCD__DOT__y) 
					 - (IData)(vlTOPp->GCD__DOT__x)));
}

void VGCD::_eval(VGCD__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGCD::_eval\n"); );
    VGCD* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->clock) & (~ (IData)(vlTOPp->__Vclklast__TOP__clock)))) {
	vlTOPp->_sequent__TOP__1(vlSymsp);
	vlTOPp->__Vm_traceActivity = (2U | vlTOPp->__Vm_traceActivity);
    }
    // Final
    vlTOPp->__Vclklast__TOP__clock = vlTOPp->clock;
}

void VGCD::_eval_initial(VGCD__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGCD::_eval_initial\n"); );
    VGCD* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void VGCD::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGCD::final\n"); );
    // Variables
    VGCD__Syms* __restrict vlSymsp = this->__VlSymsp;
    VGCD* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void VGCD::_eval_settle(VGCD__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGCD::_eval_settle\n"); );
    VGCD* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__2(vlSymsp);
}

VL_INLINE_OPT QData VGCD::_change_request(VGCD__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGCD::_change_request\n"); );
    VGCD* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void VGCD::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGCD::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clock & 0xfeU))) {
	Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((reset & 0xfeU))) {
	Verilated::overWidthError("reset");}
    if (VL_UNLIKELY((io_loadingValues & 0xfeU))) {
	Verilated::overWidthError("io_loadingValues");}
}
#endif // VL_DEBUG

void VGCD::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGCD::_ctor_var_reset\n"); );
    // Body
    clock = VL_RAND_RESET_I(1);
    reset = VL_RAND_RESET_I(1);
    io_value1 = VL_RAND_RESET_I(16);
    io_value2 = VL_RAND_RESET_I(16);
    io_loadingValues = VL_RAND_RESET_I(1);
    io_outputGCD = VL_RAND_RESET_I(16);
    io_outputValid = VL_RAND_RESET_I(1);
    GCD__DOT__x = VL_RAND_RESET_I(16);
    GCD__DOT__y = VL_RAND_RESET_I(16);
    GCD__DOT___T = VL_RAND_RESET_I(1);
    GCD__DOT___T_2 = VL_RAND_RESET_I(16);
    GCD__DOT___T_4 = VL_RAND_RESET_I(16);
    __Vclklast__TOP__clock = VL_RAND_RESET_I(1);
    __Vm_traceActivity = VL_RAND_RESET_I(32);
}
