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

CondW:                                            ; preds = %safe7, %entry
  %6 = phi i64 [ 0, %entry ], [ %19, %safe7 ]
  %7 = phi i64 [ 0, %entry ], [ 0, %safe7 ]
  %8 = phi i64 [ 0, %entry ], [ %12, %safe7 ]
  %9 = phi i64 [ 0, %entry ], [ 0, %safe7 ]
  %10 = icmp ne i64 %6, %0
  br i1 %10, label %BodyW, label %AfterW

BodyW:                                            ; preds = %CondW
  br label %CondW1

AfterW:                                           ; preds = %CondW
  ret i64 %8

CondW1:                                           ; preds = %safe5, %BodyW
  %11 = phi i64 [ %7, %BodyW ], [ %22, %safe5 ]
  %12 = phi i64 [ %8, %BodyW ], [ %16, %safe5 ]
  %13 = phi i64 [ 0, %BodyW ], [ %22, %safe5 ]
  %14 = icmp ne i64 %11, %0
  br i1 %14, label %BodyW2, label %AfterW3

BodyW2:                                           ; preds = %CondW1
  %15 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %12)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %over, label %safe

AfterW3:                                          ; preds = %CondW1
  %18 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %6)
  %19 = extractvalue { i64, i1 } %18, 0
  %20 = extractvalue { i64, i1 } %18, 1
  br i1 %20, label %over6, label %safe7

over:                                             ; preds = %BodyW2
  tail call void @overflow_fail(i64 115)
  unreachable

safe:                                             ; preds = %BodyW2
  %21 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %11)
  %22 = extractvalue { i64, i1 } %21, 0
  %23 = extractvalue { i64, i1 } %21, 1
  br i1 %23, label %over4, label %safe5

over4:                                            ; preds = %safe
  tail call void @overflow_fail(i64 149)
  unreachable

safe5:                                            ; preds = %safe
  br label %CondW1

over6:                                            ; preds = %AfterW3
  tail call void @overflow_fail(i64 183)
  unreachable

safe7:                                            ; preds = %AfterW3
  br label %CondW
}

attributes #0 = { nounwind readnone }
