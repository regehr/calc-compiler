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

whileEntry:                                       ; preds = %merge, %entry
  %phiNode = phi i64 [ 0, %entry ], [ %phiNode1, %merge ]
  br i1 false, label %whileBody, label %whileExit

whileBody:                                        ; preds = %whileEntry
  br i1 true, label %then, label %else

whileExit:                                        ; preds = %whileEntry
  ret i64 %phiNode

then:                                             ; preds = %whileBody
  br label %merge

else:                                             ; preds = %whileBody
  br label %merge

merge:                                            ; preds = %else, %then
  %phiNode1 = phi i64 [ 0, %then ], [ 0, %else ]
  br label %whileEntry
}
