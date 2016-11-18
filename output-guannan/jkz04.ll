; (while false (while false 0))
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
  br i1 false, label %body, label %cont

body:                                             ; preds = %cont2, %entry
  br i1 false, label %body1, label %cont2

cont:                                             ; preds = %cont2, %entry
  %tmp3 = phi i64 [ 0, %entry ], [ %tmp, %cont2 ]
  ret i64 %tmp3

body1:                                            ; preds = %body1, %body
  br i1 false, label %body1, label %cont2

cont2:                                            ; preds = %body1, %body
  %tmp = phi i64 [ 0, %body ], [ 0, %body1 ]
  br i1 false, label %body, label %cont
}
