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
  store i64 1, i64* %6
  store i64 1, i64* %7
  br label %test

test:                                             ; preds = %noerror2, %entry
  %"loop value" = phi i64 [ 0, %entry ], [ %26, %noerror2 ]
  %16 = load i64, i64* %7
  %"<=" = icmp sle i64 %16, %0
  br i1 %"<=", label %body, label %exit

body:                                             ; preds = %test
  %17 = load i64, i64* %6
  %18 = load i64, i64* %7
  %19 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %17, i64 %18)
  %20 = extractvalue { i64, i1 } %19, 1
  %21 = extractvalue { i64, i1 } %19, 0
  br i1 %20, label %error, label %noerror

error:                                            ; preds = %body
  call void @overflow_fail(i64 115)
  ret i64 0

noerror:                                          ; preds = %body
  store i64 %21, i64* %6
  %22 = load i64, i64* %7
  %23 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %22, i64 1)
  %24 = extractvalue { i64, i1 } %23, 1
  %25 = extractvalue { i64, i1 } %23, 0
  br i1 %24, label %error1, label %noerror2

error1:                                           ; preds = %noerror
  call void @overflow_fail(i64 161)
  ret i64 0

noerror2:                                         ; preds = %noerror
  store i64 %25, i64* %7
  %26 = load i64, i64* %6
  br label %test

exit:                                             ; preds = %test
  ret i64 %"loop value"
}
