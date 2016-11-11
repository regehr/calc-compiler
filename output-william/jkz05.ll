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

test:                                             ; preds = %noerror2, %entry
  %"loop value" = phi i64 [ 0, %entry ], [ %24, %noerror2 ]
  %16 = load i64, i64* %6
  %17 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %16, i64 1)
  %18 = extractvalue { i64, i1 } %17, 1
  %19 = extractvalue { i64, i1 } %17, 0
  br i1 %18, label %error, label %noerror

error:                                            ; preds = %test
  call void @overflow_fail(i64 46)
  ret i64 0

noerror:                                          ; preds = %test
  store i64 %19, i64* %6
  %20 = load i64, i64* %7
  %"<" = icmp slt i64 %20, 10
  br i1 %"<", label %body, label %exit

body:                                             ; preds = %noerror
  %21 = load i64, i64* %7
  %22 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %21, i64 1)
  %23 = extractvalue { i64, i1 } %22, 1
  %24 = extractvalue { i64, i1 } %22, 0
  br i1 %23, label %error1, label %noerror2

error1:                                           ; preds = %body
  call void @overflow_fail(i64 123)
  ret i64 0

noerror2:                                         ; preds = %body
  store i64 %24, i64* %7
  br label %test

exit:                                             ; preds = %noerror
  %25 = load i64, i64* %6
  ret i64 %25
}
