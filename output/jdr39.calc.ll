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

whileEntry:                                       ; preds = %else11, %entry
  %phiNode = phi i64 [ 0, %entry ], [ 0, %else11 ]
  %6 = load i64, i64* %Mutable0
  %ne = icmp ne i64 %6, %0
  br i1 %ne, label %whileBody, label %whileExit

whileBody:                                        ; preds = %whileEntry
  br label %whileEntry1

whileExit:                                        ; preds = %whileEntry
  %7 = load i64, i64* %Mutable2
  ret i64 %7

whileEntry1:                                      ; preds = %else8, %whileBody
  %phiNode4 = phi i64 [ 0, %whileBody ], [ %19, %else8 ]
  %8 = load i64, i64* %Mutable1
  %ne5 = icmp ne i64 %8, %0
  br i1 %ne5, label %whileBody2, label %whileExit3

whileBody2:                                       ; preds = %whileEntry1
  %9 = load i64, i64* %Mutable2
  %10 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %9)
  %11 = extractvalue { i64, i1 } %10, 0
  %12 = extractvalue { i64, i1 } %10, 1
  br i1 %12, label %then, label %else

whileExit3:                                       ; preds = %whileEntry1
  %13 = load i64, i64* %Mutable0
  %14 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %13)
  %15 = extractvalue { i64, i1 } %14, 0
  %16 = extractvalue { i64, i1 } %14, 1
  br i1 %16, label %then9, label %else11

then:                                             ; preds = %whileBody2
  %calltrap = call i64 @overflow_fail(i64 115)
  br label %else

else:                                             ; preds = %then, %whileBody2
  store i64 %11, i64* %Mutable2
  %17 = load i64, i64* %Mutable1
  %18 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %17)
  %19 = extractvalue { i64, i1 } %18, 0
  %20 = extractvalue { i64, i1 } %18, 1
  br i1 %20, label %then6, label %else8

then6:                                            ; preds = %else
  %calltrap7 = call i64 @overflow_fail(i64 149)
  br label %else8

else8:                                            ; preds = %then6, %else
  store i64 %19, i64* %Mutable1
  br label %whileEntry1

then9:                                            ; preds = %whileExit3
  %calltrap10 = call i64 @overflow_fail(i64 183)
  br label %else11

else11:                                           ; preds = %then9, %whileExit3
  store i64 %15, i64* %Mutable0
  store i64 0, i64* %Mutable1
  br label %whileEntry
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

declare i64 @overflow_fail(i64)

attributes #0 = { nounwind readnone }
