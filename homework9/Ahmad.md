LLVM Optimizer Pass Homework #9


Original program fib.calc 

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

---------------------------------------------------------------------------------------------------------
Original LLVM IR obtained by ./calcc -check < fib.calc

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
  %lethan = icmp sle i64 %0, 0
  br i1 %lethan, label %then, label %else

then:                                             ; preds = %entry
  br label %merge

else:                                             ; preds = %entry
  store i64 1, i64* %Mutable1
  store i64 1, i64* %Mutable2
  br label %whileEntry

whileEntry:                                       ; preds = %else5, %else
  %phiNode = phi i64 [ 0, %else ], [ %18, %else5 ]
  %6 = load i64, i64* %Mutable2
  %lthan = icmp slt i64 %6, %0
  br i1 %lthan, label %whileBody, label %whileExit

whileBody:                                        ; preds = %whileEntry
  %7 = load i64, i64* %Mutable2
  %8 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %7, i64 1)
  %9 = extractvalue { i64, i1 } %8, 0
  %10 = extractvalue { i64, i1 } %8, 1
  br i1 %10, label %then1, label %else2

whileExit:                                        ; preds = %whileEntry
  %11 = load i64, i64* %Mutable1
  br label %merge

then1:                                            ; preds = %whileBody
  %calltrap = call i64 @overflow_fail(i64 125)
  br label %else2

else2:                                            ; preds = %then1, %whileBody
  store i64 %9, i64* %Mutable2
  %12 = load i64, i64* %Mutable1
  store i64 %12, i64* %Mutable3
  %13 = load i64, i64* %Mutable1
  %14 = load i64, i64* %Mutable0
  %15 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %13, i64 %14)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %then3, label %else5

then3:                                            ; preds = %else2
  %calltrap4 = call i64 @overflow_fail(i64 181)
  br label %else5

else5:                                            ; preds = %then3, %else2
  store i64 %16, i64* %Mutable1
  %18 = load i64, i64* %Mutable3
  store i64 %18, i64* %Mutable0
  br label %whileEntry

merge:                                            ; preds = %whileExit, %then
  %phiNode6 = phi i64 [ 0, %then ], [ %11, %whileExit ]
  ret i64 %phiNode6
}


---------------------------------------------------------------------------------------------------------
The Simplify CFG optimization pass performs dead code elimination and merges basic blocks with no predecessors

*** IR Dump After Simplify the CFG ***
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
  %lethan = icmp sle i64 %0, 0
  br i1 %lethan, label %merge, label %else

else:                                             ; preds = %entry
  store i64 1, i64* %Mutable1
  store i64 1, i64* %Mutable2
  br label %whileEntry

whileEntry:                                       ; preds = %else5, %else
  %phiNode = phi i64 [ 0, %else ], [ %18, %else5 ]
  %6 = load i64, i64* %Mutable2
  %lthan = icmp slt i64 %6, %0
  br i1 %lthan, label %whileBody, label %whileExit

whileBody:                                        ; preds = %whileEntry
  %7 = load i64, i64* %Mutable2
  %8 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %7, i64 1)
  %9 = extractvalue { i64, i1 } %8, 0
  %10 = extractvalue { i64, i1 } %8, 1
  br i1 %10, label %then1, label %else2

whileExit:                                        ; preds = %whileEntry
  %11 = load i64, i64* %Mutable1
  br label %merge

then1:                                            ; preds = %whileBody
  %calltrap = call i64 @overflow_fail(i64 125)
  br label %else2

else2:                                            ; preds = %then1, %whileBody
  store i64 %9, i64* %Mutable2
  %12 = load i64, i64* %Mutable1
  store i64 %12, i64* %Mutable3
  %13 = load i64, i64* %Mutable1
  %14 = load i64, i64* %Mutable0
  %15 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %13, i64 %14)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %then3, label %else5

then3:                                            ; preds = %else2
  %calltrap4 = call i64 @overflow_fail(i64 181)
  br label %else5

else5:                                            ; preds = %then3, %else2
  store i64 %16, i64* %Mutable1
  %18 = load i64, i64* %Mutable3
  store i64 %18, i64* %Mutable0
  br label %whileEntry

merge:                                            ; preds = %entry, %whileExit
  %phiNode6 = phi i64 [ %11, %whileExit ], [ 0, %entry ]
  ret i64 %phiNode6
}

---------------------------------------------------------------------------------------------------------
The Scalar Replacement of Aggregates optimization pass replaces the long entry block with a whileEntry loop that declares and initializes the mutable variables

*** IR Dump After SROA ***
define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %lethan = icmp sle i64 %0, 0
  br i1 %lethan, label %merge, label %else

else:                                             ; preds = %entry
  br label %whileEntry

whileEntry:                                       ; preds = %else5, %else
  %Mutable2.0 = phi i64 [ 1, %else ], [ %7, %else5 ]
  %Mutable1.0 = phi i64 [ 1, %else ], [ %10, %else5 ]
  %Mutable0.0 = phi i64 [ 0, %else ], [ %Mutable1.0, %else5 ]
  %phiNode = phi i64 [ 0, %else ], [ %Mutable1.0, %else5 ]
  %lthan = icmp slt i64 %Mutable2.0, %0
  br i1 %lthan, label %whileBody, label %whileExit

whileBody:                                        ; preds = %whileEntry
  %6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %Mutable2.0, i64 1)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %then1, label %else2

whileExit:                                        ; preds = %whileEntry
  br label %merge

then1:                                            ; preds = %whileBody
  %calltrap = call i64 @overflow_fail(i64 125)
  br label %else2

else2:                                            ; preds = %then1, %whileBody
  %9 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %Mutable1.0, i64 %Mutable0.0)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %then3, label %else5

then3:                                            ; preds = %else2
  %calltrap4 = call i64 @overflow_fail(i64 181)
  br label %else5

else5:                                            ; preds = %then3, %else2
  br label %whileEntry

merge:                                            ; preds = %entry, %whileExit
  %phiNode6 = phi i64 [ %Mutable1.0, %whileExit ], [ 0, %entry ]
  ret i64 %phiNode6
}
  
---------------------------------------------------------------------------------------------------------
The Early Common Subexpression Elimination optimization pass eliminates common trivially redundant instructions

*** IR Dump After Early CSE ***
define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %lethan = icmp sle i64 %0, 0
  br i1 %lethan, label %merge, label %else

else:                                             ; preds = %entry
  br label %whileEntry

whileEntry:                                       ; preds = %else5, %else
  %Mutable2.0 = phi i64 [ 1, %else ], [ %7, %else5 ]
  %Mutable1.0 = phi i64 [ 1, %else ], [ %10, %else5 ]
  %Mutable0.0 = phi i64 [ 0, %else ], [ %Mutable1.0, %else5 ]
  %lthan = icmp slt i64 %Mutable2.0, %0
  br i1 %lthan, label %whileBody, label %whileExit

whileBody:                                        ; preds = %whileEntry
  %6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %Mutable2.0, i64 1)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %then1, label %else2

whileExit:                                        ; preds = %whileEntry
  br label %merge

then1:                                            ; preds = %whileBody
  %calltrap = call i64 @overflow_fail(i64 125)
  br label %else2

else2:                                            ; preds = %then1, %whileBody
  %9 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %Mutable1.0, i64 %Mutable0.0)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %then3, label %else5

then3:                                            ; preds = %else2
  %calltrap4 = call i64 @overflow_fail(i64 181)
  br label %else5

else5:                                            ; preds = %then3, %else2
  br label %whileEntry

merge:                                            ; preds = %entry, %whileExit
  %phiNode6 = phi i64 [ %Mutable1.0, %whileExit ], [ 0, %entry ]
  ret i64 %phiNode6
}

---------------------------------------------------------------------------------------------------------
Global Variable Optimizer pass marks the use of global variables using "local_unnamed_addr"

*** IR Dump After Early GVN Hoisting of Expressions ***
define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %lethan = icmp sle i64 %0, 0
  br i1 %lethan, label %merge, label %else

else:                                             ; preds = %entry
  br label %whileEntry

whileEntry:                                       ; preds = %else5, %else
  %Mutable2.0 = phi i64 [ 1, %else ], [ %7, %else5 ]
  %Mutable1.0 = phi i64 [ 1, %else ], [ %10, %else5 ]
  %Mutable0.0 = phi i64 [ 0, %else ], [ %Mutable1.0, %else5 ]
  %lthan = icmp slt i64 %Mutable2.0, %0
  br i1 %lthan, label %whileBody, label %whileExit

whileBody:                                        ; preds = %whileEntry
  %6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %Mutable2.0, i64 1)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %then1, label %else2

whileExit:                                        ; preds = %whileEntry
  br label %merge

then1:                                            ; preds = %whileBody
  %calltrap = call i64 @overflow_fail(i64 125)
  br label %else2

else2:                                            ; preds = %then1, %whileBody
  %9 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %Mutable1.0, i64 %Mutable0.0)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %then3, label %else5

then3:                                            ; preds = %else2
  %calltrap4 = call i64 @overflow_fail(i64 181)
  br label %else5

else5:                                            ; preds = %then3, %else2
  br label %whileEntry

merge:                                            ; preds = %entry, %whileExit
  %phiNode6 = phi i64 [ %Mutable1.0, %whileExit ], [ 0, %entry ]
  ret i64 %phiNode6
}

---------------------------------------------------------------------------------------------------------
Promote Memory to Register optimization pass promotes memory references to registers

*** IR Dump After Promote Memory to Register ***
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {
entry:
  %lethan = icmp sle i64 %0, 0
  br i1 %lethan, label %merge, label %else

else:                                             ; preds = %entry
  br label %whileEntry

whileEntry:                                       ; preds = %else5, %else
  %Mutable2.0 = phi i64 [ 1, %else ], [ %7, %else5 ]
  %Mutable1.0 = phi i64 [ 1, %else ], [ %10, %else5 ]
  %Mutable0.0 = phi i64 [ 0, %else ], [ %Mutable1.0, %else5 ]
  %lthan = icmp slt i64 %Mutable2.0, %0
  br i1 %lthan, label %whileBody, label %whileExit

whileBody:                                        ; preds = %whileEntry
  %6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %Mutable2.0, i64 1)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %then1, label %else2

whileExit:                                        ; preds = %whileEntry
  br label %merge

then1:                                            ; preds = %whileBody
  %calltrap = call i64 @overflow_fail(i64 125)
  br label %else2

else2:                                            ; preds = %then1, %whileBody
  %9 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %Mutable1.0, i64 %Mutable0.0)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %then3, label %else5

then3:                                            ; preds = %else2
  %calltrap4 = call i64 @overflow_fail(i64 181)
  br label %else5

else5:                                            ; preds = %then3, %else2
  br label %whileEntry

merge:                                            ; preds = %entry, %whileExit
  %phiNode6 = phi i64 [ %Mutable1.0, %whileExit ], [ 0, %entry ]
  ret i64 %phiNode6
}

---------------------------------------------------------------------------------------------------------
 Dead Argument Elimination optimization pass eleminates dead arguments from internal functions
 
 *** IR Dump After Dead Argument Elimination ***; ModuleID = './calcc/fib.calc.ll'
source_filename = "./calcc/fib.calc.ll"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {
entry:
  %lethan = icmp sle i64 %0, 0
  br i1 %lethan, label %merge, label %else

else:                                             ; preds = %entry
  br label %whileEntry

whileEntry:                                       ; preds = %else5, %else
  %Mutable2.0 = phi i64 [ 1, %else ], [ %7, %else5 ]
  %Mutable1.0 = phi i64 [ 1, %else ], [ %10, %else5 ]
  %Mutable0.0 = phi i64 [ 0, %else ], [ %Mutable1.0, %else5 ]
  %lthan = icmp slt i64 %Mutable2.0, %0
  br i1 %lthan, label %whileBody, label %whileExit

whileBody:                                        ; preds = %whileEntry
  %6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %Mutable2.0, i64 1)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %then1, label %else2

whileExit:                                        ; preds = %whileEntry
  br label %merge

then1:                                            ; preds = %whileBody
  %calltrap = call i64 @overflow_fail(i64 125)
  br label %else2

else2:                                            ; preds = %then1, %whileBody
  %9 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %Mutable1.0, i64 %Mutable0.0)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %then3, label %else5

then3:                                            ; preds = %else2
  %calltrap4 = call i64 @overflow_fail(i64 181)
  br label %else5

else5:                                            ; preds = %then3, %else2
  br label %whileEntry

merge:                                            ; preds = %entry, %whileExit
  %phiNode6 = phi i64 [ %Mutable1.0, %whileExit ], [ 0, %entry ]
  ret i64 %phiNode6
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

declare i64 @overflow_fail(i64) local_unnamed_addr

attributes #0 = { nounwind readnone }

---------------------------------------------------------------------------------------------------------
 Combine redundant instructions this pass combines instructions to form fewer, simple algebraic instructions
 
 *** IR Dump After Combine redundant instructions ***
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {
entry:
  %lethan = icmp slt i64 %0, 1
  br i1 %lethan, label %merge, label %else

else:                                             ; preds = %entry
  br label %whileEntry

whileEntry:                                       ; preds = %else5, %else
  %Mutable2.0 = phi i64 [ 1, %else ], [ %7, %else5 ]
  %Mutable1.0 = phi i64 [ 1, %else ], [ %10, %else5 ]
  %Mutable0.0 = phi i64 [ 0, %else ], [ %Mutable1.0, %else5 ]
  %lthan = icmp slt i64 %Mutable2.0, %0
  br i1 %lthan, label %whileBody, label %whileExit

whileBody:                                        ; preds = %whileEntry
  %6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %Mutable2.0, i64 1)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %then1, label %else2

whileExit:                                        ; preds = %whileEntry
  br label %merge

then1:                                            ; preds = %whileBody
  %calltrap = call i64 @overflow_fail(i64 125)
  br label %else2

else2:                                            ; preds = %then1, %whileBody
  %9 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %Mutable1.0, i64 %Mutable0.0)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %then3, label %else5

then3:                                            ; preds = %else2
  %calltrap4 = call i64 @overflow_fail(i64 181)
  br label %else5

else5:                                            ; preds = %then3, %else2
  br label %whileEntry

merge:                                            ; preds = %entry, %whileExit
  %phiNode6 = phi i64 [ %Mutable1.0, %whileExit ], [ 0, %entry ]
  ret i64 %phiNode6
}
 
