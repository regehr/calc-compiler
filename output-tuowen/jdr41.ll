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

CondW:                                            ; preds = %safe15, %entry
  %6 = phi i64 [ 0, %entry ], [ %19, %safe15 ]
  %7 = phi i64 [ 0, %entry ], [ 0, %safe15 ]
  %8 = phi i64 [ 0, %entry ], [ %12, %safe15 ]
  %9 = phi i64 [ 0, %entry ], [ 0, %safe15 ]
  %10 = icmp ne i64 %6, %0
  br i1 %10, label %BodyW, label %AfterW

BodyW:                                            ; preds = %CondW
  br label %CondW1

AfterW:                                           ; preds = %CondW
  ret i64 %8

CondW1:                                           ; preds = %safe13, %BodyW
  %11 = phi i64 [ %7, %BodyW ], [ %36, %safe13 ]
  %12 = phi i64 [ %8, %BodyW ], [ %33, %safe13 ]
  %13 = phi i64 [ 0, %BodyW ], [ %36, %safe13 ]
  %14 = icmp ne i64 %11, %0
  br i1 %14, label %BodyW2, label %AfterW3

BodyW2:                                           ; preds = %CondW1
  %15 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %11, i64 %11)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %over, label %safe

AfterW3:                                          ; preds = %CondW1
  %18 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %6)
  %19 = extractvalue { i64, i1 } %18, 0
  %20 = extractvalue { i64, i1 } %18, 1
  br i1 %20, label %over14, label %safe15

over:                                             ; preds = %BodyW2
  tail call void @overflow_fail(i64 266)
  unreachable

safe:                                             ; preds = %BodyW2
  %21 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %6, i64 %6)
  %22 = extractvalue { i64, i1 } %21, 0
  %23 = extractvalue { i64, i1 } %21, 1
  br i1 %23, label %over4, label %safe5

over4:                                            ; preds = %safe
  tail call void @overflow_fail(i64 285)
  unreachable

safe5:                                            ; preds = %safe
  %24 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %6, i64 %22)
  %25 = extractvalue { i64, i1 } %24, 0
  %26 = extractvalue { i64, i1 } %24, 1
  br i1 %26, label %over6, label %safe7

over6:                                            ; preds = %safe5
  tail call void @overflow_fail(i64 279)
  unreachable

safe7:                                            ; preds = %safe5
  %27 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %25, i64 4)
  %28 = extractvalue { i64, i1 } %27, 0
  %29 = extractvalue { i64, i1 } %27, 1
  br i1 %29, label %over8, label %safe9

over8:                                            ; preds = %safe7
  tail call void @overflow_fail(i64 276)
  unreachable

safe9:                                            ; preds = %safe7
  %30 = icmp eq i64 %16, %28
  br i1 %30, label %thenIf, label %elseIf

thenIf:                                           ; preds = %safe9
  br label %afterIf

elseIf:                                           ; preds = %safe9
  br label %afterIf

afterIf:                                          ; preds = %elseIf, %thenIf
  %31 = phi i64 [ 1, %thenIf ], [ 0, %elseIf ]
  %32 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %31, i64 %12)
  %33 = extractvalue { i64, i1 } %32, 0
  %34 = extractvalue { i64, i1 } %32, 1
  br i1 %34, label %over10, label %safe11

over10:                                           ; preds = %afterIf
  tail call void @overflow_fail(i64 255)
  unreachable

safe11:                                           ; preds = %afterIf
  %35 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %11)
  %36 = extractvalue { i64, i1 } %35, 0
  %37 = extractvalue { i64, i1 } %35, 1
  br i1 %37, label %over12, label %safe13

over12:                                           ; preds = %safe11
  tail call void @overflow_fail(i64 334)
  unreachable

safe13:                                           ; preds = %safe11
  br label %CondW1

over14:                                           ; preds = %AfterW3
  tail call void @overflow_fail(i64 368)
  unreachable

safe15:                                           ; preds = %AfterW3
  br label %CondW
}

attributes #0 = { nounwind readnone }
