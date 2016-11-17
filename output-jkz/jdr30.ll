; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %6 = icmp sgt i64 %3, %4
  br i1 %6, label %7, label %11

; <label>:7:                                      ; preds = %entry
  %8 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %9 = extractvalue { i64, i1 } %8, 0
  %10 = extractvalue { i64, i1 } %8, 1
  br i1 %10, label %28, label %27

; <label>:11:                                     ; preds = %entry
  %12 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %4, i64 %5)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  br i1 %14, label %30, label %29

; <label>:15:                                     ; preds = %29, %27
  %16 = phi i64 [ %9, %27 ], [ %13, %29 ]
  %17 = phi i64 [ 0, %27 ], [ 0, %29 ]
  %18 = phi i64 [ 0, %27 ], [ 0, %29 ]
  %19 = phi i64 [ 0, %27 ], [ 0, %29 ]
  %20 = phi i64 [ 0, %27 ], [ 0, %29 ]
  %21 = phi i64 [ 0, %27 ], [ 0, %29 ]
  %22 = phi i64 [ 0, %27 ], [ 0, %29 ]
  %23 = phi i64 [ 0, %27 ], [ 0, %29 ]
  %24 = phi i64 [ 0, %27 ], [ 0, %29 ]
  %25 = phi i64 [ 0, %27 ], [ 0, %29 ]
  %26 = phi i64 [ 0, %27 ], [ 0, %29 ]
  ret i64 %16

; <label>:27:                                     ; preds = %7
  br label %15

; <label>:28:                                     ; preds = %7
  call void @overflow_fail(i32 69)
  unreachable

; <label>:29:                                     ; preds = %11
  br label %15

; <label>:30:                                     ; preds = %11
  call void @overflow_fail(i32 79)
  unreachable
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
