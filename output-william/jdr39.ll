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

test:                                             ; preds = %noerror8, %entry
  %"loop value" = phi i64 [ 0, %entry ], [ 0, %noerror8 ]
  %16 = load i64, i64* %6
  %"!=" = icmp ne i64 %16, %0
  br i1 %"!=", label %body, label %exit9

body:                                             ; preds = %test
  br label %test1

test1:                                            ; preds = %noerror6, %body
  %"loop value2" = phi i64 [ 0, %body ], [ %25, %noerror6 ]
  %17 = load i64, i64* %7
  %"!=3" = icmp ne i64 %17, %0
  br i1 %"!=3", label %body4, label %exit

body4:                                            ; preds = %test1
  %18 = load i64, i64* %8
  %19 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %18)
  %20 = extractvalue { i64, i1 } %19, 1
  %21 = extractvalue { i64, i1 } %19, 0
  br i1 %20, label %error, label %noerror

error:                                            ; preds = %body4
  call void @overflow_fail(i64 115)
  ret i64 0

noerror:                                          ; preds = %body4
  store i64 %21, i64* %8
  %22 = load i64, i64* %7
  %23 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %22)
  %24 = extractvalue { i64, i1 } %23, 1
  %25 = extractvalue { i64, i1 } %23, 0
  br i1 %24, label %error5, label %noerror6

error5:                                           ; preds = %noerror
  call void @overflow_fail(i64 149)
  ret i64 0

noerror6:                                         ; preds = %noerror
  store i64 %25, i64* %7
  br label %test1

exit:                                             ; preds = %test1
  %26 = load i64, i64* %6
  %27 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %26)
  %28 = extractvalue { i64, i1 } %27, 1
  %29 = extractvalue { i64, i1 } %27, 0
  br i1 %28, label %error7, label %noerror8

error7:                                           ; preds = %exit
  call void @overflow_fail(i64 183)
  ret i64 0

noerror8:                                         ; preds = %exit
  store i64 %29, i64* %6
  store i64 0, i64* %7
  br label %test

exit9:                                            ; preds = %test
  %30 = load i64, i64* %8
  ret i64 %30
}
