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
  %6 = phi i64 [ 0, %entry ], [ %10, %safe ]
  %7 = phi i64 [ 0, %entry ], [ 555, %safe ]
  %8 = icmp ne i64 %6, %0
  br i1 %8, label %BodyW, label %AfterW

BodyW:                                            ; preds = %CondW
  %9 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %6)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %over, label %safe

AfterW:                                           ; preds = %CondW
  ret i64 %7

over:                                             ; preds = %BodyW
  tail call void @overflow_fail(i64 55)
  unreachable

safe:                                             ; preds = %BodyW
  br label %CondW
}

attributes #0 = { nounwind readnone }
