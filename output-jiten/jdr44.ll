; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %m0 = alloca i64
  store i64 0, i64* %m0
  %m1 = alloca i64
  store i64 0, i64* %m1
  %m2 = alloca i64
  store i64 0, i64* %m2
  %m3 = alloca i64
  store i64 0, i64* %m3
  %m4 = alloca i64
  store i64 0, i64* %m4
  %m5 = alloca i64
  store i64 0, i64* %m5
  %m6 = alloca i64
  store i64 0, i64* %m6
  %m7 = alloca i64
  store i64 0, i64* %m7
  %m8 = alloca i64
  store i64 0, i64* %m8
  %m9 = alloca i64
  store i64 0, i64* %m9
  br label %cond

cond:                                             ; preds = %afterLoop, %entry
  %condtmp = phi i64 [ 0, %entry ], [ 0, %afterLoop ]
  %6 = load i64, i64* %m0
  %7 = icmp ne i64 %6, %0
  br i1 %7, label %loop, label %afterLoop4

loop:                                             ; preds = %cond
  br label %cond1

cond1:                                            ; preds = %merge, %loop
  %condtmp2 = phi i64 [ 0, %loop ], [ %23, %merge ]
  %8 = load i64, i64* %m1
  %9 = icmp ne i64 %8, %0
  br i1 %9, label %loop3, label %afterLoop

loop3:                                            ; preds = %cond1
  %10 = load i64, i64* %m1
  %11 = load i64, i64* %m1
  %12 = mul i64 %10, %11
  %13 = load i64, i64* %m0
  %14 = load i64, i64* %m0
  %15 = load i64, i64* %m0
  %16 = mul i64 %14, %15
  %17 = mul i64 %13, %16
  %18 = sub i64 %17, 4
  %19 = icmp eq i64 %12, %18
  br i1 %19, label %then, label %else

then:                                             ; preds = %loop3
  br label %merge

else:                                             ; preds = %loop3
  br label %merge

merge:                                            ; preds = %else, %then
  %iftmp = phi i64 [ 1, %then ], [ 0, %else ]
  %20 = load i64, i64* %m9
  %21 = add i64 %iftmp, %20
  store i64 %21, i64* %m9
  %22 = load i64, i64* %m1
  %23 = add i64 1, %22
  store i64 %23, i64* %m1
  br label %cond1

afterLoop:                                        ; preds = %cond1
  %24 = load i64, i64* %m0
  %25 = add i64 1, %24
  store i64 %25, i64* %m0
  store i64 0, i64* %m1
  br label %cond

afterLoop4:                                       ; preds = %cond
  %26 = load i64, i64* %m9
  ret i64 %26
}

declare void @overflow_fail(i64)
