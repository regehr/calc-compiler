; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %6 = icmp eq i64 %0, 1
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %entry
  br label %10

; <label>:8:                                      ; preds = %entry
  %9 = icmp eq i64 %0, 2
  br i1 %9, label %22, label %26

; <label>:10:                                     ; preds = %28, %7
  %11 = phi i64 [ 1, %7 ], [ %29, %28 ]
  %12 = phi i64 [ 0, %7 ], [ %30, %28 ]
  %13 = phi i64 [ 0, %7 ], [ %31, %28 ]
  %14 = phi i64 [ 0, %7 ], [ %32, %28 ]
  %15 = phi i64 [ 0, %7 ], [ %33, %28 ]
  %16 = phi i64 [ 0, %7 ], [ %34, %28 ]
  %17 = phi i64 [ 0, %7 ], [ %35, %28 ]
  %18 = phi i64 [ 0, %7 ], [ %36, %28 ]
  %19 = phi i64 [ 0, %7 ], [ %37, %28 ]
  %20 = phi i64 [ 0, %7 ], [ %38, %28 ]
  %21 = phi i64 [ 0, %7 ], [ %39, %28 ]
  ret i64 %11

; <label>:22:                                     ; preds = %8
  %23 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %24 = extractvalue { i64, i1 } %23, 0
  %25 = extractvalue { i64, i1 } %23, 1
  br i1 %25, label %41, label %40

; <label>:26:                                     ; preds = %8
  %27 = icmp eq i64 %0, 3
  br i1 %27, label %42, label %46

; <label>:28:                                     ; preds = %48, %40
  %29 = phi i64 [ %24, %40 ], [ %49, %48 ]
  %30 = phi i64 [ 0, %40 ], [ %50, %48 ]
  %31 = phi i64 [ 0, %40 ], [ %51, %48 ]
  %32 = phi i64 [ 0, %40 ], [ %52, %48 ]
  %33 = phi i64 [ 0, %40 ], [ %53, %48 ]
  %34 = phi i64 [ 0, %40 ], [ %54, %48 ]
  %35 = phi i64 [ 0, %40 ], [ %55, %48 ]
  %36 = phi i64 [ 0, %40 ], [ %56, %48 ]
  %37 = phi i64 [ 0, %40 ], [ %57, %48 ]
  %38 = phi i64 [ 0, %40 ], [ %58, %48 ]
  %39 = phi i64 [ 0, %40 ], [ %59, %48 ]
  br label %10

; <label>:40:                                     ; preds = %22
  br label %28

; <label>:41:                                     ; preds = %22
  call void @overflow_fail(i32 68)
  unreachable

; <label>:42:                                     ; preds = %26
  %43 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %44 = extractvalue { i64, i1 } %43, 0
  %45 = extractvalue { i64, i1 } %43, 1
  br i1 %45, label %64, label %60

; <label>:46:                                     ; preds = %26
  %47 = icmp eq i64 %0, 4
  br i1 %47, label %67, label %71

; <label>:48:                                     ; preds = %73, %65
  %49 = phi i64 [ %62, %65 ], [ %74, %73 ]
  %50 = phi i64 [ 0, %65 ], [ %75, %73 ]
  %51 = phi i64 [ 0, %65 ], [ %76, %73 ]
  %52 = phi i64 [ 0, %65 ], [ %77, %73 ]
  %53 = phi i64 [ 0, %65 ], [ %78, %73 ]
  %54 = phi i64 [ 0, %65 ], [ %79, %73 ]
  %55 = phi i64 [ 0, %65 ], [ %80, %73 ]
  %56 = phi i64 [ 0, %65 ], [ %81, %73 ]
  %57 = phi i64 [ 0, %65 ], [ %82, %73 ]
  %58 = phi i64 [ 0, %65 ], [ %83, %73 ]
  %59 = phi i64 [ 0, %65 ], [ %84, %73 ]
  br label %28

; <label>:60:                                     ; preds = %42
  %61 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %44)
  %62 = extractvalue { i64, i1 } %61, 0
  %63 = extractvalue { i64, i1 } %61, 1
  br i1 %63, label %66, label %65

; <label>:64:                                     ; preds = %42
  call void @overflow_fail(i32 115)
  unreachable

; <label>:65:                                     ; preds = %60
  br label %48

; <label>:66:                                     ; preds = %60
  call void @overflow_fail(i32 110)
  unreachable

; <label>:67:                                     ; preds = %46
  %68 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %69 = extractvalue { i64, i1 } %68, 0
  %70 = extractvalue { i64, i1 } %68, 1
  br i1 %70, label %89, label %85

; <label>:71:                                     ; preds = %46
  %72 = icmp eq i64 %0, 5
  br i1 %72, label %97, label %101

; <label>:73:                                     ; preds = %103, %95
  %74 = phi i64 [ %92, %95 ], [ %104, %103 ]
  %75 = phi i64 [ 0, %95 ], [ %105, %103 ]
  %76 = phi i64 [ 0, %95 ], [ %106, %103 ]
  %77 = phi i64 [ 0, %95 ], [ %107, %103 ]
  %78 = phi i64 [ 0, %95 ], [ %108, %103 ]
  %79 = phi i64 [ 0, %95 ], [ %109, %103 ]
  %80 = phi i64 [ 0, %95 ], [ %110, %103 ]
  %81 = phi i64 [ 0, %95 ], [ %111, %103 ]
  %82 = phi i64 [ 0, %95 ], [ %112, %103 ]
  %83 = phi i64 [ 0, %95 ], [ %113, %103 ]
  %84 = phi i64 [ 0, %95 ], [ %114, %103 ]
  br label %48

; <label>:85:                                     ; preds = %67
  %86 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %69)
  %87 = extractvalue { i64, i1 } %86, 0
  %88 = extractvalue { i64, i1 } %86, 1
  br i1 %88, label %94, label %90

; <label>:89:                                     ; preds = %67
  call void @overflow_fail(i32 176)
  unreachable

; <label>:90:                                     ; preds = %85
  %91 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %87)
  %92 = extractvalue { i64, i1 } %91, 0
  %93 = extractvalue { i64, i1 } %91, 1
  br i1 %93, label %96, label %95

; <label>:94:                                     ; preds = %85
  call void @overflow_fail(i32 171)
  unreachable

; <label>:95:                                     ; preds = %90
  br label %73

; <label>:96:                                     ; preds = %90
  call void @overflow_fail(i32 166)
  unreachable

; <label>:97:                                     ; preds = %71
  %98 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %99 = extractvalue { i64, i1 } %98, 0
  %100 = extractvalue { i64, i1 } %98, 1
  br i1 %100, label %119, label %115

; <label>:101:                                    ; preds = %71
  %102 = icmp eq i64 %0, 6
  br i1 %102, label %132, label %136

; <label>:103:                                    ; preds = %138, %130
  %104 = phi i64 [ %127, %130 ], [ %139, %138 ]
  %105 = phi i64 [ 0, %130 ], [ %140, %138 ]
  %106 = phi i64 [ 0, %130 ], [ %141, %138 ]
  %107 = phi i64 [ 0, %130 ], [ %142, %138 ]
  %108 = phi i64 [ 0, %130 ], [ %143, %138 ]
  %109 = phi i64 [ 0, %130 ], [ %144, %138 ]
  %110 = phi i64 [ 0, %130 ], [ %145, %138 ]
  %111 = phi i64 [ 0, %130 ], [ %146, %138 ]
  %112 = phi i64 [ 0, %130 ], [ %147, %138 ]
  %113 = phi i64 [ 0, %130 ], [ %148, %138 ]
  %114 = phi i64 [ 0, %130 ], [ %149, %138 ]
  br label %73

; <label>:115:                                    ; preds = %97
  %116 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %99)
  %117 = extractvalue { i64, i1 } %116, 0
  %118 = extractvalue { i64, i1 } %116, 1
  br i1 %118, label %124, label %120

; <label>:119:                                    ; preds = %97
  call void @overflow_fail(i32 251)
  unreachable

; <label>:120:                                    ; preds = %115
  %121 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %117)
  %122 = extractvalue { i64, i1 } %121, 0
  %123 = extractvalue { i64, i1 } %121, 1
  br i1 %123, label %129, label %125

; <label>:124:                                    ; preds = %115
  call void @overflow_fail(i32 246)
  unreachable

; <label>:125:                                    ; preds = %120
  %126 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %122)
  %127 = extractvalue { i64, i1 } %126, 0
  %128 = extractvalue { i64, i1 } %126, 1
  br i1 %128, label %131, label %130

; <label>:129:                                    ; preds = %120
  call void @overflow_fail(i32 241)
  unreachable

; <label>:130:                                    ; preds = %125
  br label %103

; <label>:131:                                    ; preds = %125
  call void @overflow_fail(i32 236)
  unreachable

; <label>:132:                                    ; preds = %101
  %133 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %134 = extractvalue { i64, i1 } %133, 0
  %135 = extractvalue { i64, i1 } %133, 1
  br i1 %135, label %154, label %150

; <label>:136:                                    ; preds = %101
  %137 = icmp eq i64 %0, 7
  br i1 %137, label %172, label %176

; <label>:138:                                    ; preds = %178, %170
  %139 = phi i64 [ %167, %170 ], [ %179, %178 ]
  %140 = phi i64 [ 0, %170 ], [ %180, %178 ]
  %141 = phi i64 [ 0, %170 ], [ %181, %178 ]
  %142 = phi i64 [ 0, %170 ], [ %182, %178 ]
  %143 = phi i64 [ 0, %170 ], [ %183, %178 ]
  %144 = phi i64 [ 0, %170 ], [ %184, %178 ]
  %145 = phi i64 [ 0, %170 ], [ %185, %178 ]
  %146 = phi i64 [ 0, %170 ], [ %186, %178 ]
  %147 = phi i64 [ 0, %170 ], [ %187, %178 ]
  %148 = phi i64 [ 0, %170 ], [ %188, %178 ]
  %149 = phi i64 [ 0, %170 ], [ %189, %178 ]
  br label %103

; <label>:150:                                    ; preds = %132
  %151 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %134)
  %152 = extractvalue { i64, i1 } %151, 0
  %153 = extractvalue { i64, i1 } %151, 1
  br i1 %153, label %159, label %155

; <label>:154:                                    ; preds = %132
  call void @overflow_fail(i32 340)
  unreachable

; <label>:155:                                    ; preds = %150
  %156 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %152)
  %157 = extractvalue { i64, i1 } %156, 0
  %158 = extractvalue { i64, i1 } %156, 1
  br i1 %158, label %164, label %160

; <label>:159:                                    ; preds = %150
  call void @overflow_fail(i32 335)
  unreachable

; <label>:160:                                    ; preds = %155
  %161 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %157)
  %162 = extractvalue { i64, i1 } %161, 0
  %163 = extractvalue { i64, i1 } %161, 1
  br i1 %163, label %169, label %165

; <label>:164:                                    ; preds = %155
  call void @overflow_fail(i32 330)
  unreachable

; <label>:165:                                    ; preds = %160
  %166 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %162)
  %167 = extractvalue { i64, i1 } %166, 0
  %168 = extractvalue { i64, i1 } %166, 1
  br i1 %168, label %171, label %170

; <label>:169:                                    ; preds = %160
  call void @overflow_fail(i32 325)
  unreachable

; <label>:170:                                    ; preds = %165
  br label %138

; <label>:171:                                    ; preds = %165
  call void @overflow_fail(i32 320)
  unreachable

; <label>:172:                                    ; preds = %136
  %173 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %174 = extractvalue { i64, i1 } %173, 0
  %175 = extractvalue { i64, i1 } %173, 1
  br i1 %175, label %194, label %190

; <label>:176:                                    ; preds = %136
  %177 = icmp eq i64 %0, 8
  br i1 %177, label %217, label %221

; <label>:178:                                    ; preds = %223, %215
  %179 = phi i64 [ %212, %215 ], [ %224, %223 ]
  %180 = phi i64 [ 0, %215 ], [ %225, %223 ]
  %181 = phi i64 [ 0, %215 ], [ %226, %223 ]
  %182 = phi i64 [ 0, %215 ], [ %227, %223 ]
  %183 = phi i64 [ 0, %215 ], [ %228, %223 ]
  %184 = phi i64 [ 0, %215 ], [ %229, %223 ]
  %185 = phi i64 [ 0, %215 ], [ %230, %223 ]
  %186 = phi i64 [ 0, %215 ], [ %231, %223 ]
  %187 = phi i64 [ 0, %215 ], [ %232, %223 ]
  %188 = phi i64 [ 0, %215 ], [ %233, %223 ]
  %189 = phi i64 [ 0, %215 ], [ %234, %223 ]
  br label %138

; <label>:190:                                    ; preds = %172
  %191 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %174)
  %192 = extractvalue { i64, i1 } %191, 0
  %193 = extractvalue { i64, i1 } %191, 1
  br i1 %193, label %199, label %195

; <label>:194:                                    ; preds = %172
  call void @overflow_fail(i32 443)
  unreachable

; <label>:195:                                    ; preds = %190
  %196 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %192)
  %197 = extractvalue { i64, i1 } %196, 0
  %198 = extractvalue { i64, i1 } %196, 1
  br i1 %198, label %204, label %200

; <label>:199:                                    ; preds = %190
  call void @overflow_fail(i32 438)
  unreachable

; <label>:200:                                    ; preds = %195
  %201 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %197)
  %202 = extractvalue { i64, i1 } %201, 0
  %203 = extractvalue { i64, i1 } %201, 1
  br i1 %203, label %209, label %205

; <label>:204:                                    ; preds = %195
  call void @overflow_fail(i32 433)
  unreachable

; <label>:205:                                    ; preds = %200
  %206 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %202)
  %207 = extractvalue { i64, i1 } %206, 0
  %208 = extractvalue { i64, i1 } %206, 1
  br i1 %208, label %214, label %210

; <label>:209:                                    ; preds = %200
  call void @overflow_fail(i32 428)
  unreachable

; <label>:210:                                    ; preds = %205
  %211 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %207)
  %212 = extractvalue { i64, i1 } %211, 0
  %213 = extractvalue { i64, i1 } %211, 1
  br i1 %213, label %216, label %215

; <label>:214:                                    ; preds = %205
  call void @overflow_fail(i32 423)
  unreachable

; <label>:215:                                    ; preds = %210
  br label %178

; <label>:216:                                    ; preds = %210
  call void @overflow_fail(i32 418)
  unreachable

; <label>:217:                                    ; preds = %176
  %218 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %219 = extractvalue { i64, i1 } %218, 0
  %220 = extractvalue { i64, i1 } %218, 1
  br i1 %220, label %239, label %235

; <label>:221:                                    ; preds = %176
  %222 = icmp eq i64 %0, 9
  br i1 %222, label %267, label %271

; <label>:223:                                    ; preds = %273, %265
  %224 = phi i64 [ %262, %265 ], [ %274, %273 ]
  %225 = phi i64 [ 0, %265 ], [ %275, %273 ]
  %226 = phi i64 [ 0, %265 ], [ %276, %273 ]
  %227 = phi i64 [ 0, %265 ], [ %277, %273 ]
  %228 = phi i64 [ 0, %265 ], [ %278, %273 ]
  %229 = phi i64 [ 0, %265 ], [ %279, %273 ]
  %230 = phi i64 [ 0, %265 ], [ %280, %273 ]
  %231 = phi i64 [ 0, %265 ], [ %281, %273 ]
  %232 = phi i64 [ 0, %265 ], [ %282, %273 ]
  %233 = phi i64 [ 0, %265 ], [ %283, %273 ]
  %234 = phi i64 [ 0, %265 ], [ %284, %273 ]
  br label %178

; <label>:235:                                    ; preds = %217
  %236 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %219)
  %237 = extractvalue { i64, i1 } %236, 0
  %238 = extractvalue { i64, i1 } %236, 1
  br i1 %238, label %244, label %240

; <label>:239:                                    ; preds = %217
  call void @overflow_fail(i32 560)
  unreachable

; <label>:240:                                    ; preds = %235
  %241 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %237)
  %242 = extractvalue { i64, i1 } %241, 0
  %243 = extractvalue { i64, i1 } %241, 1
  br i1 %243, label %249, label %245

; <label>:244:                                    ; preds = %235
  call void @overflow_fail(i32 555)
  unreachable

; <label>:245:                                    ; preds = %240
  %246 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %242)
  %247 = extractvalue { i64, i1 } %246, 0
  %248 = extractvalue { i64, i1 } %246, 1
  br i1 %248, label %254, label %250

; <label>:249:                                    ; preds = %240
  call void @overflow_fail(i32 550)
  unreachable

; <label>:250:                                    ; preds = %245
  %251 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %247)
  %252 = extractvalue { i64, i1 } %251, 0
  %253 = extractvalue { i64, i1 } %251, 1
  br i1 %253, label %259, label %255

; <label>:254:                                    ; preds = %245
  call void @overflow_fail(i32 545)
  unreachable

; <label>:255:                                    ; preds = %250
  %256 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %252)
  %257 = extractvalue { i64, i1 } %256, 0
  %258 = extractvalue { i64, i1 } %256, 1
  br i1 %258, label %264, label %260

; <label>:259:                                    ; preds = %250
  call void @overflow_fail(i32 540)
  unreachable

; <label>:260:                                    ; preds = %255
  %261 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %257)
  %262 = extractvalue { i64, i1 } %261, 0
  %263 = extractvalue { i64, i1 } %261, 1
  br i1 %263, label %266, label %265

; <label>:264:                                    ; preds = %255
  call void @overflow_fail(i32 535)
  unreachable

; <label>:265:                                    ; preds = %260
  br label %223

; <label>:266:                                    ; preds = %260
  call void @overflow_fail(i32 530)
  unreachable

; <label>:267:                                    ; preds = %221
  %268 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %269 = extractvalue { i64, i1 } %268, 0
  %270 = extractvalue { i64, i1 } %268, 1
  br i1 %270, label %289, label %285

; <label>:271:                                    ; preds = %221
  %272 = icmp eq i64 %0, 10
  br i1 %272, label %322, label %326

; <label>:273:                                    ; preds = %328, %320
  %274 = phi i64 [ %317, %320 ], [ %329, %328 ]
  %275 = phi i64 [ 0, %320 ], [ %330, %328 ]
  %276 = phi i64 [ 0, %320 ], [ %331, %328 ]
  %277 = phi i64 [ 0, %320 ], [ %332, %328 ]
  %278 = phi i64 [ 0, %320 ], [ %333, %328 ]
  %279 = phi i64 [ 0, %320 ], [ %334, %328 ]
  %280 = phi i64 [ 0, %320 ], [ %335, %328 ]
  %281 = phi i64 [ 0, %320 ], [ %336, %328 ]
  %282 = phi i64 [ 0, %320 ], [ %337, %328 ]
  %283 = phi i64 [ 0, %320 ], [ %338, %328 ]
  %284 = phi i64 [ 0, %320 ], [ %339, %328 ]
  br label %223

; <label>:285:                                    ; preds = %267
  %286 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %269)
  %287 = extractvalue { i64, i1 } %286, 0
  %288 = extractvalue { i64, i1 } %286, 1
  br i1 %288, label %294, label %290

; <label>:289:                                    ; preds = %267
  call void @overflow_fail(i32 691)
  unreachable

; <label>:290:                                    ; preds = %285
  %291 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %287)
  %292 = extractvalue { i64, i1 } %291, 0
  %293 = extractvalue { i64, i1 } %291, 1
  br i1 %293, label %299, label %295

; <label>:294:                                    ; preds = %285
  call void @overflow_fail(i32 686)
  unreachable

; <label>:295:                                    ; preds = %290
  %296 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %292)
  %297 = extractvalue { i64, i1 } %296, 0
  %298 = extractvalue { i64, i1 } %296, 1
  br i1 %298, label %304, label %300

; <label>:299:                                    ; preds = %290
  call void @overflow_fail(i32 681)
  unreachable

; <label>:300:                                    ; preds = %295
  %301 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %297)
  %302 = extractvalue { i64, i1 } %301, 0
  %303 = extractvalue { i64, i1 } %301, 1
  br i1 %303, label %309, label %305

; <label>:304:                                    ; preds = %295
  call void @overflow_fail(i32 676)
  unreachable

; <label>:305:                                    ; preds = %300
  %306 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %302)
  %307 = extractvalue { i64, i1 } %306, 0
  %308 = extractvalue { i64, i1 } %306, 1
  br i1 %308, label %314, label %310

; <label>:309:                                    ; preds = %300
  call void @overflow_fail(i32 671)
  unreachable

; <label>:310:                                    ; preds = %305
  %311 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %307)
  %312 = extractvalue { i64, i1 } %311, 0
  %313 = extractvalue { i64, i1 } %311, 1
  br i1 %313, label %319, label %315

; <label>:314:                                    ; preds = %305
  call void @overflow_fail(i32 666)
  unreachable

; <label>:315:                                    ; preds = %310
  %316 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %312)
  %317 = extractvalue { i64, i1 } %316, 0
  %318 = extractvalue { i64, i1 } %316, 1
  br i1 %318, label %321, label %320

; <label>:319:                                    ; preds = %310
  call void @overflow_fail(i32 661)
  unreachable

; <label>:320:                                    ; preds = %315
  br label %273

; <label>:321:                                    ; preds = %315
  call void @overflow_fail(i32 656)
  unreachable

; <label>:322:                                    ; preds = %271
  %323 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %324 = extractvalue { i64, i1 } %323, 0
  %325 = extractvalue { i64, i1 } %323, 1
  br i1 %325, label %344, label %340

; <label>:326:                                    ; preds = %271
  %327 = icmp eq i64 %0, 11
  br i1 %327, label %382, label %386

; <label>:328:                                    ; preds = %388, %380
  %329 = phi i64 [ %377, %380 ], [ %389, %388 ]
  %330 = phi i64 [ 0, %380 ], [ %390, %388 ]
  %331 = phi i64 [ 0, %380 ], [ %391, %388 ]
  %332 = phi i64 [ 0, %380 ], [ %392, %388 ]
  %333 = phi i64 [ 0, %380 ], [ %393, %388 ]
  %334 = phi i64 [ 0, %380 ], [ %394, %388 ]
  %335 = phi i64 [ 0, %380 ], [ %395, %388 ]
  %336 = phi i64 [ 0, %380 ], [ %396, %388 ]
  %337 = phi i64 [ 0, %380 ], [ %397, %388 ]
  %338 = phi i64 [ 0, %380 ], [ %398, %388 ]
  %339 = phi i64 [ 0, %380 ], [ %399, %388 ]
  br label %273

; <label>:340:                                    ; preds = %322
  %341 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %324)
  %342 = extractvalue { i64, i1 } %341, 0
  %343 = extractvalue { i64, i1 } %341, 1
  br i1 %343, label %349, label %345

; <label>:344:                                    ; preds = %322
  call void @overflow_fail(i32 838)
  unreachable

; <label>:345:                                    ; preds = %340
  %346 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %342)
  %347 = extractvalue { i64, i1 } %346, 0
  %348 = extractvalue { i64, i1 } %346, 1
  br i1 %348, label %354, label %350

; <label>:349:                                    ; preds = %340
  call void @overflow_fail(i32 833)
  unreachable

; <label>:350:                                    ; preds = %345
  %351 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %347)
  %352 = extractvalue { i64, i1 } %351, 0
  %353 = extractvalue { i64, i1 } %351, 1
  br i1 %353, label %359, label %355

; <label>:354:                                    ; preds = %345
  call void @overflow_fail(i32 828)
  unreachable

; <label>:355:                                    ; preds = %350
  %356 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %352)
  %357 = extractvalue { i64, i1 } %356, 0
  %358 = extractvalue { i64, i1 } %356, 1
  br i1 %358, label %364, label %360

; <label>:359:                                    ; preds = %350
  call void @overflow_fail(i32 823)
  unreachable

; <label>:360:                                    ; preds = %355
  %361 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %357)
  %362 = extractvalue { i64, i1 } %361, 0
  %363 = extractvalue { i64, i1 } %361, 1
  br i1 %363, label %369, label %365

; <label>:364:                                    ; preds = %355
  call void @overflow_fail(i32 818)
  unreachable

; <label>:365:                                    ; preds = %360
  %366 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %362)
  %367 = extractvalue { i64, i1 } %366, 0
  %368 = extractvalue { i64, i1 } %366, 1
  br i1 %368, label %374, label %370

; <label>:369:                                    ; preds = %360
  call void @overflow_fail(i32 813)
  unreachable

; <label>:370:                                    ; preds = %365
  %371 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %367)
  %372 = extractvalue { i64, i1 } %371, 0
  %373 = extractvalue { i64, i1 } %371, 1
  br i1 %373, label %379, label %375

; <label>:374:                                    ; preds = %365
  call void @overflow_fail(i32 808)
  unreachable

; <label>:375:                                    ; preds = %370
  %376 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %372)
  %377 = extractvalue { i64, i1 } %376, 0
  %378 = extractvalue { i64, i1 } %376, 1
  br i1 %378, label %381, label %380

; <label>:379:                                    ; preds = %370
  call void @overflow_fail(i32 803)
  unreachable

; <label>:380:                                    ; preds = %375
  br label %328

; <label>:381:                                    ; preds = %375
  call void @overflow_fail(i32 797)
  unreachable

; <label>:382:                                    ; preds = %326
  %383 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %384 = extractvalue { i64, i1 } %383, 0
  %385 = extractvalue { i64, i1 } %383, 1
  br i1 %385, label %404, label %400

; <label>:386:                                    ; preds = %326
  %387 = icmp eq i64 %0, 12
  br i1 %387, label %447, label %451

; <label>:388:                                    ; preds = %453, %445
  %389 = phi i64 [ %442, %445 ], [ %454, %453 ]
  %390 = phi i64 [ 0, %445 ], [ %455, %453 ]
  %391 = phi i64 [ 0, %445 ], [ %456, %453 ]
  %392 = phi i64 [ 0, %445 ], [ %457, %453 ]
  %393 = phi i64 [ 0, %445 ], [ %458, %453 ]
  %394 = phi i64 [ 0, %445 ], [ %459, %453 ]
  %395 = phi i64 [ 0, %445 ], [ %460, %453 ]
  %396 = phi i64 [ 0, %445 ], [ %461, %453 ]
  %397 = phi i64 [ 0, %445 ], [ %462, %453 ]
  %398 = phi i64 [ 0, %445 ], [ %463, %453 ]
  %399 = phi i64 [ 0, %445 ], [ %464, %453 ]
  br label %328

; <label>:400:                                    ; preds = %382
  %401 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %384)
  %402 = extractvalue { i64, i1 } %401, 0
  %403 = extractvalue { i64, i1 } %401, 1
  br i1 %403, label %409, label %405

; <label>:404:                                    ; preds = %382
  call void @overflow_fail(i32 1000)
  unreachable

; <label>:405:                                    ; preds = %400
  %406 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %402)
  %407 = extractvalue { i64, i1 } %406, 0
  %408 = extractvalue { i64, i1 } %406, 1
  br i1 %408, label %414, label %410

; <label>:409:                                    ; preds = %400
  call void @overflow_fail(i32 995)
  unreachable

; <label>:410:                                    ; preds = %405
  %411 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %407)
  %412 = extractvalue { i64, i1 } %411, 0
  %413 = extractvalue { i64, i1 } %411, 1
  br i1 %413, label %419, label %415

; <label>:414:                                    ; preds = %405
  call void @overflow_fail(i32 990)
  unreachable

; <label>:415:                                    ; preds = %410
  %416 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %412)
  %417 = extractvalue { i64, i1 } %416, 0
  %418 = extractvalue { i64, i1 } %416, 1
  br i1 %418, label %424, label %420

; <label>:419:                                    ; preds = %410
  call void @overflow_fail(i32 985)
  unreachable

; <label>:420:                                    ; preds = %415
  %421 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %417)
  %422 = extractvalue { i64, i1 } %421, 0
  %423 = extractvalue { i64, i1 } %421, 1
  br i1 %423, label %429, label %425

; <label>:424:                                    ; preds = %415
  call void @overflow_fail(i32 980)
  unreachable

; <label>:425:                                    ; preds = %420
  %426 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %422)
  %427 = extractvalue { i64, i1 } %426, 0
  %428 = extractvalue { i64, i1 } %426, 1
  br i1 %428, label %434, label %430

; <label>:429:                                    ; preds = %420
  call void @overflow_fail(i32 975)
  unreachable

; <label>:430:                                    ; preds = %425
  %431 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %427)
  %432 = extractvalue { i64, i1 } %431, 0
  %433 = extractvalue { i64, i1 } %431, 1
  br i1 %433, label %439, label %435

; <label>:434:                                    ; preds = %425
  call void @overflow_fail(i32 970)
  unreachable

; <label>:435:                                    ; preds = %430
  %436 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %432)
  %437 = extractvalue { i64, i1 } %436, 0
  %438 = extractvalue { i64, i1 } %436, 1
  br i1 %438, label %444, label %440

; <label>:439:                                    ; preds = %430
  call void @overflow_fail(i32 965)
  unreachable

; <label>:440:                                    ; preds = %435
  %441 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %437)
  %442 = extractvalue { i64, i1 } %441, 0
  %443 = extractvalue { i64, i1 } %441, 1
  br i1 %443, label %446, label %445

; <label>:444:                                    ; preds = %435
  call void @overflow_fail(i32 959)
  unreachable

; <label>:445:                                    ; preds = %440
  br label %388

; <label>:446:                                    ; preds = %440
  call void @overflow_fail(i32 953)
  unreachable

; <label>:447:                                    ; preds = %386
  %448 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %449 = extractvalue { i64, i1 } %448, 0
  %450 = extractvalue { i64, i1 } %448, 1
  br i1 %450, label %469, label %465

; <label>:451:                                    ; preds = %386
  %452 = icmp eq i64 %0, 13
  br i1 %452, label %517, label %521

; <label>:453:                                    ; preds = %523, %515
  %454 = phi i64 [ %512, %515 ], [ %524, %523 ]
  %455 = phi i64 [ 0, %515 ], [ %525, %523 ]
  %456 = phi i64 [ 0, %515 ], [ %526, %523 ]
  %457 = phi i64 [ 0, %515 ], [ %527, %523 ]
  %458 = phi i64 [ 0, %515 ], [ %528, %523 ]
  %459 = phi i64 [ 0, %515 ], [ %529, %523 ]
  %460 = phi i64 [ 0, %515 ], [ %530, %523 ]
  %461 = phi i64 [ 0, %515 ], [ %531, %523 ]
  %462 = phi i64 [ 0, %515 ], [ %532, %523 ]
  %463 = phi i64 [ 0, %515 ], [ %533, %523 ]
  %464 = phi i64 [ 0, %515 ], [ %534, %523 ]
  br label %388

; <label>:465:                                    ; preds = %447
  %466 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %449)
  %467 = extractvalue { i64, i1 } %466, 0
  %468 = extractvalue { i64, i1 } %466, 1
  br i1 %468, label %474, label %470

; <label>:469:                                    ; preds = %447
  call void @overflow_fail(i32 1177)
  unreachable

; <label>:470:                                    ; preds = %465
  %471 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %467)
  %472 = extractvalue { i64, i1 } %471, 0
  %473 = extractvalue { i64, i1 } %471, 1
  br i1 %473, label %479, label %475

; <label>:474:                                    ; preds = %465
  call void @overflow_fail(i32 1172)
  unreachable

; <label>:475:                                    ; preds = %470
  %476 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %472)
  %477 = extractvalue { i64, i1 } %476, 0
  %478 = extractvalue { i64, i1 } %476, 1
  br i1 %478, label %484, label %480

; <label>:479:                                    ; preds = %470
  call void @overflow_fail(i32 1167)
  unreachable

; <label>:480:                                    ; preds = %475
  %481 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %477)
  %482 = extractvalue { i64, i1 } %481, 0
  %483 = extractvalue { i64, i1 } %481, 1
  br i1 %483, label %489, label %485

; <label>:484:                                    ; preds = %475
  call void @overflow_fail(i32 1162)
  unreachable

; <label>:485:                                    ; preds = %480
  %486 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %482)
  %487 = extractvalue { i64, i1 } %486, 0
  %488 = extractvalue { i64, i1 } %486, 1
  br i1 %488, label %494, label %490

; <label>:489:                                    ; preds = %480
  call void @overflow_fail(i32 1157)
  unreachable

; <label>:490:                                    ; preds = %485
  %491 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %487)
  %492 = extractvalue { i64, i1 } %491, 0
  %493 = extractvalue { i64, i1 } %491, 1
  br i1 %493, label %499, label %495

; <label>:494:                                    ; preds = %485
  call void @overflow_fail(i32 1152)
  unreachable

; <label>:495:                                    ; preds = %490
  %496 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %492)
  %497 = extractvalue { i64, i1 } %496, 0
  %498 = extractvalue { i64, i1 } %496, 1
  br i1 %498, label %504, label %500

; <label>:499:                                    ; preds = %490
  call void @overflow_fail(i32 1147)
  unreachable

; <label>:500:                                    ; preds = %495
  %501 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %497)
  %502 = extractvalue { i64, i1 } %501, 0
  %503 = extractvalue { i64, i1 } %501, 1
  br i1 %503, label %509, label %505

; <label>:504:                                    ; preds = %495
  call void @overflow_fail(i32 1142)
  unreachable

; <label>:505:                                    ; preds = %500
  %506 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %502)
  %507 = extractvalue { i64, i1 } %506, 0
  %508 = extractvalue { i64, i1 } %506, 1
  br i1 %508, label %514, label %510

; <label>:509:                                    ; preds = %500
  call void @overflow_fail(i32 1136)
  unreachable

; <label>:510:                                    ; preds = %505
  %511 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %507)
  %512 = extractvalue { i64, i1 } %511, 0
  %513 = extractvalue { i64, i1 } %511, 1
  br i1 %513, label %516, label %515

; <label>:514:                                    ; preds = %505
  call void @overflow_fail(i32 1130)
  unreachable

; <label>:515:                                    ; preds = %510
  br label %453

; <label>:516:                                    ; preds = %510
  call void @overflow_fail(i32 1124)
  unreachable

; <label>:517:                                    ; preds = %451
  %518 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %519 = extractvalue { i64, i1 } %518, 0
  %520 = extractvalue { i64, i1 } %518, 1
  br i1 %520, label %539, label %535

; <label>:521:                                    ; preds = %451
  %522 = icmp eq i64 %0, 14
  br i1 %522, label %592, label %596

; <label>:523:                                    ; preds = %598, %590
  %524 = phi i64 [ %587, %590 ], [ %599, %598 ]
  %525 = phi i64 [ 0, %590 ], [ %600, %598 ]
  %526 = phi i64 [ 0, %590 ], [ %601, %598 ]
  %527 = phi i64 [ 0, %590 ], [ %602, %598 ]
  %528 = phi i64 [ 0, %590 ], [ %603, %598 ]
  %529 = phi i64 [ 0, %590 ], [ %604, %598 ]
  %530 = phi i64 [ 0, %590 ], [ %605, %598 ]
  %531 = phi i64 [ 0, %590 ], [ %606, %598 ]
  %532 = phi i64 [ 0, %590 ], [ %607, %598 ]
  %533 = phi i64 [ 0, %590 ], [ %608, %598 ]
  %534 = phi i64 [ 0, %590 ], [ %609, %598 ]
  br label %453

; <label>:535:                                    ; preds = %517
  %536 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %519)
  %537 = extractvalue { i64, i1 } %536, 0
  %538 = extractvalue { i64, i1 } %536, 1
  br i1 %538, label %544, label %540

; <label>:539:                                    ; preds = %517
  call void @overflow_fail(i32 1369)
  unreachable

; <label>:540:                                    ; preds = %535
  %541 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %537)
  %542 = extractvalue { i64, i1 } %541, 0
  %543 = extractvalue { i64, i1 } %541, 1
  br i1 %543, label %549, label %545

; <label>:544:                                    ; preds = %535
  call void @overflow_fail(i32 1364)
  unreachable

; <label>:545:                                    ; preds = %540
  %546 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %542)
  %547 = extractvalue { i64, i1 } %546, 0
  %548 = extractvalue { i64, i1 } %546, 1
  br i1 %548, label %554, label %550

; <label>:549:                                    ; preds = %540
  call void @overflow_fail(i32 1359)
  unreachable

; <label>:550:                                    ; preds = %545
  %551 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %547)
  %552 = extractvalue { i64, i1 } %551, 0
  %553 = extractvalue { i64, i1 } %551, 1
  br i1 %553, label %559, label %555

; <label>:554:                                    ; preds = %545
  call void @overflow_fail(i32 1354)
  unreachable

; <label>:555:                                    ; preds = %550
  %556 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %552)
  %557 = extractvalue { i64, i1 } %556, 0
  %558 = extractvalue { i64, i1 } %556, 1
  br i1 %558, label %564, label %560

; <label>:559:                                    ; preds = %550
  call void @overflow_fail(i32 1349)
  unreachable

; <label>:560:                                    ; preds = %555
  %561 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %557)
  %562 = extractvalue { i64, i1 } %561, 0
  %563 = extractvalue { i64, i1 } %561, 1
  br i1 %563, label %569, label %565

; <label>:564:                                    ; preds = %555
  call void @overflow_fail(i32 1344)
  unreachable

; <label>:565:                                    ; preds = %560
  %566 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %562)
  %567 = extractvalue { i64, i1 } %566, 0
  %568 = extractvalue { i64, i1 } %566, 1
  br i1 %568, label %574, label %570

; <label>:569:                                    ; preds = %560
  call void @overflow_fail(i32 1339)
  unreachable

; <label>:570:                                    ; preds = %565
  %571 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %567)
  %572 = extractvalue { i64, i1 } %571, 0
  %573 = extractvalue { i64, i1 } %571, 1
  br i1 %573, label %579, label %575

; <label>:574:                                    ; preds = %565
  call void @overflow_fail(i32 1334)
  unreachable

; <label>:575:                                    ; preds = %570
  %576 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %572)
  %577 = extractvalue { i64, i1 } %576, 0
  %578 = extractvalue { i64, i1 } %576, 1
  br i1 %578, label %584, label %580

; <label>:579:                                    ; preds = %570
  call void @overflow_fail(i32 1328)
  unreachable

; <label>:580:                                    ; preds = %575
  %581 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %577)
  %582 = extractvalue { i64, i1 } %581, 0
  %583 = extractvalue { i64, i1 } %581, 1
  br i1 %583, label %589, label %585

; <label>:584:                                    ; preds = %575
  call void @overflow_fail(i32 1322)
  unreachable

; <label>:585:                                    ; preds = %580
  %586 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %582)
  %587 = extractvalue { i64, i1 } %586, 0
  %588 = extractvalue { i64, i1 } %586, 1
  br i1 %588, label %591, label %590

; <label>:589:                                    ; preds = %580
  call void @overflow_fail(i32 1316)
  unreachable

; <label>:590:                                    ; preds = %585
  br label %523

; <label>:591:                                    ; preds = %585
  call void @overflow_fail(i32 1310)
  unreachable

; <label>:592:                                    ; preds = %521
  %593 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %594 = extractvalue { i64, i1 } %593, 0
  %595 = extractvalue { i64, i1 } %593, 1
  br i1 %595, label %614, label %610

; <label>:596:                                    ; preds = %521
  %597 = icmp eq i64 %0, 15
  br i1 %597, label %672, label %676

; <label>:598:                                    ; preds = %678, %670
  %599 = phi i64 [ %667, %670 ], [ %679, %678 ]
  %600 = phi i64 [ 0, %670 ], [ %680, %678 ]
  %601 = phi i64 [ 0, %670 ], [ %681, %678 ]
  %602 = phi i64 [ 0, %670 ], [ %682, %678 ]
  %603 = phi i64 [ 0, %670 ], [ %683, %678 ]
  %604 = phi i64 [ 0, %670 ], [ %684, %678 ]
  %605 = phi i64 [ 0, %670 ], [ %685, %678 ]
  %606 = phi i64 [ 0, %670 ], [ %686, %678 ]
  %607 = phi i64 [ 0, %670 ], [ %687, %678 ]
  %608 = phi i64 [ 0, %670 ], [ %688, %678 ]
  %609 = phi i64 [ 0, %670 ], [ %689, %678 ]
  br label %523

; <label>:610:                                    ; preds = %592
  %611 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %594)
  %612 = extractvalue { i64, i1 } %611, 0
  %613 = extractvalue { i64, i1 } %611, 1
  br i1 %613, label %619, label %615

; <label>:614:                                    ; preds = %592
  call void @overflow_fail(i32 1576)
  unreachable

; <label>:615:                                    ; preds = %610
  %616 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %612)
  %617 = extractvalue { i64, i1 } %616, 0
  %618 = extractvalue { i64, i1 } %616, 1
  br i1 %618, label %624, label %620

; <label>:619:                                    ; preds = %610
  call void @overflow_fail(i32 1571)
  unreachable

; <label>:620:                                    ; preds = %615
  %621 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %617)
  %622 = extractvalue { i64, i1 } %621, 0
  %623 = extractvalue { i64, i1 } %621, 1
  br i1 %623, label %629, label %625

; <label>:624:                                    ; preds = %615
  call void @overflow_fail(i32 1566)
  unreachable

; <label>:625:                                    ; preds = %620
  %626 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %622)
  %627 = extractvalue { i64, i1 } %626, 0
  %628 = extractvalue { i64, i1 } %626, 1
  br i1 %628, label %634, label %630

; <label>:629:                                    ; preds = %620
  call void @overflow_fail(i32 1561)
  unreachable

; <label>:630:                                    ; preds = %625
  %631 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %627)
  %632 = extractvalue { i64, i1 } %631, 0
  %633 = extractvalue { i64, i1 } %631, 1
  br i1 %633, label %639, label %635

; <label>:634:                                    ; preds = %625
  call void @overflow_fail(i32 1556)
  unreachable

; <label>:635:                                    ; preds = %630
  %636 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %632)
  %637 = extractvalue { i64, i1 } %636, 0
  %638 = extractvalue { i64, i1 } %636, 1
  br i1 %638, label %644, label %640

; <label>:639:                                    ; preds = %630
  call void @overflow_fail(i32 1551)
  unreachable

; <label>:640:                                    ; preds = %635
  %641 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %637)
  %642 = extractvalue { i64, i1 } %641, 0
  %643 = extractvalue { i64, i1 } %641, 1
  br i1 %643, label %649, label %645

; <label>:644:                                    ; preds = %635
  call void @overflow_fail(i32 1546)
  unreachable

; <label>:645:                                    ; preds = %640
  %646 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %642)
  %647 = extractvalue { i64, i1 } %646, 0
  %648 = extractvalue { i64, i1 } %646, 1
  br i1 %648, label %654, label %650

; <label>:649:                                    ; preds = %640
  call void @overflow_fail(i32 1541)
  unreachable

; <label>:650:                                    ; preds = %645
  %651 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %647)
  %652 = extractvalue { i64, i1 } %651, 0
  %653 = extractvalue { i64, i1 } %651, 1
  br i1 %653, label %659, label %655

; <label>:654:                                    ; preds = %645
  call void @overflow_fail(i32 1535)
  unreachable

; <label>:655:                                    ; preds = %650
  %656 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %652)
  %657 = extractvalue { i64, i1 } %656, 0
  %658 = extractvalue { i64, i1 } %656, 1
  br i1 %658, label %664, label %660

; <label>:659:                                    ; preds = %650
  call void @overflow_fail(i32 1529)
  unreachable

; <label>:660:                                    ; preds = %655
  %661 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %657)
  %662 = extractvalue { i64, i1 } %661, 0
  %663 = extractvalue { i64, i1 } %661, 1
  br i1 %663, label %669, label %665

; <label>:664:                                    ; preds = %655
  call void @overflow_fail(i32 1523)
  unreachable

; <label>:665:                                    ; preds = %660
  %666 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %662)
  %667 = extractvalue { i64, i1 } %666, 0
  %668 = extractvalue { i64, i1 } %666, 1
  br i1 %668, label %671, label %670

; <label>:669:                                    ; preds = %660
  call void @overflow_fail(i32 1517)
  unreachable

; <label>:670:                                    ; preds = %665
  br label %598

; <label>:671:                                    ; preds = %665
  call void @overflow_fail(i32 1511)
  unreachable

; <label>:672:                                    ; preds = %596
  %673 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %674 = extractvalue { i64, i1 } %673, 0
  %675 = extractvalue { i64, i1 } %673, 1
  br i1 %675, label %694, label %690

; <label>:676:                                    ; preds = %596
  %677 = icmp eq i64 %0, 16
  br i1 %677, label %757, label %761

; <label>:678:                                    ; preds = %763, %755
  %679 = phi i64 [ %752, %755 ], [ %764, %763 ]
  %680 = phi i64 [ 0, %755 ], [ %765, %763 ]
  %681 = phi i64 [ 0, %755 ], [ %766, %763 ]
  %682 = phi i64 [ 0, %755 ], [ %767, %763 ]
  %683 = phi i64 [ 0, %755 ], [ %768, %763 ]
  %684 = phi i64 [ 0, %755 ], [ %769, %763 ]
  %685 = phi i64 [ 0, %755 ], [ %770, %763 ]
  %686 = phi i64 [ 0, %755 ], [ %771, %763 ]
  %687 = phi i64 [ 0, %755 ], [ %772, %763 ]
  %688 = phi i64 [ 0, %755 ], [ %773, %763 ]
  %689 = phi i64 [ 0, %755 ], [ %774, %763 ]
  br label %598

; <label>:690:                                    ; preds = %672
  %691 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %674)
  %692 = extractvalue { i64, i1 } %691, 0
  %693 = extractvalue { i64, i1 } %691, 1
  br i1 %693, label %699, label %695

; <label>:694:                                    ; preds = %672
  call void @overflow_fail(i32 1798)
  unreachable

; <label>:695:                                    ; preds = %690
  %696 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %692)
  %697 = extractvalue { i64, i1 } %696, 0
  %698 = extractvalue { i64, i1 } %696, 1
  br i1 %698, label %704, label %700

; <label>:699:                                    ; preds = %690
  call void @overflow_fail(i32 1793)
  unreachable

; <label>:700:                                    ; preds = %695
  %701 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %697)
  %702 = extractvalue { i64, i1 } %701, 0
  %703 = extractvalue { i64, i1 } %701, 1
  br i1 %703, label %709, label %705

; <label>:704:                                    ; preds = %695
  call void @overflow_fail(i32 1788)
  unreachable

; <label>:705:                                    ; preds = %700
  %706 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %702)
  %707 = extractvalue { i64, i1 } %706, 0
  %708 = extractvalue { i64, i1 } %706, 1
  br i1 %708, label %714, label %710

; <label>:709:                                    ; preds = %700
  call void @overflow_fail(i32 1783)
  unreachable

; <label>:710:                                    ; preds = %705
  %711 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %707)
  %712 = extractvalue { i64, i1 } %711, 0
  %713 = extractvalue { i64, i1 } %711, 1
  br i1 %713, label %719, label %715

; <label>:714:                                    ; preds = %705
  call void @overflow_fail(i32 1778)
  unreachable

; <label>:715:                                    ; preds = %710
  %716 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %712)
  %717 = extractvalue { i64, i1 } %716, 0
  %718 = extractvalue { i64, i1 } %716, 1
  br i1 %718, label %724, label %720

; <label>:719:                                    ; preds = %710
  call void @overflow_fail(i32 1773)
  unreachable

; <label>:720:                                    ; preds = %715
  %721 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %717)
  %722 = extractvalue { i64, i1 } %721, 0
  %723 = extractvalue { i64, i1 } %721, 1
  br i1 %723, label %729, label %725

; <label>:724:                                    ; preds = %715
  call void @overflow_fail(i32 1768)
  unreachable

; <label>:725:                                    ; preds = %720
  %726 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %722)
  %727 = extractvalue { i64, i1 } %726, 0
  %728 = extractvalue { i64, i1 } %726, 1
  br i1 %728, label %734, label %730

; <label>:729:                                    ; preds = %720
  call void @overflow_fail(i32 1763)
  unreachable

; <label>:730:                                    ; preds = %725
  %731 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %727)
  %732 = extractvalue { i64, i1 } %731, 0
  %733 = extractvalue { i64, i1 } %731, 1
  br i1 %733, label %739, label %735

; <label>:734:                                    ; preds = %725
  call void @overflow_fail(i32 1757)
  unreachable

; <label>:735:                                    ; preds = %730
  %736 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %732)
  %737 = extractvalue { i64, i1 } %736, 0
  %738 = extractvalue { i64, i1 } %736, 1
  br i1 %738, label %744, label %740

; <label>:739:                                    ; preds = %730
  call void @overflow_fail(i32 1751)
  unreachable

; <label>:740:                                    ; preds = %735
  %741 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %737)
  %742 = extractvalue { i64, i1 } %741, 0
  %743 = extractvalue { i64, i1 } %741, 1
  br i1 %743, label %749, label %745

; <label>:744:                                    ; preds = %735
  call void @overflow_fail(i32 1745)
  unreachable

; <label>:745:                                    ; preds = %740
  %746 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %742)
  %747 = extractvalue { i64, i1 } %746, 0
  %748 = extractvalue { i64, i1 } %746, 1
  br i1 %748, label %754, label %750

; <label>:749:                                    ; preds = %740
  call void @overflow_fail(i32 1739)
  unreachable

; <label>:750:                                    ; preds = %745
  %751 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %747)
  %752 = extractvalue { i64, i1 } %751, 0
  %753 = extractvalue { i64, i1 } %751, 1
  br i1 %753, label %756, label %755

; <label>:754:                                    ; preds = %745
  call void @overflow_fail(i32 1733)
  unreachable

; <label>:755:                                    ; preds = %750
  br label %678

; <label>:756:                                    ; preds = %750
  call void @overflow_fail(i32 1727)
  unreachable

; <label>:757:                                    ; preds = %676
  %758 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %759 = extractvalue { i64, i1 } %758, 0
  %760 = extractvalue { i64, i1 } %758, 1
  br i1 %760, label %779, label %775

; <label>:761:                                    ; preds = %676
  %762 = icmp eq i64 %0, 17
  br i1 %762, label %847, label %851

; <label>:763:                                    ; preds = %853, %845
  %764 = phi i64 [ %842, %845 ], [ %854, %853 ]
  %765 = phi i64 [ 0, %845 ], [ %855, %853 ]
  %766 = phi i64 [ 0, %845 ], [ %856, %853 ]
  %767 = phi i64 [ 0, %845 ], [ %857, %853 ]
  %768 = phi i64 [ 0, %845 ], [ %858, %853 ]
  %769 = phi i64 [ 0, %845 ], [ %859, %853 ]
  %770 = phi i64 [ 0, %845 ], [ %860, %853 ]
  %771 = phi i64 [ 0, %845 ], [ %861, %853 ]
  %772 = phi i64 [ 0, %845 ], [ %862, %853 ]
  %773 = phi i64 [ 0, %845 ], [ %863, %853 ]
  %774 = phi i64 [ 0, %845 ], [ %864, %853 ]
  br label %678

; <label>:775:                                    ; preds = %757
  %776 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %759)
  %777 = extractvalue { i64, i1 } %776, 0
  %778 = extractvalue { i64, i1 } %776, 1
  br i1 %778, label %784, label %780

; <label>:779:                                    ; preds = %757
  call void @overflow_fail(i32 2035)
  unreachable

; <label>:780:                                    ; preds = %775
  %781 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %777)
  %782 = extractvalue { i64, i1 } %781, 0
  %783 = extractvalue { i64, i1 } %781, 1
  br i1 %783, label %789, label %785

; <label>:784:                                    ; preds = %775
  call void @overflow_fail(i32 2030)
  unreachable

; <label>:785:                                    ; preds = %780
  %786 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %782)
  %787 = extractvalue { i64, i1 } %786, 0
  %788 = extractvalue { i64, i1 } %786, 1
  br i1 %788, label %794, label %790

; <label>:789:                                    ; preds = %780
  call void @overflow_fail(i32 2025)
  unreachable

; <label>:790:                                    ; preds = %785
  %791 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %787)
  %792 = extractvalue { i64, i1 } %791, 0
  %793 = extractvalue { i64, i1 } %791, 1
  br i1 %793, label %799, label %795

; <label>:794:                                    ; preds = %785
  call void @overflow_fail(i32 2020)
  unreachable

; <label>:795:                                    ; preds = %790
  %796 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %792)
  %797 = extractvalue { i64, i1 } %796, 0
  %798 = extractvalue { i64, i1 } %796, 1
  br i1 %798, label %804, label %800

; <label>:799:                                    ; preds = %790
  call void @overflow_fail(i32 2015)
  unreachable

; <label>:800:                                    ; preds = %795
  %801 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %797)
  %802 = extractvalue { i64, i1 } %801, 0
  %803 = extractvalue { i64, i1 } %801, 1
  br i1 %803, label %809, label %805

; <label>:804:                                    ; preds = %795
  call void @overflow_fail(i32 2010)
  unreachable

; <label>:805:                                    ; preds = %800
  %806 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %802)
  %807 = extractvalue { i64, i1 } %806, 0
  %808 = extractvalue { i64, i1 } %806, 1
  br i1 %808, label %814, label %810

; <label>:809:                                    ; preds = %800
  call void @overflow_fail(i32 2005)
  unreachable

; <label>:810:                                    ; preds = %805
  %811 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %807)
  %812 = extractvalue { i64, i1 } %811, 0
  %813 = extractvalue { i64, i1 } %811, 1
  br i1 %813, label %819, label %815

; <label>:814:                                    ; preds = %805
  call void @overflow_fail(i32 2000)
  unreachable

; <label>:815:                                    ; preds = %810
  %816 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %812)
  %817 = extractvalue { i64, i1 } %816, 0
  %818 = extractvalue { i64, i1 } %816, 1
  br i1 %818, label %824, label %820

; <label>:819:                                    ; preds = %810
  call void @overflow_fail(i32 1994)
  unreachable

; <label>:820:                                    ; preds = %815
  %821 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %817)
  %822 = extractvalue { i64, i1 } %821, 0
  %823 = extractvalue { i64, i1 } %821, 1
  br i1 %823, label %829, label %825

; <label>:824:                                    ; preds = %815
  call void @overflow_fail(i32 1988)
  unreachable

; <label>:825:                                    ; preds = %820
  %826 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %822)
  %827 = extractvalue { i64, i1 } %826, 0
  %828 = extractvalue { i64, i1 } %826, 1
  br i1 %828, label %834, label %830

; <label>:829:                                    ; preds = %820
  call void @overflow_fail(i32 1982)
  unreachable

; <label>:830:                                    ; preds = %825
  %831 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %827)
  %832 = extractvalue { i64, i1 } %831, 0
  %833 = extractvalue { i64, i1 } %831, 1
  br i1 %833, label %839, label %835

; <label>:834:                                    ; preds = %825
  call void @overflow_fail(i32 1976)
  unreachable

; <label>:835:                                    ; preds = %830
  %836 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %832)
  %837 = extractvalue { i64, i1 } %836, 0
  %838 = extractvalue { i64, i1 } %836, 1
  br i1 %838, label %844, label %840

; <label>:839:                                    ; preds = %830
  call void @overflow_fail(i32 1970)
  unreachable

; <label>:840:                                    ; preds = %835
  %841 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %837)
  %842 = extractvalue { i64, i1 } %841, 0
  %843 = extractvalue { i64, i1 } %841, 1
  br i1 %843, label %846, label %845

; <label>:844:                                    ; preds = %835
  call void @overflow_fail(i32 1964)
  unreachable

; <label>:845:                                    ; preds = %840
  br label %763

; <label>:846:                                    ; preds = %840
  call void @overflow_fail(i32 1958)
  unreachable

; <label>:847:                                    ; preds = %761
  %848 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %849 = extractvalue { i64, i1 } %848, 0
  %850 = extractvalue { i64, i1 } %848, 1
  br i1 %850, label %869, label %865

; <label>:851:                                    ; preds = %761
  %852 = icmp eq i64 %0, 18
  br i1 %852, label %942, label %946

; <label>:853:                                    ; preds = %948, %940
  %854 = phi i64 [ %937, %940 ], [ %949, %948 ]
  %855 = phi i64 [ 0, %940 ], [ %950, %948 ]
  %856 = phi i64 [ 0, %940 ], [ %951, %948 ]
  %857 = phi i64 [ 0, %940 ], [ %952, %948 ]
  %858 = phi i64 [ 0, %940 ], [ %953, %948 ]
  %859 = phi i64 [ 0, %940 ], [ %954, %948 ]
  %860 = phi i64 [ 0, %940 ], [ %955, %948 ]
  %861 = phi i64 [ 0, %940 ], [ %956, %948 ]
  %862 = phi i64 [ 0, %940 ], [ %957, %948 ]
  %863 = phi i64 [ 0, %940 ], [ %958, %948 ]
  %864 = phi i64 [ 0, %940 ], [ %959, %948 ]
  br label %763

; <label>:865:                                    ; preds = %847
  %866 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %849)
  %867 = extractvalue { i64, i1 } %866, 0
  %868 = extractvalue { i64, i1 } %866, 1
  br i1 %868, label %874, label %870

; <label>:869:                                    ; preds = %847
  call void @overflow_fail(i32 2287)
  unreachable

; <label>:870:                                    ; preds = %865
  %871 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %867)
  %872 = extractvalue { i64, i1 } %871, 0
  %873 = extractvalue { i64, i1 } %871, 1
  br i1 %873, label %879, label %875

; <label>:874:                                    ; preds = %865
  call void @overflow_fail(i32 2282)
  unreachable

; <label>:875:                                    ; preds = %870
  %876 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %872)
  %877 = extractvalue { i64, i1 } %876, 0
  %878 = extractvalue { i64, i1 } %876, 1
  br i1 %878, label %884, label %880

; <label>:879:                                    ; preds = %870
  call void @overflow_fail(i32 2277)
  unreachable

; <label>:880:                                    ; preds = %875
  %881 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %877)
  %882 = extractvalue { i64, i1 } %881, 0
  %883 = extractvalue { i64, i1 } %881, 1
  br i1 %883, label %889, label %885

; <label>:884:                                    ; preds = %875
  call void @overflow_fail(i32 2272)
  unreachable

; <label>:885:                                    ; preds = %880
  %886 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %882)
  %887 = extractvalue { i64, i1 } %886, 0
  %888 = extractvalue { i64, i1 } %886, 1
  br i1 %888, label %894, label %890

; <label>:889:                                    ; preds = %880
  call void @overflow_fail(i32 2267)
  unreachable

; <label>:890:                                    ; preds = %885
  %891 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %887)
  %892 = extractvalue { i64, i1 } %891, 0
  %893 = extractvalue { i64, i1 } %891, 1
  br i1 %893, label %899, label %895

; <label>:894:                                    ; preds = %885
  call void @overflow_fail(i32 2262)
  unreachable

; <label>:895:                                    ; preds = %890
  %896 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %892)
  %897 = extractvalue { i64, i1 } %896, 0
  %898 = extractvalue { i64, i1 } %896, 1
  br i1 %898, label %904, label %900

; <label>:899:                                    ; preds = %890
  call void @overflow_fail(i32 2257)
  unreachable

; <label>:900:                                    ; preds = %895
  %901 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %897)
  %902 = extractvalue { i64, i1 } %901, 0
  %903 = extractvalue { i64, i1 } %901, 1
  br i1 %903, label %909, label %905

; <label>:904:                                    ; preds = %895
  call void @overflow_fail(i32 2252)
  unreachable

; <label>:905:                                    ; preds = %900
  %906 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %902)
  %907 = extractvalue { i64, i1 } %906, 0
  %908 = extractvalue { i64, i1 } %906, 1
  br i1 %908, label %914, label %910

; <label>:909:                                    ; preds = %900
  call void @overflow_fail(i32 2246)
  unreachable

; <label>:910:                                    ; preds = %905
  %911 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %907)
  %912 = extractvalue { i64, i1 } %911, 0
  %913 = extractvalue { i64, i1 } %911, 1
  br i1 %913, label %919, label %915

; <label>:914:                                    ; preds = %905
  call void @overflow_fail(i32 2240)
  unreachable

; <label>:915:                                    ; preds = %910
  %916 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %912)
  %917 = extractvalue { i64, i1 } %916, 0
  %918 = extractvalue { i64, i1 } %916, 1
  br i1 %918, label %924, label %920

; <label>:919:                                    ; preds = %910
  call void @overflow_fail(i32 2234)
  unreachable

; <label>:920:                                    ; preds = %915
  %921 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %917)
  %922 = extractvalue { i64, i1 } %921, 0
  %923 = extractvalue { i64, i1 } %921, 1
  br i1 %923, label %929, label %925

; <label>:924:                                    ; preds = %915
  call void @overflow_fail(i32 2228)
  unreachable

; <label>:925:                                    ; preds = %920
  %926 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %922)
  %927 = extractvalue { i64, i1 } %926, 0
  %928 = extractvalue { i64, i1 } %926, 1
  br i1 %928, label %934, label %930

; <label>:929:                                    ; preds = %920
  call void @overflow_fail(i32 2222)
  unreachable

; <label>:930:                                    ; preds = %925
  %931 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %927)
  %932 = extractvalue { i64, i1 } %931, 0
  %933 = extractvalue { i64, i1 } %931, 1
  br i1 %933, label %939, label %935

; <label>:934:                                    ; preds = %925
  call void @overflow_fail(i32 2216)
  unreachable

; <label>:935:                                    ; preds = %930
  %936 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %932)
  %937 = extractvalue { i64, i1 } %936, 0
  %938 = extractvalue { i64, i1 } %936, 1
  br i1 %938, label %941, label %940

; <label>:939:                                    ; preds = %930
  call void @overflow_fail(i32 2210)
  unreachable

; <label>:940:                                    ; preds = %935
  br label %853

; <label>:941:                                    ; preds = %935
  call void @overflow_fail(i32 2204)
  unreachable

; <label>:942:                                    ; preds = %851
  %943 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %944 = extractvalue { i64, i1 } %943, 0
  %945 = extractvalue { i64, i1 } %943, 1
  br i1 %945, label %964, label %960

; <label>:946:                                    ; preds = %851
  %947 = icmp eq i64 %0, 19
  br i1 %947, label %1042, label %1046

; <label>:948:                                    ; preds = %1048, %1040
  %949 = phi i64 [ %1037, %1040 ], [ %1049, %1048 ]
  %950 = phi i64 [ 0, %1040 ], [ %1050, %1048 ]
  %951 = phi i64 [ 0, %1040 ], [ %1051, %1048 ]
  %952 = phi i64 [ 0, %1040 ], [ %1052, %1048 ]
  %953 = phi i64 [ 0, %1040 ], [ %1053, %1048 ]
  %954 = phi i64 [ 0, %1040 ], [ %1054, %1048 ]
  %955 = phi i64 [ 0, %1040 ], [ %1055, %1048 ]
  %956 = phi i64 [ 0, %1040 ], [ %1056, %1048 ]
  %957 = phi i64 [ 0, %1040 ], [ %1057, %1048 ]
  %958 = phi i64 [ 0, %1040 ], [ %1058, %1048 ]
  %959 = phi i64 [ 0, %1040 ], [ %1059, %1048 ]
  br label %853

; <label>:960:                                    ; preds = %942
  %961 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %944)
  %962 = extractvalue { i64, i1 } %961, 0
  %963 = extractvalue { i64, i1 } %961, 1
  br i1 %963, label %969, label %965

; <label>:964:                                    ; preds = %942
  call void @overflow_fail(i32 2554)
  unreachable

; <label>:965:                                    ; preds = %960
  %966 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %962)
  %967 = extractvalue { i64, i1 } %966, 0
  %968 = extractvalue { i64, i1 } %966, 1
  br i1 %968, label %974, label %970

; <label>:969:                                    ; preds = %960
  call void @overflow_fail(i32 2549)
  unreachable

; <label>:970:                                    ; preds = %965
  %971 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %967)
  %972 = extractvalue { i64, i1 } %971, 0
  %973 = extractvalue { i64, i1 } %971, 1
  br i1 %973, label %979, label %975

; <label>:974:                                    ; preds = %965
  call void @overflow_fail(i32 2544)
  unreachable

; <label>:975:                                    ; preds = %970
  %976 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %972)
  %977 = extractvalue { i64, i1 } %976, 0
  %978 = extractvalue { i64, i1 } %976, 1
  br i1 %978, label %984, label %980

; <label>:979:                                    ; preds = %970
  call void @overflow_fail(i32 2539)
  unreachable

; <label>:980:                                    ; preds = %975
  %981 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %977)
  %982 = extractvalue { i64, i1 } %981, 0
  %983 = extractvalue { i64, i1 } %981, 1
  br i1 %983, label %989, label %985

; <label>:984:                                    ; preds = %975
  call void @overflow_fail(i32 2534)
  unreachable

; <label>:985:                                    ; preds = %980
  %986 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %982)
  %987 = extractvalue { i64, i1 } %986, 0
  %988 = extractvalue { i64, i1 } %986, 1
  br i1 %988, label %994, label %990

; <label>:989:                                    ; preds = %980
  call void @overflow_fail(i32 2529)
  unreachable

; <label>:990:                                    ; preds = %985
  %991 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %987)
  %992 = extractvalue { i64, i1 } %991, 0
  %993 = extractvalue { i64, i1 } %991, 1
  br i1 %993, label %999, label %995

; <label>:994:                                    ; preds = %985
  call void @overflow_fail(i32 2524)
  unreachable

; <label>:995:                                    ; preds = %990
  %996 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %992)
  %997 = extractvalue { i64, i1 } %996, 0
  %998 = extractvalue { i64, i1 } %996, 1
  br i1 %998, label %1004, label %1000

; <label>:999:                                    ; preds = %990
  call void @overflow_fail(i32 2519)
  unreachable

; <label>:1000:                                   ; preds = %995
  %1001 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %997)
  %1002 = extractvalue { i64, i1 } %1001, 0
  %1003 = extractvalue { i64, i1 } %1001, 1
  br i1 %1003, label %1009, label %1005

; <label>:1004:                                   ; preds = %995
  call void @overflow_fail(i32 2513)
  unreachable

; <label>:1005:                                   ; preds = %1000
  %1006 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %1002)
  %1007 = extractvalue { i64, i1 } %1006, 0
  %1008 = extractvalue { i64, i1 } %1006, 1
  br i1 %1008, label %1014, label %1010

; <label>:1009:                                   ; preds = %1000
  call void @overflow_fail(i32 2507)
  unreachable

; <label>:1010:                                   ; preds = %1005
  %1011 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %1007)
  %1012 = extractvalue { i64, i1 } %1011, 0
  %1013 = extractvalue { i64, i1 } %1011, 1
  br i1 %1013, label %1019, label %1015

; <label>:1014:                                   ; preds = %1005
  call void @overflow_fail(i32 2501)
  unreachable

; <label>:1015:                                   ; preds = %1010
  %1016 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %1012)
  %1017 = extractvalue { i64, i1 } %1016, 0
  %1018 = extractvalue { i64, i1 } %1016, 1
  br i1 %1018, label %1024, label %1020

; <label>:1019:                                   ; preds = %1010
  call void @overflow_fail(i32 2495)
  unreachable

; <label>:1020:                                   ; preds = %1015
  %1021 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %1017)
  %1022 = extractvalue { i64, i1 } %1021, 0
  %1023 = extractvalue { i64, i1 } %1021, 1
  br i1 %1023, label %1029, label %1025

; <label>:1024:                                   ; preds = %1015
  call void @overflow_fail(i32 2489)
  unreachable

; <label>:1025:                                   ; preds = %1020
  %1026 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %1022)
  %1027 = extractvalue { i64, i1 } %1026, 0
  %1028 = extractvalue { i64, i1 } %1026, 1
  br i1 %1028, label %1034, label %1030

; <label>:1029:                                   ; preds = %1020
  call void @overflow_fail(i32 2483)
  unreachable

; <label>:1030:                                   ; preds = %1025
  %1031 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %1027)
  %1032 = extractvalue { i64, i1 } %1031, 0
  %1033 = extractvalue { i64, i1 } %1031, 1
  br i1 %1033, label %1039, label %1035

; <label>:1034:                                   ; preds = %1025
  call void @overflow_fail(i32 2477)
  unreachable

; <label>:1035:                                   ; preds = %1030
  %1036 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %1032)
  %1037 = extractvalue { i64, i1 } %1036, 0
  %1038 = extractvalue { i64, i1 } %1036, 1
  br i1 %1038, label %1041, label %1040

; <label>:1039:                                   ; preds = %1030
  call void @overflow_fail(i32 2471)
  unreachable

; <label>:1040:                                   ; preds = %1035
  br label %948

; <label>:1041:                                   ; preds = %1035
  call void @overflow_fail(i32 2465)
  unreachable

; <label>:1042:                                   ; preds = %946
  %1043 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %1044 = extractvalue { i64, i1 } %1043, 0
  %1045 = extractvalue { i64, i1 } %1043, 1
  br i1 %1045, label %1064, label %1060

; <label>:1046:                                   ; preds = %946
  %1047 = icmp eq i64 %0, 20
  br i1 %1047, label %1147, label %1151

; <label>:1048:                                   ; preds = %1152, %1145
  %1049 = phi i64 [ %1142, %1145 ], [ %1153, %1152 ]
  %1050 = phi i64 [ 0, %1145 ], [ %1154, %1152 ]
  %1051 = phi i64 [ 0, %1145 ], [ %1155, %1152 ]
  %1052 = phi i64 [ 0, %1145 ], [ %1156, %1152 ]
  %1053 = phi i64 [ 0, %1145 ], [ %1157, %1152 ]
  %1054 = phi i64 [ 0, %1145 ], [ %1158, %1152 ]
  %1055 = phi i64 [ 0, %1145 ], [ %1159, %1152 ]
  %1056 = phi i64 [ 0, %1145 ], [ %1160, %1152 ]
  %1057 = phi i64 [ 0, %1145 ], [ %1161, %1152 ]
  %1058 = phi i64 [ 0, %1145 ], [ %1162, %1152 ]
  %1059 = phi i64 [ 0, %1145 ], [ %1163, %1152 ]
  br label %948

; <label>:1060:                                   ; preds = %1042
  %1061 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %1044)
  %1062 = extractvalue { i64, i1 } %1061, 0
  %1063 = extractvalue { i64, i1 } %1061, 1
  br i1 %1063, label %1069, label %1065

; <label>:1064:                                   ; preds = %1042
  call void @overflow_fail(i32 2836)
  unreachable

; <label>:1065:                                   ; preds = %1060
  %1066 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %1062)
  %1067 = extractvalue { i64, i1 } %1066, 0
  %1068 = extractvalue { i64, i1 } %1066, 1
  br i1 %1068, label %1074, label %1070

; <label>:1069:                                   ; preds = %1060
  call void @overflow_fail(i32 2831)
  unreachable

; <label>:1070:                                   ; preds = %1065
  %1071 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %1067)
  %1072 = extractvalue { i64, i1 } %1071, 0
  %1073 = extractvalue { i64, i1 } %1071, 1
  br i1 %1073, label %1079, label %1075

; <label>:1074:                                   ; preds = %1065
  call void @overflow_fail(i32 2826)
  unreachable

; <label>:1075:                                   ; preds = %1070
  %1076 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %1072)
  %1077 = extractvalue { i64, i1 } %1076, 0
  %1078 = extractvalue { i64, i1 } %1076, 1
  br i1 %1078, label %1084, label %1080

; <label>:1079:                                   ; preds = %1070
  call void @overflow_fail(i32 2821)
  unreachable

; <label>:1080:                                   ; preds = %1075
  %1081 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %1077)
  %1082 = extractvalue { i64, i1 } %1081, 0
  %1083 = extractvalue { i64, i1 } %1081, 1
  br i1 %1083, label %1089, label %1085

; <label>:1084:                                   ; preds = %1075
  call void @overflow_fail(i32 2816)
  unreachable

; <label>:1085:                                   ; preds = %1080
  %1086 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %1082)
  %1087 = extractvalue { i64, i1 } %1086, 0
  %1088 = extractvalue { i64, i1 } %1086, 1
  br i1 %1088, label %1094, label %1090

; <label>:1089:                                   ; preds = %1080
  call void @overflow_fail(i32 2811)
  unreachable

; <label>:1090:                                   ; preds = %1085
  %1091 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %1087)
  %1092 = extractvalue { i64, i1 } %1091, 0
  %1093 = extractvalue { i64, i1 } %1091, 1
  br i1 %1093, label %1099, label %1095

; <label>:1094:                                   ; preds = %1085
  call void @overflow_fail(i32 2806)
  unreachable

; <label>:1095:                                   ; preds = %1090
  %1096 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %1092)
  %1097 = extractvalue { i64, i1 } %1096, 0
  %1098 = extractvalue { i64, i1 } %1096, 1
  br i1 %1098, label %1104, label %1100

; <label>:1099:                                   ; preds = %1090
  call void @overflow_fail(i32 2801)
  unreachable

; <label>:1100:                                   ; preds = %1095
  %1101 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %1097)
  %1102 = extractvalue { i64, i1 } %1101, 0
  %1103 = extractvalue { i64, i1 } %1101, 1
  br i1 %1103, label %1109, label %1105

; <label>:1104:                                   ; preds = %1095
  call void @overflow_fail(i32 2795)
  unreachable

; <label>:1105:                                   ; preds = %1100
  %1106 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %1102)
  %1107 = extractvalue { i64, i1 } %1106, 0
  %1108 = extractvalue { i64, i1 } %1106, 1
  br i1 %1108, label %1114, label %1110

; <label>:1109:                                   ; preds = %1100
  call void @overflow_fail(i32 2789)
  unreachable

; <label>:1110:                                   ; preds = %1105
  %1111 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %1107)
  %1112 = extractvalue { i64, i1 } %1111, 0
  %1113 = extractvalue { i64, i1 } %1111, 1
  br i1 %1113, label %1119, label %1115

; <label>:1114:                                   ; preds = %1105
  call void @overflow_fail(i32 2783)
  unreachable

; <label>:1115:                                   ; preds = %1110
  %1116 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %1112)
  %1117 = extractvalue { i64, i1 } %1116, 0
  %1118 = extractvalue { i64, i1 } %1116, 1
  br i1 %1118, label %1124, label %1120

; <label>:1119:                                   ; preds = %1110
  call void @overflow_fail(i32 2777)
  unreachable

; <label>:1120:                                   ; preds = %1115
  %1121 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %1117)
  %1122 = extractvalue { i64, i1 } %1121, 0
  %1123 = extractvalue { i64, i1 } %1121, 1
  br i1 %1123, label %1129, label %1125

; <label>:1124:                                   ; preds = %1115
  call void @overflow_fail(i32 2771)
  unreachable

; <label>:1125:                                   ; preds = %1120
  %1126 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %1122)
  %1127 = extractvalue { i64, i1 } %1126, 0
  %1128 = extractvalue { i64, i1 } %1126, 1
  br i1 %1128, label %1134, label %1130

; <label>:1129:                                   ; preds = %1120
  call void @overflow_fail(i32 2765)
  unreachable

; <label>:1130:                                   ; preds = %1125
  %1131 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %1127)
  %1132 = extractvalue { i64, i1 } %1131, 0
  %1133 = extractvalue { i64, i1 } %1131, 1
  br i1 %1133, label %1139, label %1135

; <label>:1134:                                   ; preds = %1125
  call void @overflow_fail(i32 2759)
  unreachable

; <label>:1135:                                   ; preds = %1130
  %1136 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %1132)
  %1137 = extractvalue { i64, i1 } %1136, 0
  %1138 = extractvalue { i64, i1 } %1136, 1
  br i1 %1138, label %1144, label %1140

; <label>:1139:                                   ; preds = %1130
  call void @overflow_fail(i32 2753)
  unreachable

; <label>:1140:                                   ; preds = %1135
  %1141 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 19, i64 %1137)
  %1142 = extractvalue { i64, i1 } %1141, 0
  %1143 = extractvalue { i64, i1 } %1141, 1
  br i1 %1143, label %1146, label %1145

; <label>:1144:                                   ; preds = %1135
  call void @overflow_fail(i32 2747)
  unreachable

; <label>:1145:                                   ; preds = %1140
  br label %1048

; <label>:1146:                                   ; preds = %1140
  call void @overflow_fail(i32 2741)
  unreachable

; <label>:1147:                                   ; preds = %1046
  %1148 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %1149 = extractvalue { i64, i1 } %1148, 0
  %1150 = extractvalue { i64, i1 } %1148, 1
  br i1 %1150, label %1168, label %1164

; <label>:1151:                                   ; preds = %1046
  br label %1152

; <label>:1152:                                   ; preds = %1151, %1254
  %1153 = phi i64 [ %1251, %1254 ], [ -1, %1151 ]
  %1154 = phi i64 [ 0, %1254 ], [ 0, %1151 ]
  %1155 = phi i64 [ 0, %1254 ], [ 0, %1151 ]
  %1156 = phi i64 [ 0, %1254 ], [ 0, %1151 ]
  %1157 = phi i64 [ 0, %1254 ], [ 0, %1151 ]
  %1158 = phi i64 [ 0, %1254 ], [ 0, %1151 ]
  %1159 = phi i64 [ 0, %1254 ], [ 0, %1151 ]
  %1160 = phi i64 [ 0, %1254 ], [ 0, %1151 ]
  %1161 = phi i64 [ 0, %1254 ], [ 0, %1151 ]
  %1162 = phi i64 [ 0, %1254 ], [ 0, %1151 ]
  %1163 = phi i64 [ 0, %1254 ], [ 0, %1151 ]
  br label %1048

; <label>:1164:                                   ; preds = %1147
  %1165 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %1149)
  %1166 = extractvalue { i64, i1 } %1165, 0
  %1167 = extractvalue { i64, i1 } %1165, 1
  br i1 %1167, label %1173, label %1169

; <label>:1168:                                   ; preds = %1147
  call void @overflow_fail(i32 3133)
  unreachable

; <label>:1169:                                   ; preds = %1164
  %1170 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %1166)
  %1171 = extractvalue { i64, i1 } %1170, 0
  %1172 = extractvalue { i64, i1 } %1170, 1
  br i1 %1172, label %1178, label %1174

; <label>:1173:                                   ; preds = %1164
  call void @overflow_fail(i32 3128)
  unreachable

; <label>:1174:                                   ; preds = %1169
  %1175 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %1171)
  %1176 = extractvalue { i64, i1 } %1175, 0
  %1177 = extractvalue { i64, i1 } %1175, 1
  br i1 %1177, label %1183, label %1179

; <label>:1178:                                   ; preds = %1169
  call void @overflow_fail(i32 3123)
  unreachable

; <label>:1179:                                   ; preds = %1174
  %1180 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %1176)
  %1181 = extractvalue { i64, i1 } %1180, 0
  %1182 = extractvalue { i64, i1 } %1180, 1
  br i1 %1182, label %1188, label %1184

; <label>:1183:                                   ; preds = %1174
  call void @overflow_fail(i32 3118)
  unreachable

; <label>:1184:                                   ; preds = %1179
  %1185 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %1181)
  %1186 = extractvalue { i64, i1 } %1185, 0
  %1187 = extractvalue { i64, i1 } %1185, 1
  br i1 %1187, label %1193, label %1189

; <label>:1188:                                   ; preds = %1179
  call void @overflow_fail(i32 3113)
  unreachable

; <label>:1189:                                   ; preds = %1184
  %1190 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %1186)
  %1191 = extractvalue { i64, i1 } %1190, 0
  %1192 = extractvalue { i64, i1 } %1190, 1
  br i1 %1192, label %1198, label %1194

; <label>:1193:                                   ; preds = %1184
  call void @overflow_fail(i32 3108)
  unreachable

; <label>:1194:                                   ; preds = %1189
  %1195 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %1191)
  %1196 = extractvalue { i64, i1 } %1195, 0
  %1197 = extractvalue { i64, i1 } %1195, 1
  br i1 %1197, label %1203, label %1199

; <label>:1198:                                   ; preds = %1189
  call void @overflow_fail(i32 3103)
  unreachable

; <label>:1199:                                   ; preds = %1194
  %1200 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %1196)
  %1201 = extractvalue { i64, i1 } %1200, 0
  %1202 = extractvalue { i64, i1 } %1200, 1
  br i1 %1202, label %1208, label %1204

; <label>:1203:                                   ; preds = %1194
  call void @overflow_fail(i32 3098)
  unreachable

; <label>:1204:                                   ; preds = %1199
  %1205 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %1201)
  %1206 = extractvalue { i64, i1 } %1205, 0
  %1207 = extractvalue { i64, i1 } %1205, 1
  br i1 %1207, label %1213, label %1209

; <label>:1208:                                   ; preds = %1199
  call void @overflow_fail(i32 3092)
  unreachable

; <label>:1209:                                   ; preds = %1204
  %1210 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %1206)
  %1211 = extractvalue { i64, i1 } %1210, 0
  %1212 = extractvalue { i64, i1 } %1210, 1
  br i1 %1212, label %1218, label %1214

; <label>:1213:                                   ; preds = %1204
  call void @overflow_fail(i32 3086)
  unreachable

; <label>:1214:                                   ; preds = %1209
  %1215 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %1211)
  %1216 = extractvalue { i64, i1 } %1215, 0
  %1217 = extractvalue { i64, i1 } %1215, 1
  br i1 %1217, label %1223, label %1219

; <label>:1218:                                   ; preds = %1209
  call void @overflow_fail(i32 3080)
  unreachable

; <label>:1219:                                   ; preds = %1214
  %1220 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %1216)
  %1221 = extractvalue { i64, i1 } %1220, 0
  %1222 = extractvalue { i64, i1 } %1220, 1
  br i1 %1222, label %1228, label %1224

; <label>:1223:                                   ; preds = %1214
  call void @overflow_fail(i32 3074)
  unreachable

; <label>:1224:                                   ; preds = %1219
  %1225 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %1221)
  %1226 = extractvalue { i64, i1 } %1225, 0
  %1227 = extractvalue { i64, i1 } %1225, 1
  br i1 %1227, label %1233, label %1229

; <label>:1228:                                   ; preds = %1219
  call void @overflow_fail(i32 3068)
  unreachable

; <label>:1229:                                   ; preds = %1224
  %1230 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %1226)
  %1231 = extractvalue { i64, i1 } %1230, 0
  %1232 = extractvalue { i64, i1 } %1230, 1
  br i1 %1232, label %1238, label %1234

; <label>:1233:                                   ; preds = %1224
  call void @overflow_fail(i32 3062)
  unreachable

; <label>:1234:                                   ; preds = %1229
  %1235 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %1231)
  %1236 = extractvalue { i64, i1 } %1235, 0
  %1237 = extractvalue { i64, i1 } %1235, 1
  br i1 %1237, label %1243, label %1239

; <label>:1238:                                   ; preds = %1229
  call void @overflow_fail(i32 3056)
  unreachable

; <label>:1239:                                   ; preds = %1234
  %1240 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %1236)
  %1241 = extractvalue { i64, i1 } %1240, 0
  %1242 = extractvalue { i64, i1 } %1240, 1
  br i1 %1242, label %1248, label %1244

; <label>:1243:                                   ; preds = %1234
  call void @overflow_fail(i32 3050)
  unreachable

; <label>:1244:                                   ; preds = %1239
  %1245 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 19, i64 %1241)
  %1246 = extractvalue { i64, i1 } %1245, 0
  %1247 = extractvalue { i64, i1 } %1245, 1
  br i1 %1247, label %1253, label %1249

; <label>:1248:                                   ; preds = %1239
  call void @overflow_fail(i32 3044)
  unreachable

; <label>:1249:                                   ; preds = %1244
  %1250 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 20, i64 %1246)
  %1251 = extractvalue { i64, i1 } %1250, 0
  %1252 = extractvalue { i64, i1 } %1250, 1
  br i1 %1252, label %1255, label %1254

; <label>:1253:                                   ; preds = %1244
  call void @overflow_fail(i32 3038)
  unreachable

; <label>:1254:                                   ; preds = %1249
  br label %1152

; <label>:1255:                                   ; preds = %1249
  call void @overflow_fail(i32 3032)
  unreachable
}

; Function Attrs: noreturn
declare void @overflow_fail(i32) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #1

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #1

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #1

define i64 @_strap_div(i64, i64, i32) {
  %4 = icmp eq i64 %1, 0
  %5 = icmp eq i64 %0, -9223372036854775808
  %6 = icmp eq i64 %1, -1
  %7 = and i1 %5, %6
  %8 = or i1 %4, %7
  br i1 %8, label %11, label %9

; <label>:9:                                      ; preds = %3
  %10 = sdiv i64 %0, %1
  ret i64 %10

; <label>:11:                                     ; preds = %3
  call void @overflow_fail(i32 %2)
  unreachable
}

define i64 @_strap_mod(i64, i64, i32) {
  %4 = icmp eq i64 %1, 0
  br i1 %4, label %7, label %5

; <label>:5:                                      ; preds = %3
  %6 = srem i64 %0, %1
  ret i64 %6

; <label>:7:                                      ; preds = %3
  call void @overflow_fail(i32 %2)
  unreachable
}

attributes #0 = { noreturn }
attributes #1 = { nounwind readnone }
