; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %6 = icmp sgt i64 %3, %4
  br i1 %6, label %7, label %9

; <label>:7:                                      ; preds = %entry
  %8 = icmp sgt i64 1, 2
  br i1 %8, label %25, label %26

; <label>:9:                                      ; preds = %entry
  %10 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %4, i64 %5)
  %11 = extractvalue { i64, i1 } %10, 0
  %12 = extractvalue { i64, i1 } %10, 1
  br i1 %12, label %45, label %44

; <label>:13:                                     ; preds = %44, %42
  %14 = phi i64 [ %40, %42 ], [ %11, %44 ]
  %15 = phi i64 [ %29, %42 ], [ 0, %44 ]
  %16 = phi i64 [ %30, %42 ], [ 0, %44 ]
  %17 = phi i64 [ %31, %42 ], [ 0, %44 ]
  %18 = phi i64 [ %32, %42 ], [ 0, %44 ]
  %19 = phi i64 [ %33, %42 ], [ 0, %44 ]
  %20 = phi i64 [ %34, %42 ], [ 0, %44 ]
  %21 = phi i64 [ %35, %42 ], [ 0, %44 ]
  %22 = phi i64 [ %36, %42 ], [ 0, %44 ]
  %23 = phi i64 [ %37, %42 ], [ 0, %44 ]
  %24 = phi i64 [ %38, %42 ], [ 0, %44 ]
  ret i64 %14

; <label>:25:                                     ; preds = %7
  br label %27

; <label>:26:                                     ; preds = %7
  br label %27

; <label>:27:                                     ; preds = %26, %25
  %28 = phi i64 [ 3, %25 ], [ 5, %26 ]
  %29 = phi i64 [ 0, %25 ], [ 0, %26 ]
  %30 = phi i64 [ 0, %25 ], [ 0, %26 ]
  %31 = phi i64 [ 0, %25 ], [ 0, %26 ]
  %32 = phi i64 [ 0, %25 ], [ 0, %26 ]
  %33 = phi i64 [ 0, %25 ], [ 0, %26 ]
  %34 = phi i64 [ 0, %25 ], [ 0, %26 ]
  %35 = phi i64 [ 0, %25 ], [ 0, %26 ]
  %36 = phi i64 [ 0, %25 ], [ 0, %26 ]
  %37 = phi i64 [ 0, %25 ], [ 0, %26 ]
  %38 = phi i64 [ 0, %25 ], [ 0, %26 ]
  %39 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %28, i64 %2)
  %40 = extractvalue { i64, i1 } %39, 0
  %41 = extractvalue { i64, i1 } %39, 1
  br i1 %41, label %43, label %42

; <label>:42:                                     ; preds = %27
  br label %13

; <label>:43:                                     ; preds = %27
  call void @overflow_fail(i32 69)
  unreachable

; <label>:44:                                     ; preds = %9
  br label %13

; <label>:45:                                     ; preds = %9
  call void @overflow_fail(i32 93)
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
