; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %6 = icmp sle i64 %0, 0
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %entry
  br label %9

; <label>:8:                                      ; preds = %entry
  br label %21

; <label>:9:                                      ; preds = %38, %7
  %10 = phi i64 [ 0, %7 ], [ %23, %38 ]
  %11 = phi i64 [ 0, %7 ], [ %22, %38 ]
  %12 = phi i64 [ 0, %7 ], [ %23, %38 ]
  %13 = phi i64 [ 0, %7 ], [ %24, %38 ]
  %14 = phi i64 [ 0, %7 ], [ %25, %38 ]
  %15 = phi i64 [ 0, %7 ], [ %26, %38 ]
  %16 = phi i64 [ 0, %7 ], [ %27, %38 ]
  %17 = phi i64 [ 0, %7 ], [ %28, %38 ]
  %18 = phi i64 [ 0, %7 ], [ %29, %38 ]
  %19 = phi i64 [ 0, %7 ], [ %30, %38 ]
  %20 = phi i64 [ 0, %7 ], [ %31, %38 ]
  ret i64 %10

; <label>:21:                                     ; preds = %44, %8
  %22 = phi i64 [ 0, %8 ], [ %23, %44 ]
  %23 = phi i64 [ 1, %8 ], [ %41, %44 ]
  %24 = phi i64 [ 1, %8 ], [ %36, %44 ]
  %25 = phi i64 [ 0, %8 ], [ %23, %44 ]
  %26 = phi i64 [ 0, %8 ], [ %26, %44 ]
  %27 = phi i64 [ 0, %8 ], [ %27, %44 ]
  %28 = phi i64 [ 0, %8 ], [ %28, %44 ]
  %29 = phi i64 [ 0, %8 ], [ %29, %44 ]
  %30 = phi i64 [ 0, %8 ], [ %30, %44 ]
  %31 = phi i64 [ 0, %8 ], [ %31, %44 ]
  %32 = phi i64 [ 0, %8 ], [ %23, %44 ]
  %33 = icmp slt i64 %24, %0
  br i1 %33, label %34, label %38

; <label>:34:                                     ; preds = %21
  %35 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %24, i64 1)
  %36 = extractvalue { i64, i1 } %35, 0
  %37 = extractvalue { i64, i1 } %35, 1
  br i1 %37, label %43, label %39

; <label>:38:                                     ; preds = %21
  br label %9

; <label>:39:                                     ; preds = %34
  %40 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %23, i64 %22)
  %41 = extractvalue { i64, i1 } %40, 0
  %42 = extractvalue { i64, i1 } %40, 1
  br i1 %42, label %45, label %44

; <label>:43:                                     ; preds = %34
  call void @overflow_fail(i32 142)
  unreachable

; <label>:44:                                     ; preds = %39
  br label %21

; <label>:45:                                     ; preds = %39
  call void @overflow_fail(i32 198)
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
