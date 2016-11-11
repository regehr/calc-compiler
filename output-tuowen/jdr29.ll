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
  %7 = icmp sgt i64 1, 2
  br i1 %7, label %thenIf1, label %elseIf2

elseIf:                                           ; preds = %entry
  %8 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %4, i64 %5)
  %9 = extractvalue { i64, i1 } %8, 0
  %10 = extractvalue { i64, i1 } %8, 1
  br i1 %10, label %over4, label %safe5

afterIf:                                          ; preds = %safe5, %safe
  %11 = phi i64 [ %14, %safe ], [ %9, %safe5 ]
  ret i64 %11

thenIf1:                                          ; preds = %thenIf
  br label %afterIf3

elseIf2:                                          ; preds = %thenIf
  br label %afterIf3

afterIf3:                                         ; preds = %elseIf2, %thenIf1
  %12 = phi i64 [ 3, %thenIf1 ], [ 5, %elseIf2 ]
  %13 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %12, i64 %2)
  %14 = extractvalue { i64, i1 } %13, 0
  %15 = extractvalue { i64, i1 } %13, 1
  br i1 %15, label %over, label %safe

over:                                             ; preds = %afterIf3
  tail call void @overflow_fail(i64 69)
  unreachable

safe:                                             ; preds = %afterIf3
  br label %afterIf

over4:                                            ; preds = %elseIf
  tail call void @overflow_fail(i64 93)
  unreachable

safe5:                                            ; preds = %elseIf
  br label %afterIf
}

attributes #0 = { nounwind readnone }
