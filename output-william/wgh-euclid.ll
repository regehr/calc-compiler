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
  store i64 %0, i64* %6
  store i64 %1, i64* %7
  br label %test

test:                                             ; preds = %noerror, %entry
  %"loop value" = phi i64 [ 0, %entry ], [ %20, %noerror ]
  %16 = load i64, i64* %7
  %"!=" = icmp ne i64 %16, 0
  br i1 %"!=", label %body, label %exit

body:                                             ; preds = %test
  %17 = load i64, i64* %7
  store i64 %17, i64* %8
  %18 = load i64, i64* %6
  %19 = load i64, i64* %7
  %"==" = icmp eq i64 %19, 0
  br i1 %"==", label %error, label %noerror

error:                                            ; preds = %body
  call void @overflow_fail(i64 135)
  ret i64 0

noerror:                                          ; preds = %body
  %"%" = srem i64 %18, %19
  store i64 %"%", i64* %7
  %20 = load i64, i64* %8
  store i64 %20, i64* %6
  br label %test

exit:                                             ; preds = %test
  %21 = load i64, i64* %6
  ret i64 %21
}
