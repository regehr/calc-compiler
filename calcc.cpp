#include "llvm/ADT/APInt.h"
#include "llvm/IR/ConstantRange.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/NoFolder.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/raw_ostream.h"
#include <cassert>
#include <iostream>

using namespace llvm;
using namespace std;

static LLVMContext C;
static IRBuilder<NoFolder> Builder(C);
static std::unique_ptr<Module> M = llvm::make_unique<Module>("calc", C);

static int compile() {
  M->setTargetTriple(llvm::sys::getProcessTriple());
  std::vector<Type *> SixInts(6, Type::getInt64Ty(C));
  FunctionType *FT = FunctionType::get(Type::getInt64Ty(C), SixInts, false);
  Function *F = Function::Create(FT, Function::ExternalLinkage, "f", &*M);
  BasicBlock *BB = BasicBlock::Create(C, "entry", F);
  Builder.SetInsertPoint(BB);

  // TODO: parse the source program
  // TODO: generate correct LLVM instead of just an empty function

  Value *RetVal = ConstantInt::get(C, APInt(64, 0));
  Builder.CreateRet(RetVal);
  assert(!verifyModule(*M));
  M->dump();
  return 0;
}

int main(void) { return compile(); }
