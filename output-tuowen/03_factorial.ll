; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

declare void @overflow_fail(i64)

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %6 = icmp eq i64 %0, 1
  br i1 %6, label %thenIf, label %elseIf

thenIf:                                           ; preds = %entry
  br label %afterIf

elseIf:                                           ; preds = %entry
  %7 = icmp eq i64 %0, 2
  br i1 %7, label %thenIf1, label %elseIf2

afterIf:                                          ; preds = %afterIf3, %thenIf
  %8 = phi i64 [ 1, %thenIf ], [ %13, %afterIf3 ]
  ret i64 %8

thenIf1:                                          ; preds = %elseIf
  %9 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %over, label %safe

elseIf2:                                          ; preds = %elseIf
  %12 = icmp eq i64 %0, 3
  br i1 %12, label %thenIf4, label %elseIf5

afterIf3:                                         ; preds = %afterIf6, %safe
  %13 = phi i64 [ %10, %safe ], [ %18, %afterIf6 ]
  br label %afterIf

over:                                             ; preds = %thenIf1
  tail call void @overflow_fail(i64 67)
  unreachable

safe:                                             ; preds = %thenIf1
  br label %afterIf3

thenIf4:                                          ; preds = %elseIf2
  %14 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %15 = extractvalue { i64, i1 } %14, 0
  %16 = extractvalue { i64, i1 } %14, 1
  br i1 %16, label %over7, label %safe8

elseIf5:                                          ; preds = %elseIf2
  %17 = icmp eq i64 %0, 4
  br i1 %17, label %thenIf11, label %elseIf12

afterIf6:                                         ; preds = %afterIf13, %safe10
  %18 = phi i64 [ %20, %safe10 ], [ %26, %afterIf13 ]
  br label %afterIf3

over7:                                            ; preds = %thenIf4
  tail call void @overflow_fail(i64 114)
  unreachable

safe8:                                            ; preds = %thenIf4
  %19 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %15)
  %20 = extractvalue { i64, i1 } %19, 0
  %21 = extractvalue { i64, i1 } %19, 1
  br i1 %21, label %over9, label %safe10

over9:                                            ; preds = %safe8
  tail call void @overflow_fail(i64 109)
  unreachable

safe10:                                           ; preds = %safe8
  br label %afterIf6

thenIf11:                                         ; preds = %elseIf5
  %22 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %23 = extractvalue { i64, i1 } %22, 0
  %24 = extractvalue { i64, i1 } %22, 1
  br i1 %24, label %over14, label %safe15

elseIf12:                                         ; preds = %elseIf5
  %25 = icmp eq i64 %0, 5
  br i1 %25, label %thenIf20, label %elseIf21

afterIf13:                                        ; preds = %afterIf22, %safe19
  %26 = phi i64 [ %31, %safe19 ], [ %37, %afterIf22 ]
  br label %afterIf6

over14:                                           ; preds = %thenIf11
  tail call void @overflow_fail(i64 175)
  unreachable

safe15:                                           ; preds = %thenIf11
  %27 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %23)
  %28 = extractvalue { i64, i1 } %27, 0
  %29 = extractvalue { i64, i1 } %27, 1
  br i1 %29, label %over16, label %safe17

over16:                                           ; preds = %safe15
  tail call void @overflow_fail(i64 170)
  unreachable

safe17:                                           ; preds = %safe15
  %30 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %28)
  %31 = extractvalue { i64, i1 } %30, 0
  %32 = extractvalue { i64, i1 } %30, 1
  br i1 %32, label %over18, label %safe19

over18:                                           ; preds = %safe17
  tail call void @overflow_fail(i64 165)
  unreachable

safe19:                                           ; preds = %safe17
  br label %afterIf13

thenIf20:                                         ; preds = %elseIf12
  %33 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %34 = extractvalue { i64, i1 } %33, 0
  %35 = extractvalue { i64, i1 } %33, 1
  br i1 %35, label %over23, label %safe24

elseIf21:                                         ; preds = %elseIf12
  %36 = icmp eq i64 %0, 6
  br i1 %36, label %thenIf31, label %elseIf32

afterIf22:                                        ; preds = %afterIf33, %safe30
  %37 = phi i64 [ %45, %safe30 ], [ %51, %afterIf33 ]
  br label %afterIf13

over23:                                           ; preds = %thenIf20
  tail call void @overflow_fail(i64 250)
  unreachable

safe24:                                           ; preds = %thenIf20
  %38 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %34)
  %39 = extractvalue { i64, i1 } %38, 0
  %40 = extractvalue { i64, i1 } %38, 1
  br i1 %40, label %over25, label %safe26

over25:                                           ; preds = %safe24
  tail call void @overflow_fail(i64 245)
  unreachable

safe26:                                           ; preds = %safe24
  %41 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %39)
  %42 = extractvalue { i64, i1 } %41, 0
  %43 = extractvalue { i64, i1 } %41, 1
  br i1 %43, label %over27, label %safe28

over27:                                           ; preds = %safe26
  tail call void @overflow_fail(i64 240)
  unreachable

safe28:                                           ; preds = %safe26
  %44 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %42)
  %45 = extractvalue { i64, i1 } %44, 0
  %46 = extractvalue { i64, i1 } %44, 1
  br i1 %46, label %over29, label %safe30

over29:                                           ; preds = %safe28
  tail call void @overflow_fail(i64 235)
  unreachable

safe30:                                           ; preds = %safe28
  br label %afterIf22

thenIf31:                                         ; preds = %elseIf21
  %47 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %48 = extractvalue { i64, i1 } %47, 0
  %49 = extractvalue { i64, i1 } %47, 1
  br i1 %49, label %over34, label %safe35

elseIf32:                                         ; preds = %elseIf21
  %50 = icmp eq i64 %0, 7
  br i1 %50, label %thenIf44, label %elseIf45

afterIf33:                                        ; preds = %afterIf46, %safe43
  %51 = phi i64 [ %62, %safe43 ], [ %68, %afterIf46 ]
  br label %afterIf22

over34:                                           ; preds = %thenIf31
  tail call void @overflow_fail(i64 339)
  unreachable

safe35:                                           ; preds = %thenIf31
  %52 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %48)
  %53 = extractvalue { i64, i1 } %52, 0
  %54 = extractvalue { i64, i1 } %52, 1
  br i1 %54, label %over36, label %safe37

over36:                                           ; preds = %safe35
  tail call void @overflow_fail(i64 334)
  unreachable

safe37:                                           ; preds = %safe35
  %55 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %53)
  %56 = extractvalue { i64, i1 } %55, 0
  %57 = extractvalue { i64, i1 } %55, 1
  br i1 %57, label %over38, label %safe39

over38:                                           ; preds = %safe37
  tail call void @overflow_fail(i64 329)
  unreachable

safe39:                                           ; preds = %safe37
  %58 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %56)
  %59 = extractvalue { i64, i1 } %58, 0
  %60 = extractvalue { i64, i1 } %58, 1
  br i1 %60, label %over40, label %safe41

over40:                                           ; preds = %safe39
  tail call void @overflow_fail(i64 324)
  unreachable

safe41:                                           ; preds = %safe39
  %61 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %59)
  %62 = extractvalue { i64, i1 } %61, 0
  %63 = extractvalue { i64, i1 } %61, 1
  br i1 %63, label %over42, label %safe43

over42:                                           ; preds = %safe41
  tail call void @overflow_fail(i64 319)
  unreachable

safe43:                                           ; preds = %safe41
  br label %afterIf33

thenIf44:                                         ; preds = %elseIf32
  %64 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %65 = extractvalue { i64, i1 } %64, 0
  %66 = extractvalue { i64, i1 } %64, 1
  br i1 %66, label %over47, label %safe48

elseIf45:                                         ; preds = %elseIf32
  %67 = icmp eq i64 %0, 8
  br i1 %67, label %thenIf59, label %elseIf60

afterIf46:                                        ; preds = %afterIf61, %safe58
  %68 = phi i64 [ %82, %safe58 ], [ %88, %afterIf61 ]
  br label %afterIf33

over47:                                           ; preds = %thenIf44
  tail call void @overflow_fail(i64 442)
  unreachable

safe48:                                           ; preds = %thenIf44
  %69 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %65)
  %70 = extractvalue { i64, i1 } %69, 0
  %71 = extractvalue { i64, i1 } %69, 1
  br i1 %71, label %over49, label %safe50

over49:                                           ; preds = %safe48
  tail call void @overflow_fail(i64 437)
  unreachable

safe50:                                           ; preds = %safe48
  %72 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %70)
  %73 = extractvalue { i64, i1 } %72, 0
  %74 = extractvalue { i64, i1 } %72, 1
  br i1 %74, label %over51, label %safe52

over51:                                           ; preds = %safe50
  tail call void @overflow_fail(i64 432)
  unreachable

safe52:                                           ; preds = %safe50
  %75 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %73)
  %76 = extractvalue { i64, i1 } %75, 0
  %77 = extractvalue { i64, i1 } %75, 1
  br i1 %77, label %over53, label %safe54

over53:                                           ; preds = %safe52
  tail call void @overflow_fail(i64 427)
  unreachable

safe54:                                           ; preds = %safe52
  %78 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %76)
  %79 = extractvalue { i64, i1 } %78, 0
  %80 = extractvalue { i64, i1 } %78, 1
  br i1 %80, label %over55, label %safe56

over55:                                           ; preds = %safe54
  tail call void @overflow_fail(i64 422)
  unreachable

safe56:                                           ; preds = %safe54
  %81 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %79)
  %82 = extractvalue { i64, i1 } %81, 0
  %83 = extractvalue { i64, i1 } %81, 1
  br i1 %83, label %over57, label %safe58

over57:                                           ; preds = %safe56
  tail call void @overflow_fail(i64 417)
  unreachable

safe58:                                           ; preds = %safe56
  br label %afterIf46

thenIf59:                                         ; preds = %elseIf45
  %84 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %85 = extractvalue { i64, i1 } %84, 0
  %86 = extractvalue { i64, i1 } %84, 1
  br i1 %86, label %over62, label %safe63

elseIf60:                                         ; preds = %elseIf45
  %87 = icmp eq i64 %0, 9
  br i1 %87, label %thenIf76, label %elseIf77

afterIf61:                                        ; preds = %afterIf78, %safe75
  %88 = phi i64 [ %105, %safe75 ], [ %111, %afterIf78 ]
  br label %afterIf46

over62:                                           ; preds = %thenIf59
  tail call void @overflow_fail(i64 559)
  unreachable

safe63:                                           ; preds = %thenIf59
  %89 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %85)
  %90 = extractvalue { i64, i1 } %89, 0
  %91 = extractvalue { i64, i1 } %89, 1
  br i1 %91, label %over64, label %safe65

over64:                                           ; preds = %safe63
  tail call void @overflow_fail(i64 554)
  unreachable

safe65:                                           ; preds = %safe63
  %92 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %90)
  %93 = extractvalue { i64, i1 } %92, 0
  %94 = extractvalue { i64, i1 } %92, 1
  br i1 %94, label %over66, label %safe67

over66:                                           ; preds = %safe65
  tail call void @overflow_fail(i64 549)
  unreachable

safe67:                                           ; preds = %safe65
  %95 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %93)
  %96 = extractvalue { i64, i1 } %95, 0
  %97 = extractvalue { i64, i1 } %95, 1
  br i1 %97, label %over68, label %safe69

over68:                                           ; preds = %safe67
  tail call void @overflow_fail(i64 544)
  unreachable

safe69:                                           ; preds = %safe67
  %98 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %96)
  %99 = extractvalue { i64, i1 } %98, 0
  %100 = extractvalue { i64, i1 } %98, 1
  br i1 %100, label %over70, label %safe71

over70:                                           ; preds = %safe69
  tail call void @overflow_fail(i64 539)
  unreachable

safe71:                                           ; preds = %safe69
  %101 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %99)
  %102 = extractvalue { i64, i1 } %101, 0
  %103 = extractvalue { i64, i1 } %101, 1
  br i1 %103, label %over72, label %safe73

over72:                                           ; preds = %safe71
  tail call void @overflow_fail(i64 534)
  unreachable

safe73:                                           ; preds = %safe71
  %104 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %102)
  %105 = extractvalue { i64, i1 } %104, 0
  %106 = extractvalue { i64, i1 } %104, 1
  br i1 %106, label %over74, label %safe75

over74:                                           ; preds = %safe73
  tail call void @overflow_fail(i64 529)
  unreachable

safe75:                                           ; preds = %safe73
  br label %afterIf61

thenIf76:                                         ; preds = %elseIf60
  %107 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %108 = extractvalue { i64, i1 } %107, 0
  %109 = extractvalue { i64, i1 } %107, 1
  br i1 %109, label %over79, label %safe80

elseIf77:                                         ; preds = %elseIf60
  %110 = icmp eq i64 %0, 10
  br i1 %110, label %thenIf95, label %elseIf96

afterIf78:                                        ; preds = %afterIf97, %safe94
  %111 = phi i64 [ %131, %safe94 ], [ %137, %afterIf97 ]
  br label %afterIf61

over79:                                           ; preds = %thenIf76
  tail call void @overflow_fail(i64 690)
  unreachable

safe80:                                           ; preds = %thenIf76
  %112 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %108)
  %113 = extractvalue { i64, i1 } %112, 0
  %114 = extractvalue { i64, i1 } %112, 1
  br i1 %114, label %over81, label %safe82

over81:                                           ; preds = %safe80
  tail call void @overflow_fail(i64 685)
  unreachable

safe82:                                           ; preds = %safe80
  %115 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %113)
  %116 = extractvalue { i64, i1 } %115, 0
  %117 = extractvalue { i64, i1 } %115, 1
  br i1 %117, label %over83, label %safe84

over83:                                           ; preds = %safe82
  tail call void @overflow_fail(i64 680)
  unreachable

safe84:                                           ; preds = %safe82
  %118 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %116)
  %119 = extractvalue { i64, i1 } %118, 0
  %120 = extractvalue { i64, i1 } %118, 1
  br i1 %120, label %over85, label %safe86

over85:                                           ; preds = %safe84
  tail call void @overflow_fail(i64 675)
  unreachable

safe86:                                           ; preds = %safe84
  %121 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %119)
  %122 = extractvalue { i64, i1 } %121, 0
  %123 = extractvalue { i64, i1 } %121, 1
  br i1 %123, label %over87, label %safe88

over87:                                           ; preds = %safe86
  tail call void @overflow_fail(i64 670)
  unreachable

safe88:                                           ; preds = %safe86
  %124 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %122)
  %125 = extractvalue { i64, i1 } %124, 0
  %126 = extractvalue { i64, i1 } %124, 1
  br i1 %126, label %over89, label %safe90

over89:                                           ; preds = %safe88
  tail call void @overflow_fail(i64 665)
  unreachable

safe90:                                           ; preds = %safe88
  %127 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %125)
  %128 = extractvalue { i64, i1 } %127, 0
  %129 = extractvalue { i64, i1 } %127, 1
  br i1 %129, label %over91, label %safe92

over91:                                           ; preds = %safe90
  tail call void @overflow_fail(i64 660)
  unreachable

safe92:                                           ; preds = %safe90
  %130 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %128)
  %131 = extractvalue { i64, i1 } %130, 0
  %132 = extractvalue { i64, i1 } %130, 1
  br i1 %132, label %over93, label %safe94

over93:                                           ; preds = %safe92
  tail call void @overflow_fail(i64 655)
  unreachable

safe94:                                           ; preds = %safe92
  br label %afterIf78

thenIf95:                                         ; preds = %elseIf77
  %133 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %134 = extractvalue { i64, i1 } %133, 0
  %135 = extractvalue { i64, i1 } %133, 1
  br i1 %135, label %over98, label %safe99

elseIf96:                                         ; preds = %elseIf77
  %136 = icmp eq i64 %0, 11
  br i1 %136, label %thenIf116, label %elseIf117

afterIf97:                                        ; preds = %afterIf118, %safe115
  %137 = phi i64 [ %160, %safe115 ], [ %166, %afterIf118 ]
  br label %afterIf78

over98:                                           ; preds = %thenIf95
  tail call void @overflow_fail(i64 837)
  unreachable

safe99:                                           ; preds = %thenIf95
  %138 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %134)
  %139 = extractvalue { i64, i1 } %138, 0
  %140 = extractvalue { i64, i1 } %138, 1
  br i1 %140, label %over100, label %safe101

over100:                                          ; preds = %safe99
  tail call void @overflow_fail(i64 832)
  unreachable

safe101:                                          ; preds = %safe99
  %141 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %139)
  %142 = extractvalue { i64, i1 } %141, 0
  %143 = extractvalue { i64, i1 } %141, 1
  br i1 %143, label %over102, label %safe103

over102:                                          ; preds = %safe101
  tail call void @overflow_fail(i64 827)
  unreachable

safe103:                                          ; preds = %safe101
  %144 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %142)
  %145 = extractvalue { i64, i1 } %144, 0
  %146 = extractvalue { i64, i1 } %144, 1
  br i1 %146, label %over104, label %safe105

over104:                                          ; preds = %safe103
  tail call void @overflow_fail(i64 822)
  unreachable

safe105:                                          ; preds = %safe103
  %147 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %145)
  %148 = extractvalue { i64, i1 } %147, 0
  %149 = extractvalue { i64, i1 } %147, 1
  br i1 %149, label %over106, label %safe107

over106:                                          ; preds = %safe105
  tail call void @overflow_fail(i64 817)
  unreachable

safe107:                                          ; preds = %safe105
  %150 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %148)
  %151 = extractvalue { i64, i1 } %150, 0
  %152 = extractvalue { i64, i1 } %150, 1
  br i1 %152, label %over108, label %safe109

over108:                                          ; preds = %safe107
  tail call void @overflow_fail(i64 812)
  unreachable

safe109:                                          ; preds = %safe107
  %153 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %151)
  %154 = extractvalue { i64, i1 } %153, 0
  %155 = extractvalue { i64, i1 } %153, 1
  br i1 %155, label %over110, label %safe111

over110:                                          ; preds = %safe109
  tail call void @overflow_fail(i64 807)
  unreachable

safe111:                                          ; preds = %safe109
  %156 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %154)
  %157 = extractvalue { i64, i1 } %156, 0
  %158 = extractvalue { i64, i1 } %156, 1
  br i1 %158, label %over112, label %safe113

over112:                                          ; preds = %safe111
  tail call void @overflow_fail(i64 802)
  unreachable

safe113:                                          ; preds = %safe111
  %159 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %157)
  %160 = extractvalue { i64, i1 } %159, 0
  %161 = extractvalue { i64, i1 } %159, 1
  br i1 %161, label %over114, label %safe115

over114:                                          ; preds = %safe113
  tail call void @overflow_fail(i64 796)
  unreachable

safe115:                                          ; preds = %safe113
  br label %afterIf97

thenIf116:                                        ; preds = %elseIf96
  %162 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %163 = extractvalue { i64, i1 } %162, 0
  %164 = extractvalue { i64, i1 } %162, 1
  br i1 %164, label %over119, label %safe120

elseIf117:                                        ; preds = %elseIf96
  %165 = icmp eq i64 %0, 12
  br i1 %165, label %thenIf139, label %elseIf140

afterIf118:                                       ; preds = %afterIf141, %safe138
  %166 = phi i64 [ %192, %safe138 ], [ %198, %afterIf141 ]
  br label %afterIf97

over119:                                          ; preds = %thenIf116
  tail call void @overflow_fail(i64 999)
  unreachable

safe120:                                          ; preds = %thenIf116
  %167 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %163)
  %168 = extractvalue { i64, i1 } %167, 0
  %169 = extractvalue { i64, i1 } %167, 1
  br i1 %169, label %over121, label %safe122

over121:                                          ; preds = %safe120
  tail call void @overflow_fail(i64 994)
  unreachable

safe122:                                          ; preds = %safe120
  %170 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %168)
  %171 = extractvalue { i64, i1 } %170, 0
  %172 = extractvalue { i64, i1 } %170, 1
  br i1 %172, label %over123, label %safe124

over123:                                          ; preds = %safe122
  tail call void @overflow_fail(i64 989)
  unreachable

safe124:                                          ; preds = %safe122
  %173 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %171)
  %174 = extractvalue { i64, i1 } %173, 0
  %175 = extractvalue { i64, i1 } %173, 1
  br i1 %175, label %over125, label %safe126

over125:                                          ; preds = %safe124
  tail call void @overflow_fail(i64 984)
  unreachable

safe126:                                          ; preds = %safe124
  %176 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %174)
  %177 = extractvalue { i64, i1 } %176, 0
  %178 = extractvalue { i64, i1 } %176, 1
  br i1 %178, label %over127, label %safe128

over127:                                          ; preds = %safe126
  tail call void @overflow_fail(i64 979)
  unreachable

safe128:                                          ; preds = %safe126
  %179 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %177)
  %180 = extractvalue { i64, i1 } %179, 0
  %181 = extractvalue { i64, i1 } %179, 1
  br i1 %181, label %over129, label %safe130

over129:                                          ; preds = %safe128
  tail call void @overflow_fail(i64 974)
  unreachable

safe130:                                          ; preds = %safe128
  %182 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %180)
  %183 = extractvalue { i64, i1 } %182, 0
  %184 = extractvalue { i64, i1 } %182, 1
  br i1 %184, label %over131, label %safe132

over131:                                          ; preds = %safe130
  tail call void @overflow_fail(i64 969)
  unreachable

safe132:                                          ; preds = %safe130
  %185 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %183)
  %186 = extractvalue { i64, i1 } %185, 0
  %187 = extractvalue { i64, i1 } %185, 1
  br i1 %187, label %over133, label %safe134

over133:                                          ; preds = %safe132
  tail call void @overflow_fail(i64 964)
  unreachable

safe134:                                          ; preds = %safe132
  %188 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %186)
  %189 = extractvalue { i64, i1 } %188, 0
  %190 = extractvalue { i64, i1 } %188, 1
  br i1 %190, label %over135, label %safe136

over135:                                          ; preds = %safe134
  tail call void @overflow_fail(i64 958)
  unreachable

safe136:                                          ; preds = %safe134
  %191 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %189)
  %192 = extractvalue { i64, i1 } %191, 0
  %193 = extractvalue { i64, i1 } %191, 1
  br i1 %193, label %over137, label %safe138

over137:                                          ; preds = %safe136
  tail call void @overflow_fail(i64 952)
  unreachable

safe138:                                          ; preds = %safe136
  br label %afterIf118

thenIf139:                                        ; preds = %elseIf117
  %194 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %195 = extractvalue { i64, i1 } %194, 0
  %196 = extractvalue { i64, i1 } %194, 1
  br i1 %196, label %over142, label %safe143

elseIf140:                                        ; preds = %elseIf117
  %197 = icmp eq i64 %0, 13
  br i1 %197, label %thenIf164, label %elseIf165

afterIf141:                                       ; preds = %afterIf166, %safe163
  %198 = phi i64 [ %227, %safe163 ], [ %233, %afterIf166 ]
  br label %afterIf118

over142:                                          ; preds = %thenIf139
  tail call void @overflow_fail(i64 1176)
  unreachable

safe143:                                          ; preds = %thenIf139
  %199 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %195)
  %200 = extractvalue { i64, i1 } %199, 0
  %201 = extractvalue { i64, i1 } %199, 1
  br i1 %201, label %over144, label %safe145

over144:                                          ; preds = %safe143
  tail call void @overflow_fail(i64 1171)
  unreachable

safe145:                                          ; preds = %safe143
  %202 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %200)
  %203 = extractvalue { i64, i1 } %202, 0
  %204 = extractvalue { i64, i1 } %202, 1
  br i1 %204, label %over146, label %safe147

over146:                                          ; preds = %safe145
  tail call void @overflow_fail(i64 1166)
  unreachable

safe147:                                          ; preds = %safe145
  %205 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %203)
  %206 = extractvalue { i64, i1 } %205, 0
  %207 = extractvalue { i64, i1 } %205, 1
  br i1 %207, label %over148, label %safe149

over148:                                          ; preds = %safe147
  tail call void @overflow_fail(i64 1161)
  unreachable

safe149:                                          ; preds = %safe147
  %208 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %206)
  %209 = extractvalue { i64, i1 } %208, 0
  %210 = extractvalue { i64, i1 } %208, 1
  br i1 %210, label %over150, label %safe151

over150:                                          ; preds = %safe149
  tail call void @overflow_fail(i64 1156)
  unreachable

safe151:                                          ; preds = %safe149
  %211 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %209)
  %212 = extractvalue { i64, i1 } %211, 0
  %213 = extractvalue { i64, i1 } %211, 1
  br i1 %213, label %over152, label %safe153

over152:                                          ; preds = %safe151
  tail call void @overflow_fail(i64 1151)
  unreachable

safe153:                                          ; preds = %safe151
  %214 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %212)
  %215 = extractvalue { i64, i1 } %214, 0
  %216 = extractvalue { i64, i1 } %214, 1
  br i1 %216, label %over154, label %safe155

over154:                                          ; preds = %safe153
  tail call void @overflow_fail(i64 1146)
  unreachable

safe155:                                          ; preds = %safe153
  %217 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %215)
  %218 = extractvalue { i64, i1 } %217, 0
  %219 = extractvalue { i64, i1 } %217, 1
  br i1 %219, label %over156, label %safe157

over156:                                          ; preds = %safe155
  tail call void @overflow_fail(i64 1141)
  unreachable

safe157:                                          ; preds = %safe155
  %220 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %218)
  %221 = extractvalue { i64, i1 } %220, 0
  %222 = extractvalue { i64, i1 } %220, 1
  br i1 %222, label %over158, label %safe159

over158:                                          ; preds = %safe157
  tail call void @overflow_fail(i64 1135)
  unreachable

safe159:                                          ; preds = %safe157
  %223 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %221)
  %224 = extractvalue { i64, i1 } %223, 0
  %225 = extractvalue { i64, i1 } %223, 1
  br i1 %225, label %over160, label %safe161

over160:                                          ; preds = %safe159
  tail call void @overflow_fail(i64 1129)
  unreachable

safe161:                                          ; preds = %safe159
  %226 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %224)
  %227 = extractvalue { i64, i1 } %226, 0
  %228 = extractvalue { i64, i1 } %226, 1
  br i1 %228, label %over162, label %safe163

over162:                                          ; preds = %safe161
  tail call void @overflow_fail(i64 1123)
  unreachable

safe163:                                          ; preds = %safe161
  br label %afterIf141

thenIf164:                                        ; preds = %elseIf140
  %229 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %230 = extractvalue { i64, i1 } %229, 0
  %231 = extractvalue { i64, i1 } %229, 1
  br i1 %231, label %over167, label %safe168

elseIf165:                                        ; preds = %elseIf140
  %232 = icmp eq i64 %0, 14
  br i1 %232, label %thenIf191, label %elseIf192

afterIf166:                                       ; preds = %afterIf193, %safe190
  %233 = phi i64 [ %265, %safe190 ], [ %271, %afterIf193 ]
  br label %afterIf141

over167:                                          ; preds = %thenIf164
  tail call void @overflow_fail(i64 1368)
  unreachable

safe168:                                          ; preds = %thenIf164
  %234 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %230)
  %235 = extractvalue { i64, i1 } %234, 0
  %236 = extractvalue { i64, i1 } %234, 1
  br i1 %236, label %over169, label %safe170

over169:                                          ; preds = %safe168
  tail call void @overflow_fail(i64 1363)
  unreachable

safe170:                                          ; preds = %safe168
  %237 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %235)
  %238 = extractvalue { i64, i1 } %237, 0
  %239 = extractvalue { i64, i1 } %237, 1
  br i1 %239, label %over171, label %safe172

over171:                                          ; preds = %safe170
  tail call void @overflow_fail(i64 1358)
  unreachable

safe172:                                          ; preds = %safe170
  %240 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %238)
  %241 = extractvalue { i64, i1 } %240, 0
  %242 = extractvalue { i64, i1 } %240, 1
  br i1 %242, label %over173, label %safe174

over173:                                          ; preds = %safe172
  tail call void @overflow_fail(i64 1353)
  unreachable

safe174:                                          ; preds = %safe172
  %243 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %241)
  %244 = extractvalue { i64, i1 } %243, 0
  %245 = extractvalue { i64, i1 } %243, 1
  br i1 %245, label %over175, label %safe176

over175:                                          ; preds = %safe174
  tail call void @overflow_fail(i64 1348)
  unreachable

safe176:                                          ; preds = %safe174
  %246 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %244)
  %247 = extractvalue { i64, i1 } %246, 0
  %248 = extractvalue { i64, i1 } %246, 1
  br i1 %248, label %over177, label %safe178

over177:                                          ; preds = %safe176
  tail call void @overflow_fail(i64 1343)
  unreachable

safe178:                                          ; preds = %safe176
  %249 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %247)
  %250 = extractvalue { i64, i1 } %249, 0
  %251 = extractvalue { i64, i1 } %249, 1
  br i1 %251, label %over179, label %safe180

over179:                                          ; preds = %safe178
  tail call void @overflow_fail(i64 1338)
  unreachable

safe180:                                          ; preds = %safe178
  %252 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %250)
  %253 = extractvalue { i64, i1 } %252, 0
  %254 = extractvalue { i64, i1 } %252, 1
  br i1 %254, label %over181, label %safe182

over181:                                          ; preds = %safe180
  tail call void @overflow_fail(i64 1333)
  unreachable

safe182:                                          ; preds = %safe180
  %255 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %253)
  %256 = extractvalue { i64, i1 } %255, 0
  %257 = extractvalue { i64, i1 } %255, 1
  br i1 %257, label %over183, label %safe184

over183:                                          ; preds = %safe182
  tail call void @overflow_fail(i64 1327)
  unreachable

safe184:                                          ; preds = %safe182
  %258 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %256)
  %259 = extractvalue { i64, i1 } %258, 0
  %260 = extractvalue { i64, i1 } %258, 1
  br i1 %260, label %over185, label %safe186

over185:                                          ; preds = %safe184
  tail call void @overflow_fail(i64 1321)
  unreachable

safe186:                                          ; preds = %safe184
  %261 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %259)
  %262 = extractvalue { i64, i1 } %261, 0
  %263 = extractvalue { i64, i1 } %261, 1
  br i1 %263, label %over187, label %safe188

over187:                                          ; preds = %safe186
  tail call void @overflow_fail(i64 1315)
  unreachable

safe188:                                          ; preds = %safe186
  %264 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %262)
  %265 = extractvalue { i64, i1 } %264, 0
  %266 = extractvalue { i64, i1 } %264, 1
  br i1 %266, label %over189, label %safe190

over189:                                          ; preds = %safe188
  tail call void @overflow_fail(i64 1309)
  unreachable

safe190:                                          ; preds = %safe188
  br label %afterIf166

thenIf191:                                        ; preds = %elseIf165
  %267 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %268 = extractvalue { i64, i1 } %267, 0
  %269 = extractvalue { i64, i1 } %267, 1
  br i1 %269, label %over194, label %safe195

elseIf192:                                        ; preds = %elseIf165
  %270 = icmp eq i64 %0, 15
  br i1 %270, label %thenIf220, label %elseIf221

afterIf193:                                       ; preds = %afterIf222, %safe219
  %271 = phi i64 [ %306, %safe219 ], [ %312, %afterIf222 ]
  br label %afterIf166

over194:                                          ; preds = %thenIf191
  tail call void @overflow_fail(i64 1575)
  unreachable

safe195:                                          ; preds = %thenIf191
  %272 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %268)
  %273 = extractvalue { i64, i1 } %272, 0
  %274 = extractvalue { i64, i1 } %272, 1
  br i1 %274, label %over196, label %safe197

over196:                                          ; preds = %safe195
  tail call void @overflow_fail(i64 1570)
  unreachable

safe197:                                          ; preds = %safe195
  %275 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %273)
  %276 = extractvalue { i64, i1 } %275, 0
  %277 = extractvalue { i64, i1 } %275, 1
  br i1 %277, label %over198, label %safe199

over198:                                          ; preds = %safe197
  tail call void @overflow_fail(i64 1565)
  unreachable

safe199:                                          ; preds = %safe197
  %278 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %276)
  %279 = extractvalue { i64, i1 } %278, 0
  %280 = extractvalue { i64, i1 } %278, 1
  br i1 %280, label %over200, label %safe201

over200:                                          ; preds = %safe199
  tail call void @overflow_fail(i64 1560)
  unreachable

safe201:                                          ; preds = %safe199
  %281 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %279)
  %282 = extractvalue { i64, i1 } %281, 0
  %283 = extractvalue { i64, i1 } %281, 1
  br i1 %283, label %over202, label %safe203

over202:                                          ; preds = %safe201
  tail call void @overflow_fail(i64 1555)
  unreachable

safe203:                                          ; preds = %safe201
  %284 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %282)
  %285 = extractvalue { i64, i1 } %284, 0
  %286 = extractvalue { i64, i1 } %284, 1
  br i1 %286, label %over204, label %safe205

over204:                                          ; preds = %safe203
  tail call void @overflow_fail(i64 1550)
  unreachable

safe205:                                          ; preds = %safe203
  %287 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %285)
  %288 = extractvalue { i64, i1 } %287, 0
  %289 = extractvalue { i64, i1 } %287, 1
  br i1 %289, label %over206, label %safe207

over206:                                          ; preds = %safe205
  tail call void @overflow_fail(i64 1545)
  unreachable

safe207:                                          ; preds = %safe205
  %290 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %288)
  %291 = extractvalue { i64, i1 } %290, 0
  %292 = extractvalue { i64, i1 } %290, 1
  br i1 %292, label %over208, label %safe209

over208:                                          ; preds = %safe207
  tail call void @overflow_fail(i64 1540)
  unreachable

safe209:                                          ; preds = %safe207
  %293 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %291)
  %294 = extractvalue { i64, i1 } %293, 0
  %295 = extractvalue { i64, i1 } %293, 1
  br i1 %295, label %over210, label %safe211

over210:                                          ; preds = %safe209
  tail call void @overflow_fail(i64 1534)
  unreachable

safe211:                                          ; preds = %safe209
  %296 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %294)
  %297 = extractvalue { i64, i1 } %296, 0
  %298 = extractvalue { i64, i1 } %296, 1
  br i1 %298, label %over212, label %safe213

over212:                                          ; preds = %safe211
  tail call void @overflow_fail(i64 1528)
  unreachable

safe213:                                          ; preds = %safe211
  %299 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %297)
  %300 = extractvalue { i64, i1 } %299, 0
  %301 = extractvalue { i64, i1 } %299, 1
  br i1 %301, label %over214, label %safe215

over214:                                          ; preds = %safe213
  tail call void @overflow_fail(i64 1522)
  unreachable

safe215:                                          ; preds = %safe213
  %302 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %300)
  %303 = extractvalue { i64, i1 } %302, 0
  %304 = extractvalue { i64, i1 } %302, 1
  br i1 %304, label %over216, label %safe217

over216:                                          ; preds = %safe215
  tail call void @overflow_fail(i64 1516)
  unreachable

safe217:                                          ; preds = %safe215
  %305 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %303)
  %306 = extractvalue { i64, i1 } %305, 0
  %307 = extractvalue { i64, i1 } %305, 1
  br i1 %307, label %over218, label %safe219

over218:                                          ; preds = %safe217
  tail call void @overflow_fail(i64 1510)
  unreachable

safe219:                                          ; preds = %safe217
  br label %afterIf193

thenIf220:                                        ; preds = %elseIf192
  %308 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %309 = extractvalue { i64, i1 } %308, 0
  %310 = extractvalue { i64, i1 } %308, 1
  br i1 %310, label %over223, label %safe224

elseIf221:                                        ; preds = %elseIf192
  %311 = icmp eq i64 %0, 16
  br i1 %311, label %thenIf251, label %elseIf252

afterIf222:                                       ; preds = %afterIf253, %safe250
  %312 = phi i64 [ %350, %safe250 ], [ %356, %afterIf253 ]
  br label %afterIf193

over223:                                          ; preds = %thenIf220
  tail call void @overflow_fail(i64 1797)
  unreachable

safe224:                                          ; preds = %thenIf220
  %313 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %309)
  %314 = extractvalue { i64, i1 } %313, 0
  %315 = extractvalue { i64, i1 } %313, 1
  br i1 %315, label %over225, label %safe226

over225:                                          ; preds = %safe224
  tail call void @overflow_fail(i64 1792)
  unreachable

safe226:                                          ; preds = %safe224
  %316 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %314)
  %317 = extractvalue { i64, i1 } %316, 0
  %318 = extractvalue { i64, i1 } %316, 1
  br i1 %318, label %over227, label %safe228

over227:                                          ; preds = %safe226
  tail call void @overflow_fail(i64 1787)
  unreachable

safe228:                                          ; preds = %safe226
  %319 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %317)
  %320 = extractvalue { i64, i1 } %319, 0
  %321 = extractvalue { i64, i1 } %319, 1
  br i1 %321, label %over229, label %safe230

over229:                                          ; preds = %safe228
  tail call void @overflow_fail(i64 1782)
  unreachable

safe230:                                          ; preds = %safe228
  %322 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %320)
  %323 = extractvalue { i64, i1 } %322, 0
  %324 = extractvalue { i64, i1 } %322, 1
  br i1 %324, label %over231, label %safe232

over231:                                          ; preds = %safe230
  tail call void @overflow_fail(i64 1777)
  unreachable

safe232:                                          ; preds = %safe230
  %325 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %323)
  %326 = extractvalue { i64, i1 } %325, 0
  %327 = extractvalue { i64, i1 } %325, 1
  br i1 %327, label %over233, label %safe234

over233:                                          ; preds = %safe232
  tail call void @overflow_fail(i64 1772)
  unreachable

safe234:                                          ; preds = %safe232
  %328 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %326)
  %329 = extractvalue { i64, i1 } %328, 0
  %330 = extractvalue { i64, i1 } %328, 1
  br i1 %330, label %over235, label %safe236

over235:                                          ; preds = %safe234
  tail call void @overflow_fail(i64 1767)
  unreachable

safe236:                                          ; preds = %safe234
  %331 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %329)
  %332 = extractvalue { i64, i1 } %331, 0
  %333 = extractvalue { i64, i1 } %331, 1
  br i1 %333, label %over237, label %safe238

over237:                                          ; preds = %safe236
  tail call void @overflow_fail(i64 1762)
  unreachable

safe238:                                          ; preds = %safe236
  %334 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %332)
  %335 = extractvalue { i64, i1 } %334, 0
  %336 = extractvalue { i64, i1 } %334, 1
  br i1 %336, label %over239, label %safe240

over239:                                          ; preds = %safe238
  tail call void @overflow_fail(i64 1756)
  unreachable

safe240:                                          ; preds = %safe238
  %337 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %335)
  %338 = extractvalue { i64, i1 } %337, 0
  %339 = extractvalue { i64, i1 } %337, 1
  br i1 %339, label %over241, label %safe242

over241:                                          ; preds = %safe240
  tail call void @overflow_fail(i64 1750)
  unreachable

safe242:                                          ; preds = %safe240
  %340 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %338)
  %341 = extractvalue { i64, i1 } %340, 0
  %342 = extractvalue { i64, i1 } %340, 1
  br i1 %342, label %over243, label %safe244

over243:                                          ; preds = %safe242
  tail call void @overflow_fail(i64 1744)
  unreachable

safe244:                                          ; preds = %safe242
  %343 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %341)
  %344 = extractvalue { i64, i1 } %343, 0
  %345 = extractvalue { i64, i1 } %343, 1
  br i1 %345, label %over245, label %safe246

over245:                                          ; preds = %safe244
  tail call void @overflow_fail(i64 1738)
  unreachable

safe246:                                          ; preds = %safe244
  %346 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %344)
  %347 = extractvalue { i64, i1 } %346, 0
  %348 = extractvalue { i64, i1 } %346, 1
  br i1 %348, label %over247, label %safe248

over247:                                          ; preds = %safe246
  tail call void @overflow_fail(i64 1732)
  unreachable

safe248:                                          ; preds = %safe246
  %349 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %347)
  %350 = extractvalue { i64, i1 } %349, 0
  %351 = extractvalue { i64, i1 } %349, 1
  br i1 %351, label %over249, label %safe250

over249:                                          ; preds = %safe248
  tail call void @overflow_fail(i64 1726)
  unreachable

safe250:                                          ; preds = %safe248
  br label %afterIf222

thenIf251:                                        ; preds = %elseIf221
  %352 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %353 = extractvalue { i64, i1 } %352, 0
  %354 = extractvalue { i64, i1 } %352, 1
  br i1 %354, label %over254, label %safe255

elseIf252:                                        ; preds = %elseIf221
  %355 = icmp eq i64 %0, 17
  br i1 %355, label %thenIf284, label %elseIf285

afterIf253:                                       ; preds = %afterIf286, %safe283
  %356 = phi i64 [ %397, %safe283 ], [ %403, %afterIf286 ]
  br label %afterIf222

over254:                                          ; preds = %thenIf251
  tail call void @overflow_fail(i64 2034)
  unreachable

safe255:                                          ; preds = %thenIf251
  %357 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %353)
  %358 = extractvalue { i64, i1 } %357, 0
  %359 = extractvalue { i64, i1 } %357, 1
  br i1 %359, label %over256, label %safe257

over256:                                          ; preds = %safe255
  tail call void @overflow_fail(i64 2029)
  unreachable

safe257:                                          ; preds = %safe255
  %360 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %358)
  %361 = extractvalue { i64, i1 } %360, 0
  %362 = extractvalue { i64, i1 } %360, 1
  br i1 %362, label %over258, label %safe259

over258:                                          ; preds = %safe257
  tail call void @overflow_fail(i64 2024)
  unreachable

safe259:                                          ; preds = %safe257
  %363 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %361)
  %364 = extractvalue { i64, i1 } %363, 0
  %365 = extractvalue { i64, i1 } %363, 1
  br i1 %365, label %over260, label %safe261

over260:                                          ; preds = %safe259
  tail call void @overflow_fail(i64 2019)
  unreachable

safe261:                                          ; preds = %safe259
  %366 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %364)
  %367 = extractvalue { i64, i1 } %366, 0
  %368 = extractvalue { i64, i1 } %366, 1
  br i1 %368, label %over262, label %safe263

over262:                                          ; preds = %safe261
  tail call void @overflow_fail(i64 2014)
  unreachable

safe263:                                          ; preds = %safe261
  %369 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %367)
  %370 = extractvalue { i64, i1 } %369, 0
  %371 = extractvalue { i64, i1 } %369, 1
  br i1 %371, label %over264, label %safe265

over264:                                          ; preds = %safe263
  tail call void @overflow_fail(i64 2009)
  unreachable

safe265:                                          ; preds = %safe263
  %372 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %370)
  %373 = extractvalue { i64, i1 } %372, 0
  %374 = extractvalue { i64, i1 } %372, 1
  br i1 %374, label %over266, label %safe267

over266:                                          ; preds = %safe265
  tail call void @overflow_fail(i64 2004)
  unreachable

safe267:                                          ; preds = %safe265
  %375 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %373)
  %376 = extractvalue { i64, i1 } %375, 0
  %377 = extractvalue { i64, i1 } %375, 1
  br i1 %377, label %over268, label %safe269

over268:                                          ; preds = %safe267
  tail call void @overflow_fail(i64 1999)
  unreachable

safe269:                                          ; preds = %safe267
  %378 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %376)
  %379 = extractvalue { i64, i1 } %378, 0
  %380 = extractvalue { i64, i1 } %378, 1
  br i1 %380, label %over270, label %safe271

over270:                                          ; preds = %safe269
  tail call void @overflow_fail(i64 1993)
  unreachable

safe271:                                          ; preds = %safe269
  %381 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %379)
  %382 = extractvalue { i64, i1 } %381, 0
  %383 = extractvalue { i64, i1 } %381, 1
  br i1 %383, label %over272, label %safe273

over272:                                          ; preds = %safe271
  tail call void @overflow_fail(i64 1987)
  unreachable

safe273:                                          ; preds = %safe271
  %384 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %382)
  %385 = extractvalue { i64, i1 } %384, 0
  %386 = extractvalue { i64, i1 } %384, 1
  br i1 %386, label %over274, label %safe275

over274:                                          ; preds = %safe273
  tail call void @overflow_fail(i64 1981)
  unreachable

safe275:                                          ; preds = %safe273
  %387 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %385)
  %388 = extractvalue { i64, i1 } %387, 0
  %389 = extractvalue { i64, i1 } %387, 1
  br i1 %389, label %over276, label %safe277

over276:                                          ; preds = %safe275
  tail call void @overflow_fail(i64 1975)
  unreachable

safe277:                                          ; preds = %safe275
  %390 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %388)
  %391 = extractvalue { i64, i1 } %390, 0
  %392 = extractvalue { i64, i1 } %390, 1
  br i1 %392, label %over278, label %safe279

over278:                                          ; preds = %safe277
  tail call void @overflow_fail(i64 1969)
  unreachable

safe279:                                          ; preds = %safe277
  %393 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %391)
  %394 = extractvalue { i64, i1 } %393, 0
  %395 = extractvalue { i64, i1 } %393, 1
  br i1 %395, label %over280, label %safe281

over280:                                          ; preds = %safe279
  tail call void @overflow_fail(i64 1963)
  unreachable

safe281:                                          ; preds = %safe279
  %396 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %394)
  %397 = extractvalue { i64, i1 } %396, 0
  %398 = extractvalue { i64, i1 } %396, 1
  br i1 %398, label %over282, label %safe283

over282:                                          ; preds = %safe281
  tail call void @overflow_fail(i64 1957)
  unreachable

safe283:                                          ; preds = %safe281
  br label %afterIf253

thenIf284:                                        ; preds = %elseIf252
  %399 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %400 = extractvalue { i64, i1 } %399, 0
  %401 = extractvalue { i64, i1 } %399, 1
  br i1 %401, label %over287, label %safe288

elseIf285:                                        ; preds = %elseIf252
  %402 = icmp eq i64 %0, 18
  br i1 %402, label %thenIf319, label %elseIf320

afterIf286:                                       ; preds = %afterIf321, %safe318
  %403 = phi i64 [ %447, %safe318 ], [ %453, %afterIf321 ]
  br label %afterIf253

over287:                                          ; preds = %thenIf284
  tail call void @overflow_fail(i64 2286)
  unreachable

safe288:                                          ; preds = %thenIf284
  %404 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %400)
  %405 = extractvalue { i64, i1 } %404, 0
  %406 = extractvalue { i64, i1 } %404, 1
  br i1 %406, label %over289, label %safe290

over289:                                          ; preds = %safe288
  tail call void @overflow_fail(i64 2281)
  unreachable

safe290:                                          ; preds = %safe288
  %407 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %405)
  %408 = extractvalue { i64, i1 } %407, 0
  %409 = extractvalue { i64, i1 } %407, 1
  br i1 %409, label %over291, label %safe292

over291:                                          ; preds = %safe290
  tail call void @overflow_fail(i64 2276)
  unreachable

safe292:                                          ; preds = %safe290
  %410 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %408)
  %411 = extractvalue { i64, i1 } %410, 0
  %412 = extractvalue { i64, i1 } %410, 1
  br i1 %412, label %over293, label %safe294

over293:                                          ; preds = %safe292
  tail call void @overflow_fail(i64 2271)
  unreachable

safe294:                                          ; preds = %safe292
  %413 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %411)
  %414 = extractvalue { i64, i1 } %413, 0
  %415 = extractvalue { i64, i1 } %413, 1
  br i1 %415, label %over295, label %safe296

over295:                                          ; preds = %safe294
  tail call void @overflow_fail(i64 2266)
  unreachable

safe296:                                          ; preds = %safe294
  %416 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %414)
  %417 = extractvalue { i64, i1 } %416, 0
  %418 = extractvalue { i64, i1 } %416, 1
  br i1 %418, label %over297, label %safe298

over297:                                          ; preds = %safe296
  tail call void @overflow_fail(i64 2261)
  unreachable

safe298:                                          ; preds = %safe296
  %419 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %417)
  %420 = extractvalue { i64, i1 } %419, 0
  %421 = extractvalue { i64, i1 } %419, 1
  br i1 %421, label %over299, label %safe300

over299:                                          ; preds = %safe298
  tail call void @overflow_fail(i64 2256)
  unreachable

safe300:                                          ; preds = %safe298
  %422 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %420)
  %423 = extractvalue { i64, i1 } %422, 0
  %424 = extractvalue { i64, i1 } %422, 1
  br i1 %424, label %over301, label %safe302

over301:                                          ; preds = %safe300
  tail call void @overflow_fail(i64 2251)
  unreachable

safe302:                                          ; preds = %safe300
  %425 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %423)
  %426 = extractvalue { i64, i1 } %425, 0
  %427 = extractvalue { i64, i1 } %425, 1
  br i1 %427, label %over303, label %safe304

over303:                                          ; preds = %safe302
  tail call void @overflow_fail(i64 2245)
  unreachable

safe304:                                          ; preds = %safe302
  %428 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %426)
  %429 = extractvalue { i64, i1 } %428, 0
  %430 = extractvalue { i64, i1 } %428, 1
  br i1 %430, label %over305, label %safe306

over305:                                          ; preds = %safe304
  tail call void @overflow_fail(i64 2239)
  unreachable

safe306:                                          ; preds = %safe304
  %431 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %429)
  %432 = extractvalue { i64, i1 } %431, 0
  %433 = extractvalue { i64, i1 } %431, 1
  br i1 %433, label %over307, label %safe308

over307:                                          ; preds = %safe306
  tail call void @overflow_fail(i64 2233)
  unreachable

safe308:                                          ; preds = %safe306
  %434 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %432)
  %435 = extractvalue { i64, i1 } %434, 0
  %436 = extractvalue { i64, i1 } %434, 1
  br i1 %436, label %over309, label %safe310

over309:                                          ; preds = %safe308
  tail call void @overflow_fail(i64 2227)
  unreachable

safe310:                                          ; preds = %safe308
  %437 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %435)
  %438 = extractvalue { i64, i1 } %437, 0
  %439 = extractvalue { i64, i1 } %437, 1
  br i1 %439, label %over311, label %safe312

over311:                                          ; preds = %safe310
  tail call void @overflow_fail(i64 2221)
  unreachable

safe312:                                          ; preds = %safe310
  %440 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %438)
  %441 = extractvalue { i64, i1 } %440, 0
  %442 = extractvalue { i64, i1 } %440, 1
  br i1 %442, label %over313, label %safe314

over313:                                          ; preds = %safe312
  tail call void @overflow_fail(i64 2215)
  unreachable

safe314:                                          ; preds = %safe312
  %443 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %441)
  %444 = extractvalue { i64, i1 } %443, 0
  %445 = extractvalue { i64, i1 } %443, 1
  br i1 %445, label %over315, label %safe316

over315:                                          ; preds = %safe314
  tail call void @overflow_fail(i64 2209)
  unreachable

safe316:                                          ; preds = %safe314
  %446 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %444)
  %447 = extractvalue { i64, i1 } %446, 0
  %448 = extractvalue { i64, i1 } %446, 1
  br i1 %448, label %over317, label %safe318

over317:                                          ; preds = %safe316
  tail call void @overflow_fail(i64 2203)
  unreachable

safe318:                                          ; preds = %safe316
  br label %afterIf286

thenIf319:                                        ; preds = %elseIf285
  %449 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %450 = extractvalue { i64, i1 } %449, 0
  %451 = extractvalue { i64, i1 } %449, 1
  br i1 %451, label %over322, label %safe323

elseIf320:                                        ; preds = %elseIf285
  %452 = icmp eq i64 %0, 19
  br i1 %452, label %thenIf356, label %elseIf357

afterIf321:                                       ; preds = %afterIf358, %safe355
  %453 = phi i64 [ %500, %safe355 ], [ %506, %afterIf358 ]
  br label %afterIf286

over322:                                          ; preds = %thenIf319
  tail call void @overflow_fail(i64 2553)
  unreachable

safe323:                                          ; preds = %thenIf319
  %454 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %450)
  %455 = extractvalue { i64, i1 } %454, 0
  %456 = extractvalue { i64, i1 } %454, 1
  br i1 %456, label %over324, label %safe325

over324:                                          ; preds = %safe323
  tail call void @overflow_fail(i64 2548)
  unreachable

safe325:                                          ; preds = %safe323
  %457 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %455)
  %458 = extractvalue { i64, i1 } %457, 0
  %459 = extractvalue { i64, i1 } %457, 1
  br i1 %459, label %over326, label %safe327

over326:                                          ; preds = %safe325
  tail call void @overflow_fail(i64 2543)
  unreachable

safe327:                                          ; preds = %safe325
  %460 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %458)
  %461 = extractvalue { i64, i1 } %460, 0
  %462 = extractvalue { i64, i1 } %460, 1
  br i1 %462, label %over328, label %safe329

over328:                                          ; preds = %safe327
  tail call void @overflow_fail(i64 2538)
  unreachable

safe329:                                          ; preds = %safe327
  %463 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %461)
  %464 = extractvalue { i64, i1 } %463, 0
  %465 = extractvalue { i64, i1 } %463, 1
  br i1 %465, label %over330, label %safe331

over330:                                          ; preds = %safe329
  tail call void @overflow_fail(i64 2533)
  unreachable

safe331:                                          ; preds = %safe329
  %466 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %464)
  %467 = extractvalue { i64, i1 } %466, 0
  %468 = extractvalue { i64, i1 } %466, 1
  br i1 %468, label %over332, label %safe333

over332:                                          ; preds = %safe331
  tail call void @overflow_fail(i64 2528)
  unreachable

safe333:                                          ; preds = %safe331
  %469 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %467)
  %470 = extractvalue { i64, i1 } %469, 0
  %471 = extractvalue { i64, i1 } %469, 1
  br i1 %471, label %over334, label %safe335

over334:                                          ; preds = %safe333
  tail call void @overflow_fail(i64 2523)
  unreachable

safe335:                                          ; preds = %safe333
  %472 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %470)
  %473 = extractvalue { i64, i1 } %472, 0
  %474 = extractvalue { i64, i1 } %472, 1
  br i1 %474, label %over336, label %safe337

over336:                                          ; preds = %safe335
  tail call void @overflow_fail(i64 2518)
  unreachable

safe337:                                          ; preds = %safe335
  %475 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %473)
  %476 = extractvalue { i64, i1 } %475, 0
  %477 = extractvalue { i64, i1 } %475, 1
  br i1 %477, label %over338, label %safe339

over338:                                          ; preds = %safe337
  tail call void @overflow_fail(i64 2512)
  unreachable

safe339:                                          ; preds = %safe337
  %478 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %476)
  %479 = extractvalue { i64, i1 } %478, 0
  %480 = extractvalue { i64, i1 } %478, 1
  br i1 %480, label %over340, label %safe341

over340:                                          ; preds = %safe339
  tail call void @overflow_fail(i64 2506)
  unreachable

safe341:                                          ; preds = %safe339
  %481 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %479)
  %482 = extractvalue { i64, i1 } %481, 0
  %483 = extractvalue { i64, i1 } %481, 1
  br i1 %483, label %over342, label %safe343

over342:                                          ; preds = %safe341
  tail call void @overflow_fail(i64 2500)
  unreachable

safe343:                                          ; preds = %safe341
  %484 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %482)
  %485 = extractvalue { i64, i1 } %484, 0
  %486 = extractvalue { i64, i1 } %484, 1
  br i1 %486, label %over344, label %safe345

over344:                                          ; preds = %safe343
  tail call void @overflow_fail(i64 2494)
  unreachable

safe345:                                          ; preds = %safe343
  %487 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %485)
  %488 = extractvalue { i64, i1 } %487, 0
  %489 = extractvalue { i64, i1 } %487, 1
  br i1 %489, label %over346, label %safe347

over346:                                          ; preds = %safe345
  tail call void @overflow_fail(i64 2488)
  unreachable

safe347:                                          ; preds = %safe345
  %490 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %488)
  %491 = extractvalue { i64, i1 } %490, 0
  %492 = extractvalue { i64, i1 } %490, 1
  br i1 %492, label %over348, label %safe349

over348:                                          ; preds = %safe347
  tail call void @overflow_fail(i64 2482)
  unreachable

safe349:                                          ; preds = %safe347
  %493 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %491)
  %494 = extractvalue { i64, i1 } %493, 0
  %495 = extractvalue { i64, i1 } %493, 1
  br i1 %495, label %over350, label %safe351

over350:                                          ; preds = %safe349
  tail call void @overflow_fail(i64 2476)
  unreachable

safe351:                                          ; preds = %safe349
  %496 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %494)
  %497 = extractvalue { i64, i1 } %496, 0
  %498 = extractvalue { i64, i1 } %496, 1
  br i1 %498, label %over352, label %safe353

over352:                                          ; preds = %safe351
  tail call void @overflow_fail(i64 2470)
  unreachable

safe353:                                          ; preds = %safe351
  %499 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %497)
  %500 = extractvalue { i64, i1 } %499, 0
  %501 = extractvalue { i64, i1 } %499, 1
  br i1 %501, label %over354, label %safe355

over354:                                          ; preds = %safe353
  tail call void @overflow_fail(i64 2464)
  unreachable

safe355:                                          ; preds = %safe353
  br label %afterIf321

thenIf356:                                        ; preds = %elseIf320
  %502 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %503 = extractvalue { i64, i1 } %502, 0
  %504 = extractvalue { i64, i1 } %502, 1
  br i1 %504, label %over359, label %safe360

elseIf357:                                        ; preds = %elseIf320
  %505 = icmp eq i64 %0, 20
  br i1 %505, label %thenIf395, label %elseIf396

afterIf358:                                       ; preds = %afterIf397, %safe394
  %506 = phi i64 [ %556, %safe394 ], [ %561, %afterIf397 ]
  br label %afterIf321

over359:                                          ; preds = %thenIf356
  tail call void @overflow_fail(i64 2835)
  unreachable

safe360:                                          ; preds = %thenIf356
  %507 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %503)
  %508 = extractvalue { i64, i1 } %507, 0
  %509 = extractvalue { i64, i1 } %507, 1
  br i1 %509, label %over361, label %safe362

over361:                                          ; preds = %safe360
  tail call void @overflow_fail(i64 2830)
  unreachable

safe362:                                          ; preds = %safe360
  %510 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %508)
  %511 = extractvalue { i64, i1 } %510, 0
  %512 = extractvalue { i64, i1 } %510, 1
  br i1 %512, label %over363, label %safe364

over363:                                          ; preds = %safe362
  tail call void @overflow_fail(i64 2825)
  unreachable

safe364:                                          ; preds = %safe362
  %513 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %511)
  %514 = extractvalue { i64, i1 } %513, 0
  %515 = extractvalue { i64, i1 } %513, 1
  br i1 %515, label %over365, label %safe366

over365:                                          ; preds = %safe364
  tail call void @overflow_fail(i64 2820)
  unreachable

safe366:                                          ; preds = %safe364
  %516 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %514)
  %517 = extractvalue { i64, i1 } %516, 0
  %518 = extractvalue { i64, i1 } %516, 1
  br i1 %518, label %over367, label %safe368

over367:                                          ; preds = %safe366
  tail call void @overflow_fail(i64 2815)
  unreachable

safe368:                                          ; preds = %safe366
  %519 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %517)
  %520 = extractvalue { i64, i1 } %519, 0
  %521 = extractvalue { i64, i1 } %519, 1
  br i1 %521, label %over369, label %safe370

over369:                                          ; preds = %safe368
  tail call void @overflow_fail(i64 2810)
  unreachable

safe370:                                          ; preds = %safe368
  %522 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %520)
  %523 = extractvalue { i64, i1 } %522, 0
  %524 = extractvalue { i64, i1 } %522, 1
  br i1 %524, label %over371, label %safe372

over371:                                          ; preds = %safe370
  tail call void @overflow_fail(i64 2805)
  unreachable

safe372:                                          ; preds = %safe370
  %525 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %523)
  %526 = extractvalue { i64, i1 } %525, 0
  %527 = extractvalue { i64, i1 } %525, 1
  br i1 %527, label %over373, label %safe374

over373:                                          ; preds = %safe372
  tail call void @overflow_fail(i64 2800)
  unreachable

safe374:                                          ; preds = %safe372
  %528 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %526)
  %529 = extractvalue { i64, i1 } %528, 0
  %530 = extractvalue { i64, i1 } %528, 1
  br i1 %530, label %over375, label %safe376

over375:                                          ; preds = %safe374
  tail call void @overflow_fail(i64 2794)
  unreachable

safe376:                                          ; preds = %safe374
  %531 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %529)
  %532 = extractvalue { i64, i1 } %531, 0
  %533 = extractvalue { i64, i1 } %531, 1
  br i1 %533, label %over377, label %safe378

over377:                                          ; preds = %safe376
  tail call void @overflow_fail(i64 2788)
  unreachable

safe378:                                          ; preds = %safe376
  %534 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %532)
  %535 = extractvalue { i64, i1 } %534, 0
  %536 = extractvalue { i64, i1 } %534, 1
  br i1 %536, label %over379, label %safe380

over379:                                          ; preds = %safe378
  tail call void @overflow_fail(i64 2782)
  unreachable

safe380:                                          ; preds = %safe378
  %537 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %535)
  %538 = extractvalue { i64, i1 } %537, 0
  %539 = extractvalue { i64, i1 } %537, 1
  br i1 %539, label %over381, label %safe382

over381:                                          ; preds = %safe380
  tail call void @overflow_fail(i64 2776)
  unreachable

safe382:                                          ; preds = %safe380
  %540 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %538)
  %541 = extractvalue { i64, i1 } %540, 0
  %542 = extractvalue { i64, i1 } %540, 1
  br i1 %542, label %over383, label %safe384

over383:                                          ; preds = %safe382
  tail call void @overflow_fail(i64 2770)
  unreachable

safe384:                                          ; preds = %safe382
  %543 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %541)
  %544 = extractvalue { i64, i1 } %543, 0
  %545 = extractvalue { i64, i1 } %543, 1
  br i1 %545, label %over385, label %safe386

over385:                                          ; preds = %safe384
  tail call void @overflow_fail(i64 2764)
  unreachable

safe386:                                          ; preds = %safe384
  %546 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %544)
  %547 = extractvalue { i64, i1 } %546, 0
  %548 = extractvalue { i64, i1 } %546, 1
  br i1 %548, label %over387, label %safe388

over387:                                          ; preds = %safe386
  tail call void @overflow_fail(i64 2758)
  unreachable

safe388:                                          ; preds = %safe386
  %549 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %547)
  %550 = extractvalue { i64, i1 } %549, 0
  %551 = extractvalue { i64, i1 } %549, 1
  br i1 %551, label %over389, label %safe390

over389:                                          ; preds = %safe388
  tail call void @overflow_fail(i64 2752)
  unreachable

safe390:                                          ; preds = %safe388
  %552 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %550)
  %553 = extractvalue { i64, i1 } %552, 0
  %554 = extractvalue { i64, i1 } %552, 1
  br i1 %554, label %over391, label %safe392

over391:                                          ; preds = %safe390
  tail call void @overflow_fail(i64 2746)
  unreachable

safe392:                                          ; preds = %safe390
  %555 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 19, i64 %553)
  %556 = extractvalue { i64, i1 } %555, 0
  %557 = extractvalue { i64, i1 } %555, 1
  br i1 %557, label %over393, label %safe394

over393:                                          ; preds = %safe392
  tail call void @overflow_fail(i64 2740)
  unreachable

safe394:                                          ; preds = %safe392
  br label %afterIf358

thenIf395:                                        ; preds = %elseIf357
  %558 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 2, i64 1)
  %559 = extractvalue { i64, i1 } %558, 0
  %560 = extractvalue { i64, i1 } %558, 1
  br i1 %560, label %over398, label %safe399

elseIf396:                                        ; preds = %elseIf357
  br label %afterIf397

afterIf397:                                       ; preds = %elseIf396, %safe435
  %561 = phi i64 [ %614, %safe435 ], [ -1, %elseIf396 ]
  br label %afterIf358

over398:                                          ; preds = %thenIf395
  tail call void @overflow_fail(i64 3132)
  unreachable

safe399:                                          ; preds = %thenIf395
  %562 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 3, i64 %559)
  %563 = extractvalue { i64, i1 } %562, 0
  %564 = extractvalue { i64, i1 } %562, 1
  br i1 %564, label %over400, label %safe401

over400:                                          ; preds = %safe399
  tail call void @overflow_fail(i64 3127)
  unreachable

safe401:                                          ; preds = %safe399
  %565 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 %563)
  %566 = extractvalue { i64, i1 } %565, 0
  %567 = extractvalue { i64, i1 } %565, 1
  br i1 %567, label %over402, label %safe403

over402:                                          ; preds = %safe401
  tail call void @overflow_fail(i64 3122)
  unreachable

safe403:                                          ; preds = %safe401
  %568 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 5, i64 %566)
  %569 = extractvalue { i64, i1 } %568, 0
  %570 = extractvalue { i64, i1 } %568, 1
  br i1 %570, label %over404, label %safe405

over404:                                          ; preds = %safe403
  tail call void @overflow_fail(i64 3117)
  unreachable

safe405:                                          ; preds = %safe403
  %571 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 6, i64 %569)
  %572 = extractvalue { i64, i1 } %571, 0
  %573 = extractvalue { i64, i1 } %571, 1
  br i1 %573, label %over406, label %safe407

over406:                                          ; preds = %safe405
  tail call void @overflow_fail(i64 3112)
  unreachable

safe407:                                          ; preds = %safe405
  %574 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 7, i64 %572)
  %575 = extractvalue { i64, i1 } %574, 0
  %576 = extractvalue { i64, i1 } %574, 1
  br i1 %576, label %over408, label %safe409

over408:                                          ; preds = %safe407
  tail call void @overflow_fail(i64 3107)
  unreachable

safe409:                                          ; preds = %safe407
  %577 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 8, i64 %575)
  %578 = extractvalue { i64, i1 } %577, 0
  %579 = extractvalue { i64, i1 } %577, 1
  br i1 %579, label %over410, label %safe411

over410:                                          ; preds = %safe409
  tail call void @overflow_fail(i64 3102)
  unreachable

safe411:                                          ; preds = %safe409
  %580 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 9, i64 %578)
  %581 = extractvalue { i64, i1 } %580, 0
  %582 = extractvalue { i64, i1 } %580, 1
  br i1 %582, label %over412, label %safe413

over412:                                          ; preds = %safe411
  tail call void @overflow_fail(i64 3097)
  unreachable

safe413:                                          ; preds = %safe411
  %583 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 10, i64 %581)
  %584 = extractvalue { i64, i1 } %583, 0
  %585 = extractvalue { i64, i1 } %583, 1
  br i1 %585, label %over414, label %safe415

over414:                                          ; preds = %safe413
  tail call void @overflow_fail(i64 3091)
  unreachable

safe415:                                          ; preds = %safe413
  %586 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 11, i64 %584)
  %587 = extractvalue { i64, i1 } %586, 0
  %588 = extractvalue { i64, i1 } %586, 1
  br i1 %588, label %over416, label %safe417

over416:                                          ; preds = %safe415
  tail call void @overflow_fail(i64 3085)
  unreachable

safe417:                                          ; preds = %safe415
  %589 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 12, i64 %587)
  %590 = extractvalue { i64, i1 } %589, 0
  %591 = extractvalue { i64, i1 } %589, 1
  br i1 %591, label %over418, label %safe419

over418:                                          ; preds = %safe417
  tail call void @overflow_fail(i64 3079)
  unreachable

safe419:                                          ; preds = %safe417
  %592 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 13, i64 %590)
  %593 = extractvalue { i64, i1 } %592, 0
  %594 = extractvalue { i64, i1 } %592, 1
  br i1 %594, label %over420, label %safe421

over420:                                          ; preds = %safe419
  tail call void @overflow_fail(i64 3073)
  unreachable

safe421:                                          ; preds = %safe419
  %595 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 14, i64 %593)
  %596 = extractvalue { i64, i1 } %595, 0
  %597 = extractvalue { i64, i1 } %595, 1
  br i1 %597, label %over422, label %safe423

over422:                                          ; preds = %safe421
  tail call void @overflow_fail(i64 3067)
  unreachable

safe423:                                          ; preds = %safe421
  %598 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 15, i64 %596)
  %599 = extractvalue { i64, i1 } %598, 0
  %600 = extractvalue { i64, i1 } %598, 1
  br i1 %600, label %over424, label %safe425

over424:                                          ; preds = %safe423
  tail call void @overflow_fail(i64 3061)
  unreachable

safe425:                                          ; preds = %safe423
  %601 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 16, i64 %599)
  %602 = extractvalue { i64, i1 } %601, 0
  %603 = extractvalue { i64, i1 } %601, 1
  br i1 %603, label %over426, label %safe427

over426:                                          ; preds = %safe425
  tail call void @overflow_fail(i64 3055)
  unreachable

safe427:                                          ; preds = %safe425
  %604 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 17, i64 %602)
  %605 = extractvalue { i64, i1 } %604, 0
  %606 = extractvalue { i64, i1 } %604, 1
  br i1 %606, label %over428, label %safe429

over428:                                          ; preds = %safe427
  tail call void @overflow_fail(i64 3049)
  unreachable

safe429:                                          ; preds = %safe427
  %607 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 18, i64 %605)
  %608 = extractvalue { i64, i1 } %607, 0
  %609 = extractvalue { i64, i1 } %607, 1
  br i1 %609, label %over430, label %safe431

over430:                                          ; preds = %safe429
  tail call void @overflow_fail(i64 3043)
  unreachable

safe431:                                          ; preds = %safe429
  %610 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 19, i64 %608)
  %611 = extractvalue { i64, i1 } %610, 0
  %612 = extractvalue { i64, i1 } %610, 1
  br i1 %612, label %over432, label %safe433

over432:                                          ; preds = %safe431
  tail call void @overflow_fail(i64 3037)
  unreachable

safe433:                                          ; preds = %safe431
  %613 = tail call { i64, i1 } @llvm.smul.with.overflow.i64(i64 20, i64 %611)
  %614 = extractvalue { i64, i1 } %613, 0
  %615 = extractvalue { i64, i1 } %613, 1
  br i1 %615, label %over434, label %safe435

over434:                                          ; preds = %safe433
  tail call void @overflow_fail(i64 3031)
  unreachable

safe435:                                          ; preds = %safe433
  br label %afterIf397
}

attributes #0 = { nounwind readnone }
