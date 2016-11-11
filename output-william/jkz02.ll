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
  br i1 true, label %true, label %false

true:                                             ; preds = %entry
  %16 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 500)
  %17 = extractvalue { i64, i1 } %16, 1
  %18 = extractvalue { i64, i1 } %16, 0
  br i1 %17, label %error, label %noerror

error:                                            ; preds = %true
  call void @overflow_fail(i64 60)
  ret i64 0

noerror:                                          ; preds = %true
  store i64 %18, i64* %6
  br label %merge

false:                                            ; preds = %entry
  %19 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 0)
  %20 = extractvalue { i64, i1 } %19, 1
  %21 = extractvalue { i64, i1 } %19, 0
  br i1 %20, label %error1, label %noerror2

error1:                                           ; preds = %false
  call void @overflow_fail(i64 93)
  ret i64 0

noerror2:                                         ; preds = %false
  store i64 %21, i64* %6
  br label %merge

merge:                                            ; preds = %noerror2, %noerror
  %ifret = phi i64 [ %18, %noerror ], [ %21, %noerror2 ]
  br i1 true, label %true3, label %false6

true3:                                            ; preds = %merge
  %22 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 1)
  %23 = extractvalue { i64, i1 } %22, 1
  %24 = extractvalue { i64, i1 } %22, 0
  br i1 %23, label %error4, label %noerror5

error4:                                           ; preds = %true3
  call void @overflow_fail(i64 125)
  ret i64 0

noerror5:                                         ; preds = %true3
  br label %merge9

false6:                                           ; preds = %merge
  %25 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 0)
  %26 = extractvalue { i64, i1 } %25, 1
  %27 = extractvalue { i64, i1 } %25, 0
  br i1 %26, label %error7, label %noerror8

error7:                                           ; preds = %false6
  call void @overflow_fail(i64 133)
  ret i64 0

noerror8:                                         ; preds = %false6
  br label %merge9

merge9:                                           ; preds = %noerror8, %noerror5
  %ifret10 = phi i64 [ %24, %noerror5 ], [ %27, %noerror8 ]
  %28 = load i64, i64* %6
  ret i64 %28
}
