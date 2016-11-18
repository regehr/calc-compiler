# Analysis of LLVM's optimizer
Consider a below program written in [calc language](https://utah.instructure.com/courses/377698/assignments/3420338 "Calc Language Grammer"). I have a [parser](https://github.com/gurupragaash/calc-compiler/blob/master/calcc.cpp "Calc Parser") which parses this program and converts it to a [LLVM IR](http://llvm.org/docs/LangRef.html "LLVM Language Ref"). We then run LLVM optimizer(`opt -O2 -print-after-all <llvm ir>`) over the IR, which runs the optimizer over the IR and prints the IR after each optimization. We then look into the optimization passes which make changes to the IR, find what changes are done and analyse how they were done.
```llvm
# ARGS 3 4 8 12
# RESULT 8
(if (<= a0 0)
  0
  (if (== a0 1)
    a1
    (if (== a0 2)
      (/ (+ a1 a2) 2)
      (if (== a0 3)
        (/ (+ a1 (+ a2 a3)) 3)
        (if (== a0 4)
          (/ (+ (+ a1 a2) (+ a3 a4)) 4)
          (/ (+ (+ (+ a1 a2) (+ a3 a4)) a5) 5))))))
```

### Unoptimized Code
Before running the optimizer the llvm intermediate output for the above program is 

```llvm
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
  %lethan = icmp sle i64 %0, 0
  br i1 %lethan, label %merge59, label %else
else:                                             ; preds = %entry
  switch i64 %0, label %else37 [
    i64 1, label %merge59
    i64 2, label %then4
    i64 3, label %then12
    i64 4, label %then24
  ]
then4:                                            ; preds = %else
  %6 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %then5, label %else6
then5:                                            ; preds = %then4
  %calltrap = call i64 @overflow_fail(i64 114)
  br label %else6
else6:                                            ; preds = %then5, %then4
  %9 = call { i64, i1 } @sdiv_with_overflow(i64 %7, i64 2)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %then7, label %merge59
then7:                                            ; preds = %else6
  %calltrap8 = call i64 @overflow_fail(i64 111)
  br label %merge59
then12:                                           ; preds = %else
  %12 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %2, i64 %3)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  br i1 %14, label %then13, label %else15
then13:                                           ; preds = %then12
  %calltrap14 = call i64 @overflow_fail(i64 178)
  br label %else15
else15:                                           ; preds = %then13, %then12
  %15 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %13)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %then16, label %else18
then16:                                           ; preds = %else15
  %calltrap17 = call i64 @overflow_fail(i64 172)
  br label %else18
else18:                                           ; preds = %then16, %else15
  %18 = call { i64, i1 } @sdiv_with_overflow(i64 %16, i64 3)
  %19 = extractvalue { i64, i1 } %18, 0
  %20 = extractvalue { i64, i1 } %18, 1
  br i1 %20, label %then19, label %merge59
then19:                                           ; preds = %else18
  %calltrap20 = call i64 @overflow_fail(i64 169)
  br label %merge59
then24:                                           ; preds = %else
  %21 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %22 = extractvalue { i64, i1 } %21, 0
  %23 = extractvalue { i64, i1 } %21, 1
  br i1 %23, label %then25, label %else27
then25:                                           ; preds = %then24
  %calltrap26 = call i64 @overflow_fail(i64 248)
  br label %else27
else27:                                           ; preds = %then25, %then24
  %24 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %4)
  %25 = extractvalue { i64, i1 } %24, 0
  %26 = extractvalue { i64, i1 } %24, 1
  br i1 %26, label %then28, label %else30
then28:                                           ; preds = %else27
  %calltrap29 = call i64 @overflow_fail(i64 258)
  br label %else30
else30:                                           ; preds = %then28, %else27
  %27 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %22, i64 %25)
  %28 = extractvalue { i64, i1 } %27, 0
  %29 = extractvalue { i64, i1 } %27, 1
  br i1 %29, label %then31, label %else33
then31:                                           ; preds = %else30
  %calltrap32 = call i64 @overflow_fail(i64 245)
  br label %else33
else33:                                           ; preds = %then31, %else30
  %30 = call { i64, i1 } @sdiv_with_overflow(i64 %28, i64 4)
  %31 = extractvalue { i64, i1 } %30, 0
  %32 = extractvalue { i64, i1 } %30, 1
  br i1 %32, label %then34, label %merge59
then34:                                           ; preds = %else33
  %calltrap35 = call i64 @overflow_fail(i64 242)
  br label %merge59
else37:                                           ; preds = %else
  %33 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %34 = extractvalue { i64, i1 } %33, 0
  %35 = extractvalue { i64, i1 } %33, 1
  br i1 %35, label %then38, label %else40
then38:                                           ; preds = %else37
  %calltrap39 = call i64 @overflow_fail(i64 301)
  br label %else40
else40:                                           ; preds = %then38, %else37
  %36 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %4)
  %37 = extractvalue { i64, i1 } %36, 0
  %38 = extractvalue { i64, i1 } %36, 1
  br i1 %38, label %then41, label %else43
then41:                                           ; preds = %else40
  %calltrap42 = call i64 @overflow_fail(i64 311)
  br label %else43
else43:                                           ; preds = %then41, %else40
  %39 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %34, i64 %37)
  %40 = extractvalue { i64, i1 } %39, 0
  %41 = extractvalue { i64, i1 } %39, 1
  br i1 %41, label %then44, label %else46
then44:                                           ; preds = %else43
  %calltrap45 = call i64 @overflow_fail(i64 298)
  br label %else46
else46:                                           ; preds = %then44, %else43
  %42 = call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %40, i64 %5)
  %43 = extractvalue { i64, i1 } %42, 0
  %44 = extractvalue { i64, i1 } %42, 1
  br i1 %44, label %then47, label %else49
then47:                                           ; preds = %else46
  %calltrap48 = call i64 @overflow_fail(i64 295)
  br label %else49
else49:                                           ; preds = %then47, %else46
  %45 = call { i64, i1 } @sdiv_with_overflow(i64 %43, i64 5)
  %46 = extractvalue { i64, i1 } %45, 0
  %47 = extractvalue { i64, i1 } %45, 1
  br i1 %47, label %then50, label %merge59
then50:                                           ; preds = %else49
  %calltrap51 = call i64 @overflow_fail(i64 292)
  br label %merge59
merge59:                                          ; preds = %else, %then19, %else18, %else49, %then50, %else33, %then34, %else6, %then7, %entry
  %phiNode60 = phi i64 [ 0, %entry ], [ %1, %else ], [ %10, %then7 ], [ %10, %else6 ], [ %19, %then19 ], [ %19, %else18 ], [ %31, %then34 ], [ %31, %else33 ], [ %46, %then50 ], [ %46, %else49 ]
  ret i64 %phiNode60
}

define internal { i64, i1 } @sdiv_with_overflow(i64, i64) {
entry:
  %2 = icmp eq i64 %0, -9223372036854775808
  %3 = icmp eq i64 %1, -1
  %"oper1 == INT_MIN and oper2 == -1" = and i1 %2, %3
  %4 = icmp eq i64 %1, 0
  %"or oper2 == 0" = or i1 %"oper1 == INT_MIN and oper2 == -1", %4
  br i1 %"or oper2 == 0", label %then, label %else
then:                                             ; preds = %entry
  %5 = insertvalue { i64, i1 } undef, i64 0, 0
  %6 = insertvalue { i64, i1 } %5, i1 %"or oper2 == 0", 1
  ret { i64, i1 } %6
else:                                             ; preds = %entry
  %divtmp = sdiv i64 %0, %1
  %7 = insertvalue { i64, i1 } undef, i64 %divtmp, 0
  %8 = insertvalue { i64, i1 } %7, i1 %"or oper2 == 0", 1
  ret { i64, i1 } %8
}
```
Now lets run the optimizer and look into the changes done by optimizer after each stage

## [Simpify the CFG](http://llvm.org/docs/Passes.html#simplifycfg-simplify-the-cfg "-simplifycfg")

This pass removes all the basic blocks with unconditional branches. So if there is block A which contains just a jump to another block B, then block A is removed. For example in C terms,
```c
int mod(int x) {
  if (x < 0)
    goto NEGATIVE;
  else if (x == 0)
    goto ZERO;
  else 
    goto POSITIVE;
  ZERO:
    goto POSITIVE;
  POSITIVE:
    return x;
  NEGATIVE:
    return -x;
}
```
Here the ZERO block just jumps to POSITIVE block. So this can be optimized to 
```c
int mod(int x) {
  if (x < 0)
    goto NEGATIVE;
  else if (x == 0)
    goto POSITIVE;
  else 
    goto POSITIVE;
  POSITIVE:
    return x;
  NEGATIVE:
    return -x;
}
``` 
In our example
```llvm
else49:                                           ; preds = %then47, %else46
  %45 = call { i64, i1 } @sdiv_with_overflow(i64 %43, i64 5)
  %46 = extractvalue { i64, i1 } %45, 0
  %47 = extractvalue { i64, i1 } %45, 1
  br i1 %47, label %then50, label %else52

then50:                                           ; preds = %else49
  %calltrap51 = call i64 @overflow_fail(i64 292)
  br label %else52

else52:                                           ; preds = %then50, %else49
  br label %merge

merge:                                            ; preds = %else52, %else36
  %phiNode = phi i64 [ %31, %else36 ], [ %46, %else52 ]
  br label %merge53
```
can be changed to 
```llvm
else49:                                           ; preds = %then47, %else46
  %45 = call { i64, i1 } @sdiv_with_overflow(i64 %43, i64 5)
  %46 = extractvalue { i64, i1 } %45, 0
  %47 = extractvalue { i64, i1 } %45, 1
  br i1 %47, label %then50, label %merge
then50:                                           ; preds = %else49
  %calltrap51 = call i64 @overflow_fail(i64 292)
  br label %merge
merge:                                            ; preds = %else49, %else50, %else36
  %phiNode = phi i64 [ %31, %else36 ], [ %46, %else49], [ %46, %then50]
  br label %merge53
```
The optimizer does similar processing for all the blocks and finally merges the multiple phi nodes of same variable into one, since a phi node can take any number of input nodes. A phi node is like a multiplexer. Like how the multiplexer can decide which input to take, based on the value of selector, the phi node can take its value from any of its input based on how this phi node was reached at run time. In our example if the phi node of merge block was reached from else36 block, it will take value in %31 register, else it will take value from %46 register.

## [Scalar Replacement of Aggregates](http://llvm.org/docs/Passes.html#sroa-scalar-replacement-of-aggregates "-sroa") 
If a variable is defined and not used, then the variable is removed. In C terms, removing the unused variables. In our example, mutable variables are not used, so it is removed

## [Early CSE Pass](http://llvm.org/docs/doxygen/html/EarlyCSE_8cpp_source.html "Doxygen Link")
This removes the obvious redundant operations like,
```c
if (i == 1) 
  x = x + i
```
can be replaced as
```c
if (i == 1)
  x = x + 1
```
In this case, the code is constructing an structure with {0, i1} in a block which can be reached only if i1 is true, so it is replacing this instruction as {0, true}
```llvm
  br i1 %"or oper2 == 0", label %then, label %else
then:                                             ; preds = %entry          
  %5 = insertvalue { i64, i1 } undef, i64 0, 0                              
  %6 = insertvalue { i64, i1 } %5, i1 %"or oper2 == 0", 1                   
  ret { i64, i1 } %6
```
Here `i1` in `then` block should be true. `insertvalue { i64, i1 } undef, i64 0, 0` creates a struct with two fields `i64` and `i1` and assigns `i64` with 0. The second `insertvalue` sets the `i1` value. Now this can be replaced as
```llvm
  br i1 %"or oper2 == 0", label %then, label %else
then:                                             ; preds = %entry          
  ret { i64, i1 } { i64 0, i1 true }
```

## [Function Integration/Inlining](http://llvm.org/docs/Passes.html#inline-function-integration-inlining "-inline")
In this example, there is a user defined function for sdiv and it can be inlined. This is similar to inline functions in C. The function code is substitude in all the callees. While inlining, if the arguments values are known, unwanted checks are removed. For example
```c
inline int mod(int x) {
  if (x < 0) 
    return -x;
  return x
}

void sqrt(int x) {
  if (x < 0) 
    printf("Sqrt of x is %d", sqrt(mod(x));
  else 
    printf("Sqrt of x is %di", sqrt(mod(x));
}
``` 
After inlining the mod function, we can remove the redundant checks and optimize it to
```c
void sqrt(int x) {
  if (x < 0) 
    printf("Sqrt of x is %d", sqrt(-x);
  else 
    printf("Sqrt of x is %di", sqrt(x);
}
```
Since our example is calculating average, the divisior is always a positive number and hence the `-1` check over divisor can be ignored
```llvm
%9 = call fastcc { i64, i1 } @sdiv_with_overflow(i64 %7, i64 2)
%10 = extractvalue { i64, i1 } %9, 0
%11 = extractvalue { i64, i1 } %9, 1 
br i1 %11, label %then7, label %merge59

define internal fastcc { i64, i1 } @sdiv_with_overflow(i64, i64) unnamed_addr #1 {
entry:
  %2 = icmp eq i64 %0, -9223372036854775808
  %3 = icmp eq i64 %1, -1
  %"oper1 == INT_MIN and oper2 == -1" = and i1 %2, %3
  %4 = icmp eq i64 %1, 0
  %"or oper2 == 0" = or i1 %4, %"oper1 == INT_MIN and oper2 == -1"
  br i1 %"or oper2 == 0", label %then, label %else
then:                                             ; preds = %entry
  ret { i64, i1 } { i64 0, i1 true }
else:                                             ; preds = %entry
  %divtmp = sdiv i64 %0, %1
  %5 = insertvalue { i64, i1 } undef, i64 %divtmp, 0
  %6 = insertvalue { i64, i1 } %5, i1 false, 1
  ret { i64, i1 } %6
}
``` 
can be inlined as
```llvm
  %9 = icmp eq i64 %7, -9223372036854775808
  %divtmp.i = sdiv i64 %7, 2
  %10 = insertvalue { i64, i1 } undef, i64 %divtmp.i, 0
  %11 = insertvalue { i64, i1 } %10, i1 false, 1
  %12 = extractvalue { i64, i1 } %11, 0           
  %13 = extractvalue { i64, i1 } %11, 1
  br i1 %13, label %then7, label %merge59
```
Since we know divisor is 2, unwanted checks (divisor == -1, divisor == 0) are removed after inlining

## [Early CSE Pass](http://llvm.org/docs/doxygen/html/EarlyCSE_8cpp_source.html "Doxygen Link")
In the sdiv function, there were two checks, if the divisor is 0 or -1. If the divisor is -1,  an additional check to see if the divident is INT_MIN was present. While inlining, optimizer found that all the values of divisors are constants and they are not -1 or 0 in any of the locations. So it had removed the checks if divisor 0, -1 in the previous step. In this step, the divident equals INT_MIN check is removed, since it not relevant anymore. And also extraction of value from the structure is not required, since we know overflow flag is always false and result is present in %divtmp.i
```llvm
  %9 = icmp eq i64 %7, -9223372036854775808
  %divtmp.i = sdiv i64 %7, 2
  %10 = insertvalue { i64, i1 } undef, i64 %divtmp.i, 0
  %11 = insertvalue { i64, i1 } %10, i1 false, 1
  %12 = extractvalue { i64, i1 } %11, 0           
  %13 = extractvalue { i64, i1 } %11, 1
  br i1 %13, label %then7, label %merge59
```
is optimized as
```llvm
  %divtmp.i = sdiv i64 %7, 2                                                
  %9 = insertvalue { i64, i1 } undef, i64 %divtmp.i, 0                      
  %10 = insertvalue { i64, i1 } %9, i1 false, 1                             
  br i1 false, label %then7, label %merge59  
```

## [Jump Threading](http://llvm.org/docs/Passes.html#inline-function-integration-inlining "-jump-threading")
In the previous step, once the checks were removed, the overflow bit for the div operation were set to false. Now the optimizer knows the conditional branch on overflow bit is always going to take the else block. So the then blocks from the code can be removed. So the above block becomes
```llvm
  %divtmp.i = sdiv i64 %7, 2                                                
  %9 = insertvalue { i64, i1 } undef, i64 %divtmp.i, 0                      
  %10 = insertvalue { i64, i1 } %9, i1 false, 1                             
  br label %merge59
```

## [Combine redundant Instructions](http://llvm.org/docs/Passes.html#instcombine-combine-redundant-instructions "-instcombine")
Since the sdiv function was inlined, there is no use for the structure {overflow, value} and hence the construction of the structure is dead code. So we can remove the insert value from the above block. 
```llvm
  %divtmp.i = sdiv i64 %7, 2                                                
  br label %merge59
``` 

### Optimized code at the end of all optimizations
```llvm
define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %lethan = icmp slt i64 %0, 1
  br i1 %lethan, label %merge59, label %else
else:                                             ; preds = %entry
  switch i64 %0, label %else37 [
    i64 1, label %merge59
    i64 2, label %then4
    i64 3, label %then12
    i64 4, label %then24
  ]
then4:                                            ; preds = %else
  %6 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %then5, label %else6
then5:                                            ; preds = %then4
  %calltrap = tail call i64 @overflow_fail(i64 114)
  br label %else6
else6:                                            ; preds = %then5, %then4
  %divtmp.i = sdiv i64 %7, 2
  br label %merge59
then12:                                           ; preds = %else
  %9 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %2, i64 %3)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %then13, label %else15
then13:                                           ; preds = %then12
  %calltrap14 = tail call i64 @overflow_fail(i64 178)
  br label %else15
else15:                                           ; preds = %then13, %then12
  %12 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %10)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  br i1 %14, label %then16, label %else18
then16:                                           ; preds = %else15
  %calltrap17 = tail call i64 @overflow_fail(i64 172)
  br label %else18
else18:                                           ; preds = %then16, %else15
  %divtmp.i3 = sdiv i64 %13, 3
  br label %merge59
then24:                                           ; preds = %else
  %15 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %then25, label %else27
then25:                                           ; preds = %then24
  %calltrap26 = tail call i64 @overflow_fail(i64 248)
  br label %else27
else27:                                           ; preds = %then25, %then24
  %18 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %4)
  %19 = extractvalue { i64, i1 } %18, 0
  %20 = extractvalue { i64, i1 } %18, 1
  br i1 %20, label %then28, label %else30
then28:                                           ; preds = %else27
  %calltrap29 = tail call i64 @overflow_fail(i64 258)
  br label %else30
else30:                                           ; preds = %then28, %else27
  %21 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %16, i64 %19)
  %22 = extractvalue { i64, i1 } %21, 0
  %23 = extractvalue { i64, i1 } %21, 1
  br i1 %23, label %then31, label %else33
then31:                                           ; preds = %else30
  %calltrap32 = tail call i64 @overflow_fail(i64 245)
  br label %else33
else33:                                           ; preds = %then31, %else30
  %divtmp.i2 = sdiv i64 %22, 4
  br label %merge59
else37:                                           ; preds = %else
  %24 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %1, i64 %2)
  %25 = extractvalue { i64, i1 } %24, 0
  %26 = extractvalue { i64, i1 } %24, 1
  br i1 %26, label %then38, label %else40
then38:                                           ; preds = %else37
  %calltrap39 = tail call i64 @overflow_fail(i64 301)
  br label %else40
else40:                                           ; preds = %then38, %else37
  %27 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %3, i64 %4)
  %28 = extractvalue { i64, i1 } %27, 0
  %29 = extractvalue { i64, i1 } %27, 1
  br i1 %29, label %then41, label %else43
then41:                                           ; preds = %else40
  %calltrap42 = tail call i64 @overflow_fail(i64 311)
  br label %else43
else43:                                           ; preds = %then41, %else40
  %30 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %25, i64 %28)
  %31 = extractvalue { i64, i1 } %30, 0
  %32 = extractvalue { i64, i1 } %30, 1
  br i1 %32, label %then44, label %else46
then44:                                           ; preds = %else43
  %calltrap45 = tail call i64 @overflow_fail(i64 298)
  br label %else46
else46:                                           ; preds = %then44, %else43
  %33 = tail call { i64, i1 } @llvm.sadd.with.overflow.i64(i64 %31, i64 %5)
  %34 = extractvalue { i64, i1 } %33, 0
  %35 = extractvalue { i64, i1 } %33, 1
  br i1 %35, label %then47, label %else49
then47:                                           ; preds = %else46
  %calltrap48 = tail call i64 @overflow_fail(i64 295)
  br label %else49
else49:                                           ; preds = %then47, %else46
  %divtmp.i1 = sdiv i64 %34, 5
  br label %merge59
merge59:                                          ; preds = %else49, %else6, %else18, %else33, %else, %entry
  %phiNode60 = phi i64 [ 0, %entry ], [ %1, %else ], [ %divtmp.i, %else6 ], [ %divtmp.i3, %else18 ], [ %divtmp.i2, %else33 ], [ %divtmp.i1, %else49 ]
  ret i64 %phiNode60
}
```
