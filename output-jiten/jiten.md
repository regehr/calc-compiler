Jiten/u1006746

Analysis of optimizations for jdr44.ll(jdr.ll)

The original code is here: jdr44.calc(https://github.com/regehr/calc-compiler/blob/master/auto-tests-hw8/jdr44.calc)

1) Simply CFG pass:
     simplifies control flow like, removing empty branches. One interesting example:

Original code:
```
      br i1 %19, label %then, label %else
      then:                                           
      br label %merge

      else:                                           
      br label %merge
```
      merge:                                         
```   
      %iftmp = phi i64 [ 1, %then ], [ 0, %else ]
      %20 = load i64, i64* %m9
      %21 = add i64 %iftmp, %20
```
Optimized code:
```
     %. = select i1 %12, i64 1, i64 0
     %13 = add i64 %., %m9.1
```
The pass was combining the empty branches and while doing that it found that both value in phinode are constants so it replaced phi with a select instruction.

2) Combine redundant instructions: Replaced select with a zext instruction. code example:
Original code:
```
  %12 = icmp eq i64 %8, %11
  %. = select i1 %12, i64 1, i64 0
  %13 = add i64 %., %m9.1
```
Changed code:
```  
      %12 = icmp eq i64 %8, %11
      %. = zext i1 %12 to i64
      %13 = add i64 %., %m9.1
```
May be zext is cheaper than select statement.

3) Combine redundant instructions: replaces an sub instruction with add instruction.
