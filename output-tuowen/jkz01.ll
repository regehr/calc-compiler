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
  %6 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 0)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %over, label %safe

over:                                             ; preds = %entry
  tail call void @overflow_fail(i64 67)
  unreachable

safe:                                             ; preds = %entry
  %9 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %7)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %over1, label %safe2

over1:                                            ; preds = %safe
  tail call void @overflow_fail(i64 61)
  unreachable

safe2:                                            ; preds = %safe
  %12 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %10)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  br i1 %14, label %over3, label %safe4

over3:                                            ; preds = %safe2
  tail call void @overflow_fail(i64 55)
  unreachable

safe4:                                            ; preds = %safe2
  %15 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %13)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %over5, label %safe6

over5:                                            ; preds = %safe4
  tail call void @overflow_fail(i64 49)
  unreachable

safe6:                                            ; preds = %safe4
  %18 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %16)
  %19 = extractvalue { i64, i1 } %18, 0
  %20 = extractvalue { i64, i1 } %18, 1
  br i1 %20, label %over7, label %safe8

over7:                                            ; preds = %safe6
  tail call void @overflow_fail(i64 43)
  unreachable

safe8:                                            ; preds = %safe6
  %21 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %19)
  %22 = extractvalue { i64, i1 } %21, 0
  %23 = extractvalue { i64, i1 } %21, 1
  br i1 %23, label %over9, label %safe10

over9:                                            ; preds = %safe8
  tail call void @overflow_fail(i64 37)
  unreachable

safe10:                                           ; preds = %safe8
  %24 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %22)
  %25 = extractvalue { i64, i1 } %24, 0
  %26 = extractvalue { i64, i1 } %24, 1
  br i1 %26, label %over11, label %safe12

over11:                                           ; preds = %safe10
  tail call void @overflow_fail(i64 31)
  unreachable

safe12:                                           ; preds = %safe10
  %27 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %25)
  %28 = extractvalue { i64, i1 } %27, 0
  %29 = extractvalue { i64, i1 } %27, 1
  br i1 %29, label %over13, label %safe14

over13:                                           ; preds = %safe12
  tail call void @overflow_fail(i64 25)
  unreachable

safe14:                                           ; preds = %safe12
  %30 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %28)
  %31 = extractvalue { i64, i1 } %30, 0
  %32 = extractvalue { i64, i1 } %30, 1
  br i1 %32, label %over15, label %safe16

over15:                                           ; preds = %safe14
  tail call void @overflow_fail(i64 19)
  unreachable

safe16:                                           ; preds = %safe14
  ret i64 %31
}

attributes #0 = { nounwind readnone }
