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
  %gthan = icmp sgt i64 %3, %4
  br i1 %gthan, label %then, label %else2

then:                                             ; preds = %entry
  %6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %then1, label %else

then1:                                            ; preds = %then
  %calltrap = call i64 @overflow_fail(i64 69)
  br label %else

else:                                             ; preds = %then1, %then
  br label %merge

else2:                                            ; preds = %entry
  %9 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %4, i64 %5)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %then3, label %else5

then3:                                            ; preds = %else2
  %calltrap4 = call i64 @overflow_fail(i64 79)
  br label %else5

else5:                                            ; preds = %then3, %else2
  br label %merge

merge:                                            ; preds = %else5, %else
  %phiNode = phi i64 [ %7, %else ], [ %10, %else5 ]
  ret i64 %phiNode
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

declare i64 @overflow_fail(i64)

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
