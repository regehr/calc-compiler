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

CondW:                                            ; preds = %safe, %entry
  %6 = phi i64 [ %0, %entry ], [ %7, %safe ]
  %7 = phi i64 [ %1, %entry ], [ %12, %safe ]
  %8 = phi i64 [ 0, %entry ], [ %7, %safe ]
  %9 = phi i64 [ 0, %entry ], [ %7, %safe ]
  %10 = icmp ne i64 %7, 0
  br i1 %10, label %BodyW, label %AfterW

BodyW:                                            ; preds = %CondW
  %11 = icmp eq i64 %7, 0
  br i1 %11, label %over, label %safe

AfterW:                                           ; preds = %CondW
  ret i64 %6

over:                                             ; preds = %BodyW
  tail call void @overflow_fail(i64 135)
  unreachable

safe:                                             ; preds = %BodyW
  %12 = srem i64 %6, %7
  br label %CondW
}

attributes #0 = { nounwind readnone }
