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
  %6 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %5, i64 0)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %over, label %safe

over:                                             ; preds = %entry
  tail call void @overflow_fail(i64 81)
  unreachable

safe:                                             ; preds = %entry
  %9 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %4, i64 %7)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %over1, label %safe2

over1:                                            ; preds = %safe
  tail call void @overflow_fail(i64 75)
  unreachable

safe2:                                            ; preds = %safe
  %12 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %10)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  br i1 %14, label %over3, label %safe4

over3:                                            ; preds = %safe2
  tail call void @overflow_fail(i64 69)
  unreachable

safe4:                                            ; preds = %safe2
  %15 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %2, i64 %13)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %over5, label %safe6

over5:                                            ; preds = %safe4
  tail call void @overflow_fail(i64 63)
  unreachable

safe6:                                            ; preds = %safe4
  %18 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %16)
  %19 = extractvalue { i64, i1 } %18, 0
  %20 = extractvalue { i64, i1 } %18, 1
  br i1 %20, label %over7, label %safe8

over7:                                            ; preds = %safe6
  tail call void @overflow_fail(i64 57)
  unreachable

safe8:                                            ; preds = %safe6
  %21 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %0, i64 %19)
  %22 = extractvalue { i64, i1 } %21, 0
  %23 = extractvalue { i64, i1 } %21, 1
  br i1 %23, label %over9, label %safe10

over9:                                            ; preds = %safe8
  tail call void @overflow_fail(i64 51)
  unreachable

safe10:                                           ; preds = %safe8
  ret i64 %22
}

attributes #0 = { nounwind readnone }
