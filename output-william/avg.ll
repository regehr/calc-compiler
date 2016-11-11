; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64)

declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64)

declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64)

declare void @overflow_fail(i64)

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %6 = alloca i64
  store i64 0, i64* %6
  %7 = alloca i64
  store i64 0, i64* %7
  %8 = alloca i64
  store i64 0, i64* %8
  %9 = alloca i64
  store i64 0, i64* %9
  %10 = alloca i64
  store i64 0, i64* %10
  %11 = alloca i64
  store i64 0, i64* %11
  %12 = alloca i64
  store i64 0, i64* %12
  %13 = alloca i64
  store i64 0, i64* %13
  %14 = alloca i64
  store i64 0, i64* %14
  %15 = alloca i64
  store i64 0, i64* %15
  %"<=" = icmp sle i64 %0, 0
  br i1 %"<=", label %true, label %false

true:                                             ; preds = %entry
  br label %merge59

false:                                            ; preds = %entry
  %"==" = icmp eq i64 %0, 1
  br i1 %"==", label %true1, label %false2

true1:                                            ; preds = %false
  br label %merge57

false2:                                           ; preds = %false
  %"==3" = icmp eq i64 %0, 2
  br i1 %"==3", label %true4, label %false10

true4:                                            ; preds = %false2
  %16 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %17 = extractvalue { i64, i1 } %16, 1
  %18 = extractvalue { i64, i1 } %16, 0
  br i1 %17, label %error, label %noerror

error:                                            ; preds = %true4
  call void @overflow_fail(i64 114)
  ret i64 0

noerror:                                          ; preds = %true4
  %"==5" = icmp eq i64 2, 0
  %"==6" = icmp eq i64 2, -1
  %"==7" = icmp eq i64 %18, -9223372036854775808
  %19 = and i1 %"==6", %"==7"
  %20 = or i1 %19, %"==5"
  br i1 %20, label %error8, label %noerror9

error8:                                           ; preds = %noerror
  call void @overflow_fail(i64 111)
  ret i64 0

noerror9:                                         ; preds = %noerror
  %"/" = sdiv i64 %18, 2
  br label %merge55

false10:                                          ; preds = %false2
  %"==11" = icmp eq i64 %0, 3
  br i1 %"==11", label %true12, label %false23

true12:                                           ; preds = %false10
  %21 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %2, i64 %3)
  %22 = extractvalue { i64, i1 } %21, 1
  %23 = extractvalue { i64, i1 } %21, 0
  br i1 %22, label %error13, label %noerror14

error13:                                          ; preds = %true12
  call void @overflow_fail(i64 178)
  ret i64 0

noerror14:                                        ; preds = %true12
  %24 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %23)
  %25 = extractvalue { i64, i1 } %24, 1
  %26 = extractvalue { i64, i1 } %24, 0
  br i1 %25, label %error15, label %noerror16

error15:                                          ; preds = %noerror14
  call void @overflow_fail(i64 172)
  ret i64 0

noerror16:                                        ; preds = %noerror14
  %"==17" = icmp eq i64 3, 0
  %"==18" = icmp eq i64 3, -1
  %"==19" = icmp eq i64 %26, -9223372036854775808
  %27 = and i1 %"==18", %"==19"
  %28 = or i1 %27, %"==17"
  br i1 %28, label %error20, label %noerror21

error20:                                          ; preds = %noerror16
  call void @overflow_fail(i64 169)
  ret i64 0

noerror21:                                        ; preds = %noerror16
  %"/22" = sdiv i64 %26, 3
  br label %merge53

false23:                                          ; preds = %false10
  %"==24" = icmp eq i64 %0, 4
  br i1 %"==24", label %true25, label %false38

true25:                                           ; preds = %false23
  %29 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %30 = extractvalue { i64, i1 } %29, 1
  %31 = extractvalue { i64, i1 } %29, 0
  br i1 %30, label %error26, label %noerror27

error26:                                          ; preds = %true25
  call void @overflow_fail(i64 248)
  ret i64 0

noerror27:                                        ; preds = %true25
  %32 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %4)
  %33 = extractvalue { i64, i1 } %32, 1
  %34 = extractvalue { i64, i1 } %32, 0
  br i1 %33, label %error28, label %noerror29

error28:                                          ; preds = %noerror27
  call void @overflow_fail(i64 258)
  ret i64 0

noerror29:                                        ; preds = %noerror27
  %35 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %31, i64 %34)
  %36 = extractvalue { i64, i1 } %35, 1
  %37 = extractvalue { i64, i1 } %35, 0
  br i1 %36, label %error30, label %noerror31

error30:                                          ; preds = %noerror29
  call void @overflow_fail(i64 245)
  ret i64 0

noerror31:                                        ; preds = %noerror29
  %"==32" = icmp eq i64 4, 0
  %"==33" = icmp eq i64 4, -1
  %"==34" = icmp eq i64 %37, -9223372036854775808
  %38 = and i1 %"==33", %"==34"
  %39 = or i1 %38, %"==32"
  br i1 %39, label %error35, label %noerror36

error35:                                          ; preds = %noerror31
  call void @overflow_fail(i64 242)
  ret i64 0

noerror36:                                        ; preds = %noerror31
  %"/37" = sdiv i64 %37, 4
  br label %merge

false38:                                          ; preds = %false23
  %40 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %41 = extractvalue { i64, i1 } %40, 1
  %42 = extractvalue { i64, i1 } %40, 0
  br i1 %41, label %error39, label %noerror40

error39:                                          ; preds = %false38
  call void @overflow_fail(i64 301)
  ret i64 0

noerror40:                                        ; preds = %false38
  %43 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %4)
  %44 = extractvalue { i64, i1 } %43, 1
  %45 = extractvalue { i64, i1 } %43, 0
  br i1 %44, label %error41, label %noerror42

error41:                                          ; preds = %noerror40
  call void @overflow_fail(i64 311)
  ret i64 0

noerror42:                                        ; preds = %noerror40
  %46 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %42, i64 %45)
  %47 = extractvalue { i64, i1 } %46, 1
  %48 = extractvalue { i64, i1 } %46, 0
  br i1 %47, label %error43, label %noerror44

error43:                                          ; preds = %noerror42
  call void @overflow_fail(i64 298)
  ret i64 0

noerror44:                                        ; preds = %noerror42
  %49 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %48, i64 %5)
  %50 = extractvalue { i64, i1 } %49, 1
  %51 = extractvalue { i64, i1 } %49, 0
  br i1 %50, label %error45, label %noerror46

error45:                                          ; preds = %noerror44
  call void @overflow_fail(i64 295)
  ret i64 0

noerror46:                                        ; preds = %noerror44
  %"==47" = icmp eq i64 5, 0
  %"==48" = icmp eq i64 5, -1
  %"==49" = icmp eq i64 %51, -9223372036854775808
  %52 = and i1 %"==48", %"==49"
  %53 = or i1 %52, %"==47"
  br i1 %53, label %error50, label %noerror51

error50:                                          ; preds = %noerror46
  call void @overflow_fail(i64 292)
  ret i64 0

noerror51:                                        ; preds = %noerror46
  %"/52" = sdiv i64 %51, 5
  br label %merge

merge:                                            ; preds = %noerror51, %noerror36
  %ifret = phi i64 [ %"/37", %noerror36 ], [ %"/52", %noerror51 ]
  br label %merge53

merge53:                                          ; preds = %merge, %noerror21
  %ifret54 = phi i64 [ %"/22", %noerror21 ], [ %ifret, %merge ]
  br label %merge55

merge55:                                          ; preds = %merge53, %noerror9
  %ifret56 = phi i64 [ %"/", %noerror9 ], [ %ifret54, %merge53 ]
  br label %merge57

merge57:                                          ; preds = %merge55, %true1
  %ifret58 = phi i64 [ %1, %true1 ], [ %ifret56, %merge55 ]
  br label %merge59

merge59:                                          ; preds = %merge57, %true
  %ifret60 = phi i64 [ 0, %true ], [ %ifret58, %merge57 ]
  ret i64 %ifret60
}
