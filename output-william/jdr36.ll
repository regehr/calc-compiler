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

test:                                             ; preds = %noerror, %entry
  %"loop value" = phi i64 [ 0, %entry ], [ 555, %noerror ]
  %16 = load i64, i64* %6
  %"!=" = icmp ne i64 %16, %0
  br i1 %"!=", label %body, label %exit

body:                                             ; preds = %test
  %17 = load i64, i64* %6
  %18 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %17)
  %19 = extractvalue { i64, i1 } %18, 1
  %20 = extractvalue { i64, i1 } %18, 0
  br i1 %19, label %error, label %noerror

error:                                            ; preds = %body
  call void @overflow_fail(i64 55)
  ret i64 0

noerror:                                          ; preds = %body
  store i64 %20, i64* %6
  br label %test

exit:                                             ; preds = %test
  ret i64 %"loop value"
}
