; (if (== m0 0) (if (== m1 0) (if (== m2 0) (if (== m3 0) (if (== m4 0) (if (== m5 0) (if (== m6 0) (if (== m7 0) (if (== m8 0) (if (== m9 0) 1 0) 0) 0) 0) 0) 0) 0) 0) 0) 0)
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
  %eq = icmp eq i64 %m01, 0
  br i1 %eq, label %then, label %else53

then:                                             ; preds = %entry
  %m12 = load i64, i64* %m1
  %eq3 = icmp eq i64 %m12, 0
  br i1 %eq3, label %then4, label %else50

then4:                                            ; preds = %then
  %m25 = load i64, i64* %m2
  %eq6 = icmp eq i64 %m25, 0
  br i1 %eq6, label %then7, label %else47

then7:                                            ; preds = %then4
  %m38 = load i64, i64* %m3
  %eq9 = icmp eq i64 %m38, 0
  br i1 %eq9, label %then10, label %else44

then10:                                           ; preds = %then7
  %m411 = load i64, i64* %m4
  %eq12 = icmp eq i64 %m411, 0
  br i1 %eq12, label %then13, label %else41

then13:                                           ; preds = %then10
  %m514 = load i64, i64* %m5
  %eq15 = icmp eq i64 %m514, 0
  br i1 %eq15, label %then16, label %else38

then16:                                           ; preds = %then13
  %m617 = load i64, i64* %m6
  %eq18 = icmp eq i64 %m617, 0
  br i1 %eq18, label %then19, label %else35

then19:                                           ; preds = %then16
  %m720 = load i64, i64* %m7
  %eq21 = icmp eq i64 %m720, 0
  br i1 %eq21, label %then22, label %else32

then22:                                           ; preds = %then19
  %m823 = load i64, i64* %m8
  %eq24 = icmp eq i64 %m823, 0
  br i1 %eq24, label %then25, label %else29

then25:                                           ; preds = %then22
  %m926 = load i64, i64* %m9
  %eq27 = icmp eq i64 %m926, 0
  br i1 %eq27, label %then28, label %else

then28:                                           ; preds = %then25
  br label %ifcont

else:                                             ; preds = %then25
  br label %ifcont

ifcont:                                           ; preds = %else, %then28
  %iftmp = phi i64 [ 1, %then28 ], [ 0, %else ]
  br label %ifcont30

else29:                                           ; preds = %then22
  br label %ifcont30

ifcont30:                                         ; preds = %else29, %ifcont
  %iftmp31 = phi i64 [ %iftmp, %ifcont ], [ 0, %else29 ]
  br label %ifcont33

else32:                                           ; preds = %then19
  br label %ifcont33

ifcont33:                                         ; preds = %else32, %ifcont30
  %iftmp34 = phi i64 [ %iftmp31, %ifcont30 ], [ 0, %else32 ]
  br label %ifcont36

else35:                                           ; preds = %then16
  br label %ifcont36

ifcont36:                                         ; preds = %else35, %ifcont33
  %iftmp37 = phi i64 [ %iftmp34, %ifcont33 ], [ 0, %else35 ]
  br label %ifcont39

else38:                                           ; preds = %then13
  br label %ifcont39

ifcont39:                                         ; preds = %else38, %ifcont36
  %iftmp40 = phi i64 [ %iftmp37, %ifcont36 ], [ 0, %else38 ]
  br label %ifcont42

else41:                                           ; preds = %then10
  br label %ifcont42

ifcont42:                                         ; preds = %else41, %ifcont39
  %iftmp43 = phi i64 [ %iftmp40, %ifcont39 ], [ 0, %else41 ]
  br label %ifcont45

else44:                                           ; preds = %then7
  br label %ifcont45

ifcont45:                                         ; preds = %else44, %ifcont42
  %iftmp46 = phi i64 [ %iftmp43, %ifcont42 ], [ 0, %else44 ]
  br label %ifcont48

else47:                                           ; preds = %then4
  br label %ifcont48

ifcont48:                                         ; preds = %else47, %ifcont45
  %iftmp49 = phi i64 [ %iftmp46, %ifcont45 ], [ 0, %else47 ]
  br label %ifcont51

else50:                                           ; preds = %then
  br label %ifcont51

ifcont51:                                         ; preds = %else50, %ifcont48
  %iftmp52 = phi i64 [ %iftmp49, %ifcont48 ], [ 0, %else50 ]
  br label %ifcont54

else53:                                           ; preds = %entry
  br label %ifcont54

ifcont54:                                         ; preds = %else53, %ifcont51
  %iftmp55 = phi i64 [ %iftmp52, %ifcont51 ], [ 0, %else53 ]
  ret i64 %iftmp55
}
