; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

declare i64 @overflow_fail(i64)

define i64 @f(i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5) {
entry:
  %m9 = alloca i64
  %m8 = alloca i64
  %m7 = alloca i64
  %m6 = alloca i64
  %m5 = alloca i64
  %m4 = alloca i64
  %m3 = alloca i64
  %m2 = alloca i64
  %m1 = alloca i64
  %m0 = alloca i64
  store i64 0, i64* %m0
  store i64 0, i64* %m1
  store i64 0, i64* %m2
  store i64 0, i64* %m3
  store i64 0, i64* %m4
  store i64 0, i64* %m5
  store i64 0, i64* %m6
  store i64 0, i64* %m7
  store i64 0, i64* %m8
  store i64 0, i64* %m9
  %eqtmp = icmp eq i64 %a0, 1
  %0 = icmp eq i1 %eqtmp, true
  br i1 %0, label %then, label %else

then:                                             ; preds = %entry
  br label %1749

else:                                             ; preds = %entry
  %eqtmp1 = icmp eq i64 %a0, 2
  %1 = icmp eq i1 %eqtmp1, true
  br i1 %1, label %then2, label %else3

then2:                                            ; preds = %else
  %2 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %3 = extractvalue { i64, i1 } %2, 0
  %4 = extractvalue { i64, i1 } %2, 1
  %5 = icmp eq i1 %4, true
  br i1 %5, label %6, label %8

; <label>:6:                                      ; preds = %then2
  %7 = call i64 @overflow_fail(i64 86)
  br label %9

; <label>:8:                                      ; preds = %then2
  br label %9

; <label>:9:                                      ; preds = %8, %6
  %10 = phi i64 [ %3, %6 ], [ %3, %8 ]
  br label %1748

else3:                                            ; preds = %else
  %eqtmp4 = icmp eq i64 %a0, 3
  %11 = icmp eq i1 %eqtmp4, true
  br i1 %11, label %then5, label %else6

then5:                                            ; preds = %else3
  %12 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  %15 = icmp eq i1 %14, true
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %then5
  %17 = call i64 @overflow_fail(i64 133)
  br label %19

; <label>:18:                                     ; preds = %then5
  br label %19

; <label>:19:                                     ; preds = %18, %16
  %20 = phi i64 [ %13, %16 ], [ %13, %18 ]
  %21 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %20)
  %22 = extractvalue { i64, i1 } %21, 0
  %23 = extractvalue { i64, i1 } %21, 1
  %24 = icmp eq i1 %23, true
  br i1 %24, label %25, label %27

; <label>:25:                                     ; preds = %19
  %26 = call i64 @overflow_fail(i64 133)
  br label %28

; <label>:27:                                     ; preds = %19
  br label %28

; <label>:28:                                     ; preds = %27, %25
  %29 = phi i64 [ %22, %25 ], [ %22, %27 ]
  br label %1747

else6:                                            ; preds = %else3
  %eqtmp7 = icmp eq i64 %a0, 4
  %30 = icmp eq i1 %eqtmp7, true
  br i1 %30, label %then8, label %else9

then8:                                            ; preds = %else6
  %31 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %32 = extractvalue { i64, i1 } %31, 0
  %33 = extractvalue { i64, i1 } %31, 1
  %34 = icmp eq i1 %33, true
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %then8
  %36 = call i64 @overflow_fail(i64 194)
  br label %38

; <label>:37:                                     ; preds = %then8
  br label %38

; <label>:38:                                     ; preds = %37, %35
  %39 = phi i64 [ %32, %35 ], [ %32, %37 ]
  %40 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %39)
  %41 = extractvalue { i64, i1 } %40, 0
  %42 = extractvalue { i64, i1 } %40, 1
  %43 = icmp eq i1 %42, true
  br i1 %43, label %44, label %46

; <label>:44:                                     ; preds = %38
  %45 = call i64 @overflow_fail(i64 194)
  br label %47

; <label>:46:                                     ; preds = %38
  br label %47

; <label>:47:                                     ; preds = %46, %44
  %48 = phi i64 [ %41, %44 ], [ %41, %46 ]
  %49 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %48)
  %50 = extractvalue { i64, i1 } %49, 0
  %51 = extractvalue { i64, i1 } %49, 1
  %52 = icmp eq i1 %51, true
  br i1 %52, label %53, label %55

; <label>:53:                                     ; preds = %47
  %54 = call i64 @overflow_fail(i64 194)
  br label %56

; <label>:55:                                     ; preds = %47
  br label %56

; <label>:56:                                     ; preds = %55, %53
  %57 = phi i64 [ %50, %53 ], [ %50, %55 ]
  br label %1746

else9:                                            ; preds = %else6
  %eqtmp10 = icmp eq i64 %a0, 5
  %58 = icmp eq i1 %eqtmp10, true
  br i1 %58, label %then11, label %else12

then11:                                           ; preds = %else9
  %59 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %60 = extractvalue { i64, i1 } %59, 0
  %61 = extractvalue { i64, i1 } %59, 1
  %62 = icmp eq i1 %61, true
  br i1 %62, label %63, label %65

; <label>:63:                                     ; preds = %then11
  %64 = call i64 @overflow_fail(i64 269)
  br label %66

; <label>:65:                                     ; preds = %then11
  br label %66

; <label>:66:                                     ; preds = %65, %63
  %67 = phi i64 [ %60, %63 ], [ %60, %65 ]
  %68 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %67)
  %69 = extractvalue { i64, i1 } %68, 0
  %70 = extractvalue { i64, i1 } %68, 1
  %71 = icmp eq i1 %70, true
  br i1 %71, label %72, label %74

; <label>:72:                                     ; preds = %66
  %73 = call i64 @overflow_fail(i64 269)
  br label %75

; <label>:74:                                     ; preds = %66
  br label %75

; <label>:75:                                     ; preds = %74, %72
  %76 = phi i64 [ %69, %72 ], [ %69, %74 ]
  %77 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %76)
  %78 = extractvalue { i64, i1 } %77, 0
  %79 = extractvalue { i64, i1 } %77, 1
  %80 = icmp eq i1 %79, true
  br i1 %80, label %81, label %83

; <label>:81:                                     ; preds = %75
  %82 = call i64 @overflow_fail(i64 269)
  br label %84

; <label>:83:                                     ; preds = %75
  br label %84

; <label>:84:                                     ; preds = %83, %81
  %85 = phi i64 [ %78, %81 ], [ %78, %83 ]
  %86 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %85)
  %87 = extractvalue { i64, i1 } %86, 0
  %88 = extractvalue { i64, i1 } %86, 1
  %89 = icmp eq i1 %88, true
  br i1 %89, label %90, label %92

; <label>:90:                                     ; preds = %84
  %91 = call i64 @overflow_fail(i64 269)
  br label %93

; <label>:92:                                     ; preds = %84
  br label %93

; <label>:93:                                     ; preds = %92, %90
  %94 = phi i64 [ %87, %90 ], [ %87, %92 ]
  br label %1745

else12:                                           ; preds = %else9
  %eqtmp13 = icmp eq i64 %a0, 6
  %95 = icmp eq i1 %eqtmp13, true
  br i1 %95, label %then14, label %else15

then14:                                           ; preds = %else12
  %96 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %97 = extractvalue { i64, i1 } %96, 0
  %98 = extractvalue { i64, i1 } %96, 1
  %99 = icmp eq i1 %98, true
  br i1 %99, label %100, label %102

; <label>:100:                                    ; preds = %then14
  %101 = call i64 @overflow_fail(i64 358)
  br label %103

; <label>:102:                                    ; preds = %then14
  br label %103

; <label>:103:                                    ; preds = %102, %100
  %104 = phi i64 [ %97, %100 ], [ %97, %102 ]
  %105 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %104)
  %106 = extractvalue { i64, i1 } %105, 0
  %107 = extractvalue { i64, i1 } %105, 1
  %108 = icmp eq i1 %107, true
  br i1 %108, label %109, label %111

; <label>:109:                                    ; preds = %103
  %110 = call i64 @overflow_fail(i64 358)
  br label %112

; <label>:111:                                    ; preds = %103
  br label %112

; <label>:112:                                    ; preds = %111, %109
  %113 = phi i64 [ %106, %109 ], [ %106, %111 ]
  %114 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %113)
  %115 = extractvalue { i64, i1 } %114, 0
  %116 = extractvalue { i64, i1 } %114, 1
  %117 = icmp eq i1 %116, true
  br i1 %117, label %118, label %120

; <label>:118:                                    ; preds = %112
  %119 = call i64 @overflow_fail(i64 358)
  br label %121

; <label>:120:                                    ; preds = %112
  br label %121

; <label>:121:                                    ; preds = %120, %118
  %122 = phi i64 [ %115, %118 ], [ %115, %120 ]
  %123 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %122)
  %124 = extractvalue { i64, i1 } %123, 0
  %125 = extractvalue { i64, i1 } %123, 1
  %126 = icmp eq i1 %125, true
  br i1 %126, label %127, label %129

; <label>:127:                                    ; preds = %121
  %128 = call i64 @overflow_fail(i64 358)
  br label %130

; <label>:129:                                    ; preds = %121
  br label %130

; <label>:130:                                    ; preds = %129, %127
  %131 = phi i64 [ %124, %127 ], [ %124, %129 ]
  %132 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %131)
  %133 = extractvalue { i64, i1 } %132, 0
  %134 = extractvalue { i64, i1 } %132, 1
  %135 = icmp eq i1 %134, true
  br i1 %135, label %136, label %138

; <label>:136:                                    ; preds = %130
  %137 = call i64 @overflow_fail(i64 358)
  br label %139

; <label>:138:                                    ; preds = %130
  br label %139

; <label>:139:                                    ; preds = %138, %136
  %140 = phi i64 [ %133, %136 ], [ %133, %138 ]
  br label %1744

else15:                                           ; preds = %else12
  %eqtmp16 = icmp eq i64 %a0, 7
  %141 = icmp eq i1 %eqtmp16, true
  br i1 %141, label %then17, label %else18

then17:                                           ; preds = %else15
  %142 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %143 = extractvalue { i64, i1 } %142, 0
  %144 = extractvalue { i64, i1 } %142, 1
  %145 = icmp eq i1 %144, true
  br i1 %145, label %146, label %148

; <label>:146:                                    ; preds = %then17
  %147 = call i64 @overflow_fail(i64 461)
  br label %149

; <label>:148:                                    ; preds = %then17
  br label %149

; <label>:149:                                    ; preds = %148, %146
  %150 = phi i64 [ %143, %146 ], [ %143, %148 ]
  %151 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %150)
  %152 = extractvalue { i64, i1 } %151, 0
  %153 = extractvalue { i64, i1 } %151, 1
  %154 = icmp eq i1 %153, true
  br i1 %154, label %155, label %157

; <label>:155:                                    ; preds = %149
  %156 = call i64 @overflow_fail(i64 461)
  br label %158

; <label>:157:                                    ; preds = %149
  br label %158

; <label>:158:                                    ; preds = %157, %155
  %159 = phi i64 [ %152, %155 ], [ %152, %157 ]
  %160 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %159)
  %161 = extractvalue { i64, i1 } %160, 0
  %162 = extractvalue { i64, i1 } %160, 1
  %163 = icmp eq i1 %162, true
  br i1 %163, label %164, label %166

; <label>:164:                                    ; preds = %158
  %165 = call i64 @overflow_fail(i64 461)
  br label %167

; <label>:166:                                    ; preds = %158
  br label %167

; <label>:167:                                    ; preds = %166, %164
  %168 = phi i64 [ %161, %164 ], [ %161, %166 ]
  %169 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %168)
  %170 = extractvalue { i64, i1 } %169, 0
  %171 = extractvalue { i64, i1 } %169, 1
  %172 = icmp eq i1 %171, true
  br i1 %172, label %173, label %175

; <label>:173:                                    ; preds = %167
  %174 = call i64 @overflow_fail(i64 461)
  br label %176

; <label>:175:                                    ; preds = %167
  br label %176

; <label>:176:                                    ; preds = %175, %173
  %177 = phi i64 [ %170, %173 ], [ %170, %175 ]
  %178 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %177)
  %179 = extractvalue { i64, i1 } %178, 0
  %180 = extractvalue { i64, i1 } %178, 1
  %181 = icmp eq i1 %180, true
  br i1 %181, label %182, label %184

; <label>:182:                                    ; preds = %176
  %183 = call i64 @overflow_fail(i64 461)
  br label %185

; <label>:184:                                    ; preds = %176
  br label %185

; <label>:185:                                    ; preds = %184, %182
  %186 = phi i64 [ %179, %182 ], [ %179, %184 ]
  %187 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %186)
  %188 = extractvalue { i64, i1 } %187, 0
  %189 = extractvalue { i64, i1 } %187, 1
  %190 = icmp eq i1 %189, true
  br i1 %190, label %191, label %193

; <label>:191:                                    ; preds = %185
  %192 = call i64 @overflow_fail(i64 461)
  br label %194

; <label>:193:                                    ; preds = %185
  br label %194

; <label>:194:                                    ; preds = %193, %191
  %195 = phi i64 [ %188, %191 ], [ %188, %193 ]
  br label %1743

else18:                                           ; preds = %else15
  %eqtmp19 = icmp eq i64 %a0, 8
  %196 = icmp eq i1 %eqtmp19, true
  br i1 %196, label %then20, label %else21

then20:                                           ; preds = %else18
  %197 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %198 = extractvalue { i64, i1 } %197, 0
  %199 = extractvalue { i64, i1 } %197, 1
  %200 = icmp eq i1 %199, true
  br i1 %200, label %201, label %203

; <label>:201:                                    ; preds = %then20
  %202 = call i64 @overflow_fail(i64 578)
  br label %204

; <label>:203:                                    ; preds = %then20
  br label %204

; <label>:204:                                    ; preds = %203, %201
  %205 = phi i64 [ %198, %201 ], [ %198, %203 ]
  %206 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %205)
  %207 = extractvalue { i64, i1 } %206, 0
  %208 = extractvalue { i64, i1 } %206, 1
  %209 = icmp eq i1 %208, true
  br i1 %209, label %210, label %212

; <label>:210:                                    ; preds = %204
  %211 = call i64 @overflow_fail(i64 578)
  br label %213

; <label>:212:                                    ; preds = %204
  br label %213

; <label>:213:                                    ; preds = %212, %210
  %214 = phi i64 [ %207, %210 ], [ %207, %212 ]
  %215 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %214)
  %216 = extractvalue { i64, i1 } %215, 0
  %217 = extractvalue { i64, i1 } %215, 1
  %218 = icmp eq i1 %217, true
  br i1 %218, label %219, label %221

; <label>:219:                                    ; preds = %213
  %220 = call i64 @overflow_fail(i64 578)
  br label %222

; <label>:221:                                    ; preds = %213
  br label %222

; <label>:222:                                    ; preds = %221, %219
  %223 = phi i64 [ %216, %219 ], [ %216, %221 ]
  %224 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %223)
  %225 = extractvalue { i64, i1 } %224, 0
  %226 = extractvalue { i64, i1 } %224, 1
  %227 = icmp eq i1 %226, true
  br i1 %227, label %228, label %230

; <label>:228:                                    ; preds = %222
  %229 = call i64 @overflow_fail(i64 578)
  br label %231

; <label>:230:                                    ; preds = %222
  br label %231

; <label>:231:                                    ; preds = %230, %228
  %232 = phi i64 [ %225, %228 ], [ %225, %230 ]
  %233 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %232)
  %234 = extractvalue { i64, i1 } %233, 0
  %235 = extractvalue { i64, i1 } %233, 1
  %236 = icmp eq i1 %235, true
  br i1 %236, label %237, label %239

; <label>:237:                                    ; preds = %231
  %238 = call i64 @overflow_fail(i64 578)
  br label %240

; <label>:239:                                    ; preds = %231
  br label %240

; <label>:240:                                    ; preds = %239, %237
  %241 = phi i64 [ %234, %237 ], [ %234, %239 ]
  %242 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %241)
  %243 = extractvalue { i64, i1 } %242, 0
  %244 = extractvalue { i64, i1 } %242, 1
  %245 = icmp eq i1 %244, true
  br i1 %245, label %246, label %248

; <label>:246:                                    ; preds = %240
  %247 = call i64 @overflow_fail(i64 578)
  br label %249

; <label>:248:                                    ; preds = %240
  br label %249

; <label>:249:                                    ; preds = %248, %246
  %250 = phi i64 [ %243, %246 ], [ %243, %248 ]
  %251 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %250)
  %252 = extractvalue { i64, i1 } %251, 0
  %253 = extractvalue { i64, i1 } %251, 1
  %254 = icmp eq i1 %253, true
  br i1 %254, label %255, label %257

; <label>:255:                                    ; preds = %249
  %256 = call i64 @overflow_fail(i64 578)
  br label %258

; <label>:257:                                    ; preds = %249
  br label %258

; <label>:258:                                    ; preds = %257, %255
  %259 = phi i64 [ %252, %255 ], [ %252, %257 ]
  br label %1742

else21:                                           ; preds = %else18
  %eqtmp22 = icmp eq i64 %a0, 9
  %260 = icmp eq i1 %eqtmp22, true
  br i1 %260, label %then23, label %else24

then23:                                           ; preds = %else21
  %261 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %262 = extractvalue { i64, i1 } %261, 0
  %263 = extractvalue { i64, i1 } %261, 1
  %264 = icmp eq i1 %263, true
  br i1 %264, label %265, label %267

; <label>:265:                                    ; preds = %then23
  %266 = call i64 @overflow_fail(i64 709)
  br label %268

; <label>:267:                                    ; preds = %then23
  br label %268

; <label>:268:                                    ; preds = %267, %265
  %269 = phi i64 [ %262, %265 ], [ %262, %267 ]
  %270 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %269)
  %271 = extractvalue { i64, i1 } %270, 0
  %272 = extractvalue { i64, i1 } %270, 1
  %273 = icmp eq i1 %272, true
  br i1 %273, label %274, label %276

; <label>:274:                                    ; preds = %268
  %275 = call i64 @overflow_fail(i64 709)
  br label %277

; <label>:276:                                    ; preds = %268
  br label %277

; <label>:277:                                    ; preds = %276, %274
  %278 = phi i64 [ %271, %274 ], [ %271, %276 ]
  %279 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %278)
  %280 = extractvalue { i64, i1 } %279, 0
  %281 = extractvalue { i64, i1 } %279, 1
  %282 = icmp eq i1 %281, true
  br i1 %282, label %283, label %285

; <label>:283:                                    ; preds = %277
  %284 = call i64 @overflow_fail(i64 709)
  br label %286

; <label>:285:                                    ; preds = %277
  br label %286

; <label>:286:                                    ; preds = %285, %283
  %287 = phi i64 [ %280, %283 ], [ %280, %285 ]
  %288 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %287)
  %289 = extractvalue { i64, i1 } %288, 0
  %290 = extractvalue { i64, i1 } %288, 1
  %291 = icmp eq i1 %290, true
  br i1 %291, label %292, label %294

; <label>:292:                                    ; preds = %286
  %293 = call i64 @overflow_fail(i64 709)
  br label %295

; <label>:294:                                    ; preds = %286
  br label %295

; <label>:295:                                    ; preds = %294, %292
  %296 = phi i64 [ %289, %292 ], [ %289, %294 ]
  %297 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %296)
  %298 = extractvalue { i64, i1 } %297, 0
  %299 = extractvalue { i64, i1 } %297, 1
  %300 = icmp eq i1 %299, true
  br i1 %300, label %301, label %303

; <label>:301:                                    ; preds = %295
  %302 = call i64 @overflow_fail(i64 709)
  br label %304

; <label>:303:                                    ; preds = %295
  br label %304

; <label>:304:                                    ; preds = %303, %301
  %305 = phi i64 [ %298, %301 ], [ %298, %303 ]
  %306 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %305)
  %307 = extractvalue { i64, i1 } %306, 0
  %308 = extractvalue { i64, i1 } %306, 1
  %309 = icmp eq i1 %308, true
  br i1 %309, label %310, label %312

; <label>:310:                                    ; preds = %304
  %311 = call i64 @overflow_fail(i64 709)
  br label %313

; <label>:312:                                    ; preds = %304
  br label %313

; <label>:313:                                    ; preds = %312, %310
  %314 = phi i64 [ %307, %310 ], [ %307, %312 ]
  %315 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %314)
  %316 = extractvalue { i64, i1 } %315, 0
  %317 = extractvalue { i64, i1 } %315, 1
  %318 = icmp eq i1 %317, true
  br i1 %318, label %319, label %321

; <label>:319:                                    ; preds = %313
  %320 = call i64 @overflow_fail(i64 709)
  br label %322

; <label>:321:                                    ; preds = %313
  br label %322

; <label>:322:                                    ; preds = %321, %319
  %323 = phi i64 [ %316, %319 ], [ %316, %321 ]
  %324 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %323)
  %325 = extractvalue { i64, i1 } %324, 0
  %326 = extractvalue { i64, i1 } %324, 1
  %327 = icmp eq i1 %326, true
  br i1 %327, label %328, label %330

; <label>:328:                                    ; preds = %322
  %329 = call i64 @overflow_fail(i64 709)
  br label %331

; <label>:330:                                    ; preds = %322
  br label %331

; <label>:331:                                    ; preds = %330, %328
  %332 = phi i64 [ %325, %328 ], [ %325, %330 ]
  br label %1741

else24:                                           ; preds = %else21
  %eqtmp25 = icmp eq i64 %a0, 10
  %333 = icmp eq i1 %eqtmp25, true
  br i1 %333, label %then26, label %else27

then26:                                           ; preds = %else24
  %334 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %335 = extractvalue { i64, i1 } %334, 0
  %336 = extractvalue { i64, i1 } %334, 1
  %337 = icmp eq i1 %336, true
  br i1 %337, label %338, label %340

; <label>:338:                                    ; preds = %then26
  %339 = call i64 @overflow_fail(i64 856)
  br label %341

; <label>:340:                                    ; preds = %then26
  br label %341

; <label>:341:                                    ; preds = %340, %338
  %342 = phi i64 [ %335, %338 ], [ %335, %340 ]
  %343 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %342)
  %344 = extractvalue { i64, i1 } %343, 0
  %345 = extractvalue { i64, i1 } %343, 1
  %346 = icmp eq i1 %345, true
  br i1 %346, label %347, label %349

; <label>:347:                                    ; preds = %341
  %348 = call i64 @overflow_fail(i64 856)
  br label %350

; <label>:349:                                    ; preds = %341
  br label %350

; <label>:350:                                    ; preds = %349, %347
  %351 = phi i64 [ %344, %347 ], [ %344, %349 ]
  %352 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %351)
  %353 = extractvalue { i64, i1 } %352, 0
  %354 = extractvalue { i64, i1 } %352, 1
  %355 = icmp eq i1 %354, true
  br i1 %355, label %356, label %358

; <label>:356:                                    ; preds = %350
  %357 = call i64 @overflow_fail(i64 856)
  br label %359

; <label>:358:                                    ; preds = %350
  br label %359

; <label>:359:                                    ; preds = %358, %356
  %360 = phi i64 [ %353, %356 ], [ %353, %358 ]
  %361 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %360)
  %362 = extractvalue { i64, i1 } %361, 0
  %363 = extractvalue { i64, i1 } %361, 1
  %364 = icmp eq i1 %363, true
  br i1 %364, label %365, label %367

; <label>:365:                                    ; preds = %359
  %366 = call i64 @overflow_fail(i64 856)
  br label %368

; <label>:367:                                    ; preds = %359
  br label %368

; <label>:368:                                    ; preds = %367, %365
  %369 = phi i64 [ %362, %365 ], [ %362, %367 ]
  %370 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %369)
  %371 = extractvalue { i64, i1 } %370, 0
  %372 = extractvalue { i64, i1 } %370, 1
  %373 = icmp eq i1 %372, true
  br i1 %373, label %374, label %376

; <label>:374:                                    ; preds = %368
  %375 = call i64 @overflow_fail(i64 856)
  br label %377

; <label>:376:                                    ; preds = %368
  br label %377

; <label>:377:                                    ; preds = %376, %374
  %378 = phi i64 [ %371, %374 ], [ %371, %376 ]
  %379 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %378)
  %380 = extractvalue { i64, i1 } %379, 0
  %381 = extractvalue { i64, i1 } %379, 1
  %382 = icmp eq i1 %381, true
  br i1 %382, label %383, label %385

; <label>:383:                                    ; preds = %377
  %384 = call i64 @overflow_fail(i64 856)
  br label %386

; <label>:385:                                    ; preds = %377
  br label %386

; <label>:386:                                    ; preds = %385, %383
  %387 = phi i64 [ %380, %383 ], [ %380, %385 ]
  %388 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %387)
  %389 = extractvalue { i64, i1 } %388, 0
  %390 = extractvalue { i64, i1 } %388, 1
  %391 = icmp eq i1 %390, true
  br i1 %391, label %392, label %394

; <label>:392:                                    ; preds = %386
  %393 = call i64 @overflow_fail(i64 856)
  br label %395

; <label>:394:                                    ; preds = %386
  br label %395

; <label>:395:                                    ; preds = %394, %392
  %396 = phi i64 [ %389, %392 ], [ %389, %394 ]
  %397 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %396)
  %398 = extractvalue { i64, i1 } %397, 0
  %399 = extractvalue { i64, i1 } %397, 1
  %400 = icmp eq i1 %399, true
  br i1 %400, label %401, label %403

; <label>:401:                                    ; preds = %395
  %402 = call i64 @overflow_fail(i64 856)
  br label %404

; <label>:403:                                    ; preds = %395
  br label %404

; <label>:404:                                    ; preds = %403, %401
  %405 = phi i64 [ %398, %401 ], [ %398, %403 ]
  %406 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %405)
  %407 = extractvalue { i64, i1 } %406, 0
  %408 = extractvalue { i64, i1 } %406, 1
  %409 = icmp eq i1 %408, true
  br i1 %409, label %410, label %412

; <label>:410:                                    ; preds = %404
  %411 = call i64 @overflow_fail(i64 856)
  br label %413

; <label>:412:                                    ; preds = %404
  br label %413

; <label>:413:                                    ; preds = %412, %410
  %414 = phi i64 [ %407, %410 ], [ %407, %412 ]
  br label %1740

else27:                                           ; preds = %else24
  %eqtmp28 = icmp eq i64 %a0, 11
  %415 = icmp eq i1 %eqtmp28, true
  br i1 %415, label %then29, label %else30

then29:                                           ; preds = %else27
  %416 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %417 = extractvalue { i64, i1 } %416, 0
  %418 = extractvalue { i64, i1 } %416, 1
  %419 = icmp eq i1 %418, true
  br i1 %419, label %420, label %422

; <label>:420:                                    ; preds = %then29
  %421 = call i64 @overflow_fail(i64 1018)
  br label %423

; <label>:422:                                    ; preds = %then29
  br label %423

; <label>:423:                                    ; preds = %422, %420
  %424 = phi i64 [ %417, %420 ], [ %417, %422 ]
  %425 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %424)
  %426 = extractvalue { i64, i1 } %425, 0
  %427 = extractvalue { i64, i1 } %425, 1
  %428 = icmp eq i1 %427, true
  br i1 %428, label %429, label %431

; <label>:429:                                    ; preds = %423
  %430 = call i64 @overflow_fail(i64 1018)
  br label %432

; <label>:431:                                    ; preds = %423
  br label %432

; <label>:432:                                    ; preds = %431, %429
  %433 = phi i64 [ %426, %429 ], [ %426, %431 ]
  %434 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %433)
  %435 = extractvalue { i64, i1 } %434, 0
  %436 = extractvalue { i64, i1 } %434, 1
  %437 = icmp eq i1 %436, true
  br i1 %437, label %438, label %440

; <label>:438:                                    ; preds = %432
  %439 = call i64 @overflow_fail(i64 1018)
  br label %441

; <label>:440:                                    ; preds = %432
  br label %441

; <label>:441:                                    ; preds = %440, %438
  %442 = phi i64 [ %435, %438 ], [ %435, %440 ]
  %443 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %442)
  %444 = extractvalue { i64, i1 } %443, 0
  %445 = extractvalue { i64, i1 } %443, 1
  %446 = icmp eq i1 %445, true
  br i1 %446, label %447, label %449

; <label>:447:                                    ; preds = %441
  %448 = call i64 @overflow_fail(i64 1018)
  br label %450

; <label>:449:                                    ; preds = %441
  br label %450

; <label>:450:                                    ; preds = %449, %447
  %451 = phi i64 [ %444, %447 ], [ %444, %449 ]
  %452 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %451)
  %453 = extractvalue { i64, i1 } %452, 0
  %454 = extractvalue { i64, i1 } %452, 1
  %455 = icmp eq i1 %454, true
  br i1 %455, label %456, label %458

; <label>:456:                                    ; preds = %450
  %457 = call i64 @overflow_fail(i64 1018)
  br label %459

; <label>:458:                                    ; preds = %450
  br label %459

; <label>:459:                                    ; preds = %458, %456
  %460 = phi i64 [ %453, %456 ], [ %453, %458 ]
  %461 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %460)
  %462 = extractvalue { i64, i1 } %461, 0
  %463 = extractvalue { i64, i1 } %461, 1
  %464 = icmp eq i1 %463, true
  br i1 %464, label %465, label %467

; <label>:465:                                    ; preds = %459
  %466 = call i64 @overflow_fail(i64 1018)
  br label %468

; <label>:467:                                    ; preds = %459
  br label %468

; <label>:468:                                    ; preds = %467, %465
  %469 = phi i64 [ %462, %465 ], [ %462, %467 ]
  %470 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %469)
  %471 = extractvalue { i64, i1 } %470, 0
  %472 = extractvalue { i64, i1 } %470, 1
  %473 = icmp eq i1 %472, true
  br i1 %473, label %474, label %476

; <label>:474:                                    ; preds = %468
  %475 = call i64 @overflow_fail(i64 1018)
  br label %477

; <label>:476:                                    ; preds = %468
  br label %477

; <label>:477:                                    ; preds = %476, %474
  %478 = phi i64 [ %471, %474 ], [ %471, %476 ]
  %479 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %478)
  %480 = extractvalue { i64, i1 } %479, 0
  %481 = extractvalue { i64, i1 } %479, 1
  %482 = icmp eq i1 %481, true
  br i1 %482, label %483, label %485

; <label>:483:                                    ; preds = %477
  %484 = call i64 @overflow_fail(i64 1018)
  br label %486

; <label>:485:                                    ; preds = %477
  br label %486

; <label>:486:                                    ; preds = %485, %483
  %487 = phi i64 [ %480, %483 ], [ %480, %485 ]
  %488 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %487)
  %489 = extractvalue { i64, i1 } %488, 0
  %490 = extractvalue { i64, i1 } %488, 1
  %491 = icmp eq i1 %490, true
  br i1 %491, label %492, label %494

; <label>:492:                                    ; preds = %486
  %493 = call i64 @overflow_fail(i64 1018)
  br label %495

; <label>:494:                                    ; preds = %486
  br label %495

; <label>:495:                                    ; preds = %494, %492
  %496 = phi i64 [ %489, %492 ], [ %489, %494 ]
  %497 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %496)
  %498 = extractvalue { i64, i1 } %497, 0
  %499 = extractvalue { i64, i1 } %497, 1
  %500 = icmp eq i1 %499, true
  br i1 %500, label %501, label %503

; <label>:501:                                    ; preds = %495
  %502 = call i64 @overflow_fail(i64 1018)
  br label %504

; <label>:503:                                    ; preds = %495
  br label %504

; <label>:504:                                    ; preds = %503, %501
  %505 = phi i64 [ %498, %501 ], [ %498, %503 ]
  br label %1739

else30:                                           ; preds = %else27
  %eqtmp31 = icmp eq i64 %a0, 12
  %506 = icmp eq i1 %eqtmp31, true
  br i1 %506, label %then32, label %else33

then32:                                           ; preds = %else30
  %507 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %508 = extractvalue { i64, i1 } %507, 0
  %509 = extractvalue { i64, i1 } %507, 1
  %510 = icmp eq i1 %509, true
  br i1 %510, label %511, label %513

; <label>:511:                                    ; preds = %then32
  %512 = call i64 @overflow_fail(i64 1195)
  br label %514

; <label>:513:                                    ; preds = %then32
  br label %514

; <label>:514:                                    ; preds = %513, %511
  %515 = phi i64 [ %508, %511 ], [ %508, %513 ]
  %516 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %515)
  %517 = extractvalue { i64, i1 } %516, 0
  %518 = extractvalue { i64, i1 } %516, 1
  %519 = icmp eq i1 %518, true
  br i1 %519, label %520, label %522

; <label>:520:                                    ; preds = %514
  %521 = call i64 @overflow_fail(i64 1195)
  br label %523

; <label>:522:                                    ; preds = %514
  br label %523

; <label>:523:                                    ; preds = %522, %520
  %524 = phi i64 [ %517, %520 ], [ %517, %522 ]
  %525 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %524)
  %526 = extractvalue { i64, i1 } %525, 0
  %527 = extractvalue { i64, i1 } %525, 1
  %528 = icmp eq i1 %527, true
  br i1 %528, label %529, label %531

; <label>:529:                                    ; preds = %523
  %530 = call i64 @overflow_fail(i64 1195)
  br label %532

; <label>:531:                                    ; preds = %523
  br label %532

; <label>:532:                                    ; preds = %531, %529
  %533 = phi i64 [ %526, %529 ], [ %526, %531 ]
  %534 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %533)
  %535 = extractvalue { i64, i1 } %534, 0
  %536 = extractvalue { i64, i1 } %534, 1
  %537 = icmp eq i1 %536, true
  br i1 %537, label %538, label %540

; <label>:538:                                    ; preds = %532
  %539 = call i64 @overflow_fail(i64 1195)
  br label %541

; <label>:540:                                    ; preds = %532
  br label %541

; <label>:541:                                    ; preds = %540, %538
  %542 = phi i64 [ %535, %538 ], [ %535, %540 ]
  %543 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %542)
  %544 = extractvalue { i64, i1 } %543, 0
  %545 = extractvalue { i64, i1 } %543, 1
  %546 = icmp eq i1 %545, true
  br i1 %546, label %547, label %549

; <label>:547:                                    ; preds = %541
  %548 = call i64 @overflow_fail(i64 1195)
  br label %550

; <label>:549:                                    ; preds = %541
  br label %550

; <label>:550:                                    ; preds = %549, %547
  %551 = phi i64 [ %544, %547 ], [ %544, %549 ]
  %552 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %551)
  %553 = extractvalue { i64, i1 } %552, 0
  %554 = extractvalue { i64, i1 } %552, 1
  %555 = icmp eq i1 %554, true
  br i1 %555, label %556, label %558

; <label>:556:                                    ; preds = %550
  %557 = call i64 @overflow_fail(i64 1195)
  br label %559

; <label>:558:                                    ; preds = %550
  br label %559

; <label>:559:                                    ; preds = %558, %556
  %560 = phi i64 [ %553, %556 ], [ %553, %558 ]
  %561 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %560)
  %562 = extractvalue { i64, i1 } %561, 0
  %563 = extractvalue { i64, i1 } %561, 1
  %564 = icmp eq i1 %563, true
  br i1 %564, label %565, label %567

; <label>:565:                                    ; preds = %559
  %566 = call i64 @overflow_fail(i64 1195)
  br label %568

; <label>:567:                                    ; preds = %559
  br label %568

; <label>:568:                                    ; preds = %567, %565
  %569 = phi i64 [ %562, %565 ], [ %562, %567 ]
  %570 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %569)
  %571 = extractvalue { i64, i1 } %570, 0
  %572 = extractvalue { i64, i1 } %570, 1
  %573 = icmp eq i1 %572, true
  br i1 %573, label %574, label %576

; <label>:574:                                    ; preds = %568
  %575 = call i64 @overflow_fail(i64 1195)
  br label %577

; <label>:576:                                    ; preds = %568
  br label %577

; <label>:577:                                    ; preds = %576, %574
  %578 = phi i64 [ %571, %574 ], [ %571, %576 ]
  %579 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %578)
  %580 = extractvalue { i64, i1 } %579, 0
  %581 = extractvalue { i64, i1 } %579, 1
  %582 = icmp eq i1 %581, true
  br i1 %582, label %583, label %585

; <label>:583:                                    ; preds = %577
  %584 = call i64 @overflow_fail(i64 1195)
  br label %586

; <label>:585:                                    ; preds = %577
  br label %586

; <label>:586:                                    ; preds = %585, %583
  %587 = phi i64 [ %580, %583 ], [ %580, %585 ]
  %588 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %587)
  %589 = extractvalue { i64, i1 } %588, 0
  %590 = extractvalue { i64, i1 } %588, 1
  %591 = icmp eq i1 %590, true
  br i1 %591, label %592, label %594

; <label>:592:                                    ; preds = %586
  %593 = call i64 @overflow_fail(i64 1195)
  br label %595

; <label>:594:                                    ; preds = %586
  br label %595

; <label>:595:                                    ; preds = %594, %592
  %596 = phi i64 [ %589, %592 ], [ %589, %594 ]
  %597 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %596)
  %598 = extractvalue { i64, i1 } %597, 0
  %599 = extractvalue { i64, i1 } %597, 1
  %600 = icmp eq i1 %599, true
  br i1 %600, label %601, label %603

; <label>:601:                                    ; preds = %595
  %602 = call i64 @overflow_fail(i64 1195)
  br label %604

; <label>:603:                                    ; preds = %595
  br label %604

; <label>:604:                                    ; preds = %603, %601
  %605 = phi i64 [ %598, %601 ], [ %598, %603 ]
  br label %1738

else33:                                           ; preds = %else30
  %eqtmp34 = icmp eq i64 %a0, 13
  %606 = icmp eq i1 %eqtmp34, true
  br i1 %606, label %then35, label %else36

then35:                                           ; preds = %else33
  %607 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %608 = extractvalue { i64, i1 } %607, 0
  %609 = extractvalue { i64, i1 } %607, 1
  %610 = icmp eq i1 %609, true
  br i1 %610, label %611, label %613

; <label>:611:                                    ; preds = %then35
  %612 = call i64 @overflow_fail(i64 1387)
  br label %614

; <label>:613:                                    ; preds = %then35
  br label %614

; <label>:614:                                    ; preds = %613, %611
  %615 = phi i64 [ %608, %611 ], [ %608, %613 ]
  %616 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %615)
  %617 = extractvalue { i64, i1 } %616, 0
  %618 = extractvalue { i64, i1 } %616, 1
  %619 = icmp eq i1 %618, true
  br i1 %619, label %620, label %622

; <label>:620:                                    ; preds = %614
  %621 = call i64 @overflow_fail(i64 1387)
  br label %623

; <label>:622:                                    ; preds = %614
  br label %623

; <label>:623:                                    ; preds = %622, %620
  %624 = phi i64 [ %617, %620 ], [ %617, %622 ]
  %625 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %624)
  %626 = extractvalue { i64, i1 } %625, 0
  %627 = extractvalue { i64, i1 } %625, 1
  %628 = icmp eq i1 %627, true
  br i1 %628, label %629, label %631

; <label>:629:                                    ; preds = %623
  %630 = call i64 @overflow_fail(i64 1387)
  br label %632

; <label>:631:                                    ; preds = %623
  br label %632

; <label>:632:                                    ; preds = %631, %629
  %633 = phi i64 [ %626, %629 ], [ %626, %631 ]
  %634 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %633)
  %635 = extractvalue { i64, i1 } %634, 0
  %636 = extractvalue { i64, i1 } %634, 1
  %637 = icmp eq i1 %636, true
  br i1 %637, label %638, label %640

; <label>:638:                                    ; preds = %632
  %639 = call i64 @overflow_fail(i64 1387)
  br label %641

; <label>:640:                                    ; preds = %632
  br label %641

; <label>:641:                                    ; preds = %640, %638
  %642 = phi i64 [ %635, %638 ], [ %635, %640 ]
  %643 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %642)
  %644 = extractvalue { i64, i1 } %643, 0
  %645 = extractvalue { i64, i1 } %643, 1
  %646 = icmp eq i1 %645, true
  br i1 %646, label %647, label %649

; <label>:647:                                    ; preds = %641
  %648 = call i64 @overflow_fail(i64 1387)
  br label %650

; <label>:649:                                    ; preds = %641
  br label %650

; <label>:650:                                    ; preds = %649, %647
  %651 = phi i64 [ %644, %647 ], [ %644, %649 ]
  %652 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %651)
  %653 = extractvalue { i64, i1 } %652, 0
  %654 = extractvalue { i64, i1 } %652, 1
  %655 = icmp eq i1 %654, true
  br i1 %655, label %656, label %658

; <label>:656:                                    ; preds = %650
  %657 = call i64 @overflow_fail(i64 1387)
  br label %659

; <label>:658:                                    ; preds = %650
  br label %659

; <label>:659:                                    ; preds = %658, %656
  %660 = phi i64 [ %653, %656 ], [ %653, %658 ]
  %661 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %660)
  %662 = extractvalue { i64, i1 } %661, 0
  %663 = extractvalue { i64, i1 } %661, 1
  %664 = icmp eq i1 %663, true
  br i1 %664, label %665, label %667

; <label>:665:                                    ; preds = %659
  %666 = call i64 @overflow_fail(i64 1387)
  br label %668

; <label>:667:                                    ; preds = %659
  br label %668

; <label>:668:                                    ; preds = %667, %665
  %669 = phi i64 [ %662, %665 ], [ %662, %667 ]
  %670 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %669)
  %671 = extractvalue { i64, i1 } %670, 0
  %672 = extractvalue { i64, i1 } %670, 1
  %673 = icmp eq i1 %672, true
  br i1 %673, label %674, label %676

; <label>:674:                                    ; preds = %668
  %675 = call i64 @overflow_fail(i64 1387)
  br label %677

; <label>:676:                                    ; preds = %668
  br label %677

; <label>:677:                                    ; preds = %676, %674
  %678 = phi i64 [ %671, %674 ], [ %671, %676 ]
  %679 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %678)
  %680 = extractvalue { i64, i1 } %679, 0
  %681 = extractvalue { i64, i1 } %679, 1
  %682 = icmp eq i1 %681, true
  br i1 %682, label %683, label %685

; <label>:683:                                    ; preds = %677
  %684 = call i64 @overflow_fail(i64 1387)
  br label %686

; <label>:685:                                    ; preds = %677
  br label %686

; <label>:686:                                    ; preds = %685, %683
  %687 = phi i64 [ %680, %683 ], [ %680, %685 ]
  %688 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %687)
  %689 = extractvalue { i64, i1 } %688, 0
  %690 = extractvalue { i64, i1 } %688, 1
  %691 = icmp eq i1 %690, true
  br i1 %691, label %692, label %694

; <label>:692:                                    ; preds = %686
  %693 = call i64 @overflow_fail(i64 1387)
  br label %695

; <label>:694:                                    ; preds = %686
  br label %695

; <label>:695:                                    ; preds = %694, %692
  %696 = phi i64 [ %689, %692 ], [ %689, %694 ]
  %697 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %696)
  %698 = extractvalue { i64, i1 } %697, 0
  %699 = extractvalue { i64, i1 } %697, 1
  %700 = icmp eq i1 %699, true
  br i1 %700, label %701, label %703

; <label>:701:                                    ; preds = %695
  %702 = call i64 @overflow_fail(i64 1387)
  br label %704

; <label>:703:                                    ; preds = %695
  br label %704

; <label>:704:                                    ; preds = %703, %701
  %705 = phi i64 [ %698, %701 ], [ %698, %703 ]
  %706 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %705)
  %707 = extractvalue { i64, i1 } %706, 0
  %708 = extractvalue { i64, i1 } %706, 1
  %709 = icmp eq i1 %708, true
  br i1 %709, label %710, label %712

; <label>:710:                                    ; preds = %704
  %711 = call i64 @overflow_fail(i64 1387)
  br label %713

; <label>:712:                                    ; preds = %704
  br label %713

; <label>:713:                                    ; preds = %712, %710
  %714 = phi i64 [ %707, %710 ], [ %707, %712 ]
  br label %1737

else36:                                           ; preds = %else33
  %eqtmp37 = icmp eq i64 %a0, 14
  %715 = icmp eq i1 %eqtmp37, true
  br i1 %715, label %then38, label %else39

then38:                                           ; preds = %else36
  %716 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %717 = extractvalue { i64, i1 } %716, 0
  %718 = extractvalue { i64, i1 } %716, 1
  %719 = icmp eq i1 %718, true
  br i1 %719, label %720, label %722

; <label>:720:                                    ; preds = %then38
  %721 = call i64 @overflow_fail(i64 1594)
  br label %723

; <label>:722:                                    ; preds = %then38
  br label %723

; <label>:723:                                    ; preds = %722, %720
  %724 = phi i64 [ %717, %720 ], [ %717, %722 ]
  %725 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %724)
  %726 = extractvalue { i64, i1 } %725, 0
  %727 = extractvalue { i64, i1 } %725, 1
  %728 = icmp eq i1 %727, true
  br i1 %728, label %729, label %731

; <label>:729:                                    ; preds = %723
  %730 = call i64 @overflow_fail(i64 1594)
  br label %732

; <label>:731:                                    ; preds = %723
  br label %732

; <label>:732:                                    ; preds = %731, %729
  %733 = phi i64 [ %726, %729 ], [ %726, %731 ]
  %734 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %733)
  %735 = extractvalue { i64, i1 } %734, 0
  %736 = extractvalue { i64, i1 } %734, 1
  %737 = icmp eq i1 %736, true
  br i1 %737, label %738, label %740

; <label>:738:                                    ; preds = %732
  %739 = call i64 @overflow_fail(i64 1594)
  br label %741

; <label>:740:                                    ; preds = %732
  br label %741

; <label>:741:                                    ; preds = %740, %738
  %742 = phi i64 [ %735, %738 ], [ %735, %740 ]
  %743 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %742)
  %744 = extractvalue { i64, i1 } %743, 0
  %745 = extractvalue { i64, i1 } %743, 1
  %746 = icmp eq i1 %745, true
  br i1 %746, label %747, label %749

; <label>:747:                                    ; preds = %741
  %748 = call i64 @overflow_fail(i64 1594)
  br label %750

; <label>:749:                                    ; preds = %741
  br label %750

; <label>:750:                                    ; preds = %749, %747
  %751 = phi i64 [ %744, %747 ], [ %744, %749 ]
  %752 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %751)
  %753 = extractvalue { i64, i1 } %752, 0
  %754 = extractvalue { i64, i1 } %752, 1
  %755 = icmp eq i1 %754, true
  br i1 %755, label %756, label %758

; <label>:756:                                    ; preds = %750
  %757 = call i64 @overflow_fail(i64 1594)
  br label %759

; <label>:758:                                    ; preds = %750
  br label %759

; <label>:759:                                    ; preds = %758, %756
  %760 = phi i64 [ %753, %756 ], [ %753, %758 ]
  %761 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %760)
  %762 = extractvalue { i64, i1 } %761, 0
  %763 = extractvalue { i64, i1 } %761, 1
  %764 = icmp eq i1 %763, true
  br i1 %764, label %765, label %767

; <label>:765:                                    ; preds = %759
  %766 = call i64 @overflow_fail(i64 1594)
  br label %768

; <label>:767:                                    ; preds = %759
  br label %768

; <label>:768:                                    ; preds = %767, %765
  %769 = phi i64 [ %762, %765 ], [ %762, %767 ]
  %770 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %769)
  %771 = extractvalue { i64, i1 } %770, 0
  %772 = extractvalue { i64, i1 } %770, 1
  %773 = icmp eq i1 %772, true
  br i1 %773, label %774, label %776

; <label>:774:                                    ; preds = %768
  %775 = call i64 @overflow_fail(i64 1594)
  br label %777

; <label>:776:                                    ; preds = %768
  br label %777

; <label>:777:                                    ; preds = %776, %774
  %778 = phi i64 [ %771, %774 ], [ %771, %776 ]
  %779 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %778)
  %780 = extractvalue { i64, i1 } %779, 0
  %781 = extractvalue { i64, i1 } %779, 1
  %782 = icmp eq i1 %781, true
  br i1 %782, label %783, label %785

; <label>:783:                                    ; preds = %777
  %784 = call i64 @overflow_fail(i64 1594)
  br label %786

; <label>:785:                                    ; preds = %777
  br label %786

; <label>:786:                                    ; preds = %785, %783
  %787 = phi i64 [ %780, %783 ], [ %780, %785 ]
  %788 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %787)
  %789 = extractvalue { i64, i1 } %788, 0
  %790 = extractvalue { i64, i1 } %788, 1
  %791 = icmp eq i1 %790, true
  br i1 %791, label %792, label %794

; <label>:792:                                    ; preds = %786
  %793 = call i64 @overflow_fail(i64 1594)
  br label %795

; <label>:794:                                    ; preds = %786
  br label %795

; <label>:795:                                    ; preds = %794, %792
  %796 = phi i64 [ %789, %792 ], [ %789, %794 ]
  %797 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %796)
  %798 = extractvalue { i64, i1 } %797, 0
  %799 = extractvalue { i64, i1 } %797, 1
  %800 = icmp eq i1 %799, true
  br i1 %800, label %801, label %803

; <label>:801:                                    ; preds = %795
  %802 = call i64 @overflow_fail(i64 1594)
  br label %804

; <label>:803:                                    ; preds = %795
  br label %804

; <label>:804:                                    ; preds = %803, %801
  %805 = phi i64 [ %798, %801 ], [ %798, %803 ]
  %806 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %805)
  %807 = extractvalue { i64, i1 } %806, 0
  %808 = extractvalue { i64, i1 } %806, 1
  %809 = icmp eq i1 %808, true
  br i1 %809, label %810, label %812

; <label>:810:                                    ; preds = %804
  %811 = call i64 @overflow_fail(i64 1594)
  br label %813

; <label>:812:                                    ; preds = %804
  br label %813

; <label>:813:                                    ; preds = %812, %810
  %814 = phi i64 [ %807, %810 ], [ %807, %812 ]
  %815 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %814)
  %816 = extractvalue { i64, i1 } %815, 0
  %817 = extractvalue { i64, i1 } %815, 1
  %818 = icmp eq i1 %817, true
  br i1 %818, label %819, label %821

; <label>:819:                                    ; preds = %813
  %820 = call i64 @overflow_fail(i64 1594)
  br label %822

; <label>:821:                                    ; preds = %813
  br label %822

; <label>:822:                                    ; preds = %821, %819
  %823 = phi i64 [ %816, %819 ], [ %816, %821 ]
  %824 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %823)
  %825 = extractvalue { i64, i1 } %824, 0
  %826 = extractvalue { i64, i1 } %824, 1
  %827 = icmp eq i1 %826, true
  br i1 %827, label %828, label %830

; <label>:828:                                    ; preds = %822
  %829 = call i64 @overflow_fail(i64 1594)
  br label %831

; <label>:830:                                    ; preds = %822
  br label %831

; <label>:831:                                    ; preds = %830, %828
  %832 = phi i64 [ %825, %828 ], [ %825, %830 ]
  br label %1736

else39:                                           ; preds = %else36
  %eqtmp40 = icmp eq i64 %a0, 15
  %833 = icmp eq i1 %eqtmp40, true
  br i1 %833, label %then41, label %else42

then41:                                           ; preds = %else39
  %834 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %835 = extractvalue { i64, i1 } %834, 0
  %836 = extractvalue { i64, i1 } %834, 1
  %837 = icmp eq i1 %836, true
  br i1 %837, label %838, label %840

; <label>:838:                                    ; preds = %then41
  %839 = call i64 @overflow_fail(i64 1816)
  br label %841

; <label>:840:                                    ; preds = %then41
  br label %841

; <label>:841:                                    ; preds = %840, %838
  %842 = phi i64 [ %835, %838 ], [ %835, %840 ]
  %843 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %842)
  %844 = extractvalue { i64, i1 } %843, 0
  %845 = extractvalue { i64, i1 } %843, 1
  %846 = icmp eq i1 %845, true
  br i1 %846, label %847, label %849

; <label>:847:                                    ; preds = %841
  %848 = call i64 @overflow_fail(i64 1816)
  br label %850

; <label>:849:                                    ; preds = %841
  br label %850

; <label>:850:                                    ; preds = %849, %847
  %851 = phi i64 [ %844, %847 ], [ %844, %849 ]
  %852 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %851)
  %853 = extractvalue { i64, i1 } %852, 0
  %854 = extractvalue { i64, i1 } %852, 1
  %855 = icmp eq i1 %854, true
  br i1 %855, label %856, label %858

; <label>:856:                                    ; preds = %850
  %857 = call i64 @overflow_fail(i64 1816)
  br label %859

; <label>:858:                                    ; preds = %850
  br label %859

; <label>:859:                                    ; preds = %858, %856
  %860 = phi i64 [ %853, %856 ], [ %853, %858 ]
  %861 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %860)
  %862 = extractvalue { i64, i1 } %861, 0
  %863 = extractvalue { i64, i1 } %861, 1
  %864 = icmp eq i1 %863, true
  br i1 %864, label %865, label %867

; <label>:865:                                    ; preds = %859
  %866 = call i64 @overflow_fail(i64 1816)
  br label %868

; <label>:867:                                    ; preds = %859
  br label %868

; <label>:868:                                    ; preds = %867, %865
  %869 = phi i64 [ %862, %865 ], [ %862, %867 ]
  %870 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %869)
  %871 = extractvalue { i64, i1 } %870, 0
  %872 = extractvalue { i64, i1 } %870, 1
  %873 = icmp eq i1 %872, true
  br i1 %873, label %874, label %876

; <label>:874:                                    ; preds = %868
  %875 = call i64 @overflow_fail(i64 1816)
  br label %877

; <label>:876:                                    ; preds = %868
  br label %877

; <label>:877:                                    ; preds = %876, %874
  %878 = phi i64 [ %871, %874 ], [ %871, %876 ]
  %879 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %878)
  %880 = extractvalue { i64, i1 } %879, 0
  %881 = extractvalue { i64, i1 } %879, 1
  %882 = icmp eq i1 %881, true
  br i1 %882, label %883, label %885

; <label>:883:                                    ; preds = %877
  %884 = call i64 @overflow_fail(i64 1816)
  br label %886

; <label>:885:                                    ; preds = %877
  br label %886

; <label>:886:                                    ; preds = %885, %883
  %887 = phi i64 [ %880, %883 ], [ %880, %885 ]
  %888 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %887)
  %889 = extractvalue { i64, i1 } %888, 0
  %890 = extractvalue { i64, i1 } %888, 1
  %891 = icmp eq i1 %890, true
  br i1 %891, label %892, label %894

; <label>:892:                                    ; preds = %886
  %893 = call i64 @overflow_fail(i64 1816)
  br label %895

; <label>:894:                                    ; preds = %886
  br label %895

; <label>:895:                                    ; preds = %894, %892
  %896 = phi i64 [ %889, %892 ], [ %889, %894 ]
  %897 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %896)
  %898 = extractvalue { i64, i1 } %897, 0
  %899 = extractvalue { i64, i1 } %897, 1
  %900 = icmp eq i1 %899, true
  br i1 %900, label %901, label %903

; <label>:901:                                    ; preds = %895
  %902 = call i64 @overflow_fail(i64 1816)
  br label %904

; <label>:903:                                    ; preds = %895
  br label %904

; <label>:904:                                    ; preds = %903, %901
  %905 = phi i64 [ %898, %901 ], [ %898, %903 ]
  %906 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %905)
  %907 = extractvalue { i64, i1 } %906, 0
  %908 = extractvalue { i64, i1 } %906, 1
  %909 = icmp eq i1 %908, true
  br i1 %909, label %910, label %912

; <label>:910:                                    ; preds = %904
  %911 = call i64 @overflow_fail(i64 1816)
  br label %913

; <label>:912:                                    ; preds = %904
  br label %913

; <label>:913:                                    ; preds = %912, %910
  %914 = phi i64 [ %907, %910 ], [ %907, %912 ]
  %915 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %914)
  %916 = extractvalue { i64, i1 } %915, 0
  %917 = extractvalue { i64, i1 } %915, 1
  %918 = icmp eq i1 %917, true
  br i1 %918, label %919, label %921

; <label>:919:                                    ; preds = %913
  %920 = call i64 @overflow_fail(i64 1816)
  br label %922

; <label>:921:                                    ; preds = %913
  br label %922

; <label>:922:                                    ; preds = %921, %919
  %923 = phi i64 [ %916, %919 ], [ %916, %921 ]
  %924 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %923)
  %925 = extractvalue { i64, i1 } %924, 0
  %926 = extractvalue { i64, i1 } %924, 1
  %927 = icmp eq i1 %926, true
  br i1 %927, label %928, label %930

; <label>:928:                                    ; preds = %922
  %929 = call i64 @overflow_fail(i64 1816)
  br label %931

; <label>:930:                                    ; preds = %922
  br label %931

; <label>:931:                                    ; preds = %930, %928
  %932 = phi i64 [ %925, %928 ], [ %925, %930 ]
  %933 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %932)
  %934 = extractvalue { i64, i1 } %933, 0
  %935 = extractvalue { i64, i1 } %933, 1
  %936 = icmp eq i1 %935, true
  br i1 %936, label %937, label %939

; <label>:937:                                    ; preds = %931
  %938 = call i64 @overflow_fail(i64 1816)
  br label %940

; <label>:939:                                    ; preds = %931
  br label %940

; <label>:940:                                    ; preds = %939, %937
  %941 = phi i64 [ %934, %937 ], [ %934, %939 ]
  %942 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %941)
  %943 = extractvalue { i64, i1 } %942, 0
  %944 = extractvalue { i64, i1 } %942, 1
  %945 = icmp eq i1 %944, true
  br i1 %945, label %946, label %948

; <label>:946:                                    ; preds = %940
  %947 = call i64 @overflow_fail(i64 1816)
  br label %949

; <label>:948:                                    ; preds = %940
  br label %949

; <label>:949:                                    ; preds = %948, %946
  %950 = phi i64 [ %943, %946 ], [ %943, %948 ]
  %951 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %950)
  %952 = extractvalue { i64, i1 } %951, 0
  %953 = extractvalue { i64, i1 } %951, 1
  %954 = icmp eq i1 %953, true
  br i1 %954, label %955, label %957

; <label>:955:                                    ; preds = %949
  %956 = call i64 @overflow_fail(i64 1816)
  br label %958

; <label>:957:                                    ; preds = %949
  br label %958

; <label>:958:                                    ; preds = %957, %955
  %959 = phi i64 [ %952, %955 ], [ %952, %957 ]
  br label %1735

else42:                                           ; preds = %else39
  %eqtmp43 = icmp eq i64 %a0, 16
  %960 = icmp eq i1 %eqtmp43, true
  br i1 %960, label %then44, label %else45

then44:                                           ; preds = %else42
  %961 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %962 = extractvalue { i64, i1 } %961, 0
  %963 = extractvalue { i64, i1 } %961, 1
  %964 = icmp eq i1 %963, true
  br i1 %964, label %965, label %967

; <label>:965:                                    ; preds = %then44
  %966 = call i64 @overflow_fail(i64 2053)
  br label %968

; <label>:967:                                    ; preds = %then44
  br label %968

; <label>:968:                                    ; preds = %967, %965
  %969 = phi i64 [ %962, %965 ], [ %962, %967 ]
  %970 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %969)
  %971 = extractvalue { i64, i1 } %970, 0
  %972 = extractvalue { i64, i1 } %970, 1
  %973 = icmp eq i1 %972, true
  br i1 %973, label %974, label %976

; <label>:974:                                    ; preds = %968
  %975 = call i64 @overflow_fail(i64 2053)
  br label %977

; <label>:976:                                    ; preds = %968
  br label %977

; <label>:977:                                    ; preds = %976, %974
  %978 = phi i64 [ %971, %974 ], [ %971, %976 ]
  %979 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %978)
  %980 = extractvalue { i64, i1 } %979, 0
  %981 = extractvalue { i64, i1 } %979, 1
  %982 = icmp eq i1 %981, true
  br i1 %982, label %983, label %985

; <label>:983:                                    ; preds = %977
  %984 = call i64 @overflow_fail(i64 2053)
  br label %986

; <label>:985:                                    ; preds = %977
  br label %986

; <label>:986:                                    ; preds = %985, %983
  %987 = phi i64 [ %980, %983 ], [ %980, %985 ]
  %988 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %987)
  %989 = extractvalue { i64, i1 } %988, 0
  %990 = extractvalue { i64, i1 } %988, 1
  %991 = icmp eq i1 %990, true
  br i1 %991, label %992, label %994

; <label>:992:                                    ; preds = %986
  %993 = call i64 @overflow_fail(i64 2053)
  br label %995

; <label>:994:                                    ; preds = %986
  br label %995

; <label>:995:                                    ; preds = %994, %992
  %996 = phi i64 [ %989, %992 ], [ %989, %994 ]
  %997 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %996)
  %998 = extractvalue { i64, i1 } %997, 0
  %999 = extractvalue { i64, i1 } %997, 1
  %1000 = icmp eq i1 %999, true
  br i1 %1000, label %1001, label %1003

; <label>:1001:                                   ; preds = %995
  %1002 = call i64 @overflow_fail(i64 2053)
  br label %1004

; <label>:1003:                                   ; preds = %995
  br label %1004

; <label>:1004:                                   ; preds = %1003, %1001
  %1005 = phi i64 [ %998, %1001 ], [ %998, %1003 ]
  %1006 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %1005)
  %1007 = extractvalue { i64, i1 } %1006, 0
  %1008 = extractvalue { i64, i1 } %1006, 1
  %1009 = icmp eq i1 %1008, true
  br i1 %1009, label %1010, label %1012

; <label>:1010:                                   ; preds = %1004
  %1011 = call i64 @overflow_fail(i64 2053)
  br label %1013

; <label>:1012:                                   ; preds = %1004
  br label %1013

; <label>:1013:                                   ; preds = %1012, %1010
  %1014 = phi i64 [ %1007, %1010 ], [ %1007, %1012 ]
  %1015 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %1014)
  %1016 = extractvalue { i64, i1 } %1015, 0
  %1017 = extractvalue { i64, i1 } %1015, 1
  %1018 = icmp eq i1 %1017, true
  br i1 %1018, label %1019, label %1021

; <label>:1019:                                   ; preds = %1013
  %1020 = call i64 @overflow_fail(i64 2053)
  br label %1022

; <label>:1021:                                   ; preds = %1013
  br label %1022

; <label>:1022:                                   ; preds = %1021, %1019
  %1023 = phi i64 [ %1016, %1019 ], [ %1016, %1021 ]
  %1024 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %1023)
  %1025 = extractvalue { i64, i1 } %1024, 0
  %1026 = extractvalue { i64, i1 } %1024, 1
  %1027 = icmp eq i1 %1026, true
  br i1 %1027, label %1028, label %1030

; <label>:1028:                                   ; preds = %1022
  %1029 = call i64 @overflow_fail(i64 2053)
  br label %1031

; <label>:1030:                                   ; preds = %1022
  br label %1031

; <label>:1031:                                   ; preds = %1030, %1028
  %1032 = phi i64 [ %1025, %1028 ], [ %1025, %1030 ]
  %1033 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %1032)
  %1034 = extractvalue { i64, i1 } %1033, 0
  %1035 = extractvalue { i64, i1 } %1033, 1
  %1036 = icmp eq i1 %1035, true
  br i1 %1036, label %1037, label %1039

; <label>:1037:                                   ; preds = %1031
  %1038 = call i64 @overflow_fail(i64 2053)
  br label %1040

; <label>:1039:                                   ; preds = %1031
  br label %1040

; <label>:1040:                                   ; preds = %1039, %1037
  %1041 = phi i64 [ %1034, %1037 ], [ %1034, %1039 ]
  %1042 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %1041)
  %1043 = extractvalue { i64, i1 } %1042, 0
  %1044 = extractvalue { i64, i1 } %1042, 1
  %1045 = icmp eq i1 %1044, true
  br i1 %1045, label %1046, label %1048

; <label>:1046:                                   ; preds = %1040
  %1047 = call i64 @overflow_fail(i64 2053)
  br label %1049

; <label>:1048:                                   ; preds = %1040
  br label %1049

; <label>:1049:                                   ; preds = %1048, %1046
  %1050 = phi i64 [ %1043, %1046 ], [ %1043, %1048 ]
  %1051 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %1050)
  %1052 = extractvalue { i64, i1 } %1051, 0
  %1053 = extractvalue { i64, i1 } %1051, 1
  %1054 = icmp eq i1 %1053, true
  br i1 %1054, label %1055, label %1057

; <label>:1055:                                   ; preds = %1049
  %1056 = call i64 @overflow_fail(i64 2053)
  br label %1058

; <label>:1057:                                   ; preds = %1049
  br label %1058

; <label>:1058:                                   ; preds = %1057, %1055
  %1059 = phi i64 [ %1052, %1055 ], [ %1052, %1057 ]
  %1060 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %1059)
  %1061 = extractvalue { i64, i1 } %1060, 0
  %1062 = extractvalue { i64, i1 } %1060, 1
  %1063 = icmp eq i1 %1062, true
  br i1 %1063, label %1064, label %1066

; <label>:1064:                                   ; preds = %1058
  %1065 = call i64 @overflow_fail(i64 2053)
  br label %1067

; <label>:1066:                                   ; preds = %1058
  br label %1067

; <label>:1067:                                   ; preds = %1066, %1064
  %1068 = phi i64 [ %1061, %1064 ], [ %1061, %1066 ]
  %1069 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %1068)
  %1070 = extractvalue { i64, i1 } %1069, 0
  %1071 = extractvalue { i64, i1 } %1069, 1
  %1072 = icmp eq i1 %1071, true
  br i1 %1072, label %1073, label %1075

; <label>:1073:                                   ; preds = %1067
  %1074 = call i64 @overflow_fail(i64 2053)
  br label %1076

; <label>:1075:                                   ; preds = %1067
  br label %1076

; <label>:1076:                                   ; preds = %1075, %1073
  %1077 = phi i64 [ %1070, %1073 ], [ %1070, %1075 ]
  %1078 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %1077)
  %1079 = extractvalue { i64, i1 } %1078, 0
  %1080 = extractvalue { i64, i1 } %1078, 1
  %1081 = icmp eq i1 %1080, true
  br i1 %1081, label %1082, label %1084

; <label>:1082:                                   ; preds = %1076
  %1083 = call i64 @overflow_fail(i64 2053)
  br label %1085

; <label>:1084:                                   ; preds = %1076
  br label %1085

; <label>:1085:                                   ; preds = %1084, %1082
  %1086 = phi i64 [ %1079, %1082 ], [ %1079, %1084 ]
  %1087 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %1086)
  %1088 = extractvalue { i64, i1 } %1087, 0
  %1089 = extractvalue { i64, i1 } %1087, 1
  %1090 = icmp eq i1 %1089, true
  br i1 %1090, label %1091, label %1093

; <label>:1091:                                   ; preds = %1085
  %1092 = call i64 @overflow_fail(i64 2053)
  br label %1094

; <label>:1093:                                   ; preds = %1085
  br label %1094

; <label>:1094:                                   ; preds = %1093, %1091
  %1095 = phi i64 [ %1088, %1091 ], [ %1088, %1093 ]
  br label %1734

else45:                                           ; preds = %else42
  %eqtmp46 = icmp eq i64 %a0, 17
  %1096 = icmp eq i1 %eqtmp46, true
  br i1 %1096, label %then47, label %else48

then47:                                           ; preds = %else45
  %1097 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %1098 = extractvalue { i64, i1 } %1097, 0
  %1099 = extractvalue { i64, i1 } %1097, 1
  %1100 = icmp eq i1 %1099, true
  br i1 %1100, label %1101, label %1103

; <label>:1101:                                   ; preds = %then47
  %1102 = call i64 @overflow_fail(i64 2305)
  br label %1104

; <label>:1103:                                   ; preds = %then47
  br label %1104

; <label>:1104:                                   ; preds = %1103, %1101
  %1105 = phi i64 [ %1098, %1101 ], [ %1098, %1103 ]
  %1106 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %1105)
  %1107 = extractvalue { i64, i1 } %1106, 0
  %1108 = extractvalue { i64, i1 } %1106, 1
  %1109 = icmp eq i1 %1108, true
  br i1 %1109, label %1110, label %1112

; <label>:1110:                                   ; preds = %1104
  %1111 = call i64 @overflow_fail(i64 2305)
  br label %1113

; <label>:1112:                                   ; preds = %1104
  br label %1113

; <label>:1113:                                   ; preds = %1112, %1110
  %1114 = phi i64 [ %1107, %1110 ], [ %1107, %1112 ]
  %1115 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %1114)
  %1116 = extractvalue { i64, i1 } %1115, 0
  %1117 = extractvalue { i64, i1 } %1115, 1
  %1118 = icmp eq i1 %1117, true
  br i1 %1118, label %1119, label %1121

; <label>:1119:                                   ; preds = %1113
  %1120 = call i64 @overflow_fail(i64 2305)
  br label %1122

; <label>:1121:                                   ; preds = %1113
  br label %1122

; <label>:1122:                                   ; preds = %1121, %1119
  %1123 = phi i64 [ %1116, %1119 ], [ %1116, %1121 ]
  %1124 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %1123)
  %1125 = extractvalue { i64, i1 } %1124, 0
  %1126 = extractvalue { i64, i1 } %1124, 1
  %1127 = icmp eq i1 %1126, true
  br i1 %1127, label %1128, label %1130

; <label>:1128:                                   ; preds = %1122
  %1129 = call i64 @overflow_fail(i64 2305)
  br label %1131

; <label>:1130:                                   ; preds = %1122
  br label %1131

; <label>:1131:                                   ; preds = %1130, %1128
  %1132 = phi i64 [ %1125, %1128 ], [ %1125, %1130 ]
  %1133 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %1132)
  %1134 = extractvalue { i64, i1 } %1133, 0
  %1135 = extractvalue { i64, i1 } %1133, 1
  %1136 = icmp eq i1 %1135, true
  br i1 %1136, label %1137, label %1139

; <label>:1137:                                   ; preds = %1131
  %1138 = call i64 @overflow_fail(i64 2305)
  br label %1140

; <label>:1139:                                   ; preds = %1131
  br label %1140

; <label>:1140:                                   ; preds = %1139, %1137
  %1141 = phi i64 [ %1134, %1137 ], [ %1134, %1139 ]
  %1142 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %1141)
  %1143 = extractvalue { i64, i1 } %1142, 0
  %1144 = extractvalue { i64, i1 } %1142, 1
  %1145 = icmp eq i1 %1144, true
  br i1 %1145, label %1146, label %1148

; <label>:1146:                                   ; preds = %1140
  %1147 = call i64 @overflow_fail(i64 2305)
  br label %1149

; <label>:1148:                                   ; preds = %1140
  br label %1149

; <label>:1149:                                   ; preds = %1148, %1146
  %1150 = phi i64 [ %1143, %1146 ], [ %1143, %1148 ]
  %1151 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %1150)
  %1152 = extractvalue { i64, i1 } %1151, 0
  %1153 = extractvalue { i64, i1 } %1151, 1
  %1154 = icmp eq i1 %1153, true
  br i1 %1154, label %1155, label %1157

; <label>:1155:                                   ; preds = %1149
  %1156 = call i64 @overflow_fail(i64 2305)
  br label %1158

; <label>:1157:                                   ; preds = %1149
  br label %1158

; <label>:1158:                                   ; preds = %1157, %1155
  %1159 = phi i64 [ %1152, %1155 ], [ %1152, %1157 ]
  %1160 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %1159)
  %1161 = extractvalue { i64, i1 } %1160, 0
  %1162 = extractvalue { i64, i1 } %1160, 1
  %1163 = icmp eq i1 %1162, true
  br i1 %1163, label %1164, label %1166

; <label>:1164:                                   ; preds = %1158
  %1165 = call i64 @overflow_fail(i64 2305)
  br label %1167

; <label>:1166:                                   ; preds = %1158
  br label %1167

; <label>:1167:                                   ; preds = %1166, %1164
  %1168 = phi i64 [ %1161, %1164 ], [ %1161, %1166 ]
  %1169 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %1168)
  %1170 = extractvalue { i64, i1 } %1169, 0
  %1171 = extractvalue { i64, i1 } %1169, 1
  %1172 = icmp eq i1 %1171, true
  br i1 %1172, label %1173, label %1175

; <label>:1173:                                   ; preds = %1167
  %1174 = call i64 @overflow_fail(i64 2305)
  br label %1176

; <label>:1175:                                   ; preds = %1167
  br label %1176

; <label>:1176:                                   ; preds = %1175, %1173
  %1177 = phi i64 [ %1170, %1173 ], [ %1170, %1175 ]
  %1178 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %1177)
  %1179 = extractvalue { i64, i1 } %1178, 0
  %1180 = extractvalue { i64, i1 } %1178, 1
  %1181 = icmp eq i1 %1180, true
  br i1 %1181, label %1182, label %1184

; <label>:1182:                                   ; preds = %1176
  %1183 = call i64 @overflow_fail(i64 2305)
  br label %1185

; <label>:1184:                                   ; preds = %1176
  br label %1185

; <label>:1185:                                   ; preds = %1184, %1182
  %1186 = phi i64 [ %1179, %1182 ], [ %1179, %1184 ]
  %1187 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %1186)
  %1188 = extractvalue { i64, i1 } %1187, 0
  %1189 = extractvalue { i64, i1 } %1187, 1
  %1190 = icmp eq i1 %1189, true
  br i1 %1190, label %1191, label %1193

; <label>:1191:                                   ; preds = %1185
  %1192 = call i64 @overflow_fail(i64 2305)
  br label %1194

; <label>:1193:                                   ; preds = %1185
  br label %1194

; <label>:1194:                                   ; preds = %1193, %1191
  %1195 = phi i64 [ %1188, %1191 ], [ %1188, %1193 ]
  %1196 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %1195)
  %1197 = extractvalue { i64, i1 } %1196, 0
  %1198 = extractvalue { i64, i1 } %1196, 1
  %1199 = icmp eq i1 %1198, true
  br i1 %1199, label %1200, label %1202

; <label>:1200:                                   ; preds = %1194
  %1201 = call i64 @overflow_fail(i64 2305)
  br label %1203

; <label>:1202:                                   ; preds = %1194
  br label %1203

; <label>:1203:                                   ; preds = %1202, %1200
  %1204 = phi i64 [ %1197, %1200 ], [ %1197, %1202 ]
  %1205 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %1204)
  %1206 = extractvalue { i64, i1 } %1205, 0
  %1207 = extractvalue { i64, i1 } %1205, 1
  %1208 = icmp eq i1 %1207, true
  br i1 %1208, label %1209, label %1211

; <label>:1209:                                   ; preds = %1203
  %1210 = call i64 @overflow_fail(i64 2305)
  br label %1212

; <label>:1211:                                   ; preds = %1203
  br label %1212

; <label>:1212:                                   ; preds = %1211, %1209
  %1213 = phi i64 [ %1206, %1209 ], [ %1206, %1211 ]
  %1214 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %1213)
  %1215 = extractvalue { i64, i1 } %1214, 0
  %1216 = extractvalue { i64, i1 } %1214, 1
  %1217 = icmp eq i1 %1216, true
  br i1 %1217, label %1218, label %1220

; <label>:1218:                                   ; preds = %1212
  %1219 = call i64 @overflow_fail(i64 2305)
  br label %1221

; <label>:1220:                                   ; preds = %1212
  br label %1221

; <label>:1221:                                   ; preds = %1220, %1218
  %1222 = phi i64 [ %1215, %1218 ], [ %1215, %1220 ]
  %1223 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %1222)
  %1224 = extractvalue { i64, i1 } %1223, 0
  %1225 = extractvalue { i64, i1 } %1223, 1
  %1226 = icmp eq i1 %1225, true
  br i1 %1226, label %1227, label %1229

; <label>:1227:                                   ; preds = %1221
  %1228 = call i64 @overflow_fail(i64 2305)
  br label %1230

; <label>:1229:                                   ; preds = %1221
  br label %1230

; <label>:1230:                                   ; preds = %1229, %1227
  %1231 = phi i64 [ %1224, %1227 ], [ %1224, %1229 ]
  %1232 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %1231)
  %1233 = extractvalue { i64, i1 } %1232, 0
  %1234 = extractvalue { i64, i1 } %1232, 1
  %1235 = icmp eq i1 %1234, true
  br i1 %1235, label %1236, label %1238

; <label>:1236:                                   ; preds = %1230
  %1237 = call i64 @overflow_fail(i64 2305)
  br label %1239

; <label>:1238:                                   ; preds = %1230
  br label %1239

; <label>:1239:                                   ; preds = %1238, %1236
  %1240 = phi i64 [ %1233, %1236 ], [ %1233, %1238 ]
  br label %1733

else48:                                           ; preds = %else45
  %eqtmp49 = icmp eq i64 %a0, 18
  %1241 = icmp eq i1 %eqtmp49, true
  br i1 %1241, label %then50, label %else51

then50:                                           ; preds = %else48
  %1242 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %1243 = extractvalue { i64, i1 } %1242, 0
  %1244 = extractvalue { i64, i1 } %1242, 1
  %1245 = icmp eq i1 %1244, true
  br i1 %1245, label %1246, label %1248

; <label>:1246:                                   ; preds = %then50
  %1247 = call i64 @overflow_fail(i64 2572)
  br label %1249

; <label>:1248:                                   ; preds = %then50
  br label %1249

; <label>:1249:                                   ; preds = %1248, %1246
  %1250 = phi i64 [ %1243, %1246 ], [ %1243, %1248 ]
  %1251 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %1250)
  %1252 = extractvalue { i64, i1 } %1251, 0
  %1253 = extractvalue { i64, i1 } %1251, 1
  %1254 = icmp eq i1 %1253, true
  br i1 %1254, label %1255, label %1257

; <label>:1255:                                   ; preds = %1249
  %1256 = call i64 @overflow_fail(i64 2572)
  br label %1258

; <label>:1257:                                   ; preds = %1249
  br label %1258

; <label>:1258:                                   ; preds = %1257, %1255
  %1259 = phi i64 [ %1252, %1255 ], [ %1252, %1257 ]
  %1260 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %1259)
  %1261 = extractvalue { i64, i1 } %1260, 0
  %1262 = extractvalue { i64, i1 } %1260, 1
  %1263 = icmp eq i1 %1262, true
  br i1 %1263, label %1264, label %1266

; <label>:1264:                                   ; preds = %1258
  %1265 = call i64 @overflow_fail(i64 2572)
  br label %1267

; <label>:1266:                                   ; preds = %1258
  br label %1267

; <label>:1267:                                   ; preds = %1266, %1264
  %1268 = phi i64 [ %1261, %1264 ], [ %1261, %1266 ]
  %1269 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %1268)
  %1270 = extractvalue { i64, i1 } %1269, 0
  %1271 = extractvalue { i64, i1 } %1269, 1
  %1272 = icmp eq i1 %1271, true
  br i1 %1272, label %1273, label %1275

; <label>:1273:                                   ; preds = %1267
  %1274 = call i64 @overflow_fail(i64 2572)
  br label %1276

; <label>:1275:                                   ; preds = %1267
  br label %1276

; <label>:1276:                                   ; preds = %1275, %1273
  %1277 = phi i64 [ %1270, %1273 ], [ %1270, %1275 ]
  %1278 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %1277)
  %1279 = extractvalue { i64, i1 } %1278, 0
  %1280 = extractvalue { i64, i1 } %1278, 1
  %1281 = icmp eq i1 %1280, true
  br i1 %1281, label %1282, label %1284

; <label>:1282:                                   ; preds = %1276
  %1283 = call i64 @overflow_fail(i64 2572)
  br label %1285

; <label>:1284:                                   ; preds = %1276
  br label %1285

; <label>:1285:                                   ; preds = %1284, %1282
  %1286 = phi i64 [ %1279, %1282 ], [ %1279, %1284 ]
  %1287 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %1286)
  %1288 = extractvalue { i64, i1 } %1287, 0
  %1289 = extractvalue { i64, i1 } %1287, 1
  %1290 = icmp eq i1 %1289, true
  br i1 %1290, label %1291, label %1293

; <label>:1291:                                   ; preds = %1285
  %1292 = call i64 @overflow_fail(i64 2572)
  br label %1294

; <label>:1293:                                   ; preds = %1285
  br label %1294

; <label>:1294:                                   ; preds = %1293, %1291
  %1295 = phi i64 [ %1288, %1291 ], [ %1288, %1293 ]
  %1296 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %1295)
  %1297 = extractvalue { i64, i1 } %1296, 0
  %1298 = extractvalue { i64, i1 } %1296, 1
  %1299 = icmp eq i1 %1298, true
  br i1 %1299, label %1300, label %1302

; <label>:1300:                                   ; preds = %1294
  %1301 = call i64 @overflow_fail(i64 2572)
  br label %1303

; <label>:1302:                                   ; preds = %1294
  br label %1303

; <label>:1303:                                   ; preds = %1302, %1300
  %1304 = phi i64 [ %1297, %1300 ], [ %1297, %1302 ]
  %1305 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %1304)
  %1306 = extractvalue { i64, i1 } %1305, 0
  %1307 = extractvalue { i64, i1 } %1305, 1
  %1308 = icmp eq i1 %1307, true
  br i1 %1308, label %1309, label %1311

; <label>:1309:                                   ; preds = %1303
  %1310 = call i64 @overflow_fail(i64 2572)
  br label %1312

; <label>:1311:                                   ; preds = %1303
  br label %1312

; <label>:1312:                                   ; preds = %1311, %1309
  %1313 = phi i64 [ %1306, %1309 ], [ %1306, %1311 ]
  %1314 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %1313)
  %1315 = extractvalue { i64, i1 } %1314, 0
  %1316 = extractvalue { i64, i1 } %1314, 1
  %1317 = icmp eq i1 %1316, true
  br i1 %1317, label %1318, label %1320

; <label>:1318:                                   ; preds = %1312
  %1319 = call i64 @overflow_fail(i64 2572)
  br label %1321

; <label>:1320:                                   ; preds = %1312
  br label %1321

; <label>:1321:                                   ; preds = %1320, %1318
  %1322 = phi i64 [ %1315, %1318 ], [ %1315, %1320 ]
  %1323 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %1322)
  %1324 = extractvalue { i64, i1 } %1323, 0
  %1325 = extractvalue { i64, i1 } %1323, 1
  %1326 = icmp eq i1 %1325, true
  br i1 %1326, label %1327, label %1329

; <label>:1327:                                   ; preds = %1321
  %1328 = call i64 @overflow_fail(i64 2572)
  br label %1330

; <label>:1329:                                   ; preds = %1321
  br label %1330

; <label>:1330:                                   ; preds = %1329, %1327
  %1331 = phi i64 [ %1324, %1327 ], [ %1324, %1329 ]
  %1332 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %1331)
  %1333 = extractvalue { i64, i1 } %1332, 0
  %1334 = extractvalue { i64, i1 } %1332, 1
  %1335 = icmp eq i1 %1334, true
  br i1 %1335, label %1336, label %1338

; <label>:1336:                                   ; preds = %1330
  %1337 = call i64 @overflow_fail(i64 2572)
  br label %1339

; <label>:1338:                                   ; preds = %1330
  br label %1339

; <label>:1339:                                   ; preds = %1338, %1336
  %1340 = phi i64 [ %1333, %1336 ], [ %1333, %1338 ]
  %1341 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %1340)
  %1342 = extractvalue { i64, i1 } %1341, 0
  %1343 = extractvalue { i64, i1 } %1341, 1
  %1344 = icmp eq i1 %1343, true
  br i1 %1344, label %1345, label %1347

; <label>:1345:                                   ; preds = %1339
  %1346 = call i64 @overflow_fail(i64 2572)
  br label %1348

; <label>:1347:                                   ; preds = %1339
  br label %1348

; <label>:1348:                                   ; preds = %1347, %1345
  %1349 = phi i64 [ %1342, %1345 ], [ %1342, %1347 ]
  %1350 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %1349)
  %1351 = extractvalue { i64, i1 } %1350, 0
  %1352 = extractvalue { i64, i1 } %1350, 1
  %1353 = icmp eq i1 %1352, true
  br i1 %1353, label %1354, label %1356

; <label>:1354:                                   ; preds = %1348
  %1355 = call i64 @overflow_fail(i64 2572)
  br label %1357

; <label>:1356:                                   ; preds = %1348
  br label %1357

; <label>:1357:                                   ; preds = %1356, %1354
  %1358 = phi i64 [ %1351, %1354 ], [ %1351, %1356 ]
  %1359 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %1358)
  %1360 = extractvalue { i64, i1 } %1359, 0
  %1361 = extractvalue { i64, i1 } %1359, 1
  %1362 = icmp eq i1 %1361, true
  br i1 %1362, label %1363, label %1365

; <label>:1363:                                   ; preds = %1357
  %1364 = call i64 @overflow_fail(i64 2572)
  br label %1366

; <label>:1365:                                   ; preds = %1357
  br label %1366

; <label>:1366:                                   ; preds = %1365, %1363
  %1367 = phi i64 [ %1360, %1363 ], [ %1360, %1365 ]
  %1368 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %1367)
  %1369 = extractvalue { i64, i1 } %1368, 0
  %1370 = extractvalue { i64, i1 } %1368, 1
  %1371 = icmp eq i1 %1370, true
  br i1 %1371, label %1372, label %1374

; <label>:1372:                                   ; preds = %1366
  %1373 = call i64 @overflow_fail(i64 2572)
  br label %1375

; <label>:1374:                                   ; preds = %1366
  br label %1375

; <label>:1375:                                   ; preds = %1374, %1372
  %1376 = phi i64 [ %1369, %1372 ], [ %1369, %1374 ]
  %1377 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %1376)
  %1378 = extractvalue { i64, i1 } %1377, 0
  %1379 = extractvalue { i64, i1 } %1377, 1
  %1380 = icmp eq i1 %1379, true
  br i1 %1380, label %1381, label %1383

; <label>:1381:                                   ; preds = %1375
  %1382 = call i64 @overflow_fail(i64 2572)
  br label %1384

; <label>:1383:                                   ; preds = %1375
  br label %1384

; <label>:1384:                                   ; preds = %1383, %1381
  %1385 = phi i64 [ %1378, %1381 ], [ %1378, %1383 ]
  %1386 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %1385)
  %1387 = extractvalue { i64, i1 } %1386, 0
  %1388 = extractvalue { i64, i1 } %1386, 1
  %1389 = icmp eq i1 %1388, true
  br i1 %1389, label %1390, label %1392

; <label>:1390:                                   ; preds = %1384
  %1391 = call i64 @overflow_fail(i64 2572)
  br label %1393

; <label>:1392:                                   ; preds = %1384
  br label %1393

; <label>:1393:                                   ; preds = %1392, %1390
  %1394 = phi i64 [ %1387, %1390 ], [ %1387, %1392 ]
  br label %1732

else51:                                           ; preds = %else48
  %eqtmp52 = icmp eq i64 %a0, 19
  %1395 = icmp eq i1 %eqtmp52, true
  br i1 %1395, label %then53, label %else54

then53:                                           ; preds = %else51
  %1396 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %1397 = extractvalue { i64, i1 } %1396, 0
  %1398 = extractvalue { i64, i1 } %1396, 1
  %1399 = icmp eq i1 %1398, true
  br i1 %1399, label %1400, label %1402

; <label>:1400:                                   ; preds = %then53
  %1401 = call i64 @overflow_fail(i64 2854)
  br label %1403

; <label>:1402:                                   ; preds = %then53
  br label %1403

; <label>:1403:                                   ; preds = %1402, %1400
  %1404 = phi i64 [ %1397, %1400 ], [ %1397, %1402 ]
  %1405 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %1404)
  %1406 = extractvalue { i64, i1 } %1405, 0
  %1407 = extractvalue { i64, i1 } %1405, 1
  %1408 = icmp eq i1 %1407, true
  br i1 %1408, label %1409, label %1411

; <label>:1409:                                   ; preds = %1403
  %1410 = call i64 @overflow_fail(i64 2854)
  br label %1412

; <label>:1411:                                   ; preds = %1403
  br label %1412

; <label>:1412:                                   ; preds = %1411, %1409
  %1413 = phi i64 [ %1406, %1409 ], [ %1406, %1411 ]
  %1414 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %1413)
  %1415 = extractvalue { i64, i1 } %1414, 0
  %1416 = extractvalue { i64, i1 } %1414, 1
  %1417 = icmp eq i1 %1416, true
  br i1 %1417, label %1418, label %1420

; <label>:1418:                                   ; preds = %1412
  %1419 = call i64 @overflow_fail(i64 2854)
  br label %1421

; <label>:1420:                                   ; preds = %1412
  br label %1421

; <label>:1421:                                   ; preds = %1420, %1418
  %1422 = phi i64 [ %1415, %1418 ], [ %1415, %1420 ]
  %1423 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %1422)
  %1424 = extractvalue { i64, i1 } %1423, 0
  %1425 = extractvalue { i64, i1 } %1423, 1
  %1426 = icmp eq i1 %1425, true
  br i1 %1426, label %1427, label %1429

; <label>:1427:                                   ; preds = %1421
  %1428 = call i64 @overflow_fail(i64 2854)
  br label %1430

; <label>:1429:                                   ; preds = %1421
  br label %1430

; <label>:1430:                                   ; preds = %1429, %1427
  %1431 = phi i64 [ %1424, %1427 ], [ %1424, %1429 ]
  %1432 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %1431)
  %1433 = extractvalue { i64, i1 } %1432, 0
  %1434 = extractvalue { i64, i1 } %1432, 1
  %1435 = icmp eq i1 %1434, true
  br i1 %1435, label %1436, label %1438

; <label>:1436:                                   ; preds = %1430
  %1437 = call i64 @overflow_fail(i64 2854)
  br label %1439

; <label>:1438:                                   ; preds = %1430
  br label %1439

; <label>:1439:                                   ; preds = %1438, %1436
  %1440 = phi i64 [ %1433, %1436 ], [ %1433, %1438 ]
  %1441 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %1440)
  %1442 = extractvalue { i64, i1 } %1441, 0
  %1443 = extractvalue { i64, i1 } %1441, 1
  %1444 = icmp eq i1 %1443, true
  br i1 %1444, label %1445, label %1447

; <label>:1445:                                   ; preds = %1439
  %1446 = call i64 @overflow_fail(i64 2854)
  br label %1448

; <label>:1447:                                   ; preds = %1439
  br label %1448

; <label>:1448:                                   ; preds = %1447, %1445
  %1449 = phi i64 [ %1442, %1445 ], [ %1442, %1447 ]
  %1450 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %1449)
  %1451 = extractvalue { i64, i1 } %1450, 0
  %1452 = extractvalue { i64, i1 } %1450, 1
  %1453 = icmp eq i1 %1452, true
  br i1 %1453, label %1454, label %1456

; <label>:1454:                                   ; preds = %1448
  %1455 = call i64 @overflow_fail(i64 2854)
  br label %1457

; <label>:1456:                                   ; preds = %1448
  br label %1457

; <label>:1457:                                   ; preds = %1456, %1454
  %1458 = phi i64 [ %1451, %1454 ], [ %1451, %1456 ]
  %1459 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %1458)
  %1460 = extractvalue { i64, i1 } %1459, 0
  %1461 = extractvalue { i64, i1 } %1459, 1
  %1462 = icmp eq i1 %1461, true
  br i1 %1462, label %1463, label %1465

; <label>:1463:                                   ; preds = %1457
  %1464 = call i64 @overflow_fail(i64 2854)
  br label %1466

; <label>:1465:                                   ; preds = %1457
  br label %1466

; <label>:1466:                                   ; preds = %1465, %1463
  %1467 = phi i64 [ %1460, %1463 ], [ %1460, %1465 ]
  %1468 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %1467)
  %1469 = extractvalue { i64, i1 } %1468, 0
  %1470 = extractvalue { i64, i1 } %1468, 1
  %1471 = icmp eq i1 %1470, true
  br i1 %1471, label %1472, label %1474

; <label>:1472:                                   ; preds = %1466
  %1473 = call i64 @overflow_fail(i64 2854)
  br label %1475

; <label>:1474:                                   ; preds = %1466
  br label %1475

; <label>:1475:                                   ; preds = %1474, %1472
  %1476 = phi i64 [ %1469, %1472 ], [ %1469, %1474 ]
  %1477 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %1476)
  %1478 = extractvalue { i64, i1 } %1477, 0
  %1479 = extractvalue { i64, i1 } %1477, 1
  %1480 = icmp eq i1 %1479, true
  br i1 %1480, label %1481, label %1483

; <label>:1481:                                   ; preds = %1475
  %1482 = call i64 @overflow_fail(i64 2854)
  br label %1484

; <label>:1483:                                   ; preds = %1475
  br label %1484

; <label>:1484:                                   ; preds = %1483, %1481
  %1485 = phi i64 [ %1478, %1481 ], [ %1478, %1483 ]
  %1486 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %1485)
  %1487 = extractvalue { i64, i1 } %1486, 0
  %1488 = extractvalue { i64, i1 } %1486, 1
  %1489 = icmp eq i1 %1488, true
  br i1 %1489, label %1490, label %1492

; <label>:1490:                                   ; preds = %1484
  %1491 = call i64 @overflow_fail(i64 2854)
  br label %1493

; <label>:1492:                                   ; preds = %1484
  br label %1493

; <label>:1493:                                   ; preds = %1492, %1490
  %1494 = phi i64 [ %1487, %1490 ], [ %1487, %1492 ]
  %1495 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %1494)
  %1496 = extractvalue { i64, i1 } %1495, 0
  %1497 = extractvalue { i64, i1 } %1495, 1
  %1498 = icmp eq i1 %1497, true
  br i1 %1498, label %1499, label %1501

; <label>:1499:                                   ; preds = %1493
  %1500 = call i64 @overflow_fail(i64 2854)
  br label %1502

; <label>:1501:                                   ; preds = %1493
  br label %1502

; <label>:1502:                                   ; preds = %1501, %1499
  %1503 = phi i64 [ %1496, %1499 ], [ %1496, %1501 ]
  %1504 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %1503)
  %1505 = extractvalue { i64, i1 } %1504, 0
  %1506 = extractvalue { i64, i1 } %1504, 1
  %1507 = icmp eq i1 %1506, true
  br i1 %1507, label %1508, label %1510

; <label>:1508:                                   ; preds = %1502
  %1509 = call i64 @overflow_fail(i64 2854)
  br label %1511

; <label>:1510:                                   ; preds = %1502
  br label %1511

; <label>:1511:                                   ; preds = %1510, %1508
  %1512 = phi i64 [ %1505, %1508 ], [ %1505, %1510 ]
  %1513 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %1512)
  %1514 = extractvalue { i64, i1 } %1513, 0
  %1515 = extractvalue { i64, i1 } %1513, 1
  %1516 = icmp eq i1 %1515, true
  br i1 %1516, label %1517, label %1519

; <label>:1517:                                   ; preds = %1511
  %1518 = call i64 @overflow_fail(i64 2854)
  br label %1520

; <label>:1519:                                   ; preds = %1511
  br label %1520

; <label>:1520:                                   ; preds = %1519, %1517
  %1521 = phi i64 [ %1514, %1517 ], [ %1514, %1519 ]
  %1522 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %1521)
  %1523 = extractvalue { i64, i1 } %1522, 0
  %1524 = extractvalue { i64, i1 } %1522, 1
  %1525 = icmp eq i1 %1524, true
  br i1 %1525, label %1526, label %1528

; <label>:1526:                                   ; preds = %1520
  %1527 = call i64 @overflow_fail(i64 2854)
  br label %1529

; <label>:1528:                                   ; preds = %1520
  br label %1529

; <label>:1529:                                   ; preds = %1528, %1526
  %1530 = phi i64 [ %1523, %1526 ], [ %1523, %1528 ]
  %1531 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %1530)
  %1532 = extractvalue { i64, i1 } %1531, 0
  %1533 = extractvalue { i64, i1 } %1531, 1
  %1534 = icmp eq i1 %1533, true
  br i1 %1534, label %1535, label %1537

; <label>:1535:                                   ; preds = %1529
  %1536 = call i64 @overflow_fail(i64 2854)
  br label %1538

; <label>:1537:                                   ; preds = %1529
  br label %1538

; <label>:1538:                                   ; preds = %1537, %1535
  %1539 = phi i64 [ %1532, %1535 ], [ %1532, %1537 ]
  %1540 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %1539)
  %1541 = extractvalue { i64, i1 } %1540, 0
  %1542 = extractvalue { i64, i1 } %1540, 1
  %1543 = icmp eq i1 %1542, true
  br i1 %1543, label %1544, label %1546

; <label>:1544:                                   ; preds = %1538
  %1545 = call i64 @overflow_fail(i64 2854)
  br label %1547

; <label>:1546:                                   ; preds = %1538
  br label %1547

; <label>:1547:                                   ; preds = %1546, %1544
  %1548 = phi i64 [ %1541, %1544 ], [ %1541, %1546 ]
  %1549 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 19, i64 %1548)
  %1550 = extractvalue { i64, i1 } %1549, 0
  %1551 = extractvalue { i64, i1 } %1549, 1
  %1552 = icmp eq i1 %1551, true
  br i1 %1552, label %1553, label %1555

; <label>:1553:                                   ; preds = %1547
  %1554 = call i64 @overflow_fail(i64 2854)
  br label %1556

; <label>:1555:                                   ; preds = %1547
  br label %1556

; <label>:1556:                                   ; preds = %1555, %1553
  %1557 = phi i64 [ %1550, %1553 ], [ %1550, %1555 ]
  br label %1731

else54:                                           ; preds = %else51
  %eqtmp55 = icmp eq i64 %a0, 20
  %1558 = icmp eq i1 %eqtmp55, true
  br i1 %1558, label %then56, label %else57

then56:                                           ; preds = %else54
  %1559 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %1560 = extractvalue { i64, i1 } %1559, 0
  %1561 = extractvalue { i64, i1 } %1559, 1
  %1562 = icmp eq i1 %1561, true
  br i1 %1562, label %1563, label %1565

; <label>:1563:                                   ; preds = %then56
  %1564 = call i64 @overflow_fail(i64 3151)
  br label %1566

; <label>:1565:                                   ; preds = %then56
  br label %1566

; <label>:1566:                                   ; preds = %1565, %1563
  %1567 = phi i64 [ %1560, %1563 ], [ %1560, %1565 ]
  %1568 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %1567)
  %1569 = extractvalue { i64, i1 } %1568, 0
  %1570 = extractvalue { i64, i1 } %1568, 1
  %1571 = icmp eq i1 %1570, true
  br i1 %1571, label %1572, label %1574

; <label>:1572:                                   ; preds = %1566
  %1573 = call i64 @overflow_fail(i64 3151)
  br label %1575

; <label>:1574:                                   ; preds = %1566
  br label %1575

; <label>:1575:                                   ; preds = %1574, %1572
  %1576 = phi i64 [ %1569, %1572 ], [ %1569, %1574 ]
  %1577 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %1576)
  %1578 = extractvalue { i64, i1 } %1577, 0
  %1579 = extractvalue { i64, i1 } %1577, 1
  %1580 = icmp eq i1 %1579, true
  br i1 %1580, label %1581, label %1583

; <label>:1581:                                   ; preds = %1575
  %1582 = call i64 @overflow_fail(i64 3151)
  br label %1584

; <label>:1583:                                   ; preds = %1575
  br label %1584

; <label>:1584:                                   ; preds = %1583, %1581
  %1585 = phi i64 [ %1578, %1581 ], [ %1578, %1583 ]
  %1586 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %1585)
  %1587 = extractvalue { i64, i1 } %1586, 0
  %1588 = extractvalue { i64, i1 } %1586, 1
  %1589 = icmp eq i1 %1588, true
  br i1 %1589, label %1590, label %1592

; <label>:1590:                                   ; preds = %1584
  %1591 = call i64 @overflow_fail(i64 3151)
  br label %1593

; <label>:1592:                                   ; preds = %1584
  br label %1593

; <label>:1593:                                   ; preds = %1592, %1590
  %1594 = phi i64 [ %1587, %1590 ], [ %1587, %1592 ]
  %1595 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %1594)
  %1596 = extractvalue { i64, i1 } %1595, 0
  %1597 = extractvalue { i64, i1 } %1595, 1
  %1598 = icmp eq i1 %1597, true
  br i1 %1598, label %1599, label %1601

; <label>:1599:                                   ; preds = %1593
  %1600 = call i64 @overflow_fail(i64 3151)
  br label %1602

; <label>:1601:                                   ; preds = %1593
  br label %1602

; <label>:1602:                                   ; preds = %1601, %1599
  %1603 = phi i64 [ %1596, %1599 ], [ %1596, %1601 ]
  %1604 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %1603)
  %1605 = extractvalue { i64, i1 } %1604, 0
  %1606 = extractvalue { i64, i1 } %1604, 1
  %1607 = icmp eq i1 %1606, true
  br i1 %1607, label %1608, label %1610

; <label>:1608:                                   ; preds = %1602
  %1609 = call i64 @overflow_fail(i64 3151)
  br label %1611

; <label>:1610:                                   ; preds = %1602
  br label %1611

; <label>:1611:                                   ; preds = %1610, %1608
  %1612 = phi i64 [ %1605, %1608 ], [ %1605, %1610 ]
  %1613 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %1612)
  %1614 = extractvalue { i64, i1 } %1613, 0
  %1615 = extractvalue { i64, i1 } %1613, 1
  %1616 = icmp eq i1 %1615, true
  br i1 %1616, label %1617, label %1619

; <label>:1617:                                   ; preds = %1611
  %1618 = call i64 @overflow_fail(i64 3151)
  br label %1620

; <label>:1619:                                   ; preds = %1611
  br label %1620

; <label>:1620:                                   ; preds = %1619, %1617
  %1621 = phi i64 [ %1614, %1617 ], [ %1614, %1619 ]
  %1622 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %1621)
  %1623 = extractvalue { i64, i1 } %1622, 0
  %1624 = extractvalue { i64, i1 } %1622, 1
  %1625 = icmp eq i1 %1624, true
  br i1 %1625, label %1626, label %1628

; <label>:1626:                                   ; preds = %1620
  %1627 = call i64 @overflow_fail(i64 3151)
  br label %1629

; <label>:1628:                                   ; preds = %1620
  br label %1629

; <label>:1629:                                   ; preds = %1628, %1626
  %1630 = phi i64 [ %1623, %1626 ], [ %1623, %1628 ]
  %1631 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %1630)
  %1632 = extractvalue { i64, i1 } %1631, 0
  %1633 = extractvalue { i64, i1 } %1631, 1
  %1634 = icmp eq i1 %1633, true
  br i1 %1634, label %1635, label %1637

; <label>:1635:                                   ; preds = %1629
  %1636 = call i64 @overflow_fail(i64 3151)
  br label %1638

; <label>:1637:                                   ; preds = %1629
  br label %1638

; <label>:1638:                                   ; preds = %1637, %1635
  %1639 = phi i64 [ %1632, %1635 ], [ %1632, %1637 ]
  %1640 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %1639)
  %1641 = extractvalue { i64, i1 } %1640, 0
  %1642 = extractvalue { i64, i1 } %1640, 1
  %1643 = icmp eq i1 %1642, true
  br i1 %1643, label %1644, label %1646

; <label>:1644:                                   ; preds = %1638
  %1645 = call i64 @overflow_fail(i64 3151)
  br label %1647

; <label>:1646:                                   ; preds = %1638
  br label %1647

; <label>:1647:                                   ; preds = %1646, %1644
  %1648 = phi i64 [ %1641, %1644 ], [ %1641, %1646 ]
  %1649 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %1648)
  %1650 = extractvalue { i64, i1 } %1649, 0
  %1651 = extractvalue { i64, i1 } %1649, 1
  %1652 = icmp eq i1 %1651, true
  br i1 %1652, label %1653, label %1655

; <label>:1653:                                   ; preds = %1647
  %1654 = call i64 @overflow_fail(i64 3151)
  br label %1656

; <label>:1655:                                   ; preds = %1647
  br label %1656

; <label>:1656:                                   ; preds = %1655, %1653
  %1657 = phi i64 [ %1650, %1653 ], [ %1650, %1655 ]
  %1658 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %1657)
  %1659 = extractvalue { i64, i1 } %1658, 0
  %1660 = extractvalue { i64, i1 } %1658, 1
  %1661 = icmp eq i1 %1660, true
  br i1 %1661, label %1662, label %1664

; <label>:1662:                                   ; preds = %1656
  %1663 = call i64 @overflow_fail(i64 3151)
  br label %1665

; <label>:1664:                                   ; preds = %1656
  br label %1665

; <label>:1665:                                   ; preds = %1664, %1662
  %1666 = phi i64 [ %1659, %1662 ], [ %1659, %1664 ]
  %1667 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %1666)
  %1668 = extractvalue { i64, i1 } %1667, 0
  %1669 = extractvalue { i64, i1 } %1667, 1
  %1670 = icmp eq i1 %1669, true
  br i1 %1670, label %1671, label %1673

; <label>:1671:                                   ; preds = %1665
  %1672 = call i64 @overflow_fail(i64 3151)
  br label %1674

; <label>:1673:                                   ; preds = %1665
  br label %1674

; <label>:1674:                                   ; preds = %1673, %1671
  %1675 = phi i64 [ %1668, %1671 ], [ %1668, %1673 ]
  %1676 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %1675)
  %1677 = extractvalue { i64, i1 } %1676, 0
  %1678 = extractvalue { i64, i1 } %1676, 1
  %1679 = icmp eq i1 %1678, true
  br i1 %1679, label %1680, label %1682

; <label>:1680:                                   ; preds = %1674
  %1681 = call i64 @overflow_fail(i64 3151)
  br label %1683

; <label>:1682:                                   ; preds = %1674
  br label %1683

; <label>:1683:                                   ; preds = %1682, %1680
  %1684 = phi i64 [ %1677, %1680 ], [ %1677, %1682 ]
  %1685 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %1684)
  %1686 = extractvalue { i64, i1 } %1685, 0
  %1687 = extractvalue { i64, i1 } %1685, 1
  %1688 = icmp eq i1 %1687, true
  br i1 %1688, label %1689, label %1691

; <label>:1689:                                   ; preds = %1683
  %1690 = call i64 @overflow_fail(i64 3151)
  br label %1692

; <label>:1691:                                   ; preds = %1683
  br label %1692

; <label>:1692:                                   ; preds = %1691, %1689
  %1693 = phi i64 [ %1686, %1689 ], [ %1686, %1691 ]
  %1694 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %1693)
  %1695 = extractvalue { i64, i1 } %1694, 0
  %1696 = extractvalue { i64, i1 } %1694, 1
  %1697 = icmp eq i1 %1696, true
  br i1 %1697, label %1698, label %1700

; <label>:1698:                                   ; preds = %1692
  %1699 = call i64 @overflow_fail(i64 3151)
  br label %1701

; <label>:1700:                                   ; preds = %1692
  br label %1701

; <label>:1701:                                   ; preds = %1700, %1698
  %1702 = phi i64 [ %1695, %1698 ], [ %1695, %1700 ]
  %1703 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %1702)
  %1704 = extractvalue { i64, i1 } %1703, 0
  %1705 = extractvalue { i64, i1 } %1703, 1
  %1706 = icmp eq i1 %1705, true
  br i1 %1706, label %1707, label %1709

; <label>:1707:                                   ; preds = %1701
  %1708 = call i64 @overflow_fail(i64 3151)
  br label %1710

; <label>:1709:                                   ; preds = %1701
  br label %1710

; <label>:1710:                                   ; preds = %1709, %1707
  %1711 = phi i64 [ %1704, %1707 ], [ %1704, %1709 ]
  %1712 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 19, i64 %1711)
  %1713 = extractvalue { i64, i1 } %1712, 0
  %1714 = extractvalue { i64, i1 } %1712, 1
  %1715 = icmp eq i1 %1714, true
  br i1 %1715, label %1716, label %1718

; <label>:1716:                                   ; preds = %1710
  %1717 = call i64 @overflow_fail(i64 3151)
  br label %1719

; <label>:1718:                                   ; preds = %1710
  br label %1719

; <label>:1719:                                   ; preds = %1718, %1716
  %1720 = phi i64 [ %1713, %1716 ], [ %1713, %1718 ]
  %1721 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 20, i64 %1720)
  %1722 = extractvalue { i64, i1 } %1721, 0
  %1723 = extractvalue { i64, i1 } %1721, 1
  %1724 = icmp eq i1 %1723, true
  br i1 %1724, label %1725, label %1727

; <label>:1725:                                   ; preds = %1719
  %1726 = call i64 @overflow_fail(i64 3151)
  br label %1728

; <label>:1727:                                   ; preds = %1719
  br label %1728

; <label>:1728:                                   ; preds = %1727, %1725
  %1729 = phi i64 [ %1722, %1725 ], [ %1722, %1727 ]
  br label %1730

else57:                                           ; preds = %else54
  br label %1730

; <label>:1730:                                   ; preds = %else57, %1728
  %iftmp = phi i64 [ %1729, %1728 ], [ -1, %else57 ]
  br label %1731

; <label>:1731:                                   ; preds = %1730, %1556
  %iftmp58 = phi i64 [ %1557, %1556 ], [ %iftmp, %1730 ]
  br label %1732

; <label>:1732:                                   ; preds = %1731, %1393
  %iftmp59 = phi i64 [ %1394, %1393 ], [ %iftmp58, %1731 ]
  br label %1733

; <label>:1733:                                   ; preds = %1732, %1239
  %iftmp60 = phi i64 [ %1240, %1239 ], [ %iftmp59, %1732 ]
  br label %1734

; <label>:1734:                                   ; preds = %1733, %1094
  %iftmp61 = phi i64 [ %1095, %1094 ], [ %iftmp60, %1733 ]
  br label %1735

; <label>:1735:                                   ; preds = %1734, %958
  %iftmp62 = phi i64 [ %959, %958 ], [ %iftmp61, %1734 ]
  br label %1736

; <label>:1736:                                   ; preds = %1735, %831
  %iftmp63 = phi i64 [ %832, %831 ], [ %iftmp62, %1735 ]
  br label %1737

; <label>:1737:                                   ; preds = %1736, %713
  %iftmp64 = phi i64 [ %714, %713 ], [ %iftmp63, %1736 ]
  br label %1738

; <label>:1738:                                   ; preds = %1737, %604
  %iftmp65 = phi i64 [ %605, %604 ], [ %iftmp64, %1737 ]
  br label %1739

; <label>:1739:                                   ; preds = %1738, %504
  %iftmp66 = phi i64 [ %505, %504 ], [ %iftmp65, %1738 ]
  br label %1740

; <label>:1740:                                   ; preds = %1739, %413
  %iftmp67 = phi i64 [ %414, %413 ], [ %iftmp66, %1739 ]
  br label %1741

; <label>:1741:                                   ; preds = %1740, %331
  %iftmp68 = phi i64 [ %332, %331 ], [ %iftmp67, %1740 ]
  br label %1742

; <label>:1742:                                   ; preds = %1741, %258
  %iftmp69 = phi i64 [ %259, %258 ], [ %iftmp68, %1741 ]
  br label %1743

; <label>:1743:                                   ; preds = %1742, %194
  %iftmp70 = phi i64 [ %195, %194 ], [ %iftmp69, %1742 ]
  br label %1744

; <label>:1744:                                   ; preds = %1743, %139
  %iftmp71 = phi i64 [ %140, %139 ], [ %iftmp70, %1743 ]
  br label %1745

; <label>:1745:                                   ; preds = %1744, %93
  %iftmp72 = phi i64 [ %94, %93 ], [ %iftmp71, %1744 ]
  br label %1746

; <label>:1746:                                   ; preds = %1745, %56
  %iftmp73 = phi i64 [ %57, %56 ], [ %iftmp72, %1745 ]
  br label %1747

; <label>:1747:                                   ; preds = %1746, %28
  %iftmp74 = phi i64 [ %29, %28 ], [ %iftmp73, %1746 ]
  br label %1748

; <label>:1748:                                   ; preds = %1747, %9
  %iftmp75 = phi i64 [ %10, %9 ], [ %iftmp74, %1747 ]
  br label %1749

; <label>:1749:                                   ; preds = %1748, %then
  %iftmp76 = phi i64 [ 1, %then ], [ %iftmp75, %1748 ]
  ret i64 %iftmp76
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

attributes #0 = { nounwind readnone }
