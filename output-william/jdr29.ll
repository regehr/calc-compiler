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
  br i1 %">", label %true, label %false3

true:                                             ; preds = %entry
  %">1" = icmp sgt i64 1, 2
  br i1 %">1", label %true2, label %false

true2:                                            ; preds = %true
  br label %merge

false:                                            ; preds = %true
  br label %merge

merge:                                            ; preds = %false, %true2
  %ifret = phi i64 [ 3, %true2 ], [ 5, %false ]
  %16 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %ifret, i64 %2)
  %17 = extractvalue { i64, i1 } %16, 1
  %18 = extractvalue { i64, i1 } %16, 0
  br i1 %17, label %error, label %noerror

error:                                            ; preds = %merge
  call void @overflow_fail(i64 69)
  ret i64 0

noerror:                                          ; preds = %merge
  br label %merge6

false3:                                           ; preds = %entry
  %19 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %4, i64 %5)
  %20 = extractvalue { i64, i1 } %19, 1
  %21 = extractvalue { i64, i1 } %19, 0
  br i1 %20, label %error4, label %noerror5

error4:                                           ; preds = %false3
  call void @overflow_fail(i64 93)
  ret i64 0

noerror5:                                         ; preds = %false3
  br label %merge6

merge6:                                           ; preds = %noerror5, %noerror
  %ifret7 = phi i64 [ %18, %noerror ], [ %21, %noerror5 ]
  ret i64 %ifret7
}
