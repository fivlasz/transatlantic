grammar LLVM;

options {
  output=AST;
  ASTLabelType=CommonTree;
}

I :   "title:    LLVM assembly language\n"
      ^ "status:   experimental\n"
      ^ "audience: LLVM developers\n"
;

S : Module ;

/*
Define rules for non-keyword tokens. This is currently just a bunch
of hacks. They don't cover many valid forms of tokens, and they also
generate some invalid forms of tokens. The LLVM parser has custom
C++ code to lex these; custom C++ code for emitting them would be
convenient, but polygen doesn't support that.
*/
fragment
NonZeroDecimalDigit : '1'..'9' ;
fragment
DecimalDigit        : '0'..'9' ;
DecimalDigitSeq     : DecimalDigit (DecimalDigitSeq)?;
fragment
HexDigit            : (DecimalDigit|'a'..'f'|'A'..'F') ;
HexDigitSeq         : HexDigit (HexDigitSeq)*;
StringChar          : ('a'..'z'|'A'..'Z') ;
StringConstantSeq   : StringChar (StringConstantSeq)?;
StringConstant      : StringChar (StringConstantSeq)?;
EUINT64VAL          : NonZeroDecimalDigit (DecimalDigitSeq)? ;
ESINT64VAL          : ('-')? EUINT64VAL ;
EUAPINTVAL          : EUINT64VAL ;
ESAPINTVAL          : ESINT64VAL ;
LOCALVALID          : '%' DecimalDigitSeq ;
GLOBALVALID         : '@' DecimalDigitSeq ;
INTTYPE             : 'i' EUINT64VAL ;
GLOBALVAR           : '@' StringConstant ;
LOCALVAR            : '%' StringConstant ;
STRINGCONSTANT      : '\"' StringConstant '\"' ;
ATSTRINGCONSTANT    : '@' STRINGCONSTANT ;
PCTSTRINGCONSTANT   : '%' STRINGCONSTANT ;
LABELSTR            : StringConstant ;
FPVAL               : ESAPINTVAL '.' EUAPINTVAL | '0x' HexDigitSeq ;

/*
The rest of this file is derived directly from llvmAsmParser.y.
*/

ArithmeticOps : 'add' (OptNW)? | 'fadd' | 'sub' (OptNW)? | 'fsub' | 'mul' (OptNW)? | 'fmul' |
                  'udiv' | 'sdiv' OptExact | 'fdiv' | 'urem' | 'srem' | 'frem' ;
LogicalOps    : 'shl' | 'lshr' | 'ashr' | 'and' | 'or' | 'xor';
CastOps       : 'trunc' | 'zext' | 'sext' | 'fptrunc' | 'fpext' | 'bitcast' |
                  'uitofp' | 'sitofp' | 'fptoui' | 'fptosi' | 'inttoptr' | 'ptrtoint' ;

IPredicates : 'eq' | 'ne' | 'slt' | 'sgt' | 'sle' | 'sge' | 'ult' | 'ugt' | 'ule' | 'uge' ;

FPredicates : 'oeq' | 'one' | 'olt' | 'ogt' | 'ole' | 'oge' | 'ord' | 'uno' | 'ueq' | 'une'
              | 'ult' | 'ugt' | 'ule' | 'uge' | 'true' | 'false' ;

IntType : INTTYPE;
FPType  : float | double | "ppc_fp128" | fp128 | "x86_fp80";

LocalName : LOCALVAR | STRINGCONSTANT | PCTSTRINGCONSTANT ;
OptLocalName : LocalName | _ ;

OptAddrSpace : - addrspace ^ "(" ^ EUINT64VAL ^ ")" | _ ;

OptLocalAssign : LocalName "=" | _ ;

GlobalName : GLOBALVAR | ATSTRINGCONSTANT ;

OptGlobalAssign : GlobalAssign | _ ;

GlobalAssign : GlobalName "=" ;

GVInternalLinkage
  : + internal
 | weak
 | "weak_odr"
 | linkonce
 | "linkonce_odr"
 | appending
 | dllexport
 | common
 | private
 | "linker_private"
 | "linker_private_weak"
 ;

GVExternalLinkage
  : dllimport
 | "extern_weak"
 | + external
 ;

GVVisibilityStyle
  : + _
 | default
 | hidden
 | protected
 ;

FunctionDeclareLinkage
  : + _
 | dllimport
 | "extern_weak"
 ;

FunctionDefineLinkage
  : + _
 | internal
 | linkonce
 | "linkonce_odr"
 | weak
 | "weak_odr"
 | dllexport
 ;

AliasLinkage : + _ | weak | "weak_odr" | internal ;

OptCallingConv : + _ |
                 ccc |
                 fastcc |
                 coldcc |
                 "x86_stdcallcc" |
                 "x86_fastcallcc" |
                 cc EUINT64VAL ;

ParamAttr : zeroext
 | signext
 | inreg
 | sret
 | noalias
 | nocapture
 | byval
 | nest
 | align EUINT64VAL
 ;

OptParamAttrs : + _ | OptParamAttrs ParamAttr ;

RetAttr       : inreg
              | zeroext
              | signext
              | noalias
              ;

OptRetAttrs  : _
             | OptRetAttrs RetAttr
             ;

FuncAttr      : noreturn
 | nounwind
 | inreg
 | zeroext
 | signext
 | readnone
 | readonly
 | inlinehint
 | alignstack
 | noinline
 | alwaysinline
 | optsize
 | ssp
 | sspreq
 | returns_twice
 | nonlazybind
 | address_safety
 | thread_safety
 | uninitialized_checks
 ;

OptFuncAttrs  : + _ | OptFuncAttrs FuncAttr ;

OptGC         : + _ | gc STRINGCONSTANT ;

OptAlign      : + _ | align EUINT64VAL ;
OptCAlign     : + _ | ^ "," align EUINT64VAL ;

SectionString : section STRINGCONSTANT ;

OptSection    : + _ | SectionString ;

GlobalVarAttributes : + _ | ^ "," GlobalVarAttribute GlobalVarAttributes ;
GlobalVarAttribute  : SectionString | align EUINT64VAL ;

PrimType : INTTYPE | float | double | "ppc_fp128" | fp128 | "x86_fp80"
          | - label ;

Types
  : opaque
 | PrimType
 | Types OptAddrSpace ^ "*"
 | SymbolicValueRef
 | "\\" ^ EUINT64VAL
 | Types "(" ^ ArgTypeListI ^ ")" OptFuncAttrs
 | void "(" ^ ArgTypeListI ^ ")" OptFuncAttrs
 | "[" ^ EUINT64VAL "x" Types ^ "]"
 | "<" ^ EUINT64VAL "x" Types ^ ">"
 | "{" TypeListI "}"
 | "{" ^ "}"
 | "<" ^ "{" TypeListI "}" ^ ">"
 | "<" ^ "{" ^ "}" ^ ">"
 ;

ArgType : Types OptParamAttrs ;

ResultTypes : Types | void ;

ArgTypeList : ArgType | ArgTypeList ^ "," ArgType ;

ArgTypeListI : ArgTypeList | ArgTypeList ^ "," "..." | "..." | _ ;

TypeListI : Types | TypeListI ^ "," Types ;

ConstVal: Types "[" ^ ConstVector ^ "]"
 | Types "[" ^ "]"
 | Types "c" ^ STRINGCONSTANT
 | Types "<" ^ ConstVector ^ ">"
 | Types "{" ConstVector "}"
 | Types "{" ^ "}"
 | Types "<" ^ "{" ConstVector "}" ^ ">"
 | Types "<" ^ "{" ^ "}" ^ ">"
 | Types null
 | Types undef
 | Types SymbolicValueRef
 | Types ConstExpr
 | Types zeroinitializer
 | Types ESINT64VAL
 | Types ESAPINTVAL
 | Types EUINT64VAL
 | Types EUAPINTVAL
 | Types true
 | Types false
 | Types FPVAL ;

ConstExpr: CastOps "(" ^ ConstVal to Types ^ ")"
 | getelementptr OptInBounds "(" ^ ConstVal IndexList ^ ")"
 | select "(" ^ ConstVal ^ "," ConstVal ^ "," ConstVal ^ ")"
 | ArithmeticOps "(" ^ ConstVal ^ "," ConstVal ^ ")"
 | LogicalOps "(" ^ ConstVal ^ "," ConstVal ^ ")"
 | icmp IPredicates "(" ^ ConstVal ^ "," ConstVal ^ ")"
 | fcmp FPredicates "(" ^ ConstVal ^ "," ConstVal ^ ")"
 | extractelement "(" ^ ConstVal ^ "," ConstVal ^ ")"
 | insertelement "(" ^ ConstVal ^ "," ConstVal ^ "," ConstVal ^ ")"
 | shufflevector "(" ^ ConstVal ^ "," ConstVal ^ "," ConstVal ^ ")"
 | extractvalue "(" ^ ConstVal ^ ConstantIndexList ^ ")"
 | insertvalue "(" ^ ConstVal ^ "," ConstVal ^ ConstantIndexList ^ ")" ;

ConstVector : ConstVector ^ "," ConstVal | ConstVal ;

GlobalType : global | constant ;

ThreadLocal : - "thread_local" | _ ;

AliaseeRef : ResultTypes SymbolicValueRef
 | bitcast "(" ^ AliaseeRef to Types ^ ")" ;

Module : +++ DefinitionList | --- _ ;

DefinitionList : - Definition | + DefinitionList Definition ;

Definition
  : ^ ( +++++ define Function
 | declare FunctionProto
 | - module asm AsmBlock
 | OptLocalAssign type Types
 | OptGlobalAssign GVVisibilityStyle ThreadLocal OptAddrSpace GlobalType
   ConstVal GlobalVarAttributes
 | OptGlobalAssign GVInternalLinkage GVVisibilityStyle ThreadLocal OptAddrSpace
   GlobalType ConstVal GlobalVarAttributes
 | OptGlobalAssign GVExternalLinkage GVVisibilityStyle ThreadLocal OptAddrSpace
   GlobalType Types GlobalVarAttributes
 | OptGlobalAssign GVVisibilityStyle alias AliasLinkage AliaseeRef
 | target TargetDefinition
 | deplibs "=" LibrariesDefinition
 ) ^ "\n";

AsmBlock : STRINGCONSTANT ;

TargetDefinition : triple "=" STRINGCONSTANT
 | datalayout "=" STRINGCONSTANT ;

LibrariesDefinition : "[" ( LibList | _ ) "]";

LibList : LibList ^ "," STRINGCONSTANT | STRINGCONSTANT ;

ArgListH : ArgListH ^ "," Types OptParamAttrs OptLocalName
 | Types OptParamAttrs OptLocalName ;

ArgList : ArgListH | ArgListH ^ "," "..." | "..." | _ ;

FunctionHeaderH : OptCallingConv OptRetAttrs ResultTypes
                  GlobalName ^ "(" ^ ArgList ^ ")"
                  OptFuncAttrs OptSection OptAlign OptGC ;

BEGIN : ( begin | "{" ) ^ "\n";

FunctionHeader :
  FunctionDefineLinkage GVVisibilityStyle FunctionHeaderH BEGIN ;

END : ^ ( end | "}" ) ^ "\n";

Function : BasicBlockList END ;

FunctionProto : FunctionDeclareLinkage GVVisibilityStyle FunctionHeaderH ;

OptSideEffect : _ | sideeffect ;

ConstValueRef : ESINT64VAL
 | EUINT64VAL
 | FPVAL
 | true
 | false
 | null
 | undef
 | zeroinitializer
 | "<" ConstVector ">"
 | "[" ConstVector "]"
 | "[" ^ "]"
 | "c" ^ STRINGCONSTANT
 | "{" ConstVector "}"
 | "{" ^ "}"
 | "<" ^ "{" ConstVector "}" ^ ">"
 | "<" ^ "{" ^ "}" ^ ">"
 | ConstExpr
 | asm OptSideEffect STRINGCONSTANT ^ "," STRINGCONSTANT ;

SymbolicValueRef : LOCALVALID
 | GLOBALVALID
 | LocalName
 | GlobalName ;

ValueRef : SymbolicValueRef | ConstValueRef;

ResolvedVal : Types ValueRef ;

ReturnedVal : ResolvedVal | ReturnedVal ^ "," ResolvedVal ;

BasicBlockList : BasicBlockList BasicBlock | FunctionHeader BasicBlock ;

BasicBlock : InstructionList OptLocalAssign BBTerminatorInst ;

InstructionList : +++ InstructionList Inst
 | - _
 | ^ LABELSTR ^ ":\n" ;

BBTerminatorInst : ^ "  " ^
 ( ret ReturnedVal
 | ret void
 | br label ValueRef
 | br INTTYPE ValueRef ^ "," label ValueRef ^ "," label ValueRef
 | switch IntType ValueRef ^ "," label ValueRef "[" JumpTable "]"
 | switch IntType ValueRef ^ "," label ValueRef "[" ^ "]"
 | invoke OptCallingConv ResultTypes ValueRef ^ "(" ^ ParamList ^ ")"
   OptFuncAttrs
   to label ValueRef unwind label ValueRef
 | unwind
 | unreachable ) ^ "\n";

JumpTable : JumpTable IntType ConstValueRef ^ "," label ValueRef
 | IntType ConstValueRef ^ "," label ValueRef ;

Inst : ^ "  " ^ OptLocalAssign InstVal ^ "\n";

PHIList : Types "[" ValueRef ^ "," ValueRef "]"
 | PHIList ^ "," "[" ValueRef ^ "," ValueRef "]" ;

ParamList : Types OptParamAttrs ValueRef OptParamAttrs
 | label OptParamAttrs ValueRef OptParamAttrs
 | ParamList ^ "," Types OptParamAttrs ValueRef OptParamAttrs
 | ParamList ^ "," label OptParamAttrs ValueRef OptParamAttrs
 | - _ ;

IndexList : _ | IndexList ^ "," ResolvedVal ;

ConstantIndexList : "," EUINT64VAL | ConstantIndexList ^ "," EUINT64VAL ;

OptTailCall : tail call | call ;

InstVal :
   ArithmeticOps Types ValueRef ^ "," ValueRef
 | LogicalOps Types ValueRef ^ "," ValueRef
 | icmp IPredicates Types ValueRef ^ "," ValueRef
 | fcmp FPredicates Types ValueRef ^ "," ValueRef
 | CastOps ResolvedVal to Types
 | select ResolvedVal ^ "," ResolvedVal ^ "," ResolvedVal
 | "va_arg" ResolvedVal ^ "," Types
 | extractelement ResolvedVal ^ "," ResolvedVal
 | insertelement ResolvedVal ^ "," ResolvedVal ^ "," ResolvedVal
 | shufflevector ResolvedVal ^ "," ResolvedVal ^ "," ResolvedVal
 | phi PHIList
 | OptTailCall OptCallingConv ResultTypes ValueRef ^ "(" ^ ParamList ^ ")"
   OptFuncAttrs
 | MemoryInst ;

OptVolatile : volatile ;
OptExact : 'exact' ;
OptNSW : nsw ;
OptNUW : nuw ;
OptNW  : OptNUW OptNSW | OptNSW OptNUW ;
OptInBounds  : inbounds ;

MemoryInst : malloc Types OptCAlign
 | malloc Types ^ "," INTTYPE ValueRef OptCAlign
 | alloca Types OptCAlign
 | alloca Types ^ "," INTTYPE ValueRef OptCAlign
 | free ResolvedVal
 | OptVolatile load Types ValueRef OptCAlign
 | OptVolatile store ResolvedVal ^ "," Types ValueRef OptCAlign
 | getresult Types ValueRef ^ "," EUINT64VAL
 | getelementptr OptInBounds Types ValueRef IndexList
 | extractvalue Types ValueRef ^ ConstantIndexList 
 | insertvalue Types ValueRef ^ "," Types ValueRef ^ ConstantIndexList ;
