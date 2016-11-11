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

test:                                             ; preds = %exit, %entry
  %"loop value" = phi i64 [ 0, %entry ], [ %"loop value2", %exit ]
  br i1 false, label %body, label %exit4

body:                                             ; preds = %test
  br label %test1

test1:                                            ; preds = %body3, %body
  %"loop value2" = phi i64 [ 0, %body ], [ 0, %body3 ]
  br i1 false, label %body3, label %exit

body3:                                            ; preds = %test1
  br label %test1

exit:                                             ; preds = %test1
  br label %test

exit4:                                            ; preds = %test
  ret i64 %"loop value"
}
