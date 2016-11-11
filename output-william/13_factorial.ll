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
  %"==" = icmp eq i64 %0, 1
  br i1 %"==", label %true, label %false

true:                                             ; preds = %entry
  br label %merge472

false:                                            ; preds = %entry
  %"==1" = icmp eq i64 %0, 2
  br i1 %"==1", label %true2, label %false3

true2:                                            ; preds = %false
  %16 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %17 = extractvalue { i64, i1 } %16, 1
  %18 = extractvalue { i64, i1 } %16, 0
  br i1 %17, label %error, label %noerror

error:                                            ; preds = %true2
  call void @overflow_fail(i64 77)
  ret i64 0

noerror:                                          ; preds = %true2
  br label %merge470

false3:                                           ; preds = %false
  %"==4" = icmp eq i64 %0, 3
  br i1 %"==4", label %true5, label %false10

true5:                                            ; preds = %false3
  %19 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %20 = extractvalue { i64, i1 } %19, 1
  %21 = extractvalue { i64, i1 } %19, 0
  br i1 %20, label %error6, label %noerror7

error6:                                           ; preds = %true5
  call void @overflow_fail(i64 124)
  ret i64 0

noerror7:                                         ; preds = %true5
  %22 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %21)
  %23 = extractvalue { i64, i1 } %22, 1
  %24 = extractvalue { i64, i1 } %22, 0
  br i1 %23, label %error8, label %noerror9

error8:                                           ; preds = %noerror7
  call void @overflow_fail(i64 119)
  ret i64 0

noerror9:                                         ; preds = %noerror7
  br label %merge468

false10:                                          ; preds = %false3
  %"==11" = icmp eq i64 %0, 4
  br i1 %"==11", label %true12, label %false19

true12:                                           ; preds = %false10
  %25 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %26 = extractvalue { i64, i1 } %25, 1
  %27 = extractvalue { i64, i1 } %25, 0
  br i1 %26, label %error13, label %noerror14

error13:                                          ; preds = %true12
  call void @overflow_fail(i64 185)
  ret i64 0

noerror14:                                        ; preds = %true12
  %28 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %27)
  %29 = extractvalue { i64, i1 } %28, 1
  %30 = extractvalue { i64, i1 } %28, 0
  br i1 %29, label %error15, label %noerror16

error15:                                          ; preds = %noerror14
  call void @overflow_fail(i64 180)
  ret i64 0

noerror16:                                        ; preds = %noerror14
  %31 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %30)
  %32 = extractvalue { i64, i1 } %31, 1
  %33 = extractvalue { i64, i1 } %31, 0
  br i1 %32, label %error17, label %noerror18

error17:                                          ; preds = %noerror16
  call void @overflow_fail(i64 175)
  ret i64 0

noerror18:                                        ; preds = %noerror16
  br label %merge466

false19:                                          ; preds = %false10
  %"==20" = icmp eq i64 %0, 5
  br i1 %"==20", label %true21, label %false30

true21:                                           ; preds = %false19
  %34 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %35 = extractvalue { i64, i1 } %34, 1
  %36 = extractvalue { i64, i1 } %34, 0
  br i1 %35, label %error22, label %noerror23

error22:                                          ; preds = %true21
  call void @overflow_fail(i64 260)
  ret i64 0

noerror23:                                        ; preds = %true21
  %37 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %36)
  %38 = extractvalue { i64, i1 } %37, 1
  %39 = extractvalue { i64, i1 } %37, 0
  br i1 %38, label %error24, label %noerror25

error24:                                          ; preds = %noerror23
  call void @overflow_fail(i64 255)
  ret i64 0

noerror25:                                        ; preds = %noerror23
  %40 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %39)
  %41 = extractvalue { i64, i1 } %40, 1
  %42 = extractvalue { i64, i1 } %40, 0
  br i1 %41, label %error26, label %noerror27

error26:                                          ; preds = %noerror25
  call void @overflow_fail(i64 250)
  ret i64 0

noerror27:                                        ; preds = %noerror25
  %43 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %42)
  %44 = extractvalue { i64, i1 } %43, 1
  %45 = extractvalue { i64, i1 } %43, 0
  br i1 %44, label %error28, label %noerror29

error28:                                          ; preds = %noerror27
  call void @overflow_fail(i64 245)
  ret i64 0

noerror29:                                        ; preds = %noerror27
  br label %merge464

false30:                                          ; preds = %false19
  %"==31" = icmp eq i64 %0, 6
  br i1 %"==31", label %true32, label %false43

true32:                                           ; preds = %false30
  %46 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %47 = extractvalue { i64, i1 } %46, 1
  %48 = extractvalue { i64, i1 } %46, 0
  br i1 %47, label %error33, label %noerror34

error33:                                          ; preds = %true32
  call void @overflow_fail(i64 349)
  ret i64 0

noerror34:                                        ; preds = %true32
  %49 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %48)
  %50 = extractvalue { i64, i1 } %49, 1
  %51 = extractvalue { i64, i1 } %49, 0
  br i1 %50, label %error35, label %noerror36

error35:                                          ; preds = %noerror34
  call void @overflow_fail(i64 344)
  ret i64 0

noerror36:                                        ; preds = %noerror34
  %52 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %51)
  %53 = extractvalue { i64, i1 } %52, 1
  %54 = extractvalue { i64, i1 } %52, 0
  br i1 %53, label %error37, label %noerror38

error37:                                          ; preds = %noerror36
  call void @overflow_fail(i64 339)
  ret i64 0

noerror38:                                        ; preds = %noerror36
  %55 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %54)
  %56 = extractvalue { i64, i1 } %55, 1
  %57 = extractvalue { i64, i1 } %55, 0
  br i1 %56, label %error39, label %noerror40

error39:                                          ; preds = %noerror38
  call void @overflow_fail(i64 334)
  ret i64 0

noerror40:                                        ; preds = %noerror38
  %58 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %57)
  %59 = extractvalue { i64, i1 } %58, 1
  %60 = extractvalue { i64, i1 } %58, 0
  br i1 %59, label %error41, label %noerror42

error41:                                          ; preds = %noerror40
  call void @overflow_fail(i64 329)
  ret i64 0

noerror42:                                        ; preds = %noerror40
  br label %merge462

false43:                                          ; preds = %false30
  %"==44" = icmp eq i64 %0, 7
  br i1 %"==44", label %true45, label %false58

true45:                                           ; preds = %false43
  %61 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %62 = extractvalue { i64, i1 } %61, 1
  %63 = extractvalue { i64, i1 } %61, 0
  br i1 %62, label %error46, label %noerror47

error46:                                          ; preds = %true45
  call void @overflow_fail(i64 452)
  ret i64 0

noerror47:                                        ; preds = %true45
  %64 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %63)
  %65 = extractvalue { i64, i1 } %64, 1
  %66 = extractvalue { i64, i1 } %64, 0
  br i1 %65, label %error48, label %noerror49

error48:                                          ; preds = %noerror47
  call void @overflow_fail(i64 447)
  ret i64 0

noerror49:                                        ; preds = %noerror47
  %67 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %66)
  %68 = extractvalue { i64, i1 } %67, 1
  %69 = extractvalue { i64, i1 } %67, 0
  br i1 %68, label %error50, label %noerror51

error50:                                          ; preds = %noerror49
  call void @overflow_fail(i64 442)
  ret i64 0

noerror51:                                        ; preds = %noerror49
  %70 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %69)
  %71 = extractvalue { i64, i1 } %70, 1
  %72 = extractvalue { i64, i1 } %70, 0
  br i1 %71, label %error52, label %noerror53

error52:                                          ; preds = %noerror51
  call void @overflow_fail(i64 437)
  ret i64 0

noerror53:                                        ; preds = %noerror51
  %73 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %72)
  %74 = extractvalue { i64, i1 } %73, 1
  %75 = extractvalue { i64, i1 } %73, 0
  br i1 %74, label %error54, label %noerror55

error54:                                          ; preds = %noerror53
  call void @overflow_fail(i64 432)
  ret i64 0

noerror55:                                        ; preds = %noerror53
  %76 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %75)
  %77 = extractvalue { i64, i1 } %76, 1
  %78 = extractvalue { i64, i1 } %76, 0
  br i1 %77, label %error56, label %noerror57

error56:                                          ; preds = %noerror55
  call void @overflow_fail(i64 427)
  ret i64 0

noerror57:                                        ; preds = %noerror55
  br label %merge460

false58:                                          ; preds = %false43
  %"==59" = icmp eq i64 %0, 8
  br i1 %"==59", label %true60, label %false75

true60:                                           ; preds = %false58
  %79 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %80 = extractvalue { i64, i1 } %79, 1
  %81 = extractvalue { i64, i1 } %79, 0
  br i1 %80, label %error61, label %noerror62

error61:                                          ; preds = %true60
  call void @overflow_fail(i64 569)
  ret i64 0

noerror62:                                        ; preds = %true60
  %82 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %81)
  %83 = extractvalue { i64, i1 } %82, 1
  %84 = extractvalue { i64, i1 } %82, 0
  br i1 %83, label %error63, label %noerror64

error63:                                          ; preds = %noerror62
  call void @overflow_fail(i64 564)
  ret i64 0

noerror64:                                        ; preds = %noerror62
  %85 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %84)
  %86 = extractvalue { i64, i1 } %85, 1
  %87 = extractvalue { i64, i1 } %85, 0
  br i1 %86, label %error65, label %noerror66

error65:                                          ; preds = %noerror64
  call void @overflow_fail(i64 559)
  ret i64 0

noerror66:                                        ; preds = %noerror64
  %88 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %87)
  %89 = extractvalue { i64, i1 } %88, 1
  %90 = extractvalue { i64, i1 } %88, 0
  br i1 %89, label %error67, label %noerror68

error67:                                          ; preds = %noerror66
  call void @overflow_fail(i64 554)
  ret i64 0

noerror68:                                        ; preds = %noerror66
  %91 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %90)
  %92 = extractvalue { i64, i1 } %91, 1
  %93 = extractvalue { i64, i1 } %91, 0
  br i1 %92, label %error69, label %noerror70

error69:                                          ; preds = %noerror68
  call void @overflow_fail(i64 549)
  ret i64 0

noerror70:                                        ; preds = %noerror68
  %94 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %93)
  %95 = extractvalue { i64, i1 } %94, 1
  %96 = extractvalue { i64, i1 } %94, 0
  br i1 %95, label %error71, label %noerror72

error71:                                          ; preds = %noerror70
  call void @overflow_fail(i64 544)
  ret i64 0

noerror72:                                        ; preds = %noerror70
  %97 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %96)
  %98 = extractvalue { i64, i1 } %97, 1
  %99 = extractvalue { i64, i1 } %97, 0
  br i1 %98, label %error73, label %noerror74

error73:                                          ; preds = %noerror72
  call void @overflow_fail(i64 539)
  ret i64 0

noerror74:                                        ; preds = %noerror72
  br label %merge458

false75:                                          ; preds = %false58
  %"==76" = icmp eq i64 %0, 9
  br i1 %"==76", label %true77, label %false94

true77:                                           ; preds = %false75
  %100 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %101 = extractvalue { i64, i1 } %100, 1
  %102 = extractvalue { i64, i1 } %100, 0
  br i1 %101, label %error78, label %noerror79

error78:                                          ; preds = %true77
  call void @overflow_fail(i64 700)
  ret i64 0

noerror79:                                        ; preds = %true77
  %103 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %102)
  %104 = extractvalue { i64, i1 } %103, 1
  %105 = extractvalue { i64, i1 } %103, 0
  br i1 %104, label %error80, label %noerror81

error80:                                          ; preds = %noerror79
  call void @overflow_fail(i64 695)
  ret i64 0

noerror81:                                        ; preds = %noerror79
  %106 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %105)
  %107 = extractvalue { i64, i1 } %106, 1
  %108 = extractvalue { i64, i1 } %106, 0
  br i1 %107, label %error82, label %noerror83

error82:                                          ; preds = %noerror81
  call void @overflow_fail(i64 690)
  ret i64 0

noerror83:                                        ; preds = %noerror81
  %109 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %108)
  %110 = extractvalue { i64, i1 } %109, 1
  %111 = extractvalue { i64, i1 } %109, 0
  br i1 %110, label %error84, label %noerror85

error84:                                          ; preds = %noerror83
  call void @overflow_fail(i64 685)
  ret i64 0

noerror85:                                        ; preds = %noerror83
  %112 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %111)
  %113 = extractvalue { i64, i1 } %112, 1
  %114 = extractvalue { i64, i1 } %112, 0
  br i1 %113, label %error86, label %noerror87

error86:                                          ; preds = %noerror85
  call void @overflow_fail(i64 680)
  ret i64 0

noerror87:                                        ; preds = %noerror85
  %115 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %114)
  %116 = extractvalue { i64, i1 } %115, 1
  %117 = extractvalue { i64, i1 } %115, 0
  br i1 %116, label %error88, label %noerror89

error88:                                          ; preds = %noerror87
  call void @overflow_fail(i64 675)
  ret i64 0

noerror89:                                        ; preds = %noerror87
  %118 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %117)
  %119 = extractvalue { i64, i1 } %118, 1
  %120 = extractvalue { i64, i1 } %118, 0
  br i1 %119, label %error90, label %noerror91

error90:                                          ; preds = %noerror89
  call void @overflow_fail(i64 670)
  ret i64 0

noerror91:                                        ; preds = %noerror89
  %121 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %120)
  %122 = extractvalue { i64, i1 } %121, 1
  %123 = extractvalue { i64, i1 } %121, 0
  br i1 %122, label %error92, label %noerror93

error92:                                          ; preds = %noerror91
  call void @overflow_fail(i64 665)
  ret i64 0

noerror93:                                        ; preds = %noerror91
  br label %merge456

false94:                                          ; preds = %false75
  %"==95" = icmp eq i64 %0, 10
  br i1 %"==95", label %true96, label %false115

true96:                                           ; preds = %false94
  %124 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %125 = extractvalue { i64, i1 } %124, 1
  %126 = extractvalue { i64, i1 } %124, 0
  br i1 %125, label %error97, label %noerror98

error97:                                          ; preds = %true96
  call void @overflow_fail(i64 847)
  ret i64 0

noerror98:                                        ; preds = %true96
  %127 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %126)
  %128 = extractvalue { i64, i1 } %127, 1
  %129 = extractvalue { i64, i1 } %127, 0
  br i1 %128, label %error99, label %noerror100

error99:                                          ; preds = %noerror98
  call void @overflow_fail(i64 842)
  ret i64 0

noerror100:                                       ; preds = %noerror98
  %130 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %129)
  %131 = extractvalue { i64, i1 } %130, 1
  %132 = extractvalue { i64, i1 } %130, 0
  br i1 %131, label %error101, label %noerror102

error101:                                         ; preds = %noerror100
  call void @overflow_fail(i64 837)
  ret i64 0

noerror102:                                       ; preds = %noerror100
  %133 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %132)
  %134 = extractvalue { i64, i1 } %133, 1
  %135 = extractvalue { i64, i1 } %133, 0
  br i1 %134, label %error103, label %noerror104

error103:                                         ; preds = %noerror102
  call void @overflow_fail(i64 832)
  ret i64 0

noerror104:                                       ; preds = %noerror102
  %136 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %135)
  %137 = extractvalue { i64, i1 } %136, 1
  %138 = extractvalue { i64, i1 } %136, 0
  br i1 %137, label %error105, label %noerror106

error105:                                         ; preds = %noerror104
  call void @overflow_fail(i64 827)
  ret i64 0

noerror106:                                       ; preds = %noerror104
  %139 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %138)
  %140 = extractvalue { i64, i1 } %139, 1
  %141 = extractvalue { i64, i1 } %139, 0
  br i1 %140, label %error107, label %noerror108

error107:                                         ; preds = %noerror106
  call void @overflow_fail(i64 822)
  ret i64 0

noerror108:                                       ; preds = %noerror106
  %142 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %141)
  %143 = extractvalue { i64, i1 } %142, 1
  %144 = extractvalue { i64, i1 } %142, 0
  br i1 %143, label %error109, label %noerror110

error109:                                         ; preds = %noerror108
  call void @overflow_fail(i64 817)
  ret i64 0

noerror110:                                       ; preds = %noerror108
  %145 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %144)
  %146 = extractvalue { i64, i1 } %145, 1
  %147 = extractvalue { i64, i1 } %145, 0
  br i1 %146, label %error111, label %noerror112

error111:                                         ; preds = %noerror110
  call void @overflow_fail(i64 812)
  ret i64 0

noerror112:                                       ; preds = %noerror110
  %148 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %147)
  %149 = extractvalue { i64, i1 } %148, 1
  %150 = extractvalue { i64, i1 } %148, 0
  br i1 %149, label %error113, label %noerror114

error113:                                         ; preds = %noerror112
  call void @overflow_fail(i64 806)
  ret i64 0

noerror114:                                       ; preds = %noerror112
  br label %merge454

false115:                                         ; preds = %false94
  %"==116" = icmp eq i64 %0, 11
  br i1 %"==116", label %true117, label %false138

true117:                                          ; preds = %false115
  %151 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %152 = extractvalue { i64, i1 } %151, 1
  %153 = extractvalue { i64, i1 } %151, 0
  br i1 %152, label %error118, label %noerror119

error118:                                         ; preds = %true117
  call void @overflow_fail(i64 1009)
  ret i64 0

noerror119:                                       ; preds = %true117
  %154 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %153)
  %155 = extractvalue { i64, i1 } %154, 1
  %156 = extractvalue { i64, i1 } %154, 0
  br i1 %155, label %error120, label %noerror121

error120:                                         ; preds = %noerror119
  call void @overflow_fail(i64 1004)
  ret i64 0

noerror121:                                       ; preds = %noerror119
  %157 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %156)
  %158 = extractvalue { i64, i1 } %157, 1
  %159 = extractvalue { i64, i1 } %157, 0
  br i1 %158, label %error122, label %noerror123

error122:                                         ; preds = %noerror121
  call void @overflow_fail(i64 999)
  ret i64 0

noerror123:                                       ; preds = %noerror121
  %160 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %159)
  %161 = extractvalue { i64, i1 } %160, 1
  %162 = extractvalue { i64, i1 } %160, 0
  br i1 %161, label %error124, label %noerror125

error124:                                         ; preds = %noerror123
  call void @overflow_fail(i64 994)
  ret i64 0

noerror125:                                       ; preds = %noerror123
  %163 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %162)
  %164 = extractvalue { i64, i1 } %163, 1
  %165 = extractvalue { i64, i1 } %163, 0
  br i1 %164, label %error126, label %noerror127

error126:                                         ; preds = %noerror125
  call void @overflow_fail(i64 989)
  ret i64 0

noerror127:                                       ; preds = %noerror125
  %166 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %165)
  %167 = extractvalue { i64, i1 } %166, 1
  %168 = extractvalue { i64, i1 } %166, 0
  br i1 %167, label %error128, label %noerror129

error128:                                         ; preds = %noerror127
  call void @overflow_fail(i64 984)
  ret i64 0

noerror129:                                       ; preds = %noerror127
  %169 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %168)
  %170 = extractvalue { i64, i1 } %169, 1
  %171 = extractvalue { i64, i1 } %169, 0
  br i1 %170, label %error130, label %noerror131

error130:                                         ; preds = %noerror129
  call void @overflow_fail(i64 979)
  ret i64 0

noerror131:                                       ; preds = %noerror129
  %172 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %171)
  %173 = extractvalue { i64, i1 } %172, 1
  %174 = extractvalue { i64, i1 } %172, 0
  br i1 %173, label %error132, label %noerror133

error132:                                         ; preds = %noerror131
  call void @overflow_fail(i64 974)
  ret i64 0

noerror133:                                       ; preds = %noerror131
  %175 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %174)
  %176 = extractvalue { i64, i1 } %175, 1
  %177 = extractvalue { i64, i1 } %175, 0
  br i1 %176, label %error134, label %noerror135

error134:                                         ; preds = %noerror133
  call void @overflow_fail(i64 968)
  ret i64 0

noerror135:                                       ; preds = %noerror133
  %178 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %177)
  %179 = extractvalue { i64, i1 } %178, 1
  %180 = extractvalue { i64, i1 } %178, 0
  br i1 %179, label %error136, label %noerror137

error136:                                         ; preds = %noerror135
  call void @overflow_fail(i64 962)
  ret i64 0

noerror137:                                       ; preds = %noerror135
  br label %merge452

false138:                                         ; preds = %false115
  %"==139" = icmp eq i64 %0, 12
  br i1 %"==139", label %true140, label %false163

true140:                                          ; preds = %false138
  %181 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %182 = extractvalue { i64, i1 } %181, 1
  %183 = extractvalue { i64, i1 } %181, 0
  br i1 %182, label %error141, label %noerror142

error141:                                         ; preds = %true140
  call void @overflow_fail(i64 1186)
  ret i64 0

noerror142:                                       ; preds = %true140
  %184 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %183)
  %185 = extractvalue { i64, i1 } %184, 1
  %186 = extractvalue { i64, i1 } %184, 0
  br i1 %185, label %error143, label %noerror144

error143:                                         ; preds = %noerror142
  call void @overflow_fail(i64 1181)
  ret i64 0

noerror144:                                       ; preds = %noerror142
  %187 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %186)
  %188 = extractvalue { i64, i1 } %187, 1
  %189 = extractvalue { i64, i1 } %187, 0
  br i1 %188, label %error145, label %noerror146

error145:                                         ; preds = %noerror144
  call void @overflow_fail(i64 1176)
  ret i64 0

noerror146:                                       ; preds = %noerror144
  %190 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %189)
  %191 = extractvalue { i64, i1 } %190, 1
  %192 = extractvalue { i64, i1 } %190, 0
  br i1 %191, label %error147, label %noerror148

error147:                                         ; preds = %noerror146
  call void @overflow_fail(i64 1171)
  ret i64 0

noerror148:                                       ; preds = %noerror146
  %193 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %192)
  %194 = extractvalue { i64, i1 } %193, 1
  %195 = extractvalue { i64, i1 } %193, 0
  br i1 %194, label %error149, label %noerror150

error149:                                         ; preds = %noerror148
  call void @overflow_fail(i64 1166)
  ret i64 0

noerror150:                                       ; preds = %noerror148
  %196 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %195)
  %197 = extractvalue { i64, i1 } %196, 1
  %198 = extractvalue { i64, i1 } %196, 0
  br i1 %197, label %error151, label %noerror152

error151:                                         ; preds = %noerror150
  call void @overflow_fail(i64 1161)
  ret i64 0

noerror152:                                       ; preds = %noerror150
  %199 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %198)
  %200 = extractvalue { i64, i1 } %199, 1
  %201 = extractvalue { i64, i1 } %199, 0
  br i1 %200, label %error153, label %noerror154

error153:                                         ; preds = %noerror152
  call void @overflow_fail(i64 1156)
  ret i64 0

noerror154:                                       ; preds = %noerror152
  %202 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %201)
  %203 = extractvalue { i64, i1 } %202, 1
  %204 = extractvalue { i64, i1 } %202, 0
  br i1 %203, label %error155, label %noerror156

error155:                                         ; preds = %noerror154
  call void @overflow_fail(i64 1151)
  ret i64 0

noerror156:                                       ; preds = %noerror154
  %205 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %204)
  %206 = extractvalue { i64, i1 } %205, 1
  %207 = extractvalue { i64, i1 } %205, 0
  br i1 %206, label %error157, label %noerror158

error157:                                         ; preds = %noerror156
  call void @overflow_fail(i64 1145)
  ret i64 0

noerror158:                                       ; preds = %noerror156
  %208 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %207)
  %209 = extractvalue { i64, i1 } %208, 1
  %210 = extractvalue { i64, i1 } %208, 0
  br i1 %209, label %error159, label %noerror160

error159:                                         ; preds = %noerror158
  call void @overflow_fail(i64 1139)
  ret i64 0

noerror160:                                       ; preds = %noerror158
  %211 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %210)
  %212 = extractvalue { i64, i1 } %211, 1
  %213 = extractvalue { i64, i1 } %211, 0
  br i1 %212, label %error161, label %noerror162

error161:                                         ; preds = %noerror160
  call void @overflow_fail(i64 1133)
  ret i64 0

noerror162:                                       ; preds = %noerror160
  br label %merge450

false163:                                         ; preds = %false138
  %"==164" = icmp eq i64 %0, 13
  br i1 %"==164", label %true165, label %false190

true165:                                          ; preds = %false163
  %214 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %215 = extractvalue { i64, i1 } %214, 1
  %216 = extractvalue { i64, i1 } %214, 0
  br i1 %215, label %error166, label %noerror167

error166:                                         ; preds = %true165
  call void @overflow_fail(i64 1378)
  ret i64 0

noerror167:                                       ; preds = %true165
  %217 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %216)
  %218 = extractvalue { i64, i1 } %217, 1
  %219 = extractvalue { i64, i1 } %217, 0
  br i1 %218, label %error168, label %noerror169

error168:                                         ; preds = %noerror167
  call void @overflow_fail(i64 1373)
  ret i64 0

noerror169:                                       ; preds = %noerror167
  %220 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %219)
  %221 = extractvalue { i64, i1 } %220, 1
  %222 = extractvalue { i64, i1 } %220, 0
  br i1 %221, label %error170, label %noerror171

error170:                                         ; preds = %noerror169
  call void @overflow_fail(i64 1368)
  ret i64 0

noerror171:                                       ; preds = %noerror169
  %223 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %222)
  %224 = extractvalue { i64, i1 } %223, 1
  %225 = extractvalue { i64, i1 } %223, 0
  br i1 %224, label %error172, label %noerror173

error172:                                         ; preds = %noerror171
  call void @overflow_fail(i64 1363)
  ret i64 0

noerror173:                                       ; preds = %noerror171
  %226 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %225)
  %227 = extractvalue { i64, i1 } %226, 1
  %228 = extractvalue { i64, i1 } %226, 0
  br i1 %227, label %error174, label %noerror175

error174:                                         ; preds = %noerror173
  call void @overflow_fail(i64 1358)
  ret i64 0

noerror175:                                       ; preds = %noerror173
  %229 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %228)
  %230 = extractvalue { i64, i1 } %229, 1
  %231 = extractvalue { i64, i1 } %229, 0
  br i1 %230, label %error176, label %noerror177

error176:                                         ; preds = %noerror175
  call void @overflow_fail(i64 1353)
  ret i64 0

noerror177:                                       ; preds = %noerror175
  %232 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %231)
  %233 = extractvalue { i64, i1 } %232, 1
  %234 = extractvalue { i64, i1 } %232, 0
  br i1 %233, label %error178, label %noerror179

error178:                                         ; preds = %noerror177
  call void @overflow_fail(i64 1348)
  ret i64 0

noerror179:                                       ; preds = %noerror177
  %235 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %234)
  %236 = extractvalue { i64, i1 } %235, 1
  %237 = extractvalue { i64, i1 } %235, 0
  br i1 %236, label %error180, label %noerror181

error180:                                         ; preds = %noerror179
  call void @overflow_fail(i64 1343)
  ret i64 0

noerror181:                                       ; preds = %noerror179
  %238 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %237)
  %239 = extractvalue { i64, i1 } %238, 1
  %240 = extractvalue { i64, i1 } %238, 0
  br i1 %239, label %error182, label %noerror183

error182:                                         ; preds = %noerror181
  call void @overflow_fail(i64 1337)
  ret i64 0

noerror183:                                       ; preds = %noerror181
  %241 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %240)
  %242 = extractvalue { i64, i1 } %241, 1
  %243 = extractvalue { i64, i1 } %241, 0
  br i1 %242, label %error184, label %noerror185

error184:                                         ; preds = %noerror183
  call void @overflow_fail(i64 1331)
  ret i64 0

noerror185:                                       ; preds = %noerror183
  %244 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %243)
  %245 = extractvalue { i64, i1 } %244, 1
  %246 = extractvalue { i64, i1 } %244, 0
  br i1 %245, label %error186, label %noerror187

error186:                                         ; preds = %noerror185
  call void @overflow_fail(i64 1325)
  ret i64 0

noerror187:                                       ; preds = %noerror185
  %247 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %246)
  %248 = extractvalue { i64, i1 } %247, 1
  %249 = extractvalue { i64, i1 } %247, 0
  br i1 %248, label %error188, label %noerror189

error188:                                         ; preds = %noerror187
  call void @overflow_fail(i64 1319)
  ret i64 0

noerror189:                                       ; preds = %noerror187
  br label %merge448

false190:                                         ; preds = %false163
  %"==191" = icmp eq i64 %0, 14
  br i1 %"==191", label %true192, label %false219

true192:                                          ; preds = %false190
  %250 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %251 = extractvalue { i64, i1 } %250, 1
  %252 = extractvalue { i64, i1 } %250, 0
  br i1 %251, label %error193, label %noerror194

error193:                                         ; preds = %true192
  call void @overflow_fail(i64 1585)
  ret i64 0

noerror194:                                       ; preds = %true192
  %253 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %252)
  %254 = extractvalue { i64, i1 } %253, 1
  %255 = extractvalue { i64, i1 } %253, 0
  br i1 %254, label %error195, label %noerror196

error195:                                         ; preds = %noerror194
  call void @overflow_fail(i64 1580)
  ret i64 0

noerror196:                                       ; preds = %noerror194
  %256 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %255)
  %257 = extractvalue { i64, i1 } %256, 1
  %258 = extractvalue { i64, i1 } %256, 0
  br i1 %257, label %error197, label %noerror198

error197:                                         ; preds = %noerror196
  call void @overflow_fail(i64 1575)
  ret i64 0

noerror198:                                       ; preds = %noerror196
  %259 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %258)
  %260 = extractvalue { i64, i1 } %259, 1
  %261 = extractvalue { i64, i1 } %259, 0
  br i1 %260, label %error199, label %noerror200

error199:                                         ; preds = %noerror198
  call void @overflow_fail(i64 1570)
  ret i64 0

noerror200:                                       ; preds = %noerror198
  %262 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %261)
  %263 = extractvalue { i64, i1 } %262, 1
  %264 = extractvalue { i64, i1 } %262, 0
  br i1 %263, label %error201, label %noerror202

error201:                                         ; preds = %noerror200
  call void @overflow_fail(i64 1565)
  ret i64 0

noerror202:                                       ; preds = %noerror200
  %265 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %264)
  %266 = extractvalue { i64, i1 } %265, 1
  %267 = extractvalue { i64, i1 } %265, 0
  br i1 %266, label %error203, label %noerror204

error203:                                         ; preds = %noerror202
  call void @overflow_fail(i64 1560)
  ret i64 0

noerror204:                                       ; preds = %noerror202
  %268 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %267)
  %269 = extractvalue { i64, i1 } %268, 1
  %270 = extractvalue { i64, i1 } %268, 0
  br i1 %269, label %error205, label %noerror206

error205:                                         ; preds = %noerror204
  call void @overflow_fail(i64 1555)
  ret i64 0

noerror206:                                       ; preds = %noerror204
  %271 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %270)
  %272 = extractvalue { i64, i1 } %271, 1
  %273 = extractvalue { i64, i1 } %271, 0
  br i1 %272, label %error207, label %noerror208

error207:                                         ; preds = %noerror206
  call void @overflow_fail(i64 1550)
  ret i64 0

noerror208:                                       ; preds = %noerror206
  %274 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %273)
  %275 = extractvalue { i64, i1 } %274, 1
  %276 = extractvalue { i64, i1 } %274, 0
  br i1 %275, label %error209, label %noerror210

error209:                                         ; preds = %noerror208
  call void @overflow_fail(i64 1544)
  ret i64 0

noerror210:                                       ; preds = %noerror208
  %277 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %276)
  %278 = extractvalue { i64, i1 } %277, 1
  %279 = extractvalue { i64, i1 } %277, 0
  br i1 %278, label %error211, label %noerror212

error211:                                         ; preds = %noerror210
  call void @overflow_fail(i64 1538)
  ret i64 0

noerror212:                                       ; preds = %noerror210
  %280 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %279)
  %281 = extractvalue { i64, i1 } %280, 1
  %282 = extractvalue { i64, i1 } %280, 0
  br i1 %281, label %error213, label %noerror214

error213:                                         ; preds = %noerror212
  call void @overflow_fail(i64 1532)
  ret i64 0

noerror214:                                       ; preds = %noerror212
  %283 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %282)
  %284 = extractvalue { i64, i1 } %283, 1
  %285 = extractvalue { i64, i1 } %283, 0
  br i1 %284, label %error215, label %noerror216

error215:                                         ; preds = %noerror214
  call void @overflow_fail(i64 1526)
  ret i64 0

noerror216:                                       ; preds = %noerror214
  %286 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %285)
  %287 = extractvalue { i64, i1 } %286, 1
  %288 = extractvalue { i64, i1 } %286, 0
  br i1 %287, label %error217, label %noerror218

error217:                                         ; preds = %noerror216
  call void @overflow_fail(i64 1520)
  ret i64 0

noerror218:                                       ; preds = %noerror216
  br label %merge446

false219:                                         ; preds = %false190
  %"==220" = icmp eq i64 %0, 15
  br i1 %"==220", label %true221, label %false250

true221:                                          ; preds = %false219
  %289 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %290 = extractvalue { i64, i1 } %289, 1
  %291 = extractvalue { i64, i1 } %289, 0
  br i1 %290, label %error222, label %noerror223

error222:                                         ; preds = %true221
  call void @overflow_fail(i64 1807)
  ret i64 0

noerror223:                                       ; preds = %true221
  %292 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %291)
  %293 = extractvalue { i64, i1 } %292, 1
  %294 = extractvalue { i64, i1 } %292, 0
  br i1 %293, label %error224, label %noerror225

error224:                                         ; preds = %noerror223
  call void @overflow_fail(i64 1802)
  ret i64 0

noerror225:                                       ; preds = %noerror223
  %295 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %294)
  %296 = extractvalue { i64, i1 } %295, 1
  %297 = extractvalue { i64, i1 } %295, 0
  br i1 %296, label %error226, label %noerror227

error226:                                         ; preds = %noerror225
  call void @overflow_fail(i64 1797)
  ret i64 0

noerror227:                                       ; preds = %noerror225
  %298 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %297)
  %299 = extractvalue { i64, i1 } %298, 1
  %300 = extractvalue { i64, i1 } %298, 0
  br i1 %299, label %error228, label %noerror229

error228:                                         ; preds = %noerror227
  call void @overflow_fail(i64 1792)
  ret i64 0

noerror229:                                       ; preds = %noerror227
  %301 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %300)
  %302 = extractvalue { i64, i1 } %301, 1
  %303 = extractvalue { i64, i1 } %301, 0
  br i1 %302, label %error230, label %noerror231

error230:                                         ; preds = %noerror229
  call void @overflow_fail(i64 1787)
  ret i64 0

noerror231:                                       ; preds = %noerror229
  %304 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %303)
  %305 = extractvalue { i64, i1 } %304, 1
  %306 = extractvalue { i64, i1 } %304, 0
  br i1 %305, label %error232, label %noerror233

error232:                                         ; preds = %noerror231
  call void @overflow_fail(i64 1782)
  ret i64 0

noerror233:                                       ; preds = %noerror231
  %307 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %306)
  %308 = extractvalue { i64, i1 } %307, 1
  %309 = extractvalue { i64, i1 } %307, 0
  br i1 %308, label %error234, label %noerror235

error234:                                         ; preds = %noerror233
  call void @overflow_fail(i64 1777)
  ret i64 0

noerror235:                                       ; preds = %noerror233
  %310 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %309)
  %311 = extractvalue { i64, i1 } %310, 1
  %312 = extractvalue { i64, i1 } %310, 0
  br i1 %311, label %error236, label %noerror237

error236:                                         ; preds = %noerror235
  call void @overflow_fail(i64 1772)
  ret i64 0

noerror237:                                       ; preds = %noerror235
  %313 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %312)
  %314 = extractvalue { i64, i1 } %313, 1
  %315 = extractvalue { i64, i1 } %313, 0
  br i1 %314, label %error238, label %noerror239

error238:                                         ; preds = %noerror237
  call void @overflow_fail(i64 1766)
  ret i64 0

noerror239:                                       ; preds = %noerror237
  %316 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %315)
  %317 = extractvalue { i64, i1 } %316, 1
  %318 = extractvalue { i64, i1 } %316, 0
  br i1 %317, label %error240, label %noerror241

error240:                                         ; preds = %noerror239
  call void @overflow_fail(i64 1760)
  ret i64 0

noerror241:                                       ; preds = %noerror239
  %319 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %318)
  %320 = extractvalue { i64, i1 } %319, 1
  %321 = extractvalue { i64, i1 } %319, 0
  br i1 %320, label %error242, label %noerror243

error242:                                         ; preds = %noerror241
  call void @overflow_fail(i64 1754)
  ret i64 0

noerror243:                                       ; preds = %noerror241
  %322 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %321)
  %323 = extractvalue { i64, i1 } %322, 1
  %324 = extractvalue { i64, i1 } %322, 0
  br i1 %323, label %error244, label %noerror245

error244:                                         ; preds = %noerror243
  call void @overflow_fail(i64 1748)
  ret i64 0

noerror245:                                       ; preds = %noerror243
  %325 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %324)
  %326 = extractvalue { i64, i1 } %325, 1
  %327 = extractvalue { i64, i1 } %325, 0
  br i1 %326, label %error246, label %noerror247

error246:                                         ; preds = %noerror245
  call void @overflow_fail(i64 1742)
  ret i64 0

noerror247:                                       ; preds = %noerror245
  %328 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %327)
  %329 = extractvalue { i64, i1 } %328, 1
  %330 = extractvalue { i64, i1 } %328, 0
  br i1 %329, label %error248, label %noerror249

error248:                                         ; preds = %noerror247
  call void @overflow_fail(i64 1736)
  ret i64 0

noerror249:                                       ; preds = %noerror247
  br label %merge444

false250:                                         ; preds = %false219
  %"==251" = icmp eq i64 %0, 16
  br i1 %"==251", label %true252, label %false283

true252:                                          ; preds = %false250
  %331 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %332 = extractvalue { i64, i1 } %331, 1
  %333 = extractvalue { i64, i1 } %331, 0
  br i1 %332, label %error253, label %noerror254

error253:                                         ; preds = %true252
  call void @overflow_fail(i64 2044)
  ret i64 0

noerror254:                                       ; preds = %true252
  %334 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %333)
  %335 = extractvalue { i64, i1 } %334, 1
  %336 = extractvalue { i64, i1 } %334, 0
  br i1 %335, label %error255, label %noerror256

error255:                                         ; preds = %noerror254
  call void @overflow_fail(i64 2039)
  ret i64 0

noerror256:                                       ; preds = %noerror254
  %337 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %336)
  %338 = extractvalue { i64, i1 } %337, 1
  %339 = extractvalue { i64, i1 } %337, 0
  br i1 %338, label %error257, label %noerror258

error257:                                         ; preds = %noerror256
  call void @overflow_fail(i64 2034)
  ret i64 0

noerror258:                                       ; preds = %noerror256
  %340 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %339)
  %341 = extractvalue { i64, i1 } %340, 1
  %342 = extractvalue { i64, i1 } %340, 0
  br i1 %341, label %error259, label %noerror260

error259:                                         ; preds = %noerror258
  call void @overflow_fail(i64 2029)
  ret i64 0

noerror260:                                       ; preds = %noerror258
  %343 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %342)
  %344 = extractvalue { i64, i1 } %343, 1
  %345 = extractvalue { i64, i1 } %343, 0
  br i1 %344, label %error261, label %noerror262

error261:                                         ; preds = %noerror260
  call void @overflow_fail(i64 2024)
  ret i64 0

noerror262:                                       ; preds = %noerror260
  %346 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %345)
  %347 = extractvalue { i64, i1 } %346, 1
  %348 = extractvalue { i64, i1 } %346, 0
  br i1 %347, label %error263, label %noerror264

error263:                                         ; preds = %noerror262
  call void @overflow_fail(i64 2019)
  ret i64 0

noerror264:                                       ; preds = %noerror262
  %349 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %348)
  %350 = extractvalue { i64, i1 } %349, 1
  %351 = extractvalue { i64, i1 } %349, 0
  br i1 %350, label %error265, label %noerror266

error265:                                         ; preds = %noerror264
  call void @overflow_fail(i64 2014)
  ret i64 0

noerror266:                                       ; preds = %noerror264
  %352 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %351)
  %353 = extractvalue { i64, i1 } %352, 1
  %354 = extractvalue { i64, i1 } %352, 0
  br i1 %353, label %error267, label %noerror268

error267:                                         ; preds = %noerror266
  call void @overflow_fail(i64 2009)
  ret i64 0

noerror268:                                       ; preds = %noerror266
  %355 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %354)
  %356 = extractvalue { i64, i1 } %355, 1
  %357 = extractvalue { i64, i1 } %355, 0
  br i1 %356, label %error269, label %noerror270

error269:                                         ; preds = %noerror268
  call void @overflow_fail(i64 2003)
  ret i64 0

noerror270:                                       ; preds = %noerror268
  %358 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %357)
  %359 = extractvalue { i64, i1 } %358, 1
  %360 = extractvalue { i64, i1 } %358, 0
  br i1 %359, label %error271, label %noerror272

error271:                                         ; preds = %noerror270
  call void @overflow_fail(i64 1997)
  ret i64 0

noerror272:                                       ; preds = %noerror270
  %361 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %360)
  %362 = extractvalue { i64, i1 } %361, 1
  %363 = extractvalue { i64, i1 } %361, 0
  br i1 %362, label %error273, label %noerror274

error273:                                         ; preds = %noerror272
  call void @overflow_fail(i64 1991)
  ret i64 0

noerror274:                                       ; preds = %noerror272
  %364 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %363)
  %365 = extractvalue { i64, i1 } %364, 1
  %366 = extractvalue { i64, i1 } %364, 0
  br i1 %365, label %error275, label %noerror276

error275:                                         ; preds = %noerror274
  call void @overflow_fail(i64 1985)
  ret i64 0

noerror276:                                       ; preds = %noerror274
  %367 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %366)
  %368 = extractvalue { i64, i1 } %367, 1
  %369 = extractvalue { i64, i1 } %367, 0
  br i1 %368, label %error277, label %noerror278

error277:                                         ; preds = %noerror276
  call void @overflow_fail(i64 1979)
  ret i64 0

noerror278:                                       ; preds = %noerror276
  %370 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %369)
  %371 = extractvalue { i64, i1 } %370, 1
  %372 = extractvalue { i64, i1 } %370, 0
  br i1 %371, label %error279, label %noerror280

error279:                                         ; preds = %noerror278
  call void @overflow_fail(i64 1973)
  ret i64 0

noerror280:                                       ; preds = %noerror278
  %373 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %372)
  %374 = extractvalue { i64, i1 } %373, 1
  %375 = extractvalue { i64, i1 } %373, 0
  br i1 %374, label %error281, label %noerror282

error281:                                         ; preds = %noerror280
  call void @overflow_fail(i64 1967)
  ret i64 0

noerror282:                                       ; preds = %noerror280
  br label %merge442

false283:                                         ; preds = %false250
  %"==284" = icmp eq i64 %0, 17
  br i1 %"==284", label %true285, label %false318

true285:                                          ; preds = %false283
  %376 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %377 = extractvalue { i64, i1 } %376, 1
  %378 = extractvalue { i64, i1 } %376, 0
  br i1 %377, label %error286, label %noerror287

error286:                                         ; preds = %true285
  call void @overflow_fail(i64 2296)
  ret i64 0

noerror287:                                       ; preds = %true285
  %379 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %378)
  %380 = extractvalue { i64, i1 } %379, 1
  %381 = extractvalue { i64, i1 } %379, 0
  br i1 %380, label %error288, label %noerror289

error288:                                         ; preds = %noerror287
  call void @overflow_fail(i64 2291)
  ret i64 0

noerror289:                                       ; preds = %noerror287
  %382 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %381)
  %383 = extractvalue { i64, i1 } %382, 1
  %384 = extractvalue { i64, i1 } %382, 0
  br i1 %383, label %error290, label %noerror291

error290:                                         ; preds = %noerror289
  call void @overflow_fail(i64 2286)
  ret i64 0

noerror291:                                       ; preds = %noerror289
  %385 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %384)
  %386 = extractvalue { i64, i1 } %385, 1
  %387 = extractvalue { i64, i1 } %385, 0
  br i1 %386, label %error292, label %noerror293

error292:                                         ; preds = %noerror291
  call void @overflow_fail(i64 2281)
  ret i64 0

noerror293:                                       ; preds = %noerror291
  %388 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %387)
  %389 = extractvalue { i64, i1 } %388, 1
  %390 = extractvalue { i64, i1 } %388, 0
  br i1 %389, label %error294, label %noerror295

error294:                                         ; preds = %noerror293
  call void @overflow_fail(i64 2276)
  ret i64 0

noerror295:                                       ; preds = %noerror293
  %391 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %390)
  %392 = extractvalue { i64, i1 } %391, 1
  %393 = extractvalue { i64, i1 } %391, 0
  br i1 %392, label %error296, label %noerror297

error296:                                         ; preds = %noerror295
  call void @overflow_fail(i64 2271)
  ret i64 0

noerror297:                                       ; preds = %noerror295
  %394 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %393)
  %395 = extractvalue { i64, i1 } %394, 1
  %396 = extractvalue { i64, i1 } %394, 0
  br i1 %395, label %error298, label %noerror299

error298:                                         ; preds = %noerror297
  call void @overflow_fail(i64 2266)
  ret i64 0

noerror299:                                       ; preds = %noerror297
  %397 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %396)
  %398 = extractvalue { i64, i1 } %397, 1
  %399 = extractvalue { i64, i1 } %397, 0
  br i1 %398, label %error300, label %noerror301

error300:                                         ; preds = %noerror299
  call void @overflow_fail(i64 2261)
  ret i64 0

noerror301:                                       ; preds = %noerror299
  %400 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %399)
  %401 = extractvalue { i64, i1 } %400, 1
  %402 = extractvalue { i64, i1 } %400, 0
  br i1 %401, label %error302, label %noerror303

error302:                                         ; preds = %noerror301
  call void @overflow_fail(i64 2255)
  ret i64 0

noerror303:                                       ; preds = %noerror301
  %403 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %402)
  %404 = extractvalue { i64, i1 } %403, 1
  %405 = extractvalue { i64, i1 } %403, 0
  br i1 %404, label %error304, label %noerror305

error304:                                         ; preds = %noerror303
  call void @overflow_fail(i64 2249)
  ret i64 0

noerror305:                                       ; preds = %noerror303
  %406 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %405)
  %407 = extractvalue { i64, i1 } %406, 1
  %408 = extractvalue { i64, i1 } %406, 0
  br i1 %407, label %error306, label %noerror307

error306:                                         ; preds = %noerror305
  call void @overflow_fail(i64 2243)
  ret i64 0

noerror307:                                       ; preds = %noerror305
  %409 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %408)
  %410 = extractvalue { i64, i1 } %409, 1
  %411 = extractvalue { i64, i1 } %409, 0
  br i1 %410, label %error308, label %noerror309

error308:                                         ; preds = %noerror307
  call void @overflow_fail(i64 2237)
  ret i64 0

noerror309:                                       ; preds = %noerror307
  %412 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %411)
  %413 = extractvalue { i64, i1 } %412, 1
  %414 = extractvalue { i64, i1 } %412, 0
  br i1 %413, label %error310, label %noerror311

error310:                                         ; preds = %noerror309
  call void @overflow_fail(i64 2231)
  ret i64 0

noerror311:                                       ; preds = %noerror309
  %415 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %414)
  %416 = extractvalue { i64, i1 } %415, 1
  %417 = extractvalue { i64, i1 } %415, 0
  br i1 %416, label %error312, label %noerror313

error312:                                         ; preds = %noerror311
  call void @overflow_fail(i64 2225)
  ret i64 0

noerror313:                                       ; preds = %noerror311
  %418 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %417)
  %419 = extractvalue { i64, i1 } %418, 1
  %420 = extractvalue { i64, i1 } %418, 0
  br i1 %419, label %error314, label %noerror315

error314:                                         ; preds = %noerror313
  call void @overflow_fail(i64 2219)
  ret i64 0

noerror315:                                       ; preds = %noerror313
  %421 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %420)
  %422 = extractvalue { i64, i1 } %421, 1
  %423 = extractvalue { i64, i1 } %421, 0
  br i1 %422, label %error316, label %noerror317

error316:                                         ; preds = %noerror315
  call void @overflow_fail(i64 2213)
  ret i64 0

noerror317:                                       ; preds = %noerror315
  br label %merge440

false318:                                         ; preds = %false283
  %"==319" = icmp eq i64 %0, 18
  br i1 %"==319", label %true320, label %false355

true320:                                          ; preds = %false318
  %424 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %425 = extractvalue { i64, i1 } %424, 1
  %426 = extractvalue { i64, i1 } %424, 0
  br i1 %425, label %error321, label %noerror322

error321:                                         ; preds = %true320
  call void @overflow_fail(i64 2563)
  ret i64 0

noerror322:                                       ; preds = %true320
  %427 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %426)
  %428 = extractvalue { i64, i1 } %427, 1
  %429 = extractvalue { i64, i1 } %427, 0
  br i1 %428, label %error323, label %noerror324

error323:                                         ; preds = %noerror322
  call void @overflow_fail(i64 2558)
  ret i64 0

noerror324:                                       ; preds = %noerror322
  %430 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %429)
  %431 = extractvalue { i64, i1 } %430, 1
  %432 = extractvalue { i64, i1 } %430, 0
  br i1 %431, label %error325, label %noerror326

error325:                                         ; preds = %noerror324
  call void @overflow_fail(i64 2553)
  ret i64 0

noerror326:                                       ; preds = %noerror324
  %433 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %432)
  %434 = extractvalue { i64, i1 } %433, 1
  %435 = extractvalue { i64, i1 } %433, 0
  br i1 %434, label %error327, label %noerror328

error327:                                         ; preds = %noerror326
  call void @overflow_fail(i64 2548)
  ret i64 0

noerror328:                                       ; preds = %noerror326
  %436 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %435)
  %437 = extractvalue { i64, i1 } %436, 1
  %438 = extractvalue { i64, i1 } %436, 0
  br i1 %437, label %error329, label %noerror330

error329:                                         ; preds = %noerror328
  call void @overflow_fail(i64 2543)
  ret i64 0

noerror330:                                       ; preds = %noerror328
  %439 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %438)
  %440 = extractvalue { i64, i1 } %439, 1
  %441 = extractvalue { i64, i1 } %439, 0
  br i1 %440, label %error331, label %noerror332

error331:                                         ; preds = %noerror330
  call void @overflow_fail(i64 2538)
  ret i64 0

noerror332:                                       ; preds = %noerror330
  %442 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %441)
  %443 = extractvalue { i64, i1 } %442, 1
  %444 = extractvalue { i64, i1 } %442, 0
  br i1 %443, label %error333, label %noerror334

error333:                                         ; preds = %noerror332
  call void @overflow_fail(i64 2533)
  ret i64 0

noerror334:                                       ; preds = %noerror332
  %445 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %444)
  %446 = extractvalue { i64, i1 } %445, 1
  %447 = extractvalue { i64, i1 } %445, 0
  br i1 %446, label %error335, label %noerror336

error335:                                         ; preds = %noerror334
  call void @overflow_fail(i64 2528)
  ret i64 0

noerror336:                                       ; preds = %noerror334
  %448 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %447)
  %449 = extractvalue { i64, i1 } %448, 1
  %450 = extractvalue { i64, i1 } %448, 0
  br i1 %449, label %error337, label %noerror338

error337:                                         ; preds = %noerror336
  call void @overflow_fail(i64 2522)
  ret i64 0

noerror338:                                       ; preds = %noerror336
  %451 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %450)
  %452 = extractvalue { i64, i1 } %451, 1
  %453 = extractvalue { i64, i1 } %451, 0
  br i1 %452, label %error339, label %noerror340

error339:                                         ; preds = %noerror338
  call void @overflow_fail(i64 2516)
  ret i64 0

noerror340:                                       ; preds = %noerror338
  %454 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %453)
  %455 = extractvalue { i64, i1 } %454, 1
  %456 = extractvalue { i64, i1 } %454, 0
  br i1 %455, label %error341, label %noerror342

error341:                                         ; preds = %noerror340
  call void @overflow_fail(i64 2510)
  ret i64 0

noerror342:                                       ; preds = %noerror340
  %457 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %456)
  %458 = extractvalue { i64, i1 } %457, 1
  %459 = extractvalue { i64, i1 } %457, 0
  br i1 %458, label %error343, label %noerror344

error343:                                         ; preds = %noerror342
  call void @overflow_fail(i64 2504)
  ret i64 0

noerror344:                                       ; preds = %noerror342
  %460 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %459)
  %461 = extractvalue { i64, i1 } %460, 1
  %462 = extractvalue { i64, i1 } %460, 0
  br i1 %461, label %error345, label %noerror346

error345:                                         ; preds = %noerror344
  call void @overflow_fail(i64 2498)
  ret i64 0

noerror346:                                       ; preds = %noerror344
  %463 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %462)
  %464 = extractvalue { i64, i1 } %463, 1
  %465 = extractvalue { i64, i1 } %463, 0
  br i1 %464, label %error347, label %noerror348

error347:                                         ; preds = %noerror346
  call void @overflow_fail(i64 2492)
  ret i64 0

noerror348:                                       ; preds = %noerror346
  %466 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %465)
  %467 = extractvalue { i64, i1 } %466, 1
  %468 = extractvalue { i64, i1 } %466, 0
  br i1 %467, label %error349, label %noerror350

error349:                                         ; preds = %noerror348
  call void @overflow_fail(i64 2486)
  ret i64 0

noerror350:                                       ; preds = %noerror348
  %469 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %468)
  %470 = extractvalue { i64, i1 } %469, 1
  %471 = extractvalue { i64, i1 } %469, 0
  br i1 %470, label %error351, label %noerror352

error351:                                         ; preds = %noerror350
  call void @overflow_fail(i64 2480)
  ret i64 0

noerror352:                                       ; preds = %noerror350
  %472 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %471)
  %473 = extractvalue { i64, i1 } %472, 1
  %474 = extractvalue { i64, i1 } %472, 0
  br i1 %473, label %error353, label %noerror354

error353:                                         ; preds = %noerror352
  call void @overflow_fail(i64 2474)
  ret i64 0

noerror354:                                       ; preds = %noerror352
  br label %merge438

false355:                                         ; preds = %false318
  %"==356" = icmp eq i64 %0, 19
  br i1 %"==356", label %true357, label %false394

true357:                                          ; preds = %false355
  %475 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %476 = extractvalue { i64, i1 } %475, 1
  %477 = extractvalue { i64, i1 } %475, 0
  br i1 %476, label %error358, label %noerror359

error358:                                         ; preds = %true357
  call void @overflow_fail(i64 2845)
  ret i64 0

noerror359:                                       ; preds = %true357
  %478 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %477)
  %479 = extractvalue { i64, i1 } %478, 1
  %480 = extractvalue { i64, i1 } %478, 0
  br i1 %479, label %error360, label %noerror361

error360:                                         ; preds = %noerror359
  call void @overflow_fail(i64 2840)
  ret i64 0

noerror361:                                       ; preds = %noerror359
  %481 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %480)
  %482 = extractvalue { i64, i1 } %481, 1
  %483 = extractvalue { i64, i1 } %481, 0
  br i1 %482, label %error362, label %noerror363

error362:                                         ; preds = %noerror361
  call void @overflow_fail(i64 2835)
  ret i64 0

noerror363:                                       ; preds = %noerror361
  %484 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %483)
  %485 = extractvalue { i64, i1 } %484, 1
  %486 = extractvalue { i64, i1 } %484, 0
  br i1 %485, label %error364, label %noerror365

error364:                                         ; preds = %noerror363
  call void @overflow_fail(i64 2830)
  ret i64 0

noerror365:                                       ; preds = %noerror363
  %487 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %486)
  %488 = extractvalue { i64, i1 } %487, 1
  %489 = extractvalue { i64, i1 } %487, 0
  br i1 %488, label %error366, label %noerror367

error366:                                         ; preds = %noerror365
  call void @overflow_fail(i64 2825)
  ret i64 0

noerror367:                                       ; preds = %noerror365
  %490 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %489)
  %491 = extractvalue { i64, i1 } %490, 1
  %492 = extractvalue { i64, i1 } %490, 0
  br i1 %491, label %error368, label %noerror369

error368:                                         ; preds = %noerror367
  call void @overflow_fail(i64 2820)
  ret i64 0

noerror369:                                       ; preds = %noerror367
  %493 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %492)
  %494 = extractvalue { i64, i1 } %493, 1
  %495 = extractvalue { i64, i1 } %493, 0
  br i1 %494, label %error370, label %noerror371

error370:                                         ; preds = %noerror369
  call void @overflow_fail(i64 2815)
  ret i64 0

noerror371:                                       ; preds = %noerror369
  %496 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %495)
  %497 = extractvalue { i64, i1 } %496, 1
  %498 = extractvalue { i64, i1 } %496, 0
  br i1 %497, label %error372, label %noerror373

error372:                                         ; preds = %noerror371
  call void @overflow_fail(i64 2810)
  ret i64 0

noerror373:                                       ; preds = %noerror371
  %499 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %498)
  %500 = extractvalue { i64, i1 } %499, 1
  %501 = extractvalue { i64, i1 } %499, 0
  br i1 %500, label %error374, label %noerror375

error374:                                         ; preds = %noerror373
  call void @overflow_fail(i64 2804)
  ret i64 0

noerror375:                                       ; preds = %noerror373
  %502 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %501)
  %503 = extractvalue { i64, i1 } %502, 1
  %504 = extractvalue { i64, i1 } %502, 0
  br i1 %503, label %error376, label %noerror377

error376:                                         ; preds = %noerror375
  call void @overflow_fail(i64 2798)
  ret i64 0

noerror377:                                       ; preds = %noerror375
  %505 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %504)
  %506 = extractvalue { i64, i1 } %505, 1
  %507 = extractvalue { i64, i1 } %505, 0
  br i1 %506, label %error378, label %noerror379

error378:                                         ; preds = %noerror377
  call void @overflow_fail(i64 2792)
  ret i64 0

noerror379:                                       ; preds = %noerror377
  %508 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %507)
  %509 = extractvalue { i64, i1 } %508, 1
  %510 = extractvalue { i64, i1 } %508, 0
  br i1 %509, label %error380, label %noerror381

error380:                                         ; preds = %noerror379
  call void @overflow_fail(i64 2786)
  ret i64 0

noerror381:                                       ; preds = %noerror379
  %511 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %510)
  %512 = extractvalue { i64, i1 } %511, 1
  %513 = extractvalue { i64, i1 } %511, 0
  br i1 %512, label %error382, label %noerror383

error382:                                         ; preds = %noerror381
  call void @overflow_fail(i64 2780)
  ret i64 0

noerror383:                                       ; preds = %noerror381
  %514 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %513)
  %515 = extractvalue { i64, i1 } %514, 1
  %516 = extractvalue { i64, i1 } %514, 0
  br i1 %515, label %error384, label %noerror385

error384:                                         ; preds = %noerror383
  call void @overflow_fail(i64 2774)
  ret i64 0

noerror385:                                       ; preds = %noerror383
  %517 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %516)
  %518 = extractvalue { i64, i1 } %517, 1
  %519 = extractvalue { i64, i1 } %517, 0
  br i1 %518, label %error386, label %noerror387

error386:                                         ; preds = %noerror385
  call void @overflow_fail(i64 2768)
  ret i64 0

noerror387:                                       ; preds = %noerror385
  %520 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %519)
  %521 = extractvalue { i64, i1 } %520, 1
  %522 = extractvalue { i64, i1 } %520, 0
  br i1 %521, label %error388, label %noerror389

error388:                                         ; preds = %noerror387
  call void @overflow_fail(i64 2762)
  ret i64 0

noerror389:                                       ; preds = %noerror387
  %523 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %522)
  %524 = extractvalue { i64, i1 } %523, 1
  %525 = extractvalue { i64, i1 } %523, 0
  br i1 %524, label %error390, label %noerror391

error390:                                         ; preds = %noerror389
  call void @overflow_fail(i64 2756)
  ret i64 0

noerror391:                                       ; preds = %noerror389
  %526 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 19, i64 %525)
  %527 = extractvalue { i64, i1 } %526, 1
  %528 = extractvalue { i64, i1 } %526, 0
  br i1 %527, label %error392, label %noerror393

error392:                                         ; preds = %noerror391
  call void @overflow_fail(i64 2750)
  ret i64 0

noerror393:                                       ; preds = %noerror391
  br label %merge436

false394:                                         ; preds = %false355
  %"==395" = icmp eq i64 %0, 20
  br i1 %"==395", label %true396, label %false435

true396:                                          ; preds = %false394
  %529 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %530 = extractvalue { i64, i1 } %529, 1
  %531 = extractvalue { i64, i1 } %529, 0
  br i1 %530, label %error397, label %noerror398

error397:                                         ; preds = %true396
  call void @overflow_fail(i64 3142)
  ret i64 0

noerror398:                                       ; preds = %true396
  %532 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %531)
  %533 = extractvalue { i64, i1 } %532, 1
  %534 = extractvalue { i64, i1 } %532, 0
  br i1 %533, label %error399, label %noerror400

error399:                                         ; preds = %noerror398
  call void @overflow_fail(i64 3137)
  ret i64 0

noerror400:                                       ; preds = %noerror398
  %535 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %534)
  %536 = extractvalue { i64, i1 } %535, 1
  %537 = extractvalue { i64, i1 } %535, 0
  br i1 %536, label %error401, label %noerror402

error401:                                         ; preds = %noerror400
  call void @overflow_fail(i64 3132)
  ret i64 0

noerror402:                                       ; preds = %noerror400
  %538 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %537)
  %539 = extractvalue { i64, i1 } %538, 1
  %540 = extractvalue { i64, i1 } %538, 0
  br i1 %539, label %error403, label %noerror404

error403:                                         ; preds = %noerror402
  call void @overflow_fail(i64 3127)
  ret i64 0

noerror404:                                       ; preds = %noerror402
  %541 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %540)
  %542 = extractvalue { i64, i1 } %541, 1
  %543 = extractvalue { i64, i1 } %541, 0
  br i1 %542, label %error405, label %noerror406

error405:                                         ; preds = %noerror404
  call void @overflow_fail(i64 3122)
  ret i64 0

noerror406:                                       ; preds = %noerror404
  %544 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %543)
  %545 = extractvalue { i64, i1 } %544, 1
  %546 = extractvalue { i64, i1 } %544, 0
  br i1 %545, label %error407, label %noerror408

error407:                                         ; preds = %noerror406
  call void @overflow_fail(i64 3117)
  ret i64 0

noerror408:                                       ; preds = %noerror406
  %547 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %546)
  %548 = extractvalue { i64, i1 } %547, 1
  %549 = extractvalue { i64, i1 } %547, 0
  br i1 %548, label %error409, label %noerror410

error409:                                         ; preds = %noerror408
  call void @overflow_fail(i64 3112)
  ret i64 0

noerror410:                                       ; preds = %noerror408
  %550 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %549)
  %551 = extractvalue { i64, i1 } %550, 1
  %552 = extractvalue { i64, i1 } %550, 0
  br i1 %551, label %error411, label %noerror412

error411:                                         ; preds = %noerror410
  call void @overflow_fail(i64 3107)
  ret i64 0

noerror412:                                       ; preds = %noerror410
  %553 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %552)
  %554 = extractvalue { i64, i1 } %553, 1
  %555 = extractvalue { i64, i1 } %553, 0
  br i1 %554, label %error413, label %noerror414

error413:                                         ; preds = %noerror412
  call void @overflow_fail(i64 3101)
  ret i64 0

noerror414:                                       ; preds = %noerror412
  %556 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %555)
  %557 = extractvalue { i64, i1 } %556, 1
  %558 = extractvalue { i64, i1 } %556, 0
  br i1 %557, label %error415, label %noerror416

error415:                                         ; preds = %noerror414
  call void @overflow_fail(i64 3095)
  ret i64 0

noerror416:                                       ; preds = %noerror414
  %559 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %558)
  %560 = extractvalue { i64, i1 } %559, 1
  %561 = extractvalue { i64, i1 } %559, 0
  br i1 %560, label %error417, label %noerror418

error417:                                         ; preds = %noerror416
  call void @overflow_fail(i64 3089)
  ret i64 0

noerror418:                                       ; preds = %noerror416
  %562 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %561)
  %563 = extractvalue { i64, i1 } %562, 1
  %564 = extractvalue { i64, i1 } %562, 0
  br i1 %563, label %error419, label %noerror420

error419:                                         ; preds = %noerror418
  call void @overflow_fail(i64 3083)
  ret i64 0

noerror420:                                       ; preds = %noerror418
  %565 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %564)
  %566 = extractvalue { i64, i1 } %565, 1
  %567 = extractvalue { i64, i1 } %565, 0
  br i1 %566, label %error421, label %noerror422

error421:                                         ; preds = %noerror420
  call void @overflow_fail(i64 3077)
  ret i64 0

noerror422:                                       ; preds = %noerror420
  %568 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %567)
  %569 = extractvalue { i64, i1 } %568, 1
  %570 = extractvalue { i64, i1 } %568, 0
  br i1 %569, label %error423, label %noerror424

error423:                                         ; preds = %noerror422
  call void @overflow_fail(i64 3071)
  ret i64 0

noerror424:                                       ; preds = %noerror422
  %571 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %570)
  %572 = extractvalue { i64, i1 } %571, 1
  %573 = extractvalue { i64, i1 } %571, 0
  br i1 %572, label %error425, label %noerror426

error425:                                         ; preds = %noerror424
  call void @overflow_fail(i64 3065)
  ret i64 0

noerror426:                                       ; preds = %noerror424
  %574 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %573)
  %575 = extractvalue { i64, i1 } %574, 1
  %576 = extractvalue { i64, i1 } %574, 0
  br i1 %575, label %error427, label %noerror428

error427:                                         ; preds = %noerror426
  call void @overflow_fail(i64 3059)
  ret i64 0

noerror428:                                       ; preds = %noerror426
  %577 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %576)
  %578 = extractvalue { i64, i1 } %577, 1
  %579 = extractvalue { i64, i1 } %577, 0
  br i1 %578, label %error429, label %noerror430

error429:                                         ; preds = %noerror428
  call void @overflow_fail(i64 3053)
  ret i64 0

noerror430:                                       ; preds = %noerror428
  %580 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 19, i64 %579)
  %581 = extractvalue { i64, i1 } %580, 1
  %582 = extractvalue { i64, i1 } %580, 0
  br i1 %581, label %error431, label %noerror432

error431:                                         ; preds = %noerror430
  call void @overflow_fail(i64 3047)
  ret i64 0

noerror432:                                       ; preds = %noerror430
  %583 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 20, i64 %582)
  %584 = extractvalue { i64, i1 } %583, 1
  %585 = extractvalue { i64, i1 } %583, 0
  br i1 %584, label %error433, label %noerror434

error433:                                         ; preds = %noerror432
  call void @overflow_fail(i64 3041)
  ret i64 0

noerror434:                                       ; preds = %noerror432
  br label %merge

false435:                                         ; preds = %false394
  br label %merge

merge:                                            ; preds = %false435, %noerror434
  %ifret = phi i64 [ %585, %noerror434 ], [ -1, %false435 ]
  br label %merge436

merge436:                                         ; preds = %merge, %noerror393
  %ifret437 = phi i64 [ %528, %noerror393 ], [ %ifret, %merge ]
  br label %merge438

merge438:                                         ; preds = %merge436, %noerror354
  %ifret439 = phi i64 [ %474, %noerror354 ], [ %ifret437, %merge436 ]
  br label %merge440

merge440:                                         ; preds = %merge438, %noerror317
  %ifret441 = phi i64 [ %423, %noerror317 ], [ %ifret439, %merge438 ]
  br label %merge442

merge442:                                         ; preds = %merge440, %noerror282
  %ifret443 = phi i64 [ %375, %noerror282 ], [ %ifret441, %merge440 ]
  br label %merge444

merge444:                                         ; preds = %merge442, %noerror249
  %ifret445 = phi i64 [ %330, %noerror249 ], [ %ifret443, %merge442 ]
  br label %merge446

merge446:                                         ; preds = %merge444, %noerror218
  %ifret447 = phi i64 [ %288, %noerror218 ], [ %ifret445, %merge444 ]
  br label %merge448

merge448:                                         ; preds = %merge446, %noerror189
  %ifret449 = phi i64 [ %249, %noerror189 ], [ %ifret447, %merge446 ]
  br label %merge450

merge450:                                         ; preds = %merge448, %noerror162
  %ifret451 = phi i64 [ %213, %noerror162 ], [ %ifret449, %merge448 ]
  br label %merge452

merge452:                                         ; preds = %merge450, %noerror137
  %ifret453 = phi i64 [ %180, %noerror137 ], [ %ifret451, %merge450 ]
  br label %merge454

merge454:                                         ; preds = %merge452, %noerror114
  %ifret455 = phi i64 [ %150, %noerror114 ], [ %ifret453, %merge452 ]
  br label %merge456

merge456:                                         ; preds = %merge454, %noerror93
  %ifret457 = phi i64 [ %123, %noerror93 ], [ %ifret455, %merge454 ]
  br label %merge458

merge458:                                         ; preds = %merge456, %noerror74
  %ifret459 = phi i64 [ %99, %noerror74 ], [ %ifret457, %merge456 ]
  br label %merge460

merge460:                                         ; preds = %merge458, %noerror57
  %ifret461 = phi i64 [ %78, %noerror57 ], [ %ifret459, %merge458 ]
  br label %merge462

merge462:                                         ; preds = %merge460, %noerror42
  %ifret463 = phi i64 [ %60, %noerror42 ], [ %ifret461, %merge460 ]
  br label %merge464

merge464:                                         ; preds = %merge462, %noerror29
  %ifret465 = phi i64 [ %45, %noerror29 ], [ %ifret463, %merge462 ]
  br label %merge466

merge466:                                         ; preds = %merge464, %noerror18
  %ifret467 = phi i64 [ %33, %noerror18 ], [ %ifret465, %merge464 ]
  br label %merge468

merge468:                                         ; preds = %merge466, %noerror9
  %ifret469 = phi i64 [ %24, %noerror9 ], [ %ifret467, %merge466 ]
  br label %merge470

merge470:                                         ; preds = %merge468, %noerror
  %ifret471 = phi i64 [ %18, %noerror ], [ %ifret469, %merge468 ]
  br label %merge472

merge472:                                         ; preds = %merge470, %true
  %ifret473 = phi i64 [ 1, %true ], [ %ifret471, %merge470 ]
  ret i64 %ifret473
}
