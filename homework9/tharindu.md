# LLVM -O2 optimizations

The following is a sequence of optimization applied on the LLVM IR by the LLVM optimizer at level -O2. The repeated optimizations belong to different passes. 

  - Module Verifier
  - Simplify the CFG
  - SROA
  - Lower 'expect' Intrinsics
  - Force set function attributes
  - Infer set function attributes
  - Interprocedural Sparse Conditional Constant Propagation
  - Global Variable Optimizer
  - Promote Memory to Register
  - Dead Argument Elimination 
  - Simplify the CFG
  - PGOIndirectCallPromotion
  - Remove unused exception handling info 
  - Function Integration/Inlining
  - Deduce function attributes
  - Remove unused exception handling info
  - Function Integration/Inlining
  - After Deduce function attributes
  - Remove unused exception handling info
  - Function Integration/Inlining
  - Deduce function attributes 
  - SROA
  - Early CSE
  - Speculatively execute instructions if target has divergent branches
  - Jump Threading
  - Value Propagation
  - Simplify the CFG
  - Reassociate expressions 
  - Canonicalize natural loops
  - Loop-Closed SSA Form Pass
  - Rotate Loops
  - Loop Invariant Code Motion
  - Unswitch loops
  - Combine redundant instructions
  - Canonicalize natural loops
  - Loop-Closed SSA Form Pass
  - Induction Variable Simplification
  - Recognize loop idioms
  - Delete dead loops
  - Unroll loops
  - MergedLoadStoreMotion
  - Global Value Numbering 
  - MemCpy Optimization
  - Sparse Conditional Constant Propagation 
  - Demanded bits analysis
  - Bit-Tracking Dead Code Elimination
  - Combine redundant instructions
  - Jump Threading
  - Value Propagation
  - Dead Store Elimination
  - Canonicalize natural loops
  - Loop-Closed SSA Form Pass
  - Loop Invariant Code Motion
  - Simplify the CFG 
  - Combine redundant instructions
  - Remove unused exception handling info 
  - Function Integration/Inlining
  - Deduce function attributes
  - Remove unused exception handling info
  - Function Integration/Inlining
  - After Deduce function attributes
  - Remove unused exception handling info
  - Function Integration/Inlining
  - Deduce function attributes 
  - No-Op Barrier Pass 
  - Eliminate Available Externally Globals
  - Deduce function attributes in RPO
  - Float to int
  - Canonicalize natural loops
  - Loop-Closed SSA Form Pass
  - Rotate Loops
  - Loop Distribition
  - Canonicalize natural loops
  - Loop-Closed SSA Form Pass
  - Demanded bits analysis
  - Loop Vectorization
  - Canonicalize natural loops
  - Loop Load Elimination
  - Combine redundant instructions
  - Demanded bits analysis
  - SLP Vectorizer
  - Simplify the CFG
  - Combine redundant instructions
  - Canonicalize natural loops
  - Loop-Closed SSA Form Pass
  - Unroll loops
  - Combine redundant instructions
  - Canonicalize natural loops
  - Loop-Closed SSA Form Pass
  - Loop Invariant Code Motion
  - Remove redundant instructions
  - Alignment from assumptions
  - Strip Unused Function Prototypes
  - Dead Global Elimination
  - Merge Duplicate Global Constants
  - Module Verifier

This is the original order of the optimization passes but most of the optimizations do not perform useful transformations. In the following, we try to eleborate some optimizations and their purpose.

****

Original program `power.calc`

    (seq (set a0 m0)
         (seq (set a1 m1)
              (while (!= m1 1)
                     (seq (set (* m0 a0) m0)
                          (seq (set (- m1 1) m1) m0)))))

****

Original LLVM IR obtained by `./calcc -check < power.calc`
   
   
    ModuleID = 'calc'
    source_filename = "calc"
    target triple = "x86_64-unknown-linux-gnu"

    declare i64 @overflow_fail(i64)

    define i64 @f(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5) {
    entry:
      %m9 = alloca i64
      %m8 = alloca i64
      %m7 = alloca i64
      %m6 = alloca i64
      %m5 = alloca i64
      %m4 = alloca i64
      %m3 = alloca i64
      %m2 = alloca i64
      %m1 = alloca i64
      %m0 = alloca i64
      store i64 0, i64* %m0
      store i64 0, i64* %m1
      store i64 0, i64* %m2
      store i64 0, i64* %m3
      store i64 0, i64* %m4
      store i64 0, i64* %m5
      store i64 0, i64* %m6
      store i64 0, i64* %m7
      store i64 0, i64* %m8
      store i64 0, i64* %m9
      store i64 %a0, i64* %m0
      store i64 %a1, i64* %m1
      br label %0

    ; <label>:0:                                      ; preds = %21, %entry
      %1 = phi i64 [ 0, %entry ], [ %m04, %21 ]
      %m11 = load i64, i64* %m1
      %neqtmp = icmp ne i64 %m11, 1
      %2 = icmp eq i1 %neqtmp, true
      br i1 %2, label %4, label %3

    ; <label>:3:                                      ; preds = %0
      ret i64 %1

    ; <label>:4:                                      ; preds = %0
      %m02 = load i64, i64* %m0
      %5 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %m02, i64 %a0)
      %6 = extractvalue { i64, i1 } %5, 0
      %7 = extractvalue { i64, i1 } %5, 1
      %8 = icmp eq i1 %7, true
      br i1 %8, label %9, label %11

    ; <label>:9:                                      ; preds = %4
      %10 = call i64 @overflow_fail(i64 120)
      br label %12

    ; <label>:11:                                     ; preds = %4
      br label %12

    ; <label>:12:                                     ; preds = %11, %9
      %13 = phi i64 [ %6, %9 ], [ %6, %11 ]
      store i64 %13, i64* %m0
      %m13 = load i64, i64* %m1
      %14 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %m13, i64 1)
      %15 = extractvalue { i64, i1 } %14, 0
      %16 = extractvalue { i64, i1 } %14, 1
      %17 = icmp eq i1 %16, true
      br i1 %17, label %18, label %20

    ; <label>:18:                                     ; preds = %12
      %19 = call i64 @overflow_fail(i64 167)
      br label %21

    ; <label>:20:                                     ; preds = %12
      br label %21

    ; <label>:21:                                     ; preds = %20, %18
      %22 = phi i64 [ %15, %18 ], [ %15, %20 ]
      store i64 %22, i64* %m1
      %m04 = load i64, i64* %m0
      br label %0
    }

    ; Function Attrs: nounwind readnone
    declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

    ; Function Attrs: nounwind readnone
    declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

    attributes #0 = { nounwind readnone }


We now evaluate the effect of major optimizations. 

SROA replaces the long `entry` block with a loop based `whileEntry` to declare and initialize the 10 mutable variables.

    define i64 @f(i64, i64, i64, i64, i64, i64) {
    entry:
      br label %whileEntry

    whileEntry:                                       ; preds = %else3, %entry
      %Mutable1.0 = phi i64 [ %1, %entry ], [ %10, %else3 ]
      %Mutable0.0 = phi i64 [ %0, %entry ], [ %7, %else3 ]
      %phiNode = phi i64 [ 0, %entry ], [ %7, %else3 ]
      %ne = icmp ne i64 %Mutable1.0, 1
      br i1 %ne, label %whileBody, label %whileExit


Promote Memory to Register

    define i64 @f(i64, i64, i64, i64, i64, i64) {

    define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {

`local_unnamed_addr` flags that the address is not significant within the module but the content. See http://llvm.org/docs/LangRef.html


Combine redundant instructions

`eq` is substituted by `ne` and the branch targets are reordered accordingly. 

    %ne = icmp ne i64 %Mutable1.0, 1
    br i1 %ne, label %whileBody, label %whileExit

    %ne = icmp eq i64 %Mutable1.0, 1
    br i1 %ne, label %whileExit, label %whileBody


Simplify the CFG

    whileEntry:                                       ; preds = %else3, %entry
      %Mutable1.0 = phi i64 [ %1, %entry ], [ %10, %else3 ]
      %Mutable0.0 = phi i64 [ %0, %entry ], [ %7, %else3 ]
      %phiNode = phi i64 [ 0, %entry ], [ %7, %else3 ]
  .
  .
  .

      whileEntry:                                       ; preds = %else, %then1, %entry
      %Mutable1.0 = phi i64 [ %1, %entry ], [ %10, %then1 ], [ %10, %else ]
      %Mutable0.0 = phi i64 [ %0, %entry ], [ %7, %then1 ], [ %7, %else ]
      %phiNode = phi i64 [ 0, %entry ], [ %7, %then1 ], [ %7, %else ]
  
  ****
Instead of jumping to %else3, directly jump to %WhileEntry. With this, `%else3` block is eliminated, hence the simplified CFG.

    br i1 %11, label %then1, label %else3
.

    br i1 %11, label %then1, label %whileEntry

****

As a result, we can eliminate the entire %else3 block from the code. It is observed that LLVM IR usually generates a lot of such bogus basic blocks that can be actually eliminated.

    br label %else3		
    else3:                                            ; preds = %then1, %else	


Simplify the CFG

`call` replaced by `tail call`
Eg.

    %calltrap = call i64 @overflow_fail(i64 120)
.
  
    %calltrap = tail call i64 @overflow_fail(i64 120)


When used, `tail call` allows the callee to use caller's stack frame, consequently preventing potential stack overflows due to long recursive calls.


****

Canonicalize natural loops

    whileEntry:                                       ; preds = %else, %then1, %entry
      %Mutable1.0 = phi i64 [ %1, %entry ], [ %10, %then1 ], [ %10, %else ]
      %Mutable0.0 = phi i64 [ %0, %entry ], [ %7, %then1 ], [ %7, %else ]
      %phiNode = phi i64 [ 0, %entry ], [ %7, %then1 ], [ %7, %else ]
  
 .
  
      whileEntry:                                       ; preds = %whileEntry.backedge, %entry
      %Mutable1.0 = phi i64 [ %1, %entry ], [ %10, %whileEntry.backedge ]
      %Mutable0.0 = phi i64 [ %0, %entry ], [ %7, %whileEntry.backedge ]
      %phiNode = phi i64 [ 0, %entry ], [ %7, %whileEntry.backedge ]

****

    br i1 %11, label %then1, label %whileEntry		  
.

    br i1 %11, label %then1, label %whileEntry.backedge
    
 ****
 new block introduced
 
      br label %whileEntry.backedge
      whileEntry.backedge:                              ; preds = %then1, %else

Loop-Closed SSA Form Pass 

      ret i64 %phiNode		  
  
  ****
  
      %phiNode.lcssa = phi i64 [ %phiNode, %whileEntry ]
      ret i64 %phiNode.lcssa

Global Value Numbering

    whileExit.loopexit:                               ; preds = %whileEntry.backedge
      %.lcssa = phi i64 [ %7, %whileEntry.backedge ]
      br label %whileExit

    whileExit:                                        ; preds = %whileExit.loopexit, %entry
      %phiNode.lcssa = phi i64 [ 0, %entry ], [ %.lcssa, %whileExit.loopexit ]
      ret i64 %phiNode.lcssa

****

    whileExit.loopexit:                               ; preds = %whileEntry.backedge
      br label %whileExit

    whileExit:                                        ; preds = %whileExit.loopexit, %entry
      %phiNode.lcssa = phi i64 [ 0, %entry ], [ %7, %whileExit.loopexit ]
      ret i64 %phiNode.lcssa

Transfers phi node `phi i64 [ %7, %whileEntry.backedge ]` from `whileExit.loopexit` block to `whileExit` block.

****

It is seen that some optimization passes are not contributing to a significant IR improvement. 
Also, it can be observed that LLVM optimization passes follow a conservative order and do not take the effectiveness of each optimization into account. This area has a lot of potential for improvements. Also note that determining a proper/effective (ideally optimal) sequence of optimizations for a given application is non-trivial.
