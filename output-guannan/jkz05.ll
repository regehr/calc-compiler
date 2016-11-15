; (seq (while (< (seq (set (+ m0 1) m0) m1) 10) (set (+ m1 1) m1)) m0)
; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

declare void @overflow_fail(i32)

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %m0 = alloca i64
  store i64 0, i64* %m0
  %m1 = alloca i64
  store i64 0, i64* %m1
  %m2 = alloca i64
  store i64 0, i64* %m2
  %m3 = alloca i64
  store i64 0, i64* %m3
  %m4 = alloca i64
  store i64 0, i64* %m4
  %m5 = alloca i64
  store i64 0, i64* %m5
  %m6 = alloca i64
  store i64 0, i64* %m6
  %m7 = alloca i64
  store i64 0, i64* %m7
  %m8 = alloca i64
  store i64 0, i64* %m8
  %m9 = alloca i64
  store i64 0, i64* %m9
  %m01 = load i64, i64* %m0
  %result = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m01, i64 1)
  %fst = extractvalue { i64, i1 } %result, 0
  %snd = extractvalue { i64, i1 } %result, 1
  br i1 %snd, label %of, label %normal

body:                                             ; preds = %normal12, %normal
  %m13 = load i64, i64* %m1
  %result6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m13, i64 1)
  %fst7 = extractvalue { i64, i1 } %result6, 0
  %snd8 = extractvalue { i64, i1 } %result6, 1
  br i1 %snd8, label %of4, label %normal5

cont:                                             ; preds = %normal12, %normal
  %tmp = phi i64 [ 0, %normal ], [ %add9, %normal12 ]
  %m019 = load i64, i64* %m0
  ret i64 %m019

of:                                               ; preds = %entry
  call void @overflow_fail(i32 46)
  br label %normal

normal:                                           ; preds = %of, %entry
  %add = phi i64 [ %fst, %of ], [ %fst, %entry ]
  store i64 %add, i64* %m0
  %m12 = load i64, i64* %m1
  %lt = icmp slt i64 %m12, 10
  br i1 %lt, label %body, label %cont

of4:                                              ; preds = %body
  call void @overflow_fail(i32 123)
  br label %normal5

normal5:                                          ; preds = %of4, %body
  %add9 = phi i64 [ %fst7, %of4 ], [ %fst7, %body ]
  store i64 %add9, i64* %m1
  %m010 = load i64, i64* %m0
  %result13 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m010, i64 1)
  %fst14 = extractvalue { i64, i1 } %result13, 0
  %snd15 = extractvalue { i64, i1 } %result13, 1
  br i1 %snd15, label %of11, label %normal12

of11:                                             ; preds = %normal5
  call void @overflow_fail(i32 46)
  br label %normal12

normal12:                                         ; preds = %of11, %normal5
  %add16 = phi i64 [ %fst14, %of11 ], [ %fst14, %normal5 ]
  store i64 %add16, i64* %m0
  %m117 = load i64, i64* %m1
  %lt18 = icmp slt i64 %m117, 10
  br i1 %lt18, label %body, label %cont
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
