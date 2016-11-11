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
  %ltetmp = icmp ule i64 %a0, 0
  %ifcond = icmp eq i1 %ltetmp, true
  br i1 %ifcond, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont

else:                                             ; preds = %entry
  store i64 1, i64* %m1
  store i64 1, i64* %m2
  br label %loop

loop:                                             ; preds = %ifof10, %else
  %WhExp = phi i64 [ 0, %else ], [ %m312, %ifof10 ]
  %m21 = load i64, i64* %m2
  %lttmp = icmp ult i64 %m21, %a0
  %whilecond = icmp eq i1 %lttmp, true
  br i1 %whilecond, label %execloop, label %afterloop

afterloop:                                        ; preds = %loop
  %m113 = load i64, i64* %m1
  br label %ifcont

execloop:                                         ; preds = %loop
  %m22 = load i64, i64* %m2
  %0 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m22, i64 1)
  %1 = extractvalue { i64, i1 } %0, 0
  %2 = extractvalue { i64, i1 } %0, 1
  %oftrue = icmp eq i1 %2, true
  br i1 %oftrue, label %thenoffunc, label %elseretval

thenoffunc:                                       ; preds = %execloop
  %calloverflow = call i32 @overflow_fail(i32 142)
  br label %ifof

elseretval:                                       ; preds = %execloop
  br label %ifof

ifof:                                             ; preds = %elseretval, %thenoffunc
  %iftmp = phi i64 [ %1, %thenoffunc ], [ %1, %elseretval ]
  store i64 %iftmp, i64* %m2
  %m13 = load i64, i64* %m1
  store i64 %m13, i64* %m3
  %m14 = load i64, i64* %m1
  %m05 = load i64, i64* %m0
  %3 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m14, i64 %m05)
  %4 = extractvalue { i64, i1 } %3, 0
  %5 = extractvalue { i64, i1 } %3, 1
  %oftrue6 = icmp eq i1 %5, true
  br i1 %oftrue6, label %thenoffunc7, label %elseretval9

thenoffunc7:                                      ; preds = %ifof
  %calloverflow8 = call i32 @overflow_fail(i32 198)
  br label %ifof10

elseretval9:                                      ; preds = %ifof
  br label %ifof10

ifof10:                                           ; preds = %elseretval9, %thenoffunc7
  %iftmp11 = phi i64 [ %4, %thenoffunc7 ], [ %4, %elseretval9 ]
  store i64 %iftmp11, i64* %m1
  %m312 = load i64, i64* %m3
  store i64 %m312, i64* %m0
  br label %loop

ifcont:                                           ; preds = %afterloop, %then
  %iftmp14 = phi i64 [ 0, %then ], [ %m113, %afterloop ]
  ret i64 %iftmp14
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
