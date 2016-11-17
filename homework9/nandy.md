# LLVM Optimizer Pass Analysis 

The file chosen for optimization is power-overflow.

A. Simplify CFG
The first step is the simplify CFG stage. In this stage the optimizer performs dead code elimination and merges basic blocks
Specificlly:
 - Removes basic blocks with no predecessors.
 - Merges a basic block into its predecessor if there is only one and the predecessor only has one successor.
 - Eliminates PHI nodes for basic blocks with a single predecessor.
 - Eliminates a basic block that only contains an unconditional branch.

The optimizations that were performed are:

1. Eliminating a basic block with only an unconditional jump at the end:

    2 instances were identified:

    elseretval:                                       ; preds = %execloop
    br label %ifof
    -----------------------------------------------------------------------
    elseretval7:                                      ; preds = %ifof
    br label %ifof8
They were eliminated and the jump to the blocks elseretval and elseretval7 were modified to a jump to block ifof and ifof8

2. Elimination of a PHI node at the head of the basic block ifof and ifof8.

    Since there was no preceding blocks elseretval and elseretval7 (removed            previously) with incoming values, the PHI node could be eliminated.

ifof:                                             ; preds = %elseretval, %thenoffunc
  %iftmp = phi i64 [ %1, %thenoffunc ], [ %1, %elseretval
-----------------------------------------------------------------------
ifof8:                                            ; preds = %elseretval7, %thenoffunc5
  %iftmp9 = phi i64 [ %4, %thenoffunc5 ], [ %4, %elseretval7 ]


B. Scalar Replacement of Aggregates

SROA (Scalar Replacement of Aggregates) - includes "Promote Register to Memory" Optimization

There are 10 mutable variables that are allocated upfront at the time of function initialization. This optimization removed all the allocations made for mutable variables in the beginning of the program.
The program uses 2 mutable variables m0 and m1. These 2 mutable variables are allocated on the stack.

  %m1.0 = phi i64 [ %a1, %entry ], [ %4, %ifof8 ]
  %m0.0 = phi i64 [ %a0, %entry ], [ %1, %ifof8 ]

The loads and stores are from and to the stack and the address of the variable becomes the stack address. In addition to this, the Memory references are promoted to register references as the two mutable variables allocated with alloca use direct loads and stores in the original code. This allows them to be promoted to registers.

C. Early Common Subexpression Elimination

This pass performs common subexpression elimination. It removes trivially redundant instructions.
The subexpressions that are replaced in this pass are:

   %whilecond = icmp eq i1 %neqtmp, true
   br i1 %whilecond, label %execloop, label %afterloop
replaced with:
   br i1 %neqtmp, label %execloop, label %afterloop

   %oftrue = icmp eq i1 %2, true
   br i1 %oftrue, label %thenoffunc, label %ifof
replaced with:
   br i1 %2, label %thenoffunc, label %ifof

   %oftrue4 = icmp eq i1 %5, true
   br i1 %oftrue4, label %thenoffunc5, label %ifof8
replaced with:
   br i1 %5, label %thenoffunc5, label %ifof8

D. Global Variable Optimizer

This pass marks the use of global variables. In our case there are 2 extern functions declared and they are marked in this phase as having "local_unnamed_addr"

declare i32 @overflow_fail(i32) local_unnamed_addr
define i64 @f(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5) local_unnamed_addr {

E. Promote Memory to Register

This pass is supposed to promote memory references to registers. Some of the work has already been done in a previous pass. In this pass, the function declarations for the intrinsic and extern functions are removed

F. Dead Argument Elimination

This pass deletes dead arguments from internal functions. Dead argument elimination removes arguments which are directly dead, as well as arguments only passed into function calls as dead arguments of other functions. This pass also deletes dead arguments in a similar way.

In this program there are no such Dead Arguments so there is no change

G.  Combine redundant instructions

This pass combines instructions to form fewer, simple algebraic instructions.

Here the "ne" comparison is replaced by "eq"

Old:

   %neqtmp = icmp ne i64 %m1.0, 1
   br i1 %neqtmp, label %execloop, label %afterloop

New:
   %neqtmp = icmp eq i64 %m1.0, 1
   br i1 %neqtmp, label %afterloop, label %execloop

H. Simplify the CFG

Performs dead code elimination and basic block merging. Specifically:

 - Removes basic blocks with no predecessors.
 - Merges a basic block into its predecessor if there is only one and the predecessor only has one successor.
 - Eliminates PHI nodes for basic blocks with a single predecessor.
 - Eliminates a basic block that only contains an unconditional branch.

In this code, there is a basic block "ifof8" that contains an uncoditional branch to basic block "loop"

ifof8:                                            ; preds = %ifof, %thenoffunc5
  br label %loop

We can arrive at this basic block from 2 previous basic blocks:"ifof" and "thenoffunc5"

ifof:                                             ; preds = %execloop, %thenoffunc
  %3 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %m1.0, i64 1)
  %4 = extractvalue { i64, i1 } %3, 0
  %5 = extractvalue { i64, i1 } %3, 1
  br i1 %5, label %thenoffunc5, label %ifof8

thenoffunc5:                                      ; preds = %ifof
  %calloverflow6 = call i32 @overflow_fail(i32 185)
  br label %ifof8

This pass eliminated the basic block "ifof8". It then modified the jump from basic block "thenoffunc5" and "ifof" to jump directly to basic block "loop"

In basic block "ifof"
Old:
   br i1 %5, label %thenoffunc5, label %ifof8
New:
   br i1 %5, label %thenoffunc5, label %loop

In basic block "thenoffunc5"
Old:
  br label %ifof8
New:
  br label %loop

The basic block "loop" also has its predecessors modified.
Old:
 loop:                                             ; preds = %ifof8, %entry
New:
 loop:                                             ; preds = %thenoffunc5, %ifof, %entry

The Phi Function in "loop" is also modified
Old:
   %m1.0 = phi i64 [ %a1, %entry ], [ %4, %ifof8 ]
   %m0.0 = phi i64 [ %a0, %entry ], [ %1, %ifof8 ]
   %WhExp = phi i64 [ 0, %entry ], [ %1, %ifof8 ]
New:
   %m1.0 = phi i64 [ %a1, %entry ], [ %4, %ifof ], [ %4, %thenoffunc5 ]
   %m0.0 = phi i64 [ %a0, %entry ], [ %1, %ifof ], [ %1, %thenoffunc5 ]
   %WhExp = phi i64 [ 0, %entry ], [ %1, %ifof ], [ %1, %thenoffunc5 ]

I. Tail Call Elimination

This pass transforms calls of the current function (self recursion) followed by a return instruction with a branch to the entry of the function, creating a loop. This pass also implements the following extensions to the basic algorithm:

If it can prove that callees do not access their caller stack frame, they are marked as eligible for tail call elimination (by the code generator)

Old:
   %0 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %m0.0, i64 %a0)
   %calloverflow = call i32 @overflow_fail(i32 139)
   %3 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %m1.0, i64 1)
   %calloverflow6 = call i32 @overflow_fail(i32 185)

New:
   %0 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %m0.0, i64 %a0)
   %calloverflow = tail call i32 @overflow_fail(i32 139)
   %3 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %m1.0, i64 1)
   %calloverflow6 = tail call i32 @overflow_fail(i32 185)

J. Canonicalize natural loops

This pass performs several transformations to convert loops into a simpler form to make subsequent transformation passes like Loop Invariant Code Motion easier

The transformations are:
 - Loop pre-header insertion -  guarantees that there is a single, non-critical entry edge from outside of the loop to the loop header.
 - Loop exit-block insertion guarantees that all exit blocks from the loop only have predecessors from inside of the loop
 - Guarantees that loops will have exactly one backedge.

In this IR, the basic block "loop" has two backedges from basic block "ifof" and "thenoffunc5"
This pass introduces a basic block "loop.backedge" that branches to "loop" and basic blocks "ifof" and "thenoffunc5" jump to "loop.backedge".

New basic block:
 loop.backedge:                                    ; preds = %ifof, %thenoffunc5
   br label %loop

Old:
ifof:
   br i1 %5, label %thenoffunc5, label %loop
thenoffunc5:
   br label %loop
New:
ifof:
   br i1 %5, label %thenoffunc5, label %loop.backedge
thenoffunc5:
   br label %loop.backedge

The Phi Functions are also updated with the newly introduced block information

Old:
 loop:                                             ; preds = %thenoffunc5, %ifof, %entry
   %m1.0 = phi i64 [ %a1, %entry ], [ %4, %ifof ], [ %4, %thenoffunc5 ]
   %m0.0 = phi i64 [ %a0, %entry ], [ %1, %ifof ], [ %1, %thenoffunc5 ]
   %WhExp = phi i64 [ 0, %entry ], [ %1, %ifof ], [ %1, %thenoffunc5 ]
New:
 loop:                                             ; preds = %loop.backedge, %entry
   %m1.0 = phi i64 [ %a1, %entry ], [ %4, %loop.backedge ]
   %m0.0 = phi i64 [ %a0, %entry ], [ %1, %loop.backedge ]
   %WhExp = phi i64 [ 0, %entry ], [ %1, %loop.backedge ]

K. Loop-Closed SSA Form Pass
This pass transforms loops by placing phi nodes at the end of the loops for all values that are live across the loop boundary

In this IR, The return value WhExp is obtained from basic block "loop"

Old:
   ret i64 %WhExp
New:
   %WhExp.lcssa = phi i64 [ %WhExp, %loop ]
   ret i64 %WhExp.lcssa

L. Rotate Loops

This pass performs loop rotation and combines basic blocks to convert a loop to the form of body, followed by loop condition check and the back edge

In this IR
The main body is a multiplication operation
The condition check is done after a decrement of the loop counter
And if an overflow occurs in either the multiplication or the decrement operations, a trap is called.
After this pass, The IR is converted to:

loop body:

execloop:                                         ; preds = %execloop.lr.ph, %loop.backedge
  %m0.05 = phi i64 [ %a0, %execloop.lr.ph ], [ %1, %loop.backedge ]
  %m1.04 = phi i64 [ %a1, %execloop.lr.ph ], [ %4, %loop.backedge ]
  %0 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %m0.05, i64 %a0)
  %1 = extractvalue { i64, i1 } %0, 0
  %2 = extractvalue { i64, i1 } %0, 1
  br i1 %2, label %thenoffunc, label %ifof

With overflow check for multiplication:
thenoffunc:                                       ; preds = %execloop
  %calloverflow = tail call i32 @overflow_fail(i32 139)
  br label %ifof

loop counter decrement:
ifof:                                             ; preds = %execloop, %thenoffunc
  %3 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %m1.04, i64 1)
  %4 = extractvalue { i64, i1 } %3, 0
  %5 = extractvalue { i64, i1 } %3, 1
  br i1 %5, label %thenoffunc5, label %loop.backedge

With overflow check for decrement
thenoffunc5:                                      ; preds = %ifof
  %calloverflow6 = tail call i32 @overflow_fail(i32 185)
  br label %loop.backedge

And loop condition check with backedge or exit
loop.backedge:                                    ; preds = %ifof, %thenoffunc5
  %neqtmp = icmp eq i64 %4, 1
  br i1 %neqtmp, label %loop.afterloop_crit_edge, label %execloop

M.  Simplify the CFG

The CFG after loop rotation and loop invariant code motion is generated here

Now the entry block has the loop execution condition:

entry:
  %neqtmp3 = icmp eq i64 %a1, 1
  br i1 %neqtmp3, label %afterloop, label %execloop

The block to be executed after loop exit:

afterloop:                                        ; preds = %loop.backedge, %entry
  %WhExp.lcssa = phi i64 [ 0, %entry ], [ %1, %loop.backedge ]
  ret i64 %WhExp.lcssa

Followed by the body of the loop with overflow check of the multiplication:

execloop:                                         ; preds = %entry, %loop.backedge
  %m0.05 = phi i64 [ %1, %loop.backedge ], [ %a0, %entry ]
  %m1.04 = phi i64 [ %4, %loop.backedge ], [ %a1, %entry ]
  %0 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %m0.05, i64 %a0)
  %1 = extractvalue { i64, i1 } %0, 0
  %2 = extractvalue { i64, i1 } %0, 1
  br i1 %2, label %thenoffunc, label %ifof

thenoffunc:                                       ; preds = %execloop
  %calloverflow = tail call i32 @overflow_fail(i32 139)
  br label %ifof

And the loop counter decrement with overflow check:
ifof:                                             ; preds = %execloop, %thenoffunc
  %3 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %m1.04, i64 1)
  %4 = extractvalue { i64, i1 } %3, 0
  %5 = extractvalue { i64, i1 } %3, 1
  br i1 %5, label %thenoffunc5, label %loop.backedge

The backedge will be taken if the loop entry condition is satisfied:
loop.backedge:                                    ; preds = %ifof, %thenoffunc5
  %neqtmp = icmp eq i64 %4, 1
  br i1 %neqtmp, label %afterloop, label %execloop

The overflow function call in case the loop counter decrement caused an overflow
thenoffunc5:                                      ; preds = %ifof
  %calloverflow6 = tail call i32 @overflow_fail(i32 185)
  br label %loop.backedge


 






