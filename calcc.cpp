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
#include "llvm/IR/Intrinsics.h"
#include <cassert>
#include <iostream>
#include <stdio.h>
#include <stdint.h>
#include <stack>
using namespace llvm;
using namespace std;

static LLVMContext C;
static IRBuilder<NoFolder> Builder(C);
static std::unique_ptr<Module> M = llvm::make_unique<Module>("calc", C);
static std::map<std::string, Value*> ArgValues;
static std::map<std::string, AllocaInst*> MutValues;
static bool check=false;
int charpos = -1; // everytime you get new char, increment
int operatorpos; // charpos of the last operator
//stack<int> comp; //keeps position numbers of incomplete expressions, pop once complete

// linking external function for overflow situation
static FunctionType *ft_type = FunctionType::get(Type::getInt64Ty(C), Type::getInt64Ty(C),false);
static Function *of_error_call = Function::Create(ft_type,Function::ExternalLinkage, "overflow_fail", &*M);
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

static int gettok() {

  // Skip any whitespace.
  while (isspace(LastChar)|| LastChar == '\n'|| LastChar == '\t' || LastChar == '\r'){
	  LastChar = getchar();
	  charpos++;
  }
  if (LastChar == EOF){
		//cout << "EOF" << endl;
	  return tok_eof;
  }
  if (LastChar == '#') {
    // Read until end of line
    do{
      LastChar = getchar();
	  charpos++;
	}while ((LastChar != EOF) && (LastChar != '\n') && (LastChar != '\r'));
    if (LastChar == EOF){
      return tok_eof;
	}
	LastChar = getchar();
	charpos++;
	return tok_comment;
  }
  if (isalpha(LastChar)) {
    IdentifierStr = LastChar;

    while (isalnum(LastChar=getchar())){ 
		IdentifierStr += LastChar;
		charpos++;
	}
	charpos++; //compensate for the last getchar() call
    if (IdentifierStr == "if"){
		return tok_if;
	}
	if(IdentifierStr == "true"){
	 	 return tok_true;
	}
	if(IdentifierStr=="false"){
		return tok_false;
	}
    if (IdentifierStr == "a0"|| IdentifierStr == "a1"|| IdentifierStr == "a2"|| IdentifierStr == "a3" || IdentifierStr == "a4"|| IdentifierStr == "a5") {
		ArgName = IdentifierStr;
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
	  charpos++;
    } 
    NumVal = strtol(NumStr.c_str(), nullptr,10);
	if(errno == ERANGE){return tok_intoflow;}
    return tok_number;
	 }
	if(LastChar=='('){
	OpenPar++ ;
	LastChar = getchar();
	charpos++;
		if(LastChar == '('){//ouch! back to back left parentheses? 
			return tok_unknown;
		}
		return tok_lparan;
	}
	if(LastChar==')'){ 
		OpenPar-- ;
		LastChar = getchar();
		charpos++;
		return tok_rparan;
	}
	if(LastChar=='+'){
		LastChar = getchar();
		operatorpos = charpos;
		//incomp.push(operatorpos);
		charpos++;
	   	return tok_add;
	}
	if(LastChar=='-'){ 
		LastChar= getchar();
		charpos++;
		if(LastChar==' '){ 
		   	LastChar = getchar();
			operatorpos = charpos;
			//incomp.push(operatorpos);
			charpos++;
			return tok_sub;
		}
		else if(isdigit(LastChar)){
			std::string neg;
			neg="-";
			neg+=LastChar;
			while(isdigit(LastChar=getchar())){
				neg+= LastChar;
				charpos++;
			}
			charpos++; // compensate for the last getchar() call
			NumVal = strtol(neg.c_str(),nullptr,10);
			if(errno == ERANGE){return tok_intoflow;}
	  
			return tok_number;
		}
	}
	if(LastChar=='*'){
		LastChar = getchar();
		operatorpos = charpos;
		//incomp.push(operatorpos);
		charpos++;
		return tok_mul;
	}
	if(LastChar=='/') {
		LastChar = getchar();
		operatorpos = charpos;
		//incomp.push(operatorpos);
		charpos++;
		return tok_div;
	}
	if(LastChar=='%'){
		LastChar = getchar();
		operatorpos = charpos;
		//incomp.push(operatorpos);
	  	charpos++;
	   	return tok_mod;
	}
	if(LastChar=='>'){
		LastChar=getchar();
		charpos++;
		if(LastChar=='='){
			LastChar = getchar();
			charpos++;
		   	return tok_gte;
		}
		LastChar = getchar();
		charpos++;
		return tok_gt;
	}
	if(LastChar=='<'){ 
		LastChar=getchar();
		charpos++;
		if(LastChar=='='){
			LastChar = getchar();
			charpos++;
			return tok_lte;
		}
		LastChar = getchar();
		charpos++;
		return tok_lt;
	}
	if(LastChar=='='){
		LastChar=getchar();
		charpos++;
		if(LastChar=='='){
		   	LastChar = getchar();
			charpos++;
			return tok_eq;
		}
		cout << "SCANNER ERROR NEAR =" << endl;
	}
	if(LastChar == '!'){
		LastChar = getchar();
		charpos++;
		if(LastChar == '='){
			LastChar = getchar();
			charpos++;
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
  int pos; // position of the corresponding operator
  std::unique_ptr<ExprAST> First, Second;

public:
  BinaryExprAST(int Op, std::unique_ptr<ExprAST> First,
                std::unique_ptr<ExprAST> Second, int pos)
      : Op(Op), First(std::move(First)), Second(std::move(Second)), pos(pos) {}
  Value *codegen() override;
};

/// ConditionExprAST - Expression class for a conditional operator, i.e., 'if'
class ConditionExprAST : public ExprAST{
	std::unique_ptr<ExprAST> Branch, Then,Else;

public:
	ConditionExprAST(std::unique_ptr<ExprAST> Branch, std::unique_ptr<ExprAST> Then,std::unique_ptr<ExprAST> Else):Branch(std::move(Branch)), Then(std::move(Then)), Else(std::move(Else)){}
	Value *codegen() override;
};

/// MutExprAST - Expression class for mutable vas

class MutExprAST : public ExprAST{
	std::string name;

	public:
	MutExprAST(const std::string &name): name(name){}
	Value *codegen() override;
};


/// SetExprAST - Expression class for 'set' (set E M)
class SetExprAST : public ExprAST{
	std::unique_ptr<ExprAST> Exp;
	std::string Mut;

	public:
	SetExprAST(std::unique_ptr<ExprAST> Exp, std::string &Mut): Exp(std::move(Exp)), Mut(Mut){}
	Value *codegen() override;
};

class SeqExprAST: public ExprAST{
	std::unique_ptr<ExprAST> First, Second;

	public:
	SeqExprAST(std::unique_ptr<ExprAST> First, std::unique_ptr<ExprAST> Second): First(std::move(First)), Second(std::move(Second)){}
	Value *codegen() override;
};

class WhileExprAST : public ExprAST{
	std::unique_ptr<ExprAST> Cond, Body;

	public:
	WhileExprAST(std::unique_ptr<ExprAST> Cond, std::unique_ptr<ExprAST> Body): Cond(std::move(Cond)), Body(std::move(Body)){}
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
	return llvm::make_unique<ArgExprAST>(ArgName);
}
/// branch ::= true | false
static std::unique_ptr<ExprAST> ParseBranchConsExpr(){

	unsigned int val;

	if(CurTok == tok_true){
	   	val =1;
	}
	if(CurTok == tok_false){
		val = 0;
	}
	//getNextToken(); // advance to the next token, hopefully ')'
		return llvm::make_unique<ConditionConstExprAST>(val);
}
 
// expression ::= '(' expression ')'
static std::unique_ptr<ExprAST> ParseParenExpr() {
  getNextToken(); // eat (, and point CurTok to next
  auto V = ParseExpression();
  if (!V)
	  return nullptr;
   
  getNextToken();
  
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

	first = llvm::make_unique<BinaryExprAST>(op,std::move(first),std::move(second), operatorpos);
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

static std::unique_ptr<ExprAST> ParseMutExpr(){
	return llvm::make_unique<MutExprAST>(VarName);
}

static std::unique_ptr<ExprAST> ParseSeqExpr(){
	getNextToken(); // eat 'seq'
	auto first = ParseExpression();
	if(!first) return nullptr;

	getNextToken();
	auto second = ParseExpression();
	if(!second) return nullptr;

	return llvm::make_unique<SeqExprAST>(std::move(first),std::move(second));
}

static std::unique_ptr<ExprAST> ParseSetExpr(){
	getNextToken(); // eat 'set'

	auto expr = ParseExpression();
	if(!expr) return nullptr;

	getNextToken();
	if(CurTok!= tok_mut) return nullptr;
	//auto mut = ParseExpression();
	//if(!mut) return nullptr;
	std::string mut = VarName;
	return llvm::make_unique<SetExprAST>(std::move(expr),mut);
}

static std::unique_ptr<ExprAST> ParseWhileExpr(){
	getNextToken();

	auto cond = ParseExpression();
	if(!cond) return nullptr;

	getNextToken();
	auto body = ParseExpression();
	if(!body) return nullptr;

	return llvm::make_unique<WhileExprAST>(std::move(cond),std::move(body));
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
	 case tok_mut:
		return ParseMutExpr();
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
	//	cout << "Codegen:" << Val << endl;
  return ConstantInt::get(C, APInt(64,Val,true));
}

Value *ArgExprAST::codegen(){
	Value *V = ArgValues[Name];
	if(!V){
		return nullptr;
	}
	return V;
}

// function to call the overflow add intrinsics
//
// switch case increases IR size, can write better code
Value *OverflowRoutine(int binOp,int pos, Value *arg1, Value *arg2){
	Value *res64, *of,*v;
	Value *intrinsic_args[2] = {arg1,arg2};

	//switch(binOp){
		if(binOp == tok_add){
			Function *sadd_f = Intrinsic::getDeclaration(&*M,Intrinsic::sadd_with_overflow, ArrayRef<Type *>(Type::getInt64Ty(C)));
			v = Builder.CreateCall(sadd_f, ArrayRef<Value *>(intrinsic_args,2));
			res64 = Builder.CreateExtractValue(v,ArrayRef<unsigned>(0));
			of = Builder.CreateExtractValue(v, ArrayRef<unsigned>(1));
		}
		else if(binOp == tok_sub){
			Function *ssub_f = Intrinsic::getDeclaration(&*M,Intrinsic::ssub_with_overflow, ArrayRef<Type *>(Type::getInt64Ty(C)));
			v = Builder.CreateCall(ssub_f, ArrayRef<Value *>(intrinsic_args,2));
			res64 = Builder.CreateExtractValue(v,ArrayRef<unsigned>(0));
			of = Builder.CreateExtractValue(v, ArrayRef<unsigned>(1));
		}
		else{
			Function *smul_f = Intrinsic::getDeclaration(&*M,Intrinsic::smul_with_overflow, ArrayRef<Type *>(Type::getInt64Ty(C)));
			v = Builder.CreateCall(smul_f, ArrayRef<Value *>(intrinsic_args,2));
			res64 = Builder.CreateExtractValue(v,ArrayRef<unsigned>(0));
			of = Builder.CreateExtractValue(v, ArrayRef<unsigned>(1));
		}
	//}

	// now generate code for the overflow check
	Value *of_br = Builder.CreateICmpEQ(of,ConstantInt::get(C,APInt(1,1)),"");
	Function *f = Builder.GetInsertBlock()->getParent();
	BasicBlock *thenbb = BasicBlock::Create(C,"",f);
	BasicBlock *elsebb = BasicBlock::Create(C,"");
	BasicBlock *finalbb = BasicBlock::Create(C,"");
	
	APInt ofpos = APInt(64,pos);
	Builder.CreateCondBr(of_br,thenbb,elsebb);

	Builder.SetInsertPoint(thenbb);
	std::vector <Value *> args;
	args.push_back(ConstantInt::get(C,ofpos));
	Builder.CreateCall(of_error_call,args,"");
	
	Builder.CreateBr(finalbb);
	thenbb = Builder.GetInsertBlock();

	f->getBasicBlockList().push_back(elsebb);
	Builder.SetInsertPoint(elsebb);
	
	Builder.CreateBr(finalbb);
	elsebb = Builder.GetInsertBlock();
	
	f->getBasicBlockList().push_back(finalbb);
	Builder.SetInsertPoint(finalbb);
	PHINode *phi = Builder.CreatePHI(Type::getInt64Ty(C),2,"");

	phi->addIncoming(res64,thenbb);
	phi->addIncoming(res64,elsebb);

	return phi;
}

//division check
//two things should be checked
//1. div by 0
//2. LONG_MIN div by -1
//if arg2 == 0, thenbb0, elsebb0
//inside elsebb0, if arg2 == -1 && arg1 == MIN64, thenmin, elsemin
Value *DivRoutine(int binOp,int pos, Value *arg1, Value *arg2){
	//if(opstack.empty()){cout << "empty" << endl;}
	//opstack.pop();

	//first condition
	Value *arg2zero = Builder.CreateICmpEQ(arg2, ConstantInt::get(C,APInt(64,0)),"");

	//second condition
	Value *arg1min = Builder.CreateICmpEQ(arg1,ConstantInt::get(C,APInt::getSignedMinValue(64)), "");
	Value *arg2neg1 = Builder.CreateICmpEQ(arg2, ConstantInt::get(C,APInt(64,-1)),"");
	Value *check2 = Builder.CreateAnd(arg1min,arg2neg1,"");
	
	Value *trapval = ConstantInt::get(C,APInt(64,-1));// this value does not matter because we exit(-1) before this point
	
	//basic blocks
	Function *f = Builder.GetInsertBlock()->getParent();
	
	BasicBlock *thenbb0 = BasicBlock::Create(C,"",f);
	BasicBlock *elsebb0 = BasicBlock::Create(C,"");
	BasicBlock *finalbb0 = BasicBlock::Create(C,"",f);

	Builder.CreateCondBr(arg2zero,thenbb0,elsebb0);
	//arg==0 is true
	Builder.SetInsertPoint(thenbb0);
	std::vector<Value *> args;
	args.push_back(ConstantInt::get(C,APInt(64,pos)));
	Builder.CreateCall(of_error_call,args,""); // call external function

	Builder.CreateBr(finalbb0);
	thenbb0 = Builder.GetInsertBlock();
	f->getBasicBlockList().push_back(elsebb0);
	Builder.SetInsertPoint(elsebb0);
	// basic blocks for the second condition inside elsebb0
	BasicBlock *thenbb1 = BasicBlock::Create(C,"",f);
	BasicBlock *elsebb1 = BasicBlock::Create(C,"");
	BasicBlock *finalbb1 = BasicBlock::Create(C,"",f);
	
	Builder.CreateCondBr(check2,thenbb1,elsebb1);
	Builder.SetInsertPoint(thenbb1);
	std::vector<Value *>args1;
	args.push_back(ConstantInt::get(C,APInt(64,pos)));
	Builder.CreateCall(of_error_call,args,"");
	
	//if no problems detected, do the usual division
	Builder.CreateBr(finalbb1);
	thenbb1 = Builder.GetInsertBlock();
	f->getBasicBlockList().push_back(elsebb1);
	Builder.SetInsertPoint(elsebb1);
	Value *elsebb1val = Builder.CreateUDiv(arg1,arg2,"");
	if(!elsebb1val) return nullptr;

	PHINode *phi1 = Builder.CreatePHI(Type::getInt64Ty(C),2,"");
	phi1->addIncoming(trapval,thenbb1);
	phi1->addIncoming(elsebb1val,elsebb1);

	Builder.CreateBr(finalbb0);
	elsebb0 = Builder.GetInsertBlock();
	f->getBasicBlockList().push_back(finalbb0);
	Builder.SetInsertPoint(finalbb0);
	PHINode *phi0 = Builder.CreatePHI(Type::getInt64Ty(C),2,"");
	phi0->addIncoming(trapval,thenbb0);
	phi0->addIncoming(phi1,elsebb0);

	return phi0;
}


// modulo check
Value *ModRoutine(int binOp,int pos, Value *arg1, Value *arg2){
	
	//opstack.pop();

	//check if arg2 is 0
	Value *arg2zero = Builder.CreateICmpEQ(arg2, ConstantInt::get(C,APInt(64,0)),"");
	Function *f = Builder.GetInsertBlock()->getParent();

	//if-then-else codegen
	BasicBlock *thenbb = BasicBlock::Create(C, "", f);
	BasicBlock *elsebb = BasicBlock::Create(C, "");
	BasicBlock *finalbb = BasicBlock::Create(C, "");

	Builder.CreateCondBr(arg2zero, thenbb, elsebb);

	Builder.SetInsertPoint(thenbb);
	APInt modZeroPos = APInt(64,pos);
	std::vector<Value *> args;
	args.push_back(ConstantInt::get(C,modZeroPos));
	Builder.CreateCall(of_error_call, args, ""); // call external function

	//return this value if mod 0
	Value *trapVal = ConstantInt::get(C,APInt(64,-1));// the return value of thenbb does not matter because 'trap' kill the program with exit(-1) before the execution raaches this point

	Builder.CreateBr(finalbb);
	thenbb = Builder.GetInsertBlock();

	f->getBasicBlockList().push_back(elsebb);
	Builder.SetInsertPoint(elsebb);

	Value *noTrapVal = Builder.CreateURem(arg1,arg2,"modtmp");// do the mod as usual
	if(!noTrapVal) return nullptr;

	Builder.CreateBr(finalbb);

	elsebb = Builder.GetInsertBlock();

	f->getBasicBlockList().push_back(finalbb);
	Builder.SetInsertPoint(finalbb);

	PHINode *phi = Builder.CreatePHI(Type::getInt64Ty(C),2,"");

	phi->addIncoming(trapVal,thenbb);
	phi->addIncoming(noTrapVal,elsebb);

	return phi;
}

Value *BinaryExprAST::codegen() {
  Value *first = First->codegen();
  Value *second = Second->codegen();
  if (!First || !Second)
	  return nullptr;

	switch(Op){
		case tok_add:{
			if(!check) return Builder.CreateAdd(first, second, "addtmp");
			return OverflowRoutine(Op, pos, first,second);
			//return OverflowRoutine(Op, incomp.top(), first,second);
		}
		case tok_sub:{
			if(!check) return Builder.CreateSub(first, second, "subtmp");
			return OverflowRoutine(Op, pos,first,second);
			//return OverflowRoutine(Op, incomp.top(), first,second);
		}
		case tok_mul:{
			if(!check) return Builder.CreateMul(first, second, "multmp");
			return OverflowRoutine(Op, pos,first,second);
			//return OverflowRoutine(Op, incomp.top(), first,second);
		}
		case tok_div:{
			if(!check) return Builder.CreateUDiv(first,second,"divtmp");
			return DivRoutine(Op, pos,first,second);
			//return DivRoutine(Op, incomp.top(), first,second);
		}
		case tok_mod:{
			if(!check) return Builder.CreateURem(first, second, "modtmp");
			return ModRoutine(Op, pos,first,second);
			//return ModRoutine(Op, incomp.top(), first,second);
		}
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

	Function *iff = Builder.GetInsertBlock()->getParent();

	BasicBlock *ThenBB = BasicBlock::Create(C,"then",iff);
	BasicBlock *ElseBB = BasicBlock::Create(C,"else");
	BasicBlock *MergeBB = BasicBlock::Create(C,"");

	Builder.CreateCondBr(Br, ThenBB, ElseBB);
	Builder.SetInsertPoint(ThenBB);

	Value *then_val = Then->codegen();
	if(!then_val) return nullptr;

	Builder.CreateBr(MergeBB);
	
	ThenBB = Builder.GetInsertBlock();
	iff->getBasicBlockList().push_back(ElseBB);
	Builder.SetInsertPoint(ElseBB);

	Value *else_val = Else->codegen();
	if(!else_val) return nullptr;

	Builder.CreateBr(MergeBB);
	ElseBB = Builder.GetInsertBlock();

	iff->getBasicBlockList().push_back(MergeBB);
	Builder.SetInsertPoint(MergeBB);
	PHINode *PN = Builder.CreatePHI(Type::getInt64Ty(C),2,"iftmp");

	PN->addIncoming(then_val,ThenBB);
	PN->addIncoming(else_val,ElseBB);

	return PN;
}

Value *ConditionConstExprAST::codegen(){
	return ConstantInt::get(C,APInt(1,val)); // 1 bit value i1
}

Value *MutExprAST::codegen(){
	Value *v = MutValues[name];
	if(!v) return nullptr;

	return Builder.CreateLoad(v, name.c_str());
}

Value *SeqExprAST::codegen(){
	Value* first = First->codegen();
	Value *second = Second->codegen();
	if(!first|| !second) return nullptr;

	return second;
}

// (set E M) 
Value *SetExprAST::codegen(){
	Value *expr = Exp->codegen();
	if(!expr) return nullptr;
	
	Value *m = MutValues[Mut];
	Builder.CreateStore(expr,m);
	return expr;
}

Value *WhileExprAST::codegen(){
	Function *f = Builder.GetInsertBlock()->getParent();
	BasicBlock *bb0 = Builder.GetInsertBlock();
	
	//Builder.SetInsertPoint(bb0);

	Value *start = Constant::getNullValue(Type::getInt64Ty(C));
	if(!start) return nullptr;
	
	BasicBlock *loop = BasicBlock::Create(C,"",f);

	Builder.CreateBr(loop);

	Builder.SetInsertPoint(loop);
	PHINode *phi = Builder.CreatePHI(Type::getInt64Ty(C),2,"");
	phi->addIncoming(start,bb0);
	Value *cond = Cond->codegen();
	if(!cond) return nullptr;

	Value *cmp = Builder.CreateICmpEQ(cond, ConstantInt::get(C,APInt(1,1)),"");

	BasicBlock *bb1 = BasicBlock::Create(C,"",f);
	BasicBlock *bb2 = BasicBlock::Create(C,"",f);
	//M->dump();

	Builder.CreateCondBr(cmp,bb2,bb1);
	//M->dump();
	Builder.SetInsertPoint(bb2); 
	Value *v = Body->codegen();
	if(!v) return nullptr;

	BasicBlock *bb3 = Builder.GetInsertBlock();
	phi->addIncoming(v,bb3);
	Builder.CreateBr(loop);

	//M->dump();
	Builder.SetInsertPoint(bb1);

	//terminate basic block
	//bb0->llvm::BasicBlock::getTerminator();
	//loop->llvm::BasicBlock::getTerminator();
	//bb1->llvm::BasicBlock::getTerminator();
	//bb2->llvm::BasicBlock::getTerminator();
	//bb3->llvm::BasicBlock::getTerminator();
	//M->dump();
	return phi;
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
  std::string mutables[10] = {"m0","m1","m2","m3","m4","m5","m6","m7","m8","m9"};
  int i = 0;
  int t;
 
  ArgValues.clear();
  for(auto &arg:F->args()){ //iterator args()
	  arg.setName(names[i]);
	  ArgValues[arg.getName().str()] = &arg;
	  i++;
  }
	
  // use alloca for mutable vars
  Value *z = ConstantInt::get(C,APInt(64,0)); // init to 0
  for(i=0;i<=9;i++){
	IRBuilder<> ir(&F->getEntryBlock(),F->getEntryBlock().begin());
	AllocaInst *alloca = ir.CreateAlloca(Type::getInt64Ty(C),nullptr,mutables[i]);
	Builder.CreateStore(z,alloca);
	MutValues[mutables[i]] = alloca;
  }

  t= getNextToken();
  
   while(t!=tok_eof){

	if(t==tok_eof) break;
	if(t==tok_comment){t=getNextToken(); continue;}

	auto V = ParseExpression();
	if(!V) return 1;

	RetVal = V->codegen();

	t = getNextToken();
  }

	Builder.CreateRet(RetVal);
	//BB->llvm::BasicBlock::getTerminator();
	M->dump();
	assert(!verifyModule(*M, &outs()));
	//cout << "num. of chars=" << charpos << endl;
  return 0;
}

int main(int argc, char **argv) { 
	if(argc==2){
		if(!strncmp(argv[1],"-check",6)) check = true;
		else{
			cout <<"bad argument!"<< endl;
			exit(1);
		}
	} 
	return compile(); 
}
