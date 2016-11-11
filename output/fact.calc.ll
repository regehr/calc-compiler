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
  store i64 1, i64* %Mutable0
  store i64 1, i64* %Mutable1
  br label %whileEntry

whileEntry:                                       ; preds = %else3, %entry
  %phiNode = phi i64 [ 0, %entry ], [ %16, %else3 ]
  %6 = load i64, i64* %Mutable1
  %lethan = icmp sle i64 %6, %0
  br i1 %lethan, label %whileBody, label %whileExit

whileBody:                                        ; preds = %whileEntry
  %7 = load i64, i64* %Mutable0
  %8 = load i64, i64* %Mutable1
  %9 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %7, i64 %8)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %then, label %else

whileExit:                                        ; preds = %whileEntry
  ret i64 %phiNode

then:                                             ; preds = %whileBody
  %calltrap = call i64 @overflow_fail(i64 115)
  br label %else

else:                                             ; preds = %then, %whileBody
  store i64 %10, i64* %Mutable0
  %12 = load i64, i64* %Mutable1
  %13 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %12, i64 1)
  %14 = extractvalue { i64, i1 } %13, 0
  %15 = extractvalue { i64, i1 } %13, 1
  br i1 %15, label %then1, label %else3

then1:                                            ; preds = %else
  %calltrap2 = call i64 @overflow_fail(i64 161)
  br label %else3

else3:                                            ; preds = %then1, %else
  store i64 %14, i64* %Mutable1
  %16 = load i64, i64* %Mutable0
  br label %whileEntry
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

declare i64 @overflow_fail(i64)

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
