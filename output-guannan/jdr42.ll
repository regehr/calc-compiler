; (seq (while (!= m0 a0) (seq (while (!= m1 a0) (seq (set (+ (if (== (* m1 m1) (+ (* m0 (* m0 m0)) 16)) 1 0) m2) m2) (set (+ 1 m1) m1))) (seq (set (+ 1 m0) m0) (set 0 m1)))) m2)
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

body:                                             ; preds = %normal47, %entry
  %m14 = load i64, i64* %m1
  %neq5 = icmp ne i64 %m14, %0
  br i1 %neq5, label %body2, label %cont3

cont:                                             ; preds = %normal47, %entry
  %tmp54 = phi i64 [ 0, %entry ], [ 0, %normal47 ]
  %m255 = load i64, i64* %m2
  ret i64 %m255

body2:                                            ; preds = %normal38, %body
  %m16 = load i64, i64* %m1
  %m17 = load i64, i64* %m1
  %result = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %m16, i64 %m17)
  %fst = extractvalue { i64, i1 } %result, 0
  %snd = extractvalue { i64, i1 } %result, 1
  br i1 %snd, label %of, label %normal

cont3:                                            ; preds = %normal38, %body
  %tmp = phi i64 [ 0, %body ], [ %add42, %normal38 ]
  %m045 = load i64, i64* %m0
  %result48 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %m045)
  %fst49 = extractvalue { i64, i1 } %result48, 0
  %snd50 = extractvalue { i64, i1 } %result48, 1
  br i1 %snd50, label %of46, label %normal47

of:                                               ; preds = %body2
  call void @overflow_fail(i32 266)
  br label %normal

normal:                                           ; preds = %of, %body2
  %add = phi i64 [ %fst, %of ], [ %fst, %body2 ]
  %m08 = load i64, i64* %m0
  %m09 = load i64, i64* %m0
  %m010 = load i64, i64* %m0
  %result13 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %m09, i64 %m010)
  %fst14 = extractvalue { i64, i1 } %result13, 0
  %snd15 = extractvalue { i64, i1 } %result13, 1
  br i1 %snd15, label %of11, label %normal12

of11:                                             ; preds = %normal
  call void @overflow_fail(i32 285)
  br label %normal12

normal12:                                         ; preds = %of11, %normal
  %add16 = phi i64 [ %fst14, %of11 ], [ %fst14, %normal ]
  %result19 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %m08, i64 %add16)
  %fst20 = extractvalue { i64, i1 } %result19, 0
  %snd21 = extractvalue { i64, i1 } %result19, 1
  br i1 %snd21, label %of17, label %normal18

of17:                                             ; preds = %normal12
  call void @overflow_fail(i32 279)
  br label %normal18

normal18:                                         ; preds = %of17, %normal12
  %add22 = phi i64 [ %fst20, %of17 ], [ %fst20, %normal12 ]
  %result25 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %add22, i64 16)
  %fst26 = extractvalue { i64, i1 } %result25, 0
  %snd27 = extractvalue { i64, i1 } %result25, 1
  br i1 %snd27, label %of23, label %normal24

of23:                                             ; preds = %normal18
  call void @overflow_fail(i32 276)
  br label %normal24

normal24:                                         ; preds = %of23, %normal18
  %add28 = phi i64 [ %fst26, %of23 ], [ %fst26, %normal18 ]
  %eq = icmp eq i64 %add, %add28
  br i1 %eq, label %then, label %else

then:                                             ; preds = %normal24
  br label %ifcont

else:                                             ; preds = %normal24
  br label %ifcont

ifcont:                                           ; preds = %else, %then
  %iftmp = phi i64 [ 1, %then ], [ 0, %else ]
  %m229 = load i64, i64* %m2
  %result32 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %iftmp, i64 %m229)
  %fst33 = extractvalue { i64, i1 } %result32, 0
  %snd34 = extractvalue { i64, i1 } %result32, 1
  br i1 %snd34, label %of30, label %normal31

of30:                                             ; preds = %ifcont
  call void @overflow_fail(i32 255)
  br label %normal31

normal31:                                         ; preds = %of30, %ifcont
  %add35 = phi i64 [ %fst33, %of30 ], [ %fst33, %ifcont ]
  store i64 %add35, i64* %m2
  %m136 = load i64, i64* %m1
  %result39 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 1, i64 %m136)
  %fst40 = extractvalue { i64, i1 } %result39, 0
  %snd41 = extractvalue { i64, i1 } %result39, 1
  br i1 %snd41, label %of37, label %normal38

of37:                                             ; preds = %normal31
  call void @overflow_fail(i32 335)
  br label %normal38

normal38:                                         ; preds = %of37, %normal31
  %add42 = phi i64 [ %fst40, %of37 ], [ %fst40, %normal31 ]
  store i64 %add42, i64* %m1
  %m143 = load i64, i64* %m1
  %neq44 = icmp ne i64 %m143, %0
  br i1 %neq44, label %body2, label %cont3

of46:                                             ; preds = %cont3
  call void @overflow_fail(i32 369)
  br label %normal47

normal47:                                         ; preds = %of46, %cont3
  %add51 = phi i64 [ %fst49, %of46 ], [ %fst49, %cont3 ]
  store i64 %add51, i64* %m0
  store i64 0, i64* %m1
  %m052 = load i64, i64* %m0
  %neq53 = icmp ne i64 %m052, %0
  br i1 %neq53, label %body, label %cont
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
