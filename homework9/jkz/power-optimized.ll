; ModuleID = 'power.ll'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {
entry:
  br label %6

; <label>:6:                                      ; preds = %16, %entry
  %7 = phi i64 [ %0, %entry ], [ %13, %16 ]
  %8 = phi i64 [ %1, %entry ], [ %18, %16 ]
  %9 = phi i64 [ 0, %entry ], [ %13, %16 ]
  %10 = icmp eq i64 %8, 1
  br i1 %10, label %15, label %11

; <label>:11:                                     ; preds = %6
  %12 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %7, i64 %0)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  br i1 %14, label %20, label %16

; <label>:15:                                     ; preds = %6
  ret i64 %9

; <label>:16:                                     ; preds = %11
  %17 = tail call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %8, i64 1)
  %18 = extractvalue { i64, i1 } %17, 0
  %19 = extractvalue { i64, i1 } %17, 1
  br i1 %19, label %21, label %6

; <label>:20:                                     ; preds = %11
  tail call void @overflow_fail(i32 120)
  unreachable

; <label>:21:                                     ; preds = %16
  tail call void @overflow_fail(i32 167)
  unreachable
}

; Function Attrs: noreturn
declare void @overflow_fail(i32) local_unnamed_addr #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #1

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #1

define i64 @_strap_div(i64, i64, i32) local_unnamed_addr {
  %4 = icmp eq i64 %1, 0
  %5 = icmp eq i64 %0, -9223372036854775808
  %6 = icmp eq i64 %1, -1
  %7 = and i1 %5, %6
  %8 = or i1 %4, %7
  br i1 %8, label %11, label %9

; <label>:9:                                      ; preds = %3
  %10 = sdiv i64 %0, %1
  ret i64 %10

; <label>:11:                                     ; preds = %3
  tail call void @overflow_fail(i32 %2)
  unreachable
}

define i64 @_strap_mod(i64, i64, i32) local_unnamed_addr {
  %4 = icmp eq i64 %1, 0
  br i1 %4, label %7, label %5

; <label>:5:                                      ; preds = %3
  %6 = srem i64 %0, %1
  ret i64 %6

; <label>:7:                                      ; preds = %3
  tail call void @overflow_fail(i32 %2)
  unreachable
}

attributes #0 = { noreturn }
attributes #1 = { nounwind readnone }
