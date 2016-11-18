; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  br label %6

; <label>:6:                                      ; preds = %19, %entry
  %7 = phi i64 [ %0, %entry ], [ %8, %19 ]
  %8 = phi i64 [ %1, %entry ], [ %20, %19 ]
  %9 = phi i64 [ 0, %entry ], [ %8, %19 ]
  %10 = phi i64 [ 0, %entry ], [ %10, %19 ]
  %11 = phi i64 [ 0, %entry ], [ %11, %19 ]
  %12 = phi i64 [ 0, %entry ], [ %12, %19 ]
  %13 = phi i64 [ 0, %entry ], [ %13, %19 ]
  %14 = phi i64 [ 0, %entry ], [ %14, %19 ]
  %15 = phi i64 [ 0, %entry ], [ %15, %19 ]
  %16 = phi i64 [ 0, %entry ], [ %16, %19 ]
  %17 = phi i64 [ 0, %entry ], [ %8, %19 ]
  %18 = icmp ne i64 %8, 0
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %6
  %20 = call i64 @_strap_mod(i64 %7, i64 %8, i32 135)
  br label %6

; <label>:21:                                     ; preds = %6
  ret i64 %7
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
