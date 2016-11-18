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
  %17 = load i64, i64* %7
  %18 = load i64, i64* %8
  %19 = load i64, i64* %9
  %20 = load i64, i64* %10
  %21 = load i64, i64* %11
  %22 = load i64, i64* %12
  %23 = load i64, i64* %13
  %24 = load i64, i64* %14
  %25 = load i64, i64* %15
  %26 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %24, i64 %25)
  %27 = extractvalue { i64, i1 } %26, 1
  %28 = extractvalue { i64, i1 } %26, 0
  br i1 %27, label %error, label %noerror

error:                                            ; preds = %entry
  call void @overflow_fail(i64 67)
  ret i64 0

noerror:                                          ; preds = %entry
  %29 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %23, i64 %28)
  %30 = extractvalue { i64, i1 } %29, 1
  %31 = extractvalue { i64, i1 } %29, 0
  br i1 %30, label %error1, label %noerror2

error1:                                           ; preds = %noerror
  call void @overflow_fail(i64 61)
  ret i64 0

noerror2:                                         ; preds = %noerror
  %32 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %22, i64 %31)
  %33 = extractvalue { i64, i1 } %32, 1
  %34 = extractvalue { i64, i1 } %32, 0
  br i1 %33, label %error3, label %noerror4

error3:                                           ; preds = %noerror2
  call void @overflow_fail(i64 55)
  ret i64 0

noerror4:                                         ; preds = %noerror2
  %35 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %21, i64 %34)
  %36 = extractvalue { i64, i1 } %35, 1
  %37 = extractvalue { i64, i1 } %35, 0
  br i1 %36, label %error5, label %noerror6

error5:                                           ; preds = %noerror4
  call void @overflow_fail(i64 49)
  ret i64 0

noerror6:                                         ; preds = %noerror4
  %38 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %20, i64 %37)
  %39 = extractvalue { i64, i1 } %38, 1
  %40 = extractvalue { i64, i1 } %38, 0
  br i1 %39, label %error7, label %noerror8

error7:                                           ; preds = %noerror6
  call void @overflow_fail(i64 43)
  ret i64 0

noerror8:                                         ; preds = %noerror6
  %41 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %19, i64 %40)
  %42 = extractvalue { i64, i1 } %41, 1
  %43 = extractvalue { i64, i1 } %41, 0
  br i1 %42, label %error9, label %noerror10

error9:                                           ; preds = %noerror8
  call void @overflow_fail(i64 37)
  ret i64 0

noerror10:                                        ; preds = %noerror8
  %44 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %18, i64 %43)
  %45 = extractvalue { i64, i1 } %44, 1
  %46 = extractvalue { i64, i1 } %44, 0
  br i1 %45, label %error11, label %noerror12

error11:                                          ; preds = %noerror10
  call void @overflow_fail(i64 31)
  ret i64 0

noerror12:                                        ; preds = %noerror10
  %47 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %17, i64 %46)
  %48 = extractvalue { i64, i1 } %47, 1
  %49 = extractvalue { i64, i1 } %47, 0
  br i1 %48, label %error13, label %noerror14

error13:                                          ; preds = %noerror12
  call void @overflow_fail(i64 25)
  ret i64 0

noerror14:                                        ; preds = %noerror12
  %50 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %16, i64 %49)
  %51 = extractvalue { i64, i1 } %50, 1
  %52 = extractvalue { i64, i1 } %50, 0
  br i1 %51, label %error15, label %noerror16

error15:                                          ; preds = %noerror14
  call void @overflow_fail(i64 19)
  ret i64 0

noerror16:                                        ; preds = %noerror14
  ret i64 %52
}
