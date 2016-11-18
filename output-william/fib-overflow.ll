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
  %"<=" = icmp sle i64 %0, 0
  br i1 %"<=", label %true, label %false

true:                                             ; preds = %entry
  br label %merge

false:                                            ; preds = %entry
  store i64 1, i64* %7
  store i64 1, i64* %8
  br label %test

test:                                             ; preds = %noerror2, %false
  %"loop value" = phi i64 [ 0, %false ], [ %27, %noerror2 ]
  %16 = load i64, i64* %8
  %"<" = icmp slt i64 %16, %0
  br i1 %"<", label %body, label %exit

body:                                             ; preds = %test
  %17 = load i64, i64* %8
  %18 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %17, i64 1)
  %19 = extractvalue { i64, i1 } %18, 1
  %20 = extractvalue { i64, i1 } %18, 0
  br i1 %19, label %error, label %noerror

error:                                            ; preds = %body
  call void @overflow_fail(i64 142)
  ret i64 0

noerror:                                          ; preds = %body
  store i64 %20, i64* %8
  %21 = load i64, i64* %7
  store i64 %21, i64* %9
  %22 = load i64, i64* %7
  %23 = load i64, i64* %6
  %24 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %22, i64 %23)
  %25 = extractvalue { i64, i1 } %24, 1
  %26 = extractvalue { i64, i1 } %24, 0
  br i1 %25, label %error1, label %noerror2

error1:                                           ; preds = %noerror
  call void @overflow_fail(i64 198)
  ret i64 0

noerror2:                                         ; preds = %noerror
  store i64 %26, i64* %7
  %27 = load i64, i64* %9
  store i64 %27, i64* %6
  br label %test

exit:                                             ; preds = %test
  %28 = load i64, i64* %7
  br label %merge

merge:                                            ; preds = %exit, %true
  %ifret = phi i64 [ 0, %true ], [ %28, %exit ]
  ret i64 %ifret
}
