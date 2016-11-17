; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  br label %6

; <label>:6:                                      ; preds = %33, %entry
  %7 = phi i64 [ 0, %entry ], [ %21, %33 ]
  %8 = phi i64 [ 0, %entry ], [ %22, %33 ]
  %9 = phi i64 [ 0, %entry ], [ %23, %33 ]
  %10 = phi i64 [ 0, %entry ], [ %24, %33 ]
  %11 = phi i64 [ 0, %entry ], [ %25, %33 ]
  %12 = phi i64 [ 0, %entry ], [ %26, %33 ]
  %13 = phi i64 [ 0, %entry ], [ %27, %33 ]
  %14 = phi i64 [ 0, %entry ], [ %28, %33 ]
  %15 = phi i64 [ 0, %entry ], [ %29, %33 ]
  %16 = phi i64 [ 0, %entry ], [ %30, %33 ]
  %17 = phi i64 [ 0, %entry ], [ %31, %33 ]
  br i1 false, label %18, label %19

; <label>:18:                                     ; preds = %6
  br label %20

; <label>:19:                                     ; preds = %6
  ret i64 %17

; <label>:20:                                     ; preds = %32, %18
  %21 = phi i64 [ %7, %18 ], [ %21, %32 ]
  %22 = phi i64 [ %8, %18 ], [ %22, %32 ]
  %23 = phi i64 [ %9, %18 ], [ %23, %32 ]
  %24 = phi i64 [ %10, %18 ], [ %24, %32 ]
  %25 = phi i64 [ %11, %18 ], [ %25, %32 ]
  %26 = phi i64 [ %12, %18 ], [ %26, %32 ]
  %27 = phi i64 [ %13, %18 ], [ %27, %32 ]
  %28 = phi i64 [ %14, %18 ], [ %28, %32 ]
  %29 = phi i64 [ %15, %18 ], [ %29, %32 ]
  %30 = phi i64 [ %16, %18 ], [ %30, %32 ]
  %31 = phi i64 [ 0, %18 ], [ 0, %32 ]
  br i1 false, label %32, label %33

; <label>:32:                                     ; preds = %20
  br label %20

; <label>:33:                                     ; preds = %20
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
