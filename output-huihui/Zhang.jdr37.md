WARNING: You're attempting to print out a bitcode file.
This is inadvisable as it may cause display problems. If
you REALLY want to taste LLVM bitcode first-hand, you
can force output with the `-f' option.

# explanation
original IR generated with the given test input jdr37.calc

*** IR Dump After Module Verifier ***
define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %Mutable0 = alloca i64
  store i64 0, i64* %Mutable0
  %Mutable1 = alloca i64
  store i64 0, i64* %Mutable1
  %Mutable2 = alloca i64
  store i64 0, i64* %Mutable2
  %Mutable3 = alloca i64
  store i64 0, i64* %Mutable3
  %Mutable4 = alloca i64
  store i64 0, i64* %Mutable4
  %Mutable5 = alloca i64
  store i64 0, i64* %Mutable5
  %Mutable6 = alloca i64
  store i64 0, i64* %Mutable6
  %Mutable7 = alloca i64
  store i64 0, i64* %Mutable7
  %Mutable8 = alloca i64
  store i64 0, i64* %Mutable8
  %Mutable9 = alloca i64
  store i64 0, i64* %Mutable9
  br label %whileEntry

whileEntry:                                       ; preds = %whileBody, %entry
  %phiNode = phi i64 [ 0, %entry ], [ 1, %whileBody ]
  br i1 false, label %whileBody, label %whileExit

whileBody:                                        ; preds = %whileEntry
  store i64 1, i64* %Mutable0
  br label %whileEntry

whileExit:                                        ; preds = %whileEntry
  ret i64 %phiNode
}
*** IR Dump After Simplify the CFG ***

# Optimization phase, simplify control flow graph
The compiler analyze the branch condition, and know that
the condition is always "false", thus the basicblock whileBody
never get executed. Save to return 0.

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %Mutable0 = alloca i64
  store i64 0, i64* %Mutable0
  %Mutable1 = alloca i64
  store i64 0, i64* %Mutable1
  %Mutable2 = alloca i64
  store i64 0, i64* %Mutable2
  %Mutable3 = alloca i64
  store i64 0, i64* %Mutable3
  %Mutable4 = alloca i64
  store i64 0, i64* %Mutable4
  %Mutable5 = alloca i64
  store i64 0, i64* %Mutable5
  %Mutable6 = alloca i64
  store i64 0, i64* %Mutable6
  %Mutable7 = alloca i64
  store i64 0, i64* %Mutable7
  %Mutable8 = alloca i64
  store i64 0, i64* %Mutable8
  %Mutable9 = alloca i64
  store i64 0, i64* %Mutable9
  ret i64 0
}
*** IR Dump After SROA ***

# compiler optimization pass, scalar replacement of aggregates

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  ret i64 0
}

# the rest of the optimization basically do nothing, because
the IR code is already simplified.

*** IR Dump After Early CSE ***
define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  ret i64 0
}
*** IR Dump After Early GVN Hoisting of Expressions ***

# global value numbering

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  ret i64 0
}
*** IR Dump After Lower 'expect' Intrinsics ***
define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  ret i64 0
}
*** IR Dump After Force set function attributes ***; ModuleID = 'output/jdr37.calc.ll'
source_filename = "output/jdr37.calc.ll"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  ret i64 0
}
*** IR Dump After Infer set function attributes ***; ModuleID = 'output/jdr37.calc.ll'
source_filename = "output/jdr37.calc.ll"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  ret i64 0
}
*** IR Dump After Interprocedural Sparse Conditional Constant Propagation ***; ModuleID = 'output/jdr37.calc.ll'
source_filename = "output/jdr37.calc.ll"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  ret i64 0
}
*** IR Dump After Global Variable Optimizer ***; ModuleID = 'output/jdr37.calc.ll'
source_filename = "output/jdr37.calc.ll"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {
entry:
  ret i64 0
}
*** IR Dump After Promote Memory to Register ***
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {
entry:
  ret i64 0
}
*** IR Dump After Dead Argument Elimination ***; ModuleID = 'output/jdr37.calc.ll'
source_filename = "output/jdr37.calc.ll"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {
entry:
  ret i64 0
}
*** IR Dump After Combine redundant instructions ***
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {
entry:
  ret i64 0
}
*** IR Dump After Simplify the CFG ***
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {
entry:
  ret i64 0
}
*** IR Dump After PGOIndirectCallPromotion ***; ModuleID = 'output/jdr37.calc.ll'
source_filename = "output/jdr37.calc.ll"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {
entry:
  ret i64 0
}
*** IR Dump After Remove unused exception handling info ***
; Function Attrs: nounwind
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Function Integration/Inlining ***
; Function Attrs: nounwind
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Deduce function attributes ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After SROA ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Early CSE ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Speculatively execute instructions if target has divergent branches ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Jump Threading ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Value Propagation ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Simplify the CFG ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Combine redundant instructions ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Tail Call Elimination ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Simplify the CFG ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Reassociate expressions ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Canonicalize natural loops ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Loop-Closed SSA Form Pass ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Simplify the CFG ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Combine redundant instructions ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Canonicalize natural loops ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Loop-Closed SSA Form Pass ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After MergedLoadStoreMotion ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Global Value Numbering ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After MemCpy Optimization ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Sparse Conditional Constant Propagation ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Demanded bits analysis ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Bit-Tracking Dead Code Elimination ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Combine redundant instructions ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Jump Threading ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Value Propagation ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Dead Store Elimination ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Canonicalize natural loops ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Loop-Closed SSA Form Pass ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Aggressive Dead Code Elimination ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Simplify the CFG ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Combine redundant instructions ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Remove unused exception handling info ***
Printing <null> Function
*** IR Dump After Function Integration/Inlining ***
Printing <null> Function
*** IR Dump After Deduce function attributes ***
Printing <null> Function
*** IR Dump After A No-Op Barrier Pass ***; ModuleID = 'output/jdr37.calc.ll'
source_filename = "output/jdr37.calc.ll"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}

attributes #0 = { norecurse nounwind readnone }
*** IR Dump After Eliminate Available Externally Globals ***; ModuleID = 'output/jdr37.calc.ll'
source_filename = "output/jdr37.calc.ll"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}

attributes #0 = { norecurse nounwind readnone }
*** IR Dump After Deduce function attributes in RPO ***; ModuleID = 'output/jdr37.calc.ll'
source_filename = "output/jdr37.calc.ll"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}

attributes #0 = { norecurse nounwind readnone }
*** IR Dump After Float to int ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Canonicalize natural loops ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Loop-Closed SSA Form Pass ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Loop Distribution ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Canonicalize natural loops ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Loop-Closed SSA Form Pass ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Demanded bits analysis ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Loop Vectorization ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Canonicalize natural loops ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Loop Load Elimination ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Combine redundant instructions ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Demanded bits analysis ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After SLP Vectorizer ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Simplify the CFG ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Combine redundant instructions ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Canonicalize natural loops ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Loop-Closed SSA Form Pass ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Combine redundant instructions ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Canonicalize natural loops ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Loop-Closed SSA Form Pass ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Remove redundant instructions ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Alignment from assumptions ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
*** IR Dump After Strip Unused Function Prototypes ***; ModuleID = 'output/jdr37.calc.ll'
source_filename = "output/jdr37.calc.ll"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}

attributes #0 = { norecurse nounwind readnone }
*** IR Dump After Dead Global Elimination ***; ModuleID = 'output/jdr37.calc.ll'
source_filename = "output/jdr37.calc.ll"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}

attributes #0 = { norecurse nounwind readnone }
*** IR Dump After Merge Duplicate Global Constants ***; ModuleID = 'output/jdr37.calc.ll'
source_filename = "output/jdr37.calc.ll"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}

attributes #0 = { norecurse nounwind readnone }
*** IR Dump After Module Verifier ***
; Function Attrs: norecurse nounwind readnone
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
entry:
  ret i64 0
}
