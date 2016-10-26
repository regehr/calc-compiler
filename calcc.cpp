/*
 *	References:
 *	[1] LLVM Cookbook - Mayur Pandey, Suyog Sarda
 *	[2] LLVM tutorial - http://llvm.org/docs/tutorial/index.html
 */

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
static std::map<std::string, Value*> ArgValues;
//===----------------------------------------------------------------------===//
// Lexer
//===----------------------------------------------------------------------===//
// The lexer returns tokens [0-255] if it is an unknown character, otherwise one
// of these for known things.

enum Token {
  tok_eof = -1,
  tok_if = -2,
  tok_arg = -3,
  tok_number = -4,
  tok_lparan = -5,
  tok_rparan = -6,
  tok_comment = -7, // we don't need a token!
  tok_true = -8,
  tok_false = -9,
  tok_add = -10,
  tok_sub = -11,
  tok_mul = -12,
  tok_div = -13,
  tok_mod = -14,
  tok_gt = -15,
  tok_gte = -16,
  tok_lt = -17,
  tok_lte = -18,
  tok_eq = -19,
  tok_neq = -20
};

static std::string IdentifierStr; // Filled in if tok_identifier
static double NumVal;             // Filled in if tok_number
static std::string ArgName;		// a0, a1,...
static std::string match;
/// gettok - Return the next token from standard input.
static int gettok() {
  static char LastChar = ' ';

  // Skip any whitespace.
  while (isspace(LastChar))
    LastChar = getchar();

  if (isalpha(LastChar)) { // arg: a[0-5]
    IdentifierStr = LastChar;
    while (isalnum((LastChar = getchar())))
      IdentifierStr += LastChar;

    if (IdentifierStr == "if")
      return tok_if;
	if(IdentifierStr == "true")
		return tok_true;
	if(IdentifierStr=="false")
		return tok_false;
    if (IdentifierStr == "a0"|| IdentifierStr == "a1"|| IdentifierStr == "a2"|| IdentifierStr == "a3" || IdentifierStr == "a4"|| IdentifierStr == "a5") {
	  ArgName = IdentifierStr;
		return tok_arg;
	}
  }

  if (isdigit(LastChar)) { // Number: [0-9]+ only integers
    std::string NumStr;
    do {
      NumStr += LastChar;
      LastChar = getchar();
    } while (isdigit(LastChar));

    NumVal = strtod(NumStr.c_str(), nullptr);
    return tok_number;
  }

  if (LastChar == '#') {
    // Comment until end of line.
    do
      LastChar = getchar();
    while (LastChar != EOF && LastChar != '\n' && LastChar != '\r');

    if (LastChar != EOF)
      return gettok();
  }
	if(LastChar=='(') return tok_lparan;
	if(LastChar==')') return tok_rparan;
	if(LastChar=='+') return tok_add;
	if(LastChar=='-'){ 
		LastChar= getchar();
		if(LastChar==' ') return tok_sub;
		if(isdigit(LastChar)){
			std::string neg;
			neg+=LastChar;
			while(isdigit(LastChar=getchar())){
				neg+= LastChar;
			}
			NumVal = -1*strtod(neg.c_str(),nullptr);
			return tok_number;
		}
	}
	if(LastChar=='*') return tok_mul;
	if(LastChar=='/') return tok_div;
	if(LastChar=='%') return tok_mod;
	if(LastChar=='>'){
		LastChar=getchar();
		if(LastChar=='='){
		   	return tok_gte;
		}
		return tok_gt;
	}
	if(LastChar=='<'){ 
		LastChar=getchar();
		if(LastChar=='='){
			return tok_lte;
		}
		return tok_lt;
	}
	if(LastChar=='='){
		LastChar=getchar();
		if(LastChar=='='){
			return tok_eq;
		}
		cout << "SCANNER ERROR NEAR =" << endl;
	}
	if(LastChar == '!'){
		LastChar = getchar();
		if(LastChar == '='){
			return tok_neq;
		}
		cout << "SCANNER ERROR NEAR =" << endl;
	}
  // Check for end of file.  Don't eat the EOF.
  if (LastChar == EOF)
    return tok_eof;
  // Otherwise, just return the character as its ascii value.
  int ThisChar = LastChar;
  LastChar = getchar();
  return ThisChar;
}

//===----------------------------------------------------------------------===//
// Abstract Syntax Tree (aka Parse Tree)
//===----------------------------------------------------------------------===//
namespace {
/// ExprAST - Base class for all expression nodes.
class ExprAST {
public:
  virtual ~ExprAST() {}
  virtual Value *codegen() = 0;
};

/// NumberExprAST - Expression class for numeric literals like "1", only integers
class NumberExprAST : public ExprAST {
  int Val; // convert to APInt(64,Val) during codegen

public:
  NumberExprAST(int Val) : Val(Val) {}
  Value *codegen() override;
};

/// ArgExprAST - Expression class for referencing an argument, like "a0,a1,..,a5".
class ArgExprAST : public ExprAST {
   std::string Name;
public:
  ArgExprAST(const std::string &Name) : Name(Name) {}
  Value *codegen() override;
};

/// ConditionaConsAST - true | false
class ConditionConstExprAST : public ExprAST{
	unsigned int val; // either 1 or 0, convert to i1 when generating code
	public:
		ConditionConstExprAST(unsigned int val) : val(val){}
		Value *codegen() override;

};
/// BinaryExprAST - Expression class for a binary operator. eg. + 1 1
class BinaryExprAST : public ExprAST {
  int Op; //hold the token
  std::unique_ptr<ExprAST> First, Second;

public:
  BinaryExprAST(int Op, std::unique_ptr<ExprAST> First,
                std::unique_ptr<ExprAST> Second)
      : Op(Op), First(std::move(First)), Second(std::move(Second)) {}
  Value *codegen() override;
};

/// ConditionExprAST - Expression class for a conditional operator, i.e., 'if'
class ConditionExprAST : public ExprAST{
	std::unique_ptr<ExprAST> Branch, Then,Else;

public:
	ConditionExprAST(std::unique_ptr<ExprAST> Branch, std::unique_ptr<ExprAST> Then,std::unique_ptr<ExprAST> Else):Branch(std::move(Branch)), Then(std::move(Then)), Else(std::move(Else)){}
	Value *codegen() override;
};

} // end anonymous namespace

//===----------------------------------------------------------------------===//
// Parser
//===----------------------------------------------------------------------===//

/// CurTok/getNextToken - Provide a simple token buffer.  CurTok is the current
/// token the parser is looking at.  getNextToken reads another token from the
/// lexer and updates CurTok with its results.
static int CurTok;
static int getNextToken() { return CurTok = gettok(); }

/// LogError* - These are little helper functions for error handling.
std::unique_ptr<ExprAST> LogError(const char *Str) {
  fprintf(stderr, "Error: %s\n", Str);
  return nullptr;
}

// Behold! Real parsing begins here
static std::unique_ptr<ExprAST> ParseExpression();

/// numberexpr ::= number
static std::unique_ptr<ExprAST> ParseNumberExpr() {
  auto Result = llvm::make_unique<NumberExprAST>(NumVal);
  return std::move(Result);
}

/// numberexpr ::= Arg
static std::unique_ptr<ExprAST> ParseArgExpr(){
	auto Result = llvm::make_unique<ArgExprAST>(ArgName);
	getNextToken();
	return std::move(Result);
}
/// branch ::= true | false
static std::unique_ptr<ExprAST> ParseBranchConsExpr(){

	unsigned int val;
	if(CurTok == tok_true){
	   	val =1;
		return llvm::make_unique<ConditionConstExprAST>(val);
	}
	if(CurTok == tok_false){
	   	val = 0;
		return llvm::make_unique<ConditionConstExprAST>(val);
	}
	return LogError("Conditional Constant Parsing Error");
}
 
// expression ::= '(' expression ')'
static std::unique_ptr<ExprAST> ParseParenExpr() {
  getNextToken(); // eat (.
  auto V = ParseExpression();
  if (!V)
    return nullptr;
  getNextToken(); // eat ).
  return V;
}

//	expression::= '(' op expression expression ')'
static std::unique_ptr<ExprAST> ParseBinExpr(){
	int op = CurTok;
	getNextToken();
	auto first = ParseExpression();
	if(!first) return LogError("Binary Expression Parsing Error, first operand");
	getNextToken();
	auto second = ParseExpression();
	if(!second) return LogError("Binary Expression Parsing Error, second operand");

	first = llvm::make_unique<BinaryExprAST>(op,std::move(first),std::move(second));
	return first;
}

// expression::= '(' if condition expression expression ')'
static std::unique_ptr<ExprAST> ParseConditionExpr(){
	//CurTok = 'if'
	getNextToken();

	auto condition = ParseExpression();
	if(!condition) LogError("Conditional Expression Parsing Error");
	auto first = ParseExpression();
	if(!first) LogError("Then Expression Parsing Error");
	auto second = ParseExpression();
	if(!second) LogError("Else Expression Parsing Error");

	return llvm::make_unique<ConditionExprAST>(std::move(condition),std::move(first),std::move(second));

}

/// primary parser
static std::unique_ptr<ExprAST> ParseExpression() {
  switch (CurTok) {
  default:
    return LogError("unknown token when expecting an expression");
  case tok_arg:
	return ParseArgExpr();
  case tok_number:
    return ParseNumberExpr();
  case tok_lparan:
    return ParseParenExpr();
  case tok_add:
  case tok_sub:
  case tok_mul:
  case tok_div:
  case tok_mod:
  case tok_gt:
  case tok_gte:
  case tok_lt:
  case tok_lte:
  case tok_eq:
  case tok_neq:
	return ParseBinExpr();	
  }
}

//===----------------------------------------------------------------------===//
// Code Generation
//===----------------------------------------------------------------------===//

Value *LogErrorV(const char *Str) {
  LogError(Str);
  return nullptr;
}

Value *NumberExprAST::codegen() {
  return ConstantInt::get(C, APInt(64,Val));
}

Value *ArgExprAST::codegen(){
	Value *V = ArgValues[ArgName];
	if(!V){
		return nullptr;
	}
	return V;
}

Value *BinaryExprAST::codegen() {
  Value *first = First->codegen();
  Value *second = Second->codegen();
  if (!First || !Second)
    return nullptr;
	switch(Op){
	case tok_add:
		return Builder.CreateAdd(first, second, "addtmp");
   case tok_sub:
    return Builder.CreateSub(first, second, "subtmp");
   case tok_mul:
    return Builder.CreateMul(first, second, "multmp");
  case tok_div:
	return Builder.CreateUDiv(first,second,"divtmp");
  case tok_mod:
	return Builder.CreateURem(first, second, "modtmp");
  case tok_gt:
	return Builder.CreateFCmpUGT(first,second,"gttmp");
  case tok_gte:
	return Builder.CreateFCmpUGE(first,second,"gtetmp");
  case tok_lt:
	return Builder.CreateFCmpULT(first,second,"lttmp");
  case tok_lte:
	return Builder.CreateFCmpULE(first,second,"ltetmp");
  case tok_eq:
	return Builder.CreateFCmpUEQ(first,second,"eqtmp");
  case tok_neq:
	return Builder.CreateFCmpUNE(first,second,"neqtmp");
 }
    return LogErrorV("invalid binary operator");
}

Value *ConditionExprAST::codegen(){
	Value *Br = Branch->codegen();
	if(!Br) return nullptr;
Br = Builder.CreateFCmpONE(Br,ConstantInt::get(C,APInt(1,0)),""); //i1

	Function *f = Builder.GetInsertBlock()->getParent();

	BasicBlock *ThenBB = BasicBlock::Create(C,"then",f);
	BasicBlock *ElseBB = BasicBlock::Create(C,"else");
	BasicBlock *MergeBB = BasicBlock::Create(C,"");

	Builder.CreateCondBr(Br, ThenBB, ElseBB);

	Builder.SetInsertPoint(ThenBB);

	Value *then_val = Then->codegen();
	if(!then_val) return nullptr;

	Builder.CreateBr(MergeBB);
	
	ThenBB = Builder.GetInsertBlock();
	f->getBasicBlockList().push_back(ElseBB);
	Builder.SetInsertPoint(ElseBB);

	Value *else_val = Else->codegen();
	if(!else_val) return nullptr;

	Builder.CreateBr(MergeBB);
	ElseBB = Builder.GetInsertBlock();

	f->getBasicBlockList().push_back(MergeBB);
	Builder.SetInsertPoint(MergeBB);
	PHINode *PN = Builder.CreatePHI(Type::getInt64Ty(C),2,"iftmp");

	PN->addIncoming(then_val,ThenBB);
	PN->addIncoming(else_val,ElseBB);

	return PN;
}


static int compile() {
  M->setTargetTriple(llvm::sys::getProcessTriple());
  std::vector<Type *> SixInts(6, Type::getInt64Ty(C));
  FunctionType *FT = FunctionType::get(Type::getInt64Ty(C), SixInts, false);
  Function *F = Function::Create(FT, Function::ExternalLinkage, "f", &*M);
  BasicBlock *BB = BasicBlock::Create(C, "entry", F);
  Builder.SetInsertPoint(BB);

  while(true){
	getNextToken();
	if(CurTok == EOF) return 0;
	auto V = ParseExpression();
	if(!V) return 1;
	Value *generated = V->codegen();
  }

  Value *RetVal = ConstantInt::get(C, APInt(64, 0));
  Builder.CreateRet(RetVal);
  assert(!verifyModule(*M, &outs()));
  M->dump();
  return 0;
}

int main(void) { return compile(); }
