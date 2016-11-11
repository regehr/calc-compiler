target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %Mutable0 = alloca i64
  store i64 0, i64* %Mutable0
  %Mutable1 = alloca i64
  store i64 0, i64* %Mutable1
  %Mutable2 = alloca i64
  store i64 0, i64* %Mutable2
  %Mutable3 = alloca i64
  store i64 0, i64* %Mutable3
  %Mutable4 = alloca i64
  store i64 0, i64* %Mutable4
  %Mutable5 = alloca i64
  store i64 0, i64* %Mutable5
  %Mutable6 = alloca i64
  store i64 0, i64* %Mutable6
  %Mutable7 = alloca i64
  store i64 0, i64* %Mutable7
  %Mutable8 = alloca i64
  store i64 0, i64* %Mutable8
  %Mutable9 = alloca i64
  store i64 0, i64* %Mutable9
  %eq = icmp eq i64 %0, 1
  br i1 %eq, label %then, label %else

then:                                             ; preds = %entry
  br label %merge663

else:                                             ; preds = %entry
  %eq1 = icmp eq i64 %0, 2
  br i1 %eq1, label %then2, label %else5

then2:                                            ; preds = %else
  %6 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %then3, label %else4

then3:                                            ; preds = %then2
  %calltrap = call i64 @overflow_fail(i64 83)
  br label %else4

else4:                                            ; preds = %then3, %then2
  br label %merge661

else5:                                            ; preds = %else
  %eq6 = icmp eq i64 %0, 3
  br i1 %eq6, label %then7, label %else14

then7:                                            ; preds = %else5
  %9 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %then8, label %else10

then8:                                            ; preds = %then7
  %calltrap9 = call i64 @overflow_fail(i64 130)
  br label %else10

else10:                                           ; preds = %then8, %then7
  %12 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %10)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  br i1 %14, label %then11, label %else13

then11:                                           ; preds = %else10
  %calltrap12 = call i64 @overflow_fail(i64 125)
  br label %else13

else13:                                           ; preds = %then11, %else10
  br label %merge659

else14:                                           ; preds = %else5
  %eq15 = icmp eq i64 %0, 4
  br i1 %eq15, label %then16, label %else26

then16:                                           ; preds = %else14
  %15 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %then17, label %else19

then17:                                           ; preds = %then16
  %calltrap18 = call i64 @overflow_fail(i64 191)
  br label %else19

else19:                                           ; preds = %then17, %then16
  %18 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %16)
  %19 = extractvalue { i64, i1 } %18, 0
  %20 = extractvalue { i64, i1 } %18, 1
  br i1 %20, label %then20, label %else22

then20:                                           ; preds = %else19
  %calltrap21 = call i64 @overflow_fail(i64 186)
  br label %else22

else22:                                           ; preds = %then20, %else19
  %21 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %19)
  %22 = extractvalue { i64, i1 } %21, 0
  %23 = extractvalue { i64, i1 } %21, 1
  br i1 %23, label %then23, label %else25

then23:                                           ; preds = %else22
  %calltrap24 = call i64 @overflow_fail(i64 181)
  br label %else25

else25:                                           ; preds = %then23, %else22
  br label %merge657

else26:                                           ; preds = %else14
  %eq27 = icmp eq i64 %0, 5
  br i1 %eq27, label %then28, label %else41

then28:                                           ; preds = %else26
  %24 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %25 = extractvalue { i64, i1 } %24, 0
  %26 = extractvalue { i64, i1 } %24, 1
  br i1 %26, label %then29, label %else31

then29:                                           ; preds = %then28
  %calltrap30 = call i64 @overflow_fail(i64 266)
  br label %else31

else31:                                           ; preds = %then29, %then28
  %27 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %25)
  %28 = extractvalue { i64, i1 } %27, 0
  %29 = extractvalue { i64, i1 } %27, 1
  br i1 %29, label %then32, label %else34

then32:                                           ; preds = %else31
  %calltrap33 = call i64 @overflow_fail(i64 261)
  br label %else34

else34:                                           ; preds = %then32, %else31
  %30 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %28)
  %31 = extractvalue { i64, i1 } %30, 0
  %32 = extractvalue { i64, i1 } %30, 1
  br i1 %32, label %then35, label %else37

then35:                                           ; preds = %else34
  %calltrap36 = call i64 @overflow_fail(i64 256)
  br label %else37

else37:                                           ; preds = %then35, %else34
  %33 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %31)
  %34 = extractvalue { i64, i1 } %33, 0
  %35 = extractvalue { i64, i1 } %33, 1
  br i1 %35, label %then38, label %else40

then38:                                           ; preds = %else37
  %calltrap39 = call i64 @overflow_fail(i64 251)
  br label %else40

else40:                                           ; preds = %then38, %else37
  br label %merge655

else41:                                           ; preds = %else26
  %eq42 = icmp eq i64 %0, 6
  br i1 %eq42, label %then43, label %else59

then43:                                           ; preds = %else41
  %36 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %37 = extractvalue { i64, i1 } %36, 0
  %38 = extractvalue { i64, i1 } %36, 1
  br i1 %38, label %then44, label %else46

then44:                                           ; preds = %then43
  %calltrap45 = call i64 @overflow_fail(i64 355)
  br label %else46

else46:                                           ; preds = %then44, %then43
  %39 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %37)
  %40 = extractvalue { i64, i1 } %39, 0
  %41 = extractvalue { i64, i1 } %39, 1
  br i1 %41, label %then47, label %else49

then47:                                           ; preds = %else46
  %calltrap48 = call i64 @overflow_fail(i64 350)
  br label %else49

else49:                                           ; preds = %then47, %else46
  %42 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %40)
  %43 = extractvalue { i64, i1 } %42, 0
  %44 = extractvalue { i64, i1 } %42, 1
  br i1 %44, label %then50, label %else52

then50:                                           ; preds = %else49
  %calltrap51 = call i64 @overflow_fail(i64 345)
  br label %else52

else52:                                           ; preds = %then50, %else49
  %45 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %43)
  %46 = extractvalue { i64, i1 } %45, 0
  %47 = extractvalue { i64, i1 } %45, 1
  br i1 %47, label %then53, label %else55

then53:                                           ; preds = %else52
  %calltrap54 = call i64 @overflow_fail(i64 340)
  br label %else55

else55:                                           ; preds = %then53, %else52
  %48 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %46)
  %49 = extractvalue { i64, i1 } %48, 0
  %50 = extractvalue { i64, i1 } %48, 1
  br i1 %50, label %then56, label %else58

then56:                                           ; preds = %else55
  %calltrap57 = call i64 @overflow_fail(i64 335)
  br label %else58

else58:                                           ; preds = %then56, %else55
  br label %merge653

else59:                                           ; preds = %else41
  %eq60 = icmp eq i64 %0, 7
  br i1 %eq60, label %then61, label %else80

then61:                                           ; preds = %else59
  %51 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %52 = extractvalue { i64, i1 } %51, 0
  %53 = extractvalue { i64, i1 } %51, 1
  br i1 %53, label %then62, label %else64

then62:                                           ; preds = %then61
  %calltrap63 = call i64 @overflow_fail(i64 458)
  br label %else64

else64:                                           ; preds = %then62, %then61
  %54 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %52)
  %55 = extractvalue { i64, i1 } %54, 0
  %56 = extractvalue { i64, i1 } %54, 1
  br i1 %56, label %then65, label %else67

then65:                                           ; preds = %else64
  %calltrap66 = call i64 @overflow_fail(i64 453)
  br label %else67

else67:                                           ; preds = %then65, %else64
  %57 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %55)
  %58 = extractvalue { i64, i1 } %57, 0
  %59 = extractvalue { i64, i1 } %57, 1
  br i1 %59, label %then68, label %else70

then68:                                           ; preds = %else67
  %calltrap69 = call i64 @overflow_fail(i64 448)
  br label %else70

else70:                                           ; preds = %then68, %else67
  %60 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %58)
  %61 = extractvalue { i64, i1 } %60, 0
  %62 = extractvalue { i64, i1 } %60, 1
  br i1 %62, label %then71, label %else73

then71:                                           ; preds = %else70
  %calltrap72 = call i64 @overflow_fail(i64 443)
  br label %else73

else73:                                           ; preds = %then71, %else70
  %63 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %61)
  %64 = extractvalue { i64, i1 } %63, 0
  %65 = extractvalue { i64, i1 } %63, 1
  br i1 %65, label %then74, label %else76

then74:                                           ; preds = %else73
  %calltrap75 = call i64 @overflow_fail(i64 438)
  br label %else76

else76:                                           ; preds = %then74, %else73
  %66 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %64)
  %67 = extractvalue { i64, i1 } %66, 0
  %68 = extractvalue { i64, i1 } %66, 1
  br i1 %68, label %then77, label %else79

then77:                                           ; preds = %else76
  %calltrap78 = call i64 @overflow_fail(i64 433)
  br label %else79

else79:                                           ; preds = %then77, %else76
  br label %merge651

else80:                                           ; preds = %else59
  %eq81 = icmp eq i64 %0, 8
  br i1 %eq81, label %then82, label %else104

then82:                                           ; preds = %else80
  %69 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %70 = extractvalue { i64, i1 } %69, 0
  %71 = extractvalue { i64, i1 } %69, 1
  br i1 %71, label %then83, label %else85

then83:                                           ; preds = %then82
  %calltrap84 = call i64 @overflow_fail(i64 575)
  br label %else85

else85:                                           ; preds = %then83, %then82
  %72 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %70)
  %73 = extractvalue { i64, i1 } %72, 0
  %74 = extractvalue { i64, i1 } %72, 1
  br i1 %74, label %then86, label %else88

then86:                                           ; preds = %else85
  %calltrap87 = call i64 @overflow_fail(i64 570)
  br label %else88

else88:                                           ; preds = %then86, %else85
  %75 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %73)
  %76 = extractvalue { i64, i1 } %75, 0
  %77 = extractvalue { i64, i1 } %75, 1
  br i1 %77, label %then89, label %else91

then89:                                           ; preds = %else88
  %calltrap90 = call i64 @overflow_fail(i64 565)
  br label %else91

else91:                                           ; preds = %then89, %else88
  %78 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %76)
  %79 = extractvalue { i64, i1 } %78, 0
  %80 = extractvalue { i64, i1 } %78, 1
  br i1 %80, label %then92, label %else94

then92:                                           ; preds = %else91
  %calltrap93 = call i64 @overflow_fail(i64 560)
  br label %else94

else94:                                           ; preds = %then92, %else91
  %81 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %79)
  %82 = extractvalue { i64, i1 } %81, 0
  %83 = extractvalue { i64, i1 } %81, 1
  br i1 %83, label %then95, label %else97

then95:                                           ; preds = %else94
  %calltrap96 = call i64 @overflow_fail(i64 555)
  br label %else97

else97:                                           ; preds = %then95, %else94
  %84 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %82)
  %85 = extractvalue { i64, i1 } %84, 0
  %86 = extractvalue { i64, i1 } %84, 1
  br i1 %86, label %then98, label %else100

then98:                                           ; preds = %else97
  %calltrap99 = call i64 @overflow_fail(i64 550)
  br label %else100

else100:                                          ; preds = %then98, %else97
  %87 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %85)
  %88 = extractvalue { i64, i1 } %87, 0
  %89 = extractvalue { i64, i1 } %87, 1
  br i1 %89, label %then101, label %else103

then101:                                          ; preds = %else100
  %calltrap102 = call i64 @overflow_fail(i64 545)
  br label %else103

else103:                                          ; preds = %then101, %else100
  br label %merge649

else104:                                          ; preds = %else80
  %eq105 = icmp eq i64 %0, 9
  br i1 %eq105, label %then106, label %else131

then106:                                          ; preds = %else104
  %90 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %91 = extractvalue { i64, i1 } %90, 0
  %92 = extractvalue { i64, i1 } %90, 1
  br i1 %92, label %then107, label %else109

then107:                                          ; preds = %then106
  %calltrap108 = call i64 @overflow_fail(i64 706)
  br label %else109

else109:                                          ; preds = %then107, %then106
  %93 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %91)
  %94 = extractvalue { i64, i1 } %93, 0
  %95 = extractvalue { i64, i1 } %93, 1
  br i1 %95, label %then110, label %else112

then110:                                          ; preds = %else109
  %calltrap111 = call i64 @overflow_fail(i64 701)
  br label %else112

else112:                                          ; preds = %then110, %else109
  %96 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %94)
  %97 = extractvalue { i64, i1 } %96, 0
  %98 = extractvalue { i64, i1 } %96, 1
  br i1 %98, label %then113, label %else115

then113:                                          ; preds = %else112
  %calltrap114 = call i64 @overflow_fail(i64 696)
  br label %else115

else115:                                          ; preds = %then113, %else112
  %99 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %97)
  %100 = extractvalue { i64, i1 } %99, 0
  %101 = extractvalue { i64, i1 } %99, 1
  br i1 %101, label %then116, label %else118

then116:                                          ; preds = %else115
  %calltrap117 = call i64 @overflow_fail(i64 691)
  br label %else118

else118:                                          ; preds = %then116, %else115
  %102 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %100)
  %103 = extractvalue { i64, i1 } %102, 0
  %104 = extractvalue { i64, i1 } %102, 1
  br i1 %104, label %then119, label %else121

then119:                                          ; preds = %else118
  %calltrap120 = call i64 @overflow_fail(i64 686)
  br label %else121

else121:                                          ; preds = %then119, %else118
  %105 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %103)
  %106 = extractvalue { i64, i1 } %105, 0
  %107 = extractvalue { i64, i1 } %105, 1
  br i1 %107, label %then122, label %else124

then122:                                          ; preds = %else121
  %calltrap123 = call i64 @overflow_fail(i64 681)
  br label %else124

else124:                                          ; preds = %then122, %else121
  %108 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %106)
  %109 = extractvalue { i64, i1 } %108, 0
  %110 = extractvalue { i64, i1 } %108, 1
  br i1 %110, label %then125, label %else127

then125:                                          ; preds = %else124
  %calltrap126 = call i64 @overflow_fail(i64 676)
  br label %else127

else127:                                          ; preds = %then125, %else124
  %111 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %109)
  %112 = extractvalue { i64, i1 } %111, 0
  %113 = extractvalue { i64, i1 } %111, 1
  br i1 %113, label %then128, label %else130

then128:                                          ; preds = %else127
  %calltrap129 = call i64 @overflow_fail(i64 671)
  br label %else130

else130:                                          ; preds = %then128, %else127
  br label %merge647

else131:                                          ; preds = %else104
  %eq132 = icmp eq i64 %0, 10
  br i1 %eq132, label %then133, label %else161

then133:                                          ; preds = %else131
  %114 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %115 = extractvalue { i64, i1 } %114, 0
  %116 = extractvalue { i64, i1 } %114, 1
  br i1 %116, label %then134, label %else136

then134:                                          ; preds = %then133
  %calltrap135 = call i64 @overflow_fail(i64 853)
  br label %else136

else136:                                          ; preds = %then134, %then133
  %117 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %115)
  %118 = extractvalue { i64, i1 } %117, 0
  %119 = extractvalue { i64, i1 } %117, 1
  br i1 %119, label %then137, label %else139

then137:                                          ; preds = %else136
  %calltrap138 = call i64 @overflow_fail(i64 848)
  br label %else139

else139:                                          ; preds = %then137, %else136
  %120 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %118)
  %121 = extractvalue { i64, i1 } %120, 0
  %122 = extractvalue { i64, i1 } %120, 1
  br i1 %122, label %then140, label %else142

then140:                                          ; preds = %else139
  %calltrap141 = call i64 @overflow_fail(i64 843)
  br label %else142

else142:                                          ; preds = %then140, %else139
  %123 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %121)
  %124 = extractvalue { i64, i1 } %123, 0
  %125 = extractvalue { i64, i1 } %123, 1
  br i1 %125, label %then143, label %else145

then143:                                          ; preds = %else142
  %calltrap144 = call i64 @overflow_fail(i64 838)
  br label %else145

else145:                                          ; preds = %then143, %else142
  %126 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %124)
  %127 = extractvalue { i64, i1 } %126, 0
  %128 = extractvalue { i64, i1 } %126, 1
  br i1 %128, label %then146, label %else148

then146:                                          ; preds = %else145
  %calltrap147 = call i64 @overflow_fail(i64 833)
  br label %else148

else148:                                          ; preds = %then146, %else145
  %129 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %127)
  %130 = extractvalue { i64, i1 } %129, 0
  %131 = extractvalue { i64, i1 } %129, 1
  br i1 %131, label %then149, label %else151

then149:                                          ; preds = %else148
  %calltrap150 = call i64 @overflow_fail(i64 828)
  br label %else151

else151:                                          ; preds = %then149, %else148
  %132 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %130)
  %133 = extractvalue { i64, i1 } %132, 0
  %134 = extractvalue { i64, i1 } %132, 1
  br i1 %134, label %then152, label %else154

then152:                                          ; preds = %else151
  %calltrap153 = call i64 @overflow_fail(i64 823)
  br label %else154

else154:                                          ; preds = %then152, %else151
  %135 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %133)
  %136 = extractvalue { i64, i1 } %135, 0
  %137 = extractvalue { i64, i1 } %135, 1
  br i1 %137, label %then155, label %else157

then155:                                          ; preds = %else154
  %calltrap156 = call i64 @overflow_fail(i64 818)
  br label %else157

else157:                                          ; preds = %then155, %else154
  %138 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %136)
  %139 = extractvalue { i64, i1 } %138, 0
  %140 = extractvalue { i64, i1 } %138, 1
  br i1 %140, label %then158, label %else160

then158:                                          ; preds = %else157
  %calltrap159 = call i64 @overflow_fail(i64 812)
  br label %else160

else160:                                          ; preds = %then158, %else157
  br label %merge645

else161:                                          ; preds = %else131
  %eq162 = icmp eq i64 %0, 11
  br i1 %eq162, label %then163, label %else194

then163:                                          ; preds = %else161
  %141 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %142 = extractvalue { i64, i1 } %141, 0
  %143 = extractvalue { i64, i1 } %141, 1
  br i1 %143, label %then164, label %else166

then164:                                          ; preds = %then163
  %calltrap165 = call i64 @overflow_fail(i64 1015)
  br label %else166

else166:                                          ; preds = %then164, %then163
  %144 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %142)
  %145 = extractvalue { i64, i1 } %144, 0
  %146 = extractvalue { i64, i1 } %144, 1
  br i1 %146, label %then167, label %else169

then167:                                          ; preds = %else166
  %calltrap168 = call i64 @overflow_fail(i64 1010)
  br label %else169

else169:                                          ; preds = %then167, %else166
  %147 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %145)
  %148 = extractvalue { i64, i1 } %147, 0
  %149 = extractvalue { i64, i1 } %147, 1
  br i1 %149, label %then170, label %else172

then170:                                          ; preds = %else169
  %calltrap171 = call i64 @overflow_fail(i64 1005)
  br label %else172

else172:                                          ; preds = %then170, %else169
  %150 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %148)
  %151 = extractvalue { i64, i1 } %150, 0
  %152 = extractvalue { i64, i1 } %150, 1
  br i1 %152, label %then173, label %else175

then173:                                          ; preds = %else172
  %calltrap174 = call i64 @overflow_fail(i64 1000)
  br label %else175

else175:                                          ; preds = %then173, %else172
  %153 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %151)
  %154 = extractvalue { i64, i1 } %153, 0
  %155 = extractvalue { i64, i1 } %153, 1
  br i1 %155, label %then176, label %else178

then176:                                          ; preds = %else175
  %calltrap177 = call i64 @overflow_fail(i64 995)
  br label %else178

else178:                                          ; preds = %then176, %else175
  %156 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %154)
  %157 = extractvalue { i64, i1 } %156, 0
  %158 = extractvalue { i64, i1 } %156, 1
  br i1 %158, label %then179, label %else181

then179:                                          ; preds = %else178
  %calltrap180 = call i64 @overflow_fail(i64 990)
  br label %else181

else181:                                          ; preds = %then179, %else178
  %159 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %157)
  %160 = extractvalue { i64, i1 } %159, 0
  %161 = extractvalue { i64, i1 } %159, 1
  br i1 %161, label %then182, label %else184

then182:                                          ; preds = %else181
  %calltrap183 = call i64 @overflow_fail(i64 985)
  br label %else184

else184:                                          ; preds = %then182, %else181
  %162 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %160)
  %163 = extractvalue { i64, i1 } %162, 0
  %164 = extractvalue { i64, i1 } %162, 1
  br i1 %164, label %then185, label %else187

then185:                                          ; preds = %else184
  %calltrap186 = call i64 @overflow_fail(i64 980)
  br label %else187

else187:                                          ; preds = %then185, %else184
  %165 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %163)
  %166 = extractvalue { i64, i1 } %165, 0
  %167 = extractvalue { i64, i1 } %165, 1
  br i1 %167, label %then188, label %else190

then188:                                          ; preds = %else187
  %calltrap189 = call i64 @overflow_fail(i64 974)
  br label %else190

else190:                                          ; preds = %then188, %else187
  %168 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %166)
  %169 = extractvalue { i64, i1 } %168, 0
  %170 = extractvalue { i64, i1 } %168, 1
  br i1 %170, label %then191, label %else193

then191:                                          ; preds = %else190
  %calltrap192 = call i64 @overflow_fail(i64 968)
  br label %else193

else193:                                          ; preds = %then191, %else190
  br label %merge643

else194:                                          ; preds = %else161
  %eq195 = icmp eq i64 %0, 12
  br i1 %eq195, label %then196, label %else230

then196:                                          ; preds = %else194
  %171 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %172 = extractvalue { i64, i1 } %171, 0
  %173 = extractvalue { i64, i1 } %171, 1
  br i1 %173, label %then197, label %else199

then197:                                          ; preds = %then196
  %calltrap198 = call i64 @overflow_fail(i64 1192)
  br label %else199

else199:                                          ; preds = %then197, %then196
  %174 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %172)
  %175 = extractvalue { i64, i1 } %174, 0
  %176 = extractvalue { i64, i1 } %174, 1
  br i1 %176, label %then200, label %else202

then200:                                          ; preds = %else199
  %calltrap201 = call i64 @overflow_fail(i64 1187)
  br label %else202

else202:                                          ; preds = %then200, %else199
  %177 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %175)
  %178 = extractvalue { i64, i1 } %177, 0
  %179 = extractvalue { i64, i1 } %177, 1
  br i1 %179, label %then203, label %else205

then203:                                          ; preds = %else202
  %calltrap204 = call i64 @overflow_fail(i64 1182)
  br label %else205

else205:                                          ; preds = %then203, %else202
  %180 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %178)
  %181 = extractvalue { i64, i1 } %180, 0
  %182 = extractvalue { i64, i1 } %180, 1
  br i1 %182, label %then206, label %else208

then206:                                          ; preds = %else205
  %calltrap207 = call i64 @overflow_fail(i64 1177)
  br label %else208

else208:                                          ; preds = %then206, %else205
  %183 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %181)
  %184 = extractvalue { i64, i1 } %183, 0
  %185 = extractvalue { i64, i1 } %183, 1
  br i1 %185, label %then209, label %else211

then209:                                          ; preds = %else208
  %calltrap210 = call i64 @overflow_fail(i64 1172)
  br label %else211

else211:                                          ; preds = %then209, %else208
  %186 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %184)
  %187 = extractvalue { i64, i1 } %186, 0
  %188 = extractvalue { i64, i1 } %186, 1
  br i1 %188, label %then212, label %else214

then212:                                          ; preds = %else211
  %calltrap213 = call i64 @overflow_fail(i64 1167)
  br label %else214

else214:                                          ; preds = %then212, %else211
  %189 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %187)
  %190 = extractvalue { i64, i1 } %189, 0
  %191 = extractvalue { i64, i1 } %189, 1
  br i1 %191, label %then215, label %else217

then215:                                          ; preds = %else214
  %calltrap216 = call i64 @overflow_fail(i64 1162)
  br label %else217

else217:                                          ; preds = %then215, %else214
  %192 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %190)
  %193 = extractvalue { i64, i1 } %192, 0
  %194 = extractvalue { i64, i1 } %192, 1
  br i1 %194, label %then218, label %else220

then218:                                          ; preds = %else217
  %calltrap219 = call i64 @overflow_fail(i64 1157)
  br label %else220

else220:                                          ; preds = %then218, %else217
  %195 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %193)
  %196 = extractvalue { i64, i1 } %195, 0
  %197 = extractvalue { i64, i1 } %195, 1
  br i1 %197, label %then221, label %else223

then221:                                          ; preds = %else220
  %calltrap222 = call i64 @overflow_fail(i64 1151)
  br label %else223

else223:                                          ; preds = %then221, %else220
  %198 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %196)
  %199 = extractvalue { i64, i1 } %198, 0
  %200 = extractvalue { i64, i1 } %198, 1
  br i1 %200, label %then224, label %else226

then224:                                          ; preds = %else223
  %calltrap225 = call i64 @overflow_fail(i64 1145)
  br label %else226

else226:                                          ; preds = %then224, %else223
  %201 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %199)
  %202 = extractvalue { i64, i1 } %201, 0
  %203 = extractvalue { i64, i1 } %201, 1
  br i1 %203, label %then227, label %else229

then227:                                          ; preds = %else226
  %calltrap228 = call i64 @overflow_fail(i64 1139)
  br label %else229

else229:                                          ; preds = %then227, %else226
  br label %merge641

else230:                                          ; preds = %else194
  %eq231 = icmp eq i64 %0, 13
  br i1 %eq231, label %then232, label %else269

then232:                                          ; preds = %else230
  %204 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %205 = extractvalue { i64, i1 } %204, 0
  %206 = extractvalue { i64, i1 } %204, 1
  br i1 %206, label %then233, label %else235

then233:                                          ; preds = %then232
  %calltrap234 = call i64 @overflow_fail(i64 1384)
  br label %else235

else235:                                          ; preds = %then233, %then232
  %207 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %205)
  %208 = extractvalue { i64, i1 } %207, 0
  %209 = extractvalue { i64, i1 } %207, 1
  br i1 %209, label %then236, label %else238

then236:                                          ; preds = %else235
  %calltrap237 = call i64 @overflow_fail(i64 1379)
  br label %else238

else238:                                          ; preds = %then236, %else235
  %210 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %208)
  %211 = extractvalue { i64, i1 } %210, 0
  %212 = extractvalue { i64, i1 } %210, 1
  br i1 %212, label %then239, label %else241

then239:                                          ; preds = %else238
  %calltrap240 = call i64 @overflow_fail(i64 1374)
  br label %else241

else241:                                          ; preds = %then239, %else238
  %213 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %211)
  %214 = extractvalue { i64, i1 } %213, 0
  %215 = extractvalue { i64, i1 } %213, 1
  br i1 %215, label %then242, label %else244

then242:                                          ; preds = %else241
  %calltrap243 = call i64 @overflow_fail(i64 1369)
  br label %else244

else244:                                          ; preds = %then242, %else241
  %216 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %214)
  %217 = extractvalue { i64, i1 } %216, 0
  %218 = extractvalue { i64, i1 } %216, 1
  br i1 %218, label %then245, label %else247

then245:                                          ; preds = %else244
  %calltrap246 = call i64 @overflow_fail(i64 1364)
  br label %else247

else247:                                          ; preds = %then245, %else244
  %219 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %217)
  %220 = extractvalue { i64, i1 } %219, 0
  %221 = extractvalue { i64, i1 } %219, 1
  br i1 %221, label %then248, label %else250

then248:                                          ; preds = %else247
  %calltrap249 = call i64 @overflow_fail(i64 1359)
  br label %else250

else250:                                          ; preds = %then248, %else247
  %222 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %220)
  %223 = extractvalue { i64, i1 } %222, 0
  %224 = extractvalue { i64, i1 } %222, 1
  br i1 %224, label %then251, label %else253

then251:                                          ; preds = %else250
  %calltrap252 = call i64 @overflow_fail(i64 1354)
  br label %else253

else253:                                          ; preds = %then251, %else250
  %225 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %223)
  %226 = extractvalue { i64, i1 } %225, 0
  %227 = extractvalue { i64, i1 } %225, 1
  br i1 %227, label %then254, label %else256

then254:                                          ; preds = %else253
  %calltrap255 = call i64 @overflow_fail(i64 1349)
  br label %else256

else256:                                          ; preds = %then254, %else253
  %228 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %226)
  %229 = extractvalue { i64, i1 } %228, 0
  %230 = extractvalue { i64, i1 } %228, 1
  br i1 %230, label %then257, label %else259

then257:                                          ; preds = %else256
  %calltrap258 = call i64 @overflow_fail(i64 1343)
  br label %else259

else259:                                          ; preds = %then257, %else256
  %231 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %229)
  %232 = extractvalue { i64, i1 } %231, 0
  %233 = extractvalue { i64, i1 } %231, 1
  br i1 %233, label %then260, label %else262

then260:                                          ; preds = %else259
  %calltrap261 = call i64 @overflow_fail(i64 1337)
  br label %else262

else262:                                          ; preds = %then260, %else259
  %234 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %232)
  %235 = extractvalue { i64, i1 } %234, 0
  %236 = extractvalue { i64, i1 } %234, 1
  br i1 %236, label %then263, label %else265

then263:                                          ; preds = %else262
  %calltrap264 = call i64 @overflow_fail(i64 1331)
  br label %else265

else265:                                          ; preds = %then263, %else262
  %237 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %235)
  %238 = extractvalue { i64, i1 } %237, 0
  %239 = extractvalue { i64, i1 } %237, 1
  br i1 %239, label %then266, label %else268

then266:                                          ; preds = %else265
  %calltrap267 = call i64 @overflow_fail(i64 1325)
  br label %else268

else268:                                          ; preds = %then266, %else265
  br label %merge639

else269:                                          ; preds = %else230
  %eq270 = icmp eq i64 %0, 14
  br i1 %eq270, label %then271, label %else311

then271:                                          ; preds = %else269
  %240 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %241 = extractvalue { i64, i1 } %240, 0
  %242 = extractvalue { i64, i1 } %240, 1
  br i1 %242, label %then272, label %else274

then272:                                          ; preds = %then271
  %calltrap273 = call i64 @overflow_fail(i64 1591)
  br label %else274

else274:                                          ; preds = %then272, %then271
  %243 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %241)
  %244 = extractvalue { i64, i1 } %243, 0
  %245 = extractvalue { i64, i1 } %243, 1
  br i1 %245, label %then275, label %else277

then275:                                          ; preds = %else274
  %calltrap276 = call i64 @overflow_fail(i64 1586)
  br label %else277

else277:                                          ; preds = %then275, %else274
  %246 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %244)
  %247 = extractvalue { i64, i1 } %246, 0
  %248 = extractvalue { i64, i1 } %246, 1
  br i1 %248, label %then278, label %else280

then278:                                          ; preds = %else277
  %calltrap279 = call i64 @overflow_fail(i64 1581)
  br label %else280

else280:                                          ; preds = %then278, %else277
  %249 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %247)
  %250 = extractvalue { i64, i1 } %249, 0
  %251 = extractvalue { i64, i1 } %249, 1
  br i1 %251, label %then281, label %else283

then281:                                          ; preds = %else280
  %calltrap282 = call i64 @overflow_fail(i64 1576)
  br label %else283

else283:                                          ; preds = %then281, %else280
  %252 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %250)
  %253 = extractvalue { i64, i1 } %252, 0
  %254 = extractvalue { i64, i1 } %252, 1
  br i1 %254, label %then284, label %else286

then284:                                          ; preds = %else283
  %calltrap285 = call i64 @overflow_fail(i64 1571)
  br label %else286

else286:                                          ; preds = %then284, %else283
  %255 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %253)
  %256 = extractvalue { i64, i1 } %255, 0
  %257 = extractvalue { i64, i1 } %255, 1
  br i1 %257, label %then287, label %else289

then287:                                          ; preds = %else286
  %calltrap288 = call i64 @overflow_fail(i64 1566)
  br label %else289

else289:                                          ; preds = %then287, %else286
  %258 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %256)
  %259 = extractvalue { i64, i1 } %258, 0
  %260 = extractvalue { i64, i1 } %258, 1
  br i1 %260, label %then290, label %else292

then290:                                          ; preds = %else289
  %calltrap291 = call i64 @overflow_fail(i64 1561)
  br label %else292

else292:                                          ; preds = %then290, %else289
  %261 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %259)
  %262 = extractvalue { i64, i1 } %261, 0
  %263 = extractvalue { i64, i1 } %261, 1
  br i1 %263, label %then293, label %else295

then293:                                          ; preds = %else292
  %calltrap294 = call i64 @overflow_fail(i64 1556)
  br label %else295

else295:                                          ; preds = %then293, %else292
  %264 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %262)
  %265 = extractvalue { i64, i1 } %264, 0
  %266 = extractvalue { i64, i1 } %264, 1
  br i1 %266, label %then296, label %else298

then296:                                          ; preds = %else295
  %calltrap297 = call i64 @overflow_fail(i64 1550)
  br label %else298

else298:                                          ; preds = %then296, %else295
  %267 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %265)
  %268 = extractvalue { i64, i1 } %267, 0
  %269 = extractvalue { i64, i1 } %267, 1
  br i1 %269, label %then299, label %else301

then299:                                          ; preds = %else298
  %calltrap300 = call i64 @overflow_fail(i64 1544)
  br label %else301

else301:                                          ; preds = %then299, %else298
  %270 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %268)
  %271 = extractvalue { i64, i1 } %270, 0
  %272 = extractvalue { i64, i1 } %270, 1
  br i1 %272, label %then302, label %else304

then302:                                          ; preds = %else301
  %calltrap303 = call i64 @overflow_fail(i64 1538)
  br label %else304

else304:                                          ; preds = %then302, %else301
  %273 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %271)
  %274 = extractvalue { i64, i1 } %273, 0
  %275 = extractvalue { i64, i1 } %273, 1
  br i1 %275, label %then305, label %else307

then305:                                          ; preds = %else304
  %calltrap306 = call i64 @overflow_fail(i64 1532)
  br label %else307

else307:                                          ; preds = %then305, %else304
  %276 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %274)
  %277 = extractvalue { i64, i1 } %276, 0
  %278 = extractvalue { i64, i1 } %276, 1
  br i1 %278, label %then308, label %else310

then308:                                          ; preds = %else307
  %calltrap309 = call i64 @overflow_fail(i64 1526)
  br label %else310

else310:                                          ; preds = %then308, %else307
  br label %merge637

else311:                                          ; preds = %else269
  %eq312 = icmp eq i64 %0, 15
  br i1 %eq312, label %then313, label %else356

then313:                                          ; preds = %else311
  %279 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %280 = extractvalue { i64, i1 } %279, 0
  %281 = extractvalue { i64, i1 } %279, 1
  br i1 %281, label %then314, label %else316

then314:                                          ; preds = %then313
  %calltrap315 = call i64 @overflow_fail(i64 1813)
  br label %else316

else316:                                          ; preds = %then314, %then313
  %282 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %280)
  %283 = extractvalue { i64, i1 } %282, 0
  %284 = extractvalue { i64, i1 } %282, 1
  br i1 %284, label %then317, label %else319

then317:                                          ; preds = %else316
  %calltrap318 = call i64 @overflow_fail(i64 1808)
  br label %else319

else319:                                          ; preds = %then317, %else316
  %285 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %283)
  %286 = extractvalue { i64, i1 } %285, 0
  %287 = extractvalue { i64, i1 } %285, 1
  br i1 %287, label %then320, label %else322

then320:                                          ; preds = %else319
  %calltrap321 = call i64 @overflow_fail(i64 1803)
  br label %else322

else322:                                          ; preds = %then320, %else319
  %288 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %286)
  %289 = extractvalue { i64, i1 } %288, 0
  %290 = extractvalue { i64, i1 } %288, 1
  br i1 %290, label %then323, label %else325

then323:                                          ; preds = %else322
  %calltrap324 = call i64 @overflow_fail(i64 1798)
  br label %else325

else325:                                          ; preds = %then323, %else322
  %291 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %289)
  %292 = extractvalue { i64, i1 } %291, 0
  %293 = extractvalue { i64, i1 } %291, 1
  br i1 %293, label %then326, label %else328

then326:                                          ; preds = %else325
  %calltrap327 = call i64 @overflow_fail(i64 1793)
  br label %else328

else328:                                          ; preds = %then326, %else325
  %294 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %292)
  %295 = extractvalue { i64, i1 } %294, 0
  %296 = extractvalue { i64, i1 } %294, 1
  br i1 %296, label %then329, label %else331

then329:                                          ; preds = %else328
  %calltrap330 = call i64 @overflow_fail(i64 1788)
  br label %else331

else331:                                          ; preds = %then329, %else328
  %297 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %295)
  %298 = extractvalue { i64, i1 } %297, 0
  %299 = extractvalue { i64, i1 } %297, 1
  br i1 %299, label %then332, label %else334

then332:                                          ; preds = %else331
  %calltrap333 = call i64 @overflow_fail(i64 1783)
  br label %else334

else334:                                          ; preds = %then332, %else331
  %300 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %298)
  %301 = extractvalue { i64, i1 } %300, 0
  %302 = extractvalue { i64, i1 } %300, 1
  br i1 %302, label %then335, label %else337

then335:                                          ; preds = %else334
  %calltrap336 = call i64 @overflow_fail(i64 1778)
  br label %else337

else337:                                          ; preds = %then335, %else334
  %303 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %301)
  %304 = extractvalue { i64, i1 } %303, 0
  %305 = extractvalue { i64, i1 } %303, 1
  br i1 %305, label %then338, label %else340

then338:                                          ; preds = %else337
  %calltrap339 = call i64 @overflow_fail(i64 1772)
  br label %else340

else340:                                          ; preds = %then338, %else337
  %306 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %304)
  %307 = extractvalue { i64, i1 } %306, 0
  %308 = extractvalue { i64, i1 } %306, 1
  br i1 %308, label %then341, label %else343

then341:                                          ; preds = %else340
  %calltrap342 = call i64 @overflow_fail(i64 1766)
  br label %else343

else343:                                          ; preds = %then341, %else340
  %309 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %307)
  %310 = extractvalue { i64, i1 } %309, 0
  %311 = extractvalue { i64, i1 } %309, 1
  br i1 %311, label %then344, label %else346

then344:                                          ; preds = %else343
  %calltrap345 = call i64 @overflow_fail(i64 1760)
  br label %else346

else346:                                          ; preds = %then344, %else343
  %312 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %310)
  %313 = extractvalue { i64, i1 } %312, 0
  %314 = extractvalue { i64, i1 } %312, 1
  br i1 %314, label %then347, label %else349

then347:                                          ; preds = %else346
  %calltrap348 = call i64 @overflow_fail(i64 1754)
  br label %else349

else349:                                          ; preds = %then347, %else346
  %315 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %313)
  %316 = extractvalue { i64, i1 } %315, 0
  %317 = extractvalue { i64, i1 } %315, 1
  br i1 %317, label %then350, label %else352

then350:                                          ; preds = %else349
  %calltrap351 = call i64 @overflow_fail(i64 1748)
  br label %else352

else352:                                          ; preds = %then350, %else349
  %318 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %316)
  %319 = extractvalue { i64, i1 } %318, 0
  %320 = extractvalue { i64, i1 } %318, 1
  br i1 %320, label %then353, label %else355

then353:                                          ; preds = %else352
  %calltrap354 = call i64 @overflow_fail(i64 1742)
  br label %else355

else355:                                          ; preds = %then353, %else352
  br label %merge635

else356:                                          ; preds = %else311
  %eq357 = icmp eq i64 %0, 16
  br i1 %eq357, label %then358, label %else404

then358:                                          ; preds = %else356
  %321 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %322 = extractvalue { i64, i1 } %321, 0
  %323 = extractvalue { i64, i1 } %321, 1
  br i1 %323, label %then359, label %else361

then359:                                          ; preds = %then358
  %calltrap360 = call i64 @overflow_fail(i64 2050)
  br label %else361

else361:                                          ; preds = %then359, %then358
  %324 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %322)
  %325 = extractvalue { i64, i1 } %324, 0
  %326 = extractvalue { i64, i1 } %324, 1
  br i1 %326, label %then362, label %else364

then362:                                          ; preds = %else361
  %calltrap363 = call i64 @overflow_fail(i64 2045)
  br label %else364

else364:                                          ; preds = %then362, %else361
  %327 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %325)
  %328 = extractvalue { i64, i1 } %327, 0
  %329 = extractvalue { i64, i1 } %327, 1
  br i1 %329, label %then365, label %else367

then365:                                          ; preds = %else364
  %calltrap366 = call i64 @overflow_fail(i64 2040)
  br label %else367

else367:                                          ; preds = %then365, %else364
  %330 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %328)
  %331 = extractvalue { i64, i1 } %330, 0
  %332 = extractvalue { i64, i1 } %330, 1
  br i1 %332, label %then368, label %else370

then368:                                          ; preds = %else367
  %calltrap369 = call i64 @overflow_fail(i64 2035)
  br label %else370

else370:                                          ; preds = %then368, %else367
  %333 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %331)
  %334 = extractvalue { i64, i1 } %333, 0
  %335 = extractvalue { i64, i1 } %333, 1
  br i1 %335, label %then371, label %else373

then371:                                          ; preds = %else370
  %calltrap372 = call i64 @overflow_fail(i64 2030)
  br label %else373

else373:                                          ; preds = %then371, %else370
  %336 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %334)
  %337 = extractvalue { i64, i1 } %336, 0
  %338 = extractvalue { i64, i1 } %336, 1
  br i1 %338, label %then374, label %else376

then374:                                          ; preds = %else373
  %calltrap375 = call i64 @overflow_fail(i64 2025)
  br label %else376

else376:                                          ; preds = %then374, %else373
  %339 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %337)
  %340 = extractvalue { i64, i1 } %339, 0
  %341 = extractvalue { i64, i1 } %339, 1
  br i1 %341, label %then377, label %else379

then377:                                          ; preds = %else376
  %calltrap378 = call i64 @overflow_fail(i64 2020)
  br label %else379

else379:                                          ; preds = %then377, %else376
  %342 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %340)
  %343 = extractvalue { i64, i1 } %342, 0
  %344 = extractvalue { i64, i1 } %342, 1
  br i1 %344, label %then380, label %else382

then380:                                          ; preds = %else379
  %calltrap381 = call i64 @overflow_fail(i64 2015)
  br label %else382

else382:                                          ; preds = %then380, %else379
  %345 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %343)
  %346 = extractvalue { i64, i1 } %345, 0
  %347 = extractvalue { i64, i1 } %345, 1
  br i1 %347, label %then383, label %else385

then383:                                          ; preds = %else382
  %calltrap384 = call i64 @overflow_fail(i64 2009)
  br label %else385

else385:                                          ; preds = %then383, %else382
  %348 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %346)
  %349 = extractvalue { i64, i1 } %348, 0
  %350 = extractvalue { i64, i1 } %348, 1
  br i1 %350, label %then386, label %else388

then386:                                          ; preds = %else385
  %calltrap387 = call i64 @overflow_fail(i64 2003)
  br label %else388

else388:                                          ; preds = %then386, %else385
  %351 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %349)
  %352 = extractvalue { i64, i1 } %351, 0
  %353 = extractvalue { i64, i1 } %351, 1
  br i1 %353, label %then389, label %else391

then389:                                          ; preds = %else388
  %calltrap390 = call i64 @overflow_fail(i64 1997)
  br label %else391

else391:                                          ; preds = %then389, %else388
  %354 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %352)
  %355 = extractvalue { i64, i1 } %354, 0
  %356 = extractvalue { i64, i1 } %354, 1
  br i1 %356, label %then392, label %else394

then392:                                          ; preds = %else391
  %calltrap393 = call i64 @overflow_fail(i64 1991)
  br label %else394

else394:                                          ; preds = %then392, %else391
  %357 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %355)
  %358 = extractvalue { i64, i1 } %357, 0
  %359 = extractvalue { i64, i1 } %357, 1
  br i1 %359, label %then395, label %else397

then395:                                          ; preds = %else394
  %calltrap396 = call i64 @overflow_fail(i64 1985)
  br label %else397

else397:                                          ; preds = %then395, %else394
  %360 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %358)
  %361 = extractvalue { i64, i1 } %360, 0
  %362 = extractvalue { i64, i1 } %360, 1
  br i1 %362, label %then398, label %else400

then398:                                          ; preds = %else397
  %calltrap399 = call i64 @overflow_fail(i64 1979)
  br label %else400

else400:                                          ; preds = %then398, %else397
  %363 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %361)
  %364 = extractvalue { i64, i1 } %363, 0
  %365 = extractvalue { i64, i1 } %363, 1
  br i1 %365, label %then401, label %else403

then401:                                          ; preds = %else400
  %calltrap402 = call i64 @overflow_fail(i64 1973)
  br label %else403

else403:                                          ; preds = %then401, %else400
  br label %merge633

else404:                                          ; preds = %else356
  %eq405 = icmp eq i64 %0, 17
  br i1 %eq405, label %then406, label %else455

then406:                                          ; preds = %else404
  %366 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %367 = extractvalue { i64, i1 } %366, 0
  %368 = extractvalue { i64, i1 } %366, 1
  br i1 %368, label %then407, label %else409

then407:                                          ; preds = %then406
  %calltrap408 = call i64 @overflow_fail(i64 2302)
  br label %else409

else409:                                          ; preds = %then407, %then406
  %369 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %367)
  %370 = extractvalue { i64, i1 } %369, 0
  %371 = extractvalue { i64, i1 } %369, 1
  br i1 %371, label %then410, label %else412

then410:                                          ; preds = %else409
  %calltrap411 = call i64 @overflow_fail(i64 2297)
  br label %else412

else412:                                          ; preds = %then410, %else409
  %372 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %370)
  %373 = extractvalue { i64, i1 } %372, 0
  %374 = extractvalue { i64, i1 } %372, 1
  br i1 %374, label %then413, label %else415

then413:                                          ; preds = %else412
  %calltrap414 = call i64 @overflow_fail(i64 2292)
  br label %else415

else415:                                          ; preds = %then413, %else412
  %375 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %373)
  %376 = extractvalue { i64, i1 } %375, 0
  %377 = extractvalue { i64, i1 } %375, 1
  br i1 %377, label %then416, label %else418

then416:                                          ; preds = %else415
  %calltrap417 = call i64 @overflow_fail(i64 2287)
  br label %else418

else418:                                          ; preds = %then416, %else415
  %378 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %376)
  %379 = extractvalue { i64, i1 } %378, 0
  %380 = extractvalue { i64, i1 } %378, 1
  br i1 %380, label %then419, label %else421

then419:                                          ; preds = %else418
  %calltrap420 = call i64 @overflow_fail(i64 2282)
  br label %else421

else421:                                          ; preds = %then419, %else418
  %381 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %379)
  %382 = extractvalue { i64, i1 } %381, 0
  %383 = extractvalue { i64, i1 } %381, 1
  br i1 %383, label %then422, label %else424

then422:                                          ; preds = %else421
  %calltrap423 = call i64 @overflow_fail(i64 2277)
  br label %else424

else424:                                          ; preds = %then422, %else421
  %384 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %382)
  %385 = extractvalue { i64, i1 } %384, 0
  %386 = extractvalue { i64, i1 } %384, 1
  br i1 %386, label %then425, label %else427

then425:                                          ; preds = %else424
  %calltrap426 = call i64 @overflow_fail(i64 2272)
  br label %else427

else427:                                          ; preds = %then425, %else424
  %387 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %385)
  %388 = extractvalue { i64, i1 } %387, 0
  %389 = extractvalue { i64, i1 } %387, 1
  br i1 %389, label %then428, label %else430

then428:                                          ; preds = %else427
  %calltrap429 = call i64 @overflow_fail(i64 2267)
  br label %else430

else430:                                          ; preds = %then428, %else427
  %390 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %388)
  %391 = extractvalue { i64, i1 } %390, 0
  %392 = extractvalue { i64, i1 } %390, 1
  br i1 %392, label %then431, label %else433

then431:                                          ; preds = %else430
  %calltrap432 = call i64 @overflow_fail(i64 2261)
  br label %else433

else433:                                          ; preds = %then431, %else430
  %393 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %391)
  %394 = extractvalue { i64, i1 } %393, 0
  %395 = extractvalue { i64, i1 } %393, 1
  br i1 %395, label %then434, label %else436

then434:                                          ; preds = %else433
  %calltrap435 = call i64 @overflow_fail(i64 2255)
  br label %else436

else436:                                          ; preds = %then434, %else433
  %396 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %394)
  %397 = extractvalue { i64, i1 } %396, 0
  %398 = extractvalue { i64, i1 } %396, 1
  br i1 %398, label %then437, label %else439

then437:                                          ; preds = %else436
  %calltrap438 = call i64 @overflow_fail(i64 2249)
  br label %else439

else439:                                          ; preds = %then437, %else436
  %399 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %397)
  %400 = extractvalue { i64, i1 } %399, 0
  %401 = extractvalue { i64, i1 } %399, 1
  br i1 %401, label %then440, label %else442

then440:                                          ; preds = %else439
  %calltrap441 = call i64 @overflow_fail(i64 2243)
  br label %else442

else442:                                          ; preds = %then440, %else439
  %402 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %400)
  %403 = extractvalue { i64, i1 } %402, 0
  %404 = extractvalue { i64, i1 } %402, 1
  br i1 %404, label %then443, label %else445

then443:                                          ; preds = %else442
  %calltrap444 = call i64 @overflow_fail(i64 2237)
  br label %else445

else445:                                          ; preds = %then443, %else442
  %405 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %403)
  %406 = extractvalue { i64, i1 } %405, 0
  %407 = extractvalue { i64, i1 } %405, 1
  br i1 %407, label %then446, label %else448

then446:                                          ; preds = %else445
  %calltrap447 = call i64 @overflow_fail(i64 2231)
  br label %else448

else448:                                          ; preds = %then446, %else445
  %408 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %406)
  %409 = extractvalue { i64, i1 } %408, 0
  %410 = extractvalue { i64, i1 } %408, 1
  br i1 %410, label %then449, label %else451

then449:                                          ; preds = %else448
  %calltrap450 = call i64 @overflow_fail(i64 2225)
  br label %else451

else451:                                          ; preds = %then449, %else448
  %411 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %409)
  %412 = extractvalue { i64, i1 } %411, 0
  %413 = extractvalue { i64, i1 } %411, 1
  br i1 %413, label %then452, label %else454

then452:                                          ; preds = %else451
  %calltrap453 = call i64 @overflow_fail(i64 2219)
  br label %else454

else454:                                          ; preds = %then452, %else451
  br label %merge631

else455:                                          ; preds = %else404
  %eq456 = icmp eq i64 %0, 18
  br i1 %eq456, label %then457, label %else509

then457:                                          ; preds = %else455
  %414 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %415 = extractvalue { i64, i1 } %414, 0
  %416 = extractvalue { i64, i1 } %414, 1
  br i1 %416, label %then458, label %else460

then458:                                          ; preds = %then457
  %calltrap459 = call i64 @overflow_fail(i64 2569)
  br label %else460

else460:                                          ; preds = %then458, %then457
  %417 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %415)
  %418 = extractvalue { i64, i1 } %417, 0
  %419 = extractvalue { i64, i1 } %417, 1
  br i1 %419, label %then461, label %else463

then461:                                          ; preds = %else460
  %calltrap462 = call i64 @overflow_fail(i64 2564)
  br label %else463

else463:                                          ; preds = %then461, %else460
  %420 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %418)
  %421 = extractvalue { i64, i1 } %420, 0
  %422 = extractvalue { i64, i1 } %420, 1
  br i1 %422, label %then464, label %else466

then464:                                          ; preds = %else463
  %calltrap465 = call i64 @overflow_fail(i64 2559)
  br label %else466

else466:                                          ; preds = %then464, %else463
  %423 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %421)
  %424 = extractvalue { i64, i1 } %423, 0
  %425 = extractvalue { i64, i1 } %423, 1
  br i1 %425, label %then467, label %else469

then467:                                          ; preds = %else466
  %calltrap468 = call i64 @overflow_fail(i64 2554)
  br label %else469

else469:                                          ; preds = %then467, %else466
  %426 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %424)
  %427 = extractvalue { i64, i1 } %426, 0
  %428 = extractvalue { i64, i1 } %426, 1
  br i1 %428, label %then470, label %else472

then470:                                          ; preds = %else469
  %calltrap471 = call i64 @overflow_fail(i64 2549)
  br label %else472

else472:                                          ; preds = %then470, %else469
  %429 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %427)
  %430 = extractvalue { i64, i1 } %429, 0
  %431 = extractvalue { i64, i1 } %429, 1
  br i1 %431, label %then473, label %else475

then473:                                          ; preds = %else472
  %calltrap474 = call i64 @overflow_fail(i64 2544)
  br label %else475

else475:                                          ; preds = %then473, %else472
  %432 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %430)
  %433 = extractvalue { i64, i1 } %432, 0
  %434 = extractvalue { i64, i1 } %432, 1
  br i1 %434, label %then476, label %else478

then476:                                          ; preds = %else475
  %calltrap477 = call i64 @overflow_fail(i64 2539)
  br label %else478

else478:                                          ; preds = %then476, %else475
  %435 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %433)
  %436 = extractvalue { i64, i1 } %435, 0
  %437 = extractvalue { i64, i1 } %435, 1
  br i1 %437, label %then479, label %else481

then479:                                          ; preds = %else478
  %calltrap480 = call i64 @overflow_fail(i64 2534)
  br label %else481

else481:                                          ; preds = %then479, %else478
  %438 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %436)
  %439 = extractvalue { i64, i1 } %438, 0
  %440 = extractvalue { i64, i1 } %438, 1
  br i1 %440, label %then482, label %else484

then482:                                          ; preds = %else481
  %calltrap483 = call i64 @overflow_fail(i64 2528)
  br label %else484

else484:                                          ; preds = %then482, %else481
  %441 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %439)
  %442 = extractvalue { i64, i1 } %441, 0
  %443 = extractvalue { i64, i1 } %441, 1
  br i1 %443, label %then485, label %else487

then485:                                          ; preds = %else484
  %calltrap486 = call i64 @overflow_fail(i64 2522)
  br label %else487

else487:                                          ; preds = %then485, %else484
  %444 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %442)
  %445 = extractvalue { i64, i1 } %444, 0
  %446 = extractvalue { i64, i1 } %444, 1
  br i1 %446, label %then488, label %else490

then488:                                          ; preds = %else487
  %calltrap489 = call i64 @overflow_fail(i64 2516)
  br label %else490

else490:                                          ; preds = %then488, %else487
  %447 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %445)
  %448 = extractvalue { i64, i1 } %447, 0
  %449 = extractvalue { i64, i1 } %447, 1
  br i1 %449, label %then491, label %else493

then491:                                          ; preds = %else490
  %calltrap492 = call i64 @overflow_fail(i64 2510)
  br label %else493

else493:                                          ; preds = %then491, %else490
  %450 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %448)
  %451 = extractvalue { i64, i1 } %450, 0
  %452 = extractvalue { i64, i1 } %450, 1
  br i1 %452, label %then494, label %else496

then494:                                          ; preds = %else493
  %calltrap495 = call i64 @overflow_fail(i64 2504)
  br label %else496

else496:                                          ; preds = %then494, %else493
  %453 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %451)
  %454 = extractvalue { i64, i1 } %453, 0
  %455 = extractvalue { i64, i1 } %453, 1
  br i1 %455, label %then497, label %else499

then497:                                          ; preds = %else496
  %calltrap498 = call i64 @overflow_fail(i64 2498)
  br label %else499

else499:                                          ; preds = %then497, %else496
  %456 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %454)
  %457 = extractvalue { i64, i1 } %456, 0
  %458 = extractvalue { i64, i1 } %456, 1
  br i1 %458, label %then500, label %else502

then500:                                          ; preds = %else499
  %calltrap501 = call i64 @overflow_fail(i64 2492)
  br label %else502

else502:                                          ; preds = %then500, %else499
  %459 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %457)
  %460 = extractvalue { i64, i1 } %459, 0
  %461 = extractvalue { i64, i1 } %459, 1
  br i1 %461, label %then503, label %else505

then503:                                          ; preds = %else502
  %calltrap504 = call i64 @overflow_fail(i64 2486)
  br label %else505

else505:                                          ; preds = %then503, %else502
  %462 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %460)
  %463 = extractvalue { i64, i1 } %462, 0
  %464 = extractvalue { i64, i1 } %462, 1
  br i1 %464, label %then506, label %else508

then506:                                          ; preds = %else505
  %calltrap507 = call i64 @overflow_fail(i64 2480)
  br label %else508

else508:                                          ; preds = %then506, %else505
  br label %merge629

else509:                                          ; preds = %else455
  %eq510 = icmp eq i64 %0, 19
  br i1 %eq510, label %then511, label %else566

then511:                                          ; preds = %else509
  %465 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %466 = extractvalue { i64, i1 } %465, 0
  %467 = extractvalue { i64, i1 } %465, 1
  br i1 %467, label %then512, label %else514

then512:                                          ; preds = %then511
  %calltrap513 = call i64 @overflow_fail(i64 2851)
  br label %else514

else514:                                          ; preds = %then512, %then511
  %468 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %466)
  %469 = extractvalue { i64, i1 } %468, 0
  %470 = extractvalue { i64, i1 } %468, 1
  br i1 %470, label %then515, label %else517

then515:                                          ; preds = %else514
  %calltrap516 = call i64 @overflow_fail(i64 2846)
  br label %else517

else517:                                          ; preds = %then515, %else514
  %471 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %469)
  %472 = extractvalue { i64, i1 } %471, 0
  %473 = extractvalue { i64, i1 } %471, 1
  br i1 %473, label %then518, label %else520

then518:                                          ; preds = %else517
  %calltrap519 = call i64 @overflow_fail(i64 2841)
  br label %else520

else520:                                          ; preds = %then518, %else517
  %474 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %472)
  %475 = extractvalue { i64, i1 } %474, 0
  %476 = extractvalue { i64, i1 } %474, 1
  br i1 %476, label %then521, label %else523

then521:                                          ; preds = %else520
  %calltrap522 = call i64 @overflow_fail(i64 2836)
  br label %else523

else523:                                          ; preds = %then521, %else520
  %477 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %475)
  %478 = extractvalue { i64, i1 } %477, 0
  %479 = extractvalue { i64, i1 } %477, 1
  br i1 %479, label %then524, label %else526

then524:                                          ; preds = %else523
  %calltrap525 = call i64 @overflow_fail(i64 2831)
  br label %else526

else526:                                          ; preds = %then524, %else523
  %480 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %478)
  %481 = extractvalue { i64, i1 } %480, 0
  %482 = extractvalue { i64, i1 } %480, 1
  br i1 %482, label %then527, label %else529

then527:                                          ; preds = %else526
  %calltrap528 = call i64 @overflow_fail(i64 2826)
  br label %else529

else529:                                          ; preds = %then527, %else526
  %483 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %481)
  %484 = extractvalue { i64, i1 } %483, 0
  %485 = extractvalue { i64, i1 } %483, 1
  br i1 %485, label %then530, label %else532

then530:                                          ; preds = %else529
  %calltrap531 = call i64 @overflow_fail(i64 2821)
  br label %else532

else532:                                          ; preds = %then530, %else529
  %486 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %484)
  %487 = extractvalue { i64, i1 } %486, 0
  %488 = extractvalue { i64, i1 } %486, 1
  br i1 %488, label %then533, label %else535

then533:                                          ; preds = %else532
  %calltrap534 = call i64 @overflow_fail(i64 2816)
  br label %else535

else535:                                          ; preds = %then533, %else532
  %489 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %487)
  %490 = extractvalue { i64, i1 } %489, 0
  %491 = extractvalue { i64, i1 } %489, 1
  br i1 %491, label %then536, label %else538

then536:                                          ; preds = %else535
  %calltrap537 = call i64 @overflow_fail(i64 2810)
  br label %else538

else538:                                          ; preds = %then536, %else535
  %492 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %490)
  %493 = extractvalue { i64, i1 } %492, 0
  %494 = extractvalue { i64, i1 } %492, 1
  br i1 %494, label %then539, label %else541

then539:                                          ; preds = %else538
  %calltrap540 = call i64 @overflow_fail(i64 2804)
  br label %else541

else541:                                          ; preds = %then539, %else538
  %495 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %493)
  %496 = extractvalue { i64, i1 } %495, 0
  %497 = extractvalue { i64, i1 } %495, 1
  br i1 %497, label %then542, label %else544

then542:                                          ; preds = %else541
  %calltrap543 = call i64 @overflow_fail(i64 2798)
  br label %else544

else544:                                          ; preds = %then542, %else541
  %498 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %496)
  %499 = extractvalue { i64, i1 } %498, 0
  %500 = extractvalue { i64, i1 } %498, 1
  br i1 %500, label %then545, label %else547

then545:                                          ; preds = %else544
  %calltrap546 = call i64 @overflow_fail(i64 2792)
  br label %else547

else547:                                          ; preds = %then545, %else544
  %501 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %499)
  %502 = extractvalue { i64, i1 } %501, 0
  %503 = extractvalue { i64, i1 } %501, 1
  br i1 %503, label %then548, label %else550

then548:                                          ; preds = %else547
  %calltrap549 = call i64 @overflow_fail(i64 2786)
  br label %else550

else550:                                          ; preds = %then548, %else547
  %504 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %502)
  %505 = extractvalue { i64, i1 } %504, 0
  %506 = extractvalue { i64, i1 } %504, 1
  br i1 %506, label %then551, label %else553

then551:                                          ; preds = %else550
  %calltrap552 = call i64 @overflow_fail(i64 2780)
  br label %else553

else553:                                          ; preds = %then551, %else550
  %507 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %505)
  %508 = extractvalue { i64, i1 } %507, 0
  %509 = extractvalue { i64, i1 } %507, 1
  br i1 %509, label %then554, label %else556

then554:                                          ; preds = %else553
  %calltrap555 = call i64 @overflow_fail(i64 2774)
  br label %else556

else556:                                          ; preds = %then554, %else553
  %510 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %508)
  %511 = extractvalue { i64, i1 } %510, 0
  %512 = extractvalue { i64, i1 } %510, 1
  br i1 %512, label %then557, label %else559

then557:                                          ; preds = %else556
  %calltrap558 = call i64 @overflow_fail(i64 2768)
  br label %else559

else559:                                          ; preds = %then557, %else556
  %513 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %511)
  %514 = extractvalue { i64, i1 } %513, 0
  %515 = extractvalue { i64, i1 } %513, 1
  br i1 %515, label %then560, label %else562

then560:                                          ; preds = %else559
  %calltrap561 = call i64 @overflow_fail(i64 2762)
  br label %else562

else562:                                          ; preds = %then560, %else559
  %516 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 19, i64 %514)
  %517 = extractvalue { i64, i1 } %516, 0
  %518 = extractvalue { i64, i1 } %516, 1
  br i1 %518, label %then563, label %else565

then563:                                          ; preds = %else562
  %calltrap564 = call i64 @overflow_fail(i64 2756)
  br label %else565

else565:                                          ; preds = %then563, %else562
  br label %merge627

else566:                                          ; preds = %else509
  %eq567 = icmp eq i64 %0, 20
  br i1 %eq567, label %then568, label %else626

then568:                                          ; preds = %else566
  %519 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %520 = extractvalue { i64, i1 } %519, 0
  %521 = extractvalue { i64, i1 } %519, 1
  br i1 %521, label %then569, label %else571

then569:                                          ; preds = %then568
  %calltrap570 = call i64 @overflow_fail(i64 3148)
  br label %else571

else571:                                          ; preds = %then569, %then568
  %522 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %520)
  %523 = extractvalue { i64, i1 } %522, 0
  %524 = extractvalue { i64, i1 } %522, 1
  br i1 %524, label %then572, label %else574

then572:                                          ; preds = %else571
  %calltrap573 = call i64 @overflow_fail(i64 3143)
  br label %else574

else574:                                          ; preds = %then572, %else571
  %525 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %523)
  %526 = extractvalue { i64, i1 } %525, 0
  %527 = extractvalue { i64, i1 } %525, 1
  br i1 %527, label %then575, label %else577

then575:                                          ; preds = %else574
  %calltrap576 = call i64 @overflow_fail(i64 3138)
  br label %else577

else577:                                          ; preds = %then575, %else574
  %528 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %526)
  %529 = extractvalue { i64, i1 } %528, 0
  %530 = extractvalue { i64, i1 } %528, 1
  br i1 %530, label %then578, label %else580

then578:                                          ; preds = %else577
  %calltrap579 = call i64 @overflow_fail(i64 3133)
  br label %else580

else580:                                          ; preds = %then578, %else577
  %531 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %529)
  %532 = extractvalue { i64, i1 } %531, 0
  %533 = extractvalue { i64, i1 } %531, 1
  br i1 %533, label %then581, label %else583

then581:                                          ; preds = %else580
  %calltrap582 = call i64 @overflow_fail(i64 3128)
  br label %else583

else583:                                          ; preds = %then581, %else580
  %534 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %532)
  %535 = extractvalue { i64, i1 } %534, 0
  %536 = extractvalue { i64, i1 } %534, 1
  br i1 %536, label %then584, label %else586

then584:                                          ; preds = %else583
  %calltrap585 = call i64 @overflow_fail(i64 3123)
  br label %else586

else586:                                          ; preds = %then584, %else583
  %537 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %535)
  %538 = extractvalue { i64, i1 } %537, 0
  %539 = extractvalue { i64, i1 } %537, 1
  br i1 %539, label %then587, label %else589

then587:                                          ; preds = %else586
  %calltrap588 = call i64 @overflow_fail(i64 3118)
  br label %else589

else589:                                          ; preds = %then587, %else586
  %540 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %538)
  %541 = extractvalue { i64, i1 } %540, 0
  %542 = extractvalue { i64, i1 } %540, 1
  br i1 %542, label %then590, label %else592

then590:                                          ; preds = %else589
  %calltrap591 = call i64 @overflow_fail(i64 3113)
  br label %else592

else592:                                          ; preds = %then590, %else589
  %543 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %541)
  %544 = extractvalue { i64, i1 } %543, 0
  %545 = extractvalue { i64, i1 } %543, 1
  br i1 %545, label %then593, label %else595

then593:                                          ; preds = %else592
  %calltrap594 = call i64 @overflow_fail(i64 3107)
  br label %else595

else595:                                          ; preds = %then593, %else592
  %546 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %544)
  %547 = extractvalue { i64, i1 } %546, 0
  %548 = extractvalue { i64, i1 } %546, 1
  br i1 %548, label %then596, label %else598

then596:                                          ; preds = %else595
  %calltrap597 = call i64 @overflow_fail(i64 3101)
  br label %else598

else598:                                          ; preds = %then596, %else595
  %549 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %547)
  %550 = extractvalue { i64, i1 } %549, 0
  %551 = extractvalue { i64, i1 } %549, 1
  br i1 %551, label %then599, label %else601

then599:                                          ; preds = %else598
  %calltrap600 = call i64 @overflow_fail(i64 3095)
  br label %else601

else601:                                          ; preds = %then599, %else598
  %552 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %550)
  %553 = extractvalue { i64, i1 } %552, 0
  %554 = extractvalue { i64, i1 } %552, 1
  br i1 %554, label %then602, label %else604

then602:                                          ; preds = %else601
  %calltrap603 = call i64 @overflow_fail(i64 3089)
  br label %else604

else604:                                          ; preds = %then602, %else601
  %555 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %553)
  %556 = extractvalue { i64, i1 } %555, 0
  %557 = extractvalue { i64, i1 } %555, 1
  br i1 %557, label %then605, label %else607

then605:                                          ; preds = %else604
  %calltrap606 = call i64 @overflow_fail(i64 3083)
  br label %else607

else607:                                          ; preds = %then605, %else604
  %558 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %556)
  %559 = extractvalue { i64, i1 } %558, 0
  %560 = extractvalue { i64, i1 } %558, 1
  br i1 %560, label %then608, label %else610

then608:                                          ; preds = %else607
  %calltrap609 = call i64 @overflow_fail(i64 3077)
  br label %else610

else610:                                          ; preds = %then608, %else607
  %561 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %559)
  %562 = extractvalue { i64, i1 } %561, 0
  %563 = extractvalue { i64, i1 } %561, 1
  br i1 %563, label %then611, label %else613

then611:                                          ; preds = %else610
  %calltrap612 = call i64 @overflow_fail(i64 3071)
  br label %else613

else613:                                          ; preds = %then611, %else610
  %564 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %562)
  %565 = extractvalue { i64, i1 } %564, 0
  %566 = extractvalue { i64, i1 } %564, 1
  br i1 %566, label %then614, label %else616

then614:                                          ; preds = %else613
  %calltrap615 = call i64 @overflow_fail(i64 3065)
  br label %else616

else616:                                          ; preds = %then614, %else613
  %567 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %565)
  %568 = extractvalue { i64, i1 } %567, 0
  %569 = extractvalue { i64, i1 } %567, 1
  br i1 %569, label %then617, label %else619

then617:                                          ; preds = %else616
  %calltrap618 = call i64 @overflow_fail(i64 3059)
  br label %else619

else619:                                          ; preds = %then617, %else616
  %570 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 19, i64 %568)
  %571 = extractvalue { i64, i1 } %570, 0
  %572 = extractvalue { i64, i1 } %570, 1
  br i1 %572, label %then620, label %else622

then620:                                          ; preds = %else619
  %calltrap621 = call i64 @overflow_fail(i64 3053)
  br label %else622

else622:                                          ; preds = %then620, %else619
  %573 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 20, i64 %571)
  %574 = extractvalue { i64, i1 } %573, 0
  %575 = extractvalue { i64, i1 } %573, 1
  br i1 %575, label %then623, label %else625

then623:                                          ; preds = %else622
  %calltrap624 = call i64 @overflow_fail(i64 3047)
  br label %else625

else625:                                          ; preds = %then623, %else622
  br label %merge

else626:                                          ; preds = %else566
  br label %merge

merge:                                            ; preds = %else626, %else625
  %phiNode = phi i64 [ %574, %else625 ], [ -1, %else626 ]
  br label %merge627

merge627:                                         ; preds = %merge, %else565
  %phiNode628 = phi i64 [ %517, %else565 ], [ %phiNode, %merge ]
  br label %merge629

merge629:                                         ; preds = %merge627, %else508
  %phiNode630 = phi i64 [ %463, %else508 ], [ %phiNode628, %merge627 ]
  br label %merge631

merge631:                                         ; preds = %merge629, %else454
  %phiNode632 = phi i64 [ %412, %else454 ], [ %phiNode630, %merge629 ]
  br label %merge633

merge633:                                         ; preds = %merge631, %else403
  %phiNode634 = phi i64 [ %364, %else403 ], [ %phiNode632, %merge631 ]
  br label %merge635

merge635:                                         ; preds = %merge633, %else355
  %phiNode636 = phi i64 [ %319, %else355 ], [ %phiNode634, %merge633 ]
  br label %merge637

merge637:                                         ; preds = %merge635, %else310
  %phiNode638 = phi i64 [ %277, %else310 ], [ %phiNode636, %merge635 ]
  br label %merge639

merge639:                                         ; preds = %merge637, %else268
  %phiNode640 = phi i64 [ %238, %else268 ], [ %phiNode638, %merge637 ]
  br label %merge641

merge641:                                         ; preds = %merge639, %else229
  %phiNode642 = phi i64 [ %202, %else229 ], [ %phiNode640, %merge639 ]
  br label %merge643

merge643:                                         ; preds = %merge641, %else193
  %phiNode644 = phi i64 [ %169, %else193 ], [ %phiNode642, %merge641 ]
  br label %merge645

merge645:                                         ; preds = %merge643, %else160
  %phiNode646 = phi i64 [ %139, %else160 ], [ %phiNode644, %merge643 ]
  br label %merge647

merge647:                                         ; preds = %merge645, %else130
  %phiNode648 = phi i64 [ %112, %else130 ], [ %phiNode646, %merge645 ]
  br label %merge649

merge649:                                         ; preds = %merge647, %else103
  %phiNode650 = phi i64 [ %88, %else103 ], [ %phiNode648, %merge647 ]
  br label %merge651

merge651:                                         ; preds = %merge649, %else79
  %phiNode652 = phi i64 [ %67, %else79 ], [ %phiNode650, %merge649 ]
  br label %merge653

merge653:                                         ; preds = %merge651, %else58
  %phiNode654 = phi i64 [ %49, %else58 ], [ %phiNode652, %merge651 ]
  br label %merge655

merge655:                                         ; preds = %merge653, %else40
  %phiNode656 = phi i64 [ %34, %else40 ], [ %phiNode654, %merge653 ]
  br label %merge657

merge657:                                         ; preds = %merge655, %else25
  %phiNode658 = phi i64 [ %22, %else25 ], [ %phiNode656, %merge655 ]
  br label %merge659

merge659:                                         ; preds = %merge657, %else13
  %phiNode660 = phi i64 [ %13, %else13 ], [ %phiNode658, %merge657 ]
  br label %merge661

merge661:                                         ; preds = %merge659, %else4
  %phiNode662 = phi i64 [ %7, %else4 ], [ %phiNode660, %merge659 ]
  br label %merge663

merge663:                                         ; preds = %merge661, %then
  %phiNode664 = phi i64 [ 1, %then ], [ %phiNode662, %merge661 ]
  ret i64 %phiNode664
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

declare i64 @overflow_fail(i64)

attributes #0 = { nounwind readnone }
