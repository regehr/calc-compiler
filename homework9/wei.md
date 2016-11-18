## Homework 9

Guannan Wei

In this post, I will take `guannan-output/power.ll` as example to explain LLVM's *mem2reg* optimization. This optimization promotes memory references to register references.

The source program `power.calc` takes two arguments, where the first argument `a0` is the base, and the second argument `a1` is the exponent. 

The original program is as follows:

```
(seq (set a0 m0) 
     (seq (set a1 m1) 
          (while (!= m1 1) 
                 (seq (set (* m0 a0) m0)
                      (seq (set (- m1 1) m1) m0)))))
```

And the IR before `mem2reg` optimization is:

``` llvm
define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %m0 = alloca i64
  store i64 0, i64* %m0
  %m1 = alloca i64
  store i64 0, i64* %m1
  %m2 = alloca i64
  store i64 0, i64* %m2
  %m3 = alloca i64
  store i64 0, i64* %m3
  %m4 = alloca i64
  store i64 0, i64* %m4
  %m5 = alloca i64
  store i64 0, i64* %m5
  %m6 = alloca i64
  store i64 0, i64* %m6
  %m7 = alloca i64
  store i64 0, i64* %m7
  %m8 = alloca i64
  store i64 0, i64* %m8
  %m9 = alloca i64
  store i64 0, i64* %m9
  store i64 %0, i64* %m0
  store i64 %1, i64* %m1
  %m11 = load i64, i64* %m1
  %neq = icmp ne i64 %m11, 1
  br i1 %neq, label %body, label %cont

body:                                             ; preds = %normal5, %entry
  %m02 = load i64, i64* %m0
  %result = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %m02, i64 %0)
  %fst = extractvalue { i64, i1 } %result, 0
  %snd = extractvalue { i64, i1 } %result, 1
  br i1 %snd, label %of, label %normal

cont:                                             ; preds = %normal5, %entry
  %tmp = phi i64 [ 0, %entry ], [ %m010, %normal5 ]
  ret i64 %tmp

of:                                               ; preds = %body
  call void @overflow_fail(i32 120)
  br label %normal

normal:                                           ; preds = %of, %body
  store i64 %fst, i64* %m0
  %m13 = load i64, i64* %m1
  %result6 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %m13, i64 1)
  %fst7 = extractvalue { i64, i1 } %result6, 0
  %snd8 = extractvalue { i64, i1 } %result6, 1
  br i1 %snd8, label %of4, label %normal5

of4:                                              ; preds = %normal
  call void @overflow_fail(i32 166)
  br label %normal5

normal5:                                          ; preds = %of4, %normal
  store i64 %fst7, i64* %m1
  %m010 = load i64, i64* %m0
  %m111 = load i64, i64* %m1
  %neq12 = icmp ne i64 %m111, 1
  br i1 %neq12, label %body, label %cont
}
```

We can use command `opt -mem2reg power.ll -S` to get the transformed intermediate representation:

``` llvm
define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %neq = icmp ne i64 %1, 1
  br i1 %neq, label %body, label %cont

body:                                             ; preds = %normal5, %entry
  %m1.0 = phi i64 [ %1, %entry ], [ %add9, %normal5 ]
  %m0.0 = phi i64 [ %0, %entry ], [ %add, %normal5 ]
  %result = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %m0.0, i64 %0)
  %fst = extractvalue { i64, i1 } %result, 0
  %snd = extractvalue { i64, i1 } %result, 1
  br i1 %snd, label %of, label %normal

cont:                                             ; preds = %normal5, %entry
  %tmp = phi i64 [ 0, %entry ], [ %add, %normal5 ]
  ret i64 %tmp

of:                                               ; preds = %body
  call void @overflow_fail(i32 120)
  br label %normal

normal:                                           ; preds = %of, %body
  %add = phi i64 [ %fst, %of ], [ %fst, %body ]
  %result6 = call { i64, i1 } @llvm.ssub.with.overflow.i64(i64 %m1.0, i64 1)
  %fst7 = extractvalue { i64, i1 } %result6, 0
  %snd8 = extractvalue { i64, i1 } %result6, 1
  br i1 %snd8, label %of4, label %normal5

of4:                                              ; preds = %normal
  call void @overflow_fail(i32 166)
  br label %normal5

normal5:                                          ; preds = %of4, %normal
  %add9 = phi i64 [ %fst7, %of4 ], [ %fst7, %normal ]
  %neq12 = icmp ne i64 %add9, 1
  br i1 %neq12, label %body, label %cont
}
```

The main purpose of `mem2reg` is to promote mutable local variables, so it does not apply to heap variabels or global variables. All the `load` and `strore` instructions  related to these  vairables are also eliminated. But this pass doesn't change control flow graph.



For example, in the `entry` block, we can see that all unused local variables and their initializations are eliminated, and all occurrences of mutable variable `%m0` is promoted to register `%1`.

The `mem2reg` pass also inserts several Phi nodes as appropriate. In the `body` block, `%m02` is replaced by Phi node `%m0.0`, and `%m13` in block `normal` are replaced by ` %m1.0`.  `%add` in block `normal` is a Phi node of value `%fst` either flows from `%of` block or `%body` block. Also, `%add9` in block `normal5`  is a Phi node of value `%fst7` either flows from `%of4` block or `%normal` block.



According to LLVM's documentation, `mem2reg` pass only works for certain circumastances:

* It only works for variables created by `alloca` instruction in `entry` block
* It only promotes `alloca` variables that use `load` and `store` instructions. So if the address of `alloca` variable passed into a function, or it use any pointer arithmetic, the promotion will not applied.
* It only works for first class values, such as pointers, scalars, and vectors, not includes structs or arrary. Note that if the array size of the allocation is 1, or missing in .ll file, `mem2reg` works.




##### References

http://llvm.org/docs/Passes.html#mem2reg-promote-memory-to-register

http://llvm.org/docs/doxygen/html/Mem2Reg_8cpp_source.html

http://llvm.org/docs/tutorial/OCamlLangImpl7.html
