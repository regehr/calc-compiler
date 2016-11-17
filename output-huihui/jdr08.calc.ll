; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5) {
entry:
  %multmp = mul i64 4, 4
  %multmp1 = mul i64 4, 4
  %multmp2 = mul i64 %multmp1, 4
  %multmp3 = mul i64 %multmp, %multmp2
  %multmp4 = mul i64 %multmp3, 4
  ret i64 %multmp4
}
