; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %6 = icmp eq i64 0, 0
  br i1 %6, label %7, label %9

; <label>:7:                                      ; preds = %entry
  %8 = icmp eq i64 0, 0
  br i1 %8, label %22, label %24

; <label>:9:                                      ; preds = %entry
  br label %10

; <label>:10:                                     ; preds = %9, %25
  %11 = phi i64 [ %26, %25 ], [ 0, %9 ]
  %12 = phi i64 [ %27, %25 ], [ 0, %9 ]
  %13 = phi i64 [ %28, %25 ], [ 0, %9 ]
  %14 = phi i64 [ %29, %25 ], [ 0, %9 ]
  %15 = phi i64 [ %30, %25 ], [ 0, %9 ]
  %16 = phi i64 [ %31, %25 ], [ 0, %9 ]
  %17 = phi i64 [ %32, %25 ], [ 0, %9 ]
  %18 = phi i64 [ %33, %25 ], [ 0, %9 ]
  %19 = phi i64 [ %34, %25 ], [ 0, %9 ]
  %20 = phi i64 [ %35, %25 ], [ 0, %9 ]
  %21 = phi i64 [ %36, %25 ], [ 0, %9 ]
  ret i64 %11

; <label>:22:                                     ; preds = %7
  %23 = icmp eq i64 0, 0
  br i1 %23, label %37, label %39

; <label>:24:                                     ; preds = %7
  br label %25

; <label>:25:                                     ; preds = %24, %40
  %26 = phi i64 [ %41, %40 ], [ 0, %24 ]
  %27 = phi i64 [ %42, %40 ], [ 0, %24 ]
  %28 = phi i64 [ %43, %40 ], [ 0, %24 ]
  %29 = phi i64 [ %44, %40 ], [ 0, %24 ]
  %30 = phi i64 [ %45, %40 ], [ 0, %24 ]
  %31 = phi i64 [ %46, %40 ], [ 0, %24 ]
  %32 = phi i64 [ %47, %40 ], [ 0, %24 ]
  %33 = phi i64 [ %48, %40 ], [ 0, %24 ]
  %34 = phi i64 [ %49, %40 ], [ 0, %24 ]
  %35 = phi i64 [ %50, %40 ], [ 0, %24 ]
  %36 = phi i64 [ %51, %40 ], [ 0, %24 ]
  br label %10

; <label>:37:                                     ; preds = %22
  %38 = icmp eq i64 0, 0
  br i1 %38, label %52, label %54

; <label>:39:                                     ; preds = %22
  br label %40

; <label>:40:                                     ; preds = %39, %55
  %41 = phi i64 [ %56, %55 ], [ 0, %39 ]
  %42 = phi i64 [ %57, %55 ], [ 0, %39 ]
  %43 = phi i64 [ %58, %55 ], [ 0, %39 ]
  %44 = phi i64 [ %59, %55 ], [ 0, %39 ]
  %45 = phi i64 [ %60, %55 ], [ 0, %39 ]
  %46 = phi i64 [ %61, %55 ], [ 0, %39 ]
  %47 = phi i64 [ %62, %55 ], [ 0, %39 ]
  %48 = phi i64 [ %63, %55 ], [ 0, %39 ]
  %49 = phi i64 [ %64, %55 ], [ 0, %39 ]
  %50 = phi i64 [ %65, %55 ], [ 0, %39 ]
  %51 = phi i64 [ %66, %55 ], [ 0, %39 ]
  br label %25

; <label>:52:                                     ; preds = %37
  %53 = icmp eq i64 0, 0
  br i1 %53, label %67, label %69

; <label>:54:                                     ; preds = %37
  br label %55

; <label>:55:                                     ; preds = %54, %70
  %56 = phi i64 [ %71, %70 ], [ 0, %54 ]
  %57 = phi i64 [ %72, %70 ], [ 0, %54 ]
  %58 = phi i64 [ %73, %70 ], [ 0, %54 ]
  %59 = phi i64 [ %74, %70 ], [ 0, %54 ]
  %60 = phi i64 [ %75, %70 ], [ 0, %54 ]
  %61 = phi i64 [ %76, %70 ], [ 0, %54 ]
  %62 = phi i64 [ %77, %70 ], [ 0, %54 ]
  %63 = phi i64 [ %78, %70 ], [ 0, %54 ]
  %64 = phi i64 [ %79, %70 ], [ 0, %54 ]
  %65 = phi i64 [ %80, %70 ], [ 0, %54 ]
  %66 = phi i64 [ %81, %70 ], [ 0, %54 ]
  br label %40

; <label>:67:                                     ; preds = %52
  %68 = icmp eq i64 0, 0
  br i1 %68, label %82, label %84

; <label>:69:                                     ; preds = %52
  br label %70

; <label>:70:                                     ; preds = %69, %85
  %71 = phi i64 [ %86, %85 ], [ 0, %69 ]
  %72 = phi i64 [ %87, %85 ], [ 0, %69 ]
  %73 = phi i64 [ %88, %85 ], [ 0, %69 ]
  %74 = phi i64 [ %89, %85 ], [ 0, %69 ]
  %75 = phi i64 [ %90, %85 ], [ 0, %69 ]
  %76 = phi i64 [ %91, %85 ], [ 0, %69 ]
  %77 = phi i64 [ %92, %85 ], [ 0, %69 ]
  %78 = phi i64 [ %93, %85 ], [ 0, %69 ]
  %79 = phi i64 [ %94, %85 ], [ 0, %69 ]
  %80 = phi i64 [ %95, %85 ], [ 0, %69 ]
  %81 = phi i64 [ %96, %85 ], [ 0, %69 ]
  br label %55

; <label>:82:                                     ; preds = %67
  %83 = icmp eq i64 0, 0
  br i1 %83, label %97, label %99

; <label>:84:                                     ; preds = %67
  br label %85

; <label>:85:                                     ; preds = %84, %100
  %86 = phi i64 [ %101, %100 ], [ 0, %84 ]
  %87 = phi i64 [ %102, %100 ], [ 0, %84 ]
  %88 = phi i64 [ %103, %100 ], [ 0, %84 ]
  %89 = phi i64 [ %104, %100 ], [ 0, %84 ]
  %90 = phi i64 [ %105, %100 ], [ 0, %84 ]
  %91 = phi i64 [ %106, %100 ], [ 0, %84 ]
  %92 = phi i64 [ %107, %100 ], [ 0, %84 ]
  %93 = phi i64 [ %108, %100 ], [ 0, %84 ]
  %94 = phi i64 [ %109, %100 ], [ 0, %84 ]
  %95 = phi i64 [ %110, %100 ], [ 0, %84 ]
  %96 = phi i64 [ %111, %100 ], [ 0, %84 ]
  br label %70

; <label>:97:                                     ; preds = %82
  %98 = icmp eq i64 0, 0
  br i1 %98, label %112, label %114

; <label>:99:                                     ; preds = %82
  br label %100

; <label>:100:                                    ; preds = %99, %115
  %101 = phi i64 [ %116, %115 ], [ 0, %99 ]
  %102 = phi i64 [ %117, %115 ], [ 0, %99 ]
  %103 = phi i64 [ %118, %115 ], [ 0, %99 ]
  %104 = phi i64 [ %119, %115 ], [ 0, %99 ]
  %105 = phi i64 [ %120, %115 ], [ 0, %99 ]
  %106 = phi i64 [ %121, %115 ], [ 0, %99 ]
  %107 = phi i64 [ %122, %115 ], [ 0, %99 ]
  %108 = phi i64 [ %123, %115 ], [ 0, %99 ]
  %109 = phi i64 [ %124, %115 ], [ 0, %99 ]
  %110 = phi i64 [ %125, %115 ], [ 0, %99 ]
  %111 = phi i64 [ %126, %115 ], [ 0, %99 ]
  br label %85

; <label>:112:                                    ; preds = %97
  %113 = icmp eq i64 0, 0
  br i1 %113, label %127, label %129

; <label>:114:                                    ; preds = %97
  br label %115

; <label>:115:                                    ; preds = %114, %130
  %116 = phi i64 [ %131, %130 ], [ 0, %114 ]
  %117 = phi i64 [ %132, %130 ], [ 0, %114 ]
  %118 = phi i64 [ %133, %130 ], [ 0, %114 ]
  %119 = phi i64 [ %134, %130 ], [ 0, %114 ]
  %120 = phi i64 [ %135, %130 ], [ 0, %114 ]
  %121 = phi i64 [ %136, %130 ], [ 0, %114 ]
  %122 = phi i64 [ %137, %130 ], [ 0, %114 ]
  %123 = phi i64 [ %138, %130 ], [ 0, %114 ]
  %124 = phi i64 [ %139, %130 ], [ 0, %114 ]
  %125 = phi i64 [ %140, %130 ], [ 0, %114 ]
  %126 = phi i64 [ %141, %130 ], [ 0, %114 ]
  br label %100

; <label>:127:                                    ; preds = %112
  %128 = icmp eq i64 0, 0
  br i1 %128, label %142, label %143

; <label>:129:                                    ; preds = %112
  br label %130

; <label>:130:                                    ; preds = %129, %144
  %131 = phi i64 [ %145, %144 ], [ 0, %129 ]
  %132 = phi i64 [ %146, %144 ], [ 0, %129 ]
  %133 = phi i64 [ %147, %144 ], [ 0, %129 ]
  %134 = phi i64 [ %148, %144 ], [ 0, %129 ]
  %135 = phi i64 [ %149, %144 ], [ 0, %129 ]
  %136 = phi i64 [ %150, %144 ], [ 0, %129 ]
  %137 = phi i64 [ %151, %144 ], [ 0, %129 ]
  %138 = phi i64 [ %152, %144 ], [ 0, %129 ]
  %139 = phi i64 [ %153, %144 ], [ 0, %129 ]
  %140 = phi i64 [ %154, %144 ], [ 0, %129 ]
  %141 = phi i64 [ %155, %144 ], [ 0, %129 ]
  br label %115

; <label>:142:                                    ; preds = %127
  br label %144

; <label>:143:                                    ; preds = %127
  br label %144

; <label>:144:                                    ; preds = %143, %142
  %145 = phi i64 [ 1, %142 ], [ 0, %143 ]
  %146 = phi i64 [ 0, %142 ], [ 0, %143 ]
  %147 = phi i64 [ 0, %142 ], [ 0, %143 ]
  %148 = phi i64 [ 0, %142 ], [ 0, %143 ]
  %149 = phi i64 [ 0, %142 ], [ 0, %143 ]
  %150 = phi i64 [ 0, %142 ], [ 0, %143 ]
  %151 = phi i64 [ 0, %142 ], [ 0, %143 ]
  %152 = phi i64 [ 0, %142 ], [ 0, %143 ]
  %153 = phi i64 [ 0, %142 ], [ 0, %143 ]
  %154 = phi i64 [ 0, %142 ], [ 0, %143 ]
  %155 = phi i64 [ 0, %142 ], [ 0, %143 ]
  br label %130
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
