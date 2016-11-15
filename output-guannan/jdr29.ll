; (if (> a3 a4) (+ (if (> 1 2) 3 5) a2) (* a4 a5))
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
  %gt = icmp sgt i64 %3, %4
  br i1 %gt, label %then, label %else3

then:                                             ; preds = %entry
  %gt1 = icmp sgt i64 1, 2
  br i1 %gt1, label %then2, label %else

then2:                                            ; preds = %then
  br label %ifcont

else:                                             ; preds = %then
  br label %ifcont

ifcont:                                           ; preds = %else, %then2
  %iftmp = phi i64 [ 3, %then2 ], [ 5, %else ]
  %result = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %iftmp, i64 %2)
  %fst = extractvalue { i64, i1 } %result, 0
  %snd = extractvalue { i64, i1 } %result, 1
  br i1 %snd, label %of, label %normal

of:                                               ; preds = %ifcont
  call void @overflow_fail(i32 69)
  br label %normal

normal:                                           ; preds = %of, %ifcont
  %add = phi i64 [ %fst, %of ], [ %fst, %ifcont ]
  br label %ifcont10

else3:                                            ; preds = %entry
  %result6 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %4, i64 %5)
  %fst7 = extractvalue { i64, i1 } %result6, 0
  %snd8 = extractvalue { i64, i1 } %result6, 1
  br i1 %snd8, label %of4, label %normal5

of4:                                              ; preds = %else3
  call void @overflow_fail(i32 93)
  br label %normal5

normal5:                                          ; preds = %of4, %else3
  %add9 = phi i64 [ %fst7, %of4 ], [ %fst7, %else3 ]
  br label %ifcont10

ifcont10:                                         ; preds = %normal5, %normal
  %iftmp11 = phi i64 [ %add, %normal ], [ %add9, %normal5 ]
  ret i64 %iftmp11
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
