; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

declare void @overflow_fail(i64)

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  br label %CondW

CondW:                                            ; preds = %AfterW3, %entry
  %6 = phi i64 [ 0, %entry ], [ %7, %AfterW3 ]
  br i1 false, label %BodyW, label %AfterW

BodyW:                                            ; preds = %CondW
  br label %CondW1

AfterW:                                           ; preds = %CondW
  ret i64 %6

CondW1:                                           ; preds = %BodyW2, %BodyW
  %7 = phi i64 [ 0, %BodyW ], [ 0, %BodyW2 ]
  br i1 false, label %BodyW2, label %AfterW3

BodyW2:                                           ; preds = %CondW1
  br label %CondW1

AfterW3:                                          ; preds = %CondW1
  br label %CondW
}

attributes #0 = { nounwind readnone }
