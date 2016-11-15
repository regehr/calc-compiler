; (+ m0 (+ m1 (+ m2 (+ m3 (+ m4 (+ m5 (+ m6 (+ m7 (+ m8 m9)))))))))
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
  %m12 = load i64, i64* %m1
  %m23 = load i64, i64* %m2
  %m34 = load i64, i64* %m3
  %m45 = load i64, i64* %m4
  %m56 = load i64, i64* %m5
  %m67 = load i64, i64* %m6
  %m78 = load i64, i64* %m7
  %m89 = load i64, i64* %m8
  %m910 = load i64, i64* %m9
  %result = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m89, i64 %m910)
  %fst = extractvalue { i64, i1 } %result, 0
  %snd = extractvalue { i64, i1 } %result, 1
  br i1 %snd, label %of, label %normal

of:                                               ; preds = %entry
  call void @overflow_fail(i32 67)
  br label %normal

normal:                                           ; preds = %of, %entry
  %add = phi i64 [ %fst, %of ], [ %fst, %entry ]
  %result13 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m78, i64 %add)
  %fst14 = extractvalue { i64, i1 } %result13, 0
  %snd15 = extractvalue { i64, i1 } %result13, 1
  br i1 %snd15, label %of11, label %normal12

of11:                                             ; preds = %normal
  call void @overflow_fail(i32 61)
  br label %normal12

normal12:                                         ; preds = %of11, %normal
  %add16 = phi i64 [ %fst14, %of11 ], [ %fst14, %normal ]
  %result19 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m67, i64 %add16)
  %fst20 = extractvalue { i64, i1 } %result19, 0
  %snd21 = extractvalue { i64, i1 } %result19, 1
  br i1 %snd21, label %of17, label %normal18

of17:                                             ; preds = %normal12
  call void @overflow_fail(i32 55)
  br label %normal18

normal18:                                         ; preds = %of17, %normal12
  %add22 = phi i64 [ %fst20, %of17 ], [ %fst20, %normal12 ]
  %result25 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m56, i64 %add22)
  %fst26 = extractvalue { i64, i1 } %result25, 0
  %snd27 = extractvalue { i64, i1 } %result25, 1
  br i1 %snd27, label %of23, label %normal24

of23:                                             ; preds = %normal18
  call void @overflow_fail(i32 49)
  br label %normal24

normal24:                                         ; preds = %of23, %normal18
  %add28 = phi i64 [ %fst26, %of23 ], [ %fst26, %normal18 ]
  %result31 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m45, i64 %add28)
  %fst32 = extractvalue { i64, i1 } %result31, 0
  %snd33 = extractvalue { i64, i1 } %result31, 1
  br i1 %snd33, label %of29, label %normal30

of29:                                             ; preds = %normal24
  call void @overflow_fail(i32 43)
  br label %normal30

normal30:                                         ; preds = %of29, %normal24
  %add34 = phi i64 [ %fst32, %of29 ], [ %fst32, %normal24 ]
  %result37 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m34, i64 %add34)
  %fst38 = extractvalue { i64, i1 } %result37, 0
  %snd39 = extractvalue { i64, i1 } %result37, 1
  br i1 %snd39, label %of35, label %normal36

of35:                                             ; preds = %normal30
  call void @overflow_fail(i32 37)
  br label %normal36

normal36:                                         ; preds = %of35, %normal30
  %add40 = phi i64 [ %fst38, %of35 ], [ %fst38, %normal30 ]
  %result43 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m23, i64 %add40)
  %fst44 = extractvalue { i64, i1 } %result43, 0
  %snd45 = extractvalue { i64, i1 } %result43, 1
  br i1 %snd45, label %of41, label %normal42

of41:                                             ; preds = %normal36
  call void @overflow_fail(i32 31)
  br label %normal42

normal42:                                         ; preds = %of41, %normal36
  %add46 = phi i64 [ %fst44, %of41 ], [ %fst44, %normal36 ]
  %result49 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m12, i64 %add46)
  %fst50 = extractvalue { i64, i1 } %result49, 0
  %snd51 = extractvalue { i64, i1 } %result49, 1
  br i1 %snd51, label %of47, label %normal48

of47:                                             ; preds = %normal42
  call void @overflow_fail(i32 25)
  br label %normal48

normal48:                                         ; preds = %of47, %normal42
  %add52 = phi i64 [ %fst50, %of47 ], [ %fst50, %normal42 ]
  %result55 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %m01, i64 %add52)
  %fst56 = extractvalue { i64, i1 } %result55, 0
  %snd57 = extractvalue { i64, i1 } %result55, 1
  br i1 %snd57, label %of53, label %normal54

of53:                                             ; preds = %normal48
  call void @overflow_fail(i32 19)
  br label %normal54

normal54:                                         ; preds = %of53, %normal48
  %add58 = phi i64 [ %fst56, %of53 ], [ %fst56, %normal48 ]
  ret i64 %add58
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
