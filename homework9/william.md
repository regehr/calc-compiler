
LLVM IR optimization overview for a toy program
===============================================

In my compilers class this semester we've been talking about static analysis and optimizations.  We've written a little LLVM frontend compiler for a toy language with s-expression (lisp) syntax.  We've also added an option to our compiler to add arithmetic overflow and division error checks to the compiler output.  We're going to look at the output of this compiler with arithmetic checks on a toy program, and see what the optimizer does to it.

<!-- more -->

Here is a sample program in the language that calculates the greatest common denominator using Euclid's Algorithm.  Program arguments are `a0, a1, ...`, and mutable variables are `m0, m1, ...`.

    # ARGS 252 105
    # RESULT 21
    (seq
     (set a0 m0)
     (seq
      (set a1 m1)
      (seq
       (while (!= m1 0)
         (seq (set m1 m2)
              (seq (set (% m0 m1) m1)
                   (set m2 m0))))
       m0)))

After running my compiler on it, running no optimizations but with arithmetic checking on, we get the following output (in LLVM IR form):


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
      store i64 %0, i64* %6
      store i64 %1, i64* %7
      br label %test
    
    test:                                             ; preds = %noerror, %entry
      %"loop value" = phi i64 [ 0, %entry ], [ %20, %noerror ]
      %16 = load i64, i64* %7
      %"!=" = icmp ne i64 %16, 0
      br i1 %"!=", label %body, label %exit
    
    body:                                             ; preds = %test
      %17 = load i64, i64* %7
      store i64 %17, i64* %8
      %18 = load i64, i64* %6
      %19 = load i64, i64* %7
      %"==" = icmp eq i64 %19, 0
      br i1 %"==", label %error, label %noerror
    
    error:                                            ; preds = %body
      call void @overflow_fail(i64 135)
      ret i64 0
    
    noerror:                                          ; preds = %body
      %"%" = srem i64 %18, %19
      store i64 %"%", i64* %7
      %20 = load i64, i64* %8
      store i64 %20, i64* %6
      br label %test
    
    exit:                                             ; preds = %test
      %21 = load i64, i64* %6
      ret i64 %21
    }

The `entry` block allocates space for and initializes the mutable variables.  The `test` block checks if the second argument is 0 (when it reaches 0 then the first argument is the GCD), and if not branches to the body.  In `body` we check if the right hand side of the modulo operator is 0 -- since modulo by 0 is undefined, we check and trap it.  If it is 0 we jump to the `error` block and call our fail handler.  Otherwise we jump to the `noerror` block, where we do the remainder instruction, then jump back to `test`.  Once we have the GCD, we jump from `test` to `exit` and return the result.

LLVM IR (intermediate representation) is in SSA (static single assignment) form.  I won't go into any detail of what that is, but essentially it means that every variable is assigned to only once.  Mutable variables that have multiple assignments in the original source code are turned into multiple variables -- a new variable after each assignment or control flow merge that included assignments in one or more branches.  Phi-nodes in SSA form are pseudo-instructions that assign a variable its value based on where the control flow last came from -- eg. one value if coming from the true branch of an `if`, and another value if coming from the false branch.  SSA enables many interesting optimizations to be performed, as we will see.

We can run the LLVM optimizer by itself by running `opt -O2 <file.ll>`, and if we add `-print-after-all` we get a peek at the output after each optimization pass.  There are nearly 100 passes, but only a few them had an effect on this program.

Let's look at the passes, and see what they've done.

Passes
======

1 SROA
------

The first pass is scalar replacement of aggregates, or SROA.  This pass analyzes allocation instructions and if possible turns them into SSA form.  This gives us the ability to run SSA-specific optimizations to the code using these allocated variables, and allows the backend to put stack variables into registers instead.   The original output from our compiler had an initial block dedicated to allocating and initializing our language's 10 mutable variables.  Now all of that is gone.  Additionally, and more importantly, all the loads and stores in the loop are now gone, replaced with normal SSA variables.  Now our loop body is down from 6 instructions (which were mostly load and store, instructions that generally take longer than most) to 2.  The `noerror` block, which did the actual math, is similarly down from 5 instructions to 2.


    define i64 @f(i64, i64, i64, i64, i64, i64) {
    entry:
      br label %test
    
    test:                                             ; preds = %noerror, %entry
      %.06 = phi i64 [ %1, %entry ], [ %"%", %noerror ]
      %.0 = phi i64 [ %0, %entry ], [ %.06, %noerror ]
      %"loop value" = phi i64 [ 0, %entry ], [ %.06, %noerror ]
      %"!=" = icmp ne i64 %.06, 0
      br i1 %"!=", label %body, label %exit
    
    body:                                             ; preds = %test
      %"==" = icmp eq i64 %.06, 0
      br i1 %"==", label %error, label %noerror
    
    error:                                            ; preds = %body
      call void @overflow_fail(i64 135)
      ret i64 0
    
    noerror:                                          ; preds = %body
      %"%" = srem i64 %.0, %.06
      br label %test
    
    exit:                                             ; preds = %test
      ret i64 %.0
    }



2 Early CSE
-----------

Early CSE eliminates trivially redundant instructions.  In this case, it just removes the loop value variable, which is trivially the same as `%.0`

    define i64 @f(i64, i64, i64, i64, i64, i64) {
    entry:
      br label %test
    
    test:                                             ; preds = %noerror, %entry
      %.06 = phi i64 [ %1, %entry ], [ %"%", %noerror ]
      %.0 = phi i64 [ %0, %entry ], [ %.06, %noerror ]
      %"!=" = icmp ne i64 %.06, 0
      br i1 %"!=", label %body, label %exit
    
    body:                                             ; preds = %test
      %"==" = icmp eq i64 %.06, 0
      br i1 %"==", label %error, label %noerror
    
    error:                                            ; preds = %body
      call void @overflow_fail(i64 135)
      ret i64 0
    
    noerror:                                          ; preds = %body
      %"%" = srem i64 %.0, %.06
      br label %test
    
    exit:                                             ; preds = %test
      ret i64 %.0
    }


3 Combine redundant instructions
--------------------------------

We've been testing whether the second argument is zero to determine whether we're done with the loop, and also testing later whether that argument is zero to determine if we have a divide-by-zero error.  But we've been using different operators (equality vs inequality) to determine that.  This pass has flipped the inequality test in the `test` block into an equality test (and flipping the order of the branch labels to match), and eliminated the now-redundant equality test in the `body` block.

    define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {
    entry:
      br label %test
    
    test:                                             ; preds = %noerror, %entry
      %.06 = phi i64 [ %1, %entry ], [ %"%", %noerror ]
      %.0 = phi i64 [ %0, %entry ], [ %.06, %noerror ]
      %"!=" = icmp eq i64 %.06, 0
      br i1 %"!=", label %exit, label %body
    
    body:                                             ; preds = %test
      br i1 false, label %error, label %noerror
    
    error:                                            ; preds = %body
      ret i64 0
    
    noerror:                                          ; preds = %body
      %"%" = srem i64 %.0, %.06
      br label %test
    
    exit:                                             ; preds = %test
      ret i64 %.0
    }


4 Simplify the CFG
------------------

This one simplifies the CFG, or control flow graph.  In this pass the optimizer was able to prove that the `error` block was unreachable (because the error block is only reachable if the second argument is 0 in the `body` block, but the body block is unreachable in exactly that case).  After removing the `error` block, the `body` block was also redundant, so it was removed.  The optimizer has now proved that this program never has a divide by zero error, so our error checking has become free at runtime -- there are no dynamic checks left!  This is what we always hope our optimizer can do to these arithmetic checks -- we got lucky with this program, since the arithmetic safety check was dominated by an equivalent loop check.


    define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr {
    entry:
      br label %test
    
    test:                                             ; preds = %noerror, %entry
      %.06 = phi i64 [ %1, %entry ], [ %"%", %noerror ]
      %.0 = phi i64 [ %0, %entry ], [ %.06, %noerror ]
      %"!=" = icmp eq i64 %.06, 0
      br i1 %"!=", label %exit, label %noerror
    
    noerror:                                          ; preds = %test
      %"%" = srem i64 %.0, %.06
      br label %test
    
    exit:                                             ; preds = %test
      ret i64 %.0
    }





5 Loop-Closed SSA Form Pass
----------------------------

This one adds a phi-node at the end of the loop.  It is redundant, but apparently it makes other loop optimizations easier.

    define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
    entry:
      br label %test
    
    test:                                             ; preds = %noerror, %entry
      %.06 = phi i64 [ %1, %entry ], [ %"%", %noerror ]
      %.0 = phi i64 [ %0, %entry ], [ %.06, %noerror ]
      %"!=" = icmp eq i64 %.06, 0
      br i1 %"!=", label %exit, label %noerror
    
    noerror:                                          ; preds = %test
      %"%" = srem i64 %.0, %.06
      br label %test
    
    exit:                                             ; preds = %test
      %.0.lcssa = phi i64 [ %.0, %test ]
      ret i64 %.0.lcssa
    }

6 Rotate Loops
---------------

This one has rotated the remainder and equality test instructions.  This basically lets us eliminate a branch.  For some reason the output of this pass only included the `noerror` block.

    noerror:                                          ; preds = %noerror.lr.ph, %noerror
      %.09 = phi i64 [ %0, %noerror.lr.ph ], [ %.068, %noerror ]
      %.068 = phi i64 [ %1, %noerror.lr.ph ], [ %"%", %noerror ]
      %"%" = srem i64 %.09, %.068
      %"!=" = icmp eq i64 %"%", 0
      br i1 %"!=", label %test.exit_crit_edge, label %noerror


7 Simplify the CFG
-------------------

Another pass simplifying the control flow graph.  Now we get to see that with a check in the entry block to see if the argument is zero, we get to remove the `test` block and do the testing that the `test` block did inside the `noerror` block.  Basically we've removed an extra branch by testing at the end of the loop instead of the beginning.  We get to see now that the phi-node added by the "loop-closed SSA" pass was useful after all -- it allowed us to do this CFG transformation.

This is essentially the last useful optimization pass for this simple program.  So only a few out of nearly 100 passes did anything.  I'll go over the remaining passes that make changes (albeit not useful ones), but I won't mention the dozens of passes that didn't make changes at all.  Running those passes can be cheap -- some passes check to see if a previous pass made any changes, so some passes can be skipped outright.

    define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
    entry:
      %"!=7" = icmp eq i64 %1, 0
      br i1 %"!=7", label %exit, label %noerror
    
    noerror:                                          ; preds = %entry, %noerror
      %.09 = phi i64 [ %.068, %noerror ], [ %0, %entry ]
      %.068 = phi i64 [ %"%", %noerror ], [ %1, %entry ]
      %"%" = srem i64 %.09, %.068
      %"!=" = icmp eq i64 %"%", 0
      br i1 %"!=", label %exit, label %noerror
    
    exit:                                             ; preds = %noerror, %entry
      %.0.lcssa = phi i64 [ %0, %entry ], [ %.068, %noerror ]
      ret i64 %.0.lcssa
    }

8 Canonicalize natural loops
----------------------------

This is another helper pass -- it hasn't actually optimized things for us, but it's put the loop into a canonical form that other optimizers can recognize and deal with.  Specifically, it added `preheader` and `loopexit` blocks for this purpose.

    define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
    entry:
      %"!=7" = icmp eq i64 %1, 0
      br i1 %"!=7", label %exit, label %noerror.preheader
    
    noerror.preheader:                                ; preds = %entry
      br label %noerror
    
    noerror:                                          ; preds = %noerror.preheader, %noerror
      %.09 = phi i64 [ %.068, %noerror ], [ %0, %noerror.preheader ]
      %.068 = phi i64 [ %"%", %noerror ], [ %1, %noerror.preheader ]
      %"%" = srem i64 %.09, %.068
      %"!=" = icmp eq i64 %"%", 0
      br i1 %"!=", label %exit.loopexit, label %noerror
    
    exit.loopexit:                                    ; preds = %noerror
      br label %exit
    
    exit:                                             ; preds = %exit.loopexit, %entry
      %.0.lcssa = phi i64 [ %0, %entry ], [ %.068, %exit.loopexit ]
      ret i64 %.0.lcssa
    }


9 Loop-Closed SSA Form Pass
---------------------------

Loop-Closed SSA again -- still not optimizing, but putting things into a specific form for later optimizations.

    define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
    entry:
      %"!=7" = icmp eq i64 %1, 0
      br i1 %"!=7", label %exit, label %noerror.preheader
    
    noerror.preheader:                                ; preds = %entry
      br label %noerror
    
    noerror:                                          ; preds = %noerror.preheader, %noerror
      %.09 = phi i64 [ %.068, %noerror ], [ %0, %noerror.preheader ]
      %.068 = phi i64 [ %"%", %noerror ], [ %1, %noerror.preheader ]
      %"%" = srem i64 %.09, %.068
      %"!=" = icmp eq i64 %"%", 0
      br i1 %"!=", label %exit.loopexit, label %noerror
    
    exit.loopexit:                                    ; preds = %noerror
      %.068.lcssa = phi i64 [ %.068, %noerror ]
      br label %exit
    
    exit:                                             ; preds = %exit.loopexit, %entry
      %.0.lcssa = phi i64 [ %0, %entry ], [ %.068.lcssa, %exit.loopexit ]
      ret i64 %.0.lcssa
    }


10 Global Value Numbering
-------------------------

Looks like we did that loop-closed SSA transformation for nothing.  There were probably some failed loop optimization passes in between, so the LC-SSA pass could have been useful.  But in our case it wasn't, and now our code is back to where it was before the previous optimization.

    define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
    entry:
      %"!=7" = icmp eq i64 %1, 0
      br i1 %"!=7", label %exit, label %noerror.preheader
    
    noerror.preheader:                                ; preds = %entry
      br label %noerror
    
    noerror:                                          ; preds = %noerror.preheader, %noerror
      %.09 = phi i64 [ %.068, %noerror ], [ %0, %noerror.preheader ]
      %.068 = phi i64 [ %"%", %noerror ], [ %1, %noerror.preheader ]
      %"%" = srem i64 %.09, %.068
      %"!=" = icmp eq i64 %"%", 0
      br i1 %"!=", label %exit.loopexit, label %noerror
    
    exit.loopexit:                                    ; preds = %noerror
      br label %exit
    
    exit:                                             ; preds = %exit.loopexit, %entry
      %.0.lcssa = phi i64 [ %0, %entry ], [ %.068, %exit.loopexit ]
      ret i64 %.0.lcssa
    }

11 Jump Threading
-----------------

Oh no!  Not only did the last two passes that made changes turn into a no-op, but this one has undone the pass before those two!  Again, those passes might have been useful for intermediate transformations, but they couldn't do anything to our code, which is already pretty simple.  About this pass specifically, it just simplifies branches to skip blocks that will always be branched out of anyway (like the loop header and exit blocks).

    define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
    entry:
      %"!=7" = icmp eq i64 %1, 0
      br i1 %"!=7", label %exit, label %noerror
    
    noerror:                                          ; preds = %entry, %noerror
      %.09 = phi i64 [ %.068, %noerror ], [ %0, %entry ]
      %.068 = phi i64 [ %"%", %noerror ], [ %1, %entry ]
      %"%" = srem i64 %.09, %.068
      %"!=" = icmp eq i64 %"%", 0
      br i1 %"!=", label %exit, label %noerror
    
    exit:                                             ; preds = %noerror, %entry
      %.0.lcssa = phi i64 [ %0, %entry ], [ %.068, %noerror ]
      ret i64 %.0.lcssa
    }



12 Module Verifier
------------------

Ok, so here we are at the last pass.

For brevity, I've skipped two more circles of passes for canonicalizing and simplifying loops that did change the code individually, but had no real net effect together.  We have empty loop header and exit blocks again, but they will be removed by any backend.


    define i64 @f(i64, i64, i64, i64, i64, i64) local_unnamed_addr #0 {
    entry:
      %"!=7" = icmp eq i64 %1, 0
      br i1 %"!=7", label %exit, label %noerror.preheader
    
    noerror.preheader:                                ; preds = %entry
      br label %noerror
    
    noerror:                                          ; preds = %noerror.preheader, %noerror
      %.09 = phi i64 [ %.068, %noerror ], [ %0, %noerror.preheader ]
      %.068 = phi i64 [ %"%", %noerror ], [ %1, %noerror.preheader ]
      %"%" = srem i64 %.09, %.068
      %"!=" = icmp eq i64 %"%", 0
      br i1 %"!=", label %exit.loopexit, label %noerror
    
    exit.loopexit:                                    ; preds = %noerror
      br label %exit
    
    exit:                                             ; preds = %exit.loopexit, %entry
      %.0.lcssa = phi i64 [ %0, %entry ], [ %.068, %exit.loopexit ]
      ret i64 %.0.lcssa
    }

Conclusion
----------

Static code optimizations are cool.  In this case LLVM could prove that the correctness check we added to the remainder operator was unnecessary.  So we got safety AND speed.  I'm really sick of running unsafe (IE doesn't check for integer overflow, array bounds, etc) code that causes security and correctness issues.  But safe, checked code is usually slow.  That's why I think static analysis to be able to get this sort of safety "for free" at runtime by proving things about programs statically is so important.  Nobody wants to run slow code, so hopefully these sort of analyses will allow safety measures to slow down code little enough that the cost of safety is lower, in the minds of programmers and society, than the cost of the countless security risks we run by running unsafe (if faster) code.

