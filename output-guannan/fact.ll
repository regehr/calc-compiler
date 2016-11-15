; (seq (set 1 m0) (seq (set 1 m1) (while (<= m1 a0) (seq (set (* m0 m1) m0) (seq (set (+ m1 1) m1) m0)))))
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
  store i64 1, i64* %m0
  store i64 1, i64* %m1
  %m11 = load i64, i64* %m1
  %le = icmp sle i64 %m11, %0
  br i1 %le, label %body, label %cont

body:                                             ; preds = %normal6, %entry
  %m02 = load i64, i64* %m0
  %m13 = load i64, i64* %m1
  %result = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %m02, i64 %m13)
  %fst = extractvalue { i64, i1 } %result, 0
  %snd = extractvalue { i64, i1 } %result, 1
  br i1 %snd, label %of, label %normal

cont:                                             ; preds = %normal6, %entry
  %tmp = phi i64 [ 0, %entry ], [ %m011, %normal6 ]
  ret i64 %tmp

of:                                               ; preds = %body
  call void @overflow_fail(i32 115)
  br label %normal

normal:                                           ; preds = %of, %body
  %add = phi i64 [ %fst, %of ], [ %fst, %body ]
  store i64 %add, i64* %m0
  %m14 = load i64, i64* %m1
  %result7 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m14, i64 1)
  %fst8 = extractvalue { i64, i1 } %result7, 0
  %snd9 = extractvalue { i64, i1 } %result7, 1
  br i1 %snd9, label %of5, label %normal6

of5:                                              ; preds = %normal
  call void @overflow_fail(i32 161)
  br label %normal6

normal6:                                          ; preds = %of5, %normal
  %add10 = phi i64 [ %fst8, %of5 ], [ %fst8, %normal ]
  store i64 %add10, i64* %m1
  %m011 = load i64, i64* %m0
  %m112 = load i64, i64* %m1
  %le13 = icmp sle i64 %m112, %0
  br i1 %le13, label %body, label %cont
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
