; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64)

declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64)

declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64)

declare void @overflow_fail(i64)

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %6 = alloca i64
  store i64 0, i64* %6
  %7 = alloca i64
  store i64 0, i64* %7
  %8 = alloca i64
  store i64 0, i64* %8
  %9 = alloca i64
  store i64 0, i64* %9
  %10 = alloca i64
  store i64 0, i64* %10
  %11 = alloca i64
  store i64 0, i64* %11
  %12 = alloca i64
  store i64 0, i64* %12
  %13 = alloca i64
  store i64 0, i64* %13
  %14 = alloca i64
  store i64 0, i64* %14
  %15 = alloca i64
  store i64 0, i64* %15
  %16 = load i64, i64* %6
  %"==" = icmp eq i64 %16, 0
  br i1 %"==", label %true, label %false43

true:                                             ; preds = %entry
  %17 = load i64, i64* %7
  %"==1" = icmp eq i64 %17, 0
  br i1 %"==1", label %true2, label %false40

true2:                                            ; preds = %true
  %18 = load i64, i64* %8
  %"==3" = icmp eq i64 %18, 0
  br i1 %"==3", label %true4, label %false37

true4:                                            ; preds = %true2
  %19 = load i64, i64* %9
  %"==5" = icmp eq i64 %19, 0
  br i1 %"==5", label %true6, label %false34

true6:                                            ; preds = %true4
  %20 = load i64, i64* %10
  %"==7" = icmp eq i64 %20, 0
  br i1 %"==7", label %true8, label %false31

true8:                                            ; preds = %true6
  %21 = load i64, i64* %11
  %"==9" = icmp eq i64 %21, 0
  br i1 %"==9", label %true10, label %false28

true10:                                           ; preds = %true8
  %22 = load i64, i64* %12
  %"==11" = icmp eq i64 %22, 0
  br i1 %"==11", label %true12, label %false25

true12:                                           ; preds = %true10
  %23 = load i64, i64* %13
  %"==13" = icmp eq i64 %23, 0
  br i1 %"==13", label %true14, label %false22

true14:                                           ; preds = %true12
  %24 = load i64, i64* %14
  %"==15" = icmp eq i64 %24, 0
  br i1 %"==15", label %true16, label %false19

true16:                                           ; preds = %true14
  %25 = load i64, i64* %15
  %"==17" = icmp eq i64 %25, 0
  br i1 %"==17", label %true18, label %false

true18:                                           ; preds = %true16
  br label %merge

false:                                            ; preds = %true16
  br label %merge

merge:                                            ; preds = %false, %true18
  %ifret = phi i64 [ 1, %true18 ], [ 0, %false ]
  br label %merge20

false19:                                          ; preds = %true14
  br label %merge20

merge20:                                          ; preds = %false19, %merge
  %ifret21 = phi i64 [ %ifret, %merge ], [ 0, %false19 ]
  br label %merge23

false22:                                          ; preds = %true12
  br label %merge23

merge23:                                          ; preds = %false22, %merge20
  %ifret24 = phi i64 [ %ifret21, %merge20 ], [ 0, %false22 ]
  br label %merge26

false25:                                          ; preds = %true10
  br label %merge26

merge26:                                          ; preds = %false25, %merge23
  %ifret27 = phi i64 [ %ifret24, %merge23 ], [ 0, %false25 ]
  br label %merge29

false28:                                          ; preds = %true8
  br label %merge29

merge29:                                          ; preds = %false28, %merge26
  %ifret30 = phi i64 [ %ifret27, %merge26 ], [ 0, %false28 ]
  br label %merge32

false31:                                          ; preds = %true6
  br label %merge32

merge32:                                          ; preds = %false31, %merge29
  %ifret33 = phi i64 [ %ifret30, %merge29 ], [ 0, %false31 ]
  br label %merge35

false34:                                          ; preds = %true4
  br label %merge35

merge35:                                          ; preds = %false34, %merge32
  %ifret36 = phi i64 [ %ifret33, %merge32 ], [ 0, %false34 ]
  br label %merge38

false37:                                          ; preds = %true2
  br label %merge38

merge38:                                          ; preds = %false37, %merge35
  %ifret39 = phi i64 [ %ifret36, %merge35 ], [ 0, %false37 ]
  br label %merge41

false40:                                          ; preds = %true
  br label %merge41

merge41:                                          ; preds = %false40, %merge38
  %ifret42 = phi i64 [ %ifret39, %merge38 ], [ 0, %false40 ]
  br label %merge44

false43:                                          ; preds = %entry
  br label %merge44

merge44:                                          ; preds = %false43, %merge41
  %ifret45 = phi i64 [ %ifret42, %merge41 ], [ 0, %false43 ]
  ret i64 %ifret45
}
