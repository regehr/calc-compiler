; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64)

declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64)

declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64)

declare void @overflow_fail(i64)

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
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
  br label %test

test:                                             ; preds = %merge, %entry
  %"loop value" = phi i64 [ 0, %entry ], [ %ifret, %merge ]
  br i1 false, label %body, label %exit

body:                                             ; preds = %test
  br i1 true, label %true, label %false

true:                                             ; preds = %body
  br label %merge

false:                                            ; preds = %body
  br label %merge

merge:                                            ; preds = %false, %true
  %ifret = phi i64 [ 0, %true ], [ 0, %false ]
  br label %test

exit:                                             ; preds = %test
  ret i64 %"loop value"
}
