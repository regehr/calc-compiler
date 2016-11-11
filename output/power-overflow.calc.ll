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
  store i64 %0, i64* %Mutable0
  store i64 %1, i64* %Mutable1
  br label %whileEntry

whileEntry:                                       ; preds = %else3, %entry
  %phiNode = phi i64 [ 0, %entry ], [ %15, %else3 ]
  %6 = load i64, i64* %Mutable1
  %ne = icmp ne i64 %6, 1
  br i1 %ne, label %whileBody, label %whileExit

whileBody:                                        ; preds = %whileEntry
  %7 = load i64, i64* %Mutable0
  %8 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %7, i64 %0)
  %9 = extractvalue { i64, i1 } %8, 0
  %10 = extractvalue { i64, i1 } %8, 1
  br i1 %10, label %then, label %else

whileExit:                                        ; preds = %whileEntry
  ret i64 %phiNode

then:                                             ; preds = %whileBody
  %calltrap = call i64 @overflow_fail(i64 139)
  br label %else

else:                                             ; preds = %then, %whileBody
  store i64 %9, i64* %Mutable0
  %11 = load i64, i64* %Mutable1
  %12 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %11, i64 1)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  br i1 %14, label %then1, label %else3

then1:                                            ; preds = %else
  %calltrap2 = call i64 @overflow_fail(i64 185)
  br label %else3

else3:                                            ; preds = %then1, %else
  store i64 %13, i64* %Mutable1
  %15 = load i64, i64* %Mutable0
  br label %whileEntry
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

declare i64 @overflow_fail(i64)

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
