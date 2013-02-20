tree grammar CILTransformer;

options {
  output       = AST;
  tokenVocab   = CIL;
  ASTLabelType = CommonTree;
  rewrite      = true; // rewrites a tree
}

tokens {
  FILEALIGNMENT;
}

start           : decls
                ;      

decls                   : (/* EMPTY */) (decl)*
                            ;
/* Module-level declarations */
decl                    : classHead '{'! classDecls '}'! 
                        | nameSpaceHead '{'! decls '}'! 
                        | methodHead  methodDecls '}'! 
                        | fieldDecl
                        | dataDecl
                        | vtableDecl
                        | vtfixupDecl
                        | extSourceSpec
                        | fileDecl
                        | assemblyHead '{'! assemblyDecls '}'! 
                        | assemblyRefHead '{'! assemblyRefDecls '}'! 
                        | exptypeHead '{'! exptypeDecls '}'! 
                        | manifestResHead '{'! manifestResDecls '}'! 
                        | moduleHead
                        | secDecl
                        | customAttrDecl
                        | '.subsystem'^ int32 
                        | '.corflags'^ int32 
                        | '.file' 'alignment' int32 -> ^(FILEALIGNMENT int32) 
                        | '.imagebase'^ int64 
                        | '.stackreserve'^ int64 
                        | languageDecl
                        | typedefDecl
                        | '.typelist'^ '{'! classNameSeq '}'!
                        | '.mscorlib' 
                        ;
                        
classNameSeq            : /* EMPTY */
                        | className classNameSeq
                        ;                        

compQstring             : (QSTRING) ('+' QSTRING)* 
                        ;

languageDecl            : '.language'! SQSTRING 
                        | '.language'! SQSTRING ','! SQSTRING 
                        | '.language'! SQSTRING ','! SQSTRING ','! SQSTRING 
                        ;
/*  Basic tokens  */                        
id                      : ID 
                        | SQSTRING 
                        ;

dottedName              : (id^ | DOTTEDNAME^) ('.'! dottedName^)* 
                        ;

int32                   : INT32 
                        ;

int64                   : //INT64 
                        /*|*/ INT32 
                        ;

float64                 : FLOAT64 
                        | 'float32' '('! int32 ')'! 
                        | 'float64' '('! int64 ')'! 
                        ;

/*  Aliasing of types, type specs, methods, fields and custom attributes */
typedef_ts              : '.typedef'! type 'as'! dottedName ;
typedef_t               : '.typedef'! className 'as'! dottedName ;
typedef_m               : '.typedef'! memberRef 'as'! dottedName ;
typedef_f               : typedef_m ;
typedef_mr              : typedef_m ;
typedef_ca              : '.typedef'! customDescr 'as'! dottedName 
                        | '.typedef'! customDescrWithOwner 'as'! dottedName
                        ;
typedefDecl             : typedef_ts 
                        | typedef_t 
                        | typedef_m 
                        | typedef_ca 
                        ;
/* Custom attribute declarations  */
customDescr             : '.custom'! customType 
                        | '.custom' customType '=' compQstring -> ^(customType compQstring) 
                        | '.custom' customType '=' '{' customBlobDescr '}' -> ^(customType customBlobDescr) 
                        | customHead bytes ')' -> ^(customHead bytes) 
                        ;

customDescrWithOwner    : '.custom' '(' ownerType ')' customType 
                        | '.custom'! '('! ownerType ')'! customType '='! compQstring 
                        | '.custom' '(' ownerType ')' customType '=' '{' customBlobDescr '}' 
                        | customHeadWithOwner bytes ')' 
                        ;
                        
customHead              : '.custom' customType '=' '(' 
                        ;

customHeadWithOwner     : '.custom' '(' ownerType ')' customType '=' '(' 
                        ;

customType              : methodRef 
                        ;

ownerType               : typeSpec 
                        | memberRef 
                        ;

/*  Verbal description of custom attribute initialization blob  */                        
customBlobDescr         : customBlobArgs customBlobNVPairs 
                        ;
                        
customBlobArgs          : (/* EMPTY */) (serInit)* 
                        ;
                        
customBlobNVPairs       : (/* EMPTY */) (fieldOrProp serializType dottedName '=' serInit)* 
                        ;

fieldOrProp             : 'field' 
                        | 'property' 
                        ;

customAttrDecl          : customDescr 
                        | customDescrWithOwner 
                        | typedef_ca 
                        ;
                        
serializType            : (simpleType | 'type' | 'object' | 'enum' 'class' SQSTRING | 'enum' className) ('[' ']' )*
                                 ;

                        
/*  Module declaration */
moduleHead              : '.module' 
                        | '.module' dottedName 
                        | '.module' 'extern' dottedName 
                        ;
                        
/*  VTable Fixup table declaration  */
vtfixupDecl             : '.vtfixup' '[' int32 ']' vtfixupAttr 'at' id 
                        ;

vtfixupAttr             : (/* EMPTY */) ('int32' | 'int64' | 'fromunmanaged' | 'callmostderived' | 'retainappdomain')* 
                        ;

vtableDecl              : vtableHead bytes ')'   /* deprecated */ 
                        ;

vtableHead              : '.vtable' '=' '('        /* deprecated */ 
                        ;

/*  Namespace and class declaration  */                         
nameSpaceHead           : '.namespace' dottedName 
                        ;
classHeadBegin          : '.class' classAttr dottedName typarsClause 
                        ;
classHead               : classHeadBegin extendsClause implClause 
                        ;

classAttr               : (/* EMPTY */) ('public' | 'private' | 'value' | 'enum' | 'interface' | 'sealed' | 'abstract' | 'auto' | 'sequential' | 'explicit' | 'ansi' | 'unicode' | 'autochar' | 'import' | 'serializable' | 'nested' 'public' | 'nested' 'private' | 'nested' 'family' | 'nested' 'assembly' | 'nested' 'famandassem' | 'nested' 'famorassem' | 'beforefieldinit' | 'specialname' | 'rtspecialname' | 'flags' '(' int32 ')')* 
                        ;

extendsClause           : /* EMPTY */                                           
                        | 'extends' typeSpec 
                        ;

implClause              : /* EMPTY */
                        | 'implements' implList
                        ;

classDecls              : (/* EMPTY */) (classDecl)*
                        ;
                        
implList                : (typeSpec) (',' typeSpec)*
                              ;

/* Generic type parameters declaration  */                         
typeList                : /* EMPTY */ 
                        | typeListNotEmpty 
                        ;
                        
typeListNotEmpty        : (typeSpec) (',' typeSpec)* 
                        ;

typarsClause            : /* EMPTY */ 
                        | '<' typars '>' 
                        ;

typarAttrib             : '+' 
                        | '-' 
                        | 'class' 
                        | 'valuetype' 
                        | '.ctor' 
                        ;
                  
typarAttribs            : /* EMPTY */ 
                        | typarAttrib typarAttribs                          
                        ;

typars                  : typarAttribs tyBound dottedName typarsRest 
                        | typarAttribs dottedName typarsRest 
                        ;

typarsRest              : /* EMPTY */ 
                        | ',' typars 
                        ;

tyBound                 : '(' typeList ')' 
                        ;
                        
genArity                : /* EMPTY */ 
                        | genArityNotEmpty 
                        ;                        

genArityNotEmpty        : '<' '[' int32 ']' '>' 
                        ;

/*  Class body declarations  */                         
classDecl               : methodHead  methodDecls '}' 
                        | classHead '{' classDecls '}' 
                        | eventHead '{' eventDecls '}' 
                        | propHead '{' propDecls '}' 
                        | fieldDecl
                        | dataDecl
                        | secDecl
                        | extSourceSpec
                        | customAttrDecl
                        | '.size' int32 
                        | '.pack' int32 
                        | exportHead '{' exptypeDecls '}' 
                        | '.override' typeSpec '::' methodName 'with' callConv type typeSpec '::' methodName '(' sigArgs0 ')'  
                        | '.override' 'method' callConv type typeSpec '::' methodName genArity '(' sigArgs0 ')' 'with' 'method' callConv type typeSpec '::' methodName genArity '(' sigArgs0 ')' 
                        | languageDecl
                        | 'param' 'type' '[' int32 ']' 
                        | 'param' 'type' dottedName 
                        ;

/*  Field declaration  */                        
fieldDecl               : '.field' repeatOpt fieldAttr type dottedName atOpt initOpt 
                        ;

fieldAttr               : (/* EMPTY */) ('static' | 'public' | 'private' | 'family' | 'initonly' | 'rtspecialname'  /**/ | 'specialname' 
                                                /* <STRIP>commented out because PInvoke for fields is not supported by EE
                        | fieldAttr 'pinvokeimpl' '(' compQstring 'as' compQstring pinvAttr ')' 
                        | fieldAttr 'pinvokeimpl' '(' compQstring  pinvAttr ')' 
                        | fieldAttr 'pinvokeimpl' '(' pinvAttr ')' 
                                                </STRIP>*/ | 'marshal' '(' nativeType ')' | 'assembly' | 'famandassem' | 'famorassem' | 'privatescope' | 'literal' | 'notserialized' | 'flags' '(' int32 ')')* 
                        ;

atOpt                   : /* EMPTY */  
                        | 'at' id 
                        ;

initOpt                 : /* EMPTY */ 
                        | '=' fieldInit 
                                                ;

repeatOpt               : /* EMPTY */ 
                        | '[' int32 ']' 
                                                ;

/*  Method referencing  */
methodRef               : callConv type typeSpec '::' methodName tyArgs0 '(' sigArgs0 ')' 
                        | callConv type typeSpec '::' methodName genArityNotEmpty '(' sigArgs0 ')' 
                        | callConv type methodName tyArgs0 '(' sigArgs0 ')' 
                        | callConv type methodName genArityNotEmpty '(' sigArgs0 ')' 
                        | mdtoken 
                        | typedef_m                                                              
                        | typedef_mr                                                              
                        ;
                        
callConv                : 'instance' callConv 
                        | 'explicit' callConv 
                        | callKind 
                        | 'callconv' '(' int32 ')' 
                        ;

callKind                : /* EMPTY */ 
                        | 'default' 
                        | 'vararg' 
                        | 'unmanaged' 'cdecl' 
                        | 'unmanaged' 'stdcall' 
                        | 'unmanaged' 'thiscall' 
                        | 'unmanaged' 'fastcall' 
                        ;

mdtoken                 : 'mdtoken' '(' int32 ')' 
                        ;

memberRef               : methodSpec methodRef 
                        | 'field' type typeSpec '::' dottedName 
                        | 'field' type dottedName 
                        | 'field' typedef_f 
                        | 'field' typedef_mr 
                        | mdtoken 
                        ;

/*  Event declaration  */                        
eventHead               : '.event' eventAttr typeSpec dottedName 
                        | '.event' eventAttr dottedName 
                        ;


eventAttr               : (/* EMPTY */) ('rtspecialname' /**/ | 'specialname')* 
                        ;

eventDecls              : (/* EMPTY */) (eventDecl)*
                        ;

eventDecl               : '.addon' methodRef 
                        | '.removeon' methodRef 
                        | '.fire' methodRef 
                        | '.other' methodRef 
                        | extSourceSpec
                        | customAttrDecl
                        | languageDecl
                        ;

/*  Property declaration  */                         
propHead                : '.property' propAttr callConv type dottedName '(' sigArgs0 ')' initOpt 
                        ;

propAttr                : (/* EMPTY */) ('rtspecialname' /**/ | 'specialname')* 
                        ;

propDecls               : (/* EMPTY */) (propDecl)*
                        ;


propDecl                : '.set' methodRef 
                        | '.get' methodRef 
                        | '.other' methodRef 
                        | customAttrDecl
                        | extSourceSpec
                        | languageDecl
                        ;

/*  Method declaration  */
methodHeadPart1         : '.method' 
                        ;
                        
marshalClause           : /* EMPTY */ 
                        | 'marshal' '(' nativeType ')' 
                        ;

methodHead              : methodHeadPart1 methAttr callConv paramAttr type marshalClause methodName typarsClause'(' sigArgs0 ')' implAttr '{' 
                        ;

methAttr                : (/* EMPTY */) ('static' | 'public' | 'private' | 'family' | 'final' | 'specialname' | 'virtual' | 'strict' | 'abstract' | 'assembly' | 'famandassem' | 'famorassem' | 'privatescope' | 'hidebysig' | 'newslot' | 'rtspecialname' /**/ | 'unmanagedexp' | 'reqsecobj' | 'flags' '(' int32 ')' | 'pinvokeimpl' '(' compQstring 'as' compQstring pinvAttr ')' | 'pinvokeimpl' '(' compQstring  pinvAttr ')' | 'pinvokeimpl' '(' pinvAttr ')')* 
                        ;

pinvAttr                : (/* EMPTY */) ('nomangle' | 'ansi' | 'unicode' | 'autochar' | 'lasterr' | 'winapi' | 'cdecl' | 'stdcall' | 'thiscall' | 'fastcall' | 'bestfit' ':' 'on' | 'bestfit' ':' 'off' | 'charmaperror' ':' 'on' | 'charmaperror' ':' 'off' | 'flags' '(' int32 ')')* 
                        ;

methodName              : '.ctor' 
                        | '.cctor' 
                        | dottedName 
                        ;

paramAttr               : (/* EMPTY */) ('[' 'in' ']' | '[' 'out' ']' | '[' 'opt' ']' | '[' int32 ']')*  
                        ;
        
implAttr                : (/* EMPTY */) ('native' | 'cil' | 'optil' | 'managed' | 'unmanaged' | 'forwardref' | 'preservesig' | 'runtime' | 'internalcall' | 'synchronized' | 'noinlining' | 'nooptimization' | 'flags' '(' int32 ')')* 
                        ;

localsHead              : '.locals' 
                        ;

methodDecls             : (/* EMPTY */) (methodDecl)*
                        ;

methodDecl              : '.emitbyte' int32 
                        | sehBlock 
                        | '.maxstack' int32 
                        | localsHead '(' sigArgs0 ')' 
                        | localsHead 'init' '(' sigArgs0 ')' 
                        | '.entrypoint' 
                        | '.zeroinit' 
                        | dataDecl
                        | instr
                        | id ':' 
                        | secDecl
                        | extSourceSpec
                        | languageDecl
                        | customAttrDecl
                        | '.export' '[' int32 ']' 
                        | '.export' '[' int32 ']' 'as' id 
                        | '.vtentry' int32 ':' int32 
                        | '.override' typeSpec '::' methodName 

                        | '.override' 'method' callConv type typeSpec '::' methodName genArity '(' sigArgs0 ')' 
                        | scopeBlock
                        | 'param' 'type' '[' int32 ']' 
                        | 'param' 'type' dottedName 
                        | 'param' '[' int32 ']' initOpt 
                        ;

scopeBlock              : scopeOpen methodDecls '}' 
                        ;

scopeOpen               : '{' 
                        ;

/* Structured exception handling directives  */                          
sehBlock                : tryBlock sehClauses
                        ;

sehClauses              : sehClause sehClauses
                        | sehClause
                        ;

tryBlock                : tryHead scopeBlock 
                        | tryHead id 'to' id 
                        | tryHead int32 'to' int32 
                        ;

tryHead                 : '.try' 
                        ;


sehClause               : catchClause handlerBlock 
                        | filterClause handlerBlock 
                        | finallyClause handlerBlock 
                        | faultClause handlerBlock 
                        ;

                                                                                                                                
filterClause            : filterHead scopeBlock 
                        | filterHead id 
                        | filterHead int32 
                        ;

filterHead              : 'filter'  
                        ;

catchClause             : 'catch' typeSpec 
                        ;

finallyClause           : 'finally' 
                        ;

faultClause             : 'fault' 
                        ;

handlerBlock            : scopeBlock                  
                        | 'handler' id 'to' id 
                        | 'handler' int32 'to' int32 
                        ;

/*  Data declaration  */
dataDecl                : ddHead ddBody
                        ;

ddHead                  : '.data' tls id '=' 
                        | '.data' tls  
                        ;

tls                     : /* EMPTY */ 
                        | 'tls' 
                        | 'cil' 
                        ;

ddBody                  : '{' ddItemList '}'
                        | ddItem
                        ;

ddItemList              : ddItem ',' ddItemList
                        | ddItem
                        ;

ddItemCount             : /* EMPTY */ 
                        | '[' int32 ']' 
                        ;

ddItem                  : 'char' '*' '(' compQstring ')' 
                        | '&' '(' id ')' 
                        | bytearrayhead bytes ')' 
                        | 'float32' '(' float64 ')' ddItemCount 
                        | 'float64' '(' float64 ')' ddItemCount 
                        | 'int64' '(' int64 ')' ddItemCount 
                        | 'int32' '(' int32 ')' ddItemCount 
                        | 'int16' '(' int32 ')' ddItemCount 
                        | 'int8' '(' int32 ')' ddItemCount 
                        | 'float32' ddItemCount 
                        | 'float64' ddItemCount 
                        | 'int64' ddItemCount 
                        | 'int32' ddItemCount 
                        | 'int16' ddItemCount 
                        | 'int8' ddItemCount 
                        ;

/*  Default values declaration for fields, parameters and verbal form of CA blob description  */
fieldSerInit            : 'float32' '(' float64 ')' 
                        | 'float64' '(' float64 ')' 
                        | 'float32' '(' int32 ')' 
                        | 'float64' '(' int64 ')' 
                        | 'int64' '(' int64 ')'  
                        | 'int32' '(' int32 ')' 
                        | 'int16' '(' int32 ')' 
                        | 'int8' '(' int32 ')' 
                        | 'unsigned' 'int64' '(' int64 ')'  
                        | 'unsigned' 'int32' '(' int32 ')' 
                        | 'unsigned' 'int16' '(' int32 ')' 
                        | 'unsigned' 'int8' '(' int32 ')' 
                        | 'uint64' '(' int64 ')'  
                        | 'uint32' '(' int32 ')' 
                        | 'uint16' '(' int32 ')' 
                        | 'uint8' '(' int32 ')' 
                        | 'char' '(' int32 ')' 
                        | 'bool' '(' truefalse ')' 
                        | bytearrayhead bytes ')' 
                        ;
                        
bytearrayhead           : 'bytearray' '(' 
                        ;

bytes                   : /* EMPTY */ 
                        | hexbytes 
                        ;

hexbytes                : (HEXBYTE) (HEXBYTE)*
                                ;

/*  Field/parameter initialization  */
fieldInit               : fieldSerInit 
                        | compQstring 
                        | 'nullref' 
                        ;                        

/*  Values for verbal form of CA blob description  */
serInit                 : fieldSerInit 
                        | 'string' '(' 'nullref' ')' 
                        | 'string' '(' SQSTRING ')' 
                        | 'type' '(' 'class' SQSTRING ')' 
                        | 'type' '(' className ')' 
                        | 'type' '(' 'nullref' ')' 
                        | 'object' '(' serInit ')'  
                        | 'float32' '[' int32 ']' '(' f32seq ')' 
                        | 'float64' '[' int32 ']' '(' f64seq ')' 
                        | 'int64' '[' int32 ']' '(' i64seq ')' 
                        | 'int32' '[' int32 ']' '(' i32seq ')' 
                        | 'int16' '[' int32 ']' '(' i16seq ')' 
                        | 'int8' '[' int32 ']' '(' i8seq ')' 
                        | 'uint64' '[' int32 ']' '(' i64seq ')' 
                        | 'uint32' '[' int32 ']' '(' i32seq ')' 
                        | 'uint16' '[' int32 ']' '(' i16seq ')' 
                        | 'uint8' '[' int32 ']' '(' i8seq ')' 
                        | 'unsigned' 'int64' '[' int32 ']' '(' i64seq ')' 
                        | 'unsigned' 'int32' '[' int32 ']' '(' i32seq ')' 
                        | 'unsigned' 'int16' '[' int32 ']' '(' i16seq ')' 
                        | 'unsigned' 'int8' '[' int32 ']' '(' i8seq ')' 
                        | 'char' '[' int32 ']' '(' i16seq ')' 
                        | 'bool' '[' int32 ']' '(' boolSeq ')' 
                        | 'string' '[' int32 ']' '(' sqstringSeq ')' 
                        | 'type' '[' int32 ']' '(' classSeq ')' 
                        | 'object' '[' int32 ']' '(' objSeq ')' 
                        ;


f32seq                  : (/* EMPTY */) (float64 | int32)* 
                        ;
                                                               
f64seq                  : (/* EMPTY */) (float64 | int64)* 
                        ;
                        
i64seq                  : (/* EMPTY */) (int64)* 
                        ;
                        
i32seq                  : (/* EMPTY */) (int32)* 
                        ;
                        
i16seq                  : (/* EMPTY */) (int32)* 
                        ;
                        
i8seq                   : (/* EMPTY */) (int32)* 
                        ;
                        
boolSeq                 : (/* EMPTY */) (truefalse)* 
                        ;
                        
sqstringSeq             : (/* EMPTY */) ('nullref' | SQSTRING)* 
                        ;
                        
classSeq                : (/* EMPTY */) ('nullref' | 'class' SQSTRING | className)* 
                        ;
                        
objSeq                  : (/* EMPTY */) (serInit)*
                              ;

/*  IL instructions and associated definitions  */
methodSpec              : 'method' 
                        ;
                        
instr_none              : ADD | ADD_OVF | ADD_OVF_UN | AND
  | ARGLIST | BREAK | CEQ | CGT
  | CGT_UN | CKFINITE | CLT | CLT_UN
  | CONV_I | CONV_I1 | CONV_I2 | CONV_I4
  | CONV_I8 | CONV_OVF_I | CONV_OVF_I_UN | CONV_OVF_I1
  | CONV_OVF_I1_UN | CONV_OVF_I2 | CONV_OVF_I2_UN | CONV_OVF_I4
  | CONV_OVF_I4_UN | CONV_OVF_I8 | CONV_OVF_I8_UN | CONV_OVF_U
  | CONV_OVF_U_UN | CONV_OVF_U1 | CONV_OVF_U1_UN | CONV_OVF_U2
  | CONV_OVF_U2_UN | CONV_OVF_U4 | CONV_OVF_U4_UN | CONV_OVF_U8
  | CONV_OVF_U8_UN | CONV_R_UN | CONV_R4 | CONV_R8
  | CONV_U | CONV_U1 | CONV_U2 | CONV_U4
  | CONV_U8 | CPBLK | DIV | DIV_UN
  | DUP | ENDFAULT | ENDFILTER | ENDFINALLY
  | INITBLK | LDARG_0 | LDARG_1
  | LDARG_2 | LDARG_3 | LDC_I4_0 | LDC_I4_1
  | LDC_I4_2 | LDC_I4_3 | LDC_I4_4 | LDC_I4_5
  | LDC_I4_6 | LDC_I4_7 | LDC_I4_8 | LDC_I4_M1
  | LDELEM_I | LDELEM_I1 | LDELEM_I2 | LDELEM_I4
  | LDELEM_I8 | LDELEM_R4 | LDELEM_R8 | LDELEM_REF
  | LDELEM_U1 | LDELEM_U2 | LDELEM_U4 | LDIND_I
  | LDIND_I1 | LDIND_I2 | LDIND_I4 | LDIND_I8
  | LDIND_R4 | LDIND_R8 | LDIND_REF | LDIND_U1
  | LDIND_U2 | LDIND_U4 | LDLEN | LDLOC_0
  | LDLOC_1 | LDLOC_2 | LDLOC_3 | LDNULL
  | LOCALLOC | MUL | MUL_OVF | MUL_OVF_UN
  | NEG | NOP | NOT | OR
  | POP | REFANYTYPE | REM | REM_UN
  | RET | RETHROW | SHL | SHR
  | SHR_UN | STELEM_I | STELEM_I1 | STELEM_I2
  | STELEM_I4 | STELEM_I8 | STELEM_R4 | STELEM_R8
  | STELEM_REF | STIND_I | STIND_I1 | STIND_I2
  | STIND_I4 | STIND_I8 | STIND_R4 | STIND_R8
  | STIND_REF | STLOC_0 | STLOC_1 | STLOC_2
  | STLOC_3 | SUB | SUB_OVF | SUB_OVF_UN
  | TAIL_ | THROW | VOLATILE_ | XOR 
                        ;

instr_var               : LDARG
  | LDARG_S
  | LDARGA
  | LDARGA_S
  | LDLOC
  | LDLOC_S
  | LDLOCA
  | LDLOCA_S
  | STARG
  | STARG_S
  | STLOC
  | STLOC_S 
                        ;

instr_i                 : LDC_I4
  | LDC_I4_S
  | UNALIGNED_ 
                        ;

instr_i8                : LDC_I8 
                        ;

instr_r                 : LDC_R4 | LDC_R8 
                        ;

instr_brtarget          : BEQ | BEQ_S | BGE | BGE_S
  | BGE_UN | BGE_UN_S | BGT | BGT_S | BGT_UN | BGT_UN_S
  | BLE | BLE_S | BLE_UN | BLE_UN_S | BLT | BLT_S
  | BLT_UN | BLT_UN_S | BNE_UN | BNE_UN_S | BR | BR_S
  | BRFALSE | BRFALSE_S | BRTRUE | BRTRUE_S | LEAVE | LEAVE_S 
                        ;

instr_method            : CALL | CALLVIRT | JMP | LDFTN | LDVIRTFTN | NEWOBJ 
                        ;

instr_field             : LDFLD | LDFLDA | LDSFLD | LDSFLDA | STFLD | STSFLD 
                        ;

instr_type              : BOX | CASTCLASS | CPOBJ | INITOBJ | ISINST |
  LDELEMA | LDOBJ | MKREFANY | NEWARR | REFANYVAL |
  SIZEOF | STOBJ | UNBOX 
                        ;

instr_string            : LDSTR 
                        ;

instr_sig               : CALLI 
                        ;

instr_tok               : LDTOKEN 
                        ;

instr_switch            : SWITCH 
                        ;

instr_r_head            : instr_r '(' 
                        ;


instr                   : instr_none 
                        | instr_var int32 
                        | instr_var id 
                        | instr_i int32 
                        | instr_i8 int64 
                        | instr_r float64 
                        | instr_r int64 
                        | instr_r_head bytes ')' 
                        | instr_brtarget int32 
                        | instr_brtarget id 
                        | instr_method methodRef 
                        | instr_field type typeSpec '::' dottedName 
                        | instr_field type dottedName 
                        | instr_field mdtoken 
                        | instr_field typedef_f 
                        | instr_field typedef_mr 
                        | instr_type typeSpec 
                        | instr_string compQstring 
                        | instr_string 'ansi' '(' compQstring ')' 
                        | instr_string bytearrayhead bytes ')' 
                        | instr_sig callConv type '(' sigArgs0 ')' 
                        | instr_tok ownerType /* ownerType ::= memberRef | typeSpec */ 
                        | instr_switch '(' labels ')' 
                        ;
                        
labels                  : /* empty */ 
                        | id ',' labels 
                        | int32 ',' labels 
                        | id 
                        | int32 
                        ;

/*  Signatures  */
tyArgs0                 : /* EMPTY */ 
                        | '<' tyArgs1 '>' 
                        ;

tyArgs1                 : /* EMPTY */ 
                        | tyArgs2 
                        ;

tyArgs2                 : (type) (',' type)* 
                        ;


sigArgs0                : /* EMPTY */ 
                        | sigArgs1 
                        ;

sigArgs1                : (sigArg) (',' sigArg)* 
                        ;

sigArg                  : '...' 
                        | paramAttr type marshalClause 
                        | paramAttr type marshalClause id 
                        ;

/*  Class referencing  */
className               : '[' dottedName ']' slashedName 
                        | '[' mdtoken ']' slashedName 
                        | '[' '*' ']' slashedName 
                        | '[' '.module' dottedName ']' slashedName 
                        | slashedName 
                        | mdtoken 
                        | typedef_t 
                        | '.this' 
                        | '.base' 
                        | '.nester' 
                        ;

slashedName             : (dottedName) ('/' dottedName)* 
                        ;

typeSpec                : className 
                        | '[' dottedName ']' 
                        | '[' '.module' dottedName ']' 
                        | type 
                        ;

/*  Native types for marshaling signatures  */                         
nativeType              : (/* EMPTY */ | 'custom' '(' compQstring ',' compQstring ',' compQstring ',' compQstring ')' | 'custom' '(' compQstring ',' compQstring ')' | 'fixed' 'sysstring' '[' int32 ']' | 'fixed' 'array' '[' int32 ']' nativeType | 'variant' | 'currency' | 'syschar' | 'void' | 'bool' | 'int8' | 'int16' | 'int32' | 'int64' | 'float32' | 'float64' | 'error' | 'unsigned' 'int8' | 'unsigned' 'int16' | 'unsigned' 'int32' | 'unsigned' 'int64' | 'uint8' | 'uint16' | 'uint32' | 'uint64' | 'decimal' | 'date' | 'bstr' | 'lpstr' | 'lpwstr' | 'lptstr' | 'objectref' | 'iunknown'  iidParamIndex | 'idispatch' iidParamIndex | 'struct' | 'interface' iidParamIndex | 'safearray' variantType | 'safearray' variantType ',' compQstring | 'int' | 'unsigned' 'int' | 'uint' | 'nested' 'struct' | 'byvalstr' | 'ansi' 'bstr' | 'tbstr' | 'variant' 'bool' | 'method' | 'as' 'any' | 'lpstruct' | typedef_ts) ('*' | '[' ']' | '[' int32 ']' | '[' int32 '+' int32 ']' | '[' '+' int32 ']')* 
                        ;
                        
iidParamIndex           : /* EMPTY */ 
                        | '(' 'iidparam' '=' int32 ')' 
                        ;                        

variantType             : (/* EMPTY */ | 'null' | 'variant' | 'currency' | 'void' | 'bool' | 'int8' | 'int16' | 'int32' | 'int64' | 'float32' | 'float64' | 'unsigned' 'int8' | 'unsigned' 'int16' | 'unsigned' 'int32' | 'unsigned' 'int64' | 'uint8' | 'uint16' | 'uint32' | 'uint64' | '*' | 'decimal' | 'date' | 'bstr' | 'lpstr' | 'lpwstr' | 'iunknown' | 'idispatch' | 'safearray' | 'int' | 'unsigned' 'int' | 'uint' | 'error' | 'hresult' | 'carray' | 'userdefined' | 'record' | 'filetime' | 'blob' | 'stream' | 'storage' | 'streamed_object' | 'stored_object' | 'blob_object' | 'cf' | 'clsid' ) ('[' ']' | 'vector' | '&')*
                                  ;
/*  Managed types for signatures  */                        
type                    : ('class' className | 'object' | 'value' 'class' className | 'valuetype' className | methodSpec callConv type '*' '(' sigArgs0 ')' | '!' '!' int32 | '!' int32 | '!' '!' dottedName | '!' dottedName | 'typedref' | 'void' | 'native' 'int' | 'native' 'unsigned' 'int' | 'native' 'uint' | 'native' 'float' | simpleType | '...' type) ('[' ']' | '[' bounds1 ']'  
                        /* uncomment when and if this type is supported by the Runtime
                        | type 'value' '[' int32 ']' 
                        */ | '&' | '*' | 'pinned' | 'modreq' '(' typeSpec ')' | 'modopt' '(' typeSpec ')' | '<' tyArgs1 '>')* 
                        ;
                        
simpleType              : 'char' 
                        | 'string'  
                        | 'bool' 
                        | 'int8' 
                        | 'int16' 
                        | 'int32' 
                        | 'int64' 
                        | 'float32' 
                        | 'float64' 
                        | 'unsigned' 'int8' 
                        | 'unsigned' 'int16' 
                        | 'unsigned' 'int32' 
                        | 'unsigned' 'int64' 
                        | 'uint8' 
                        | 'uint16' 
                        | 'uint32' 
                        | 'uint64' 
                        | typedef_ts 
                        ;
                        
bounds1                 : (bound) (',' bound)* 
                        ;

bound                   : /* EMPTY */ 
                        | '...' 
                        | int32  
                        | int32 '...' int32    
                        | int32 '...'  
                        ;

/*  Security declarations  */                        
secDecl                 : '.permission' secAction typeSpec '(' nameValPairs ')' 
                        | '.permission' secAction typeSpec '=' '{' customBlobDescr '}' 
                        | '.permission' secAction typeSpec 
                        | psetHead bytes ')' 
                        | '.permissionset' secAction compQstring 
                        | '.permissionset' secAction '=' '{' secAttrSetBlob '}' 
                        ;
                        
secAttrSetBlob          : /* EMPTY */ 
                        | secAttrBlob 
                        | secAttrBlob ',' secAttrSetBlob 
                        ;
                        
secAttrBlob             : typeSpec '=' '{' customBlobNVPairs '}'                                                
                        | 'class' SQSTRING '=' '{' customBlobNVPairs '}' 
                        ;                                               

psetHead                : '.permissionset' secAction '=' '(' 
                        | '.permissionset' secAction 'bytearray' '(' 
                        ;

nameValPairs            : nameValPair 
                        | nameValPair ',' nameValPairs 
                        ;

nameValPair             : compQstring '=' caValue 
                        ;

truefalse               : 'true' 
                        | 'false' 
                        ;

caValue                 : truefalse 
                        | int32 
                        | 'int32' '(' int32 ')' 
                        | compQstring 
                        | className '(' 'int8' ':' int32 ')' 
                        | className '(' 'int16' ':' int32 ')' 
                        | className '(' 'int32' ':' int32 ')' 
                        | className '(' int32 ')' 
                        ;

secAction               : 'request' 
                        | 'demand' 
                        | 'assert' 
                        | 'deny' 
                        | 'permitonly' 
                        | 'linkcheck' 
                        | 'inheritcheck' 
                        | 'reqmin' 
                        | 'reqopt' 
                        | 'reqrefuse' 
                        | 'prejitgrant' 
                        | 'prejitdeny' 
                        | 'noncasdemand' 
                        | 'noncaslinkdemand' 
                        | 'noncasinheritance' 
                        ;

/*  External source declarations  */                        
esHead                  : '.line' 
                        // | P_LINE // not supported 
                        ;
                        
extSourceSpec           : esHead int32 SQSTRING 
                        | esHead int32 
                        | esHead int32 ':' int32 SQSTRING 
                        | esHead int32 ':' int32 
                        | esHead int32 ':' int32 ',' int32 SQSTRING 
                        | esHead int32 ':' int32 ',' int32 
                        | esHead int32 ',' int32 ':' int32 SQSTRING 
                        | esHead int32 ',' int32 ':' int32 
                        | esHead int32 ',' int32 ':' int32 ',' int32 SQSTRING 
                        | esHead int32 ',' int32 ':' int32 ',' int32 
                        | esHead int32 QSTRING 
                        ;

/*  Manifest declarations  */                         
fileDecl                : '.file' fileAttr dottedName fileEntry hashHead bytes ')' fileEntry 
                        | '.file' fileAttr dottedName fileEntry 
                        ;

fileAttr                : (/* EMPTY */) ('nometadata')* 
                        ;

fileEntry               : /* EMPTY */ 
                        | '.entrypoint' 
                        ;

hashHead                : '.hash' '=' '(' 
                        ;

assemblyHead            : '.assembly' asmAttr dottedName 
                        ;

asmAttr                 : (/* EMPTY */) ('retargetable' | 'legacy' 'library' | 'cil' | 'x86' | 'ia64' | 'amd64')* 
                        ;

assemblyDecls           : (/* EMPTY */) (assemblyDecl)*
                        ;

assemblyDecl            : '.hash' 'algorithm' int32 
                        | secDecl
                        | asmOrRefDecl
                        ;
                        
intOrWildcard           : int32 
                        | '*' 
                        ;                        

asmOrRefDecl            : publicKeyHead bytes ')' 
                        | '.ver' intOrWildcard ':' intOrWildcard ':' intOrWildcard ':' intOrWildcard 
                        | '.locale' compQstring 
                        | localeHead bytes ')' 
                        | customAttrDecl
                        ;

publicKeyHead           : '.publickey' '=' '(' 
                        ;

publicKeyTokenHead      : '.publickeytoken' '=' '(' 
                        ;

localeHead              : '.locale' '=' '(' 
                        ;

assemblyRefHead         : '.assembly' 'extern' asmAttr dottedName 
                        | '.assembly' 'extern' asmAttr dottedName 'as' dottedName 
                        ;

assemblyRefDecls        : (/* EMPTY */) (assemblyRefDecl)*
                        ;

assemblyRefDecl         : hashHead bytes ')' 
                        | asmOrRefDecl
                        | publicKeyTokenHead bytes ')' 
                        | 'auto' 
                        ;

exptypeHead             : '.class' 'extern' exptAttr dottedName  
                        ;

exportHead              : '.export' exptAttr dottedName   /* deprecated */ 
                        ;

exptAttr                : (/* EMPTY */) ('private' | 'public' | 'forwarder' | 'nested' 'public' | 'nested' 'private' | 'nested' 'family' | 'nested' 'assembly' | 'nested' 'famandassem' | 'nested' 'famorassem')* 
                        ;

exptypeDecls            : (/* EMPTY */) (exptypeDecl)*
                        ;

exptypeDecl             : '.file' dottedName 
                        | '.class' 'extern' slashedName 
                        | '.assembly' 'extern' dottedName 
                        | 'mdtoken' '(' int32 ')' 
                        | '.class'  int32 
                        | customAttrDecl
                        ;

manifestResHead         : '.mresource' manresAttr dottedName 
                        | '.mresource' manresAttr dottedName 'as' dottedName 
                        ;

manresAttr              : (/* EMPTY */) ('public' | 'private')* 
                        ;

manifestResDecls        : (/* EMPTY */) (manifestResDecl)*
                        ;

manifestResDecl         : '.file' dottedName 'at' int32 
                        | '.assembly' 'extern' dottedName 
                        | customAttrDecl
                        ;
