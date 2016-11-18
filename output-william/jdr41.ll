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

test:                                             ; preds = %noerror16, %entry
  %"loop value" = phi i64 [ 0, %entry ], [ 0, %noerror16 ]
  %16 = load i64, i64* %6
  %"!=" = icmp ne i64 %16, %0
  br i1 %"!=", label %body, label %exit17

body:                                             ; preds = %test
  br label %test1

test1:                                            ; preds = %noerror14, %body
  %"loop value2" = phi i64 [ 0, %body ], [ %42, %noerror14 ]
  %17 = load i64, i64* %7
  %"!=3" = icmp ne i64 %17, %0
  br i1 %"!=3", label %body4, label %exit

body4:                                            ; preds = %test1
  %18 = load i64, i64* %7
  %19 = load i64, i64* %7
  %20 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %18, i64 %19)
  %21 = extractvalue { i64, i1 } %20, 1
  %22 = extractvalue { i64, i1 } %20, 0
  br i1 %21, label %error, label %noerror

error:                                            ; preds = %body4
  call void @overflow_fail(i64 266)
  ret i64 0

noerror:                                          ; preds = %body4
  %23 = load i64, i64* %6
  %24 = load i64, i64* %6
  %25 = load i64, i64* %6
  %26 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %24, i64 %25)
  %27 = extractvalue { i64, i1 } %26, 1
  %28 = extractvalue { i64, i1 } %26, 0
  br i1 %27, label %error5, label %noerror6

error5:                                           ; preds = %noerror
  call void @overflow_fail(i64 285)
  ret i64 0

noerror6:                                         ; preds = %noerror
  %29 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %23, i64 %28)
  %30 = extractvalue { i64, i1 } %29, 1
  %31 = extractvalue { i64, i1 } %29, 0
  br i1 %30, label %error7, label %noerror8

error7:                                           ; preds = %noerror6
  call void @overflow_fail(i64 279)
  ret i64 0

noerror8:                                         ; preds = %noerror6
  %32 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %31, i64 4)
  %33 = extractvalue { i64, i1 } %32, 1
  %34 = extractvalue { i64, i1 } %32, 0
  br i1 %33, label %error9, label %noerror10

error9:                                           ; preds = %noerror8
  call void @overflow_fail(i64 276)
  ret i64 0

noerror10:                                        ; preds = %noerror8
  %"==" = icmp eq i64 %22, %34
  br i1 %"==", label %true, label %false

true:                                             ; preds = %noerror10
  br label %merge

false:                                            ; preds = %noerror10
  br label %merge

merge:                                            ; preds = %false, %true
  %ifret = phi i64 [ 1, %true ], [ 0, %false ]
  %35 = load i64, i64* %8
  %36 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %ifret, i64 %35)
  %37 = extractvalue { i64, i1 } %36, 1
  %38 = extractvalue { i64, i1 } %36, 0
  br i1 %37, label %error11, label %noerror12

error11:                                          ; preds = %merge
  call void @overflow_fail(i64 255)
  ret i64 0

noerror12:                                        ; preds = %merge
  store i64 %38, i64* %8
  %39 = load i64, i64* %7
  %40 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %39)
  %41 = extractvalue { i64, i1 } %40, 1
  %42 = extractvalue { i64, i1 } %40, 0
  br i1 %41, label %error13, label %noerror14

error13:                                          ; preds = %noerror12
  call void @overflow_fail(i64 334)
  ret i64 0

noerror14:                                        ; preds = %noerror12
  store i64 %42, i64* %7
  br label %test1

exit:                                             ; preds = %test1
  %43 = load i64, i64* %6
  %44 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %43)
  %45 = extractvalue { i64, i1 } %44, 1
  %46 = extractvalue { i64, i1 } %44, 0
  br i1 %45, label %error15, label %noerror16

error15:                                          ; preds = %exit
  call void @overflow_fail(i64 368)
  ret i64 0

noerror16:                                        ; preds = %exit
  store i64 %46, i64* %6
  store i64 0, i64* %7
  br label %test

exit17:                                           ; preds = %test
  %47 = load i64, i64* %8
  ret i64 %47
}
