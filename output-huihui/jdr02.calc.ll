; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5) {
entry:
  %addtmp = add i64 1000, 1000000
  ret i64 %addtmp
}
