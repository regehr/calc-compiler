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
  br label %16

; <label>:16:                                     ; preds = %27, %entry
  %17 = phi i64 [ 0, %entry ], [ 0, %27 ]
  %18 = load i64, i64* %6
  %19 = icmp ne i64 %18, %0
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %16
  %21 = load i64, i64* %8
  ret i64 %21

; <label>:22:                                     ; preds = %16
  br label %23

; <label>:23:                                     ; preds = %43, %22
  %24 = phi i64 [ 0, %22 ], [ %48, %43 ]
  %25 = load i64, i64* %7
  %26 = icmp ne i64 %25, %0
  br i1 %26, label %30, label %27

; <label>:27:                                     ; preds = %23
  %28 = load i64, i64* %6
  %29 = add i64 1, %28
  store i64 %29, i64* %6
  store i64 0, i64* %7
  br label %16

; <label>:30:                                     ; preds = %23
  %31 = load i64, i64* %7
  %32 = load i64, i64* %7
  %33 = mul i64 %31, %32
  %34 = load i64, i64* %6
  %35 = load i64, i64* %6
  %36 = load i64, i64* %6
  %37 = mul i64 %35, %36
  %38 = mul i64 %34, %37
  %39 = add i64 %38, 16
  %40 = icmp eq i64 %33, %39
  br i1 %40, label %41, label %42

; <label>:41:                                     ; preds = %30
  br label %43

; <label>:42:                                     ; preds = %30
  br label %43

; <label>:43:                                     ; preds = %42, %41
  %44 = phi i64 [ 1, %41 ], [ 0, %42 ]
  %45 = load i64, i64* %8
  %46 = add i64 %44, %45
  store i64 %46, i64* %8
  %47 = load i64, i64* %7
  %48 = add i64 1, %47
  store i64 %48, i64* %7
  br label %23
}
