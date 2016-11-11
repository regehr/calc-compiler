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

whileEntry:                                       ; preds = %else26, %entry
  %phiNode = phi i64 [ 0, %entry ], [ 0, %else26 ]
  %6 = load i64, i64* %Mutable0
  %ne = icmp ne i64 %6, %0
  br i1 %ne, label %whileBody, label %whileExit

whileBody:                                        ; preds = %whileEntry
  br label %whileEntry1

whileExit:                                        ; preds = %whileEntry
  %7 = load i64, i64* %Mutable2
  ret i64 %7

whileEntry1:                                      ; preds = %else23, %whileBody
  %phiNode4 = phi i64 [ 0, %whileBody ], [ %36, %else23 ]
  %8 = load i64, i64* %Mutable1
  %ne5 = icmp ne i64 %8, %0
  br i1 %ne5, label %whileBody2, label %whileExit3

whileBody2:                                       ; preds = %whileEntry1
  %9 = load i64, i64* %Mutable1
  %10 = load i64, i64* %Mutable1
  %11 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %9, i64 %10)
  %12 = extractvalue { i64, i1 } %11, 0
  %13 = extractvalue { i64, i1 } %11, 1
  br i1 %13, label %then, label %else

whileExit3:                                       ; preds = %whileEntry1
  %14 = load i64, i64* %Mutable0
  %15 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %14)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %then24, label %else26

then:                                             ; preds = %whileBody2
  %calltrap = call i64 @overflow_fail(i64 266)
  br label %else

else:                                             ; preds = %then, %whileBody2
  %18 = load i64, i64* %Mutable0
  %19 = load i64, i64* %Mutable0
  %20 = load i64, i64* %Mutable0
  %21 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %19, i64 %20)
  %22 = extractvalue { i64, i1 } %21, 0
  %23 = extractvalue { i64, i1 } %21, 1
  br i1 %23, label %then6, label %else8

then6:                                            ; preds = %else
  %calltrap7 = call i64 @overflow_fail(i64 285)
  br label %else8

else8:                                            ; preds = %then6, %else
  %24 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %18, i64 %22)
  %25 = extractvalue { i64, i1 } %24, 0
  %26 = extractvalue { i64, i1 } %24, 1
  br i1 %26, label %then9, label %else11

then9:                                            ; preds = %else8
  %calltrap10 = call i64 @overflow_fail(i64 279)
  br label %else11

else11:                                           ; preds = %then9, %else8
  %27 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %25, i64 4)
  %28 = extractvalue { i64, i1 } %27, 0
  %29 = extractvalue { i64, i1 } %27, 1
  br i1 %29, label %then12, label %else14

then12:                                           ; preds = %else11
  %calltrap13 = call i64 @overflow_fail(i64 276)
  br label %else14

else14:                                           ; preds = %then12, %else11
  %eq = icmp eq i64 %12, %28
  br i1 %eq, label %then15, label %else16

then15:                                           ; preds = %else14
  br label %merge

else16:                                           ; preds = %else14
  br label %merge

merge:                                            ; preds = %else16, %then15
  %phiNode17 = phi i64 [ 1, %then15 ], [ 0, %else16 ]
  %30 = load i64, i64* %Mutable2
  %31 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %phiNode17, i64 %30)
  %32 = extractvalue { i64, i1 } %31, 0
  %33 = extractvalue { i64, i1 } %31, 1
  br i1 %33, label %then18, label %else20

then18:                                           ; preds = %merge
  %calltrap19 = call i64 @overflow_fail(i64 255)
  br label %else20

else20:                                           ; preds = %then18, %merge
  store i64 %32, i64* %Mutable2
  %34 = load i64, i64* %Mutable1
  %35 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %34)
  %36 = extractvalue { i64, i1 } %35, 0
  %37 = extractvalue { i64, i1 } %35, 1
  br i1 %37, label %then21, label %else23

then21:                                           ; preds = %else20
  %calltrap22 = call i64 @overflow_fail(i64 334)
  br label %else23

else23:                                           ; preds = %then21, %else20
  store i64 %36, i64* %Mutable1
  br label %whileEntry1

then24:                                           ; preds = %whileExit3
  %calltrap25 = call i64 @overflow_fail(i64 368)
  br label %else26

else26:                                           ; preds = %then24, %whileExit3
  store i64 %16, i64* %Mutable0
  store i64 0, i64* %Mutable1
  br label %whileEntry
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

declare i64 @overflow_fail(i64)

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
