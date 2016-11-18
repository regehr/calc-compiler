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
  %6 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %1, i64 %1)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %over, label %safe

over:                                             ; preds = %entry
  tail call void @overflow_fail(i64 43)
  unreachable

safe:                                             ; preds = %entry
  %9 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 31415926, i64 %7)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %over1, label %safe2

over1:                                            ; preds = %safe
  tail call void @overflow_fail(i64 31)
  unreachable

safe2:                                            ; preds = %safe
  ret i64 %10
}

attributes #0 = { nounwind readnone }
