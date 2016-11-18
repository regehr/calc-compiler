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
  %6 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 4)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %over, label %safe

over:                                             ; preds = %entry
  tail call void @overflow_fail(i64 29)
  unreachable

safe:                                             ; preds = %entry
  %9 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 4)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %over1, label %safe2

over1:                                            ; preds = %safe
  tail call void @overflow_fail(i64 84)
  unreachable

safe2:                                            ; preds = %safe
  %12 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %10, i64 4)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  br i1 %14, label %over3, label %safe4

over3:                                            ; preds = %safe2
  tail call void @overflow_fail(i64 56)
  unreachable

safe4:                                            ; preds = %safe2
  %15 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %7, i64 %13)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %over5, label %safe6

over5:                                            ; preds = %safe4
  tail call void @overflow_fail(i64 25)
  unreachable

safe6:                                            ; preds = %safe4
  %18 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %16, i64 4)
  %19 = extractvalue { i64, i1 } %18, 0
  %20 = extractvalue { i64, i1 } %18, 1
  br i1 %20, label %over7, label %safe8

over7:                                            ; preds = %safe6
  tail call void @overflow_fail(i64 22)
  unreachable

safe8:                                            ; preds = %safe6
  ret i64 %19
}

attributes #0 = { nounwind readnone }
