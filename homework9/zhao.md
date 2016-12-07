# LLVM Passes

***Tuowen Zhao***

## Setup

* The input is the following source code
~~~
(if (<= a0 0) 0
    (seq (set 1 m1)
    (seq (set 1 m2)
    (seq (while (< m2 a0)
        (seq (set (+ m2 1) m2)
        (seq (set m1 m3)
        (seq (set (+ m1 m0) m1)
        (set m3 m0)))))
    m1
    )))
)
~~~
* Using [my compiler](https://github.com/ztuowen/calc-compiler) it will generate the following output
~~~
define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %6 = icmp sle i64 %0, 0
  br i1 %6, label %thenIf, label %elseIf

thenIf:                                           ; preds = %entry
  br label %afterIf

elseIf:                                           ; preds = %entry
  br label %CondW

afterIf:                                          ; preds = %AfterW, %thenIf
  %7 = phi i64 [ 0, %thenIf ], [ %12, %AfterW ]
  %8 = phi i64 [ 0, %thenIf ], [ %13, %AfterW ]
  %9 = phi i64 [ 0, %thenIf ], [ %14, %AfterW ]
  %10 = phi i64 [ 0, %thenIf ], [ %15, %AfterW ]
  %11 = phi i64 [ 0, %thenIf ], [ %13, %AfterW ]
  ret i64 %11

CondW:                                            ; preds = %safe2, %elseIf
  %12 = phi i64 [ 0, %elseIf ], [ %13, %safe2 ]
  %13 = phi i64 [ 1, %elseIf ], [ %22, %safe2 ]
  %14 = phi i64 [ 1, %elseIf ], [ %19, %safe2 ]
  %15 = phi i64 [ 0, %elseIf ], [ %13, %safe2 ]
  %16 = phi i64 [ 0, %elseIf ], [ %13, %safe2 ]
  %17 = icmp slt i64 %14, %0
  br i1 %17, label %BodyW, label %AfterW

BodyW:                                            ; preds = %CondW
  %18 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %14, i64 1)
  %19 = extractvalue { i64, i1 } %18, 0
  %20 = extractvalue { i64, i1 } %18, 1
  br i1 %20, label %over, label %safe

AfterW:                                           ; preds = %CondW
  br label %afterIf

over:                                             ; preds = %BodyW
  tail call void @overflow_fail(i64 125)
  unreachable

safe:                                             ; preds = %BodyW
  %21 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %13, i64 %12)
  %22 = extractvalue { i64, i1 } %21, 0
  %23 = extractvalue { i64, i1 } %21, 1
  br i1 %23, label %over1, label %safe2

over1:                                            ; preds = %safe
  tail call void @overflow_fail(i64 181)
  unreachable

safe2:                                            ; preds = %safe
  br label %CondW
}
~~~
* The above code will be optimized by llvm into this:
~~~
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {
entry:
  %6 = icmp slt i64 %0, 1
  br i1 %6, label %afterIf, label %CondW.preheader

CondW.preheader:                                  ; preds = %entry
  br label %CondW

afterIf.loopexit:                                 ; preds = %CondW
  br label %afterIf

afterIf:                                          ; preds = %afterIf.loopexit, %entry
  %7 = phi i64 [ 0, %entry ], [ %9, %afterIf.loopexit ]
  ret i64 %7

CondW:                                            ; preds = %CondW.preheader, %safe
  %8 = phi i64 [ %9, %safe ], [ 0, %CondW.preheader ]
  %9 = phi i64 [ %16, %safe ], [ 1, %CondW.preheader ]
  %10 = phi i64 [ %14, %safe ], [ 1, %CondW.preheader ]
  %11 = icmp slt i64 %10, %0
  br i1 %11, label %BodyW, label %afterIf.loopexit

BodyW:                                            ; preds = %CondW
  %12 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %10, i64 1)
  %13 = extractvalue { i64, i1 } %12, 1
  br i1 %13, label %over, label %safe

over:                                             ; preds = %BodyW
  tail call void @overflow_fail(i64 125)
  unreachable

safe:                                             ; preds = %BodyW
  %14 = extractvalue { i64, i1 } %12, 0
  %15 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %9, i64 %8)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %over1, label %CondW

over1:                                            ; preds = %safe
  tail call void @overflow_fail(i64 181)
  unreachable
}
~~~

## What LLVM has done

Few noticeable changes happened to the code here:

1. Unused local variables' phi are gone in the `afterIf` and `CondW` blocks
2. Loop is recognized with `CondW.preheader` and `afterIf.loopexit` added
3. The extract value for the first overflow check is delayed until overflow doesn't happen
4. The comparison instructions are changed from `<=0` to `<1`

## [LLVM Passes](http://llvm.org/docs/Passes.html)

Not all of the LLVM passes applies to this particular test case, but there are a few notable ones.

### [Module Verifier](http://llvm.org/docs/Passes.html#verify-module-verifier)

This is one of the most important utility passes that will check if the LLVM contains some easily recognizable syntax errors, detailed list is in the link above. Some of the errors that it is looking for includes adding values of different type or PHI nodes not at the top of a basic block.

### [Simplify the CFG](http://llvm.org/docs/Passes.html#simplifycfg-simplify-the-cfg)

This is the first place that a lot is done here. Most notably the CFG is changed and some of the PHI nodes are removed.
~~~
define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %6 = icmp sle i64 %0, 0
  br i1 %6, label %afterIf, label %CondW

afterIf:                                          ; preds = %CondW, %entry
  %7 = phi i64 [ 0, %entry ], [ %10, %CondW ]
  %8 = phi i64 [ 0, %entry ], [ %11, %CondW ]
  %9 = phi i64 [ 0, %entry ], [ %12, %CondW ]
  ret i64 %8

CondW:                                            ; preds = %safe, %entry
  %10 = phi i64 [ 0, %entry ], [ %11, %safe ]
  %11 = phi i64 [ 1, %entry ], [ %18, %safe ]
  %12 = phi i64 [ 1, %entry ], [ %15, %safe ]
  %13 = icmp slt i64 %12, %0
  br i1 %13, label %BodyW, label %afterIf

BodyW:                                            ; preds = %CondW
  %14 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %12, i64 1)
  %15 = extractvalue { i64, i1 } %14, 0
  %16 = extractvalue { i64, i1 } %14, 1
  br i1 %16, label %over, label %safe

over:                                             ; preds = %BodyW
  tail call void @overflow_fail(i64 125)
  unreachable

safe:                                             ; preds = %BodyW
  %17 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %11, i64 %10)
  %18 = extractvalue { i64, i1 } %17, 0
  %19 = extractvalue { i64, i1 } %17, 1
  br i1 %19, label %over1, label %CondW

over1:                                            ; preds = %safe
  tail call void @overflow_fail(i64 181)
  unreachable
}
~~~
In the original input, two basic blocks, `elseIf` and `safe2` , are actually just "pipes", that is they do noting but unconditionally branch to another basic block. It will effectively be just branching to those destinations in the first place. After that, those PHI nodes that got remove will become duplicates and are then safely removed.

### Early CSE

This pass will do a dominator tree walk and eliminates trivially redundant instructions. This pass concludes the PHI node removal here. It eliminated the two extra PHI nodes that never got referenced in the return block.

### A lot of passes

Adding function attributes, exception handling info etc.

### [Combine Redundant Instructions](http://llvm.org/docs/Passes.html#instcombine-combine-redundant-instructions)

This pass will combine some instructions sequences into fewer or simpler instructions. Notable things that it did here is changing from `<=0` to `<1` and also move the extract addition result to the safe branch.

~~~
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {
entry:
  %6 = icmp slt i64 %0, 1
  br i1 %6, label %afterIf, label %CondW

afterIf:                                          ; preds = %CondW, %entry
  %7 = phi i64 [ 0, %entry ], [ %9, %CondW ]
  ret i64 %7

CondW:                                            ; preds = %safe, %entry
  %8 = phi i64 [ 0, %entry ], [ %9, %safe ]
  %9 = phi i64 [ 1, %entry ], [ %16, %safe ]
  %10 = phi i64 [ 1, %entry ], [ %14, %safe ]
  %11 = icmp slt i64 %10, %0
  br i1 %11, label %BodyW, label %afterIf

BodyW:                                            ; preds = %CondW
  %12 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %10, i64 1)
  %13 = extractvalue { i64, i1 } %12, 1
  br i1 %13, label %over, label %safe

over:                                             ; preds = %BodyW
  tail call void @overflow_fail(i64 125)
  unreachable

safe:                                             ; preds = %BodyW
  %14 = extractvalue { i64, i1 } %12, 0
  %15 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %9, i64 %8)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %over1, label %CondW

over1:                                            ; preds = %safe
  tail call void @overflow_fail(i64 181)
  unreachable
}
~~~
Major part of the work is done here.

### [Canonicalize Natural Loops](http://llvm.org/docs/Passes.html#loop-simplify-canonicalize-natural-loops)

This pass performed basic ground work for following loop-based analysis. Specifically, it will setup a single entry block for the loop body and a single exit block to separate the loop from other part of the program.

This will ensure that some more interesting loop optimizations can cleanly separate the loop with the outside code. Some of the optimizations includes:

* Loop unroll
* Loop unswitch
* Loop strength reduction
* Loop invariant code motion
* ...

But, unfortunately, the loop in this program have little space for improvement if not changing the algorithm altogether.
 
### Some iteration of passes
 
A few iterations of loop canonicalization and loop transformation and other analysis like demanded bits analysis. 
 
### In the end
 
We have the result code at the beginning.

One interesting note is that it still contains the loop entry and loop exit block, which is strange since the loop cononicalization assumes that CFG simplification is run at a latter stage but **didn't**! 
  
If we run simplify CFG manually we have:
~~~
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {
entry:
  %6 = icmp slt i64 %0, 1
  br i1 %6, label %afterIf, label %CondW.preheader

CondW.preheader:                                  ; preds = %entry
  br label %CondW

afterIf.loopexit:                                 ; preds = %CondW
  br label %afterIf

afterIf:                                          ; preds = %afterIf.loopexit, %entry
  %7 = phi i64 [ 0, %entry ], [ %9, %afterIf.loopexit ]
  ret i64 %7

CondW:                                            ; preds = %CondW.preheader, %safe
  %8 = phi i64 [ %9, %safe ], [ 0, %CondW.preheader ]
  %9 = phi i64 [ %16, %safe ], [ 1, %CondW.preheader ]
  %10 = phi i64 [ %14, %safe ], [ 1, %CondW.preheader ]
  %11 = icmp slt i64 %10, %0
  br i1 %11, label %BodyW, label %afterIf.loopexit

BodyW:                                            ; preds = %CondW
  %12 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %10, i64 1)
  %13 = extractvalue { i64, i1 } %12, 1
  br i1 %13, label %over, label %safe

over:                                             ; preds = %BodyW
  tail call void @overflow_fail(i64 125)
  unreachable

safe:                                             ; preds = %BodyW
  %14 = extractvalue { i64, i1 } %12, 0
  %15 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %9, i64 %8)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %over1, label %CondW

over1:                                            ; preds = %safe
  tail call void @overflow_fail(i64 181)
  unreachable
}
~~~
