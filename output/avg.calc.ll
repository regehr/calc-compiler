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
  %lethan = icmp sle i64 %0, 0
  br i1 %lethan, label %then, label %else

then:                                             ; preds = %entry
  br label %merge59

else:                                             ; preds = %entry
  %eq = icmp eq i64 %0, 1
  br i1 %eq, label %then1, label %else2

then1:                                            ; preds = %else
  br label %merge57

else2:                                            ; preds = %else
  %eq3 = icmp eq i64 %0, 2
  br i1 %eq3, label %then4, label %else10

then4:                                            ; preds = %else2
  %6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %then5, label %else6

then5:                                            ; preds = %then4
  %calltrap = call i64 @overflow_fail(i64 114)
  br label %else6

else6:                                            ; preds = %then5, %then4
  %9 = call { i64, i1 } @sdiv_with_overflow(i64 %7, i64 2)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %then7, label %else9

then7:                                            ; preds = %else6
  %calltrap8 = call i64 @overflow_fail(i64 111)
  br label %else9

else9:                                            ; preds = %then7, %else6
  br label %merge55

else10:                                           ; preds = %else2
  %eq11 = icmp eq i64 %0, 3
  br i1 %eq11, label %then12, label %else22

then12:                                           ; preds = %else10
  %12 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %2, i64 %3)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  br i1 %14, label %then13, label %else15

then13:                                           ; preds = %then12
  %calltrap14 = call i64 @overflow_fail(i64 178)
  br label %else15

else15:                                           ; preds = %then13, %then12
  %15 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %13)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %then16, label %else18

then16:                                           ; preds = %else15
  %calltrap17 = call i64 @overflow_fail(i64 172)
  br label %else18

else18:                                           ; preds = %then16, %else15
  %18 = call { i64, i1 } @sdiv_with_overflow(i64 %16, i64 3)
  %19 = extractvalue { i64, i1 } %18, 0
  %20 = extractvalue { i64, i1 } %18, 1
  br i1 %20, label %then19, label %else21

then19:                                           ; preds = %else18
  %calltrap20 = call i64 @overflow_fail(i64 169)
  br label %else21

else21:                                           ; preds = %then19, %else18
  br label %merge53

else22:                                           ; preds = %else10
  %eq23 = icmp eq i64 %0, 4
  br i1 %eq23, label %then24, label %else37

then24:                                           ; preds = %else22
  %21 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %22 = extractvalue { i64, i1 } %21, 0
  %23 = extractvalue { i64, i1 } %21, 1
  br i1 %23, label %then25, label %else27

then25:                                           ; preds = %then24
  %calltrap26 = call i64 @overflow_fail(i64 248)
  br label %else27

else27:                                           ; preds = %then25, %then24
  %24 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %4)
  %25 = extractvalue { i64, i1 } %24, 0
  %26 = extractvalue { i64, i1 } %24, 1
  br i1 %26, label %then28, label %else30

then28:                                           ; preds = %else27
  %calltrap29 = call i64 @overflow_fail(i64 258)
  br label %else30

else30:                                           ; preds = %then28, %else27
  %27 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %22, i64 %25)
  %28 = extractvalue { i64, i1 } %27, 0
  %29 = extractvalue { i64, i1 } %27, 1
  br i1 %29, label %then31, label %else33

then31:                                           ; preds = %else30
  %calltrap32 = call i64 @overflow_fail(i64 245)
  br label %else33

else33:                                           ; preds = %then31, %else30
  %30 = call { i64, i1 } @sdiv_with_overflow(i64 %28, i64 4)
  %31 = extractvalue { i64, i1 } %30, 0
  %32 = extractvalue { i64, i1 } %30, 1
  br i1 %32, label %then34, label %else36

then34:                                           ; preds = %else33
  %calltrap35 = call i64 @overflow_fail(i64 242)
  br label %else36

else36:                                           ; preds = %then34, %else33
  br label %merge

else37:                                           ; preds = %else22
  %33 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %34 = extractvalue { i64, i1 } %33, 0
  %35 = extractvalue { i64, i1 } %33, 1
  br i1 %35, label %then38, label %else40

then38:                                           ; preds = %else37
  %calltrap39 = call i64 @overflow_fail(i64 301)
  br label %else40

else40:                                           ; preds = %then38, %else37
  %36 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %4)
  %37 = extractvalue { i64, i1 } %36, 0
  %38 = extractvalue { i64, i1 } %36, 1
  br i1 %38, label %then41, label %else43

then41:                                           ; preds = %else40
  %calltrap42 = call i64 @overflow_fail(i64 311)
  br label %else43

else43:                                           ; preds = %then41, %else40
  %39 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %34, i64 %37)
  %40 = extractvalue { i64, i1 } %39, 0
  %41 = extractvalue { i64, i1 } %39, 1
  br i1 %41, label %then44, label %else46

then44:                                           ; preds = %else43
  %calltrap45 = call i64 @overflow_fail(i64 298)
  br label %else46

else46:                                           ; preds = %then44, %else43
  %42 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %40, i64 %5)
  %43 = extractvalue { i64, i1 } %42, 0
  %44 = extractvalue { i64, i1 } %42, 1
  br i1 %44, label %then47, label %else49

then47:                                           ; preds = %else46
  %calltrap48 = call i64 @overflow_fail(i64 295)
  br label %else49

else49:                                           ; preds = %then47, %else46
  %45 = call { i64, i1 } @sdiv_with_overflow(i64 %43, i64 5)
  %46 = extractvalue { i64, i1 } %45, 0
  %47 = extractvalue { i64, i1 } %45, 1
  br i1 %47, label %then50, label %else52

then50:                                           ; preds = %else49
  %calltrap51 = call i64 @overflow_fail(i64 292)
  br label %else52

else52:                                           ; preds = %then50, %else49
  br label %merge

merge:                                            ; preds = %else52, %else36
  %phiNode = phi i64 [ %31, %else36 ], [ %46, %else52 ]
  br label %merge53

merge53:                                          ; preds = %merge, %else21
  %phiNode54 = phi i64 [ %19, %else21 ], [ %phiNode, %merge ]
  br label %merge55

merge55:                                          ; preds = %merge53, %else9
  %phiNode56 = phi i64 [ %10, %else9 ], [ %phiNode54, %merge53 ]
  br label %merge57

merge57:                                          ; preds = %merge55, %then1
  %phiNode58 = phi i64 [ %1, %then1 ], [ %phiNode56, %merge55 ]
  br label %merge59

merge59:                                          ; preds = %merge57, %then
  %phiNode60 = phi i64 [ 0, %then ], [ %phiNode58, %merge57 ]
  ret i64 %phiNode60
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

declare i64 @overflow_fail(i64)

define internal { i64, i1 } @sdiv_with_overflow(i64, i64) {
entry:
  %2 = icmp eq i64 %0, -9223372036854775808
  %3 = icmp eq i64 %1, -1
  %"oper1 == INT_MIN and oper2 == -1" = and i1 %2, %3
  %4 = icmp eq i64 %1, 0
  %"or oper2 == 0" = or i1 %"oper1 == INT_MIN and oper2 == -1", %4
  br i1 %"or oper2 == 0", label %then, label %else

then:                                             ; preds = %entry
  %5 = insertvalue { i64, i1 } undef, i64 0, 0
  %6 = insertvalue { i64, i1 } %5, i1 %"or oper2 == 0", 1
  ret { i64, i1 } %6

else:                                             ; preds = %entry
  %divtmp = sdiv i64 %0, %1
  %7 = insertvalue { i64, i1 } undef, i64 %divtmp, 0
  %8 = insertvalue { i64, i1 } %7, i1 %"or oper2 == 0", 1
  ret { i64, i1 } %8
}

attributes #0 = { nounwind readnone }
