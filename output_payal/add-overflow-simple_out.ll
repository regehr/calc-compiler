; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

declare i32 @overflow_fail(i32)

define i64 @f(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5) {
entry:
  %m9 = alloca i64
  %m8 = alloca i64
  %m7 = alloca i64
  %m6 = alloca i64
  %m5 = alloca i64
  %m4 = alloca i64
  %m3 = alloca i64
  %m2 = alloca i64
  %m1 = alloca i64
  %m0 = alloca i64
  store i64 0, i64* %m0
  store i64 0, i64* %m1
  store i64 0, i64* %m2
  store i64 0, i64* %m3
  store i64 0, i64* %m4
  store i64 0, i64* %m5
  store i64 0, i64* %m6
  store i64 0, i64* %m7
  store i64 0, i64* %m8
  store i64 0, i64* %m9
  %0 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 9223372036854775807, i64 1)
  %1 = extractvalue { i64, i1 } %0, 0
  %2 = extractvalue { i64, i1 } %0, 1
  %oftrue = icmp eq i1 %2, true
  br i1 %oftrue, label %thenoffunc, label %elseretval

thenoffunc:                                       ; preds = %entry
  %calloverflow = call i32 @overflow_fail(i32 37)
  br label %ifof

elseretval:                                       ; preds = %entry
  br label %ifof

ifof:                                             ; preds = %elseretval, %thenoffunc
  %iftmp = phi i64 [ %1, %thenoffunc ], [ %1, %elseretval ]
  ret i64 %iftmp
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
