; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %6 = icmp sle i64 %0, 0
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %entry
  br label %10

; <label>:8:                                      ; preds = %entry
  %9 = icmp eq i64 %0, 1
  br i1 %9, label %22, label %23

; <label>:10:                                     ; preds = %25, %7
  %11 = phi i64 [ 0, %7 ], [ %26, %25 ]
  %12 = phi i64 [ 0, %7 ], [ %27, %25 ]
  %13 = phi i64 [ 0, %7 ], [ %28, %25 ]
  %14 = phi i64 [ 0, %7 ], [ %29, %25 ]
  %15 = phi i64 [ 0, %7 ], [ %30, %25 ]
  %16 = phi i64 [ 0, %7 ], [ %31, %25 ]
  %17 = phi i64 [ 0, %7 ], [ %32, %25 ]
  %18 = phi i64 [ 0, %7 ], [ %33, %25 ]
  %19 = phi i64 [ 0, %7 ], [ %34, %25 ]
  %20 = phi i64 [ 0, %7 ], [ %35, %25 ]
  %21 = phi i64 [ 0, %7 ], [ %36, %25 ]
  ret i64 %11

; <label>:22:                                     ; preds = %8
  br label %25

; <label>:23:                                     ; preds = %8
  %24 = icmp eq i64 %0, 2
  br i1 %24, label %37, label %41

; <label>:25:                                     ; preds = %43, %22
  %26 = phi i64 [ %1, %22 ], [ %44, %43 ]
  %27 = phi i64 [ 0, %22 ], [ %45, %43 ]
  %28 = phi i64 [ 0, %22 ], [ %46, %43 ]
  %29 = phi i64 [ 0, %22 ], [ %47, %43 ]
  %30 = phi i64 [ 0, %22 ], [ %48, %43 ]
  %31 = phi i64 [ 0, %22 ], [ %49, %43 ]
  %32 = phi i64 [ 0, %22 ], [ %50, %43 ]
  %33 = phi i64 [ 0, %22 ], [ %51, %43 ]
  %34 = phi i64 [ 0, %22 ], [ %52, %43 ]
  %35 = phi i64 [ 0, %22 ], [ %53, %43 ]
  %36 = phi i64 [ 0, %22 ], [ %54, %43 ]
  br label %10

; <label>:37:                                     ; preds = %23
  %38 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %39 = extractvalue { i64, i1 } %38, 0
  %40 = extractvalue { i64, i1 } %38, 1
  br i1 %40, label %57, label %55

; <label>:41:                                     ; preds = %23
  %42 = icmp eq i64 %0, 3
  br i1 %42, label %58, label %62

; <label>:43:                                     ; preds = %64, %55
  %44 = phi i64 [ %56, %55 ], [ %65, %64 ]
  %45 = phi i64 [ 0, %55 ], [ %66, %64 ]
  %46 = phi i64 [ 0, %55 ], [ %67, %64 ]
  %47 = phi i64 [ 0, %55 ], [ %68, %64 ]
  %48 = phi i64 [ 0, %55 ], [ %69, %64 ]
  %49 = phi i64 [ 0, %55 ], [ %70, %64 ]
  %50 = phi i64 [ 0, %55 ], [ %71, %64 ]
  %51 = phi i64 [ 0, %55 ], [ %72, %64 ]
  %52 = phi i64 [ 0, %55 ], [ %73, %64 ]
  %53 = phi i64 [ 0, %55 ], [ %74, %64 ]
  %54 = phi i64 [ 0, %55 ], [ %75, %64 ]
  br label %25

; <label>:55:                                     ; preds = %37
  %56 = call i64 @_strap_div(i64 %39, i64 2, i32 111)
  br label %43

; <label>:57:                                     ; preds = %37
  call void @overflow_fail(i32 114)
  unreachable

; <label>:58:                                     ; preds = %41
  %59 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %2, i64 %3)
  %60 = extractvalue { i64, i1 } %59, 0
  %61 = extractvalue { i64, i1 } %59, 1
  br i1 %61, label %80, label %76

; <label>:62:                                     ; preds = %41
  %63 = icmp eq i64 %0, 4
  br i1 %63, label %84, label %88

; <label>:64:                                     ; preds = %92, %81
  %65 = phi i64 [ %82, %81 ], [ %93, %92 ]
  %66 = phi i64 [ 0, %81 ], [ %94, %92 ]
  %67 = phi i64 [ 0, %81 ], [ %95, %92 ]
  %68 = phi i64 [ 0, %81 ], [ %96, %92 ]
  %69 = phi i64 [ 0, %81 ], [ %97, %92 ]
  %70 = phi i64 [ 0, %81 ], [ %98, %92 ]
  %71 = phi i64 [ 0, %81 ], [ %99, %92 ]
  %72 = phi i64 [ 0, %81 ], [ %100, %92 ]
  %73 = phi i64 [ 0, %81 ], [ %101, %92 ]
  %74 = phi i64 [ 0, %81 ], [ %102, %92 ]
  %75 = phi i64 [ 0, %81 ], [ %103, %92 ]
  br label %43

; <label>:76:                                     ; preds = %58
  %77 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %60)
  %78 = extractvalue { i64, i1 } %77, 0
  %79 = extractvalue { i64, i1 } %77, 1
  br i1 %79, label %83, label %81

; <label>:80:                                     ; preds = %58
  call void @overflow_fail(i32 178)
  unreachable

; <label>:81:                                     ; preds = %76
  %82 = call i64 @_strap_div(i64 %78, i64 3, i32 169)
  br label %64

; <label>:83:                                     ; preds = %76
  call void @overflow_fail(i32 172)
  unreachable

; <label>:84:                                     ; preds = %62
  %85 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %86 = extractvalue { i64, i1 } %85, 0
  %87 = extractvalue { i64, i1 } %85, 1
  br i1 %87, label %108, label %104

; <label>:88:                                     ; preds = %62
  %89 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %90 = extractvalue { i64, i1 } %89, 0
  %91 = extractvalue { i64, i1 } %89, 1
  br i1 %91, label %121, label %117

; <label>:92:                                     ; preds = %132, %114
  %93 = phi i64 [ %115, %114 ], [ %133, %132 ]
  %94 = phi i64 [ 0, %114 ], [ 0, %132 ]
  %95 = phi i64 [ 0, %114 ], [ 0, %132 ]
  %96 = phi i64 [ 0, %114 ], [ 0, %132 ]
  %97 = phi i64 [ 0, %114 ], [ 0, %132 ]
  %98 = phi i64 [ 0, %114 ], [ 0, %132 ]
  %99 = phi i64 [ 0, %114 ], [ 0, %132 ]
  %100 = phi i64 [ 0, %114 ], [ 0, %132 ]
  %101 = phi i64 [ 0, %114 ], [ 0, %132 ]
  %102 = phi i64 [ 0, %114 ], [ 0, %132 ]
  %103 = phi i64 [ 0, %114 ], [ 0, %132 ]
  br label %64

; <label>:104:                                    ; preds = %84
  %105 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %4)
  %106 = extractvalue { i64, i1 } %105, 0
  %107 = extractvalue { i64, i1 } %105, 1
  br i1 %107, label %113, label %109

; <label>:108:                                    ; preds = %84
  call void @overflow_fail(i32 248)
  unreachable

; <label>:109:                                    ; preds = %104
  %110 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %86, i64 %106)
  %111 = extractvalue { i64, i1 } %110, 0
  %112 = extractvalue { i64, i1 } %110, 1
  br i1 %112, label %116, label %114

; <label>:113:                                    ; preds = %104
  call void @overflow_fail(i32 258)
  unreachable

; <label>:114:                                    ; preds = %109
  %115 = call i64 @_strap_div(i64 %111, i64 4, i32 242)
  br label %92

; <label>:116:                                    ; preds = %109
  call void @overflow_fail(i32 245)
  unreachable

; <label>:117:                                    ; preds = %88
  %118 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %4)
  %119 = extractvalue { i64, i1 } %118, 0
  %120 = extractvalue { i64, i1 } %118, 1
  br i1 %120, label %126, label %122

; <label>:121:                                    ; preds = %88
  call void @overflow_fail(i32 301)
  unreachable

; <label>:122:                                    ; preds = %117
  %123 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %90, i64 %119)
  %124 = extractvalue { i64, i1 } %123, 0
  %125 = extractvalue { i64, i1 } %123, 1
  br i1 %125, label %131, label %127

; <label>:126:                                    ; preds = %117
  call void @overflow_fail(i32 311)
  unreachable

; <label>:127:                                    ; preds = %122
  %128 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %124, i64 %5)
  %129 = extractvalue { i64, i1 } %128, 0
  %130 = extractvalue { i64, i1 } %128, 1
  br i1 %130, label %134, label %132

; <label>:131:                                    ; preds = %122
  call void @overflow_fail(i32 298)
  unreachable

; <label>:132:                                    ; preds = %127
  %133 = call i64 @_strap_div(i64 %129, i64 5, i32 292)
  br label %92

; <label>:134:                                    ; preds = %127
  call void @overflow_fail(i32 295)
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
