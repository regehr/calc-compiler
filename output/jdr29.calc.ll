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
  br i1 %gthan, label %then, label %else5

then:                                             ; preds = %entry
  %gthan1 = icmp sgt i64 1, 2
  br i1 %gthan1, label %then2, label %else

then2:                                            ; preds = %then
  br label %merge

else:                                             ; preds = %then
  br label %merge

merge:                                            ; preds = %else, %then2
  %phiNode = phi i64 [ 3, %then2 ], [ 5, %else ]
  %6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %phiNode, i64 %2)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %then3, label %else4

then3:                                            ; preds = %merge
  %calltrap = call i64 @overflow_fail(i64 69)
  br label %else4

else4:                                            ; preds = %then3, %merge
  br label %merge9

else5:                                            ; preds = %entry
  %9 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %4, i64 %5)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %then6, label %else8

then6:                                            ; preds = %else5
  %calltrap7 = call i64 @overflow_fail(i64 93)
  br label %else8

else8:                                            ; preds = %then6, %else5
  br label %merge9

merge9:                                           ; preds = %else8, %else4
  %phiNode10 = phi i64 [ %7, %else4 ], [ %10, %else8 ]
  ret i64 %phiNode10
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

declare i64 @overflow_fail(i64)

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
