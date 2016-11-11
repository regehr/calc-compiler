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
  br label %whileEntry

whileEntry:                                       ; preds = %else3, %entry
  %phiNode = phi i64 [ 0, %entry ], [ %12, %else3 ]
  %6 = load i64, i64* %Mutable0
  %7 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %6, i64 1)
  %8 = extractvalue { i64, i1 } %7, 0
  %9 = extractvalue { i64, i1 } %7, 1
  br i1 %9, label %then, label %else

whileBody:                                        ; preds = %else
  %10 = load i64, i64* %Mutable1
  %11 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %10, i64 1)
  %12 = extractvalue { i64, i1 } %11, 0
  %13 = extractvalue { i64, i1 } %11, 1
  br i1 %13, label %then1, label %else3

whileExit:                                        ; preds = %else
  %14 = load i64, i64* %Mutable0
  ret i64 %14

then:                                             ; preds = %whileEntry
  %calltrap = call i64 @overflow_fail(i64 46)
  br label %else

else:                                             ; preds = %then, %whileEntry
  store i64 %8, i64* %Mutable0
  %15 = load i64, i64* %Mutable1
  %lthan = icmp slt i64 %15, 10
  br i1 %lthan, label %whileBody, label %whileExit

then1:                                            ; preds = %whileBody
  %calltrap2 = call i64 @overflow_fail(i64 123)
  br label %else3

else3:                                            ; preds = %then1, %whileBody
  store i64 %12, i64* %Mutable1
  br label %whileEntry
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

declare i64 @overflow_fail(i64)

attributes #0 = { nounwind readnone }
