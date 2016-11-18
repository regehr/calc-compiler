; (+ (+ a0 m0) (+ (+ a1 m1) (+ (+ a2 m2) m3)))
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
  %result = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %0, i64 %m01)
  %fst = extractvalue { i64, i1 } %result, 0
  %snd = extractvalue { i64, i1 } %result, 1
  br i1 %snd, label %of, label %normal

of:                                               ; preds = %entry
  call void @overflow_fail(i32 29)
  br label %normal

normal:                                           ; preds = %of, %entry
  %add = phi i64 [ %fst, %of ], [ %fst, %entry ]
  %m12 = load i64, i64* %m1
  %result5 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %m12)
  %fst6 = extractvalue { i64, i1 } %result5, 0
  %snd7 = extractvalue { i64, i1 } %result5, 1
  br i1 %snd7, label %of3, label %normal4

of3:                                              ; preds = %normal
  call void @overflow_fail(i32 42)
  br label %normal4

normal4:                                          ; preds = %of3, %normal
  %add8 = phi i64 [ %fst6, %of3 ], [ %fst6, %normal ]
  %m29 = load i64, i64* %m2
  %result12 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %2, i64 %m29)
  %fst13 = extractvalue { i64, i1 } %result12, 0
  %snd14 = extractvalue { i64, i1 } %result12, 1
  br i1 %snd14, label %of10, label %normal11

of10:                                             ; preds = %normal4
  call void @overflow_fail(i32 55)
  br label %normal11

normal11:                                         ; preds = %of10, %normal4
  %add15 = phi i64 [ %fst13, %of10 ], [ %fst13, %normal4 ]
  %m316 = load i64, i64* %m3
  %result19 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %add15, i64 %m316)
  %fst20 = extractvalue { i64, i1 } %result19, 0
  %snd21 = extractvalue { i64, i1 } %result19, 1
  br i1 %snd21, label %of17, label %normal18

of17:                                             ; preds = %normal11
  call void @overflow_fail(i32 52)
  br label %normal18

normal18:                                         ; preds = %of17, %normal11
  %add22 = phi i64 [ %fst20, %of17 ], [ %fst20, %normal11 ]
  %result25 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %add8, i64 %add22)
  %fst26 = extractvalue { i64, i1 } %result25, 0
  %snd27 = extractvalue { i64, i1 } %result25, 1
  br i1 %snd27, label %of23, label %normal24

of23:                                             ; preds = %normal18
  call void @overflow_fail(i32 39)
  br label %normal24

normal24:                                         ; preds = %of23, %normal18
  %add28 = phi i64 [ %fst26, %of23 ], [ %fst26, %normal18 ]
  %result31 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %add, i64 %add28)
  %fst32 = extractvalue { i64, i1 } %result31, 0
  %snd33 = extractvalue { i64, i1 } %result31, 1
  br i1 %snd33, label %of29, label %normal30

of29:                                             ; preds = %normal24
  call void @overflow_fail(i32 26)
  br label %normal30

normal30:                                         ; preds = %of29, %normal24
  %add34 = phi i64 [ %fst32, %of29 ], [ %fst32, %normal24 ]
  ret i64 %add34
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
