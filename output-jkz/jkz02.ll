; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  br i1 true, label %6, label %10

; <label>:6:                                      ; preds = %entry
  %7 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 500)
  %8 = extractvalue { i64, i1 } %7, 0
  %9 = extractvalue { i64, i1 } %7, 1
  br i1 %9, label %27, label %26

; <label>:10:                                     ; preds = %entry
  %11 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 0)
  %12 = extractvalue { i64, i1 } %11, 0
  %13 = extractvalue { i64, i1 } %11, 1
  br i1 %13, label %29, label %28

; <label>:14:                                     ; preds = %28, %26
  %15 = phi i64 [ %8, %26 ], [ %12, %28 ]
  %16 = phi i64 [ %8, %26 ], [ %12, %28 ]
  %17 = phi i64 [ 0, %26 ], [ 0, %28 ]
  %18 = phi i64 [ 0, %26 ], [ 0, %28 ]
  %19 = phi i64 [ 0, %26 ], [ 0, %28 ]
  %20 = phi i64 [ 0, %26 ], [ 0, %28 ]
  %21 = phi i64 [ 0, %26 ], [ 0, %28 ]
  %22 = phi i64 [ 0, %26 ], [ 0, %28 ]
  %23 = phi i64 [ 0, %26 ], [ 0, %28 ]
  %24 = phi i64 [ 0, %26 ], [ 0, %28 ]
  %25 = phi i64 [ 0, %26 ], [ 0, %28 ]
  br i1 true, label %30, label %34

; <label>:26:                                     ; preds = %6
  br label %14

; <label>:27:                                     ; preds = %6
  call void @overflow_fail(i32 60)
  unreachable

; <label>:28:                                     ; preds = %10
  br label %14

; <label>:29:                                     ; preds = %10
  call void @overflow_fail(i32 93)
  unreachable

; <label>:30:                                     ; preds = %14
  %31 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 1)
  %32 = extractvalue { i64, i1 } %31, 0
  %33 = extractvalue { i64, i1 } %31, 1
  br i1 %33, label %51, label %50

; <label>:34:                                     ; preds = %14
  %35 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 0)
  %36 = extractvalue { i64, i1 } %35, 0
  %37 = extractvalue { i64, i1 } %35, 1
  br i1 %37, label %53, label %52

; <label>:38:                                     ; preds = %52, %50
  %39 = phi i64 [ %32, %50 ], [ %36, %52 ]
  %40 = phi i64 [ %16, %50 ], [ %16, %52 ]
  %41 = phi i64 [ %17, %50 ], [ %17, %52 ]
  %42 = phi i64 [ %18, %50 ], [ %18, %52 ]
  %43 = phi i64 [ %19, %50 ], [ %19, %52 ]
  %44 = phi i64 [ %20, %50 ], [ %20, %52 ]
  %45 = phi i64 [ %21, %50 ], [ %21, %52 ]
  %46 = phi i64 [ %22, %50 ], [ %22, %52 ]
  %47 = phi i64 [ %23, %50 ], [ %23, %52 ]
  %48 = phi i64 [ %24, %50 ], [ %24, %52 ]
  %49 = phi i64 [ %25, %50 ], [ %25, %52 ]
  ret i64 %40

; <label>:50:                                     ; preds = %30
  br label %38

; <label>:51:                                     ; preds = %30
  call void @overflow_fail(i32 125)
  unreachable

; <label>:52:                                     ; preds = %34
  br label %38

; <label>:53:                                     ; preds = %34
  call void @overflow_fail(i32 133)
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
