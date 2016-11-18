I'm analyzing the `power.calc` routine in the `auto-tests-hw8` folder. Here is
the program:

```
(seq (set a0 m0)
     (seq (set a1 m1)
          (while (!= m1 1)
                 (seq (set (* m0 a0) m0)
                      (seq (set (- m1 1) m1) m0)))))
```

As you can see, it is a relatively simple program that `x` to the power `y`
by iteratively multiplying `x` with an accumulator. The value we want to 
take the power of is passed as the first argument to the generated function
`f` and the power is passed as the second argument.

By running my compiler with the `-check` option supplied I generate the
following output:

```llvm
; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  br label %6

; <label>:6:                                      ; preds = %29, %entry
  %7 = phi i64 [ %0, %entry ], [ %21, %29 ]
  %8 = phi i64 [ %1, %entry ], [ %26, %29 ]
  %9 = phi i64 [ 0, %entry ], [ %9, %29 ]
  %10 = phi i64 [ 0, %entry ], [ %10, %29 ]
  %11 = phi i64 [ 0, %entry ], [ %11, %29 ]
  %12 = phi i64 [ 0, %entry ], [ %12, %29 ]
  %13 = phi i64 [ 0, %entry ], [ %13, %29 ]
  %14 = phi i64 [ 0, %entry ], [ %14, %29 ]
  %15 = phi i64 [ 0, %entry ], [ %15, %29 ]
  %16 = phi i64 [ 0, %entry ], [ %16, %29 ]
  %17 = phi i64 [ 0, %entry ], [ %21, %29 ]
  %18 = icmp ne i64 %8, 1
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %6
  %20 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %7, i64 %0)
  %21 = extractvalue { i64, i1 } %20, 0
  %22 = extractvalue { i64, i1 } %20, 1
  br i1 %22, label %28, label %24

; <label>:23:                                     ; preds = %6
  ret i64 %17

; <label>:24:                                     ; preds = %19
  %25 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %8, i64 1)
  %26 = extractvalue { i64, i1 } %25, 0
  %27 = extractvalue { i64, i1 } %25, 1
  br i1 %27, label %30, label %29

; <label>:28:                                     ; preds = %19
  call void @overflow_fail(i32 120)
  unreachable

; <label>:29:                                     ; preds = %24
  br label %6

; <label>:30:                                     ; preds = %24
  call void @overflow_fail(i32 167)
  unreachable
}

; Function Attrs: noreturn
declare void @overflow_fail(i32) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #1

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #1

define i64 @_strap_div(i64, i64, i32) {
  %4 = icmp eq i64 %1, 0
  %5 = icmp eq i64 %0, -9223372036854775808
  %6 = icmp eq i64 %1, -1
  %7 = and i1 %5, %6
  %8 = or i1 %4, %7
  br i1 %8, label %11, label %9

; <label>:9:                                      ; preds = %3
  %10 = sdiv i64 %0, %1
  ret i64 %10

; <label>:11:                                     ; preds = %3
  call void @overflow_fail(i32 %2)
  unreachable
}

define i64 @_strap_mod(i64, i64, i32) {
  %4 = icmp eq i64 %1, 0
  br i1 %4, label %7, label %5

; <label>:5:                                      ; preds = %3
  %6 = srem i64 %0, %1
  ret i64 %6

; <label>:7:                                      ; preds = %3
  call void @overflow_fail(i32 %2)
  unreachable
}

attributes #0 = { noreturn }
attributes #1 = { nounwind readnone }
```

As you can see, we have the main function `f`, as well as declarations for
the intrinsic overflow-checking signed addition, multiplication, and subtraction, 
as well as
the compiler generated safe division and modulo functions (`_strap_div` 
and `_strap_mod` respectively). As the trapping division and modulo functions are
unused, and not optimized by the LLVM optimizer, I'll omit discussion of them
for the purposes of this writeup. Instead, I'll focus on the main `f` function:

```llvm
define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  br label %6

; <label>:6:                                      ; preds = %29, %entry
  %7 = phi i64 [ %0, %entry ], [ %21, %29 ]
  %8 = phi i64 [ %1, %entry ], [ %26, %29 ]
  %9 = phi i64 [ 0, %entry ], [ %9, %29 ]
  %10 = phi i64 [ 0, %entry ], [ %10, %29 ]
  %11 = phi i64 [ 0, %entry ], [ %11, %29 ]
  %12 = phi i64 [ 0, %entry ], [ %12, %29 ]
  %13 = phi i64 [ 0, %entry ], [ %13, %29 ]
  %14 = phi i64 [ 0, %entry ], [ %14, %29 ]
  %15 = phi i64 [ 0, %entry ], [ %15, %29 ]
  %16 = phi i64 [ 0, %entry ], [ %16, %29 ]
  %17 = phi i64 [ 0, %entry ], [ %21, %29 ]
  %18 = icmp ne i64 %8, 1
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %6
  %20 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %7, i64 %0)
  %21 = extractvalue { i64, i1 } %20, 0
  %22 = extractvalue { i64, i1 } %20, 1
  br i1 %22, label %28, label %24

; <label>:23:                                     ; preds = %6
  ret i64 %17

; <label>:24:                                     ; preds = %19
  %25 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %8, i64 1)
  %26 = extractvalue { i64, i1 } %25, 0
  %27 = extractvalue { i64, i1 } %25, 1
  br i1 %27, label %30, label %29

; <label>:28:                                     ; preds = %19
  call void @overflow_fail(i32 120)
  unreachable

; <label>:29:                                     ; preds = %24
  br label %6

; <label>:30:                                     ; preds = %24
  call void @overflow_fail(i32 167)
  unreachable
}
```

So, to briefly explain how the code operates, the block labeled `%6` is the entry
point of our while loop. We first check our loop condition expression,
(if our accumulator `%8` is not equal to 1). If it is true, then we branch to the 
loop body block, labeled `%19`, otherwise, we exit the function returning the
accumulated value `%17`. The block labeled `%19` does the multiplication with
overflow checking, and the block labeled `%24` subtracts 1 from the accumulator
(again, with overflow checking) before eventually branching back to the block
labeled `%6` again to check if we need to re-run the loop body. 

In addition one 
interesting thing to note is that the phi nodes assigned to registers `%9`-`%17`
are the mutable variables in the program. Even though only `m0` is used in the
program, the compiler is not aware of that fact since it generates the llvm
bytecode top-down. Instead, the compiler makes the pessimistic assumption that
all mutable variables will have changed when entering a new basic block, and it
creates phi nodes with inputs for all parents of the basic block.

So, on with the analysis, we start by running:

```
opt -O2 -print-after-all power.ll
```

The first pass "Module Verifier", does nothing. Module verifier step is just 
to verify the llvm input is valid, so it makes sense it does nothing. The
second phase "Simplify the CFG" does make a change, but it's a small one.
Simplify CFG is able to recognize that the block labeled `%29` is unnecessary.
It deletes the block, and updates the branch at the end of `%24` to jump to
the block `%6` instead.  It is a little surprising that the
simplify CFG step doesn't the trivial branch
to the loop head (the only instruction in the entry block). This jump could be
eliminated by hoisting the contents of the block labeled `%6` into the "entry"
block. However, this manipulation is likely too complex for Simplify CFG to
do at this stage.

The next stage "SROA", or "Scalar Replacement of Aggregates" is responsible
for breaking up aggregates and converting `alloca`s into SSA form where
possible. Since my compiler doesn't use `alloca` to implement mutable variables,
and other than the trivial aggregates returned by the overflow check intrinsics
no aggregates are used either.

The fourth pass, "Early CSE" actually eliminates several instructions. Specifically,
it removes all of the unused phi nodes from the condition block of the while
loop (block `%6`). The Early CSE pass is designed to eliminate 
"Trivially redundant instructions" by walking the SSA-form assignments. This pass
is exactly designed to eliminate my unused phi nodes.

After this, various passes add additional metadata to the function, but
the main function remains unchanged. Here's what the final optimized `f`
function looks like:

```llvm
define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  br label %6

; <label>:6:                                      ; preds = %16, %entry
  %7 = phi i64 [ %0, %entry ], [ %13, %16 ]
  %8 = phi i64 [ %1, %entry ], [ %18, %16 ]
  %9 = phi i64 [ 0, %entry ], [ %13, %16 ]
  %10 = icmp ne i64 %8, 1
  br i1 %10, label %11, label %15

; <label>:11:                                     ; preds = %6
  %12 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %7, i64 %0)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  br i1 %14, label %20, label %16

; <label>:15:                                     ; preds = %6
  ret i64 %9

; <label>:16:                                     ; preds = %11
  %17 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %8, i64 1)
  %18 = extractvalue { i64, i1 } %17, 0
  %19 = extractvalue { i64, i1 } %17, 1
  br i1 %19, label %21, label %6

; <label>:20:                                     ; preds = %11
  call void @overflow_fail(i32 120)
  unreachable

; <label>:21:                                     ; preds = %16
  call void @overflow_fail(i32 167)
  unreachable
}
```

Which, isn't really all that different from the original. The extra phi nodes
are gone, and the extraneous branch is gone, but no meaningful instructions
were eliminated. Part of the problem is that the IR has no native representation
for taking the power of an integer. There are the intrinsics `llvm.powi` and 
`llvm.pow` which raise a floating point value to an integer or floating point
value respectively. However, it would be impossible for the compiler
to eliminate the overflow checks on multiplication and subtraction, since it doesn't
know the either the value, or the power we're raising the value to. Therefore,
it would be improper for the compiler to replace the program with something
like a call to a `pow` intrinsic.

Which means, that other than eliminating the initial `entry` block, this code
is as optimized as llvm can safely make it.
