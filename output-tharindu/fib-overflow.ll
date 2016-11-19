; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

declare i64 @overflow_fail(i64)

define i64 @f(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5) {
entry:
  %m9 = alloca i64
  %m8 = alloca i64
  %m7 = alloca i64
  %m6 = alloca i64
  %m5 = alloca i64
  %m4 = alloca i64
  %m3 = alloca i64
  %m2 = alloca i64
  %m1 = alloca i64
  %m0 = alloca i64
  store i64 0, i64* %m0
  store i64 0, i64* %m1
  store i64 0, i64* %m2
  store i64 0, i64* %m3
  store i64 0, i64* %m4
  store i64 0, i64* %m5
  store i64 0, i64* %m6
  store i64 0, i64* %m7
  store i64 0, i64* %m8
  store i64 0, i64* %m9
  %ltetmp = icmp ule i64 %a0, 0
  %0 = icmp eq i1 %ltetmp, true
  br i1 %0, label %then, label %else

then:                                             ; preds = %entry
  br label %24

else:                                             ; preds = %entry
  store i64 1, i64* %m1
  store i64 1, i64* %m2
  br label %1

; <label>:1:                                      ; preds = %22, %else
  %2 = phi i64 [ 0, %else ], [ %m36, %22 ]
  %m21 = load i64, i64* %m2
  %lttmp = icmp ult i64 %m21, %a0
  %3 = icmp eq i1 %lttmp, true
  br i1 %3, label %5, label %4

; <label>:4:                                      ; preds = %1
  %m17 = load i64, i64* %m1
  br label %24

; <label>:5:                                      ; preds = %1
  %m22 = load i64, i64* %m2
  %6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m22, i64 1)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  %9 = icmp eq i1 %8, true
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %5
  %11 = call i64 @overflow_fail(i64 142)
  br label %13

; <label>:12:                                     ; preds = %5
  br label %13

; <label>:13:                                     ; preds = %12, %10
  %14 = phi i64 [ %7, %10 ], [ %7, %12 ]
  store i64 %14, i64* %m2
  %m13 = load i64, i64* %m1
  store i64 %m13, i64* %m3
  %m14 = load i64, i64* %m1
  %m05 = load i64, i64* %m0
  %15 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m14, i64 %m05)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  %18 = icmp eq i1 %17, true
  br i1 %18, label %19, label %21

; <label>:19:                                     ; preds = %13
  %20 = call i64 @overflow_fail(i64 198)
  br label %22

; <label>:21:                                     ; preds = %13
  br label %22

; <label>:22:                                     ; preds = %21, %19
  %23 = phi i64 [ %16, %19 ], [ %16, %21 ]
  store i64 %23, i64* %m1
  %m36 = load i64, i64* %m3
  store i64 %m36, i64* %m0
  br label %1

; <label>:24:                                     ; preds = %4, %then
  %iftmp = phi i64 [ 0, %then ], [ %m17, %4 ]
  ret i64 %iftmp
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
