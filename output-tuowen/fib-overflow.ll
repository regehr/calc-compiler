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
  %6 = icmp sle i64 %0, 0
  br i1 %6, label %thenIf, label %elseIf

thenIf:                                           ; preds = %entry
  br label %afterIf

elseIf:                                           ; preds = %entry
  br label %CondW

afterIf:                                          ; preds = %AfterW, %thenIf
  %7 = phi i64 [ 0, %thenIf ], [ %12, %AfterW ]
  %8 = phi i64 [ 0, %thenIf ], [ %13, %AfterW ]
  %9 = phi i64 [ 0, %thenIf ], [ %14, %AfterW ]
  %10 = phi i64 [ 0, %thenIf ], [ %15, %AfterW ]
  %11 = phi i64 [ 0, %thenIf ], [ %13, %AfterW ]
  ret i64 %11

CondW:                                            ; preds = %safe2, %elseIf
  %12 = phi i64 [ 0, %elseIf ], [ %13, %safe2 ]
  %13 = phi i64 [ 1, %elseIf ], [ %22, %safe2 ]
  %14 = phi i64 [ 1, %elseIf ], [ %19, %safe2 ]
  %15 = phi i64 [ 0, %elseIf ], [ %13, %safe2 ]
  %16 = phi i64 [ 0, %elseIf ], [ %13, %safe2 ]
  %17 = icmp slt i64 %14, %0
  br i1 %17, label %BodyW, label %AfterW

BodyW:                                            ; preds = %CondW
  %18 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %14, i64 1)
  %19 = extractvalue { i64, i1 } %18, 0
  %20 = extractvalue { i64, i1 } %18, 1
  br i1 %20, label %over, label %safe

AfterW:                                           ; preds = %CondW
  br label %afterIf

over:                                             ; preds = %BodyW
  tail call void @overflow_fail(i64 142)
  unreachable

safe:                                             ; preds = %BodyW
  %21 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %13, i64 %12)
  %22 = extractvalue { i64, i1 } %21, 0
  %23 = extractvalue { i64, i1 } %21, 1
  br i1 %23, label %over1, label %safe2

over1:                                            ; preds = %safe
  tail call void @overflow_fail(i64 198)
  unreachable

safe2:                                            ; preds = %safe
  br label %CondW
}

attributes #0 = { nounwind readnone }
