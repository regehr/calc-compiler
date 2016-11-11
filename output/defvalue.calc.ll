target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %Mutable0 = alloca i64
  store i64 0, i64* %Mutable0
  %Mutable1 = alloca i64
  store i64 0, i64* %Mutable1
  %Mutable2 = alloca i64
  store i64 0, i64* %Mutable2
  %Mutable3 = alloca i64
  store i64 0, i64* %Mutable3
  %Mutable4 = alloca i64
  store i64 0, i64* %Mutable4
  %Mutable5 = alloca i64
  store i64 0, i64* %Mutable5
  %Mutable6 = alloca i64
  store i64 0, i64* %Mutable6
  %Mutable7 = alloca i64
  store i64 0, i64* %Mutable7
  %Mutable8 = alloca i64
  store i64 0, i64* %Mutable8
  %Mutable9 = alloca i64
  store i64 0, i64* %Mutable9
  %6 = load i64, i64* %Mutable0
  %7 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %0, i64 %6)
  %8 = extractvalue { i64, i1 } %7, 0
  %9 = extractvalue { i64, i1 } %7, 1
  br i1 %9, label %then, label %else

then:                                             ; preds = %entry
  %calltrap = call i64 @overflow_fail(i64 29)
  br label %else

else:                                             ; preds = %then, %entry
  %10 = load i64, i64* %Mutable1
  %11 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %10)
  %12 = extractvalue { i64, i1 } %11, 0
  %13 = extractvalue { i64, i1 } %11, 1
  br i1 %13, label %then1, label %else3

then1:                                            ; preds = %else
  %calltrap2 = call i64 @overflow_fail(i64 42)
  br label %else3

else3:                                            ; preds = %then1, %else
  %14 = load i64, i64* %Mutable2
  %15 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %2, i64 %14)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %then4, label %else6

then4:                                            ; preds = %else3
  %calltrap5 = call i64 @overflow_fail(i64 55)
  br label %else6

else6:                                            ; preds = %then4, %else3
  %18 = load i64, i64* %Mutable3
  %19 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %16, i64 %18)
  %20 = extractvalue { i64, i1 } %19, 0
  %21 = extractvalue { i64, i1 } %19, 1
  br i1 %21, label %then7, label %else9

then7:                                            ; preds = %else6
  %calltrap8 = call i64 @overflow_fail(i64 52)
  br label %else9

else9:                                            ; preds = %then7, %else6
  %22 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %12, i64 %20)
  %23 = extractvalue { i64, i1 } %22, 0
  %24 = extractvalue { i64, i1 } %22, 1
  br i1 %24, label %then10, label %else12

then10:                                           ; preds = %else9
  %calltrap11 = call i64 @overflow_fail(i64 39)
  br label %else12

else12:                                           ; preds = %then10, %else9
  %25 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %8, i64 %23)
  %26 = extractvalue { i64, i1 } %25, 0
  %27 = extractvalue { i64, i1 } %25, 1
  br i1 %27, label %then13, label %else15

then13:                                           ; preds = %else12
  %calltrap14 = call i64 @overflow_fail(i64 26)
  br label %else15

else15:                                           ; preds = %then13, %else12
  ret i64 %26
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

declare i64 @overflow_fail(i64)

attributes #0 = { nounwind readnone }
