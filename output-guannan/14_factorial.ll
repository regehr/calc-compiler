; (if (== a0 1) 1 (if (== a0 2) (* 2 1) (if (== a0 3) (* 3 (* 2 1)) (if (== a0 4) (* 4 (* 3 (* 2 1))) (if (== a0 5) (* 5 (* 4 (* 3 (* 2 1)))) (if (== a0 6) (* 6 (* 5 (* 4 (* 3 (* 2 1))))) (if (== a0 7) (* 7 (* 6 (* 5 (* 4 (* 3 (* 2 1)))))) (if (== a0 8) (* 8 (* 7 (* 6 (* 5 (* 4 (* 3 (* 2 1))))))) (if (== a0 9) (* 9 (* 8 (* 7 (* 6 (* 5 (* 4 (* 3 (* 2 1)))))))) (if (== a0 10) (* 10 (* 9 (* 8 (* 7 (* 6 (* 5 (* 4 (* 3 (* 2 1))))))))) (if (== a0 11) (* 11 (* 10 (* 9 (* 8 (* 7 (* 6 (* 5 (* 4 (* 3 (* 2 1)))))))))) (if (== a0 12) (* 12 (* 11 (* 10 (* 9 (* 8 (* 7 (* 6 (* 5 (* 4 (* 3 (* 2 1))))))))))) (if (== a0 13) (* 13 (* 12 (* 11 (* 10 (* 9 (* 8 (* 7 (* 6 (* 5 (* 4 (* 3 (* 2 1)))))))))))) (if (== a0 14) (* 14 (* 13 (* 12 (* 11 (* 10 (* 9 (* 8 (* 7 (* 6 (* 5 (* 4 (* 3 (* 2 1))))))))))))) (if (== a0 15) (* 15 (* 14 (* 13 (* 12 (* 11 (* 10 (* 9 (* 8 (* 7 (* 6 (* 5 (* 4 (* 3 (* 2 1)))))))))))))) (if (== a0 16) (* 16 (* 15 (* 14 (* 13 (* 12 (* 11 (* 10 (* 9 (* 8 (* 7 (* 6 (* 5 (* 4 (* 3 (* 2 1))))))))))))))) (if (== a0 17) (* 17 (* 16 (* 15 (* 14 (* 13 (* 12 (* 11 (* 10 (* 9 (* 8 (* 7 (* 6 (* 5 (* 4 (* 3 (* 2 1)))))))))))))))) (if (== a0 18) (* 18 (* 17 (* 16 (* 15 (* 14 (* 13 (* 12 (* 11 (* 10 (* 9 (* 8 (* 7 (* 6 (* 5 (* 4 (* 3 (* 2 1))))))))))))))))) (if (== a0 19) (* 19 (* 18 (* 17 (* 16 (* 15 (* 14 (* 13 (* 12 (* 11 (* 10 (* 9 (* 8 (* 7 (* 6 (* 5 (* 4 (* 3 (* 2 1)))))))))))))))))) (if (== a0 20) (* 20 (* 19 (* 18 (* 17 (* 16 (* 15 (* 14 (* 13 (* 12 (* 11 (* 10 (* 9 (* 8 (* 7 (* 6 (* 5 (* 4 (* 3 (* 2 1))))))))))))))))))) -1))))))))))))))))))))
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
  %eq = icmp eq i64 %0, 1
  br i1 %eq, label %then, label %else

then:                                             ; preds = %entry
  br label %ifcont1228

else:                                             ; preds = %entry
  %eq1 = icmp eq i64 %0, 2
  br i1 %eq1, label %then2, label %else3

then2:                                            ; preds = %else
  %result = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst = extractvalue { i64, i1 } %result, 0
  %snd = extractvalue { i64, i1 } %result, 1
  br i1 %snd, label %of, label %normal

of:                                               ; preds = %then2
  call void @overflow_fail(i32 78)
  br label %normal

normal:                                           ; preds = %of, %then2
  %add = phi i64 [ %fst, %of ], [ %fst, %then2 ]
  br label %ifcont1226

else3:                                            ; preds = %else
  %eq4 = icmp eq i64 %0, 3
  br i1 %eq4, label %then5, label %else18

then5:                                            ; preds = %else3
  %result8 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst9 = extractvalue { i64, i1 } %result8, 0
  %snd10 = extractvalue { i64, i1 } %result8, 1
  br i1 %snd10, label %of6, label %normal7

of6:                                              ; preds = %then5
  call void @overflow_fail(i32 125)
  br label %normal7

normal7:                                          ; preds = %of6, %then5
  %add11 = phi i64 [ %fst9, %of6 ], [ %fst9, %then5 ]
  %result14 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add11)
  %fst15 = extractvalue { i64, i1 } %result14, 0
  %snd16 = extractvalue { i64, i1 } %result14, 1
  br i1 %snd16, label %of12, label %normal13

of12:                                             ; preds = %normal7
  call void @overflow_fail(i32 120)
  br label %normal13

normal13:                                         ; preds = %of12, %normal7
  %add17 = phi i64 [ %fst15, %of12 ], [ %fst15, %normal7 ]
  br label %ifcont1224

else18:                                           ; preds = %else3
  %eq19 = icmp eq i64 %0, 4
  br i1 %eq19, label %then20, label %else39

then20:                                           ; preds = %else18
  %result23 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst24 = extractvalue { i64, i1 } %result23, 0
  %snd25 = extractvalue { i64, i1 } %result23, 1
  br i1 %snd25, label %of21, label %normal22

of21:                                             ; preds = %then20
  call void @overflow_fail(i32 186)
  br label %normal22

normal22:                                         ; preds = %of21, %then20
  %add26 = phi i64 [ %fst24, %of21 ], [ %fst24, %then20 ]
  %result29 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add26)
  %fst30 = extractvalue { i64, i1 } %result29, 0
  %snd31 = extractvalue { i64, i1 } %result29, 1
  br i1 %snd31, label %of27, label %normal28

of27:                                             ; preds = %normal22
  call void @overflow_fail(i32 181)
  br label %normal28

normal28:                                         ; preds = %of27, %normal22
  %add32 = phi i64 [ %fst30, %of27 ], [ %fst30, %normal22 ]
  %result35 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add32)
  %fst36 = extractvalue { i64, i1 } %result35, 0
  %snd37 = extractvalue { i64, i1 } %result35, 1
  br i1 %snd37, label %of33, label %normal34

of33:                                             ; preds = %normal28
  call void @overflow_fail(i32 176)
  br label %normal34

normal34:                                         ; preds = %of33, %normal28
  %add38 = phi i64 [ %fst36, %of33 ], [ %fst36, %normal28 ]
  br label %ifcont1222

else39:                                           ; preds = %else18
  %eq40 = icmp eq i64 %0, 5
  br i1 %eq40, label %then41, label %else66

then41:                                           ; preds = %else39
  %result44 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst45 = extractvalue { i64, i1 } %result44, 0
  %snd46 = extractvalue { i64, i1 } %result44, 1
  br i1 %snd46, label %of42, label %normal43

of42:                                             ; preds = %then41
  call void @overflow_fail(i32 261)
  br label %normal43

normal43:                                         ; preds = %of42, %then41
  %add47 = phi i64 [ %fst45, %of42 ], [ %fst45, %then41 ]
  %result50 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add47)
  %fst51 = extractvalue { i64, i1 } %result50, 0
  %snd52 = extractvalue { i64, i1 } %result50, 1
  br i1 %snd52, label %of48, label %normal49

of48:                                             ; preds = %normal43
  call void @overflow_fail(i32 256)
  br label %normal49

normal49:                                         ; preds = %of48, %normal43
  %add53 = phi i64 [ %fst51, %of48 ], [ %fst51, %normal43 ]
  %result56 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add53)
  %fst57 = extractvalue { i64, i1 } %result56, 0
  %snd58 = extractvalue { i64, i1 } %result56, 1
  br i1 %snd58, label %of54, label %normal55

of54:                                             ; preds = %normal49
  call void @overflow_fail(i32 251)
  br label %normal55

normal55:                                         ; preds = %of54, %normal49
  %add59 = phi i64 [ %fst57, %of54 ], [ %fst57, %normal49 ]
  %result62 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %add59)
  %fst63 = extractvalue { i64, i1 } %result62, 0
  %snd64 = extractvalue { i64, i1 } %result62, 1
  br i1 %snd64, label %of60, label %normal61

of60:                                             ; preds = %normal55
  call void @overflow_fail(i32 246)
  br label %normal61

normal61:                                         ; preds = %of60, %normal55
  %add65 = phi i64 [ %fst63, %of60 ], [ %fst63, %normal55 ]
  br label %ifcont1220

else66:                                           ; preds = %else39
  %eq67 = icmp eq i64 %0, 6
  br i1 %eq67, label %then68, label %else99

then68:                                           ; preds = %else66
  %result71 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst72 = extractvalue { i64, i1 } %result71, 0
  %snd73 = extractvalue { i64, i1 } %result71, 1
  br i1 %snd73, label %of69, label %normal70

of69:                                             ; preds = %then68
  call void @overflow_fail(i32 350)
  br label %normal70

normal70:                                         ; preds = %of69, %then68
  %add74 = phi i64 [ %fst72, %of69 ], [ %fst72, %then68 ]
  %result77 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add74)
  %fst78 = extractvalue { i64, i1 } %result77, 0
  %snd79 = extractvalue { i64, i1 } %result77, 1
  br i1 %snd79, label %of75, label %normal76

of75:                                             ; preds = %normal70
  call void @overflow_fail(i32 345)
  br label %normal76

normal76:                                         ; preds = %of75, %normal70
  %add80 = phi i64 [ %fst78, %of75 ], [ %fst78, %normal70 ]
  %result83 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add80)
  %fst84 = extractvalue { i64, i1 } %result83, 0
  %snd85 = extractvalue { i64, i1 } %result83, 1
  br i1 %snd85, label %of81, label %normal82

of81:                                             ; preds = %normal76
  call void @overflow_fail(i32 340)
  br label %normal82

normal82:                                         ; preds = %of81, %normal76
  %add86 = phi i64 [ %fst84, %of81 ], [ %fst84, %normal76 ]
  %result89 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %add86)
  %fst90 = extractvalue { i64, i1 } %result89, 0
  %snd91 = extractvalue { i64, i1 } %result89, 1
  br i1 %snd91, label %of87, label %normal88

of87:                                             ; preds = %normal82
  call void @overflow_fail(i32 335)
  br label %normal88

normal88:                                         ; preds = %of87, %normal82
  %add92 = phi i64 [ %fst90, %of87 ], [ %fst90, %normal82 ]
  %result95 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %add92)
  %fst96 = extractvalue { i64, i1 } %result95, 0
  %snd97 = extractvalue { i64, i1 } %result95, 1
  br i1 %snd97, label %of93, label %normal94

of93:                                             ; preds = %normal88
  call void @overflow_fail(i32 330)
  br label %normal94

normal94:                                         ; preds = %of93, %normal88
  %add98 = phi i64 [ %fst96, %of93 ], [ %fst96, %normal88 ]
  br label %ifcont1218

else99:                                           ; preds = %else66
  %eq100 = icmp eq i64 %0, 7
  br i1 %eq100, label %then101, label %else138

then101:                                          ; preds = %else99
  %result104 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst105 = extractvalue { i64, i1 } %result104, 0
  %snd106 = extractvalue { i64, i1 } %result104, 1
  br i1 %snd106, label %of102, label %normal103

of102:                                            ; preds = %then101
  call void @overflow_fail(i32 453)
  br label %normal103

normal103:                                        ; preds = %of102, %then101
  %add107 = phi i64 [ %fst105, %of102 ], [ %fst105, %then101 ]
  %result110 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add107)
  %fst111 = extractvalue { i64, i1 } %result110, 0
  %snd112 = extractvalue { i64, i1 } %result110, 1
  br i1 %snd112, label %of108, label %normal109

of108:                                            ; preds = %normal103
  call void @overflow_fail(i32 448)
  br label %normal109

normal109:                                        ; preds = %of108, %normal103
  %add113 = phi i64 [ %fst111, %of108 ], [ %fst111, %normal103 ]
  %result116 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add113)
  %fst117 = extractvalue { i64, i1 } %result116, 0
  %snd118 = extractvalue { i64, i1 } %result116, 1
  br i1 %snd118, label %of114, label %normal115

of114:                                            ; preds = %normal109
  call void @overflow_fail(i32 443)
  br label %normal115

normal115:                                        ; preds = %of114, %normal109
  %add119 = phi i64 [ %fst117, %of114 ], [ %fst117, %normal109 ]
  %result122 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %add119)
  %fst123 = extractvalue { i64, i1 } %result122, 0
  %snd124 = extractvalue { i64, i1 } %result122, 1
  br i1 %snd124, label %of120, label %normal121

of120:                                            ; preds = %normal115
  call void @overflow_fail(i32 438)
  br label %normal121

normal121:                                        ; preds = %of120, %normal115
  %add125 = phi i64 [ %fst123, %of120 ], [ %fst123, %normal115 ]
  %result128 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %add125)
  %fst129 = extractvalue { i64, i1 } %result128, 0
  %snd130 = extractvalue { i64, i1 } %result128, 1
  br i1 %snd130, label %of126, label %normal127

of126:                                            ; preds = %normal121
  call void @overflow_fail(i32 433)
  br label %normal127

normal127:                                        ; preds = %of126, %normal121
  %add131 = phi i64 [ %fst129, %of126 ], [ %fst129, %normal121 ]
  %result134 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %add131)
  %fst135 = extractvalue { i64, i1 } %result134, 0
  %snd136 = extractvalue { i64, i1 } %result134, 1
  br i1 %snd136, label %of132, label %normal133

of132:                                            ; preds = %normal127
  call void @overflow_fail(i32 428)
  br label %normal133

normal133:                                        ; preds = %of132, %normal127
  %add137 = phi i64 [ %fst135, %of132 ], [ %fst135, %normal127 ]
  br label %ifcont1216

else138:                                          ; preds = %else99
  %eq139 = icmp eq i64 %0, 8
  br i1 %eq139, label %then140, label %else183

then140:                                          ; preds = %else138
  %result143 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst144 = extractvalue { i64, i1 } %result143, 0
  %snd145 = extractvalue { i64, i1 } %result143, 1
  br i1 %snd145, label %of141, label %normal142

of141:                                            ; preds = %then140
  call void @overflow_fail(i32 570)
  br label %normal142

normal142:                                        ; preds = %of141, %then140
  %add146 = phi i64 [ %fst144, %of141 ], [ %fst144, %then140 ]
  %result149 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add146)
  %fst150 = extractvalue { i64, i1 } %result149, 0
  %snd151 = extractvalue { i64, i1 } %result149, 1
  br i1 %snd151, label %of147, label %normal148

of147:                                            ; preds = %normal142
  call void @overflow_fail(i32 565)
  br label %normal148

normal148:                                        ; preds = %of147, %normal142
  %add152 = phi i64 [ %fst150, %of147 ], [ %fst150, %normal142 ]
  %result155 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add152)
  %fst156 = extractvalue { i64, i1 } %result155, 0
  %snd157 = extractvalue { i64, i1 } %result155, 1
  br i1 %snd157, label %of153, label %normal154

of153:                                            ; preds = %normal148
  call void @overflow_fail(i32 560)
  br label %normal154

normal154:                                        ; preds = %of153, %normal148
  %add158 = phi i64 [ %fst156, %of153 ], [ %fst156, %normal148 ]
  %result161 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %add158)
  %fst162 = extractvalue { i64, i1 } %result161, 0
  %snd163 = extractvalue { i64, i1 } %result161, 1
  br i1 %snd163, label %of159, label %normal160

of159:                                            ; preds = %normal154
  call void @overflow_fail(i32 555)
  br label %normal160

normal160:                                        ; preds = %of159, %normal154
  %add164 = phi i64 [ %fst162, %of159 ], [ %fst162, %normal154 ]
  %result167 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %add164)
  %fst168 = extractvalue { i64, i1 } %result167, 0
  %snd169 = extractvalue { i64, i1 } %result167, 1
  br i1 %snd169, label %of165, label %normal166

of165:                                            ; preds = %normal160
  call void @overflow_fail(i32 550)
  br label %normal166

normal166:                                        ; preds = %of165, %normal160
  %add170 = phi i64 [ %fst168, %of165 ], [ %fst168, %normal160 ]
  %result173 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %add170)
  %fst174 = extractvalue { i64, i1 } %result173, 0
  %snd175 = extractvalue { i64, i1 } %result173, 1
  br i1 %snd175, label %of171, label %normal172

of171:                                            ; preds = %normal166
  call void @overflow_fail(i32 545)
  br label %normal172

normal172:                                        ; preds = %of171, %normal166
  %add176 = phi i64 [ %fst174, %of171 ], [ %fst174, %normal166 ]
  %result179 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %add176)
  %fst180 = extractvalue { i64, i1 } %result179, 0
  %snd181 = extractvalue { i64, i1 } %result179, 1
  br i1 %snd181, label %of177, label %normal178

of177:                                            ; preds = %normal172
  call void @overflow_fail(i32 540)
  br label %normal178

normal178:                                        ; preds = %of177, %normal172
  %add182 = phi i64 [ %fst180, %of177 ], [ %fst180, %normal172 ]
  br label %ifcont1214

else183:                                          ; preds = %else138
  %eq184 = icmp eq i64 %0, 9
  br i1 %eq184, label %then185, label %else234

then185:                                          ; preds = %else183
  %result188 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst189 = extractvalue { i64, i1 } %result188, 0
  %snd190 = extractvalue { i64, i1 } %result188, 1
  br i1 %snd190, label %of186, label %normal187

of186:                                            ; preds = %then185
  call void @overflow_fail(i32 701)
  br label %normal187

normal187:                                        ; preds = %of186, %then185
  %add191 = phi i64 [ %fst189, %of186 ], [ %fst189, %then185 ]
  %result194 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add191)
  %fst195 = extractvalue { i64, i1 } %result194, 0
  %snd196 = extractvalue { i64, i1 } %result194, 1
  br i1 %snd196, label %of192, label %normal193

of192:                                            ; preds = %normal187
  call void @overflow_fail(i32 696)
  br label %normal193

normal193:                                        ; preds = %of192, %normal187
  %add197 = phi i64 [ %fst195, %of192 ], [ %fst195, %normal187 ]
  %result200 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add197)
  %fst201 = extractvalue { i64, i1 } %result200, 0
  %snd202 = extractvalue { i64, i1 } %result200, 1
  br i1 %snd202, label %of198, label %normal199

of198:                                            ; preds = %normal193
  call void @overflow_fail(i32 691)
  br label %normal199

normal199:                                        ; preds = %of198, %normal193
  %add203 = phi i64 [ %fst201, %of198 ], [ %fst201, %normal193 ]
  %result206 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %add203)
  %fst207 = extractvalue { i64, i1 } %result206, 0
  %snd208 = extractvalue { i64, i1 } %result206, 1
  br i1 %snd208, label %of204, label %normal205

of204:                                            ; preds = %normal199
  call void @overflow_fail(i32 686)
  br label %normal205

normal205:                                        ; preds = %of204, %normal199
  %add209 = phi i64 [ %fst207, %of204 ], [ %fst207, %normal199 ]
  %result212 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %add209)
  %fst213 = extractvalue { i64, i1 } %result212, 0
  %snd214 = extractvalue { i64, i1 } %result212, 1
  br i1 %snd214, label %of210, label %normal211

of210:                                            ; preds = %normal205
  call void @overflow_fail(i32 681)
  br label %normal211

normal211:                                        ; preds = %of210, %normal205
  %add215 = phi i64 [ %fst213, %of210 ], [ %fst213, %normal205 ]
  %result218 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %add215)
  %fst219 = extractvalue { i64, i1 } %result218, 0
  %snd220 = extractvalue { i64, i1 } %result218, 1
  br i1 %snd220, label %of216, label %normal217

of216:                                            ; preds = %normal211
  call void @overflow_fail(i32 676)
  br label %normal217

normal217:                                        ; preds = %of216, %normal211
  %add221 = phi i64 [ %fst219, %of216 ], [ %fst219, %normal211 ]
  %result224 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %add221)
  %fst225 = extractvalue { i64, i1 } %result224, 0
  %snd226 = extractvalue { i64, i1 } %result224, 1
  br i1 %snd226, label %of222, label %normal223

of222:                                            ; preds = %normal217
  call void @overflow_fail(i32 671)
  br label %normal223

normal223:                                        ; preds = %of222, %normal217
  %add227 = phi i64 [ %fst225, %of222 ], [ %fst225, %normal217 ]
  %result230 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %add227)
  %fst231 = extractvalue { i64, i1 } %result230, 0
  %snd232 = extractvalue { i64, i1 } %result230, 1
  br i1 %snd232, label %of228, label %normal229

of228:                                            ; preds = %normal223
  call void @overflow_fail(i32 666)
  br label %normal229

normal229:                                        ; preds = %of228, %normal223
  %add233 = phi i64 [ %fst231, %of228 ], [ %fst231, %normal223 ]
  br label %ifcont1212

else234:                                          ; preds = %else183
  %eq235 = icmp eq i64 %0, 10
  br i1 %eq235, label %then236, label %else291

then236:                                          ; preds = %else234
  %result239 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst240 = extractvalue { i64, i1 } %result239, 0
  %snd241 = extractvalue { i64, i1 } %result239, 1
  br i1 %snd241, label %of237, label %normal238

of237:                                            ; preds = %then236
  call void @overflow_fail(i32 848)
  br label %normal238

normal238:                                        ; preds = %of237, %then236
  %add242 = phi i64 [ %fst240, %of237 ], [ %fst240, %then236 ]
  %result245 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add242)
  %fst246 = extractvalue { i64, i1 } %result245, 0
  %snd247 = extractvalue { i64, i1 } %result245, 1
  br i1 %snd247, label %of243, label %normal244

of243:                                            ; preds = %normal238
  call void @overflow_fail(i32 843)
  br label %normal244

normal244:                                        ; preds = %of243, %normal238
  %add248 = phi i64 [ %fst246, %of243 ], [ %fst246, %normal238 ]
  %result251 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add248)
  %fst252 = extractvalue { i64, i1 } %result251, 0
  %snd253 = extractvalue { i64, i1 } %result251, 1
  br i1 %snd253, label %of249, label %normal250

of249:                                            ; preds = %normal244
  call void @overflow_fail(i32 838)
  br label %normal250

normal250:                                        ; preds = %of249, %normal244
  %add254 = phi i64 [ %fst252, %of249 ], [ %fst252, %normal244 ]
  %result257 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %add254)
  %fst258 = extractvalue { i64, i1 } %result257, 0
  %snd259 = extractvalue { i64, i1 } %result257, 1
  br i1 %snd259, label %of255, label %normal256

of255:                                            ; preds = %normal250
  call void @overflow_fail(i32 833)
  br label %normal256

normal256:                                        ; preds = %of255, %normal250
  %add260 = phi i64 [ %fst258, %of255 ], [ %fst258, %normal250 ]
  %result263 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %add260)
  %fst264 = extractvalue { i64, i1 } %result263, 0
  %snd265 = extractvalue { i64, i1 } %result263, 1
  br i1 %snd265, label %of261, label %normal262

of261:                                            ; preds = %normal256
  call void @overflow_fail(i32 828)
  br label %normal262

normal262:                                        ; preds = %of261, %normal256
  %add266 = phi i64 [ %fst264, %of261 ], [ %fst264, %normal256 ]
  %result269 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %add266)
  %fst270 = extractvalue { i64, i1 } %result269, 0
  %snd271 = extractvalue { i64, i1 } %result269, 1
  br i1 %snd271, label %of267, label %normal268

of267:                                            ; preds = %normal262
  call void @overflow_fail(i32 823)
  br label %normal268

normal268:                                        ; preds = %of267, %normal262
  %add272 = phi i64 [ %fst270, %of267 ], [ %fst270, %normal262 ]
  %result275 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %add272)
  %fst276 = extractvalue { i64, i1 } %result275, 0
  %snd277 = extractvalue { i64, i1 } %result275, 1
  br i1 %snd277, label %of273, label %normal274

of273:                                            ; preds = %normal268
  call void @overflow_fail(i32 818)
  br label %normal274

normal274:                                        ; preds = %of273, %normal268
  %add278 = phi i64 [ %fst276, %of273 ], [ %fst276, %normal268 ]
  %result281 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %add278)
  %fst282 = extractvalue { i64, i1 } %result281, 0
  %snd283 = extractvalue { i64, i1 } %result281, 1
  br i1 %snd283, label %of279, label %normal280

of279:                                            ; preds = %normal274
  call void @overflow_fail(i32 813)
  br label %normal280

normal280:                                        ; preds = %of279, %normal274
  %add284 = phi i64 [ %fst282, %of279 ], [ %fst282, %normal274 ]
  %result287 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %add284)
  %fst288 = extractvalue { i64, i1 } %result287, 0
  %snd289 = extractvalue { i64, i1 } %result287, 1
  br i1 %snd289, label %of285, label %normal286

of285:                                            ; preds = %normal280
  call void @overflow_fail(i32 807)
  br label %normal286

normal286:                                        ; preds = %of285, %normal280
  %add290 = phi i64 [ %fst288, %of285 ], [ %fst288, %normal280 ]
  br label %ifcont1210

else291:                                          ; preds = %else234
  %eq292 = icmp eq i64 %0, 11
  br i1 %eq292, label %then293, label %else354

then293:                                          ; preds = %else291
  %result296 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst297 = extractvalue { i64, i1 } %result296, 0
  %snd298 = extractvalue { i64, i1 } %result296, 1
  br i1 %snd298, label %of294, label %normal295

of294:                                            ; preds = %then293
  call void @overflow_fail(i32 1010)
  br label %normal295

normal295:                                        ; preds = %of294, %then293
  %add299 = phi i64 [ %fst297, %of294 ], [ %fst297, %then293 ]
  %result302 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add299)
  %fst303 = extractvalue { i64, i1 } %result302, 0
  %snd304 = extractvalue { i64, i1 } %result302, 1
  br i1 %snd304, label %of300, label %normal301

of300:                                            ; preds = %normal295
  call void @overflow_fail(i32 1005)
  br label %normal301

normal301:                                        ; preds = %of300, %normal295
  %add305 = phi i64 [ %fst303, %of300 ], [ %fst303, %normal295 ]
  %result308 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add305)
  %fst309 = extractvalue { i64, i1 } %result308, 0
  %snd310 = extractvalue { i64, i1 } %result308, 1
  br i1 %snd310, label %of306, label %normal307

of306:                                            ; preds = %normal301
  call void @overflow_fail(i32 1000)
  br label %normal307

normal307:                                        ; preds = %of306, %normal301
  %add311 = phi i64 [ %fst309, %of306 ], [ %fst309, %normal301 ]
  %result314 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %add311)
  %fst315 = extractvalue { i64, i1 } %result314, 0
  %snd316 = extractvalue { i64, i1 } %result314, 1
  br i1 %snd316, label %of312, label %normal313

of312:                                            ; preds = %normal307
  call void @overflow_fail(i32 995)
  br label %normal313

normal313:                                        ; preds = %of312, %normal307
  %add317 = phi i64 [ %fst315, %of312 ], [ %fst315, %normal307 ]
  %result320 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %add317)
  %fst321 = extractvalue { i64, i1 } %result320, 0
  %snd322 = extractvalue { i64, i1 } %result320, 1
  br i1 %snd322, label %of318, label %normal319

of318:                                            ; preds = %normal313
  call void @overflow_fail(i32 990)
  br label %normal319

normal319:                                        ; preds = %of318, %normal313
  %add323 = phi i64 [ %fst321, %of318 ], [ %fst321, %normal313 ]
  %result326 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %add323)
  %fst327 = extractvalue { i64, i1 } %result326, 0
  %snd328 = extractvalue { i64, i1 } %result326, 1
  br i1 %snd328, label %of324, label %normal325

of324:                                            ; preds = %normal319
  call void @overflow_fail(i32 985)
  br label %normal325

normal325:                                        ; preds = %of324, %normal319
  %add329 = phi i64 [ %fst327, %of324 ], [ %fst327, %normal319 ]
  %result332 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %add329)
  %fst333 = extractvalue { i64, i1 } %result332, 0
  %snd334 = extractvalue { i64, i1 } %result332, 1
  br i1 %snd334, label %of330, label %normal331

of330:                                            ; preds = %normal325
  call void @overflow_fail(i32 980)
  br label %normal331

normal331:                                        ; preds = %of330, %normal325
  %add335 = phi i64 [ %fst333, %of330 ], [ %fst333, %normal325 ]
  %result338 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %add335)
  %fst339 = extractvalue { i64, i1 } %result338, 0
  %snd340 = extractvalue { i64, i1 } %result338, 1
  br i1 %snd340, label %of336, label %normal337

of336:                                            ; preds = %normal331
  call void @overflow_fail(i32 975)
  br label %normal337

normal337:                                        ; preds = %of336, %normal331
  %add341 = phi i64 [ %fst339, %of336 ], [ %fst339, %normal331 ]
  %result344 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %add341)
  %fst345 = extractvalue { i64, i1 } %result344, 0
  %snd346 = extractvalue { i64, i1 } %result344, 1
  br i1 %snd346, label %of342, label %normal343

of342:                                            ; preds = %normal337
  call void @overflow_fail(i32 969)
  br label %normal343

normal343:                                        ; preds = %of342, %normal337
  %add347 = phi i64 [ %fst345, %of342 ], [ %fst345, %normal337 ]
  %result350 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %add347)
  %fst351 = extractvalue { i64, i1 } %result350, 0
  %snd352 = extractvalue { i64, i1 } %result350, 1
  br i1 %snd352, label %of348, label %normal349

of348:                                            ; preds = %normal343
  call void @overflow_fail(i32 963)
  br label %normal349

normal349:                                        ; preds = %of348, %normal343
  %add353 = phi i64 [ %fst351, %of348 ], [ %fst351, %normal343 ]
  br label %ifcont1208

else354:                                          ; preds = %else291
  %eq355 = icmp eq i64 %0, 12
  br i1 %eq355, label %then356, label %else423

then356:                                          ; preds = %else354
  %result359 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst360 = extractvalue { i64, i1 } %result359, 0
  %snd361 = extractvalue { i64, i1 } %result359, 1
  br i1 %snd361, label %of357, label %normal358

of357:                                            ; preds = %then356
  call void @overflow_fail(i32 1187)
  br label %normal358

normal358:                                        ; preds = %of357, %then356
  %add362 = phi i64 [ %fst360, %of357 ], [ %fst360, %then356 ]
  %result365 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add362)
  %fst366 = extractvalue { i64, i1 } %result365, 0
  %snd367 = extractvalue { i64, i1 } %result365, 1
  br i1 %snd367, label %of363, label %normal364

of363:                                            ; preds = %normal358
  call void @overflow_fail(i32 1182)
  br label %normal364

normal364:                                        ; preds = %of363, %normal358
  %add368 = phi i64 [ %fst366, %of363 ], [ %fst366, %normal358 ]
  %result371 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add368)
  %fst372 = extractvalue { i64, i1 } %result371, 0
  %snd373 = extractvalue { i64, i1 } %result371, 1
  br i1 %snd373, label %of369, label %normal370

of369:                                            ; preds = %normal364
  call void @overflow_fail(i32 1177)
  br label %normal370

normal370:                                        ; preds = %of369, %normal364
  %add374 = phi i64 [ %fst372, %of369 ], [ %fst372, %normal364 ]
  %result377 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %add374)
  %fst378 = extractvalue { i64, i1 } %result377, 0
  %snd379 = extractvalue { i64, i1 } %result377, 1
  br i1 %snd379, label %of375, label %normal376

of375:                                            ; preds = %normal370
  call void @overflow_fail(i32 1172)
  br label %normal376

normal376:                                        ; preds = %of375, %normal370
  %add380 = phi i64 [ %fst378, %of375 ], [ %fst378, %normal370 ]
  %result383 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %add380)
  %fst384 = extractvalue { i64, i1 } %result383, 0
  %snd385 = extractvalue { i64, i1 } %result383, 1
  br i1 %snd385, label %of381, label %normal382

of381:                                            ; preds = %normal376
  call void @overflow_fail(i32 1167)
  br label %normal382

normal382:                                        ; preds = %of381, %normal376
  %add386 = phi i64 [ %fst384, %of381 ], [ %fst384, %normal376 ]
  %result389 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %add386)
  %fst390 = extractvalue { i64, i1 } %result389, 0
  %snd391 = extractvalue { i64, i1 } %result389, 1
  br i1 %snd391, label %of387, label %normal388

of387:                                            ; preds = %normal382
  call void @overflow_fail(i32 1162)
  br label %normal388

normal388:                                        ; preds = %of387, %normal382
  %add392 = phi i64 [ %fst390, %of387 ], [ %fst390, %normal382 ]
  %result395 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %add392)
  %fst396 = extractvalue { i64, i1 } %result395, 0
  %snd397 = extractvalue { i64, i1 } %result395, 1
  br i1 %snd397, label %of393, label %normal394

of393:                                            ; preds = %normal388
  call void @overflow_fail(i32 1157)
  br label %normal394

normal394:                                        ; preds = %of393, %normal388
  %add398 = phi i64 [ %fst396, %of393 ], [ %fst396, %normal388 ]
  %result401 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %add398)
  %fst402 = extractvalue { i64, i1 } %result401, 0
  %snd403 = extractvalue { i64, i1 } %result401, 1
  br i1 %snd403, label %of399, label %normal400

of399:                                            ; preds = %normal394
  call void @overflow_fail(i32 1152)
  br label %normal400

normal400:                                        ; preds = %of399, %normal394
  %add404 = phi i64 [ %fst402, %of399 ], [ %fst402, %normal394 ]
  %result407 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %add404)
  %fst408 = extractvalue { i64, i1 } %result407, 0
  %snd409 = extractvalue { i64, i1 } %result407, 1
  br i1 %snd409, label %of405, label %normal406

of405:                                            ; preds = %normal400
  call void @overflow_fail(i32 1146)
  br label %normal406

normal406:                                        ; preds = %of405, %normal400
  %add410 = phi i64 [ %fst408, %of405 ], [ %fst408, %normal400 ]
  %result413 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %add410)
  %fst414 = extractvalue { i64, i1 } %result413, 0
  %snd415 = extractvalue { i64, i1 } %result413, 1
  br i1 %snd415, label %of411, label %normal412

of411:                                            ; preds = %normal406
  call void @overflow_fail(i32 1140)
  br label %normal412

normal412:                                        ; preds = %of411, %normal406
  %add416 = phi i64 [ %fst414, %of411 ], [ %fst414, %normal406 ]
  %result419 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %add416)
  %fst420 = extractvalue { i64, i1 } %result419, 0
  %snd421 = extractvalue { i64, i1 } %result419, 1
  br i1 %snd421, label %of417, label %normal418

of417:                                            ; preds = %normal412
  call void @overflow_fail(i32 1134)
  br label %normal418

normal418:                                        ; preds = %of417, %normal412
  %add422 = phi i64 [ %fst420, %of417 ], [ %fst420, %normal412 ]
  br label %ifcont1206

else423:                                          ; preds = %else354
  %eq424 = icmp eq i64 %0, 13
  br i1 %eq424, label %then425, label %else498

then425:                                          ; preds = %else423
  %result428 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst429 = extractvalue { i64, i1 } %result428, 0
  %snd430 = extractvalue { i64, i1 } %result428, 1
  br i1 %snd430, label %of426, label %normal427

of426:                                            ; preds = %then425
  call void @overflow_fail(i32 1379)
  br label %normal427

normal427:                                        ; preds = %of426, %then425
  %add431 = phi i64 [ %fst429, %of426 ], [ %fst429, %then425 ]
  %result434 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add431)
  %fst435 = extractvalue { i64, i1 } %result434, 0
  %snd436 = extractvalue { i64, i1 } %result434, 1
  br i1 %snd436, label %of432, label %normal433

of432:                                            ; preds = %normal427
  call void @overflow_fail(i32 1374)
  br label %normal433

normal433:                                        ; preds = %of432, %normal427
  %add437 = phi i64 [ %fst435, %of432 ], [ %fst435, %normal427 ]
  %result440 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add437)
  %fst441 = extractvalue { i64, i1 } %result440, 0
  %snd442 = extractvalue { i64, i1 } %result440, 1
  br i1 %snd442, label %of438, label %normal439

of438:                                            ; preds = %normal433
  call void @overflow_fail(i32 1369)
  br label %normal439

normal439:                                        ; preds = %of438, %normal433
  %add443 = phi i64 [ %fst441, %of438 ], [ %fst441, %normal433 ]
  %result446 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %add443)
  %fst447 = extractvalue { i64, i1 } %result446, 0
  %snd448 = extractvalue { i64, i1 } %result446, 1
  br i1 %snd448, label %of444, label %normal445

of444:                                            ; preds = %normal439
  call void @overflow_fail(i32 1364)
  br label %normal445

normal445:                                        ; preds = %of444, %normal439
  %add449 = phi i64 [ %fst447, %of444 ], [ %fst447, %normal439 ]
  %result452 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %add449)
  %fst453 = extractvalue { i64, i1 } %result452, 0
  %snd454 = extractvalue { i64, i1 } %result452, 1
  br i1 %snd454, label %of450, label %normal451

of450:                                            ; preds = %normal445
  call void @overflow_fail(i32 1359)
  br label %normal451

normal451:                                        ; preds = %of450, %normal445
  %add455 = phi i64 [ %fst453, %of450 ], [ %fst453, %normal445 ]
  %result458 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %add455)
  %fst459 = extractvalue { i64, i1 } %result458, 0
  %snd460 = extractvalue { i64, i1 } %result458, 1
  br i1 %snd460, label %of456, label %normal457

of456:                                            ; preds = %normal451
  call void @overflow_fail(i32 1354)
  br label %normal457

normal457:                                        ; preds = %of456, %normal451
  %add461 = phi i64 [ %fst459, %of456 ], [ %fst459, %normal451 ]
  %result464 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %add461)
  %fst465 = extractvalue { i64, i1 } %result464, 0
  %snd466 = extractvalue { i64, i1 } %result464, 1
  br i1 %snd466, label %of462, label %normal463

of462:                                            ; preds = %normal457
  call void @overflow_fail(i32 1349)
  br label %normal463

normal463:                                        ; preds = %of462, %normal457
  %add467 = phi i64 [ %fst465, %of462 ], [ %fst465, %normal457 ]
  %result470 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %add467)
  %fst471 = extractvalue { i64, i1 } %result470, 0
  %snd472 = extractvalue { i64, i1 } %result470, 1
  br i1 %snd472, label %of468, label %normal469

of468:                                            ; preds = %normal463
  call void @overflow_fail(i32 1344)
  br label %normal469

normal469:                                        ; preds = %of468, %normal463
  %add473 = phi i64 [ %fst471, %of468 ], [ %fst471, %normal463 ]
  %result476 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %add473)
  %fst477 = extractvalue { i64, i1 } %result476, 0
  %snd478 = extractvalue { i64, i1 } %result476, 1
  br i1 %snd478, label %of474, label %normal475

of474:                                            ; preds = %normal469
  call void @overflow_fail(i32 1338)
  br label %normal475

normal475:                                        ; preds = %of474, %normal469
  %add479 = phi i64 [ %fst477, %of474 ], [ %fst477, %normal469 ]
  %result482 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %add479)
  %fst483 = extractvalue { i64, i1 } %result482, 0
  %snd484 = extractvalue { i64, i1 } %result482, 1
  br i1 %snd484, label %of480, label %normal481

of480:                                            ; preds = %normal475
  call void @overflow_fail(i32 1332)
  br label %normal481

normal481:                                        ; preds = %of480, %normal475
  %add485 = phi i64 [ %fst483, %of480 ], [ %fst483, %normal475 ]
  %result488 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %add485)
  %fst489 = extractvalue { i64, i1 } %result488, 0
  %snd490 = extractvalue { i64, i1 } %result488, 1
  br i1 %snd490, label %of486, label %normal487

of486:                                            ; preds = %normal481
  call void @overflow_fail(i32 1326)
  br label %normal487

normal487:                                        ; preds = %of486, %normal481
  %add491 = phi i64 [ %fst489, %of486 ], [ %fst489, %normal481 ]
  %result494 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %add491)
  %fst495 = extractvalue { i64, i1 } %result494, 0
  %snd496 = extractvalue { i64, i1 } %result494, 1
  br i1 %snd496, label %of492, label %normal493

of492:                                            ; preds = %normal487
  call void @overflow_fail(i32 1320)
  br label %normal493

normal493:                                        ; preds = %of492, %normal487
  %add497 = phi i64 [ %fst495, %of492 ], [ %fst495, %normal487 ]
  br label %ifcont1204

else498:                                          ; preds = %else423
  %eq499 = icmp eq i64 %0, 14
  br i1 %eq499, label %then500, label %else579

then500:                                          ; preds = %else498
  %result503 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst504 = extractvalue { i64, i1 } %result503, 0
  %snd505 = extractvalue { i64, i1 } %result503, 1
  br i1 %snd505, label %of501, label %normal502

of501:                                            ; preds = %then500
  call void @overflow_fail(i32 1586)
  br label %normal502

normal502:                                        ; preds = %of501, %then500
  %add506 = phi i64 [ %fst504, %of501 ], [ %fst504, %then500 ]
  %result509 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add506)
  %fst510 = extractvalue { i64, i1 } %result509, 0
  %snd511 = extractvalue { i64, i1 } %result509, 1
  br i1 %snd511, label %of507, label %normal508

of507:                                            ; preds = %normal502
  call void @overflow_fail(i32 1581)
  br label %normal508

normal508:                                        ; preds = %of507, %normal502
  %add512 = phi i64 [ %fst510, %of507 ], [ %fst510, %normal502 ]
  %result515 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add512)
  %fst516 = extractvalue { i64, i1 } %result515, 0
  %snd517 = extractvalue { i64, i1 } %result515, 1
  br i1 %snd517, label %of513, label %normal514

of513:                                            ; preds = %normal508
  call void @overflow_fail(i32 1576)
  br label %normal514

normal514:                                        ; preds = %of513, %normal508
  %add518 = phi i64 [ %fst516, %of513 ], [ %fst516, %normal508 ]
  %result521 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %add518)
  %fst522 = extractvalue { i64, i1 } %result521, 0
  %snd523 = extractvalue { i64, i1 } %result521, 1
  br i1 %snd523, label %of519, label %normal520

of519:                                            ; preds = %normal514
  call void @overflow_fail(i32 1571)
  br label %normal520

normal520:                                        ; preds = %of519, %normal514
  %add524 = phi i64 [ %fst522, %of519 ], [ %fst522, %normal514 ]
  %result527 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %add524)
  %fst528 = extractvalue { i64, i1 } %result527, 0
  %snd529 = extractvalue { i64, i1 } %result527, 1
  br i1 %snd529, label %of525, label %normal526

of525:                                            ; preds = %normal520
  call void @overflow_fail(i32 1566)
  br label %normal526

normal526:                                        ; preds = %of525, %normal520
  %add530 = phi i64 [ %fst528, %of525 ], [ %fst528, %normal520 ]
  %result533 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %add530)
  %fst534 = extractvalue { i64, i1 } %result533, 0
  %snd535 = extractvalue { i64, i1 } %result533, 1
  br i1 %snd535, label %of531, label %normal532

of531:                                            ; preds = %normal526
  call void @overflow_fail(i32 1561)
  br label %normal532

normal532:                                        ; preds = %of531, %normal526
  %add536 = phi i64 [ %fst534, %of531 ], [ %fst534, %normal526 ]
  %result539 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %add536)
  %fst540 = extractvalue { i64, i1 } %result539, 0
  %snd541 = extractvalue { i64, i1 } %result539, 1
  br i1 %snd541, label %of537, label %normal538

of537:                                            ; preds = %normal532
  call void @overflow_fail(i32 1556)
  br label %normal538

normal538:                                        ; preds = %of537, %normal532
  %add542 = phi i64 [ %fst540, %of537 ], [ %fst540, %normal532 ]
  %result545 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %add542)
  %fst546 = extractvalue { i64, i1 } %result545, 0
  %snd547 = extractvalue { i64, i1 } %result545, 1
  br i1 %snd547, label %of543, label %normal544

of543:                                            ; preds = %normal538
  call void @overflow_fail(i32 1551)
  br label %normal544

normal544:                                        ; preds = %of543, %normal538
  %add548 = phi i64 [ %fst546, %of543 ], [ %fst546, %normal538 ]
  %result551 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %add548)
  %fst552 = extractvalue { i64, i1 } %result551, 0
  %snd553 = extractvalue { i64, i1 } %result551, 1
  br i1 %snd553, label %of549, label %normal550

of549:                                            ; preds = %normal544
  call void @overflow_fail(i32 1545)
  br label %normal550

normal550:                                        ; preds = %of549, %normal544
  %add554 = phi i64 [ %fst552, %of549 ], [ %fst552, %normal544 ]
  %result557 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %add554)
  %fst558 = extractvalue { i64, i1 } %result557, 0
  %snd559 = extractvalue { i64, i1 } %result557, 1
  br i1 %snd559, label %of555, label %normal556

of555:                                            ; preds = %normal550
  call void @overflow_fail(i32 1539)
  br label %normal556

normal556:                                        ; preds = %of555, %normal550
  %add560 = phi i64 [ %fst558, %of555 ], [ %fst558, %normal550 ]
  %result563 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %add560)
  %fst564 = extractvalue { i64, i1 } %result563, 0
  %snd565 = extractvalue { i64, i1 } %result563, 1
  br i1 %snd565, label %of561, label %normal562

of561:                                            ; preds = %normal556
  call void @overflow_fail(i32 1533)
  br label %normal562

normal562:                                        ; preds = %of561, %normal556
  %add566 = phi i64 [ %fst564, %of561 ], [ %fst564, %normal556 ]
  %result569 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %add566)
  %fst570 = extractvalue { i64, i1 } %result569, 0
  %snd571 = extractvalue { i64, i1 } %result569, 1
  br i1 %snd571, label %of567, label %normal568

of567:                                            ; preds = %normal562
  call void @overflow_fail(i32 1527)
  br label %normal568

normal568:                                        ; preds = %of567, %normal562
  %add572 = phi i64 [ %fst570, %of567 ], [ %fst570, %normal562 ]
  %result575 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %add572)
  %fst576 = extractvalue { i64, i1 } %result575, 0
  %snd577 = extractvalue { i64, i1 } %result575, 1
  br i1 %snd577, label %of573, label %normal574

of573:                                            ; preds = %normal568
  call void @overflow_fail(i32 1521)
  br label %normal574

normal574:                                        ; preds = %of573, %normal568
  %add578 = phi i64 [ %fst576, %of573 ], [ %fst576, %normal568 ]
  br label %ifcont1202

else579:                                          ; preds = %else498
  %eq580 = icmp eq i64 %0, 15
  br i1 %eq580, label %then581, label %else666

then581:                                          ; preds = %else579
  %result584 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst585 = extractvalue { i64, i1 } %result584, 0
  %snd586 = extractvalue { i64, i1 } %result584, 1
  br i1 %snd586, label %of582, label %normal583

of582:                                            ; preds = %then581
  call void @overflow_fail(i32 1808)
  br label %normal583

normal583:                                        ; preds = %of582, %then581
  %add587 = phi i64 [ %fst585, %of582 ], [ %fst585, %then581 ]
  %result590 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add587)
  %fst591 = extractvalue { i64, i1 } %result590, 0
  %snd592 = extractvalue { i64, i1 } %result590, 1
  br i1 %snd592, label %of588, label %normal589

of588:                                            ; preds = %normal583
  call void @overflow_fail(i32 1803)
  br label %normal589

normal589:                                        ; preds = %of588, %normal583
  %add593 = phi i64 [ %fst591, %of588 ], [ %fst591, %normal583 ]
  %result596 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add593)
  %fst597 = extractvalue { i64, i1 } %result596, 0
  %snd598 = extractvalue { i64, i1 } %result596, 1
  br i1 %snd598, label %of594, label %normal595

of594:                                            ; preds = %normal589
  call void @overflow_fail(i32 1798)
  br label %normal595

normal595:                                        ; preds = %of594, %normal589
  %add599 = phi i64 [ %fst597, %of594 ], [ %fst597, %normal589 ]
  %result602 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %add599)
  %fst603 = extractvalue { i64, i1 } %result602, 0
  %snd604 = extractvalue { i64, i1 } %result602, 1
  br i1 %snd604, label %of600, label %normal601

of600:                                            ; preds = %normal595
  call void @overflow_fail(i32 1793)
  br label %normal601

normal601:                                        ; preds = %of600, %normal595
  %add605 = phi i64 [ %fst603, %of600 ], [ %fst603, %normal595 ]
  %result608 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %add605)
  %fst609 = extractvalue { i64, i1 } %result608, 0
  %snd610 = extractvalue { i64, i1 } %result608, 1
  br i1 %snd610, label %of606, label %normal607

of606:                                            ; preds = %normal601
  call void @overflow_fail(i32 1788)
  br label %normal607

normal607:                                        ; preds = %of606, %normal601
  %add611 = phi i64 [ %fst609, %of606 ], [ %fst609, %normal601 ]
  %result614 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %add611)
  %fst615 = extractvalue { i64, i1 } %result614, 0
  %snd616 = extractvalue { i64, i1 } %result614, 1
  br i1 %snd616, label %of612, label %normal613

of612:                                            ; preds = %normal607
  call void @overflow_fail(i32 1783)
  br label %normal613

normal613:                                        ; preds = %of612, %normal607
  %add617 = phi i64 [ %fst615, %of612 ], [ %fst615, %normal607 ]
  %result620 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %add617)
  %fst621 = extractvalue { i64, i1 } %result620, 0
  %snd622 = extractvalue { i64, i1 } %result620, 1
  br i1 %snd622, label %of618, label %normal619

of618:                                            ; preds = %normal613
  call void @overflow_fail(i32 1778)
  br label %normal619

normal619:                                        ; preds = %of618, %normal613
  %add623 = phi i64 [ %fst621, %of618 ], [ %fst621, %normal613 ]
  %result626 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %add623)
  %fst627 = extractvalue { i64, i1 } %result626, 0
  %snd628 = extractvalue { i64, i1 } %result626, 1
  br i1 %snd628, label %of624, label %normal625

of624:                                            ; preds = %normal619
  call void @overflow_fail(i32 1773)
  br label %normal625

normal625:                                        ; preds = %of624, %normal619
  %add629 = phi i64 [ %fst627, %of624 ], [ %fst627, %normal619 ]
  %result632 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %add629)
  %fst633 = extractvalue { i64, i1 } %result632, 0
  %snd634 = extractvalue { i64, i1 } %result632, 1
  br i1 %snd634, label %of630, label %normal631

of630:                                            ; preds = %normal625
  call void @overflow_fail(i32 1767)
  br label %normal631

normal631:                                        ; preds = %of630, %normal625
  %add635 = phi i64 [ %fst633, %of630 ], [ %fst633, %normal625 ]
  %result638 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %add635)
  %fst639 = extractvalue { i64, i1 } %result638, 0
  %snd640 = extractvalue { i64, i1 } %result638, 1
  br i1 %snd640, label %of636, label %normal637

of636:                                            ; preds = %normal631
  call void @overflow_fail(i32 1761)
  br label %normal637

normal637:                                        ; preds = %of636, %normal631
  %add641 = phi i64 [ %fst639, %of636 ], [ %fst639, %normal631 ]
  %result644 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %add641)
  %fst645 = extractvalue { i64, i1 } %result644, 0
  %snd646 = extractvalue { i64, i1 } %result644, 1
  br i1 %snd646, label %of642, label %normal643

of642:                                            ; preds = %normal637
  call void @overflow_fail(i32 1755)
  br label %normal643

normal643:                                        ; preds = %of642, %normal637
  %add647 = phi i64 [ %fst645, %of642 ], [ %fst645, %normal637 ]
  %result650 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %add647)
  %fst651 = extractvalue { i64, i1 } %result650, 0
  %snd652 = extractvalue { i64, i1 } %result650, 1
  br i1 %snd652, label %of648, label %normal649

of648:                                            ; preds = %normal643
  call void @overflow_fail(i32 1749)
  br label %normal649

normal649:                                        ; preds = %of648, %normal643
  %add653 = phi i64 [ %fst651, %of648 ], [ %fst651, %normal643 ]
  %result656 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %add653)
  %fst657 = extractvalue { i64, i1 } %result656, 0
  %snd658 = extractvalue { i64, i1 } %result656, 1
  br i1 %snd658, label %of654, label %normal655

of654:                                            ; preds = %normal649
  call void @overflow_fail(i32 1743)
  br label %normal655

normal655:                                        ; preds = %of654, %normal649
  %add659 = phi i64 [ %fst657, %of654 ], [ %fst657, %normal649 ]
  %result662 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %add659)
  %fst663 = extractvalue { i64, i1 } %result662, 0
  %snd664 = extractvalue { i64, i1 } %result662, 1
  br i1 %snd664, label %of660, label %normal661

of660:                                            ; preds = %normal655
  call void @overflow_fail(i32 1737)
  br label %normal661

normal661:                                        ; preds = %of660, %normal655
  %add665 = phi i64 [ %fst663, %of660 ], [ %fst663, %normal655 ]
  br label %ifcont1200

else666:                                          ; preds = %else579
  %eq667 = icmp eq i64 %0, 16
  br i1 %eq667, label %then668, label %else759

then668:                                          ; preds = %else666
  %result671 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst672 = extractvalue { i64, i1 } %result671, 0
  %snd673 = extractvalue { i64, i1 } %result671, 1
  br i1 %snd673, label %of669, label %normal670

of669:                                            ; preds = %then668
  call void @overflow_fail(i32 2045)
  br label %normal670

normal670:                                        ; preds = %of669, %then668
  %add674 = phi i64 [ %fst672, %of669 ], [ %fst672, %then668 ]
  %result677 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add674)
  %fst678 = extractvalue { i64, i1 } %result677, 0
  %snd679 = extractvalue { i64, i1 } %result677, 1
  br i1 %snd679, label %of675, label %normal676

of675:                                            ; preds = %normal670
  call void @overflow_fail(i32 2040)
  br label %normal676

normal676:                                        ; preds = %of675, %normal670
  %add680 = phi i64 [ %fst678, %of675 ], [ %fst678, %normal670 ]
  %result683 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add680)
  %fst684 = extractvalue { i64, i1 } %result683, 0
  %snd685 = extractvalue { i64, i1 } %result683, 1
  br i1 %snd685, label %of681, label %normal682

of681:                                            ; preds = %normal676
  call void @overflow_fail(i32 2035)
  br label %normal682

normal682:                                        ; preds = %of681, %normal676
  %add686 = phi i64 [ %fst684, %of681 ], [ %fst684, %normal676 ]
  %result689 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %add686)
  %fst690 = extractvalue { i64, i1 } %result689, 0
  %snd691 = extractvalue { i64, i1 } %result689, 1
  br i1 %snd691, label %of687, label %normal688

of687:                                            ; preds = %normal682
  call void @overflow_fail(i32 2030)
  br label %normal688

normal688:                                        ; preds = %of687, %normal682
  %add692 = phi i64 [ %fst690, %of687 ], [ %fst690, %normal682 ]
  %result695 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %add692)
  %fst696 = extractvalue { i64, i1 } %result695, 0
  %snd697 = extractvalue { i64, i1 } %result695, 1
  br i1 %snd697, label %of693, label %normal694

of693:                                            ; preds = %normal688
  call void @overflow_fail(i32 2025)
  br label %normal694

normal694:                                        ; preds = %of693, %normal688
  %add698 = phi i64 [ %fst696, %of693 ], [ %fst696, %normal688 ]
  %result701 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %add698)
  %fst702 = extractvalue { i64, i1 } %result701, 0
  %snd703 = extractvalue { i64, i1 } %result701, 1
  br i1 %snd703, label %of699, label %normal700

of699:                                            ; preds = %normal694
  call void @overflow_fail(i32 2020)
  br label %normal700

normal700:                                        ; preds = %of699, %normal694
  %add704 = phi i64 [ %fst702, %of699 ], [ %fst702, %normal694 ]
  %result707 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %add704)
  %fst708 = extractvalue { i64, i1 } %result707, 0
  %snd709 = extractvalue { i64, i1 } %result707, 1
  br i1 %snd709, label %of705, label %normal706

of705:                                            ; preds = %normal700
  call void @overflow_fail(i32 2015)
  br label %normal706

normal706:                                        ; preds = %of705, %normal700
  %add710 = phi i64 [ %fst708, %of705 ], [ %fst708, %normal700 ]
  %result713 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %add710)
  %fst714 = extractvalue { i64, i1 } %result713, 0
  %snd715 = extractvalue { i64, i1 } %result713, 1
  br i1 %snd715, label %of711, label %normal712

of711:                                            ; preds = %normal706
  call void @overflow_fail(i32 2010)
  br label %normal712

normal712:                                        ; preds = %of711, %normal706
  %add716 = phi i64 [ %fst714, %of711 ], [ %fst714, %normal706 ]
  %result719 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %add716)
  %fst720 = extractvalue { i64, i1 } %result719, 0
  %snd721 = extractvalue { i64, i1 } %result719, 1
  br i1 %snd721, label %of717, label %normal718

of717:                                            ; preds = %normal712
  call void @overflow_fail(i32 2004)
  br label %normal718

normal718:                                        ; preds = %of717, %normal712
  %add722 = phi i64 [ %fst720, %of717 ], [ %fst720, %normal712 ]
  %result725 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %add722)
  %fst726 = extractvalue { i64, i1 } %result725, 0
  %snd727 = extractvalue { i64, i1 } %result725, 1
  br i1 %snd727, label %of723, label %normal724

of723:                                            ; preds = %normal718
  call void @overflow_fail(i32 1998)
  br label %normal724

normal724:                                        ; preds = %of723, %normal718
  %add728 = phi i64 [ %fst726, %of723 ], [ %fst726, %normal718 ]
  %result731 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %add728)
  %fst732 = extractvalue { i64, i1 } %result731, 0
  %snd733 = extractvalue { i64, i1 } %result731, 1
  br i1 %snd733, label %of729, label %normal730

of729:                                            ; preds = %normal724
  call void @overflow_fail(i32 1992)
  br label %normal730

normal730:                                        ; preds = %of729, %normal724
  %add734 = phi i64 [ %fst732, %of729 ], [ %fst732, %normal724 ]
  %result737 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %add734)
  %fst738 = extractvalue { i64, i1 } %result737, 0
  %snd739 = extractvalue { i64, i1 } %result737, 1
  br i1 %snd739, label %of735, label %normal736

of735:                                            ; preds = %normal730
  call void @overflow_fail(i32 1986)
  br label %normal736

normal736:                                        ; preds = %of735, %normal730
  %add740 = phi i64 [ %fst738, %of735 ], [ %fst738, %normal730 ]
  %result743 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %add740)
  %fst744 = extractvalue { i64, i1 } %result743, 0
  %snd745 = extractvalue { i64, i1 } %result743, 1
  br i1 %snd745, label %of741, label %normal742

of741:                                            ; preds = %normal736
  call void @overflow_fail(i32 1980)
  br label %normal742

normal742:                                        ; preds = %of741, %normal736
  %add746 = phi i64 [ %fst744, %of741 ], [ %fst744, %normal736 ]
  %result749 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %add746)
  %fst750 = extractvalue { i64, i1 } %result749, 0
  %snd751 = extractvalue { i64, i1 } %result749, 1
  br i1 %snd751, label %of747, label %normal748

of747:                                            ; preds = %normal742
  call void @overflow_fail(i32 1974)
  br label %normal748

normal748:                                        ; preds = %of747, %normal742
  %add752 = phi i64 [ %fst750, %of747 ], [ %fst750, %normal742 ]
  %result755 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %add752)
  %fst756 = extractvalue { i64, i1 } %result755, 0
  %snd757 = extractvalue { i64, i1 } %result755, 1
  br i1 %snd757, label %of753, label %normal754

of753:                                            ; preds = %normal748
  call void @overflow_fail(i32 1968)
  br label %normal754

normal754:                                        ; preds = %of753, %normal748
  %add758 = phi i64 [ %fst756, %of753 ], [ %fst756, %normal748 ]
  br label %ifcont1198

else759:                                          ; preds = %else666
  %eq760 = icmp eq i64 %0, 17
  br i1 %eq760, label %then761, label %else858

then761:                                          ; preds = %else759
  %result764 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst765 = extractvalue { i64, i1 } %result764, 0
  %snd766 = extractvalue { i64, i1 } %result764, 1
  br i1 %snd766, label %of762, label %normal763

of762:                                            ; preds = %then761
  call void @overflow_fail(i32 2297)
  br label %normal763

normal763:                                        ; preds = %of762, %then761
  %add767 = phi i64 [ %fst765, %of762 ], [ %fst765, %then761 ]
  %result770 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add767)
  %fst771 = extractvalue { i64, i1 } %result770, 0
  %snd772 = extractvalue { i64, i1 } %result770, 1
  br i1 %snd772, label %of768, label %normal769

of768:                                            ; preds = %normal763
  call void @overflow_fail(i32 2292)
  br label %normal769

normal769:                                        ; preds = %of768, %normal763
  %add773 = phi i64 [ %fst771, %of768 ], [ %fst771, %normal763 ]
  %result776 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add773)
  %fst777 = extractvalue { i64, i1 } %result776, 0
  %snd778 = extractvalue { i64, i1 } %result776, 1
  br i1 %snd778, label %of774, label %normal775

of774:                                            ; preds = %normal769
  call void @overflow_fail(i32 2287)
  br label %normal775

normal775:                                        ; preds = %of774, %normal769
  %add779 = phi i64 [ %fst777, %of774 ], [ %fst777, %normal769 ]
  %result782 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %add779)
  %fst783 = extractvalue { i64, i1 } %result782, 0
  %snd784 = extractvalue { i64, i1 } %result782, 1
  br i1 %snd784, label %of780, label %normal781

of780:                                            ; preds = %normal775
  call void @overflow_fail(i32 2282)
  br label %normal781

normal781:                                        ; preds = %of780, %normal775
  %add785 = phi i64 [ %fst783, %of780 ], [ %fst783, %normal775 ]
  %result788 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %add785)
  %fst789 = extractvalue { i64, i1 } %result788, 0
  %snd790 = extractvalue { i64, i1 } %result788, 1
  br i1 %snd790, label %of786, label %normal787

of786:                                            ; preds = %normal781
  call void @overflow_fail(i32 2277)
  br label %normal787

normal787:                                        ; preds = %of786, %normal781
  %add791 = phi i64 [ %fst789, %of786 ], [ %fst789, %normal781 ]
  %result794 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %add791)
  %fst795 = extractvalue { i64, i1 } %result794, 0
  %snd796 = extractvalue { i64, i1 } %result794, 1
  br i1 %snd796, label %of792, label %normal793

of792:                                            ; preds = %normal787
  call void @overflow_fail(i32 2272)
  br label %normal793

normal793:                                        ; preds = %of792, %normal787
  %add797 = phi i64 [ %fst795, %of792 ], [ %fst795, %normal787 ]
  %result800 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %add797)
  %fst801 = extractvalue { i64, i1 } %result800, 0
  %snd802 = extractvalue { i64, i1 } %result800, 1
  br i1 %snd802, label %of798, label %normal799

of798:                                            ; preds = %normal793
  call void @overflow_fail(i32 2267)
  br label %normal799

normal799:                                        ; preds = %of798, %normal793
  %add803 = phi i64 [ %fst801, %of798 ], [ %fst801, %normal793 ]
  %result806 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %add803)
  %fst807 = extractvalue { i64, i1 } %result806, 0
  %snd808 = extractvalue { i64, i1 } %result806, 1
  br i1 %snd808, label %of804, label %normal805

of804:                                            ; preds = %normal799
  call void @overflow_fail(i32 2262)
  br label %normal805

normal805:                                        ; preds = %of804, %normal799
  %add809 = phi i64 [ %fst807, %of804 ], [ %fst807, %normal799 ]
  %result812 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %add809)
  %fst813 = extractvalue { i64, i1 } %result812, 0
  %snd814 = extractvalue { i64, i1 } %result812, 1
  br i1 %snd814, label %of810, label %normal811

of810:                                            ; preds = %normal805
  call void @overflow_fail(i32 2256)
  br label %normal811

normal811:                                        ; preds = %of810, %normal805
  %add815 = phi i64 [ %fst813, %of810 ], [ %fst813, %normal805 ]
  %result818 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %add815)
  %fst819 = extractvalue { i64, i1 } %result818, 0
  %snd820 = extractvalue { i64, i1 } %result818, 1
  br i1 %snd820, label %of816, label %normal817

of816:                                            ; preds = %normal811
  call void @overflow_fail(i32 2250)
  br label %normal817

normal817:                                        ; preds = %of816, %normal811
  %add821 = phi i64 [ %fst819, %of816 ], [ %fst819, %normal811 ]
  %result824 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %add821)
  %fst825 = extractvalue { i64, i1 } %result824, 0
  %snd826 = extractvalue { i64, i1 } %result824, 1
  br i1 %snd826, label %of822, label %normal823

of822:                                            ; preds = %normal817
  call void @overflow_fail(i32 2244)
  br label %normal823

normal823:                                        ; preds = %of822, %normal817
  %add827 = phi i64 [ %fst825, %of822 ], [ %fst825, %normal817 ]
  %result830 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %add827)
  %fst831 = extractvalue { i64, i1 } %result830, 0
  %snd832 = extractvalue { i64, i1 } %result830, 1
  br i1 %snd832, label %of828, label %normal829

of828:                                            ; preds = %normal823
  call void @overflow_fail(i32 2238)
  br label %normal829

normal829:                                        ; preds = %of828, %normal823
  %add833 = phi i64 [ %fst831, %of828 ], [ %fst831, %normal823 ]
  %result836 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %add833)
  %fst837 = extractvalue { i64, i1 } %result836, 0
  %snd838 = extractvalue { i64, i1 } %result836, 1
  br i1 %snd838, label %of834, label %normal835

of834:                                            ; preds = %normal829
  call void @overflow_fail(i32 2232)
  br label %normal835

normal835:                                        ; preds = %of834, %normal829
  %add839 = phi i64 [ %fst837, %of834 ], [ %fst837, %normal829 ]
  %result842 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %add839)
  %fst843 = extractvalue { i64, i1 } %result842, 0
  %snd844 = extractvalue { i64, i1 } %result842, 1
  br i1 %snd844, label %of840, label %normal841

of840:                                            ; preds = %normal835
  call void @overflow_fail(i32 2226)
  br label %normal841

normal841:                                        ; preds = %of840, %normal835
  %add845 = phi i64 [ %fst843, %of840 ], [ %fst843, %normal835 ]
  %result848 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %add845)
  %fst849 = extractvalue { i64, i1 } %result848, 0
  %snd850 = extractvalue { i64, i1 } %result848, 1
  br i1 %snd850, label %of846, label %normal847

of846:                                            ; preds = %normal841
  call void @overflow_fail(i32 2220)
  br label %normal847

normal847:                                        ; preds = %of846, %normal841
  %add851 = phi i64 [ %fst849, %of846 ], [ %fst849, %normal841 ]
  %result854 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %add851)
  %fst855 = extractvalue { i64, i1 } %result854, 0
  %snd856 = extractvalue { i64, i1 } %result854, 1
  br i1 %snd856, label %of852, label %normal853

of852:                                            ; preds = %normal847
  call void @overflow_fail(i32 2214)
  br label %normal853

normal853:                                        ; preds = %of852, %normal847
  %add857 = phi i64 [ %fst855, %of852 ], [ %fst855, %normal847 ]
  br label %ifcont1196

else858:                                          ; preds = %else759
  %eq859 = icmp eq i64 %0, 18
  br i1 %eq859, label %then860, label %else963

then860:                                          ; preds = %else858
  %result863 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst864 = extractvalue { i64, i1 } %result863, 0
  %snd865 = extractvalue { i64, i1 } %result863, 1
  br i1 %snd865, label %of861, label %normal862

of861:                                            ; preds = %then860
  call void @overflow_fail(i32 2564)
  br label %normal862

normal862:                                        ; preds = %of861, %then860
  %add866 = phi i64 [ %fst864, %of861 ], [ %fst864, %then860 ]
  %result869 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add866)
  %fst870 = extractvalue { i64, i1 } %result869, 0
  %snd871 = extractvalue { i64, i1 } %result869, 1
  br i1 %snd871, label %of867, label %normal868

of867:                                            ; preds = %normal862
  call void @overflow_fail(i32 2559)
  br label %normal868

normal868:                                        ; preds = %of867, %normal862
  %add872 = phi i64 [ %fst870, %of867 ], [ %fst870, %normal862 ]
  %result875 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add872)
  %fst876 = extractvalue { i64, i1 } %result875, 0
  %snd877 = extractvalue { i64, i1 } %result875, 1
  br i1 %snd877, label %of873, label %normal874

of873:                                            ; preds = %normal868
  call void @overflow_fail(i32 2554)
  br label %normal874

normal874:                                        ; preds = %of873, %normal868
  %add878 = phi i64 [ %fst876, %of873 ], [ %fst876, %normal868 ]
  %result881 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %add878)
  %fst882 = extractvalue { i64, i1 } %result881, 0
  %snd883 = extractvalue { i64, i1 } %result881, 1
  br i1 %snd883, label %of879, label %normal880

of879:                                            ; preds = %normal874
  call void @overflow_fail(i32 2549)
  br label %normal880

normal880:                                        ; preds = %of879, %normal874
  %add884 = phi i64 [ %fst882, %of879 ], [ %fst882, %normal874 ]
  %result887 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %add884)
  %fst888 = extractvalue { i64, i1 } %result887, 0
  %snd889 = extractvalue { i64, i1 } %result887, 1
  br i1 %snd889, label %of885, label %normal886

of885:                                            ; preds = %normal880
  call void @overflow_fail(i32 2544)
  br label %normal886

normal886:                                        ; preds = %of885, %normal880
  %add890 = phi i64 [ %fst888, %of885 ], [ %fst888, %normal880 ]
  %result893 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %add890)
  %fst894 = extractvalue { i64, i1 } %result893, 0
  %snd895 = extractvalue { i64, i1 } %result893, 1
  br i1 %snd895, label %of891, label %normal892

of891:                                            ; preds = %normal886
  call void @overflow_fail(i32 2539)
  br label %normal892

normal892:                                        ; preds = %of891, %normal886
  %add896 = phi i64 [ %fst894, %of891 ], [ %fst894, %normal886 ]
  %result899 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %add896)
  %fst900 = extractvalue { i64, i1 } %result899, 0
  %snd901 = extractvalue { i64, i1 } %result899, 1
  br i1 %snd901, label %of897, label %normal898

of897:                                            ; preds = %normal892
  call void @overflow_fail(i32 2534)
  br label %normal898

normal898:                                        ; preds = %of897, %normal892
  %add902 = phi i64 [ %fst900, %of897 ], [ %fst900, %normal892 ]
  %result905 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %add902)
  %fst906 = extractvalue { i64, i1 } %result905, 0
  %snd907 = extractvalue { i64, i1 } %result905, 1
  br i1 %snd907, label %of903, label %normal904

of903:                                            ; preds = %normal898
  call void @overflow_fail(i32 2529)
  br label %normal904

normal904:                                        ; preds = %of903, %normal898
  %add908 = phi i64 [ %fst906, %of903 ], [ %fst906, %normal898 ]
  %result911 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %add908)
  %fst912 = extractvalue { i64, i1 } %result911, 0
  %snd913 = extractvalue { i64, i1 } %result911, 1
  br i1 %snd913, label %of909, label %normal910

of909:                                            ; preds = %normal904
  call void @overflow_fail(i32 2523)
  br label %normal910

normal910:                                        ; preds = %of909, %normal904
  %add914 = phi i64 [ %fst912, %of909 ], [ %fst912, %normal904 ]
  %result917 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %add914)
  %fst918 = extractvalue { i64, i1 } %result917, 0
  %snd919 = extractvalue { i64, i1 } %result917, 1
  br i1 %snd919, label %of915, label %normal916

of915:                                            ; preds = %normal910
  call void @overflow_fail(i32 2517)
  br label %normal916

normal916:                                        ; preds = %of915, %normal910
  %add920 = phi i64 [ %fst918, %of915 ], [ %fst918, %normal910 ]
  %result923 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %add920)
  %fst924 = extractvalue { i64, i1 } %result923, 0
  %snd925 = extractvalue { i64, i1 } %result923, 1
  br i1 %snd925, label %of921, label %normal922

of921:                                            ; preds = %normal916
  call void @overflow_fail(i32 2511)
  br label %normal922

normal922:                                        ; preds = %of921, %normal916
  %add926 = phi i64 [ %fst924, %of921 ], [ %fst924, %normal916 ]
  %result929 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %add926)
  %fst930 = extractvalue { i64, i1 } %result929, 0
  %snd931 = extractvalue { i64, i1 } %result929, 1
  br i1 %snd931, label %of927, label %normal928

of927:                                            ; preds = %normal922
  call void @overflow_fail(i32 2505)
  br label %normal928

normal928:                                        ; preds = %of927, %normal922
  %add932 = phi i64 [ %fst930, %of927 ], [ %fst930, %normal922 ]
  %result935 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %add932)
  %fst936 = extractvalue { i64, i1 } %result935, 0
  %snd937 = extractvalue { i64, i1 } %result935, 1
  br i1 %snd937, label %of933, label %normal934

of933:                                            ; preds = %normal928
  call void @overflow_fail(i32 2499)
  br label %normal934

normal934:                                        ; preds = %of933, %normal928
  %add938 = phi i64 [ %fst936, %of933 ], [ %fst936, %normal928 ]
  %result941 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %add938)
  %fst942 = extractvalue { i64, i1 } %result941, 0
  %snd943 = extractvalue { i64, i1 } %result941, 1
  br i1 %snd943, label %of939, label %normal940

of939:                                            ; preds = %normal934
  call void @overflow_fail(i32 2493)
  br label %normal940

normal940:                                        ; preds = %of939, %normal934
  %add944 = phi i64 [ %fst942, %of939 ], [ %fst942, %normal934 ]
  %result947 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %add944)
  %fst948 = extractvalue { i64, i1 } %result947, 0
  %snd949 = extractvalue { i64, i1 } %result947, 1
  br i1 %snd949, label %of945, label %normal946

of945:                                            ; preds = %normal940
  call void @overflow_fail(i32 2487)
  br label %normal946

normal946:                                        ; preds = %of945, %normal940
  %add950 = phi i64 [ %fst948, %of945 ], [ %fst948, %normal940 ]
  %result953 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %add950)
  %fst954 = extractvalue { i64, i1 } %result953, 0
  %snd955 = extractvalue { i64, i1 } %result953, 1
  br i1 %snd955, label %of951, label %normal952

of951:                                            ; preds = %normal946
  call void @overflow_fail(i32 2481)
  br label %normal952

normal952:                                        ; preds = %of951, %normal946
  %add956 = phi i64 [ %fst954, %of951 ], [ %fst954, %normal946 ]
  %result959 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %add956)
  %fst960 = extractvalue { i64, i1 } %result959, 0
  %snd961 = extractvalue { i64, i1 } %result959, 1
  br i1 %snd961, label %of957, label %normal958

of957:                                            ; preds = %normal952
  call void @overflow_fail(i32 2475)
  br label %normal958

normal958:                                        ; preds = %of957, %normal952
  %add962 = phi i64 [ %fst960, %of957 ], [ %fst960, %normal952 ]
  br label %ifcont1194

else963:                                          ; preds = %else858
  %eq964 = icmp eq i64 %0, 19
  br i1 %eq964, label %then965, label %else1074

then965:                                          ; preds = %else963
  %result968 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst969 = extractvalue { i64, i1 } %result968, 0
  %snd970 = extractvalue { i64, i1 } %result968, 1
  br i1 %snd970, label %of966, label %normal967

of966:                                            ; preds = %then965
  call void @overflow_fail(i32 2846)
  br label %normal967

normal967:                                        ; preds = %of966, %then965
  %add971 = phi i64 [ %fst969, %of966 ], [ %fst969, %then965 ]
  %result974 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add971)
  %fst975 = extractvalue { i64, i1 } %result974, 0
  %snd976 = extractvalue { i64, i1 } %result974, 1
  br i1 %snd976, label %of972, label %normal973

of972:                                            ; preds = %normal967
  call void @overflow_fail(i32 2841)
  br label %normal973

normal973:                                        ; preds = %of972, %normal967
  %add977 = phi i64 [ %fst975, %of972 ], [ %fst975, %normal967 ]
  %result980 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add977)
  %fst981 = extractvalue { i64, i1 } %result980, 0
  %snd982 = extractvalue { i64, i1 } %result980, 1
  br i1 %snd982, label %of978, label %normal979

of978:                                            ; preds = %normal973
  call void @overflow_fail(i32 2836)
  br label %normal979

normal979:                                        ; preds = %of978, %normal973
  %add983 = phi i64 [ %fst981, %of978 ], [ %fst981, %normal973 ]
  %result986 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %add983)
  %fst987 = extractvalue { i64, i1 } %result986, 0
  %snd988 = extractvalue { i64, i1 } %result986, 1
  br i1 %snd988, label %of984, label %normal985

of984:                                            ; preds = %normal979
  call void @overflow_fail(i32 2831)
  br label %normal985

normal985:                                        ; preds = %of984, %normal979
  %add989 = phi i64 [ %fst987, %of984 ], [ %fst987, %normal979 ]
  %result992 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %add989)
  %fst993 = extractvalue { i64, i1 } %result992, 0
  %snd994 = extractvalue { i64, i1 } %result992, 1
  br i1 %snd994, label %of990, label %normal991

of990:                                            ; preds = %normal985
  call void @overflow_fail(i32 2826)
  br label %normal991

normal991:                                        ; preds = %of990, %normal985
  %add995 = phi i64 [ %fst993, %of990 ], [ %fst993, %normal985 ]
  %result998 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %add995)
  %fst999 = extractvalue { i64, i1 } %result998, 0
  %snd1000 = extractvalue { i64, i1 } %result998, 1
  br i1 %snd1000, label %of996, label %normal997

of996:                                            ; preds = %normal991
  call void @overflow_fail(i32 2821)
  br label %normal997

normal997:                                        ; preds = %of996, %normal991
  %add1001 = phi i64 [ %fst999, %of996 ], [ %fst999, %normal991 ]
  %result1004 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %add1001)
  %fst1005 = extractvalue { i64, i1 } %result1004, 0
  %snd1006 = extractvalue { i64, i1 } %result1004, 1
  br i1 %snd1006, label %of1002, label %normal1003

of1002:                                           ; preds = %normal997
  call void @overflow_fail(i32 2816)
  br label %normal1003

normal1003:                                       ; preds = %of1002, %normal997
  %add1007 = phi i64 [ %fst1005, %of1002 ], [ %fst1005, %normal997 ]
  %result1010 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %add1007)
  %fst1011 = extractvalue { i64, i1 } %result1010, 0
  %snd1012 = extractvalue { i64, i1 } %result1010, 1
  br i1 %snd1012, label %of1008, label %normal1009

of1008:                                           ; preds = %normal1003
  call void @overflow_fail(i32 2811)
  br label %normal1009

normal1009:                                       ; preds = %of1008, %normal1003
  %add1013 = phi i64 [ %fst1011, %of1008 ], [ %fst1011, %normal1003 ]
  %result1016 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %add1013)
  %fst1017 = extractvalue { i64, i1 } %result1016, 0
  %snd1018 = extractvalue { i64, i1 } %result1016, 1
  br i1 %snd1018, label %of1014, label %normal1015

of1014:                                           ; preds = %normal1009
  call void @overflow_fail(i32 2805)
  br label %normal1015

normal1015:                                       ; preds = %of1014, %normal1009
  %add1019 = phi i64 [ %fst1017, %of1014 ], [ %fst1017, %normal1009 ]
  %result1022 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %add1019)
  %fst1023 = extractvalue { i64, i1 } %result1022, 0
  %snd1024 = extractvalue { i64, i1 } %result1022, 1
  br i1 %snd1024, label %of1020, label %normal1021

of1020:                                           ; preds = %normal1015
  call void @overflow_fail(i32 2799)
  br label %normal1021

normal1021:                                       ; preds = %of1020, %normal1015
  %add1025 = phi i64 [ %fst1023, %of1020 ], [ %fst1023, %normal1015 ]
  %result1028 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %add1025)
  %fst1029 = extractvalue { i64, i1 } %result1028, 0
  %snd1030 = extractvalue { i64, i1 } %result1028, 1
  br i1 %snd1030, label %of1026, label %normal1027

of1026:                                           ; preds = %normal1021
  call void @overflow_fail(i32 2793)
  br label %normal1027

normal1027:                                       ; preds = %of1026, %normal1021
  %add1031 = phi i64 [ %fst1029, %of1026 ], [ %fst1029, %normal1021 ]
  %result1034 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %add1031)
  %fst1035 = extractvalue { i64, i1 } %result1034, 0
  %snd1036 = extractvalue { i64, i1 } %result1034, 1
  br i1 %snd1036, label %of1032, label %normal1033

of1032:                                           ; preds = %normal1027
  call void @overflow_fail(i32 2787)
  br label %normal1033

normal1033:                                       ; preds = %of1032, %normal1027
  %add1037 = phi i64 [ %fst1035, %of1032 ], [ %fst1035, %normal1027 ]
  %result1040 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %add1037)
  %fst1041 = extractvalue { i64, i1 } %result1040, 0
  %snd1042 = extractvalue { i64, i1 } %result1040, 1
  br i1 %snd1042, label %of1038, label %normal1039

of1038:                                           ; preds = %normal1033
  call void @overflow_fail(i32 2781)
  br label %normal1039

normal1039:                                       ; preds = %of1038, %normal1033
  %add1043 = phi i64 [ %fst1041, %of1038 ], [ %fst1041, %normal1033 ]
  %result1046 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %add1043)
  %fst1047 = extractvalue { i64, i1 } %result1046, 0
  %snd1048 = extractvalue { i64, i1 } %result1046, 1
  br i1 %snd1048, label %of1044, label %normal1045

of1044:                                           ; preds = %normal1039
  call void @overflow_fail(i32 2775)
  br label %normal1045

normal1045:                                       ; preds = %of1044, %normal1039
  %add1049 = phi i64 [ %fst1047, %of1044 ], [ %fst1047, %normal1039 ]
  %result1052 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %add1049)
  %fst1053 = extractvalue { i64, i1 } %result1052, 0
  %snd1054 = extractvalue { i64, i1 } %result1052, 1
  br i1 %snd1054, label %of1050, label %normal1051

of1050:                                           ; preds = %normal1045
  call void @overflow_fail(i32 2769)
  br label %normal1051

normal1051:                                       ; preds = %of1050, %normal1045
  %add1055 = phi i64 [ %fst1053, %of1050 ], [ %fst1053, %normal1045 ]
  %result1058 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %add1055)
  %fst1059 = extractvalue { i64, i1 } %result1058, 0
  %snd1060 = extractvalue { i64, i1 } %result1058, 1
  br i1 %snd1060, label %of1056, label %normal1057

of1056:                                           ; preds = %normal1051
  call void @overflow_fail(i32 2763)
  br label %normal1057

normal1057:                                       ; preds = %of1056, %normal1051
  %add1061 = phi i64 [ %fst1059, %of1056 ], [ %fst1059, %normal1051 ]
  %result1064 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %add1061)
  %fst1065 = extractvalue { i64, i1 } %result1064, 0
  %snd1066 = extractvalue { i64, i1 } %result1064, 1
  br i1 %snd1066, label %of1062, label %normal1063

of1062:                                           ; preds = %normal1057
  call void @overflow_fail(i32 2757)
  br label %normal1063

normal1063:                                       ; preds = %of1062, %normal1057
  %add1067 = phi i64 [ %fst1065, %of1062 ], [ %fst1065, %normal1057 ]
  %result1070 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 19, i64 %add1067)
  %fst1071 = extractvalue { i64, i1 } %result1070, 0
  %snd1072 = extractvalue { i64, i1 } %result1070, 1
  br i1 %snd1072, label %of1068, label %normal1069

of1068:                                           ; preds = %normal1063
  call void @overflow_fail(i32 2751)
  br label %normal1069

normal1069:                                       ; preds = %of1068, %normal1063
  %add1073 = phi i64 [ %fst1071, %of1068 ], [ %fst1071, %normal1063 ]
  br label %ifcont1192

else1074:                                         ; preds = %else963
  %eq1075 = icmp eq i64 %0, 20
  br i1 %eq1075, label %then1076, label %else1191

then1076:                                         ; preds = %else1074
  %result1079 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %fst1080 = extractvalue { i64, i1 } %result1079, 0
  %snd1081 = extractvalue { i64, i1 } %result1079, 1
  br i1 %snd1081, label %of1077, label %normal1078

of1077:                                           ; preds = %then1076
  call void @overflow_fail(i32 3143)
  br label %normal1078

normal1078:                                       ; preds = %of1077, %then1076
  %add1082 = phi i64 [ %fst1080, %of1077 ], [ %fst1080, %then1076 ]
  %result1085 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %add1082)
  %fst1086 = extractvalue { i64, i1 } %result1085, 0
  %snd1087 = extractvalue { i64, i1 } %result1085, 1
  br i1 %snd1087, label %of1083, label %normal1084

of1083:                                           ; preds = %normal1078
  call void @overflow_fail(i32 3138)
  br label %normal1084

normal1084:                                       ; preds = %of1083, %normal1078
  %add1088 = phi i64 [ %fst1086, %of1083 ], [ %fst1086, %normal1078 ]
  %result1091 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %add1088)
  %fst1092 = extractvalue { i64, i1 } %result1091, 0
  %snd1093 = extractvalue { i64, i1 } %result1091, 1
  br i1 %snd1093, label %of1089, label %normal1090

of1089:                                           ; preds = %normal1084
  call void @overflow_fail(i32 3133)
  br label %normal1090

normal1090:                                       ; preds = %of1089, %normal1084
  %add1094 = phi i64 [ %fst1092, %of1089 ], [ %fst1092, %normal1084 ]
  %result1097 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %add1094)
  %fst1098 = extractvalue { i64, i1 } %result1097, 0
  %snd1099 = extractvalue { i64, i1 } %result1097, 1
  br i1 %snd1099, label %of1095, label %normal1096

of1095:                                           ; preds = %normal1090
  call void @overflow_fail(i32 3128)
  br label %normal1096

normal1096:                                       ; preds = %of1095, %normal1090
  %add1100 = phi i64 [ %fst1098, %of1095 ], [ %fst1098, %normal1090 ]
  %result1103 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %add1100)
  %fst1104 = extractvalue { i64, i1 } %result1103, 0
  %snd1105 = extractvalue { i64, i1 } %result1103, 1
  br i1 %snd1105, label %of1101, label %normal1102

of1101:                                           ; preds = %normal1096
  call void @overflow_fail(i32 3123)
  br label %normal1102

normal1102:                                       ; preds = %of1101, %normal1096
  %add1106 = phi i64 [ %fst1104, %of1101 ], [ %fst1104, %normal1096 ]
  %result1109 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %add1106)
  %fst1110 = extractvalue { i64, i1 } %result1109, 0
  %snd1111 = extractvalue { i64, i1 } %result1109, 1
  br i1 %snd1111, label %of1107, label %normal1108

of1107:                                           ; preds = %normal1102
  call void @overflow_fail(i32 3118)
  br label %normal1108

normal1108:                                       ; preds = %of1107, %normal1102
  %add1112 = phi i64 [ %fst1110, %of1107 ], [ %fst1110, %normal1102 ]
  %result1115 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %add1112)
  %fst1116 = extractvalue { i64, i1 } %result1115, 0
  %snd1117 = extractvalue { i64, i1 } %result1115, 1
  br i1 %snd1117, label %of1113, label %normal1114

of1113:                                           ; preds = %normal1108
  call void @overflow_fail(i32 3113)
  br label %normal1114

normal1114:                                       ; preds = %of1113, %normal1108
  %add1118 = phi i64 [ %fst1116, %of1113 ], [ %fst1116, %normal1108 ]
  %result1121 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %add1118)
  %fst1122 = extractvalue { i64, i1 } %result1121, 0
  %snd1123 = extractvalue { i64, i1 } %result1121, 1
  br i1 %snd1123, label %of1119, label %normal1120

of1119:                                           ; preds = %normal1114
  call void @overflow_fail(i32 3108)
  br label %normal1120

normal1120:                                       ; preds = %of1119, %normal1114
  %add1124 = phi i64 [ %fst1122, %of1119 ], [ %fst1122, %normal1114 ]
  %result1127 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %add1124)
  %fst1128 = extractvalue { i64, i1 } %result1127, 0
  %snd1129 = extractvalue { i64, i1 } %result1127, 1
  br i1 %snd1129, label %of1125, label %normal1126

of1125:                                           ; preds = %normal1120
  call void @overflow_fail(i32 3102)
  br label %normal1126

normal1126:                                       ; preds = %of1125, %normal1120
  %add1130 = phi i64 [ %fst1128, %of1125 ], [ %fst1128, %normal1120 ]
  %result1133 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %add1130)
  %fst1134 = extractvalue { i64, i1 } %result1133, 0
  %snd1135 = extractvalue { i64, i1 } %result1133, 1
  br i1 %snd1135, label %of1131, label %normal1132

of1131:                                           ; preds = %normal1126
  call void @overflow_fail(i32 3096)
  br label %normal1132

normal1132:                                       ; preds = %of1131, %normal1126
  %add1136 = phi i64 [ %fst1134, %of1131 ], [ %fst1134, %normal1126 ]
  %result1139 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %add1136)
  %fst1140 = extractvalue { i64, i1 } %result1139, 0
  %snd1141 = extractvalue { i64, i1 } %result1139, 1
  br i1 %snd1141, label %of1137, label %normal1138

of1137:                                           ; preds = %normal1132
  call void @overflow_fail(i32 3090)
  br label %normal1138

normal1138:                                       ; preds = %of1137, %normal1132
  %add1142 = phi i64 [ %fst1140, %of1137 ], [ %fst1140, %normal1132 ]
  %result1145 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %add1142)
  %fst1146 = extractvalue { i64, i1 } %result1145, 0
  %snd1147 = extractvalue { i64, i1 } %result1145, 1
  br i1 %snd1147, label %of1143, label %normal1144

of1143:                                           ; preds = %normal1138
  call void @overflow_fail(i32 3084)
  br label %normal1144

normal1144:                                       ; preds = %of1143, %normal1138
  %add1148 = phi i64 [ %fst1146, %of1143 ], [ %fst1146, %normal1138 ]
  %result1151 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %add1148)
  %fst1152 = extractvalue { i64, i1 } %result1151, 0
  %snd1153 = extractvalue { i64, i1 } %result1151, 1
  br i1 %snd1153, label %of1149, label %normal1150

of1149:                                           ; preds = %normal1144
  call void @overflow_fail(i32 3078)
  br label %normal1150

normal1150:                                       ; preds = %of1149, %normal1144
  %add1154 = phi i64 [ %fst1152, %of1149 ], [ %fst1152, %normal1144 ]
  %result1157 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %add1154)
  %fst1158 = extractvalue { i64, i1 } %result1157, 0
  %snd1159 = extractvalue { i64, i1 } %result1157, 1
  br i1 %snd1159, label %of1155, label %normal1156

of1155:                                           ; preds = %normal1150
  call void @overflow_fail(i32 3072)
  br label %normal1156

normal1156:                                       ; preds = %of1155, %normal1150
  %add1160 = phi i64 [ %fst1158, %of1155 ], [ %fst1158, %normal1150 ]
  %result1163 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %add1160)
  %fst1164 = extractvalue { i64, i1 } %result1163, 0
  %snd1165 = extractvalue { i64, i1 } %result1163, 1
  br i1 %snd1165, label %of1161, label %normal1162

of1161:                                           ; preds = %normal1156
  call void @overflow_fail(i32 3066)
  br label %normal1162

normal1162:                                       ; preds = %of1161, %normal1156
  %add1166 = phi i64 [ %fst1164, %of1161 ], [ %fst1164, %normal1156 ]
  %result1169 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %add1166)
  %fst1170 = extractvalue { i64, i1 } %result1169, 0
  %snd1171 = extractvalue { i64, i1 } %result1169, 1
  br i1 %snd1171, label %of1167, label %normal1168

of1167:                                           ; preds = %normal1162
  call void @overflow_fail(i32 3060)
  br label %normal1168

normal1168:                                       ; preds = %of1167, %normal1162
  %add1172 = phi i64 [ %fst1170, %of1167 ], [ %fst1170, %normal1162 ]
  %result1175 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %add1172)
  %fst1176 = extractvalue { i64, i1 } %result1175, 0
  %snd1177 = extractvalue { i64, i1 } %result1175, 1
  br i1 %snd1177, label %of1173, label %normal1174

of1173:                                           ; preds = %normal1168
  call void @overflow_fail(i32 3054)
  br label %normal1174

normal1174:                                       ; preds = %of1173, %normal1168
  %add1178 = phi i64 [ %fst1176, %of1173 ], [ %fst1176, %normal1168 ]
  %result1181 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 19, i64 %add1178)
  %fst1182 = extractvalue { i64, i1 } %result1181, 0
  %snd1183 = extractvalue { i64, i1 } %result1181, 1
  br i1 %snd1183, label %of1179, label %normal1180

of1179:                                           ; preds = %normal1174
  call void @overflow_fail(i32 3048)
  br label %normal1180

normal1180:                                       ; preds = %of1179, %normal1174
  %add1184 = phi i64 [ %fst1182, %of1179 ], [ %fst1182, %normal1174 ]
  %result1187 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 20, i64 %add1184)
  %fst1188 = extractvalue { i64, i1 } %result1187, 0
  %snd1189 = extractvalue { i64, i1 } %result1187, 1
  br i1 %snd1189, label %of1185, label %normal1186

of1185:                                           ; preds = %normal1180
  call void @overflow_fail(i32 3042)
  br label %normal1186

normal1186:                                       ; preds = %of1185, %normal1180
  %add1190 = phi i64 [ %fst1188, %of1185 ], [ %fst1188, %normal1180 ]
  br label %ifcont

else1191:                                         ; preds = %else1074
  br label %ifcont

ifcont:                                           ; preds = %else1191, %normal1186
  %iftmp = phi i64 [ %add1190, %normal1186 ], [ -1, %else1191 ]
  br label %ifcont1192

ifcont1192:                                       ; preds = %ifcont, %normal1069
  %iftmp1193 = phi i64 [ %add1073, %normal1069 ], [ %iftmp, %ifcont ]
  br label %ifcont1194

ifcont1194:                                       ; preds = %ifcont1192, %normal958
  %iftmp1195 = phi i64 [ %add962, %normal958 ], [ %iftmp1193, %ifcont1192 ]
  br label %ifcont1196

ifcont1196:                                       ; preds = %ifcont1194, %normal853
  %iftmp1197 = phi i64 [ %add857, %normal853 ], [ %iftmp1195, %ifcont1194 ]
  br label %ifcont1198

ifcont1198:                                       ; preds = %ifcont1196, %normal754
  %iftmp1199 = phi i64 [ %add758, %normal754 ], [ %iftmp1197, %ifcont1196 ]
  br label %ifcont1200

ifcont1200:                                       ; preds = %ifcont1198, %normal661
  %iftmp1201 = phi i64 [ %add665, %normal661 ], [ %iftmp1199, %ifcont1198 ]
  br label %ifcont1202

ifcont1202:                                       ; preds = %ifcont1200, %normal574
  %iftmp1203 = phi i64 [ %add578, %normal574 ], [ %iftmp1201, %ifcont1200 ]
  br label %ifcont1204

ifcont1204:                                       ; preds = %ifcont1202, %normal493
  %iftmp1205 = phi i64 [ %add497, %normal493 ], [ %iftmp1203, %ifcont1202 ]
  br label %ifcont1206

ifcont1206:                                       ; preds = %ifcont1204, %normal418
  %iftmp1207 = phi i64 [ %add422, %normal418 ], [ %iftmp1205, %ifcont1204 ]
  br label %ifcont1208

ifcont1208:                                       ; preds = %ifcont1206, %normal349
  %iftmp1209 = phi i64 [ %add353, %normal349 ], [ %iftmp1207, %ifcont1206 ]
  br label %ifcont1210

ifcont1210:                                       ; preds = %ifcont1208, %normal286
  %iftmp1211 = phi i64 [ %add290, %normal286 ], [ %iftmp1209, %ifcont1208 ]
  br label %ifcont1212

ifcont1212:                                       ; preds = %ifcont1210, %normal229
  %iftmp1213 = phi i64 [ %add233, %normal229 ], [ %iftmp1211, %ifcont1210 ]
  br label %ifcont1214

ifcont1214:                                       ; preds = %ifcont1212, %normal178
  %iftmp1215 = phi i64 [ %add182, %normal178 ], [ %iftmp1213, %ifcont1212 ]
  br label %ifcont1216

ifcont1216:                                       ; preds = %ifcont1214, %normal133
  %iftmp1217 = phi i64 [ %add137, %normal133 ], [ %iftmp1215, %ifcont1214 ]
  br label %ifcont1218

ifcont1218:                                       ; preds = %ifcont1216, %normal94
  %iftmp1219 = phi i64 [ %add98, %normal94 ], [ %iftmp1217, %ifcont1216 ]
  br label %ifcont1220

ifcont1220:                                       ; preds = %ifcont1218, %normal61
  %iftmp1221 = phi i64 [ %add65, %normal61 ], [ %iftmp1219, %ifcont1218 ]
  br label %ifcont1222

ifcont1222:                                       ; preds = %ifcont1220, %normal34
  %iftmp1223 = phi i64 [ %add38, %normal34 ], [ %iftmp1221, %ifcont1220 ]
  br label %ifcont1224

ifcont1224:                                       ; preds = %ifcont1222, %normal13
  %iftmp1225 = phi i64 [ %add17, %normal13 ], [ %iftmp1223, %ifcont1222 ]
  br label %ifcont1226

ifcont1226:                                       ; preds = %ifcont1224, %normal
  %iftmp1227 = phi i64 [ %add, %normal ], [ %iftmp1225, %ifcont1224 ]
  br label %ifcont1228

ifcont1228:                                       ; preds = %ifcont1226, %then
  %iftmp1229 = phi i64 [ 1, %then ], [ %iftmp1227, %ifcont1226 ]
  ret i64 %iftmp1229
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
