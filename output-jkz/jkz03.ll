; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  br label %6

; <label>:6:                                      ; preds = %22, %entry
  %7 = phi i64 [ 0, %entry ], [ %24, %22 ]
  %8 = phi i64 [ 0, %entry ], [ %25, %22 ]
  %9 = phi i64 [ 0, %entry ], [ %26, %22 ]
  %10 = phi i64 [ 0, %entry ], [ %27, %22 ]
  %11 = phi i64 [ 0, %entry ], [ %28, %22 ]
  %12 = phi i64 [ 0, %entry ], [ %29, %22 ]
  %13 = phi i64 [ 0, %entry ], [ %30, %22 ]
  %14 = phi i64 [ 0, %entry ], [ %31, %22 ]
  %15 = phi i64 [ 0, %entry ], [ %32, %22 ]
  %16 = phi i64 [ 0, %entry ], [ %33, %22 ]
  %17 = phi i64 [ 0, %entry ], [ %23, %22 ]
  br i1 false, label %18, label %19

; <label>:18:                                     ; preds = %6
  br i1 true, label %20, label %21

; <label>:19:                                     ; preds = %6
  ret i64 %17

; <label>:20:                                     ; preds = %18
  br label %22

; <label>:21:                                     ; preds = %18
  br label %22

; <label>:22:                                     ; preds = %21, %20
  %23 = phi i64 [ 0, %20 ], [ 0, %21 ]
  %24 = phi i64 [ %7, %20 ], [ %7, %21 ]
  %25 = phi i64 [ %8, %20 ], [ %8, %21 ]
  %26 = phi i64 [ %9, %20 ], [ %9, %21 ]
  %27 = phi i64 [ %10, %20 ], [ %10, %21 ]
  %28 = phi i64 [ %11, %20 ], [ %11, %21 ]
  %29 = phi i64 [ %12, %20 ], [ %12, %21 ]
  %30 = phi i64 [ %13, %20 ], [ %13, %21 ]
  %31 = phi i64 [ %14, %20 ], [ %14, %21 ]
  %32 = phi i64 [ %15, %20 ], [ %15, %21 ]
  %33 = phi i64 [ %16, %20 ], [ %16, %21 ]
  br label %6
}

; Function Attrs: noreturn
declare void @overflow_fail(i32) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #1

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #1

define i64 @_strap_div(i64, i64, i32) {
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
  call void @overflow_fail(i32 %2)
  unreachable
}

define i64 @_strap_mod(i64, i64, i32) {
  %4 = icmp eq i64 %1, 0
  br i1 %4, label %7, label %5

; <label>:5:                                      ; preds = %3
  %6 = srem i64 %0, %1
  ret i64 %6

; <label>:7:                                      ; preds = %3
  call void @overflow_fail(i32 %2)
  unreachable
}

attributes #0 = { noreturn }
attributes #1 = { nounwind readnone }
