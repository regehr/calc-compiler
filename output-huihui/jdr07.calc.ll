; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5) {
entry:
  %multmp = mul i64 1, 1
  %multmp1 = mul i64 %multmp, 1
  %multmp2 = mul i64 1, %multmp1
  %multmp3 = mul i64 %multmp2, 1
  ret i64 %multmp3
}
