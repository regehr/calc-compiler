; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5) {
entry:
  %tmp = icmp eq i64 1, 1
  br i1 %tmp, label %cond_true, label %return

cond_true:                                        ; preds = %entry
  ret i64 %a1

return:                                           ; preds = %entry
  ret i64 %a2
}
