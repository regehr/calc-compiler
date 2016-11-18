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
  %6 = icmp sgt i64 %3, %4
  br i1 %6, label %thenIf, label %elseIf

thenIf:                                           ; preds = %entry
  %7 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %8 = extractvalue { i64, i1 } %7, 0
  %9 = extractvalue { i64, i1 } %7, 1
  br i1 %9, label %over, label %safe

elseIf:                                           ; preds = %entry
  %10 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %4, i64 %5)
  %11 = extractvalue { i64, i1 } %10, 0
  %12 = extractvalue { i64, i1 } %10, 1
  br i1 %12, label %over1, label %safe2

afterIf:                                          ; preds = %safe2, %safe
  %13 = phi i64 [ %8, %safe ], [ %11, %safe2 ]
  ret i64 %13

over:                                             ; preds = %thenIf
  tail call void @overflow_fail(i64 69)
  unreachable

safe:                                             ; preds = %thenIf
  br label %afterIf

over1:                                            ; preds = %elseIf
  tail call void @overflow_fail(i64 79)
  unreachable

safe2:                                            ; preds = %elseIf
  br label %afterIf
}

attributes #0 = { nounwind readnone }
