// Common Intermediate Language (.NET) LEXER and PARSER
grammar CIL2;

@header 
{
  package cil;
}

/* LEXER */

ADD :                 'add' ;
ADD_OVF :             'add.ovf' ;
ADD_OVF_UN :          'add.ovf.un' ;
ARGLIST :             'arglist' ;
AND :                 'and' ;
BEQ :                 'beq' ;
BEQ_S :               'beq.s' ;
BGE :                 'bge' ;
BGE_S :               'bge.s' ;
BGE_UN :              'bge.un' ;
BGE_UN_S :            'bge.un.s' ;
BGT :                 'bgt' ;
BGT_S :               'bgt.s' ;
BGT_UN :              'bgt.un' ;
BGT_UN_S :            'bgt.un.s' ;
BLE :                 'ble' ;
BLE_S :               'ble.s' ;
BLE_UN :              'ble.un' ;
BLE_UN_S :            'ble.un.s' ;
BLOB :                'blob' ;
BLOB_OBJECT :         'blob_object' ;
BLT :                 'blt' ;
BLT_S :               'blt.s' ;
BLT_UN :              'blt.un' ;
BLT_UN_S :            'blt.un.s' ;
BNE_UN :              'bne.un' ;
BNE_UN_S :            'bne.un.s' ;
BOX :                 'box' ;
BR :                  'br' ;
BR_S :                'br.s' ;
BREAK :               'break' ;
BRFALSE :             'brfalse' ;
BRFALSE_S :           'brfalse.s' ;
BRINST :              'brinst' ;
BRINST_S :            'brinst.s' ;
BRNULL :              'brnull' ;
BRNULL_S :            'brnull.s' ;
BRTRUE :              'brtrue' ;
BRTRUE_S :            'brtrue.s' ;
BRZERO :              'brzero' ;
BRZERO_S :            'brzero.s' ;
BSTR :                'bstr' ;
BYTEARRAY :           'bytearray' ;
BYVALSTR :            'byvalstr' ;
CALL :                'call' ;
CALLI :               'calli' ;
CALLMOSTDERIVED :     'callmostderived' ;
CALLVIRT :            'callvirt' ;
CARRAY :              'carray' ;
CASTCLASS :           'castclass' ;
CATCH :               'catch' ;
CDECL :               'cdecl' ;
CEQ :                 'ceq' ;
CF :                  'cf' ;
CGT :                 'cgt' ;
CGT_UN :              'cgt.un' ;
CHAR :                'char' ;
CIL :                 'cil' ;
CKFINITE :            'ckfinite' ;
CLASS :               'class' ;
CLSID :               'clsid' ;
CLT :                 'clt' ;
CLT_UN :              'clt.un' ;
CONST :               'const' ;
CONV_I :              'conv.i' ;
CONV_I1 :             'conv.i1' ;
CONV_I2 :             'conv.i2' ;
CONV_I4 :             'conv.i4' ;
CONV_I8 :             'conv.i8' ;
CONV_OVF_I :          'conv.ovf.i' ;
CONV_OVF_I_UN :       'conv.ovf.i.un' ;
CONV_OVF_I1 :         'conv.ovf.i1' ;
CONV_OVF_I1_UN :      'conv.ovf.i1.un' ;
CONV_OVF_I2 :         'conv.ovf.i2' ;
CONV_OVF_I2_UN :      'conv.ovf.i2.un' ;
CONV_OVF_I4 :         'conv.ovf.i4' ;
CONV_OVF_I4_UN :      'conv.ovf.i4.un' ;
CONV_OVF_I8 :         'conv.ovf.i8' ;
CONV_OVF_I8_UN :      'conv.ovf.i8.un' ;
CONV_OVF_U :          'conv.ovf.u' ;
CONV_OVF_U_UN :       'conv.ovf.u.un' ;
CONV_OVF_U1 :         'conv.ovf.u1' ;
CONV_OVF_U1_UN :      'conv.ovf.u1.un' ;
CONV_OVF_U2 :         'conv.ovf.u2' ;
CONV_OVF_U2_UN :      'conv.ovf.u2.un' ;
CONV_OVF_U4 :         'conv.ovf.u4' ;
CONV_OVF_U4_UN :      'conv.ovf.u4.un' ;
CONV_OVF_U8 :         'conv.ovf.u8' ;
CONV_OVF_U8_UN :      'conv.ovf.u8.un' ;
CONV_R_UN :           'conv.r.un' ;
CONV_R4 :             'conv.r4' ;
CONV_R8 :             'conv.r8' ;
CONV_U :              'conv.u' ;
CONV_U1 :             'conv.u1' ;
CONV_U2 :             'conv.u2' ;
CONV_U4 :             'conv.u4' ;
CONV_U8 :             'conv.u8' ;
CPBLK :               'cpblk' ;
CPOBJ :               'cpobj' ;
DIV :                 'div' ;
DIV_UN :              'div.un' ;
DUP :                 'dup' ;
ENDFAULT :            'endfault' ;
ENDFILTER :           'endfilter' ;
ENDFINALLY :          'endfinally' ;
INITBLK :             'initblk' ;
INITOBJ :             'initobj' ;
ISINST :              'isinst' ;
JMP :                 'jmp' ;
LDARG :               'ldarg' ;
LDARG_0 :             'ldarg.0' ;
LDARG_1 :             'ldarg.1' ;
LDARG_2 :             'ldarg.2' ;
LDARG_3 :             'ldarg.3' ;
LDARG_S :             'ldarg.s' ;
LDARGA :              'ldarga' ;
LDARGA_S :            'ldarga.s' ;
LDC_I4 :              'ldc.i4' ;
LDC_I4_0 :            'ldc.i4.0' ;
LDC_I4_1 :            'ldc.i4.1' ;
LDC_I4_2 :            'ldc.i4.2' ;
LDC_I4_3 :            'ldc.i4.3' ;
LDC_I4_4 :            'ldc.i4.4' ;
LDC_I4_5 :            'ldc.i4.5' ;
LDC_I4_6 :            'ldc.i4.6' ;
LDC_I4_7 :            'ldc.i4.7' ;
LDC_I4_8 :            'ldc.i4.8' ;
LDC_I4_M1 :           'ldc.i4.m1' ;
LDC_I4_S :            'ldc.i4.s' ;
LDC_I8 :              'ldc.i8' ;
LDC_R4 :              'ldc.r4' ;
LDC_R8 :              'ldc.r8' ;
LDELEM_I :            'ldelem.i' ;
LDELEM_I1 :           'ldelem.i1' ;
LDELEM_I2 :           'ldelem.i2' ;
LDELEM_I4 :           'ldelem.i4' ;
LDELEM_I8 :           'ldelem.i8' ;
LDELEM_R4 :           'ldelem.r4' ;
LDELEM_R8 :           'ldelem.r8' ;
LDELEM_REF :          'ldelem.ref' ;
LDELEM_U1 :           'ldelem.u1' ;
LDELEM_U2 :           'ldelem.u2' ;
LDELEM_U4 :           'ldelem.u4' ;
LDELEM_U8 :           'ldelem.u8' ;
LDELEMA :             'ldelema' ;
LDFLD :               'ldfld' ;
LDFLDA :              'ldflda' ;
LDFTN :               'ldftn' ;
LDIND_I :             'ldind.i' ;
LDIND_I1 :            'ldind.i1' ;
LDIND_I2 :            'ldind.i2' ;
LDIND_I4 :            'ldind.i4' ;
LDIND_I8 :            'ldind.i8' ;
LDIND_R4 :            'ldind.r4' ;
LDIND_R8 :            'ldind.r8' ;
LDIND_REF :           'ldind.ref' ;
LDIND_U1 :            'ldind.u1' ;
LDIND_U2 :            'ldind.u2' ;
LDIND_U4 :            'ldind.u4' ;
LDIND_U8 :            'ldind.u8' ;
LDLEN :               'ldlen' ;
LDLOC :               'ldloc' ;
LDLOC_0 :             'ldloc.0' ;
LDLOC_1 :             'ldloc.1' ;
LDLOC_2 :             'ldloc.2' ;
LDLOC_3 :             'ldloc.3' ;
LDLOC_S :             'ldloc.s' ;
LDLOCA :              'ldloca' ;
LDLOCA_S :            'ldloca.s' ;
LDNULL :              'ldnull' ;
LDOBJ :               'ldobj' ;
LDSFLD :              'ldsfld' ;
LDSFLDA :             'ldsflda' ;
LDSTR :               'ldstr' ;
LDTOKEN :             'ldtoken' ;
LDVIRTFTN :           'ldvirtftn' ;
LEAVE :               'leave' ;
LEAVE_S :             'leave.s' ;
LOCALLOC :            'localloc' ;
MKREFANY :            'mkrefany' ;
MUL :                 'mul' ;
MUL_OVF :             'mul.ovf' ;
MUL_OVF_UN :          'mul.ovf.un' ;
NEG :                 'neg' ;
NEWARR :              'newarr' ;
NEWOBJ :              'newobj' ;
NOP :                 'nop' ;
NOT :                 'not' ;
OR :                  'or' ;
POP :                 'pop' ;
REFANYTYPE :          'refanytype' ;
REFANYVAL :           'refanyval' ;
REM :                 'rem' ;
REM_UN :              'rem.un' ;
REQUEST :             'request' ;
RET :                 'ret' ;
RETHROW :             'rethrow' ;
SHL :                 'shl' ;
SHR :                 'shr' ;
SHR_UN :              'shr.un' ;
SIZEOF :              'sizeof' ;
STARG :               'starg' ;
STARG_S :             'starg.s' ;
STELEM_I :            'stelem.i' ;
STELEM_I1 :           'stelem.i1' ;
STELEM_I2 :           'stelem.i2' ;
STELEM_I4 :           'stelem.i4' ;
STELEM_I8 :           'stelem.i8' ;
STELEM_R4 :           'stelem.r4' ;
STELEM_R8 :           'stelem.r8' ;
STELEM_REF :          'stelem.ref' ;
STFLD :               'stfld' ;
STIND_I :             'stind.i' ;
STIND_I1 :            'stind.i1' ;
STIND_I2 :            'stind.i2' ;
STIND_I4 :            'stind.i4' ;
STIND_I8 :            'stind.i8' ;
STIND_R4 :            'stind.r4' ;
STIND_R8 :            'stind.r8' ;
STIND_REF :           'stind.ref' ;
STLOC :               'stloc' ;
STLOC_0 :             'stloc.0' ;
STLOC_1 :             'stloc.1' ;
STLOC_2 :             'stloc.2' ;
STLOC_3 :             'stloc.3' ;
STLOC_S :             'stloc.s' ;
STOBJ :               'stobj' ;
STSFLD :              'stsfld' ;
SUB :                 'sub' ;
SUB_OVF :             'sub.ovf' ;
SUB_OVF_UN :          'sub.ovf.un' ;
SWITCH :              'switch' ;
TAIL_ :               'tail.' ;
THROW :               'throw' ;
UNALIGNED_ :          'unaligned.' ;
UNBOX :               'unbox' ;
VOLATILE_ :           'volatile.' ;
XOR :                 'xor' ;

ID             : (LETTER | '_') (LETTER | DIGIT | '_')*
               ;
DOTTEDNAME     : ID ('.' ID)*
               ;
fragment
LETTER: ('a'..'z'|'A'..'Z') 
               ;
fragment
DIGIT          : '0'..'9'
               ;
fragment
HEX_DIGIT      : (DIGIT|'a'..'f'|'A'..'F')
               ;
fragment
EXPONENT       : ('e'|'E') ('+'|'-')? (DIGIT)+
               ;
fragment
ESC            : '\\'
                ( 'n'
                | 'r'
                | 't'
                | 'b'
                | 'f'
                | '"'
                | '\''
                | '\\'
                | '?'
                | ('u')+ HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT  // unicode
                | ('x'|'X') HEX_DIGIT HEX_DIGIT
                | ('0'..'3')
                  (
                   ('0'..'7')
                   ('0'..'7')?
                  )?
                | ('4'..'7')
                  ('0'..'9')?
                )
               ;
QSTRING        : '"' (ESC|~('"'|'\\'))* '"' ;
SQSTRING       : '\'' (ESC|~('\''|'\\'))* '\'' ;
INT32          : ('-')? ((DIGIT)+ | '0' ('x' | 'X') HEX_DIGIT)
               ;
INT64          : ('-')? (DIGIT)+
               ;
DOT            : '.'
               ;
FLOAT64        : DOT (DIGIT)+ (EXPONENT)?
               | ('-')? DIGIT+ (({_input.LA(2) != '.'}? DOT (DIGIT)* (EXPONENT)?)
                                | EXPONENT
                               )
               ;
HEXBYTE        : ('-')? DIGIT ('a'..'f'|'A'..'F') ;
// Whitespace -- ignored
WS  : ( ' '
    | '\t'
    | '\f'
      // handle newlines
    | '\r\n'  // Evil DOS
    | '\r'    // Macintosh
    | '\n'    // Unix (the right way)
    )+ -> channel(HIDDEN)
  ;

/* PARSER */

start           : decls
                ;      

decls                   : /* EMPTY */
                        | decls decl                                            
                        ;
/* Module-level declarations */
decl                    : classHead '{' classDecls '}' 
                        | nameSpaceHead '{' decls '}' 
                        | methodHead  methodDecls '}' 
                        | fieldDecl
                        | dataDecl
                        | vtableDecl
                        | vtfixupDecl
                        | extSourceSpec
                        | fileDecl
                        | assemblyHead '{' assemblyDecls '}' 
                        | assemblyRefHead '{' assemblyRefDecls '}' 
                        | exptypeHead '{' exptypeDecls '}' 
                        | manifestResHead '{' manifestResDecls '}' 
                        | moduleHead
                        | secDecl
                        | customAttrDecl
                        | '.subsystem' int32 
                        | '.corflags' int32 
                        | '.file' 'alignment' int32 
                        | '.imagebase' int64 
                        | '.stackreserve' int64 
                        | languageDecl
                        | typedefDecl
                        | '.typelist' '{' classNameSeq '}'
                        | '.mscorlib' 
                        ;
                        
classNameSeq            : /* EMPTY */
                        | className classNameSeq
                        ;                        

compQstring             : QSTRING 
                        | compQstring '+' QSTRING 
                        ;

languageDecl            : '.language' SQSTRING 
                        | '.language' SQSTRING ',' SQSTRING 
                        | '.language' SQSTRING ',' SQSTRING ',' SQSTRING 
                        ;
/*  Basic tokens  */                        
id                      : ID 
                        | SQSTRING 
                        ;

dottedName              : id
                        | DOTTEDNAME 
                        | dottedName '.' dottedName 
                        ;

int32                   : INT32 
                        ;

int64                   : INT64 
                        | INT32 
                        ;

float64                 : FLOAT64 
                        | 'float32' '(' int32 ')' 
                        | 'float64' '(' int64 ')' 
                        ;

/*  Aliasing of types, type specs, methods, fields and custom attributes */
typedef_ts              : '.typedef' type 'as' dottedName ;
typedef_t               : '.typedef' className 'as' dottedName ;
typedef_m               : '.typedef' memberRef 'as' dottedName ;
typedef_f               : typedef_m ;
typedef_mr              : typedef_m ;
typedef_ca              : '.typedef' customDescr 'as' dottedName 
                        | '.typedef' customDescrWithOwner 'as' dottedName
                        ;
typedefDecl             : typedef_ts 
                        | typedef_t 
                        | typedef_m 
                        | typedef_ca 
                        ;
/* Custom attribute declarations  */
customDescr             : '.custom' customType 
                        | '.custom' customType '=' compQstring 
                        | '.custom' customType '=' '{' customBlobDescr '}' 
                        | customHead bytes ')' 
                        ;

customDescrWithOwner    : '.custom' '(' ownerType ')' customType 
                        | '.custom' '(' ownerType ')' customType '=' compQstring 
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
                        
customBlobArgs          : /* EMPTY */ 
                        | customBlobArgs serInit 
                        ;
                        
customBlobNVPairs       : /* EMPTY */ 
                        | customBlobNVPairs fieldOrProp serializType dottedName '=' serInit 
                        ;

fieldOrProp             : 'field' 
                        | 'property' 
                        ;

customAttrDecl          : customDescr 
                        | customDescrWithOwner 
                        | typedef_ca 
                        ;
                        
serializType            : simpleType 
                        | 'type' 
                        | 'object' 
                        | 'enum' 'class' SQSTRING  
                        | 'enum' className  
                        | serializType '[' ']'  
                        ;

                        
/*  Module declaration */
moduleHead              : '.module' 
                        | '.module' dottedName 
                        | '.module' 'extern' dottedName 
                        ;
                        
/*  VTable Fixup table declaration  */
vtfixupDecl             : '.vtfixup' '[' int32 ']' vtfixupAttr 'at' id 
                        ;

vtfixupAttr             : /* EMPTY */ 
                        | vtfixupAttr 'int32' 
                        | vtfixupAttr 'int64' 
                        | vtfixupAttr 'fromunmanaged' 
                        | vtfixupAttr 'callmostderived' 
                        | vtfixupAttr 'retainappdomain' 
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

classAttr               : /* EMPTY */ 
                        | classAttr 'public' 
                        | classAttr 'private' 
                        | classAttr 'value' 
                        | classAttr 'enum' 
                        | classAttr 'interface' 
                        | classAttr 'sealed' 
                        | classAttr 'abstract' 
                        | classAttr 'auto' 
                        | classAttr 'sequential' 
                        | classAttr 'explicit' 
                        | classAttr 'ansi' 
                        | classAttr 'unicode' 
                        | classAttr 'autochar' 
                        | classAttr 'import' 
                        | classAttr 'serializable' 
                        | classAttr 'nested' 'public' 
                        | classAttr 'nested' 'private' 
                        | classAttr 'nested' 'family' 
                        | classAttr 'nested' 'assembly' 
                        | classAttr 'nested' 'famandassem' 
                        | classAttr 'nested' 'famorassem' 
                        | classAttr 'beforefieldinit' 
                        | classAttr 'specialname' 
                        | classAttr 'rtspecialname' 
                        | classAttr 'flags' '(' int32 ')' 
                        ;

extendsClause           : /* EMPTY */                                           
                        | 'extends' typeSpec 
                        ;

implClause              : /* EMPTY */
                        | 'implements' implList
                        ;

classDecls              : /* EMPTY */
                        | classDecls classDecl
                        ;
                        
implList                : implList ',' typeSpec 
                        | typeSpec 
                                        ;

/* Generic type parameters declaration  */                         
typeList                : /* EMPTY */ 
                        | typeListNotEmpty 
                        ;
                        
typeListNotEmpty        : typeSpec 
                        | typeListNotEmpty ',' typeSpec 
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

fieldAttr               : /* EMPTY */ 
                        | fieldAttr 'static' 
                        | fieldAttr 'public' 
                        | fieldAttr 'private' 
                        | fieldAttr 'family' 
                        | fieldAttr 'initonly' 
                        | fieldAttr 'rtspecialname'  /**/
                        | fieldAttr 'specialname' 
                                                /* <STRIP>commented out because PInvoke for fields is not supported by EE
                        | fieldAttr 'pinvokeimpl' '(' compQstring 'as' compQstring pinvAttr ')' 
                        | fieldAttr 'pinvokeimpl' '(' compQstring  pinvAttr ')' 
                        | fieldAttr 'pinvokeimpl' '(' pinvAttr ')' 
                                                </STRIP>*/
                        | fieldAttr 'marshal' '(' nativeType ')' 
                        | fieldAttr 'assembly' 
                        | fieldAttr 'famandassem' 
                        | fieldAttr 'famorassem' 
                        | fieldAttr 'privatescope' 
                        | fieldAttr 'literal' 
                        | fieldAttr 'notserialized' 
                        | fieldAttr 'flags' '(' int32 ')' 
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


eventAttr               : /* EMPTY */ 
                        | eventAttr 'rtspecialname' /**/
                        | eventAttr 'specialname' 
                        ;

eventDecls              : /* EMPTY */
                        | eventDecls eventDecl
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

propAttr                : /* EMPTY */ 
                        | propAttr 'rtspecialname' /**/
                        | propAttr 'specialname' 
                        ;

propDecls               : /* EMPTY */
                        | propDecls propDecl
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

methAttr                : /* EMPTY */ 
                        | methAttr 'static' 
                        | methAttr 'public' 
                        | methAttr 'private' 
                        | methAttr 'family' 
                        | methAttr 'final' 
                        | methAttr 'specialname' 
                        | methAttr 'virtual' 
                        | methAttr 'strict' 
                        | methAttr 'abstract' 
                        | methAttr 'assembly' 
                        | methAttr 'famandassem' 
                        | methAttr 'famorassem' 
                        | methAttr 'privatescope' 
                        | methAttr 'hidebysig' 
                        | methAttr 'newslot' 
                        | methAttr 'rtspecialname' /**/
                        | methAttr 'unmanagedexp' 
                        | methAttr 'reqsecobj' 
                        | methAttr 'flags' '(' int32 ')' 
                        | methAttr 'pinvokeimpl' '(' compQstring 'as' compQstring pinvAttr ')' 
                        | methAttr 'pinvokeimpl' '(' compQstring  pinvAttr ')' 
                        | methAttr 'pinvokeimpl' '(' pinvAttr ')' 
                        ;

pinvAttr                : /* EMPTY */ 
                        | pinvAttr 'nomangle' 
                        | pinvAttr 'ansi' 
                        | pinvAttr 'unicode' 
                        | pinvAttr 'autochar' 
                        | pinvAttr 'lasterr' 
                        | pinvAttr 'winapi' 
                        | pinvAttr 'cdecl' 
                        | pinvAttr 'stdcall' 
                        | pinvAttr 'thiscall' 
                        | pinvAttr 'fastcall' 
                        | pinvAttr 'bestfit' ':' 'on' 
                        | pinvAttr 'bestfit' ':' 'off' 
                        | pinvAttr 'charmaperror' ':' 'on' 
                        | pinvAttr 'charmaperror' ':' 'off' 
                        | pinvAttr 'flags' '(' int32 ')' 
                        ;

methodName              : '.ctor' 
                        | '.cctor' 
                        | dottedName 
                        ;

paramAttr               : /* EMPTY */ 
                        | paramAttr '[' 'in' ']' 
                        | paramAttr '[' 'out' ']' 
                        | paramAttr '[' 'opt' ']' 
                        | paramAttr '[' int32 ']'  
                        ;
        
implAttr                : /* EMPTY */ 
                        | implAttr 'native' 
                        | implAttr 'cil' 
                        | implAttr 'optil' 
                        | implAttr 'managed' 
                        | implAttr 'unmanaged' 
                        | implAttr 'forwardref' 
                        | implAttr 'preservesig' 
                        | implAttr 'runtime' 
                        | implAttr 'internalcall' 
                        | implAttr 'synchronized' 
                        | implAttr 'noinlining' 
                        | implAttr 'nooptimization' 
                        | implAttr 'flags' '(' int32 ')' 
                        ;

localsHead              : '.locals' 
                        ;

methodDecls             : /* EMPTY */
                        | methodDecls methodDecl
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

hexbytes                : HEXBYTE 
                        | hexbytes HEXBYTE 
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


f32seq                  : /* EMPTY */ 
                        | f32seq float64 
                        | f32seq int32 
                        ;
                                                               
f64seq                  : /* EMPTY */ 
                        | f64seq float64 
                        | f64seq int64 
                        ;
                        
i64seq                  : /* EMPTY */ 
                        | i64seq int64 
                        ;
                        
i32seq                  : /* EMPTY */ 
                        | i32seq int32 
                        ;
                        
i16seq                  : /* EMPTY */ 
                        | i16seq int32 
                        ;
                        
i8seq                   : /* EMPTY */ 
                        | i8seq int32 
                        ;
                        
boolSeq                 : /* EMPTY */ 
                        | boolSeq truefalse 
                        ;
                        
sqstringSeq             : /* EMPTY */ 
                        | sqstringSeq 'nullref' 
                        | sqstringSeq SQSTRING 
                        ;
                        
classSeq                : /* EMPTY */ 
                        | classSeq 'nullref' 
                        | classSeq 'class' SQSTRING 
                        | classSeq className 
                        ;
                        
objSeq                  : /* EMPTY */ 
                        | objSeq serInit 
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

tyArgs2                 : type 
                        | tyArgs2 ',' type 
                        ;


sigArgs0                : /* EMPTY */ 
                        | sigArgs1 
                        ;

sigArgs1                : sigArg 
                        | sigArgs1 ',' sigArg 
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

slashedName             : dottedName 
                        | slashedName '/' dottedName 
                        ;

typeSpec                : className 
                        | '[' dottedName ']' 
                        | '[' '.module' dottedName ']' 
                        | type 
                        ;

/*  Native types for marshaling signatures  */                         
nativeType              : /* EMPTY */  
                        | 'custom' '(' compQstring ',' compQstring ',' compQstring ',' compQstring ')' 
                        | 'custom' '(' compQstring ',' compQstring ')' 
                        | 'fixed' 'sysstring' '[' int32 ']' 
                        | 'fixed' 'array' '[' int32 ']' nativeType 
                        | 'variant' 
                        | 'currency' 
                        | 'syschar' 
                        | 'void' 
                        | 'bool' 
                        | 'int8' 
                        | 'int16' 
                        | 'int32' 
                        | 'int64' 
                        | 'float32' 
                        | 'float64' 
                        | 'error' 
                        | 'unsigned' 'int8' 
                        | 'unsigned' 'int16' 
                        | 'unsigned' 'int32' 
                        | 'unsigned' 'int64' 
                        | 'uint8' 
                        | 'uint16' 
                        | 'uint32' 
                        | 'uint64' 
                        | nativeType '*' 
                        | nativeType '[' ']' 
                        | nativeType '[' int32 ']' 
                        | nativeType '[' int32 '+' int32 ']' 
                        | nativeType '[' '+' int32 ']' 
                        | 'decimal' 
                        | 'date' 
                        | 'bstr' 
                        | 'lpstr' 
                        | 'lpwstr' 
                        | 'lptstr' 
                        | 'objectref' 
                        | 'iunknown'  iidParamIndex 
                        | 'idispatch' iidParamIndex 
                        | 'struct' 
                        | 'interface' iidParamIndex 
                        | 'safearray' variantType 
                        | 'safearray' variantType ',' compQstring 
                                                                
                        | 'int' 
                        | 'unsigned' 'int' 
                        | 'uint' 
                        | 'nested' 'struct' 
                        | 'byvalstr' 
                        | 'ansi' 'bstr' 
                        | 'tbstr' 
                        | 'variant' 'bool' 
                        | 'method' 
                        | 'as' 'any' 
                        | 'lpstruct' 
                        | typedef_ts 
                        ;
                        
iidParamIndex           : /* EMPTY */ 
                        | '(' 'iidparam' '=' int32 ')' 
                        ;                        

variantType             : /* EMPTY */ 
                        | 'null' 
                        | 'variant' 
                        | 'currency' 
                        | 'void' 
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
                        | '*' 
                        | variantType '[' ']' 
                        | variantType 'vector' 
                        | variantType '&' 
                        | 'decimal' 
                        | 'date' 
                        | 'bstr' 
                        | 'lpstr' 
                        | 'lpwstr' 
                        | 'iunknown' 
                        | 'idispatch' 
                        | 'safearray' 
                        | 'int' 
                        | 'unsigned' 'int' 
                        | 'uint' 
                        | 'error' 
                        | 'hresult' 
                        | 'carray' 
                        | 'userdefined' 
                        | 'record' 
                        | 'filetime' 
                        | 'blob' 
                        | 'stream' 
                        | 'storage' 
                        | 'streamed_object' 
                        | 'stored_object' 
                        | 'blob_object' 
                        | 'cf' 
                        | 'clsid' 
                        ;

/*  Managed types for signatures  */                        
type                    : 'class' className  
                        | 'object'  
                        | 'value' 'class' className  
                        | 'valuetype' className  
                        | type '[' ']'  
                        | type '[' bounds1 ']'  
                        /* uncomment when and if this type is supported by the Runtime
                        | type 'value' '[' int32 ']' 
                        */
                        | type '&' 
                        | type '*' 
                        | type 'pinned' 
                        | type 'modreq' '(' typeSpec ')' 
                        | type 'modopt' '(' typeSpec ')' 
                        | methodSpec callConv type '*' '(' sigArgs0 ')' 
                        | type '<' tyArgs1 '>' 
                        | '!' '!' int32 
                        | '!' int32 
                        | '!' '!' dottedName 
                        | '!' dottedName 
                        | 'typedref' 
                        | 'void' 
                        | 'native' 'int' 
                        | 'native' 'unsigned' 'int' 
                        | 'native' 'uint' 
                        | 'native' 'float' 
                        | simpleType 
                        | '...' type 
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
                        
bounds1                 : bound 
                        | bounds1 ',' bound 
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

fileAttr                : /* EMPTY */ 
                        | fileAttr 'nometadata' 
                        ;

fileEntry               : /* EMPTY */ 
                        | '.entrypoint' 
                        ;

hashHead                : '.hash' '=' '(' 
                        ;

assemblyHead            : '.assembly' asmAttr dottedName 
                        ;

asmAttr                 : /* EMPTY */ 
                        | asmAttr 'retargetable' 
                        | asmAttr 'legacy' 'library' 
                        | asmAttr 'cil' 
                        | asmAttr 'x86' 
                        | asmAttr 'ia64' 
                        | asmAttr 'amd64' 
                        ;

assemblyDecls           : /* EMPTY */
                        | assemblyDecls assemblyDecl
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

assemblyRefDecls        : /* EMPTY */
                        | assemblyRefDecls assemblyRefDecl
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

exptAttr                : /* EMPTY */ 
                        | exptAttr 'private' 
                        | exptAttr 'public' 
                        | exptAttr 'forwarder' 
                        | exptAttr 'nested' 'public' 
                        | exptAttr 'nested' 'private' 
                        | exptAttr 'nested' 'family' 
                        | exptAttr 'nested' 'assembly' 
                        | exptAttr 'nested' 'famandassem' 
                        | exptAttr 'nested' 'famorassem' 
                        ;

exptypeDecls            : /* EMPTY */
                        | exptypeDecls exptypeDecl
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

manresAttr              : /* EMPTY */ 
                        | manresAttr 'public' 
                        | manresAttr 'private' 
                        ;

manifestResDecls        : /* EMPTY */
                        | manifestResDecls manifestResDecl
                        ;

manifestResDecl         : '.file' dottedName 'at' int32 
                        | '.assembly' 'extern' dottedName 
                        | customAttrDecl
                        ;
