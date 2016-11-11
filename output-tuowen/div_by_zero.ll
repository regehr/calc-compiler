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
  %6 = icmp eq i64 0, 0
  %7 = icmp eq i64 0, -1
  %8 = icmp eq i64 12345678, -9223372036854775808
  %9 = and i1 %8, %7
  %10 = or i1 %6, %9
  br i1 %10, label %over, label %safe

over:                                             ; preds = %entry
  tail call void @overflow_fail(i64 37)
  unreachable

safe:                                             ; preds = %entry
  %11 = sdiv i64 12345678, 0
  ret i64 %11
}

attributes #0 = { nounwind readnone }
