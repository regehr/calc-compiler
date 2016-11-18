; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 0)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %13, label %9

; <label>:9:                                      ; preds = %entry
  %10 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %7)
  %11 = extractvalue { i64, i1 } %10, 0
  %12 = extractvalue { i64, i1 } %10, 1
  br i1 %12, label %18, label %14

; <label>:13:                                     ; preds = %entry
  call void @overflow_fail(i32 67)
  unreachable

; <label>:14:                                     ; preds = %9
  %15 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %11)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %23, label %19

; <label>:18:                                     ; preds = %9
  call void @overflow_fail(i32 61)
  unreachable

; <label>:19:                                     ; preds = %14
  %20 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %16)
  %21 = extractvalue { i64, i1 } %20, 0
  %22 = extractvalue { i64, i1 } %20, 1
  br i1 %22, label %28, label %24

; <label>:23:                                     ; preds = %14
  call void @overflow_fail(i32 55)
  unreachable

; <label>:24:                                     ; preds = %19
  %25 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %21)
  %26 = extractvalue { i64, i1 } %25, 0
  %27 = extractvalue { i64, i1 } %25, 1
  br i1 %27, label %33, label %29

; <label>:28:                                     ; preds = %19
  call void @overflow_fail(i32 49)
  unreachable

; <label>:29:                                     ; preds = %24
  %30 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %26)
  %31 = extractvalue { i64, i1 } %30, 0
  %32 = extractvalue { i64, i1 } %30, 1
  br i1 %32, label %38, label %34

; <label>:33:                                     ; preds = %24
  call void @overflow_fail(i32 43)
  unreachable

; <label>:34:                                     ; preds = %29
  %35 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %31)
  %36 = extractvalue { i64, i1 } %35, 0
  %37 = extractvalue { i64, i1 } %35, 1
  br i1 %37, label %43, label %39

; <label>:38:                                     ; preds = %29
  call void @overflow_fail(i32 37)
  unreachable

; <label>:39:                                     ; preds = %34
  %40 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %36)
  %41 = extractvalue { i64, i1 } %40, 0
  %42 = extractvalue { i64, i1 } %40, 1
  br i1 %42, label %48, label %44

; <label>:43:                                     ; preds = %34
  call void @overflow_fail(i32 31)
  unreachable

; <label>:44:                                     ; preds = %39
  %45 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 %41)
  %46 = extractvalue { i64, i1 } %45, 0
  %47 = extractvalue { i64, i1 } %45, 1
  br i1 %47, label %50, label %49

; <label>:48:                                     ; preds = %39
  call void @overflow_fail(i32 25)
  unreachable

; <label>:49:                                     ; preds = %44
  ret i64 %46

; <label>:50:                                     ; preds = %44
  call void @overflow_fail(i32 19)
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
