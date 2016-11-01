; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-apple-darwin16.0.0"

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
  store i64 %0, i64* %6
  store i64 %1, i64* %7
  br label %16

; <label>:16:                                     ; preds = %22, %entry
  %17 = phi i64 [ 0, %entry ], [ %27, %22 ]
  %18 = load i64, i64* %7
  %19 = icmp ne i64 %18, 0
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %16
  %21 = load i64, i64* %6
  ret i64 %21

; <label>:22:                                     ; preds = %16
  %23 = load i64, i64* %7
  store i64 %23, i64* %8
  %24 = load i64, i64* %6
  %25 = load i64, i64* %7
  %26 = srem i64 %24, %25
  store i64 %26, i64* %7
  %27 = load i64, i64* %8
  store i64 %27, i64* %6
  br label %16
}
