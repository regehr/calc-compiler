Denver Hoggatt

The is a writeup that goes through the optimization passes of the llvm optimizer, and briefly explains what each one is doing. The code being compiled by llvm was written in a custom-made language, which can be seen below.

```
Original Code:
 ARGS 3 4 8 12
 RESULT 8
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

The outputs of the compilation itself were a little long to include in this document, but I will provide relevant examples when I can. The optimization passes are as follows:





### IR Dump After Module Verifier ###

From what I can tell, this check doesn't do any optimizations, instead it checks to make sure that the optimization passes haven't ruined the program. It is run both at the beginning and the end of the optimization process.





### IR Dump After Simplify the CFG ###

From what I can tell this is one of the more popularly called functions during LLVM's optimization. The name itself hints that it is, in some way, trying to simplify the control-flow graph. But what exactly does that mean. Well, let's take a look at the following piece of code:


```
  br i1 %lethan, label %then, label %else
 
then:                                             ; preds = %entry
  br label %merge59
 
else:                                             ; preds = %entry
  %eq = icmp eq i64 %0, 1
  br i1 %eq, label %then1, label %else2

```

This is changed to:


```
  br i1 %lethan, label %merge59, label %else

else:                                             ; preds = %entry
  switch i64 %0, label %else37 [
    i64 1, label %merge59
    i64 2, label %then4
    i64 3, label %then12
    i64 4, label %then24
  ]
```

First, we can see that the "then" block was subsumed into the original branch. That is, instead of branching to "then" and then immediately branching to "merge59", the optimizer saw this redundant jump call, and made it so that the original branch just called "merge59", skipping the "then" block entirely.

Second, instead of jumping to an "else" block which made a simple comparison and then jumped to another then-else chain which did much the same, the "else" block was replaced with a switch statement that simply subsumed several of those branches. This eliminated several of those nested if statements from our original code. 




### IR Dump After SROA ###

This was another popularly called optimization, and seems to have eliminated quite a bit of code. I don't want to get too in-depth into this function, as it seems to do a lot of different optimizations, but they seem to be united by how the optimizer finds them. Here is an example:


```
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
 br i1 %lethan, label 
 %merge59, label %else
```

This was changed to:


```
  %lethan = icmp sle i64 %0, 0
  br i1 %lethan, label %merge59, label %else
```

In our language, we have a hard-coded 9 mutable variables we can use in our program. So these were initialized to zero at the start of our program. Interestingly, the optimizer saw that these variables were never used, and just deleted them. This SROA function is doing optmizations by looking at lines of code nearby to one another. However, instead of scanning through the file and looking at pieces of code spatially nearby to one another, it looks at the control-flow-graph. As soon as it looked at these mutable variables, it saw that they weren't used anywhere else in the file, and it eliminated them.





### IR Dump After Early CSE ###

This is a simple call, called a few times throughout the optimization process, which finds and eliminates redundant functions. Here is a simple example:


```
  %5 = insertvalue { i64, i1 } undef, i64 0, 0
  %6 = insertvalue { i64, i1 } %5, i1 %"or oper2 == 0", 1
  ret { i64, i1 } %6
```

This was changed to:


```
  ret { i64, i1 } { i64 0, i1 true }
```

As can be seen, it saw that the two insertvalue functions were redundant, combined them, and then inserted them into the return statement.





### IR Dump After Early GVN Hoisting of Expressions ###
### IR Dump After Global Value Numbering ###

GVN stands for global value numbering, I'm not entirely certain how this optimization works in specific. However, the llvm IR consists of a collection of values, and by numbering and keeping track of these values, llvm can further find redundant expressions. Also, early on in the optimization process, I believe a pass is performed which does some dead load elimination by hoisting loads into their predecessor blocks.

Unforuntately, there weren't any optimizations done on our code in this block, so I don't have any examples.	





### IR Dump After Lower 'expect' Intrinsics ###

I believe the main purpose of this pass is simply to protect performance improving function calls from further llvm passes by lowering them to metadata. Regardless, it doesn't affect our program.





### IR Dump After Force set function attributes ### 

Sets certain function attributes. Our language has a built-in overflow checking call, as well as some divide-by-zero checking, and this optimization pass is what identified those calls and brought them into the code:


```
; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64) #0

declare i64 @overflow_fail(i64)

define internal { i64, i1 } @sdiv_with_overflow(i64, i64) {
```




### IR Dump After Interprocedural Sparse Conditional Constant Propagation ###
### IR Dump After Sparse Conditional Constant Propagation ###

This is a simple constant propagation pass. That is, it simplifies code by propagating constant values through their operations. For example 'add 1 2' can be changed into '3', and then anywhere that used that add can just substitute it for '3'.  

There are two versions of this. One that checks for constant propagation in-between modules, and one that checks for constant propagation within modules.





### IR Dump After Global Variable Optimizer ###

As the name states, this does optimizations related to global variables which are often more difficult to optimize than local variables. However, our function doesn't contain any global variables (and I don't believe any were generated), so this pass is irrelevant to our code.





### IR Dump After Promote Memory to Register ###

This pass attemps to take memory allocations for mutable variables, and then tries to push them into registers. All of our mutables were eliminated in the very first optimizations, so this pass does nothing to our function.





### IR Dump After Dead Argument Elimination ###

I believe this is a simple pass to eliminate dead code resulting from unused arguments and return variables. Again, it doesn't have much of an affect on our program.





### IR Dump After Combine redundant instructions ###

I believe this is a more thorough attempt to eliminate redundant instructions, called later in the optimization process. Unlike the previous attempts, this optimization step actually attempts to work through the algebra to eliminate instructions. For example, 'y = add x 1' and 'z = add y 1' would transform into 'z = add x 2'. Unfortunately, I could not find an example within our own code. 





### IR Dump After PGOIndirectCallPromotion ###

I believe this promotes indirect calls to direct calls. Again, it doesn't seem to affect our code much.





### IR Dump After Function Integration/Inlining ###

This is where the optimizer attempts to inline certain function calls. That is, if a function is simple enugh, it can just copy the code within the function and paste it into where the call was made. This might allow for further passes to better optimize the code as they can now operate in one procedure, instead of making inter-procedural optimizations, which is often difficult as that one procedure might be called in multiple places.

Unfortunately, this call also didn't affect our code much.





### IR Dump After Deduce function attributes ###
### IR Dump After Deduce function attributes in RPO ###

I suspect this call attempts to deduce certain function attributes, which may then lead to better optimizations later on. This can be done locally or top-down. However, these optimization steps don't affect our program.





### IR Dump After Jump Threading ###

Given the name, I believe this pass attempts to threads jump calls together. That is, if a given block has a predecessor that can be proven to only jump in a certain direction, then you can restructure the code in certain ways.





### IR Dump After Value Propagation ###

I believe this pass looks at the values and their respective ranges of the pieces of code. By looking at these values, you can make certain optimization assumptions based on what those values can be proven to be. For example, if you can prove that x in the code 'and x y' will always be zero, you can prove that y will always be zero, which then leads to further optimizations down the line.





### IR Dump After Reassociate expressions ###

This pass rearranges expressions for better optimizations, such as constant propagation. For example, it will rearrange 'y = add 2 x' and 'z = add y 3' to 'y = add 2 3' and 'z = add x y', which can be further optimized by a constant propagation pass to yield 'z = add x 5'.





### IR Dump After Canonicalize natural loops ###

I believe this pass does several different loop optimizations and rearrangements, though I'm not expert in loop optimization, and can't give an in-depth explanation of what this specifically changes. Our program doesn't contain loops, so this pass doesn't seem to do much.





### IR Dump After Loop-Closed SSA Form Pass ###
### IR Dump After LCSSA Verifier ###

LCSSA stands for loop-closed SSA form. LCSSA optimization adds phi-nodes at the end of all loops for all variables than span that loop (even if they aren't changed). While these phi-nodes themselves aren't useful, other optimization passes can take advantage of them to produce better code. However, as stated previously, our code doesn't contain any loops, so this function doesn't change anything.





### IR Dump After MergedLoadStoreMotion ###

This function merges loads and stores that result from diverging then converging (i.e. diamond shaped) branches. It doesn't affect our program. 





### IR Dump After MemCpy Optimization ###

This pass either attempts to optimize the code such that it eliminates memcpy calls if such a call is unecessarily costly, or it tries to turn memcpy calls into a series of loads and stores in order to eliminate the call. Our code never called memcpy, so this pass isn't useful in the context of our program.





### IR Dump After Demanded bits analysis ###

This pass determines if there are any bits in a computation which are never needed. The program can then truncate the value to only those bits which are demanded, which may then lead to further optimizations in subsequent passes. However, this pass does not affect our code.





### IR Dump After Bit-Tracking Dead Code Elimination ###

This pass is run after the previous pass, as we can now better track bits through certain bitwise operations (shits, ands, ors, etc). These operators may leave some of their bits dead, and we can then eliminate any computations on dead bits. However, by this point in our code's optimization, we aren't using any bitwise operators, so this pass does nothing.





### IR Dump After Dead Store Elimination ###

This pass implements a simple dead-store eliminator, which looks for redundant stores within the same block and removes them.





### IR Dump After Aggressive Dead Code Elimination ###

This is another attempt to eliminate dead code. However, in this pass, the optimizer assumes that a piece of code is dead unless proven otherwise. Thus, the optimizer looks through the control-flow graph to try and delete blocks of dead-code that it may not be able to delete through other methods.





### IR Dump After Remove unused exception handling info ###

This pass walks through the call-graph and turns invoke instructions into calls. By this point in the optimization process, our code didn't have any invoke instructions, so no changes were made.





### IR Dump After Eliminate Available Externally Globals ###

This pass attempts to change external global definitions into declarations, which allow for better optimizations.





### IR Dump After Float to int ###

Given the name, I suspect this pass looks for floats to convert to integers. Float arithmetic is often much more difficult to compute than standard integer arithmetic, so it will try to compute as much as it can in integer arithmetic before relying on floating-point operations.





### IR Dump After Loop Vectorization ###

Again, I am no expert at loop optimizations, but I believe this pass attempts to vectorize loops if doing so would be cost-effective. Our code doesn't have loops, so this pass does nothing.





### IR Dump After Loop Distribution ###

For those loops that cannot be vectorized due to dependencies, this pass attempts to rearrange the loops such that these dependencies are isolated, and the remaining loops can be vectorized. Again, this pass doesn't affect our code.





### IR Dump After Loop Load Elimination ###

This pass does some transformations on loop-dependent loads and stores, which it can then combine to eliminate the load. This doesn't affect our code.





### IR Dump After SLP Vectorizer ###

This pass attempts to detect subsequent store instructions which can be vectorized. It doesn't affect our code.





### IR Dump After Alignment from assumptions ###

This pass does some scalar transformations of loads and stores which may help optimize the previous vectorizations. No vectorizations were made in our code, so this pass does nothing.





### IR Dump After Strip Unused Function Prototypes ###

This pass simply loops over the functions in the input and removes dead declarations. None exist in our code, so this pass does nothing.





### IR Dump After Dead Global Elimination ###

This pass simply removes global variables that aren't being used. Again, none exist in our code, so this pass doesn't do anything. 





### IR Dump After Merge Duplicate Global Constants ### 

Merges duplicate global variables should any exist. None exist in our program, so this pass does nothing. Like the previously described passes, these are conducted at the end of the optimization process, meaning these passes are mostly for code-cleanup.





Here are all of the passes through the optimization process:

