; (seq (seq (if true (set (+ 0 500) m0) (set (+ 0 0) m0)) (if true (+ 0 1) (+ 0 0))) m0)
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
  br i1 true, label %then, label %else

then:                                             ; preds = %entry
  %result = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 500)
  %fst = extractvalue { i64, i1 } %result, 0
  %snd = extractvalue { i64, i1 } %result, 1
  br i1 %snd, label %of, label %normal

of:                                               ; preds = %then
  call void @overflow_fail(i32 60)
  br label %normal

normal:                                           ; preds = %of, %then
  %add = phi i64 [ %fst, %of ], [ %fst, %then ]
  store i64 %add, i64* %m0
  br label %ifcont

else:                                             ; preds = %entry
  %result3 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 0)
  %fst4 = extractvalue { i64, i1 } %result3, 0
  %snd5 = extractvalue { i64, i1 } %result3, 1
  br i1 %snd5, label %of1, label %normal2

of1:                                              ; preds = %else
  call void @overflow_fail(i32 93)
  br label %normal2

normal2:                                          ; preds = %of1, %else
  %add6 = phi i64 [ %fst4, %of1 ], [ %fst4, %else ]
  store i64 %add6, i64* %m0
  br label %ifcont

ifcont:                                           ; preds = %normal2, %normal
  %iftmp = phi i64 [ %add, %normal ], [ %add6, %normal2 ]
  br i1 true, label %then7, label %else14

then7:                                            ; preds = %ifcont
  %result10 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 1)
  %fst11 = extractvalue { i64, i1 } %result10, 0
  %snd12 = extractvalue { i64, i1 } %result10, 1
  br i1 %snd12, label %of8, label %normal9

of8:                                              ; preds = %then7
  call void @overflow_fail(i32 125)
  br label %normal9

normal9:                                          ; preds = %of8, %then7
  %add13 = phi i64 [ %fst11, %of8 ], [ %fst11, %then7 ]
  br label %ifcont21

else14:                                           ; preds = %ifcont
  %result17 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 0, i64 0)
  %fst18 = extractvalue { i64, i1 } %result17, 0
  %snd19 = extractvalue { i64, i1 } %result17, 1
  br i1 %snd19, label %of15, label %normal16

of15:                                             ; preds = %else14
  call void @overflow_fail(i32 133)
  br label %normal16

normal16:                                         ; preds = %of15, %else14
  %add20 = phi i64 [ %fst18, %of15 ], [ %fst18, %else14 ]
  br label %ifcont21

ifcont21:                                         ; preds = %normal16, %normal9
  %iftmp22 = phi i64 [ %add13, %normal9 ], [ %add20, %normal16 ]
  %m023 = load i64, i64* %m0
  ret i64 %m023
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
