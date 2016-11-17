; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  br label %6

; <label>:6:                                      ; preds = %18, %entry
  %7 = phi i64 [ 0, %entry ], [ 1, %18 ]
  %8 = phi i64 [ 0, %entry ], [ %8, %18 ]
  %9 = phi i64 [ 0, %entry ], [ %9, %18 ]
  %10 = phi i64 [ 0, %entry ], [ %10, %18 ]
  %11 = phi i64 [ 0, %entry ], [ %11, %18 ]
  %12 = phi i64 [ 0, %entry ], [ %12, %18 ]
  %13 = phi i64 [ 0, %entry ], [ %13, %18 ]
  %14 = phi i64 [ 0, %entry ], [ %14, %18 ]
  %15 = phi i64 [ 0, %entry ], [ %15, %18 ]
  %16 = phi i64 [ 0, %entry ], [ %16, %18 ]
  %17 = phi i64 [ 0, %entry ], [ 1, %18 ]
  br i1 false, label %18, label %19

; <label>:18:                                     ; preds = %6
  br label %6

; <label>:19:                                     ; preds = %6
  ret i64 %17
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
