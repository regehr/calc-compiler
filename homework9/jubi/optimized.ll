; For jdr29.calc
define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {
entry:
  %">" = icmp sgt i64 %3, %4
  br i1 %">", label %true, label %false3

true:                                             ; preds = %entry
  %6 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %2, i64 5)
  %7 = extractvalue { i64, i1 } %6, 1
  %8 = extractvalue { i64, i1 } %6, 0
  br i1 %7, label %error, label %merge6

error:                                            ; preds = %true
  tail call void @overflow_fail(i64 69)
  ret i64 0

false3:                                           ; preds = %entry
  %9 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %4, i64 %5)
  %10 = extractvalue { i64, i1 } %9, 1
  %11 = extractvalue { i64, i1 } %9, 0
  br i1 %10, label %error4, label %merge6

error4:                                           ; preds = %false3
  tail call void @overflow_fail(i64 93)
  ret i64 0

merge6:                                           ; preds = %false3, %true
  %ifret7 = phi i64 [ %8, %true ], [ %11, %false3 ]
  ret i64 %ifret7
}
