; (seq (set a0 m0) (seq (set a1 m1) (seq (while (!= m1 0) (seq (set m1 m2) (seq (set (% m0 m1) m1) (set m2 m0)))) m0)))
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
  %neq = icmp ne i64 %m11, 0
  br i1 %neq, label %body, label %cont

body:                                             ; preds = %body, %entry
  %m12 = load i64, i64* %m1
  store i64 %m12, i64* %m2
  %m03 = load i64, i64* %m0
  %m14 = load i64, i64* %m1
  %srem = srem i64 %m03, %m14
  store i64 %srem, i64* %m1
  %m25 = load i64, i64* %m2
  store i64 %m25, i64* %m0
  %m16 = load i64, i64* %m1
  %neq7 = icmp ne i64 %m16, 0
  br i1 %neq7, label %body, label %cont

cont:                                             ; preds = %body, %entry
  %tmp = phi i64 [ 0, %entry ], [ %m25, %body ]
  %m08 = load i64, i64* %m0
  ret i64 %m08
}
