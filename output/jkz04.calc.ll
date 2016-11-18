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
  br label %whileEntry

whileEntry:                                       ; preds = %whileExit3, %entry
  %phiNode = phi i64 [ 0, %entry ], [ %phiNode4, %whileExit3 ]
  br i1 false, label %whileBody, label %whileExit

whileBody:                                        ; preds = %whileEntry
  br label %whileEntry1

whileExit:                                        ; preds = %whileEntry
  ret i64 %phiNode

whileEntry1:                                      ; preds = %whileBody2, %whileBody
  %phiNode4 = phi i64 [ 0, %whileBody ], [ 0, %whileBody2 ]
  br i1 false, label %whileBody2, label %whileExit3

whileBody2:                                       ; preds = %whileEntry1
  br label %whileEntry1

whileExit3:                                       ; preds = %whileEntry1
  br label %whileEntry
}
