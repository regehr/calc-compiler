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
  store i64 %a0, i64* %m0
  store i64 %a1, i64* %m1
  br label %loop

loop:                                             ; preds = %ifof8, %entry
  %WhExp = phi i64 [ 0, %entry ], [ %m010, %ifof8 ]
  %m11 = load i64, i64* %m1
  %neqtmp = icmp ne i64 %m11, 1
  %whilecond = icmp eq i1 %neqtmp, true
  br i1 %whilecond, label %execloop, label %afterloop

afterloop:                                        ; preds = %loop
  ret i64 %WhExp

execloop:                                         ; preds = %loop
  %m02 = load i64, i64* %m0
  %0 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %m02, i64 %a0)
  %1 = extractvalue { i64, i1 } %0, 0
  %2 = extractvalue { i64, i1 } %0, 1
  %oftrue = icmp eq i1 %2, true
  br i1 %oftrue, label %thenoffunc, label %elseretval

thenoffunc:                                       ; preds = %execloop
  %calloverflow = call i32 @overflow_fail(i32 139)
  br label %ifof

elseretval:                                       ; preds = %execloop
  br label %ifof

ifof:                                             ; preds = %elseretval, %thenoffunc
  %iftmp = phi i64 [ %1, %thenoffunc ], [ %1, %elseretval ]
  store i64 %iftmp, i64* %m0
  %m13 = load i64, i64* %m1
  %3 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %m13, i64 1)
  %4 = extractvalue { i64, i1 } %3, 0
  %5 = extractvalue { i64, i1 } %3, 1
  %oftrue4 = icmp eq i1 %5, true
  br i1 %oftrue4, label %thenoffunc5, label %elseretval7

thenoffunc5:                                      ; preds = %ifof
  %calloverflow6 = call i32 @overflow_fail(i32 185)
  br label %ifof8

elseretval7:                                      ; preds = %ifof
  br label %ifof8

ifof8:                                            ; preds = %elseretval7, %thenoffunc5
  %iftmp9 = phi i64 [ %4, %thenoffunc5 ], [ %4, %elseretval7 ]
  store i64 %iftmp9, i64* %m1
  %m010 = load i64, i64* %m0
  br label %loop
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
