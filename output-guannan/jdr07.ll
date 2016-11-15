; (* (* 1 (* (* 1 1) 1)) 1)
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
  %result = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 1, i64 1)
  %fst = extractvalue { i64, i1 } %result, 0
  %snd = extractvalue { i64, i1 } %result, 1
  br i1 %snd, label %of, label %normal

of:                                               ; preds = %entry
  call void @overflow_fail(i32 30)
  br label %normal

normal:                                           ; preds = %of, %entry
  %add = phi i64 [ %fst, %of ], [ %fst, %entry ]
  %result3 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %add, i64 1)
  %fst4 = extractvalue { i64, i1 } %result3, 0
  %snd5 = extractvalue { i64, i1 } %result3, 1
  br i1 %snd5, label %of1, label %normal2

of1:                                              ; preds = %normal
  call void @overflow_fail(i32 27)
  br label %normal2

normal2:                                          ; preds = %of1, %normal
  %add6 = phi i64 [ %fst4, %of1 ], [ %fst4, %normal ]
  %result9 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 1, i64 %add6)
  %fst10 = extractvalue { i64, i1 } %result9, 0
  %snd11 = extractvalue { i64, i1 } %result9, 1
  br i1 %snd11, label %of7, label %normal8

of7:                                              ; preds = %normal2
  call void @overflow_fail(i32 22)
  br label %normal8

normal8:                                          ; preds = %of7, %normal2
  %add12 = phi i64 [ %fst10, %of7 ], [ %fst10, %normal2 ]
  %result15 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %add12, i64 1)
  %fst16 = extractvalue { i64, i1 } %result15, 0
  %snd17 = extractvalue { i64, i1 } %result15, 1
  br i1 %snd17, label %of13, label %normal14

of13:                                             ; preds = %normal8
  call void @overflow_fail(i32 19)
  br label %normal14

normal14:                                         ; preds = %of13, %normal8
  %add18 = phi i64 [ %fst16, %of13 ], [ %fst16, %normal8 ]
  ret i64 %add18
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
