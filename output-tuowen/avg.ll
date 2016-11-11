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
  %6 = icmp sle i64 %0, 0
  br i1 %6, label %thenIf, label %elseIf

thenIf:                                           ; preds = %entry
  br label %afterIf

elseIf:                                           ; preds = %entry
  %7 = icmp eq i64 %0, 1
  br i1 %7, label %thenIf1, label %elseIf2

afterIf:                                          ; preds = %afterIf3, %thenIf
  %8 = phi i64 [ 0, %thenIf ], [ %10, %afterIf3 ]
  ret i64 %8

thenIf1:                                          ; preds = %elseIf
  br label %afterIf3

elseIf2:                                          ; preds = %elseIf
  %9 = icmp eq i64 %0, 2
  br i1 %9, label %thenIf4, label %elseIf5

afterIf3:                                         ; preds = %afterIf6, %thenIf1
  %10 = phi i64 [ %1, %thenIf1 ], [ %15, %afterIf6 ]
  br label %afterIf

thenIf4:                                          ; preds = %elseIf2
  %11 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %12 = extractvalue { i64, i1 } %11, 0
  %13 = extractvalue { i64, i1 } %11, 1
  br i1 %13, label %over, label %safe

elseIf5:                                          ; preds = %elseIf2
  %14 = icmp eq i64 %0, 3
  br i1 %14, label %thenIf9, label %elseIf10

afterIf6:                                         ; preds = %afterIf11, %safe8
  %15 = phi i64 [ %21, %safe8 ], [ %26, %afterIf11 ]
  br label %afterIf3

over:                                             ; preds = %thenIf4
  tail call void @overflow_fail(i64 114)
  unreachable

safe:                                             ; preds = %thenIf4
  %16 = icmp eq i64 2, 0
  %17 = icmp eq i64 2, -1
  %18 = icmp eq i64 %12, -9223372036854775808
  %19 = and i1 %18, %17
  %20 = or i1 %16, %19
  br i1 %20, label %over7, label %safe8

over7:                                            ; preds = %safe
  tail call void @overflow_fail(i64 111)
  unreachable

safe8:                                            ; preds = %safe
  %21 = sdiv i64 %12, 2
  br label %afterIf6

thenIf9:                                          ; preds = %elseIf5
  %22 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %2, i64 %3)
  %23 = extractvalue { i64, i1 } %22, 0
  %24 = extractvalue { i64, i1 } %22, 1
  br i1 %24, label %over12, label %safe13

elseIf10:                                         ; preds = %elseIf5
  %25 = icmp eq i64 %0, 4
  br i1 %25, label %thenIf18, label %elseIf19

afterIf11:                                        ; preds = %afterIf20, %safe17
  %26 = phi i64 [ %35, %safe17 ], [ %42, %afterIf20 ]
  br label %afterIf6

over12:                                           ; preds = %thenIf9
  tail call void @overflow_fail(i64 178)
  unreachable

safe13:                                           ; preds = %thenIf9
  %27 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %23)
  %28 = extractvalue { i64, i1 } %27, 0
  %29 = extractvalue { i64, i1 } %27, 1
  br i1 %29, label %over14, label %safe15

over14:                                           ; preds = %safe13
  tail call void @overflow_fail(i64 172)
  unreachable

safe15:                                           ; preds = %safe13
  %30 = icmp eq i64 3, 0
  %31 = icmp eq i64 3, -1
  %32 = icmp eq i64 %28, -9223372036854775808
  %33 = and i1 %32, %31
  %34 = or i1 %30, %33
  br i1 %34, label %over16, label %safe17

over16:                                           ; preds = %safe15
  tail call void @overflow_fail(i64 169)
  unreachable

safe17:                                           ; preds = %safe15
  %35 = sdiv i64 %28, 3
  br label %afterIf11

thenIf18:                                         ; preds = %elseIf10
  %36 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %37 = extractvalue { i64, i1 } %36, 0
  %38 = extractvalue { i64, i1 } %36, 1
  br i1 %38, label %over21, label %safe22

elseIf19:                                         ; preds = %elseIf10
  %39 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %40 = extractvalue { i64, i1 } %39, 0
  %41 = extractvalue { i64, i1 } %39, 1
  br i1 %41, label %over29, label %safe30

afterIf20:                                        ; preds = %safe38, %safe28
  %42 = phi i64 [ %54, %safe28 ], [ %69, %safe38 ]
  br label %afterIf11

over21:                                           ; preds = %thenIf18
  tail call void @overflow_fail(i64 248)
  unreachable

safe22:                                           ; preds = %thenIf18
  %43 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %4)
  %44 = extractvalue { i64, i1 } %43, 0
  %45 = extractvalue { i64, i1 } %43, 1
  br i1 %45, label %over23, label %safe24

over23:                                           ; preds = %safe22
  tail call void @overflow_fail(i64 258)
  unreachable

safe24:                                           ; preds = %safe22
  %46 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %37, i64 %44)
  %47 = extractvalue { i64, i1 } %46, 0
  %48 = extractvalue { i64, i1 } %46, 1
  br i1 %48, label %over25, label %safe26

over25:                                           ; preds = %safe24
  tail call void @overflow_fail(i64 245)
  unreachable

safe26:                                           ; preds = %safe24
  %49 = icmp eq i64 4, 0
  %50 = icmp eq i64 4, -1
  %51 = icmp eq i64 %47, -9223372036854775808
  %52 = and i1 %51, %50
  %53 = or i1 %49, %52
  br i1 %53, label %over27, label %safe28

over27:                                           ; preds = %safe26
  tail call void @overflow_fail(i64 242)
  unreachable

safe28:                                           ; preds = %safe26
  %54 = sdiv i64 %47, 4
  br label %afterIf20

over29:                                           ; preds = %elseIf19
  tail call void @overflow_fail(i64 301)
  unreachable

safe30:                                           ; preds = %elseIf19
  %55 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %4)
  %56 = extractvalue { i64, i1 } %55, 0
  %57 = extractvalue { i64, i1 } %55, 1
  br i1 %57, label %over31, label %safe32

over31:                                           ; preds = %safe30
  tail call void @overflow_fail(i64 311)
  unreachable

safe32:                                           ; preds = %safe30
  %58 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %40, i64 %56)
  %59 = extractvalue { i64, i1 } %58, 0
  %60 = extractvalue { i64, i1 } %58, 1
  br i1 %60, label %over33, label %safe34

over33:                                           ; preds = %safe32
  tail call void @overflow_fail(i64 298)
  unreachable

safe34:                                           ; preds = %safe32
  %61 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %59, i64 %5)
  %62 = extractvalue { i64, i1 } %61, 0
  %63 = extractvalue { i64, i1 } %61, 1
  br i1 %63, label %over35, label %safe36

over35:                                           ; preds = %safe34
  tail call void @overflow_fail(i64 295)
  unreachable

safe36:                                           ; preds = %safe34
  %64 = icmp eq i64 5, 0
  %65 = icmp eq i64 5, -1
  %66 = icmp eq i64 %62, -9223372036854775808
  %67 = and i1 %66, %65
  %68 = or i1 %64, %67
  br i1 %68, label %over37, label %safe38

over37:                                           ; preds = %safe36
  tail call void @overflow_fail(i64 292)
  unreachable

safe38:                                           ; preds = %safe36
  %69 = sdiv i64 %62, 5
  br label %afterIf20
}

attributes #0 = { nounwind readnone }
