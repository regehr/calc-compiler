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
  %6 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 -1, i64 -9223372036854775808)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %over, label %safe

over:                                             ; preds = %entry
  tail call void @overflow_fail(i64 37)
  unreachable

safe:                                             ; preds = %entry
  ret i64 %7
}

attributes #0 = { nounwind readnone }
