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
  br label %CondW

CondW:                                            ; preds = %safe2, %entry
  %6 = phi i64 [ 0, %entry ], [ %11, %safe2 ]
  %7 = phi i64 [ 0, %entry ], [ %14, %safe2 ]
  %8 = phi i64 [ 0, %entry ], [ %14, %safe2 ]
  %9 = icmp ne i64 %6, %0
  br i1 %9, label %BodyW, label %AfterW

BodyW:                                            ; preds = %CondW
  %10 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %6)
  %11 = extractvalue { i64, i1 } %10, 0
  %12 = extractvalue { i64, i1 } %10, 1
  br i1 %12, label %over, label %safe

AfterW:                                           ; preds = %CondW
  ret i64 %8

over:                                             ; preds = %BodyW
  tail call void @overflow_fail(i64 57)
  unreachable

safe:                                             ; preds = %BodyW
  %13 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 3, i64 %7)
  %14 = extractvalue { i64, i1 } %13, 0
  %15 = extractvalue { i64, i1 } %13, 1
  br i1 %15, label %over1, label %safe2

over1:                                            ; preds = %safe
  tail call void @overflow_fail(i64 75)
  unreachable

safe2:                                            ; preds = %safe
  br label %CondW
}

attributes #0 = { nounwind readnone }
