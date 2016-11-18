target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %Mutable0 = alloca i64
  store i64 0, i64* %Mutable0
  %Mutable1 = alloca i64
  store i64 0, i64* %Mutable1
  %Mutable2 = alloca i64
  store i64 0, i64* %Mutable2
  %Mutable3 = alloca i64
  store i64 0, i64* %Mutable3
  %Mutable4 = alloca i64
  store i64 0, i64* %Mutable4
  %Mutable5 = alloca i64
  store i64 0, i64* %Mutable5
  %Mutable6 = alloca i64
  store i64 0, i64* %Mutable6
  %Mutable7 = alloca i64
  store i64 0, i64* %Mutable7
  %Mutable8 = alloca i64
  store i64 0, i64* %Mutable8
  %Mutable9 = alloca i64
  store i64 0, i64* %Mutable9
  %6 = load i64, i64* %Mutable0
  %eq = icmp eq i64 %6, 0
  br i1 %eq, label %then, label %else43

then:                                             ; preds = %entry
  %7 = load i64, i64* %Mutable1
  %eq1 = icmp eq i64 %7, 0
  br i1 %eq1, label %then2, label %else40

then2:                                            ; preds = %then
  %8 = load i64, i64* %Mutable2
  %eq3 = icmp eq i64 %8, 0
  br i1 %eq3, label %then4, label %else37

then4:                                            ; preds = %then2
  %9 = load i64, i64* %Mutable3
  %eq5 = icmp eq i64 %9, 0
  br i1 %eq5, label %then6, label %else34

then6:                                            ; preds = %then4
  %10 = load i64, i64* %Mutable4
  %eq7 = icmp eq i64 %10, 0
  br i1 %eq7, label %then8, label %else31

then8:                                            ; preds = %then6
  %11 = load i64, i64* %Mutable5
  %eq9 = icmp eq i64 %11, 0
  br i1 %eq9, label %then10, label %else28

then10:                                           ; preds = %then8
  %12 = load i64, i64* %Mutable6
  %eq11 = icmp eq i64 %12, 0
  br i1 %eq11, label %then12, label %else25

then12:                                           ; preds = %then10
  %13 = load i64, i64* %Mutable7
  %eq13 = icmp eq i64 %13, 0
  br i1 %eq13, label %then14, label %else22

then14:                                           ; preds = %then12
  %14 = load i64, i64* %Mutable8
  %eq15 = icmp eq i64 %14, 0
  br i1 %eq15, label %then16, label %else19

then16:                                           ; preds = %then14
  %15 = load i64, i64* %Mutable9
  %eq17 = icmp eq i64 %15, 0
  br i1 %eq17, label %then18, label %else

then18:                                           ; preds = %then16
  br label %merge

else:                                             ; preds = %then16
  br label %merge

merge:                                            ; preds = %else, %then18
  %phiNode = phi i64 [ 1, %then18 ], [ 0, %else ]
  br label %merge20

else19:                                           ; preds = %then14
  br label %merge20

merge20:                                          ; preds = %else19, %merge
  %phiNode21 = phi i64 [ %phiNode, %merge ], [ 0, %else19 ]
  br label %merge23

else22:                                           ; preds = %then12
  br label %merge23

merge23:                                          ; preds = %else22, %merge20
  %phiNode24 = phi i64 [ %phiNode21, %merge20 ], [ 0, %else22 ]
  br label %merge26

else25:                                           ; preds = %then10
  br label %merge26

merge26:                                          ; preds = %else25, %merge23
  %phiNode27 = phi i64 [ %phiNode24, %merge23 ], [ 0, %else25 ]
  br label %merge29

else28:                                           ; preds = %then8
  br label %merge29

merge29:                                          ; preds = %else28, %merge26
  %phiNode30 = phi i64 [ %phiNode27, %merge26 ], [ 0, %else28 ]
  br label %merge32

else31:                                           ; preds = %then6
  br label %merge32

merge32:                                          ; preds = %else31, %merge29
  %phiNode33 = phi i64 [ %phiNode30, %merge29 ], [ 0, %else31 ]
  br label %merge35

else34:                                           ; preds = %then4
  br label %merge35

merge35:                                          ; preds = %else34, %merge32
  %phiNode36 = phi i64 [ %phiNode33, %merge32 ], [ 0, %else34 ]
  br label %merge38

else37:                                           ; preds = %then2
  br label %merge38

merge38:                                          ; preds = %else37, %merge35
  %phiNode39 = phi i64 [ %phiNode36, %merge35 ], [ 0, %else37 ]
  br label %merge41

else40:                                           ; preds = %then
  br label %merge41

merge41:                                          ; preds = %else40, %merge38
  %phiNode42 = phi i64 [ %phiNode39, %merge38 ], [ 0, %else40 ]
  br label %merge44

else43:                                           ; preds = %entry
  br label %merge44

merge44:                                          ; preds = %else43, %merge41
  %phiNode45 = phi i64 [ %phiNode42, %merge41 ], [ 0, %else43 ]
  ret i64 %phiNode45
}
