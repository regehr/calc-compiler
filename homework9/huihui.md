Homework 9

I am not using calc program as input, instead using a loop with if condition below as input test:
void func(int N, int *a, int M, int *b) {
  for(int i = 0; i < N; i++) {
    if (a[i] < M)
      b[i] = 1;
  }
}

The IR to generated would be:
; ModuleID = 'huihui.c'
source_filename = "huihui.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define void @func(i32 %N, i32* %a, i32 %M, i32* %b) #0 {
entry:
  %N.addr = alloca i32, align 4
  %a.addr = alloca i32*, align 8
  %M.addr = alloca i32, align 4
  %b.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 %N, i32* %N.addr, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %M, i32* %M.addr, align 4
  store i32* %b, i32** %b.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %N.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %a.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom
  %4 = load i32, i32* %arrayidx, align 4
  %5 = load i32, i32* %M.addr, align 4
  %cmp1 = icmp slt i32 %4, %5
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %6 = load i32*, i32** %b.addr, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom2 = sext i32 %7 to i64
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %idxprom2
  store i32 1, i32* %arrayidx3, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (http://llvm.org/git/clang.git ba7b1350117d23eb86be5f2532bd5a5efd89e724) (http://llvm.org/git/llvm.git 37a12595eac9054e79b6aca3a7190ed4a3b822ab)"}

The llvm analyzes are:

The if.end basic block is optimized out, as branch/jump to for.inc can be done in the if.then basic block
*** IR Dump After Simplify the CFG ***
; Function Attrs: nounwind uwtable
define void @func(i32 %N, i32* %a, i32 %M, i32* %b) #0 {
entry:
  %N.addr = alloca i32, align 4
  %a.addr = alloca i32*, align 8
  %M.addr = alloca i32, align 4
  %b.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 %N, i32* %N.addr, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %M, i32* %M.addr, align 4
  store i32* %b, i32** %b.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %N.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %a.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom
  %4 = load i32, i32* %arrayidx, align 4
  %5 = load i32, i32* %M.addr, align 4
  %cmp1 = icmp slt i32 %4, %5
  br i1 %cmp1, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %6 = load i32*, i32** %b.addr, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom2 = sext i32 %7 to i64
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %idxprom2
  store i32 1, i32* %arrayidx3, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

The Scalar Replacement of Aggregates eliminates unnecessary scalar variable allocation, and assignment
introducing a phi node in the for.cond basic block, instead of using two loads
later ons, in the following basic blocks, we can see that register loads being replaced with refering to the phi instance

*** IR Dump After SROA ***
; Function Attrs: nounwind uwtable
define void @func(i32 %N, i32* %a, i32 %M, i32* %b) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, %N
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %cmp1 = icmp slt i32 %0, %M
  br i1 %cmp1, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %idxprom2 = sext i32 %i.0 to i64
  %arrayidx3 = getelementptr inbounds i32, i32* %b, i64 %idxprom2
  store i32 1, i32* %arrayidx3, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

The common subexpression eliminaion find that  %idxprom2 = sext i32 %i.0 to i64 is doing the same thing as  %idxprom = sext i32 %i.0 to i64
As a result  %idxprom2 = sext i32 %i.0 to i64 is eliminated

*** IR Dump After Early CSE ***                                                     |}
; Function Attrs: nounwind uwtable                                                  |*** IR Dump After SROA ***
define void @func(i32 %N, i32* %a, i32 %M, i32* %b) #0 {                            |; Function Attrs: nounwind uwtable
entry:                                                                              |define void @func(i32 %N, i32* %a, i32 %M, i32* %b) #0 {
  br label %for.cond                                                                |entry:
                                                                                    |  br label %for.cond
for.cond:                                         ; preds = %for.inc, %entry        |
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]                                  |for.cond:                                         ; preds = %for.inc, %entry
  %cmp = icmp slt i32 %i.0, %N                                                      |  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  br i1 %cmp, label %for.body, label %for.end                                       |  %cmp = icmp slt i32 %i.0, %N
                                                                                    |  br i1 %cmp, label %for.body, label %for.end
for.body:                                         ; preds = %for.cond               |
  %idxprom = sext i32 %i.0 to i64                                                   |for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %idxprom                     |  %idxprom = sext i32 %i.0 to i64
  %0 = load i32, i32* %arrayidx, align 4                                            |  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %idxprom
  %cmp1 = icmp slt i32 %0, %M                                                       |  %0 = load i32, i32* %arrayidx, align 4
  br i1 %cmp1, label %if.then, label %for.inc                                       |  %cmp1 = icmp slt i32 %0, %M
                                                                                    |  br i1 %cmp1, label %if.then, label %for.inc
if.then:                                          ; preds = %for.body               |
  %arrayidx3 = getelementptr inbounds i32, i32* %b, i64 %idxprom                    |if.then:                                          ; preds = %for.body
  store i32 1, i32* %arrayidx3, align 4                                             |  %idxprom2 = sext i32 %i.0 to i64
  br label %for.inc                                                                 |  %arrayidx3 = getelementptr inbounds i32, i32* %b, i64 %idxprom2
                                                                                    |  store i32 1, i32* %arrayidx3, align 4
for.inc:                                          ; preds = %for.body, %if.then     |  br label %for.inc
  %inc = add nsw i32 %i.0, 1                                                        |
  br label %for.cond                                                                |for.inc:                                          ; preds = %for.body, %if.then
                                                                                    |  %inc = add nsw i32 %i.0, 1
for.end:                                          ; preds = %for.cond               |  br label %for.cond
  ret void                                                                          |
}                              

*** IR Dump After Rotate Loops ***
for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %i.05 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.inc ]
  %idxprom = sext i32 %i.05 to i64
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %cmp1 = icmp slt i32 %0, %M
  br i1 %cmp1, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %arrayidx3 = getelementptr inbounds i32, i32* %b, i64 %idxprom
  store i32 1, i32* %arrayidx3, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %inc = add nsw i32 %i.05, 1
  %cmp = icmp slt i32 %inc, %N
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge
*** IR Dump After Loop Invariant Code Motion ***
for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %i.05 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.inc ]
  %idxprom = sext i32 %i.05 to i64
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %cmp1 = icmp slt i32 %0, %M
  br i1 %cmp1, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %arrayidx3 = getelementptr inbounds i32, i32* %b, i64 %idxprom
  store i32 1, i32* %arrayidx3, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %inc = add nsw i32 %i.05, 1
  %cmp = icmp slt i32 %inc, %N
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge
*** IR Dump After Unswitch loops ***
for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %i.05 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.inc ]
  %idxprom = sext i32 %i.05 to i64
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %cmp1 = icmp slt i32 %0, %M
  br i1 %cmp1, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %arrayidx3 = getelementptr inbounds i32, i32* %b, i64 %idxprom
  store i32 1, i32* %arrayidx3, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %inc = add nsw i32 %i.05, 1
  %cmp = icmp slt i32 %inc, %N
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge
*** IR Dump After Simplify the CFG ***
; Function Attrs: norecurse nounwind uwtable
define void @func(i32 %N, i32* nocapture readonly %a, i32 %M, i32* nocapture %b) local_unnamed_addr #0 {
entry:
  %cmp4 = icmp slt i32 0, %N
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.inc
  %i.05 = phi i32 [ %inc, %for.inc ], [ 0, %entry ]
  %idxprom = sext i32 %i.05 to i64
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %cmp1 = icmp slt i32 %0, %M
  br i1 %cmp1, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %arrayidx3 = getelementptr inbounds i32, i32* %b, i64 %idxprom
  store i32 1, i32* %arrayidx3, align 4
  br label %for.inc
for.inc:                                          ; preds = %for.body, %if.then
  %inc = add nsw i32 %i.05, 1
  %cmp = icmp slt i32 %inc, %N
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc, %entry
  ret void
}

After these, the for.cond basic block got eliminated, the condition check being moved to entry block; the condition check also being move to for.inc block

The preheader was introduced

*** IR Dump After Canonicalize natural loops ***
; Function Attrs: norecurse nounwind uwtable
define void @func(i32 %N, i32* nocapture readonly %a, i32 %M, i32* nocapture %b) local_unnamed_addr #0 {
entry:
  %cmp4 = icmp sgt i32 %N, 0
  br i1 %cmp4, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %i.05 = phi i32 [ %inc, %for.inc ], [ 0, %for.body.preheader ]
  %idxprom = sext i32 %i.05 to i64
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %cmp1 = icmp slt i32 %0, %M
  br i1 %cmp1, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %arrayidx3 = getelementptr inbounds i32, i32* %b, i64 %idxprom
  store i32 1, i32* %arrayidx3, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %inc = add nsw i32 %i.05, 1
  %cmp = icmp slt i32 %inc, %N
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}

After induction varialbe simplication, the phi node variable were calculated as  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1                                 
%wide.trip.count = zext i32 %N to i64
*** IR Dump After MergedLoadStoreMotion ***
; Function Attrs: norecurse nounwind uwtable
define void @func(i32 %N, i32* nocapture readonly %a, i32 %M, i32* nocapture %b) local_unnamed_addr #0 {
entry:
  %cmp4 = icmp sgt i32 %N, 0
  br i1 %cmp4, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx, align 4
  %cmp1 = icmp slt i32 %0, %M
  br i1 %cmp1, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %arrayidx3 = getelementptr inbounds i32, i32* %b, i64 %indvars.iv
  store i32 1, i32* %arrayidx3, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %wide.trip.count = zext i32 %N to i64
  %exitcond = icmp ne i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}


