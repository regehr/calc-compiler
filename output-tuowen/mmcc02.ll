; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

declare void @overflow_fail(i64)

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %6 = icmp eq i64 0, 0
  br i1 %6, label %thenIf, label %elseIf

thenIf:                                           ; preds = %entry
  %7 = icmp eq i64 0, 0
  br i1 %7, label %thenIf1, label %elseIf2

elseIf:                                           ; preds = %entry
  br label %afterIf

afterIf:                                          ; preds = %elseIf, %afterIf3
  %8 = phi i64 [ %10, %afterIf3 ], [ 0, %elseIf ]
  ret i64 %8

thenIf1:                                          ; preds = %thenIf
  %9 = icmp eq i64 0, 0
  br i1 %9, label %thenIf4, label %elseIf5

elseIf2:                                          ; preds = %thenIf
  br label %afterIf3

afterIf3:                                         ; preds = %elseIf2, %afterIf6
  %10 = phi i64 [ %12, %afterIf6 ], [ 0, %elseIf2 ]
  br label %afterIf

thenIf4:                                          ; preds = %thenIf1
  %11 = icmp eq i64 0, 0
  br i1 %11, label %thenIf7, label %elseIf8

elseIf5:                                          ; preds = %thenIf1
  br label %afterIf6

afterIf6:                                         ; preds = %elseIf5, %afterIf9
  %12 = phi i64 [ %14, %afterIf9 ], [ 0, %elseIf5 ]
  br label %afterIf3

thenIf7:                                          ; preds = %thenIf4
  %13 = icmp eq i64 0, 0
  br i1 %13, label %thenIf10, label %elseIf11

elseIf8:                                          ; preds = %thenIf4
  br label %afterIf9

afterIf9:                                         ; preds = %elseIf8, %afterIf12
  %14 = phi i64 [ %16, %afterIf12 ], [ 0, %elseIf8 ]
  br label %afterIf6

thenIf10:                                         ; preds = %thenIf7
  %15 = icmp eq i64 0, 0
  br i1 %15, label %thenIf13, label %elseIf14

elseIf11:                                         ; preds = %thenIf7
  br label %afterIf12

afterIf12:                                        ; preds = %elseIf11, %afterIf15
  %16 = phi i64 [ %18, %afterIf15 ], [ 0, %elseIf11 ]
  br label %afterIf9

thenIf13:                                         ; preds = %thenIf10
  %17 = icmp eq i64 0, 0
  br i1 %17, label %thenIf16, label %elseIf17

elseIf14:                                         ; preds = %thenIf10
  br label %afterIf15

afterIf15:                                        ; preds = %elseIf14, %afterIf18
  %18 = phi i64 [ %20, %afterIf18 ], [ 0, %elseIf14 ]
  br label %afterIf12

thenIf16:                                         ; preds = %thenIf13
  %19 = icmp eq i64 0, 0
  br i1 %19, label %thenIf19, label %elseIf20

elseIf17:                                         ; preds = %thenIf13
  br label %afterIf18

afterIf18:                                        ; preds = %elseIf17, %afterIf21
  %20 = phi i64 [ %22, %afterIf21 ], [ 0, %elseIf17 ]
  br label %afterIf15

thenIf19:                                         ; preds = %thenIf16
  %21 = icmp eq i64 0, 0
  br i1 %21, label %thenIf22, label %elseIf23

elseIf20:                                         ; preds = %thenIf16
  br label %afterIf21

afterIf21:                                        ; preds = %elseIf20, %afterIf24
  %22 = phi i64 [ %24, %afterIf24 ], [ 0, %elseIf20 ]
  br label %afterIf18

thenIf22:                                         ; preds = %thenIf19
  %23 = icmp eq i64 0, 0
  br i1 %23, label %thenIf25, label %elseIf26

elseIf23:                                         ; preds = %thenIf19
  br label %afterIf24

afterIf24:                                        ; preds = %elseIf23, %afterIf27
  %24 = phi i64 [ %25, %afterIf27 ], [ 0, %elseIf23 ]
  br label %afterIf21

thenIf25:                                         ; preds = %thenIf22
  br label %afterIf27

elseIf26:                                         ; preds = %thenIf22
  br label %afterIf27

afterIf27:                                        ; preds = %elseIf26, %thenIf25
  %25 = phi i64 [ 1, %thenIf25 ], [ 0, %elseIf26 ]
  br label %afterIf24
}

attributes #0 = { nounwind readnone }
