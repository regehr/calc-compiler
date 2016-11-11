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
  %6 = phi i64 [ 0, %entry ], [ %10, %safe2 ]
  %7 = phi i64 [ 0, %entry ], [ %13, %safe2 ]
  %8 = phi i64 [ 0, %entry ], [ %13, %safe2 ]
  %9 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %6, i64 1)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %over, label %safe

BodyW:                                            ; preds = %safe
  %12 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %7, i64 1)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  br i1 %14, label %over1, label %safe2

AfterW:                                           ; preds = %safe
  ret i64 %10

over:                                             ; preds = %CondW
  tail call void @overflow_fail(i64 46)
  unreachable

safe:                                             ; preds = %CondW
  %15 = icmp slt i64 %7, 10
  br i1 %15, label %BodyW, label %AfterW

over1:                                            ; preds = %BodyW
  tail call void @overflow_fail(i64 123)
  unreachable

safe2:                                            ; preds = %BodyW
  br label %CondW
}

attributes #0 = { nounwind readnone }
