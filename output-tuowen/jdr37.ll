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

CondW:                                            ; preds = %BodyW, %entry
  %6 = phi i64 [ 0, %entry ], [ 1, %BodyW ]
  %7 = phi i64 [ 0, %entry ], [ 1, %BodyW ]
  br i1 false, label %BodyW, label %AfterW

BodyW:                                            ; preds = %CondW
  br label %CondW

AfterW:                                           ; preds = %CondW
  ret i64 %7
}

attributes #0 = { nounwind readnone }
