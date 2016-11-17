; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5) {
entry:
  %addtmp = add i64 1, 1
  %addtmp1 = add i64 %addtmp, 1
  %addtmp2 = add i64 1, %addtmp1
  %addtmp3 = add i64 %addtmp2, 1
  ret i64 %addtmp3
}
