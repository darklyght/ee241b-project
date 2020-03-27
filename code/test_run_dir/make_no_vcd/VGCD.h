// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _VGCD_H_
#define _VGCD_H_

#include "verilated.h"

class VGCD__Syms;

//----------

VL_MODULE(VGCD) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_IN8(io_loadingValues,0,0);
    VL_OUT8(io_outputValid,0,0);
    VL_IN16(io_value1,15,0);
    VL_IN16(io_value2,15,0);
    VL_OUT16(io_outputGCD,15,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    VL_SIG8(GCD__DOT___T,0,0);
    VL_SIG16(GCD__DOT__x,15,0);
    VL_SIG16(GCD__DOT__y,15,0);
    VL_SIG16(GCD__DOT___T_2,15,0);
    VL_SIG16(GCD__DOT___T_4,15,0);
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    VL_SIG8(__Vclklast__TOP__clock,0,0);
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    VGCD__Syms* __VlSymsp;  // Symbol table
    
    // PARAMETERS
    // Parameters marked /*verilator public*/ for use by application code
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(VGCD);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    VGCD(const char* name="TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~VGCD();
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval();
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(VGCD__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(VGCD__Syms* symsp, bool first);
  private:
    static QData _change_request(VGCD__Syms* __restrict vlSymsp);
    void _ctor_var_reset();
  public:
    static void _eval(VGCD__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif // VL_DEBUG
  public:
    static void _eval_initial(VGCD__Syms* __restrict vlSymsp);
    static void _eval_settle(VGCD__Syms* __restrict vlSymsp);
    static void _sequent__TOP__1(VGCD__Syms* __restrict vlSymsp);
    static void _settle__TOP__2(VGCD__Syms* __restrict vlSymsp);
} VL_ATTR_ALIGNED(128);

#endif // guard
