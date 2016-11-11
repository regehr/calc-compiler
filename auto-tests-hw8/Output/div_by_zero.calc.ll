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
  %6 = call { i64, i1 } @sdiv_with_overflow(i64 12345678, i64 0)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %then, label %else

then:                                             ; preds = %entry
  %calltrap = call i64 @overflow_fail(i64 37)
  br label %else

else:                                             ; preds = %then, %entry
  ret i64 %7
}

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

declare i64 @overflow_fail(i64)
