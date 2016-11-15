; (seq (while (!= m0 a0) (seq (while (!= m1 a0) (seq (set (+ 1 m2) m2) (set (+ 1 m1) m1))) (seq (set (+ 1 m0) m0) (set 0 m1)))) m2)
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
  %neq = icmp ne i64 %m01, %0
  br i1 %neq, label %body, label %cont

body:                                             ; preds = %normal18, %entry
  %m14 = load i64, i64* %m1
  %neq5 = icmp ne i64 %m14, %0
  br i1 %neq5, label %body2, label %cont3

cont:                                             ; preds = %normal18, %entry
  %tmp25 = phi i64 [ 0, %entry ], [ 0, %normal18 ]
  %m226 = load i64, i64* %m2
  ret i64 %m226

body2:                                            ; preds = %normal9, %body
  %m26 = load i64, i64* %m2
  %result = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %m26)
  %fst = extractvalue { i64, i1 } %result, 0
  %snd = extractvalue { i64, i1 } %result, 1
  br i1 %snd, label %of, label %normal

cont3:                                            ; preds = %normal9, %body
  %tmp = phi i64 [ 0, %body ], [ %add13, %normal9 ]
  %m016 = load i64, i64* %m0
  %result19 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %m016)
  %fst20 = extractvalue { i64, i1 } %result19, 0
  %snd21 = extractvalue { i64, i1 } %result19, 1
  br i1 %snd21, label %of17, label %normal18

of:                                               ; preds = %body2
  call void @overflow_fail(i32 115)
  br label %normal

normal:                                           ; preds = %of, %body2
  %add = phi i64 [ %fst, %of ], [ %fst, %body2 ]
  store i64 %add, i64* %m2
  %m17 = load i64, i64* %m1
  %result10 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %m17)
  %fst11 = extractvalue { i64, i1 } %result10, 0
  %snd12 = extractvalue { i64, i1 } %result10, 1
  br i1 %snd12, label %of8, label %normal9

of8:                                              ; preds = %normal
  call void @overflow_fail(i32 149)
  br label %normal9

normal9:                                          ; preds = %of8, %normal
  %add13 = phi i64 [ %fst11, %of8 ], [ %fst11, %normal ]
  store i64 %add13, i64* %m1
  %m114 = load i64, i64* %m1
  %neq15 = icmp ne i64 %m114, %0
  br i1 %neq15, label %body2, label %cont3

of17:                                             ; preds = %cont3
  call void @overflow_fail(i32 183)
  br label %normal18

normal18:                                         ; preds = %of17, %cont3
  %add22 = phi i64 [ %fst20, %of17 ], [ %fst20, %cont3 ]
  store i64 %add22, i64* %m0
  store i64 0, i64* %m1
  %m023 = load i64, i64* %m0
  %neq24 = icmp ne i64 %m023, %0
  br i1 %neq24, label %body, label %cont
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
