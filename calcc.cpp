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
#include <stdio.h>
#include <stdint.h>
using namespace llvm;
using namespace std;

static LLVMContext C;
static IRBuilder<NoFolder> Builder(C);
static std::unique_ptr<Module> M = llvm::make_unique<Module>("calc", C);
static std::map<std::string, Value*> ArgValues;

//===----------------------------------------------------------------------===//
// Lexer
//===----------------------------------------------------------------------===//
enum Token {
  tok_eof,
  tok_if,
  tok_arg,
  tok_number,
  tok_lparan,
  tok_rparan,
  tok_comment , // we don't need a token!
  tok_true,
  tok_false,
  tok_add,
  tok_sub,
  tok_mul,
  tok_div,
  tok_mod,
  tok_gt,
  tok_gte,
  tok_lt,
  tok_lte,
  tok_eq,
  tok_neq,
  tok_unknown,
  tok_set,
  tok_while,
  tok_seq,
  tok_mut,
  tok_intoflow
};

static std::string IdentifierStr; // Filled in if tok_identifier
static int64_t NumVal;             // Filled in if tok_number
static std::string ArgName;		// a0, a1,...
static std::string VarName; //m0,m1,...
static std::string match;
/// gettok - Return the next token from standard input.
static char LastChar = ' ';
static int OpenPar = 0; // help identifying parenthesis-less expressions

static bool isLineBegin = false;

static int gettok() {

  // Skip any whitespace.
  while (isspace(LastChar)|| LastChar == '\n'|| LastChar == '\t' || LastChar == '\r'){
	  LastChar = getchar();
  }
 
  if (LastChar == EOF){
		//cout << "EOF" << endl;
	  return tok_eof;
  }
 
  if (LastChar == '#') {
    // Read until end of line
    do{
      LastChar = getchar();
	}while ((LastChar != EOF) && (LastChar != '\n') && (LastChar != '\r'));
    if (LastChar == EOF){
      return tok_eof;
	}
	LastChar = getchar();
	
	return tok_comment;
  }

  if (isalpha(LastChar)) {
    IdentifierStr = LastChar;
    //while (isalnum((LastChar = getchar())))
    while (isalnum(LastChar=getchar())){ 
		IdentifierStr += LastChar;
	}

    if (IdentifierStr == "if"){
    //  cout << LastChar << endl;
		return tok_if;
	}
	if(IdentifierStr == "true"){
	//	 cout << LastChar << endl;
	 	 return tok_true;
	}
	if(IdentifierStr=="false"){
	//cout << IdentifierStr << endl;
		return tok_false;
	}
    if (IdentifierStr == "a0"|| IdentifierStr == "a1"|| IdentifierStr == "a2"|| IdentifierStr == "a3" || IdentifierStr == "a4"|| IdentifierStr == "a5") {
	  ArgName = IdentifierStr;
	//cout << IdentifierStr << endl;
		return tok_arg;
	}
	if(IdentifierStr == "m0"|| IdentifierStr == "m1"|| IdentifierStr == "m2"|| IdentifierStr == "m3" || IdentifierStr == "m4"|| IdentifierStr == "m5" || IdentifierStr == "m6"|| IdentifierStr == "m7"|| IdentifierStr == "m8"|| IdentifierStr == "m9" ){
		VarName = IdentifierStr;
		return tok_mut;
	}
	if(IdentifierStr=="while"){
		return tok_while;
	}	
	if(IdentifierStr=="seq"){
		return tok_seq;
	}
	if(IdentifierStr=="set"){
		return tok_set;
	}
  }

  if (isdigit(LastChar)) { // Number: [0-9]+ only integers
    std::string NumStr="";
    while (isdigit(LastChar)){
      NumStr += LastChar;
      LastChar = getchar();
    } 
	//cout << NumStr << endl;
    NumVal = strtol(NumStr.c_str(), nullptr,10);
	//LastChar = getchar();
	cout << "Positive:" << NumVal << endl;
	if(errno == ERANGE){return tok_intoflow;}
    return tok_number;
	 }

	if(LastChar=='('){
	//cout << LastChar << endl;
	OpenPar++ ;
	LastChar = getchar();
		return tok_lparan;
	}
	if(LastChar==')'){ 
	//cout << LastChar << endl;
		OpenPar-- ;
		LastChar = getchar();
		return tok_rparan;
	}
	if(LastChar=='+'){
	//cout << LastChar << endl;
	  LastChar = getchar();
	   	return tok_add;
	}
	if(LastChar=='-'){ 
		LastChar= getchar();
		if(LastChar==' '){ 
	//cout << LastChar << endl;
	  LastChar = getchar();
			return tok_sub;
		}
		else if(isdigit(LastChar)){
			std::string neg;
			neg="-";
			neg+=LastChar;
			while(isdigit(LastChar=getchar())){
				neg+= LastChar;
			}
			NumVal = strtol(neg.c_str(),nullptr,10);
			cout << "Negetive:" << NumVal << endl;
			if(errno == ERANGE){return tok_intoflow;}
	  
			return tok_number;
		}
	}
	if(LastChar=='*'){
	 //cout << LastChar << endl;
	  LastChar = getchar();
		return tok_mul;
	}
	if(LastChar=='/') {
	// cout << LastChar << endl;
	  LastChar = getchar();
		return tok_div;
	}
	if(LastChar=='%'){
	// cout << LastChar << endl;
	  LastChar = getchar();
	   	return tok_mod;
	}
	if(LastChar=='>'){
		LastChar=getchar();
		if(LastChar=='='){
	// cout << LastChar << endl;
	  LastChar = getchar();
		   	return tok_gte;
		}
	// cout << LastChar << endl;
	  LastChar = getchar();
		return tok_gt;
	}
	if(LastChar=='<'){ 
		LastChar=getchar();
		if(LastChar=='='){
	// cout << LastChar << endl;
	  LastChar = getchar();
			return tok_lte;
		}
	// cout << LastChar << endl;
	  LastChar = getchar();
		return tok_lt;
	}
	if(LastChar=='='){
		LastChar=getchar();
		if(LastChar=='='){
	// cout << LastChar << endl;
	  LastChar = getchar();
			return tok_eq;
		}
		cout << "SCANNER ERROR NEAR =" << endl;
	}
	if(LastChar == '!'){
		LastChar = getchar();
		if(LastChar == '='){
	// cout << LastChar << endl;
	  LastChar = getchar();
			return tok_neq;
		}
		cout << "SCANNER ERROR NEAR =" << endl;
	}

 // Otherwise, return unknown token
  cout << "Unknown:" << LastChar << endl;
  return tok_unknown;
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
int64_t Val; // convert to APInt(64,Val) during codegen

public:
  NumberExprAST(int64_t Val) : Val(Val) {}
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
	//if((NumVal < s64MIN)|| (NumVal > s64MAX)){ return LogError("Integer Overflow");}
	auto Result = llvm::make_unique<NumberExprAST>(NumVal);
	return std::move(Result);
}

/// numberexpr ::= Arg
static std::unique_ptr<ExprAST> ParseArgExpr(){
	return llvm::make_unique<ArgExprAST>(ArgName);
}
/// branch ::= true | false
static std::unique_ptr<ExprAST> ParseBranchConsExpr(){

	unsigned int val;
	//cout << "CurTok:" << CurTok << "from ParseBranchConstExpr()" << endl;
	if(CurTok == tok_true){
		//cout << "got true" << endl;
	   	val =1;
	}
	if(CurTok == tok_false){
	//	cout << "got false" << endl;
		val = 0;
	}
	//getNextToken(); // advance to the next token, hopefully ')'
		return llvm::make_unique<ConditionConstExprAST>(val);
}
 
// expression ::= '(' expression ')'
static std::unique_ptr<ExprAST> ParseParenExpr() {
  getNextToken(); // eat (, and point CurTok to next
  //cout << "CurTok:" << CurTok << " 1st from ParseParenExpr()" << endl;
  auto V = ParseExpression();
  if (!V)
	  return nullptr;
   
  getNextToken();
  //cout << "CurTok:" << CurTok << " 2nd from ParseParenExpr()" << endl;

  if(CurTok != tok_rparan) return LogError("Expected ')'");
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

	getNextToken(); // now CurTok is '('
	// conditions are treated as binary expressions or conditional constant expressions
	auto condition = ParseExpression();
	if(!condition) LogError("Conditional Expression Parsing Error");
	
	getNextToken();

	auto first = ParseExpression();
	if(!first) LogError("Then Expression Parsing Error");
	
	getNextToken();

	auto second = ParseExpression();
	if(!second) LogError("Else Expression Parsing Error");

	return llvm::make_unique<ConditionExprAST>(std::move(condition),std::move(first),std::move(second));
}

static std::unique_ptr<ExprAST> ParseMutableExpr(){

}


static std::unique_ptr<ExprAST> ParseSeqExpr(){

}

static std::unique_ptr<ExprAST> ParseSetExpr(){

}

static std::unique_ptr<ExprAST> ParseWhileExpr(){

}




/// primary parser
static std::unique_ptr<ExprAST> ParseExpression() {
  //cout << "From the top:" << CurTok << endl;
	if(OpenPar < 1){
		return LogError("Expressions must be surrounded by parenthesis");
	}
	switch (CurTok) {
	 default:
		return LogError("Invalid token received for parsing");
	 case tok_intoflow:
		return LogError("Integer Overflow");
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
	 case tok_true:
		return ParseBranchConsExpr(); 
	 case tok_false:
		return ParseBranchConsExpr();
	 case tok_if:
		return ParseConditionExpr();
	 case tok_set:
		return ParseSetExpr();
	 case tok_seq:
		return ParseSeqExpr();
	 case tok_while:
		return ParseWhileExpr();
	 case tok_eof:
		return nullptr;
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
	cout << "Codegen:" << Val << endl;
  return ConstantInt::get(C, APInt(64,Val,true));
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
			return Builder.CreateICmpUGT(first,second,"gttmp");
		case tok_gte:
			return Builder.CreateICmpUGE(first,second,"gtetmp");
		case tok_lt:
			return Builder.CreateICmpULT(first,second,"lttmp");
		case tok_lte:
			return Builder.CreateICmpULE(first,second,"ltetmp");
		case tok_eq:
			return Builder.CreateICmpEQ(first,second,"eqtmp");
		case tok_neq:
			return Builder.CreateICmpNE(first,second,"neqtmp");
	}
    return LogErrorV("invalid binary operator");
}

Value *ConditionExprAST::codegen(){
	Value *Br = Branch->codegen();
	if(!Br) return nullptr;
	Br = Builder.CreateICmpEQ(Br,ConstantInt::get(C,APInt(1,1)),""); //i1

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

Value *ConditionConstExprAST::codegen(){
	return ConstantInt::get(C,APInt(1,val)); // 1 bit value i1
}

static int compile() {
  M->setTargetTriple(llvm::sys::getProcessTriple());
  std::vector<Type *> SixInts(6, Type::getInt64Ty(C));
  FunctionType *FT = FunctionType::get(Type::getInt64Ty(C), SixInts, false);
  Function *F = Function::Create(FT, Function::ExternalLinkage, "f", &*M);
  BasicBlock *BB = BasicBlock::Create(C, "entry", F);
  Builder.SetInsertPoint(BB);
  Value *RetVal = ConstantInt::get(C, APInt(64, 0));

  // extract arguments a0-a5 from F->args() and put corresponding values in ArgValues (defined at the top of the file)
  std::string names[6] = {"a0","a1","a2","a3","a4","a5"};
  int i=0;
  int t;
  for(auto &arg:F->args()){ //iterator args()
	  ArgValues[names[i]] = &arg;
	  i++;
  }

  t= getNextToken();
  
   while(t!=tok_eof){
//	cout << CurTok << endl;
	if(t==tok_eof) break;
	if(t==tok_comment){t=getNextToken(); continue;}

	auto V = ParseExpression();
	if(!V) return 1;

	RetVal = V->codegen();

	t = getNextToken();
  }
	Builder.CreateRet(RetVal);
	assert(!verifyModule(*M, &outs()));
	M->dump();

  return 0;
}

int main(void) { return compile(); }
