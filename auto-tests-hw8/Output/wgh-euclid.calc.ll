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

whileEntry:                                       ; preds = %else, %entry
  %phiNode = phi i64 [ 0, %entry ], [ %14, %else ]
  %6 = load i64, i64* %Mutable1
  %ne = icmp ne i64 %6, 0
  br i1 %ne, label %whileBody, label %whileExit

whileBody:                                        ; preds = %whileEntry
  %7 = load i64, i64* %Mutable1
  store i64 %7, i64* %Mutable2
  %8 = load i64, i64* %Mutable0
  %9 = load i64, i64* %Mutable1
  %10 = call { i64, i1 } @srem_with_overflow(i64 %8, i64 %9)
  %11 = extractvalue { i64, i1 } %10, 0
  %12 = extractvalue { i64, i1 } %10, 1
  br i1 %12, label %then, label %else

whileExit:                                        ; preds = %whileEntry
  %13 = load i64, i64* %Mutable0
  ret i64 %13

then:                                             ; preds = %whileBody
  %calltrap = call i64 @overflow_fail(i64 135)
  br label %else

else:                                             ; preds = %then, %whileBody
  store i64 %11, i64* %Mutable1
  %14 = load i64, i64* %Mutable2
  store i64 %14, i64* %Mutable0
  br label %whileEntry
}

define internal { i64, i1 } @srem_with_overflow(i64, i64) {
entry:
  %"oper2 == 0" = icmp eq i64 %1, 0
  br i1 %"oper2 == 0", label %then, label %else

then:                                             ; preds = %entry
  %2 = insertvalue { i64, i1 } undef, i64 0, 0
  %3 = insertvalue { i64, i1 } %2, i1 %"oper2 == 0", 1
  ret { i64, i1 } %3

else:                                             ; preds = %entry
  %remtmp = srem i64 %0, %1
  %4 = insertvalue { i64, i1 } undef, i64 %remtmp, 0
  %5 = insertvalue { i64, i1 } %4, i1 %"oper2 == 0", 1
  ret { i64, i1 } %5
}

declare i64 @overflow_fail(i64)
