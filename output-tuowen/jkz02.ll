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
  br i1 true, label %thenIf, label %elseIf

thenIf:                                           ; preds = %entry
  %6 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 500)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %over, label %safe

elseIf:                                           ; preds = %entry
  %9 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 0)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %over1, label %safe2

afterIf:                                          ; preds = %safe2, %safe
  %12 = phi i64 [ %7, %safe ], [ %10, %safe2 ]
  %13 = phi i64 [ %7, %safe ], [ %10, %safe2 ]
  br i1 true, label %thenIf3, label %elseIf4

over:                                             ; preds = %thenIf
  tail call void @overflow_fail(i64 60)
  unreachable

safe:                                             ; preds = %thenIf
  br label %afterIf

over1:                                            ; preds = %elseIf
  tail call void @overflow_fail(i64 93)
  unreachable

safe2:                                            ; preds = %elseIf
  br label %afterIf

thenIf3:                                          ; preds = %afterIf
  %14 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 1)
  %15 = extractvalue { i64, i1 } %14, 0
  %16 = extractvalue { i64, i1 } %14, 1
  br i1 %16, label %over6, label %safe7

elseIf4:                                          ; preds = %afterIf
  %17 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 0)
  %18 = extractvalue { i64, i1 } %17, 0
  %19 = extractvalue { i64, i1 } %17, 1
  br i1 %19, label %over8, label %safe9

afterIf5:                                         ; preds = %safe9, %safe7
  %20 = phi i64 [ %15, %safe7 ], [ %18, %safe9 ]
  ret i64 %12

over6:                                            ; preds = %thenIf3
  tail call void @overflow_fail(i64 125)
  unreachable

safe7:                                            ; preds = %thenIf3
  br label %afterIf5

over8:                                            ; preds = %elseIf4
  tail call void @overflow_fail(i64 133)
  unreachable

safe9:                                            ; preds = %elseIf4
  br label %afterIf5
}

attributes #0 = { nounwind readnone }
