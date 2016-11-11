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
  %">" = icmp sgt i64 %3, %4
  br i1 %">", label %true, label %false

true:                                             ; preds = %entry
  %16 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %17 = extractvalue { i64, i1 } %16, 1
  %18 = extractvalue { i64, i1 } %16, 0
  br i1 %17, label %error, label %noerror

error:                                            ; preds = %true
  call void @overflow_fail(i64 69)
  ret i64 0

noerror:                                          ; preds = %true
  br label %merge

false:                                            ; preds = %entry
  %19 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %4, i64 %5)
  %20 = extractvalue { i64, i1 } %19, 1
  %21 = extractvalue { i64, i1 } %19, 0
  br i1 %20, label %error1, label %noerror2

error1:                                           ; preds = %false
  call void @overflow_fail(i64 79)
  ret i64 0

noerror2:                                         ; preds = %false
  br label %merge

merge:                                            ; preds = %noerror2, %noerror
  %ifret = phi i64 [ %18, %noerror ], [ %21, %noerror2 ]
  ret i64 %ifret
}
