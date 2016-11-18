; (if (<= a0 0) 0 (seq (set 1 m1) (seq (set 1 m2) (seq (while (< m2 a0) (seq (set (+ m2 1) m2) (seq (set m1 m3) (seq (set (+ m1 m0) m1) (set m3 m0))))) m1))))
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
  %le = icmp sle i64 %0, 0
  br i1 %le, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont

else:                                             ; preds = %entry
  store i64 1, i64* %m1
  store i64 1, i64* %m2
  %m21 = load i64, i64* %m2
  %lt = icmp slt i64 %m21, %0
  br i1 %lt, label %body, label %cont

body:                                             ; preds = %normal7, %else
  %m22 = load i64, i64* %m2
  %result = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m22, i64 1)
  %fst = extractvalue { i64, i1 } %result, 0
  %snd = extractvalue { i64, i1 } %result, 1
  br i1 %snd, label %of, label %normal

cont:                                             ; preds = %normal7, %else
  %tmp = phi i64 [ 0, %else ], [ %m312, %normal7 ]
  %m115 = load i64, i64* %m1
  br label %ifcont

of:                                               ; preds = %body
  call void @overflow_fail(i32 125)
  br label %normal

normal:                                           ; preds = %of, %body
  %add = phi i64 [ %fst, %of ], [ %fst, %body ]
  store i64 %add, i64* %m2
  %m13 = load i64, i64* %m1
  store i64 %m13, i64* %m3
  %m14 = load i64, i64* %m1
  %m05 = load i64, i64* %m0
  %result8 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m14, i64 %m05)
  %fst9 = extractvalue { i64, i1 } %result8, 0
  %snd10 = extractvalue { i64, i1 } %result8, 1
  br i1 %snd10, label %of6, label %normal7

of6:                                              ; preds = %normal
  call void @overflow_fail(i32 181)
  br label %normal7

normal7:                                          ; preds = %of6, %normal
  %add11 = phi i64 [ %fst9, %of6 ], [ %fst9, %normal ]
  store i64 %add11, i64* %m1
  %m312 = load i64, i64* %m3
  store i64 %m312, i64* %m0
  %m213 = load i64, i64* %m2
  %lt14 = icmp slt i64 %m213, %0
  br i1 %lt14, label %body, label %cont

ifcont:                                           ; preds = %cont, %then
  %iftmp = phi i64 [ 0, %then ], [ %m115, %cont ]
  ret i64 %iftmp
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
