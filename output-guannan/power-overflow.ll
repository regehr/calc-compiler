; (seq (set a0 m0) (seq (set a1 m1) (while (!= m1 1) (seq (set (* m0 a0) m0) (seq (set (- m1 1) m1) m0)))))
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
  store i64 %0, i64* %m0
  store i64 %1, i64* %m1
  %m11 = load i64, i64* %m1
  %neq = icmp ne i64 %m11, 1
  br i1 %neq, label %body, label %cont

body:                                             ; preds = %normal5, %entry
  %m02 = load i64, i64* %m0
  %result = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %m02, i64 %0)
  %fst = extractvalue { i64, i1 } %result, 0
  %snd = extractvalue { i64, i1 } %result, 1
  br i1 %snd, label %of, label %normal

cont:                                             ; preds = %normal5, %entry
  %tmp = phi i64 [ 0, %entry ], [ %m010, %normal5 ]
  ret i64 %tmp

of:                                               ; preds = %body
  call void @overflow_fail(i32 139)
  br label %normal

normal:                                           ; preds = %of, %body
  %add = phi i64 [ %fst, %of ], [ %fst, %body ]
  store i64 %add, i64* %m0
  %m13 = load i64, i64* %m1
  %result6 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %m13, i64 1)
  %fst7 = extractvalue { i64, i1 } %result6, 0
  %snd8 = extractvalue { i64, i1 } %result6, 1
  br i1 %snd8, label %of4, label %normal5

of4:                                              ; preds = %normal
  call void @overflow_fail(i32 185)
  br label %normal5

normal5:                                          ; preds = %of4, %normal
  %add9 = phi i64 [ %fst7, %of4 ], [ %fst7, %normal ]
  store i64 %add9, i64* %m1
  %m010 = load i64, i64* %m0
  %m111 = load i64, i64* %m1
  %neq12 = icmp ne i64 %m111, 1
  br i1 %neq12, label %body, label %cont
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
