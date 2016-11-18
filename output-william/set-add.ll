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
  store i64 5, i64* %6
  %16 = load i64, i64* %6
  %17 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %0, i64 %16)
  %18 = extractvalue { i64, i1 } %17, 1
  %19 = extractvalue { i64, i1 } %17, 0
  br i1 %18, label %error, label %noerror

error:                                            ; preds = %entry
  call void @overflow_fail(i64 43)
  ret i64 0

noerror:                                          ; preds = %entry
  ret i64 %19
}
