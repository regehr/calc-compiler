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
  br i1 true, label %then, label %else2

then:                                             ; preds = %entry
  %6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 500)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %then1, label %else

then1:                                            ; preds = %then
  %calltrap = call i64 @overflow_fail(i64 60)
  br label %else

else:                                             ; preds = %then1, %then
  store i64 %7, i64* %Mutable0
  br label %merge

else2:                                            ; preds = %entry
  %9 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 0)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %then3, label %else5

then3:                                            ; preds = %else2
  %calltrap4 = call i64 @overflow_fail(i64 93)
  br label %else5

else5:                                            ; preds = %then3, %else2
  store i64 %10, i64* %Mutable0
  br label %merge

merge:                                            ; preds = %else5, %else
  %phiNode = phi i64 [ %7, %else ], [ %10, %else5 ]
  br i1 true, label %then6, label %else10

then6:                                            ; preds = %merge
  %12 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 1)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  br i1 %14, label %then7, label %else9

then7:                                            ; preds = %then6
  %calltrap8 = call i64 @overflow_fail(i64 125)
  br label %else9

else9:                                            ; preds = %then7, %then6
  br label %merge14

else10:                                           ; preds = %merge
  %15 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 0)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %then11, label %else13

then11:                                           ; preds = %else10
  %calltrap12 = call i64 @overflow_fail(i64 133)
  br label %else13

else13:                                           ; preds = %then11, %else10
  br label %merge14

merge14:                                          ; preds = %else13, %else9
  %phiNode15 = phi i64 [ %13, %else9 ], [ %16, %else13 ]
  %18 = load i64, i64* %Mutable0
  ret i64 %18
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

declare i64 @overflow_fail(i64)

attributes #0 = { nounwind readnone }
