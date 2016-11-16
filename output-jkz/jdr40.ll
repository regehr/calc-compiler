; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  br label %6

; <label>:6:                                      ; preds = %84, %entry
  %7 = phi i64 [ 0, %entry ], [ %40, %84 ]
  %8 = phi i64 [ 0, %entry ], [ 0, %84 ]
  %9 = phi i64 [ 0, %entry ], [ %24, %84 ]
  %10 = phi i64 [ 0, %entry ], [ %25, %84 ]
  %11 = phi i64 [ 0, %entry ], [ %26, %84 ]
  %12 = phi i64 [ 0, %entry ], [ %27, %84 ]
  %13 = phi i64 [ 0, %entry ], [ %28, %84 ]
  %14 = phi i64 [ 0, %entry ], [ %29, %84 ]
  %15 = phi i64 [ 0, %entry ], [ %30, %84 ]
  %16 = phi i64 [ 0, %entry ], [ %31, %84 ]
  %17 = phi i64 [ 0, %entry ], [ 0, %84 ]
  %18 = icmp ne i64 %7, %0
  br i1 %18, label %19, label %20

; <label>:19:                                     ; preds = %6
  br label %21

; <label>:20:                                     ; preds = %6
  ret i64 %9

; <label>:21:                                     ; preds = %82, %19
  %22 = phi i64 [ %7, %19 ], [ %46, %82 ]
  %23 = phi i64 [ %8, %19 ], [ %79, %82 ]
  %24 = phi i64 [ %9, %19 ], [ %57, %82 ]
  %25 = phi i64 [ %10, %19 ], [ %49, %82 ]
  %26 = phi i64 [ %11, %19 ], [ %50, %82 ]
  %27 = phi i64 [ %12, %19 ], [ %51, %82 ]
  %28 = phi i64 [ %13, %19 ], [ %52, %82 ]
  %29 = phi i64 [ %14, %19 ], [ %53, %82 ]
  %30 = phi i64 [ %15, %19 ], [ %54, %82 ]
  %31 = phi i64 [ %16, %19 ], [ %55, %82 ]
  %32 = phi i64 [ 0, %19 ], [ %79, %82 ]
  %33 = icmp ne i64 %23, %0
  br i1 %33, label %34, label %38

; <label>:34:                                     ; preds = %21
  %35 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %23, i64 %23)
  %36 = extractvalue { i64, i1 } %35, 0
  %37 = extractvalue { i64, i1 } %35, 1
  br i1 %37, label %63, label %59

; <label>:38:                                     ; preds = %21
  %39 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %22)
  %40 = extractvalue { i64, i1 } %39, 0
  %41 = extractvalue { i64, i1 } %39, 1
  br i1 %41, label %85, label %84

; <label>:42:                                     ; preds = %74
  br label %44

; <label>:43:                                     ; preds = %74
  br label %44

; <label>:44:                                     ; preds = %43, %42
  %45 = phi i64 [ 1, %42 ], [ 0, %43 ]
  %46 = phi i64 [ %22, %42 ], [ %22, %43 ]
  %47 = phi i64 [ %23, %42 ], [ %23, %43 ]
  %48 = phi i64 [ %24, %42 ], [ %24, %43 ]
  %49 = phi i64 [ %25, %42 ], [ %25, %43 ]
  %50 = phi i64 [ %26, %42 ], [ %26, %43 ]
  %51 = phi i64 [ %27, %42 ], [ %27, %43 ]
  %52 = phi i64 [ %28, %42 ], [ %28, %43 ]
  %53 = phi i64 [ %29, %42 ], [ %29, %43 ]
  %54 = phi i64 [ %30, %42 ], [ %30, %43 ]
  %55 = phi i64 [ %31, %42 ], [ %31, %43 ]
  %56 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %45, i64 %48)
  %57 = extractvalue { i64, i1 } %56, 0
  %58 = extractvalue { i64, i1 } %56, 1
  br i1 %58, label %81, label %77

; <label>:59:                                     ; preds = %34
  %60 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %22, i64 %22)
  %61 = extractvalue { i64, i1 } %60, 0
  %62 = extractvalue { i64, i1 } %60, 1
  br i1 %62, label %68, label %64

; <label>:63:                                     ; preds = %34
  call void @overflow_fail(i32 259)
  unreachable

; <label>:64:                                     ; preds = %59
  %65 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %22, i64 %61)
  %66 = extractvalue { i64, i1 } %65, 0
  %67 = extractvalue { i64, i1 } %65, 1
  br i1 %67, label %73, label %69

; <label>:68:                                     ; preds = %59
  call void @overflow_fail(i32 278)
  unreachable

; <label>:69:                                     ; preds = %64
  %70 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %66, i64 24)
  %71 = extractvalue { i64, i1 } %70, 0
  %72 = extractvalue { i64, i1 } %70, 1
  br i1 %72, label %76, label %74

; <label>:73:                                     ; preds = %64
  call void @overflow_fail(i32 272)
  unreachable

; <label>:74:                                     ; preds = %69
  %75 = icmp eq i64 %36, %71
  br i1 %75, label %42, label %43

; <label>:76:                                     ; preds = %69
  call void @overflow_fail(i32 270)
  unreachable

; <label>:77:                                     ; preds = %44
  %78 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %47)
  %79 = extractvalue { i64, i1 } %78, 0
  %80 = extractvalue { i64, i1 } %78, 1
  br i1 %80, label %83, label %82

; <label>:81:                                     ; preds = %44
  call void @overflow_fail(i32 248)
  unreachable

; <label>:82:                                     ; preds = %77
  br label %21

; <label>:83:                                     ; preds = %77
  call void @overflow_fail(i32 328)
  unreachable

; <label>:84:                                     ; preds = %38
  br label %6

; <label>:85:                                     ; preds = %38
  call void @overflow_fail(i32 362)
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
