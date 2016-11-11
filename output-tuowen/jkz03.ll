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

CondW:                                            ; preds = %afterIf, %entry
  %6 = phi i64 [ 0, %entry ], [ %7, %afterIf ]
  br i1 false, label %BodyW, label %AfterW

BodyW:                                            ; preds = %CondW
  br i1 true, label %thenIf, label %elseIf

AfterW:                                           ; preds = %CondW
  ret i64 %6

thenIf:                                           ; preds = %BodyW
  br label %afterIf

elseIf:                                           ; preds = %BodyW
  br label %afterIf

afterIf:                                          ; preds = %elseIf, %thenIf
  %7 = phi i64 [ 0, %thenIf ], [ 0, %elseIf ]
  br label %CondW
}

attributes #0 = { nounwind readnone }
