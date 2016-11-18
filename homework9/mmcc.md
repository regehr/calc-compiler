We will investigate the below calc program:

		(seq
		  (set a0 m0)
		  (seq
		    (while
		      (!= m0 1)
		      (if (== 0 (% m0 2))
			  (set (/ m0 2) m0)
			  (set (+ (* 3 m0) 1) m0)))
		  m0))

It is equivalent to the following general pseudocode:

		m0 := a0

		while (m0 != 1):
			if ((m0 % 2) == 0):
				m0 := m0 / 2
			else:
				m0 := (3 * m0) + 1

		return m0

The expected return value is `1`.

We will consider the effect of each LLVM optimization pass in the order
in which they are executed. Some duplicate passes are omitted.

## Module Verifier

This pass ensures that there are no easily recognizable errors in the
code given to LLVM. If there is, LLVM will print an explanation of the
problem with diagnostics. Such errors are bugs in the compiler rather
than the user-supplied calc program. That is, a compiler should never
emit LLVM that fails module verification.

## Simplify the CFG

This pass does basic simplification and compaction of the CFG. For
example, our code immediately loads the same memory value in both
branches of an if-else condition:

		body:                                             ; preds = %while-cond
		  %19 = load i64, i64* %6
		  %20 = srem i64 %19, 2
		  %21 = icmp eq i64 0, %20
		  br i1 %21, label %if, label %else

		[...]

		if:                                               ; preds = %body
		  %24 = load i64, i64* %6
		  %25 = sdiv i64 %24, 2
		  store i64 %25, i64* %6
		  br label %after1

		else:                                             ; preds = %body
		  %26 = load i64, i64* %6
		  %27 = mul i64 3, %26
		  %28 = add i64 %27, 1
		  store i64 %28, i64* %6
		  br label %after1

This optimization pass moves the load to the condition evaluation
preceding the branch, representing the same logic with only one load
instruction:

		body:                                             ; preds = %while-cond
		  %19 = load i64, i64* %6
		  %20 = srem i64 %19, 2
		  %21 = icmp eq i64 0, %20
		  %22 = load i64, i64* %6
		  br i1 %21, label %if, label %else

		[...]

		if:                                               ; preds = %body
		  %25 = sdiv i64 %22, 2
		  store i64 %25, i64* %6
		  br label %after1

		else:                                             ; preds = %body
		  %26 = mul i64 3, %22
		  %27 = add i64 %26, 1
		  store i64 %27, i64* %6
		  br label %after1

This pass is called intermittently throughout optimization to clean up
potentially wasteful idioms that result from more specific passes.

## SROA

Perhaps the most significant optimization is that the program's
language-defined state is converted from `alloca`-allocated memory
locations to registers. This in the second optimization pass: scalar
replacement of aggregates.

Initially, the program's mutable state consists of ten mutable variables
(`m0`-`m9`) and a hidden variable used to store the return result of a
while loop. (This while loop variable allows us to easily return zero
when the loop body never executes.) Therefore, the unoptimized program
begins with the following `alloca` and `store` calls to allocate and
store this memory:

		%6 = alloca i64
		store i64 0, i64* %6
		%7 = alloca i64
		store i64 0, i64* %7
		%8 = alloca i64
		store i64 0, i64* %8
		%9 = alloca i64
		store i64 0, i64* %9
		%10 = alloca i64
		store i64 0, i64* %10
		%11 = alloca i64
		store i64 0, i64* %11
		%12 = alloca i64
		store i64 0, i64* %12
		%13 = alloca i64
		store i64 0, i64* %13
		%14 = alloca i64
		store i64 0, i64* %14
		%15 = alloca i64
		store i64 0, i64* %15
		%16 = alloca i64
		store i64 0, i64* %16
		store i64 %0, i64* %6
		store i64 0, i64* %16

An AMD64 processor can store all of these in registers, and the SROA
pass recognizes that our program only uses one mutable variable (`m0`)
anyway), so there is no need to keep them in memory. Furthermore,
because the program logic is relatively simple, SROA can easily convert
the `load` and `store` calls to the static single assignment (SSA) form
necessary for use of LLVM registers. Also, because the program begins by
initializing `m0` to `a0`, we do not need to zero `m0`'s register with a
`store` call. Thus, the entire block shown above is completely
eliminated by SROA.

When one considers the while loop and the subsequent return statement,
it becomes clear that there are only two possible outcomes: the program
must either loop infinitely or return `1`. However, the compiler cannot
make any assumptions about the value of `m0` because it is assigned the
value of `a0`, a command line argument. The problem of determining
whether this loop terminates in all cases is known as the Collatz
conjecture and was recently called by a top mathematician "an
extraordinarily difficult problem, completely out of reach of present
day mathematics". Therefore, even a smart optimizer cannot make this
determination and replace the code block with either an empty infinite
loop or an immediate return of `1`. However, LLVM manages to simplify
the code significantly.

## Early CSE

This optimization pass performs common subexpression elimination. It
also removes dead code, such as a `phi` instruction in the `while-cond`
and `after1` blocks. In the case of this function, no actual common
subexpressions were eliminated.

## Promote Memory to Register

This pass does fundamentally what we described the SROA pass doing.
There are no remaining uses of memory in our code, so there is no work
left for this pass.

## Dead Argument Elimination

Although we only use the first argument to our function, the remaining
arguments must remain because they are a set part of this function's
API/ABI. Therefore, this pass does nothing.

## Simplify the CFG

This pass realizes that the `if` and `else` blocks only compute a
single value that is then used by the following `after` block through a
`phi`:

	body:                                             ; preds = %while-cond
	  %7 = and i64 %.05, 1
	  %8 = icmp eq i64 %7, 0
	  br i1 %8, label %if, label %else

	if:                                               ; preds = %body
	  %9 = sdiv i64 %.05, 2
	  br label %after1

	else:                                             ; preds = %body
	  %10 = mul i64 %.05, 3
	  %11 = add i64 %10, 1
	  br label %after1

	after1:                                           ; preds = %else, %if
	  %.1 = phi i64 [ %9, %if ], [ %11, %else ]

This can be easily changed to a select. In this case, both arithmetic
operations are computed, but LLVM has determined that the simplicity of
these operations is outweighed by the benefit of removing the additional
code volume and indirection:

body:                                             ; preds = %while-cond
  %7 = and i64 %.05, 1
  %8 = icmp eq i64 %7, 0
  %9 = sdiv i64 %.05, 2
  %10 = mul i64 %.05, 3
  %11 = add i64 %10, 1
  %.1 = select i1 %8, i64 %9, i64 %11
  br label %while-cond

## Rotate Loops

This pass collapses the `while-cond` block into the `body` block,
leaving us with only a single basic block and thereby removing the
function notation. It does this simplification by adding a `phi`
instruction to the beginning of the loop that sets a register
determining whether the loop body has ever been executed, and adding a
comparison to the end of the function that sets the return value based
on this variable. This allows us to still return zero if the loop body
was never supposed to execute. Note that it does still execute the loop
body once even if it never executes according to the program logic. LLVM
has deemed this to be harmless.

## Loop Invariant Code Motion
## Unswitch loops
## Loop-Closed SSA Form Pass
## Induction Variable Simplification
## Recognize loop idioms
## Delete dead loops
## Unroll loops
## MergedLoadStoreMotion
## Global Value Numbering
## MemCpy Optimization
## Sparse Conditional Constant Propagation
## Demanded bits analysis
## Bit-Tracking Dead Code Elimination
## Jump Threading
## Value Propagation
## Dead Store Elimination
## Loop-Closed SSA Form Pass
## Loop Invariant Code Motion
## Aggressive Dead Code Elimination
## Remove unused exception handling info
## Function Integration/Inlining
## Deduce function attributes
## A No-Op Barrier Pass
## Eliminate Available Externally Globals
## Deduce function attributes in RPO
## Loop-Closed SSA Form Pass
## Loop Distribition
## Demanded bits analysis
## Loop Vectorization
## Loop Load Elimination
## Demanded bits analysis
## SLP Vectorizer
## Loop Invariant Code Motion
## Remove redundant instructions
## Alignment from assumptions
## Strip Unused Function Prototypes
## Dead Global Elimination
## Merge Duplicate Global Constants
## Module Verifier

This pass checks once again to ensure that there are no easily
identifiable errors in the code. If this pass fails, it means that
either the optimization passes exposed an error that wasn't recognized
in the first pass, or that the optimization passes contain a bug that
introduced an error to our code.
