; (if (<= a0 0) 0 (if (== a0 1) a1 (if (== a0 2) (/ (+ a1 a2) 2) (if (== a0 3) (/ (+ a1 (+ a2 a3)) 3) (if (== a0 4) (/ (+ (+ a1 a2) (+ a3 a4)) 4) (/ (+ (+ (+ a1 a2) (+ a3 a4)) a5) 5))))))
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
  br label %ifcont75

else:                                             ; preds = %entry
  %eq = icmp eq i64 %0, 1
  br i1 %eq, label %then1, label %else2

then1:                                            ; preds = %else
  br label %ifcont73

else2:                                            ; preds = %else
  %eq3 = icmp eq i64 %0, 2
  br i1 %eq3, label %then4, label %else5

then4:                                            ; preds = %else2
  %result = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %fst = extractvalue { i64, i1 } %result, 0
  %snd = extractvalue { i64, i1 } %result, 1
  br i1 %snd, label %of, label %normal

of:                                               ; preds = %then4
  call void @overflow_fail(i32 114)
  br label %normal

normal:                                           ; preds = %of, %then4
  %add = phi i64 [ %fst, %of ], [ %fst, %then4 ]
  %sdiv = sdiv i64 %add, 2
  br label %ifcont71

else5:                                            ; preds = %else2
  %eq6 = icmp eq i64 %0, 3
  br i1 %eq6, label %then7, label %else21

then7:                                            ; preds = %else5
  %result10 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %2, i64 %3)
  %fst11 = extractvalue { i64, i1 } %result10, 0
  %snd12 = extractvalue { i64, i1 } %result10, 1
  br i1 %snd12, label %of8, label %normal9

of8:                                              ; preds = %then7
  call void @overflow_fail(i32 178)
  br label %normal9

normal9:                                          ; preds = %of8, %then7
  %add13 = phi i64 [ %fst11, %of8 ], [ %fst11, %then7 ]
  %result16 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %add13)
  %fst17 = extractvalue { i64, i1 } %result16, 0
  %snd18 = extractvalue { i64, i1 } %result16, 1
  br i1 %snd18, label %of14, label %normal15

of14:                                             ; preds = %normal9
  call void @overflow_fail(i32 172)
  br label %normal15

normal15:                                         ; preds = %of14, %normal9
  %add19 = phi i64 [ %fst17, %of14 ], [ %fst17, %normal9 ]
  %sdiv20 = sdiv i64 %add19, 3
  br label %ifcont69

else21:                                           ; preds = %else5
  %eq22 = icmp eq i64 %0, 4
  br i1 %eq22, label %then23, label %else43

then23:                                           ; preds = %else21
  %result26 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %fst27 = extractvalue { i64, i1 } %result26, 0
  %snd28 = extractvalue { i64, i1 } %result26, 1
  br i1 %snd28, label %of24, label %normal25

of24:                                             ; preds = %then23
  call void @overflow_fail(i32 248)
  br label %normal25

normal25:                                         ; preds = %of24, %then23
  %add29 = phi i64 [ %fst27, %of24 ], [ %fst27, %then23 ]
  %result32 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %4)
  %fst33 = extractvalue { i64, i1 } %result32, 0
  %snd34 = extractvalue { i64, i1 } %result32, 1
  br i1 %snd34, label %of30, label %normal31

of30:                                             ; preds = %normal25
  call void @overflow_fail(i32 258)
  br label %normal31

normal31:                                         ; preds = %of30, %normal25
  %add35 = phi i64 [ %fst33, %of30 ], [ %fst33, %normal25 ]
  %result38 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %add29, i64 %add35)
  %fst39 = extractvalue { i64, i1 } %result38, 0
  %snd40 = extractvalue { i64, i1 } %result38, 1
  br i1 %snd40, label %of36, label %normal37

of36:                                             ; preds = %normal31
  call void @overflow_fail(i32 245)
  br label %normal37

normal37:                                         ; preds = %of36, %normal31
  %add41 = phi i64 [ %fst39, %of36 ], [ %fst39, %normal31 ]
  %sdiv42 = sdiv i64 %add41, 4
  br label %ifcont

else43:                                           ; preds = %else21
  %result46 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %fst47 = extractvalue { i64, i1 } %result46, 0
  %snd48 = extractvalue { i64, i1 } %result46, 1
  br i1 %snd48, label %of44, label %normal45

of44:                                             ; preds = %else43
  call void @overflow_fail(i32 301)
  br label %normal45

normal45:                                         ; preds = %of44, %else43
  %add49 = phi i64 [ %fst47, %of44 ], [ %fst47, %else43 ]
  %result52 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %4)
  %fst53 = extractvalue { i64, i1 } %result52, 0
  %snd54 = extractvalue { i64, i1 } %result52, 1
  br i1 %snd54, label %of50, label %normal51

of50:                                             ; preds = %normal45
  call void @overflow_fail(i32 311)
  br label %normal51

normal51:                                         ; preds = %of50, %normal45
  %add55 = phi i64 [ %fst53, %of50 ], [ %fst53, %normal45 ]
  %result58 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %add49, i64 %add55)
  %fst59 = extractvalue { i64, i1 } %result58, 0
  %snd60 = extractvalue { i64, i1 } %result58, 1
  br i1 %snd60, label %of56, label %normal57

of56:                                             ; preds = %normal51
  call void @overflow_fail(i32 298)
  br label %normal57

normal57:                                         ; preds = %of56, %normal51
  %add61 = phi i64 [ %fst59, %of56 ], [ %fst59, %normal51 ]
  %result64 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %add61, i64 %5)
  %fst65 = extractvalue { i64, i1 } %result64, 0
  %snd66 = extractvalue { i64, i1 } %result64, 1
  br i1 %snd66, label %of62, label %normal63

of62:                                             ; preds = %normal57
  call void @overflow_fail(i32 295)
  br label %normal63

normal63:                                         ; preds = %of62, %normal57
  %add67 = phi i64 [ %fst65, %of62 ], [ %fst65, %normal57 ]
  %sdiv68 = sdiv i64 %add67, 5
  br label %ifcont

ifcont:                                           ; preds = %normal63, %normal37
  %iftmp = phi i64 [ %sdiv42, %normal37 ], [ %sdiv68, %normal63 ]
  br label %ifcont69

ifcont69:                                         ; preds = %ifcont, %normal15
  %iftmp70 = phi i64 [ %sdiv20, %normal15 ], [ %iftmp, %ifcont ]
  br label %ifcont71

ifcont71:                                         ; preds = %ifcont69, %normal
  %iftmp72 = phi i64 [ %sdiv, %normal ], [ %iftmp70, %ifcont69 ]
  br label %ifcont73

ifcont73:                                         ; preds = %ifcont71, %then1
  %iftmp74 = phi i64 [ %1, %then1 ], [ %iftmp72, %ifcont71 ]
  br label %ifcont75

ifcont75:                                         ; preds = %ifcont73, %then
  %iftmp76 = phi i64 [ 0, %then ], [ %iftmp74, %ifcont73 ]
  ret i64 %iftmp76
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
