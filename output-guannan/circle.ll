; (* 31415926 (* a1 a1))
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
  %result = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %1, i64 %1)
  %fst = extractvalue { i64, i1 } %result, 0
  %snd = extractvalue { i64, i1 } %result, 1
  br i1 %snd, label %of, label %normal

of:                                               ; preds = %entry
  call void @overflow_fail(i32 43)
  br label %normal

normal:                                           ; preds = %of, %entry
  %add = phi i64 [ %fst, %of ], [ %fst, %entry ]
  %result3 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 31415926, i64 %add)
  %fst4 = extractvalue { i64, i1 } %result3, 0
  %snd5 = extractvalue { i64, i1 } %result3, 1
  br i1 %snd5, label %of1, label %normal2

of1:                                              ; preds = %normal
  call void @overflow_fail(i32 31)
  br label %normal2

normal2:                                          ; preds = %of1, %normal
  %add6 = phi i64 [ %fst4, %of1 ], [ %fst4, %normal ]
  ret i64 %add6
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
