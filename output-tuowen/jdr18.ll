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
  %6 = icmp eq i64 0, 1
  br i1 %6, label %thenIf, label %elseIf

thenIf:                                           ; preds = %entry
  br label %afterIf

elseIf:                                           ; preds = %entry
  br label %afterIf

afterIf:                                          ; preds = %elseIf, %thenIf
  %7 = phi i64 [ %4, %thenIf ], [ %5, %elseIf ]
  ret i64 %7
}

attributes #0 = { nounwind readnone }
