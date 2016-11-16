; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  br label %6

; <label>:6:                                      ; preds = %24, %entry
  %7 = phi i64 [ 0, %entry ], [ %21, %24 ]
  %8 = phi i64 [ 0, %entry ], [ %8, %24 ]
  %9 = phi i64 [ 0, %entry ], [ %9, %24 ]
  %10 = phi i64 [ 0, %entry ], [ %10, %24 ]
  %11 = phi i64 [ 0, %entry ], [ %11, %24 ]
  %12 = phi i64 [ 0, %entry ], [ %12, %24 ]
  %13 = phi i64 [ 0, %entry ], [ %13, %24 ]
  %14 = phi i64 [ 0, %entry ], [ %14, %24 ]
  %15 = phi i64 [ 0, %entry ], [ %15, %24 ]
  %16 = phi i64 [ 0, %entry ], [ %16, %24 ]
  %17 = phi i64 [ 0, %entry ], [ 555, %24 ]
  %18 = icmp ne i64 %7, %0
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %6
  %20 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %7)
  %21 = extractvalue { i64, i1 } %20, 0
  %22 = extractvalue { i64, i1 } %20, 1
  br i1 %22, label %25, label %24

; <label>:23:                                     ; preds = %6
  ret i64 %17

; <label>:24:                                     ; preds = %19
  br label %6

; <label>:25:                                     ; preds = %19
  call void @overflow_fail(i32 55)
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
