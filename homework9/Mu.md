# LLVM Simplify CFG Pass

​													Yongjian Mu / u1010337

* __.ll Source file:__

https://github.com/regehr/calc-compiler/blob/master/output-guannan/fib.ll

Following two code segments shows the only difference after Simplify the CFG:

__IR Dump After Module Verifier (Code Segment)__

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
    %le = icmp sle i64 %0, 0
    br i1 %le, label %then, label %else
    then:                                             ; preds = %entry
      br label %ifcont
    else:                                             ; preds = %entry
      store i64 1, i64* %m1
      store i64 1, i64* %m2
      %m21 = load i64, i64* %m2
      %lt = icmp slt i64 %m21, %0
      br i1 %lt, label %body, label %cont



__IR Dump After Simplify the CFG (Code Segment)__

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
    %le = icmp sle i64 %0, 0
    br i1 %le, label %ifcont, label %else
    else:                                             ; preds = %entry
      store i64 1, i64* %m1
      store i64 1, i64* %m2
      %m21 = load i64, i64* %m2
      %lt = icmp slt i64 %m21, %0
      br i1 %lt, label %body, label %cont
* __Optimized Code__

  We can see that after simplify the CFG, the code:

      br i1 %le, label %then, label %else
      then:                                          ; preds = %entry
      br label %ifcont
      else:                                          ; preds = %entry
  has been changed to:

      br i1 %le, label %ifcont, label %else
      else:                                             ; preds = %entry`

  ​

* __Analysis__

For the LLVM, SimplifyCFGPass implements dead code elimination and basic block merging, along with a collection of other peephole control flow optimizations <sup>[1]</sup>. Therefore it will eliminates a basic block that only contains an unconditional branch <sup>[1]</sup>.

From the comparasion of the two code segments, we can see that the optimized code has eleminated the brance "then", since this brance does nothing. Then merge the label "ifcont" into the br above.

The main function to eliminate the extra branch is called "SimplifyCFG"

| [bool](http://llvm.org/docs/doxygen/html/classbool.html) [llvm::SimplifyCFG](http://llvm.org/docs/doxygen/html/namespacellvm.html#acadd97f6303d3182e65ef19ce8222f68) | (    | [BasicBlock](http://llvm.org/docs/doxygen/html/classllvm_1_1BasicBlock.html) * | *BB*,                 |
| ---------------------------------------- | ---- | ---------------------------------------- | --------------------- |
|                                          |      | [const](http://llvm.org/docs/doxygen/html/AArch64PromoteConstant_8cpp.html#a90f8350fecae261c25be85d38b451bff) [TargetTransformInfo](http://llvm.org/docs/doxygen/html/classllvm_1_1TargetTransformInfo.html) & | *TTI*,                |
|                                          |      | [unsigned](http://llvm.org/docs/doxygen/html/classunsigned.html) | *BonusInstThreshold*, |
|                                          |      | [AssumptionCache](http://llvm.org/docs/doxygen/html/classllvm_1_1AssumptionCache.html) * | *AC* = `nullptr`      |
|                                          | )    |                                          |                       |

​								Table 1 SimplifyCFG<sup>[2]</sup>

This function adjusts branches to branches to eliminate the extra hop, it eliminates unreachable basic blocks, and does other "peephole" optimization of the CFG. It returns true if a modification was made, 
possibly deleting the basic block that was pointed to <sup>[2]</sup>.



Following is the code of SimplifyCFGPass.cpp<sup>[1]</sup>:

    /// Call SimplifyCFG on all the blocks in the function,
    /// iterating until no more changes are made.
    static bool iterativelySimplifyCFG(Function &F, const TargetTransformInfo &TTI,
                                       AssumptionCache *AC,
                                       unsigned BonusInstThreshold) {
      bool Changed = false;
      bool LocalChange = true;
      while (LocalChange) {
        LocalChange = false;
    
        // Loop over all of the basic blocks and remove them if they are unneeded.
        for (Function::iterator BBIt = F.begin(); BBIt != F.end(); ) {
          if (SimplifyCFG(&*BBIt++, TTI, BonusInstThreshold, AC)) {
            LocalChange = true;
            ++NumSimpl;
          }
        }
        Changed |= LocalChange;
      }
      return Changed;
    }
As the comment says, it iterativly calls __SimpifyCFG()__ to search all the blocks in the function to 	eliminate extra branches.



* Reference

  [1]http://llvm.org/docs/doxygen/html/SimplifyCFGPass_8cpp_source.html

  [2]http://llvm.org/docs/doxygen/html/namespacellvm.html#acadd97f6303d3182e65ef19ce8222f68

  [3]http://llvm.org/docs/doxygen/html/SimplifyCFG_8cpp_source.html