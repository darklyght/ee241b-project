// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header

#ifndef _VGCD__Syms_H_
#define _VGCD__Syms_H_

#include "verilated.h"

// INCLUDE MODULE CLASSES
#include "VGCD.h"

// SYMS CLASS
class VGCD__Syms : public VerilatedSyms {
  public:
    
    // LOCAL STATE
    const char* __Vm_namep;
    bool __Vm_didInit;
    
    // SUBCELL STATE
    VGCD*                          TOPp;
    
    // CREATORS
    VGCD__Syms(VGCD* topp, const char* namep);
    ~VGCD__Syms() {}
    
    // METHODS
    inline const char* name() { return __Vm_namep; }
    
} VL_ATTR_ALIGNED(64);

#endif // guard
