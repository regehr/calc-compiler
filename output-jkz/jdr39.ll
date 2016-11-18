; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  br label %6

; <label>:6:                                      ; preds = %49, %entry
  %7 = phi i64 [ 0, %entry ], [ %40, %49 ]
  %8 = phi i64 [ 0, %entry ], [ 0, %49 ]
  %9 = phi i64 [ 0, %entry ], [ %24, %49 ]
  %10 = phi i64 [ 0, %entry ], [ %25, %49 ]
  %11 = phi i64 [ 0, %entry ], [ %26, %49 ]
  %12 = phi i64 [ 0, %entry ], [ %27, %49 ]
  %13 = phi i64 [ 0, %entry ], [ %28, %49 ]
  %14 = phi i64 [ 0, %entry ], [ %29, %49 ]
  %15 = phi i64 [ 0, %entry ], [ %30, %49 ]
  %16 = phi i64 [ 0, %entry ], [ %31, %49 ]
  %17 = phi i64 [ 0, %entry ], [ 0, %49 ]
  %18 = icmp ne i64 %7, %0
  br i1 %18, label %19, label %20

; <label>:19:                                     ; preds = %6
  br label %21

; <label>:20:                                     ; preds = %6
  ret i64 %9

; <label>:21:                                     ; preds = %47, %19
  %22 = phi i64 [ %7, %19 ], [ %22, %47 ]
  %23 = phi i64 [ %8, %19 ], [ %44, %47 ]
  %24 = phi i64 [ %9, %19 ], [ %36, %47 ]
  %25 = phi i64 [ %10, %19 ], [ %25, %47 ]
  %26 = phi i64 [ %11, %19 ], [ %26, %47 ]
  %27 = phi i64 [ %12, %19 ], [ %27, %47 ]
  %28 = phi i64 [ %13, %19 ], [ %28, %47 ]
  %29 = phi i64 [ %14, %19 ], [ %29, %47 ]
  %30 = phi i64 [ %15, %19 ], [ %30, %47 ]
  %31 = phi i64 [ %16, %19 ], [ %31, %47 ]
  %32 = phi i64 [ 0, %19 ], [ %44, %47 ]
  %33 = icmp ne i64 %23, %0
  br i1 %33, label %34, label %38

; <label>:34:                                     ; preds = %21
  %35 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %24)
  %36 = extractvalue { i64, i1 } %35, 0
  %37 = extractvalue { i64, i1 } %35, 1
  br i1 %37, label %46, label %42

; <label>:38:                                     ; preds = %21
  %39 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %22)
  %40 = extractvalue { i64, i1 } %39, 0
  %41 = extractvalue { i64, i1 } %39, 1
  br i1 %41, label %50, label %49

; <label>:42:                                     ; preds = %34
  %43 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %23)
  %44 = extractvalue { i64, i1 } %43, 0
  %45 = extractvalue { i64, i1 } %43, 1
  br i1 %45, label %48, label %47

; <label>:46:                                     ; preds = %34
  call void @overflow_fail(i32 115)
  unreachable

; <label>:47:                                     ; preds = %42
  br label %21

; <label>:48:                                     ; preds = %42
  call void @overflow_fail(i32 149)
  unreachable

; <label>:49:                                     ; preds = %38
  br label %6

; <label>:50:                                     ; preds = %38
  call void @overflow_fail(i32 183)
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
