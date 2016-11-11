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
  %16 = load i64, i64* %6
  %17 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %0, i64 %16)
  %18 = extractvalue { i64, i1 } %17, 1
  %19 = extractvalue { i64, i1 } %17, 0
  br i1 %18, label %error, label %noerror

error:                                            ; preds = %entry
  call void @overflow_fail(i64 29)
  ret i64 0

noerror:                                          ; preds = %entry
  %20 = load i64, i64* %7
  %21 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %20)
  %22 = extractvalue { i64, i1 } %21, 1
  %23 = extractvalue { i64, i1 } %21, 0
  br i1 %22, label %error1, label %noerror2

error1:                                           ; preds = %noerror
  call void @overflow_fail(i64 42)
  ret i64 0

noerror2:                                         ; preds = %noerror
  %24 = load i64, i64* %8
  %25 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %2, i64 %24)
  %26 = extractvalue { i64, i1 } %25, 1
  %27 = extractvalue { i64, i1 } %25, 0
  br i1 %26, label %error3, label %noerror4

error3:                                           ; preds = %noerror2
  call void @overflow_fail(i64 55)
  ret i64 0

noerror4:                                         ; preds = %noerror2
  %28 = load i64, i64* %9
  %29 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %27, i64 %28)
  %30 = extractvalue { i64, i1 } %29, 1
  %31 = extractvalue { i64, i1 } %29, 0
  br i1 %30, label %error5, label %noerror6

error5:                                           ; preds = %noerror4
  call void @overflow_fail(i64 52)
  ret i64 0

noerror6:                                         ; preds = %noerror4
  %32 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %23, i64 %31)
  %33 = extractvalue { i64, i1 } %32, 1
  %34 = extractvalue { i64, i1 } %32, 0
  br i1 %33, label %error7, label %noerror8

error7:                                           ; preds = %noerror6
  call void @overflow_fail(i64 39)
  ret i64 0

noerror8:                                         ; preds = %noerror6
  %35 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %19, i64 %34)
  %36 = extractvalue { i64, i1 } %35, 1
  %37 = extractvalue { i64, i1 } %35, 0
  br i1 %36, label %error9, label %noerror10

error9:                                           ; preds = %noerror8
  call void @overflow_fail(i64 26)
  ret i64 0

noerror10:                                        ; preds = %noerror8
  ret i64 %37
}
