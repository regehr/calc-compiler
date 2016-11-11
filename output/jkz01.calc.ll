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
  %7 = load i64, i64* %Mutable1
  %8 = load i64, i64* %Mutable2
  %9 = load i64, i64* %Mutable3
  %10 = load i64, i64* %Mutable4
  %11 = load i64, i64* %Mutable5
  %12 = load i64, i64* %Mutable6
  %13 = load i64, i64* %Mutable7
  %14 = load i64, i64* %Mutable8
  %15 = load i64, i64* %Mutable9
  %16 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %14, i64 %15)
  %17 = extractvalue { i64, i1 } %16, 0
  %18 = extractvalue { i64, i1 } %16, 1
  br i1 %18, label %then, label %else

then:                                             ; preds = %entry
  %calltrap = call i64 @overflow_fail(i64 67)
  br label %else

else:                                             ; preds = %then, %entry
  %19 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %13, i64 %17)
  %20 = extractvalue { i64, i1 } %19, 0
  %21 = extractvalue { i64, i1 } %19, 1
  br i1 %21, label %then1, label %else3

then1:                                            ; preds = %else
  %calltrap2 = call i64 @overflow_fail(i64 61)
  br label %else3

else3:                                            ; preds = %then1, %else
  %22 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %12, i64 %20)
  %23 = extractvalue { i64, i1 } %22, 0
  %24 = extractvalue { i64, i1 } %22, 1
  br i1 %24, label %then4, label %else6

then4:                                            ; preds = %else3
  %calltrap5 = call i64 @overflow_fail(i64 55)
  br label %else6

else6:                                            ; preds = %then4, %else3
  %25 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %11, i64 %23)
  %26 = extractvalue { i64, i1 } %25, 0
  %27 = extractvalue { i64, i1 } %25, 1
  br i1 %27, label %then7, label %else9

then7:                                            ; preds = %else6
  %calltrap8 = call i64 @overflow_fail(i64 49)
  br label %else9

else9:                                            ; preds = %then7, %else6
  %28 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %10, i64 %26)
  %29 = extractvalue { i64, i1 } %28, 0
  %30 = extractvalue { i64, i1 } %28, 1
  br i1 %30, label %then10, label %else12

then10:                                           ; preds = %else9
  %calltrap11 = call i64 @overflow_fail(i64 43)
  br label %else12

else12:                                           ; preds = %then10, %else9
  %31 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %9, i64 %29)
  %32 = extractvalue { i64, i1 } %31, 0
  %33 = extractvalue { i64, i1 } %31, 1
  br i1 %33, label %then13, label %else15

then13:                                           ; preds = %else12
  %calltrap14 = call i64 @overflow_fail(i64 37)
  br label %else15

else15:                                           ; preds = %then13, %else12
  %34 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %8, i64 %32)
  %35 = extractvalue { i64, i1 } %34, 0
  %36 = extractvalue { i64, i1 } %34, 1
  br i1 %36, label %then16, label %else18

then16:                                           ; preds = %else15
  %calltrap17 = call i64 @overflow_fail(i64 31)
  br label %else18

else18:                                           ; preds = %then16, %else15
  %37 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %7, i64 %35)
  %38 = extractvalue { i64, i1 } %37, 0
  %39 = extractvalue { i64, i1 } %37, 1
  br i1 %39, label %then19, label %else21

then19:                                           ; preds = %else18
  %calltrap20 = call i64 @overflow_fail(i64 25)
  br label %else21

else21:                                           ; preds = %then19, %else18
  %40 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %6, i64 %38)
  %41 = extractvalue { i64, i1 } %40, 0
  %42 = extractvalue { i64, i1 } %40, 1
  br i1 %42, label %then22, label %else24

then22:                                           ; preds = %else21
  %calltrap23 = call i64 @overflow_fail(i64 19)
  br label %else24

else24:                                           ; preds = %then22, %else21
  ret i64 %41
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

declare i64 @overflow_fail(i64)

attributes #0 = { nounwind readnone }
