header 
{
// Common Intermediate Language (.NET) LEXER and PARSER
// Version 1.0 by Pascal Lacroix.


using System.Collections;

}

options 
{
	language = "CSharp";
	namespace  =  "CIL.Parser";
}

/* LEXER */

class BaseCILLexer extends Lexer;

options 
{
	k = 2;
	testLiterals=false;    // don't automatically test for literals
	charVocabulary = '\3'..'\377';
	exportVocab = CILLexer;
}


tokens
{
//LINE =                "#line" ;
DOT_ASSEMBLY =        ".assembly" ;
DOT_ADDON =       ".addon" ;
DOT_CCTOR =           ".cctor" ;
DOT_CLASS =           ".class" ;
DOT_CAPABILITY =	  ".capability" ;	// portable.net only
DOT_CORFLAGS =        ".corflags" ;
DOT_CTOR =            ".ctor" ;
DOT_CUSTOM =          ".custom" ;
DOT_DATA =            ".data" ;
DOT_EMITBYTE =        ".emitbyte" ;
DOT_ENTRYPOINT =      ".entrypoint" ;
DOT_EVENT =           ".event" ;
DOT_EXPORT =          ".export" ;
DOT_FIELD =           ".field" ;
DOT_FILE =            ".file" ;
DOT_FIRE =            ".fire" ;
DOT_GET =             ".get" ;
DOT_HASH =            ".hash" ;
DOT_IMAGEBASE =       ".imagebase" ;
DOT_IMPORT =          ".import" ;
DOT_LANGUAGE =        ".language" ;
DOT_LINE =            ".line" ;
DOT_LOCALE =          ".locale" ;
DOT_LOCALIZED =       ".localized" ;
DOT_LOCALS =          ".locals" ;
DOT_MANIFESTRES =     ".manifestres" ;
DOT_MAXSTACK =        ".maxstack" ;
DOT_METHOD =          ".method" ;
DOT_MODULE =          ".module" ;
DOT_MRESOURCE =       ".mresource" ;
DOT_NAMESPACE =       ".namespace" ;
DOT_OTHER =           ".other" ;
DOT_OVERRIDE =        ".override" ;
DOT_PACK =            ".pack" ;
DOT_PARAM =           ".param" ;
DOT_PDIRECT =         ".pdirect" ;
DOT_PERMISSION =      ".permission" ;
DOT_PERMISSIONSET =   ".permissionset" ;
DOT_PROPERTY =        ".property" ;
DOT_PUBLICKEY =       ".publickey" ;
DOT_PUBLICKEYTOKEN =  ".publickeytoken" ;
DOT_REMOVEON =        ".removeon" ;
DOT_SET =             ".set" ;
DOT_SIZE =            ".size" ;
DOT_SUBSYSTEM =       ".subsystem" ;
DOT_TRY =             ".try" ;
DOT_VER =             ".ver" ;
DOT_VTABLE =          ".vtable" ;
DOT_VTENTRY =         ".vtentry" ;
DOT_VTFIXUP =         ".vtfixup" ;
DOT_ZEROINIT =        ".zeroinit" ;
//^THE_END^ =           "^THE_END^" ;
ABSTRACT =            "abstract" ;
ADD =                 "add" ;
ADD_OVF =             "add.ovf" ;
ADD_OVF_UN =          "add.ovf.un" ;
ALGORITHM =           "algorithm" ;
ALIGNMENT =           "alignment" ;
AND =                 "and" ;
ANSI =                "ansi" ;
ANY =                 "any" ;
ARGLIST =             "arglist" ;
ARRAY =               "array" ;
AS =                  "as" ;
ASSEMBLY =            "assembly" ;
ASSERT =              "assert" ;
AT =                  "at" ;
AUTO =                "auto" ;
AUTOCHAR =            "autochar" ;
BEFOREFIELDINIT =     "beforefieldinit" ;
BEQ =                 "beq" ;
BEQ_S =               "beq.s" ;
BGE =                 "bge" ;
BGE_S =               "bge.s" ;
BGE_UN =              "bge.un" ;
BGE_UN_S =            "bge.un.s" ;
BGT =                 "bgt" ;
BGT_S =               "bgt.s" ;
BGT_UN =              "bgt.un" ;
BGT_UN_S =            "bgt.un.s" ;
BLE =                 "ble" ;
BLE_S =               "ble.s" ;
BLE_UN =              "ble.un" ;
BLE_UN_S =            "ble.un.s" ;
BLOB =                "blob" ;
BLOB_OBJECT =         "blob_object" ;
BLT =                 "blt" ;
BLT_S =               "blt.s" ;
BLT_UN =              "blt.un" ;
BLT_UN_S =            "blt.un.s" ;
BNE_UN =              "bne.un" ;
BNE_UN_S =            "bne.un.s" ;
BOOL =                "bool" ;
BOX =                 "box" ;
BR =                  "br" ;
BR_S =                "br.s" ;
BREAK =               "break" ;
BRFALSE =             "brfalse" ;
BRFALSE_S =           "brfalse.s" ;
BRINST =              "brinst" ;
BRINST_S =            "brinst.s" ;
BRNULL =              "brnull" ;
BRNULL_S =            "brnull.s" ;
BRTRUE =              "brtrue" ;
BRTRUE_S =            "brtrue.s" ;
BRZERO =              "brzero" ;
BRZERO_S =            "brzero.s" ;
BSTR =                "bstr" ;
BYTEARRAY =           "bytearray" ;
BYVALSTR =            "byvalstr" ;
CALL =                "call" ;
CALLI =               "calli" ;
CALLMOSTDERIVED =     "callmostderived" ;
CALLVIRT =            "callvirt" ;
CARRAY =              "carray" ;
CASTCLASS =           "castclass" ;
CATCH =               "catch" ;
CDECL =               "cdecl" ;
CEQ =                 "ceq" ;
CF =                  "cf" ;
CGT =                 "cgt" ;
CGT_UN =              "cgt.un" ;
CHAR =                "char" ;
CIL =                 "cil" ;
CKFINITE =            "ckfinite" ;
CLASS =               "class" ;
CLSID =               "clsid" ;
CLT =                 "clt" ;
CLT_UN =              "clt.un" ;
CONST =               "const" ;
CONV_I =              "conv.i" ;
CONV_I1 =             "conv.i1" ;
CONV_I2 =             "conv.i2" ;
CONV_I4 =             "conv.i4" ;
CONV_I8 =             "conv.i8" ;
CONV_OVF_I =          "conv.ovf.i" ;
CONV_OVF_I_UN =       "conv.ovf.i.un" ;
CONV_OVF_I1 =         "conv.ovf.i1" ;
CONV_OVF_I1_UN =      "conv.ovf.i1.un" ;
CONV_OVF_I2 =         "conv.ovf.i2" ;
CONV_OVF_I2_UN =      "conv.ovf.i2.un" ;
CONV_OVF_I4 =         "conv.ovf.i4" ;
CONV_OVF_I4_UN =      "conv.ovf.i4.un" ;
CONV_OVF_I8 =         "conv.ovf.i8" ;
CONV_OVF_I8_UN =      "conv.ovf.i8.un" ;
CONV_OVF_U =          "conv.ovf.u" ;
CONV_OVF_U_UN =       "conv.ovf.u.un" ;
CONV_OVF_U1 =         "conv.ovf.u1" ;
CONV_OVF_U1_UN =      "conv.ovf.u1.un" ;
CONV_OVF_U2 =         "conv.ovf.u2" ;
CONV_OVF_U2_UN =      "conv.ovf.u2.un" ;
CONV_OVF_U4 =         "conv.ovf.u4" ;
CONV_OVF_U4_UN =      "conv.ovf.u4.un" ;
CONV_OVF_U8 =         "conv.ovf.u8" ;
CONV_OVF_U8_UN =      "conv.ovf.u8.un" ;
CONV_R_UN =           "conv.r.un" ;
CONV_R4 =             "conv.r4" ;
CONV_R8 =             "conv.r8" ;
CONV_U =              "conv.u" ;
CONV_U1 =             "conv.u1" ;
CONV_U2 =             "conv.u2" ;
CONV_U4 =             "conv.u4" ;
CONV_U8 =             "conv.u8" ;
CPBLK =               "cpblk" ;
CPOBJ =               "cpobj" ;
CURRENCY =            "currency" ;
CUSTOM =              "custom" ;
DATE =                "date" ;
DECIMAL =             "decimal" ;
DEFAULT =             "default" ;
DEMAND =              "demand" ;
DENY =                "deny" ;
DIV =                 "div" ;
DIV_UN =              "div.un" ;
DUP =                 "dup" ;
ENDFAULT =            "endfault" ;
ENDFILTER =           "endfilter" ;
ENDFINALLY =          "endfinally" ;
ENDMAC =              "endmac" ;
ENUM =                "enum" ;
ERROR =               "error" ;
EXPLICIT =            "explicit" ;
EXTENDS =             "extends" ;
EXTERN =              "extern" ;
FALSE =               "false" ;
FAMANDASSEM =         "famandassem" ;
FAMILY =              "family" ;
FAMORASSEM =          "famorassem" ;
FASTCALL =            "fastcall" ;
FAULT =               "fault" ;
FIELD =               "field" ;
FILETIME =            "filetime" ;
FILTER =              "filter" ;
FINAL =               "final" ;
FINALLY =             "finally" ;
FIXED =               "fixed" ;
FLOAT =               "float" ;
FLOAT32 =             "float32" ;
FLOAT64 =             "float64" ;
FORWARDREF =          "forwardref" ;
FROMUNMANAGED =       "fromunmanaged" ;
HANDLER =             "handler" ;
HIDEBYSIG =           "hidebysig" ;
HRESULT =             "hresult" ;
IDISPATCH =           "idispatch" ;
IL =                  "il" ;
ILLEGAL =             "illegal" ;
IMPLEMENTS =          "implements" ;
IMPLICITCOM =         "implicitcom" ;
IMPLICITRES =         "implicitres" ;
IMPORT =              "import" ;
IN =                  "in" ;
INHERITCHECK =        "inheritcheck" ;
INIT =                "init" ;
INITBLK =             "initblk" ;
INITOBJ =             "initobj" ;
INITONLY =            "initonly" ;
INSTANCE =            "instance" ;
INT =                 "int" ;
INT16 =               "int16" ;
INT32 =               "int32" ;
INT64 =               "int64" ;
INT8 =                "int8" ;
INTERFACE =           "interface" ;
INTERNALCALL =        "internalcall" ;
ISINST =              "isinst" ;
IUNKNOWN =            "iunknown" ;
JMP =                 "jmp" ;
LASTERR =             "lasterr" ;
LCID =                "lcid" ;
LDARG =               "ldarg" ;
LDARG_0 =             "ldarg.0" ;
LDARG_1 =             "ldarg.1" ;
LDARG_2 =             "ldarg.2" ;
LDARG_3 =             "ldarg.3" ;
LDARG_S =             "ldarg.s" ;
LDARGA =              "ldarga" ;
LDARGA_S =            "ldarga.s" ;
LDC_I4 =              "ldc.i4" ;
LDC_I4_0 =            "ldc.i4.0" ;
LDC_I4_1 =            "ldc.i4.1" ;
LDC_I4_2 =            "ldc.i4.2" ;
LDC_I4_3 =            "ldc.i4.3" ;
LDC_I4_4 =            "ldc.i4.4" ;
LDC_I4_5 =            "ldc.i4.5" ;
LDC_I4_6 =            "ldc.i4.6" ;
LDC_I4_7 =            "ldc.i4.7" ;
LDC_I4_8 =            "ldc.i4.8" ;
//LDC_I4_M1 =           "ldc.i4.M1" ;
LDC_I4_M1 =           "ldc.i4.m1" ;
LDC_I4_S =            "ldc.i4.s" ;
LDC_I8 =              "ldc.i8" ;
LDC_R4 =              "ldc.r4" ;
LDC_R8 =              "ldc.r8" ;
LDELEM_I =            "ldelem.i" ;
LDELEM_I1 =           "ldelem.i1" ;
LDELEM_I2 =           "ldelem.i2" ;
LDELEM_I4 =           "ldelem.i4" ;
LDELEM_I8 =           "ldelem.i8" ;
LDELEM_R4 =           "ldelem.r4" ;
LDELEM_R8 =           "ldelem.r8" ;
LDELEM_REF =          "ldelem.ref" ;
LDELEM_U1 =           "ldelem.u1" ;
LDELEM_U2 =           "ldelem.u2" ;
LDELEM_U4 =           "ldelem.u4" ;
LDELEM_U8 =           "ldelem.u8" ;
LDELEMA =             "ldelema" ;
LDFLD =               "ldfld" ;
LDFLDA =              "ldflda" ;
LDFTN =               "ldftn" ;
LDIND_I =             "ldind.i" ;
LDIND_I1 =            "ldind.i1" ;
LDIND_I2 =            "ldind.i2" ;
LDIND_I4 =            "ldind.i4" ;
LDIND_I8 =            "ldind.i8" ;
LDIND_R4 =            "ldind.r4" ;
LDIND_R8 =            "ldind.r8" ;
LDIND_REF =           "ldind.ref" ;
LDIND_U1 =            "ldind.u1" ;
LDIND_U2 =            "ldind.u2" ;
LDIND_U4 =            "ldind.u4" ;
LDIND_U8 =            "ldind.u8" ;
LDLEN =               "ldlen" ;
LDLOC =               "ldloc" ;
LDLOC_0 =             "ldloc.0" ;
LDLOC_1 =             "ldloc.1" ;
LDLOC_2 =             "ldloc.2" ;
LDLOC_3 =             "ldloc.3" ;
LDLOC_S =             "ldloc.s" ;
LDLOCA =              "ldloca" ;
LDLOCA_S =            "ldloca.s" ;
LDNULL =              "ldnull" ;
LDOBJ =               "ldobj" ;
LDSFLD =              "ldsfld" ;
LDSFLDA =             "ldsflda" ;
LDSTR =               "ldstr" ;
LDTOKEN =             "ldtoken" ;
LDVIRTFTN =           "ldvirtftn" ;
LEAVE =               "leave" ;
LEAVE_S =             "leave.s" ;
LINKCHECK =           "linkcheck" ;
LITERAL =             "literal" ;
LOCALLOC =            "localloc" ;
LPSTR =               "lpstr" ;
LPSTRUCT =            "lpstruct" ;
LPTSTR =              "lptstr" ;
LPVOID =              "lpvoid" ;
LPWSTR =              "lpwstr" ;
MANAGED =             "managed" ;
MARSHAL =             "marshal" ;
METHOD =              "method" ;
MKREFANY =            "mkrefany" ;
MODOPT =              "modopt" ;
MODREQ =              "modreq" ;
MUL =                 "mul" ;
MUL_OVF =             "mul.ovf" ;
MUL_OVF_UN =          "mul.ovf.un" ;
NATIVE =              "native" ;
NEG =                 "neg" ;
NESTED =              "nested" ;
NEWARR =              "newarr" ;
NEWOBJ =              "newobj" ;
NEWSLOT =             "newslot" ;
NOAPPDOMAIN =         "noappdomain" ;
NOINLINING =          "noinlining" ;
NOMACHINE =           "nomachine" ;
NOMANGLE =            "nomangle" ;
NOMETADATA =          "nometadata" ;
NONCASDEMAND =        "noncasdemand" ;
NONCASINHERITANCE =   "noncasinheritance" ;
NONCASLINKDEMAND =    "noncaslinkdemand" ;
NOP =                 "nop" ;
NOPROCESS =           "noprocess" ;
NOT =                 "not" ;
NOT_IN_GC_HEAP =      "not_in_gc_heap" ;
NOTREMOTABLE =        "notremotable" ;
NOTSERIALIZED =       "notserialized" ;
NULL =                "null" ;
NULLREF =             "nullref" ;
OBJECT =              "object" ;
OBJECTREF =           "objectref" ;
OPT =                 "opt" ;
OPTIL =               "optil" ;
OR =                  "or" ;
OUT =                 "out" ;
PERMITONLY =          "permitonly" ;
PINNED =              "pinned" ;
PINVOKEIMPL =         "pinvokeimpl" ;
POP =                 "pop" ;
PREFIX1 =             "prefix1" ;
PREFIX2 =             "prefix2" ;
PREFIX3 =             "prefix3" ;
PREFIX4 =             "prefix4" ;
PREFIX5 =             "prefix5" ;
PREFIX6 =             "prefix6" ;
PREFIX7 =             "prefix7" ;
PREFIXREF =           "prefixref" ;
PREJITDENY =          "prejitdeny" ;
PREJITGRANT =         "prejitgrant" ;
PRESERVESIG =         "preservesig" ;
PRIVATE =             "private" ;
PRIVATESCOPE =        "privatescope" ;
PROTECTED =           "protected" ;
PUBLIC =              "public" ;
READONLY =            "readonly" ;
RECORD =              "record" ;
REFANY =              "refany" ;
REFANYTYPE =          "refanytype" ;
REFANYVAL =           "refanyval" ;
REM =                 "rem" ;
REM_UN =              "rem.un" ;
REQMIN =              "reqmin" ;
REQOPT =              "reqopt" ;
REQREFUSE =           "reqrefuse" ;
REQSECOBJ =           "reqsecobj" ;
REQUEST =             "request" ;
RET =                 "ret" ;
RETHROW =             "rethrow" ;
RETVAL =              "retval" ;
RTSPECIALNAME =       "rtspecialname" ;
RUNTIME =             "runtime" ;
SAFEARRAY =           "safearray" ;
SEALED =              "sealed" ;
SEQUENTIAL =          "sequential" ;
SERIALIZABLE =        "serializable" ;
SHL =                 "shl" ;
SHR =                 "shr" ;
SHR_UN =              "shr.un" ;
SIZEOF =              "sizeof" ;
SPECIAL =             "special" ;
SPECIALNAME =         "specialname" ;
STARG =               "starg" ;
STARG_S =             "starg.s" ;
STATIC =              "static" ;
STDCALL =             "stdcall" ;
STELEM_I =            "stelem.i" ;
STELEM_I1 =           "stelem.i1" ;
STELEM_I2 =           "stelem.i2" ;
STELEM_I4 =           "stelem.i4" ;
STELEM_I8 =           "stelem.i8" ;
STELEM_R4 =           "stelem.r4" ;
STELEM_R8 =           "stelem.r8" ;
STELEM_REF =          "stelem.ref" ;
STFLD =               "stfld" ;
STIND_I =             "stind.i" ;
STIND_I1 =            "stind.i1" ;
STIND_I2 =            "stind.i2" ;
STIND_I4 =            "stind.i4" ;
STIND_I8 =            "stind.i8" ;
STIND_R4 =            "stind.r4" ;
STIND_R8 =            "stind.r8" ;
STIND_REF =           "stind.ref" ;
STLOC =               "stloc" ;
STLOC_0 =             "stloc.0" ;
STLOC_1 =             "stloc.1" ;
STLOC_2 =             "stloc.2" ;
STLOC_3 =             "stloc.3" ;
STLOC_S =             "stloc.s" ;
STOBJ =               "stobj" ;
STORAGE =             "storage" ;
STORED_OBJECT =       "stored_object" ;
STREAM =              "stream" ;
STREAMED_OBJECT =     "streamed_object" ;
STRING =              "string" ;
STRUCT =              "struct" ;
STSFLD =              "stsfld" ;
SUB =                 "sub" ;
SUB_OVF =             "sub.ovf" ;
SUB_OVF_UN =          "sub.ovf.un" ;
SWITCH =              "switch" ;
SYNCHRONIZED =        "synchronized" ;
SYSCHAR =             "syschar" ;
SYSSTRING =           "sysstring" ;
TAIL_ =               "tail." ;
TBSTR =               "tbstr" ;
THISCALL =            "thiscall" ;
THROW =               "throw" ;
TLS =                 "tls" ;
TO =                  "to" ;
TRUE =                "true" ;
TYPEDREF =            "typedref" ;
UNALIGNED_ =          "unaligned." ;
UNBOX =               "unbox" ;
UNICODE =             "unicode" ;
UNMANAGED =           "unmanaged" ;
UNMANAGEDEXP =        "unmanagedexp" ;
UNSIGNED =            "unsigned" ;
UNUSED =              "unused" ;
USERDEFINED =         "userdefined" ;
VALUE =               "value" ;
VALUETYPE =           "valuetype" ;
VARARG =              "vararg" ;
VARIANT =             "variant" ;
VECTOR =              "vector" ;
VIRTUAL =             "virtual" ;
VOID =                "void" ;
VOLATILE_ =           "volatile." ;
WCHAR =               "wchar" ;
WINAPI =              "winapi" ;
WITH =                "with" ;
WRAPPER =             "wrapper" ;
XOR =                 "xor" ;

STRICT =			  "strict" ;

// Some imaginary tokens
ID;
DOTTED_ID;

INTEGER_LITERAL;
FLOAT_LITERAL;
HEX_BYTE;
}

CHAR_SEQUENCE
options
{
	testLiterals=true;
}:
	DOT (
		(DIGIT)+ (EXPONENT)?						{ $setType(FLOAT_LITERAL); }
		| LETTER (LETTER|DIGIT|'$'|'_'|DOT)*		{ $setType(DOTTED_ID); }
		| DOT DOT									{ $setType(TRIPLE_DOT); }
		)
	| ('_'|'?'|LETTER) (LETTER|DIGIT|'$'|'_'|DOT)*	{ $setType(DOTTED_ID); }
	| ('-')? DIGIT  
			( ('a'..'f'|'A'..'F')							{ $setType(HEX_BYTE); }
			| (DIGIT)* { $setType(INTEGER_LITERAL); }
				(
					({LA(2) != '.'}? DOT (DIGIT)* (EXPONENT)?	{ $setType(FLOAT_LITERAL); } )?
					| EXPONENT								{ $setType(FLOAT_LITERAL); }
				)
			| ('x'|'X') (HEX_DIGIT)+						{ $setType(INTEGER_LITERAL); }
			)
	;
	
protected
EXPONENT: ('e'|'E') ('+'|'-')? (DIGIT)+
	;
	
protected
HEX_DIGIT: (DIGIT|'a'..'f'|'A'..'F') ;

protected
DIGIT: '0'..'9' ;

protected
LETTER: ('a'..'z'|'A'..'Z') ;

// Symbols
//QUESTION options { paraphrase = "?"; } :	'?'		;
LPAREN 	options { paraphrase = "("; } :		'('		;
RPAREN 	options { paraphrase = ")"; } :		')'		;
LBRACK 	options { paraphrase = "["; } :	 	'['		;
RBRACK 	options { paraphrase = "]"; } :		']'		;
LCURLY 	options { paraphrase = "{"; } :		'{'		;
RCURLY 	options { paraphrase = "}"; } :		'}'		;
COLON 	options { paraphrase = ":"; } :		':'		;
COMMA 	options { paraphrase = ","; } :		','		;
EQUAL 	options { paraphrase = "="; } :		'='		;
PLUS 	options { paraphrase = "+"; } :		'+'		;

protected
MINUS	options { paraphrase = "-"; } :		'-'		;

STAR	options { paraphrase = "*"; } :		'*'		;
SEMI	options { paraphrase = ";"; } :		';'		;
LESS	options { paraphrase = "<"; } :		'<'		;
GREATER	options { paraphrase = ">"; } :		'>'		;
SLASH	options { paraphrase = "/"; } :		'/'		;
REF	    options { paraphrase = "&"; } :		'&'		;
EXCLAM  options { paraphrase = "!"; } :		'!'		;

protected
TRIPLE_DOT							  : "..."	;


DOUBLE_COLON options { paraphrase = "::"; }	: "::" 	;

protected 
DOT				:	'.'		;

// Simple string like "message".
DQSTRING: '"'! (ESC|~('"'|'\\'))* '"'! ;

SQSTRING: '\''! (ESC|~('\''|'\\'))* '\''! ;

protected
VOCAB: '\3' .. '\377' ;

protected
ESC
	:	'\\'
		(	'n'
		|	'r'
		|	't'
		|	'b'
		|	'f'
		|	'"'
		|	'\''
		|	'\\'
		|	'?'
		|	('u')+ HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT	// unicode
		|	('x'|'X') HEX_DIGIT HEX_DIGIT
		|	('0'..'3')
			(
				options {
					warnWhenFollowAmbig = false;
				}
			:	('0'..'7')
				(
					options {
						warnWhenFollowAmbig = false;
					}
				:	'0'..'7'
				)?
			)?
		|	('4'..'7')
			(
				options {
					warnWhenFollowAmbig = false;
				}
			:	('0'..'9')
			)?
		)
	;

// Whitespace -- ignored
WS	:	(	' '
		|	'\t'
		|	'\f'
			// handle newlines
		|	(	options {generateAmbigWarnings=false;}
			:	"\r\n"  // Evil DOS
			|	'\r'    // Macintosh
			|	'\n'    // Unix (the right way)
			)
			{ newline(); }
		)+
		{ _ttype = Token.SKIP; }
	;

// Single-line comments
SL_COMMENT
	:	"//"
		(~('\n'|'\r'))* ('\n'|'\r'('\n')?)?
		{$setType(Token.SKIP); newline();}
	;

// multiple-line comments
ML_COMMENT
	:	"/*"
		(	/*	'\r' '\n' can be matched in one alternative or by matching
				'\r' in one iteration and '\n' in another.  I am trying to
				handle any flavor of newline that comes in, but the language
				that allows both "\r\n" and "\r" and "\n" to all be valid
				newline is ambiguous.  Consequently, the resulting grammar
				must be ambiguous.  I'm shutting this warning off.
			 */
			options {
				generateAmbigWarnings=false;
			}
		:
			{ LA(2)!='/' }? '*'
		|	'\r' '\n'		{newline();}
		|	'\r'			{newline();}
		|	'\n'			{newline();}
		|	~('*'|'\n'|'\r')
		)*
		"*/"
		{$setType(Token.SKIP);}
	;



/* PARSER */

class CILParser extends Parser;

options
{
	k = 2;
	buildAST = true;
	importVocab=CILLexer;
	exportVocab=CILParser;
}

tokens
{
	DECLARATIONS;
	MODULE_NODE;
	ASSEMBLY_NODE;
	ATTRIBUTLIST_NODE;
	ASSEMBLY_REF_NODE;
	NAMESPACE_NODE;
	METHOD_NODE;
	CLASS_NODE;
	FIELD_NODE;
	DATA_NODE;
	EVENT_NODE;
	PROP_NODE;
	CODELABEL_NODE;
	INSTR_NODE;
	BLOCK_NODE;
	SIG_ARGS_NODE;
	ARGUMENT_NODE;
	SEHBLOCK_NODE;
}

start: declarations
	;


//=== DECLARATIONS ===

declarations: (declaration)* EOF!
						{ #declarations = #([DECLARATIONS, "DECLARATIONS"], #declarations); }
	;

declaration: classDeclaration
	| namespaceDeclaration
	| methodDeclaration
	| fieldDeclaration
	| dataDeclaration
	| vtableDeclaration
	| vtfixupDeclaration
	| extSourceSpec
	| fileDeclaration
	| assemblyDeclaration
	| assemblyRefDeclaration
	| comtypeDeclaration
	| mresourceDeclaration
	| moduleDeclaration
	| securityDeclaration
	| customAttributDeclaration
	| languageDeclaration
	| ignoredDeclaration
	;


//=== LANGUAGE ===

languageDeclaration: (DOT_LANGUAGE SQSTRING COMMA SQSTRING COMMA SQSTRING) => DOT_LANGUAGE^ SQSTRING COMMA! SQSTRING COMMA! SQSTRING
	| (DOT_LANGUAGE SQSTRING COMMA SQSTRING) => DOT_LANGUAGE^ SQSTRING COMMA! SQSTRING
	| DOT_LANGUAGE^ SQSTRING
	;


//=== MODULE ===

moduleDeclaration!: DOT_MODULE EXTERN n:name
						{ #moduleDeclaration = #([MODULE_NODE, "MODULE_NODE"], #n, #EXTERN);	}
	| DOT_MODULE n2:name
						{ #moduleDeclaration = #([MODULE_NODE, "MODULE_NODE"], #n2);			}
	| DOT_MODULE
						{ #moduleDeclaration = #([MODULE_NODE, "MODULE_NODE"], [ID, "NONAME"]);	}
	;

//=== IGNORED DECLARATION ===

ignoredDeclaration!: DOT_SUBSYSTEM int32
	| DOT_CORFLAGS int32
	| DOT_FILE ALIGNMENT int32
	| DOT_IMAGEBASE int64
	;

//=== FILE ===

fileDeclaration!
{string str = null; }
	: (DOT_FILE fileAttributs name fileEntry DOT_HASH) => DOT_FILE fileAttributs n1:name fileEntry DOT_HASH EQUAL LPAREN str = bytes RPAREN fileEntry
						{ #fileDeclaration = #(#DOT_FILE, #n1); }					
	| DOT_FILE fileAttributs n2:name fileEntry
						{ #fileDeclaration = #(#DOT_FILE, #n2); }
	;

fileEntry: (DOT_ENTRYPOINT)?
	;

fileAttributs: (fileAttribut)*
					{ #fileAttributs = #([ATTRIBUTLIST_NODE, "ATTRIBUTLIST_NODE"], #fileAttributs); }
	;

fileAttribut: NOMETADATA
	;


//=== VTFIXUP ===

vtfixupDeclaration: DOT_VTFIXUP^ LBRACK int32 RBRACK vtfixupAttributs AT id
	;

vtfixupAttributs: (vtfixupAttribut)*
						{ #vtfixupAttributs = #([ATTRIBUTLIST_NODE, "ATTRIBUTLIST_NODE"], #vtfixupAttributs); }
	;

vtfixupAttribut: (INT32 | INT64 | FROMUNMANAGED | CALLMOSTDERIVED)
	;


//=== VTABLE ===

vtableDeclaration!
{string str = null; }
	: DOT_VTABLE EQUAL LPAREN str = bytes RPAREN
						{ #vtableDeclaration = #(#DOT_VTABLE, [ID, str]); }
	;

//=== SECURITY ===

securityDeclaration!
{ string str = null; }
	: (DOT_PERMISSION securityAction typeSpec LPAREN) => DOT_PERMISSION securityAction typeSpec LPAREN nameValPairs RPAREN
	| DOT_PERMISSION securityAction typeSpec
	| DOT_PERMISSIONSET securityAction EQUAL LPAREN str = bytes RPAREN
	| DOT_CAPABILITY securityAction EQUAL LPAREN str = bytes RPAREN
	;

securityAction: REQUEST
	| DEMAND
	| ASSERT
	| DENY
	| PERMITONLY
	| LINKCHECK
	| INHERITCHECK
	| REQMIN
	| REQOPT
	| REQREFUSE
	| PREJITGRANT
	| PREJITDENY
	| NONCASDEMAND
	| NONCASLINKDEMAND
	;

nameValPairs: nameValPair (COMMA nameValPair)*
	;

nameValPair: compQString EQUAL caValue
	;

caValue: truefalse
	| int32
	| INT32 LPAREN int32 RPAREN
	| compQString
	| (className LPAREN INT8) => className LPAREN INT8  COLON int32 RPAREN
	| (className LPAREN INT16) => className LPAREN INT16 COLON int32 RPAREN
	| (className LPAREN INT32) => className LPAREN INT32 COLON int32 RPAREN
	| (className LPAREN int32) => className LPAREN int32 RPAREN
	;

//=== EXT SOURCE SPEC === (IGNORED)
extSourceSpec!: DOT_LINE int32 (COLON int32 (SQSTRING)?
								| SQSTRING)?

	//| P_LINE int32 DQSTRING				// #line (not supported)
	;

//=== CUSTOM ATTRIBUT ===

customAttributDeclaration
{ string str = null; }
	: (DOT_CUSTOM customType EQUAL LPAREN) => DOT_CUSTOM^ customType EQUAL LPAREN str = bytes RPAREN
	| (DOT_CUSTOM customType EQUAL) => DOT_CUSTOM^ customType EQUAL compQString
	| DOT_CUSTOM^ customType
	| (DOT_CUSTOM LPAREN ownerType RPAREN customType EQUAL) => DOT_CUSTOM^ LPAREN ownerType RPAREN customType EQUAL LPAREN str = bytes RPAREN
	| DOT_CUSTOM^ LPAREN ownerType RPAREN customType
	;

customType: callConv VOID /*type*/ typeSpec DOUBLE_COLON DOT_CTOR LPAREN! signatureArguments RPAREN!
	;


//=== ASSEMBLY ===

assemblyDeclaration!: h:assemblyHead LCURLY b:assemblyBodyDeclarations RCURLY
						{ #assemblyDeclaration = #([ASSEMBLY_NODE, "ASSEMBLY_NODE"], #h, #b); }
	;

assemblyHead!
	: DOT_ASSEMBLY attrs:assemblyAttributs n:name
						{ #assemblyHead = #(#DOT_ASSEMBLY, #n, #attrs); }
	;

assemblyAttributs: (assemblyAttribut)*
						{ #assemblyAttributs = #([ATTRIBUTLIST_NODE, "ATTRIBUTLIST_NODE"], #assemblyAttributs); }
	;

assemblyAttribut: NOAPPDOMAIN
	| NOPROCESS
	| NOMACHINE
	;

assemblyBodyDeclarations: (assemblyBodyDeclaration)*
	;

assemblyBodyDeclaration: DOT_HASH^ ALGORITHM int32
	| securityDeclaration
	| asmOrRefDeclaration
	;

asmOrRefDeclaration!
{ string str = null; }
	: DOT_PUBLICKEY EQUAL LPAREN str = bytes RPAREN
						{ #asmOrRefDeclaration = #(#DOT_PUBLICKEY, [ID, str]); }
	| DOT_VER a:int32 COLON b:int32 COLON c:int32 COLON d:int32
						{ #asmOrRefDeclaration = #(#DOT_VER, #a, #b, #c, #d); }
	| DOT_LOCALE val:compQString
						{ #asmOrRefDeclaration = #(#DOT_LOCALE, #val); }
	| DOT_LOCALE EQUAL LPAREN str = bytes RPAREN
						{ #asmOrRefDeclaration = #(#DOT_LOCALE, [ID, str]); }
	| customAttributDeclaration
	;

assemblyRefDeclaration!: h:assemblyRefHead LCURLY b:assemblyRefBodyDeclarations RCURLY
						{ #assemblyRefDeclaration = #([ASSEMBLY_REF_NODE, "ASSEMBLY_REF_NODE"], #h, #b); }
	;

assemblyRefHead: DOT_ASSEMBLY^ EXTERN name (AS name)?
	;

assemblyRefBodyDeclarations: (assemblyRefBodyDeclaration)*
						{ #assemblyRefBodyDeclarations = #([BLOCK_NODE, "BLOCK_NODE"], #assemblyRefBodyDeclarations); }
	;

assemblyRefBodyDeclaration
{string str = null; }
	: ! DOT_HASH EQUAL LPAREN str = bytes RPAREN
						{ #assemblyRefBodyDeclaration = #(#DOT_HASH, [ID, str]); }
	| asmOrRefDeclaration
	| ! DOT_PUBLICKEYTOKEN EQUAL LPAREN str = bytes RPAREN
						{ #assemblyRefBodyDeclaration = #(#DOT_PUBLICKEYTOKEN, [ID, str]); }
	;


//=== COMTYPES === (IGNORED)

comtypeDeclaration!: comtypeHead LCURLY comtypeBodyDeclarations RCURLY
	;

comtypeHead: DOT_CLASS EXTERN comtAttributs name
	;

comtAttributs: (comtAttribut)*
	;

comtAttribut: PRIVATE
	|  PUBLIC
	| NESTED PUBLIC
	| NESTED PRIVATE
	| NESTED FAMILY
	| NESTED ASSEMBLY
	| NESTED FAMANDASSEM
	| NESTED FAMORASSEM
	;

comtypeBodyDeclarations: (comtypeBodyDeclaration)*
	;

comtypeBodyDeclaration:	DOT_FILE name
	| DOT_CLASS EXTERN name
	| DOT_CLASS int32
	| customAttributDeclaration
	;

exportDeclaration!: exportHead LCURLY comtypeBodyDeclarations RCURLY
	;

exportHead: DOT_EXPORT comtAttributs name
	;


//=== Manifest Resources (IGNORED)

mresourceDeclaration!: mresourceHead LCURLY mresourceBodyDeclarations RCURLY
	;

mresourceHead: DOT_MRESOURCE mresourceAttributs name
	;

mresourceAttributs: (mresourceAttribut)*
	;

mresourceAttribut: (PUBLIC | PRIVATE)
	;

mresourceBodyDeclarations: (mresourceBodyDeclaration)*
	;

mresourceBodyDeclaration: DOT_FILE name AT int32
	| DOT_ASSEMBLY EXTERN name
	| customAttributDeclaration
	;


//=== NAMESPACE ===

namespaceDeclaration!: h:namespaceHead LCURLY b:namespaceBodyDeclarations RCURLY
						{ #namespaceDeclaration = #([NAMESPACE_NODE, "NAMESPACE_NODE"], h, b); }
	;

namespaceHead!
	: DOT_NAMESPACE n:name
						{ #namespaceHead = #(#DOT_NAMESPACE, #n); }
	;

namespaceBodyDeclarations: (declaration)*
						{ #namespaceBodyDeclarations = #([BLOCK_NODE, "BLOCK_NODE"], #namespaceBodyDeclarations); }
	;

//=== CLASS ===

classDeclaration!: h:classHead LCURLY b:classBodyDeclarations RCURLY
						{ #classDeclaration = #([CLASS_NODE, "CLASS_NODE"], #h, #b); }
	;

classHead!
	: DOT_CLASS attrs:classAttributs i:id ext:extendsClause impl:implementsClause
						{ #classHead = #(#DOT_CLASS, #i, #attrs, #ext, #impl); }
	;

classAttributs: (classAttribut)*
						{ #classAttributs = #([ATTRIBUTLIST_NODE, "ATTRIBUTLIST_NODE"], #classAttributs); }
	;

classAttribut: (PUBLIC
	| PRIVATE
	| VALUE
	| ENUM
	| INTERFACE
	| SEALED
	| ABSTRACT
	| AUTO
	| SEQUENTIAL
	| EXPLICIT
	| ANSI
	| UNICODE
	| AUTOCHAR
	| IMPORT
	| SERIALIZABLE
	| NESTED PUBLIC
	| NESTED PRIVATE
	| NESTED FAMILY
	| NESTED ASSEMBLY
	| NESTED FAMANDASSEM
	| NESTED FAMORASSEM
	| BEFOREFIELDINIT
	| SPECIALNAME
	| RTSPECIALNAME)
	;

extendsClause!: (EXTENDS n:className
						{ #extendsClause = #(#EXTENDS, #n); } )?
	;

implementsClause!: (IMPLEMENTS names:classNames
						{ #implementsClause = #(#IMPLEMENTS, #names); } )?
	;

classBodyDeclarations: (classBodyDeclaration)*
						{ #classBodyDeclarations = #([BLOCK_NODE, "BLOCK_NODE"], #classBodyDeclarations); }
	;

classBodyDeclaration: methodDeclaration
	| classDeclaration
	| eventDeclaration
	| propertyDeclaration
	| fieldDeclaration
	| dataDeclaration
	| securityDeclaration
	| extSourceSpec
	| customAttributDeclaration
	| DOT_SIZE int32
	| DOT_PACK int32
	| exportDeclaration
	| languageDeclaration
	| overrideDeclaration
	;

overrideDeclaration: DOT_OVERRIDE^ typeSpec DOUBLE_COLON methodName WITH callConv type typeSpec DOUBLE_COLON methodName LPAREN! signatureArguments RPAREN!
	;


//=== FIELD ===

fieldDeclaration!: DOT_FIELD o:offsetOpt f:fieldAttributs t:type i:id a:atOpt n:initOpt
						{ #fieldDeclaration = #([FIELD_NODE, "FIELD_NODE"], #i, #t, #f, #a, #n, #o); }
	;

offsetOpt: (LBRACK int32 RBRACK)?
	;

atOpt: (AT id)?
	;

initOpt: (EQUAL fieldInit)?
	;

fieldInit
{ string str = null; }
 	: FLOAT32 LPAREN (float64 | int64) RPAREN
	| FLOAT64 LPAREN (float64 | int64) RPAREN
	| INT64 LPAREN int64 RPAREN
	| INT32 LPAREN int64 RPAREN
	| INT16 LPAREN int64 RPAREN
	| CHAR LPAREN int64 RPAREN
	| INT8 LPAREN int64 RPAREN
	| BOOL LPAREN truefalse RPAREN
	| compQString
	| BYTEARRAY LPAREN str = bytes RPAREN
	| NULLREF
	;

fieldAttributs: (fieldAttribut)*
						{ #fieldAttributs = #([ATTRIBUTLIST_NODE, "ATTRIBUTLIST_NODE"], #fieldAttributs); }
	;

fieldAttribut: (PUBLIC
	| PRIVATE
	| SPECIALNAME
	| RTSPECIALNAME
	| LITERAL
	| STATIC
	| FAMILY
	| INITONLY
	| ASSEMBLY
	| FAMANDASSEM
	| FAMORASSEM
	| PRIVATESCOPE
	| NOTSERIALIZED
	| MARSHAL LPAREN nativeType RPAREN
	)
	;


//=== DATA ===

dataDeclaration!: (dataHead LCURLY) => h:dataHead LCURLY b:dataItemList RCURLY
						{ #dataDeclaration = #([DATA_NODE, "DATA_NODE"], #h, #b); }
	| h2:dataHead b2:dataItem
						{ #dataDeclaration = #([DATA_NODE, "DATA_NODE"], #h2, #b2); }
	;

dataHead: DOT_DATA^ id EQUAL!
	| DOT_DATA^ TLS! id EQUAL!
	
	// should be: DOT_DATA (TLS)? (id)? EQUAL
	;

dataItemList: dataItem (COMMA dataItem)*
	;

dataItemCount: (LBRACK int32 RBRACK)?
	;

dataItem
{ string str = null; }
	: CHAR STAR LPAREN compQString RPAREN
	| REF LPAREN id RPAREN
	| BYTEARRAY LPAREN str = bytes RPAREN
	| (FLOAT32|FLOAT64) LPAREN float64 RPAREN dataItemCount
	| INT64 LPAREN int64 RPAREN dataItemCount
	| INT32 LPAREN int32 RPAREN dataItemCount
	| INT16 LPAREN int32 RPAREN dataItemCount
	| INT8 LPAREN int32 RPAREN dataItemCount
	| FLOAT64 dataItemCount
	| FLOAT32 dataItemCount
	| INT64 dataItemCount
	| INT32 dataItemCount
	| INT16 dataItemCount
	| INT8 dataItemCount
	;


//=== EVENT ===

eventDeclaration!: h:eventHead LCURLY b:eventBodyDeclarations RCURLY
						{ #eventDeclaration = #([EVENT_NODE, "EVENT_NODE"], #h, #b); }
	;

eventHead!
	: DOT_EVENT attrs:eventAttributs (t:typeSpec)? i:id
						{ #eventHead = #(#DOT_EVENT, #i, #t, #attrs); }
	;

eventAttributs: (eventAttribut)*
						{ #eventAttributs = #([ATTRIBUTLIST_NODE, "ATTRIBUTLIST_NODE"], #eventAttributs); }
	;

eventAttribut: SPECIALNAME
	| RTSPECIALNAME
	;

eventBodyDeclarations: (eventBodyDeclaration)*
						{ #eventBodyDeclarations = #([BLOCK_NODE, "BLOCK_NODE"], #eventBodyDeclarations); }
	;

eventBodyDeclaration: eventAddOn
	| eventRemoveOn
	| eventFire
	| eventOther
	| customAttributDeclaration
	| languageDeclaration
	| extSourceSpec
	;

eventAddOn: DOT_ADDON^ eventMethod
	;

eventRemoveOn: DOT_REMOVEON^ eventMethod
	;

eventFire: DOT_FIRE^ eventMethod
	;

eventOther: DOT_OTHER^ eventMethod
	;

eventMethod: (callConv type typeSpec DOUBLE_COLON) => callConv type typeSpec DOUBLE_COLON methodName LPAREN! signatureArguments RPAREN!
	| callConv type methodName LPAREN! signatureArguments RPAREN!
	;


//=== PROPERTY ===

propertyDeclaration!: h:propertyHead LCURLY b:propertyBodyDeclarations RCURLY
						{ #propertyDeclaration = #([PROP_NODE, "PROP_NODE"], #h, #b); }
	;

propertyHead!
	: DOT_PROPERTY attrs:propAttributs callConv t:type i:id LPAREN sig:signatureArguments RPAREN init:initOpt
						{ #propertyHead = #(#DOT_PROPERTY, #i, #t, #attrs, #sig, #init); }
	;

propAttributs: (propAttribut)*
						{ #propAttributs = #([ATTRIBUTLIST_NODE, "ATTRIBUTLIST_NODE"], #propAttributs); }
	;

propAttribut: SPECIALNAME
	| RTSPECIALNAME
	;

propertyBodyDeclarations: (propertyBodyDeclaration)*
						{ #propertyBodyDeclarations = #([BLOCK_NODE, "BLOCK_NODE"], #propertyBodyDeclarations); }
	;

propertyBodyDeclaration: propSet
	| propGet
	| propOther
	| customAttributDeclaration
	| languageDeclaration
	| extSourceSpec
	;

propGet: DOT_GET^ propMethod
	;

propSet: DOT_SET^ propMethod
	;

propOther: DOT_OTHER^ propMethod
	;

propMethod: (callConv type typeSpec DOUBLE_COLON) => callConv type typeSpec DOUBLE_COLON methodName LPAREN! signatureArguments RPAREN!
	| callConv type methodName LPAREN! signatureArguments RPAREN!
	;


//=== METHOD ===

methodDeclaration!: h:methodHead LCURLY b:methodBodyDeclarations RCURLY
						{ #methodDeclaration = #([METHOD_NODE, "METHOD_NODE"], h, b); }
	;

methodHead!
	: DOT_METHOD attrs:methodAttributs callConv paramAttributs t:type (MARSHAL LPAREN nativeType RPAREN)? name:methodName
	LPAREN sig:signatureArguments RPAREN i:implAttributs
						{ #methodHead = #(#DOT_METHOD, #name, #t, #sig, #attrs, #i); }
	;

methodAttributs: (methodAttribut)*
						{ #methodAttributs = #([ATTRIBUTLIST_NODE, "ATTRIBUTLIST_NODE"], #methodAttributs); }
	;

methodAttribut: (STATIC
	| PUBLIC
	| PRIVATE
	| FAMILY
	| FINAL
	| SPECIALNAME
	| VIRTUAL
	| ABSTRACT
	| ASSEMBLY
	| FAMANDASSEM
	| FAMORASSEM
	| PRIVATESCOPE
	| HIDEBYSIG
	| NEWSLOT
	| RTSPECIALNAME
	| UNMANAGEDEXP
	| REQSECOBJ
	| STRICT
	| pinvokeMethodAttribut)
	;

pinvokeMethodAttribut: (PINVOKEIMPL LPAREN compQString AS) => PINVOKEIMPL^ LPAREN! compQString AS compQString pinvokeAttributs RPAREN!
	| (PINVOKEIMPL LPAREN compQString) => PINVOKEIMPL^ LPAREN! compQString pinvokeAttributs RPAREN!
	| PINVOKEIMPL^ LPAREN! pinvokeAttributs RPAREN!
	;

pinvokeAttributs: (pinvokeAttribut)*
						{ #pinvokeAttributs = #([ATTRIBUTLIST_NODE, "ATTRIBUTLIST_NODE"], #pinvokeAttributs); }
	;

pinvokeAttribut: NOMANGLE
	| ANSI
	| UNICODE
	| AUTOCHAR
	| LASTERR
	| WINAPI
	| CDECL
	| STDCALL
	| THISCALL
	| FASTCALL
	;

implAttributs: (implAttribut)*
						{ #implAttributs = #([ATTRIBUTLIST_NODE, "ATTRIBUTLIST_NODE"], #implAttributs); }
	;

implAttribut: (NATIVE
	| CIL
	| OPTIL
	| MANAGED
	| UNMANAGED
	| FORWARDREF
	| PRESERVESIG
	| RUNTIME
	| INTERNALCALL
	| SYNCHRONIZED
	| NOINLINING)
	;

paramAttributs: (paramAttribut)*
						{ #paramAttributs = #([ATTRIBUTLIST_NODE, "ATTRIBUTLIST_NODE"], #paramAttributs); }
	;

paramAttribut: (LBRACK! IN RBRACK!
	| LBRACK! OUT RBRACK!
	| LBRACK! OPT RBRACK!
	| LBRACK! int32 RBRACK!)
	;

signatureArguments: (signatureArgumentList)?
						{ #signatureArguments = #([SIG_ARGS_NODE, "SIG_ARGS_NODE"], #signatureArguments); }
	;

signatureArgumentList: signatureArgument (COMMA! signatureArgument)*
	;

signatureArgument: (TRIPLE_DOT
	| (paramAttributs type MARSHAL) => paramAttributs type MARSHAL LPAREN! nativeType RPAREN! (id)?
	| (paramAttributs type id) => paramAttributs type id
	| paramAttributs type)
						{ #signatureArgument = #([ARGUMENT_NODE, "ARGUMENT_NODE"], #signatureArgument); }
	;

methodName: name
	| DOT_CTOR
	| DOT_CCTOR
	;

methodBodyDeclarations: (methodBodyDeclaration)*
					{ #methodBodyDeclarations = #([BLOCK_NODE, "BLOCK_NODE"], #methodBodyDeclarations); }
	;

methodBodyDeclaration: DOT_EMITBYTE int32
	| sehBlock
	| maxStackDeclaration
	| localsDeclaration
	| DOT_ENTRYPOINT
	| languageDeclaration
	| dataDeclaration
	| codeLabelDeclaration
	| customAttributDeclaration
	| instr
	| DOT_ZEROINIT
	| securityDeclaration
	| extSourceSpec
	| DOT_VTENTRY^ int32 COLON! int32
	| DOT_OVERRIDE^ typeSpec DOUBLE_COLON methodName
	| scopeBlock
	| DOT_PARAM^ LBRACK! int32 RBRACK! initOpt
	| DOT_EXPORT^ LBRACK! int32 RBRACK! (AS id)?
	;

maxStackDeclaration: DOT_MAXSTACK^ int32
	;

localsDeclaration: DOT_LOCALS^ (INIT)? LPAREN! signatureArguments RPAREN!
	;

codeLabelDeclaration!: ID COLON			{ #codeLabelDeclaration = #([CODELABEL_NODE, "CODELABEL_NODE"], #ID); }
	;

scopeBlock!: LCURLY decls:methodBodyDeclarations RCURLY
						{ #scopeBlock = #([BLOCK_NODE, "BLOCK_NODE"], #decls); }
	;

sehBlock!: t:tryBlock s:sehClauses
						{ #sehBlock = #([SEHBLOCK_NODE, "SEHBLOCK_NODE"], #t, #s); }
	;

sehClauses: (sehClause)+
	;

tryBlock: DOT_TRY^ scopeBlock
	| DOT_TRY^ id TO! id
	| DOT_TRY^ int32 TO! int32
	;

sehClause: catchClause handlerBlock
	| filterClause handlerBlock
	| finallyClause handlerBlock
	| faultClause handlerBlock
	;

filterClause: FILTER^ scopeBlock
	| FILTER^ id
	| FILTER^ int32
	;

catchClause: CATCH^ className
	;

finallyClause: FINALLY
	;

faultClause: FAULT
	;

handlerBlock: scopeBlock
	| HANDLER^ id TO! id
	| HANDLER^ int32 TO! int32
	;

// type declaration
type: typeRoot typePostFix
	;

typeRoot: CLASS className
	| OBJECT
	| STRING
	| VALUE CLASS className
	| VALUETYPE className
	| EXCLAM int32
	//| METHOD callConv type STAR LPAREN signatureArguments RPAREN   // TODO
	| TYPEDREF
	| CHAR
	| VOID
	| BOOL
	| INT8
	| INT16
	| INT32
	| INT64
	| FLOAT32
	| FLOAT64
	| UNSIGNED INT8
	| UNSIGNED INT16
	| UNSIGNED INT32
	| UNSIGNED INT64
	| NATIVE INT
	| NATIVE UNSIGNED INT
	| NATIVE FLOAT
	;

typePostFix: (REF
	| STAR
	| PINNED
	| MODREQ LPAREN className RPAREN
	| MODOPT LPAREN className RPAREN
	| arrayPostFix)*
	;

arrayPostFix: LBRACK bounds RBRACK
	;

bounds: // EMPTY
	| bound (COMMA bound)*
	;

bound:  TRIPLE_DOT
	| int32
	| (int32 TRIPLE_DOT int32) => (int32 TRIPLE_DOT int32)
	| int32 TRIPLE_DOT
	;

ownerType : typeSpec
	| memberRef
	;

memberRef : (METHOD callConv type typeSpec DOUBLE_COLON) => METHOD callConv type typeSpec DOUBLE_COLON methodName LPAREN signatureArguments RPAREN
	| METHOD callConv type methodName LPAREN signatureArguments RPAREN
	| (FIELD type typeSpec DOUBLE_COLON) => FIELD type typeSpec DOUBLE_COLON id
	| FIELD type id
	;

nativeType: nativeTypeRoot nativeTypePostFix
	;

nativeTypeRoot: // EMPTY
	| CUSTOM LPAREN ( compQString (COMMA compQString)* ) RPAREN
	| FIXED SYSSTRING LBRACK int32 RBRACK
	| FIXED ARRAY LBRACK int32 RBRACK
	| VARIANT
	| CURRENCY
	| SYSCHAR
	| VOID
	| BOOL
	| INT8
	| INT16
	| INT32
	| INT64
	| FLOAT32
	| FLOAT64
	| ERROR
	| UNSIGNED INT8
	| UNSIGNED INT16
	| UNSIGNED INT32
	| UNSIGNED INT64
	| DECIMAL
	| DATE
	| BSTR
	| LPSTR
	| LPWSTR
	| LPTSTR
	| OBJECTREF
	| IUNKNOWN
	| IDISPATCH
	| STRUCT
	| INTERFACE
	| (SAFEARRAY variantType COMMA) => SAFEARRAY variantType COMMA compQString
	| SAFEARRAY variantType
	| INT
	| UNSIGNED INT
	| NESTED STRUCT
	| BYVALSTR
	| ANSI BSTR
	| TBSTR
	| VARIANT BOOL
	| METHOD
	| AS ANY
	| LPSTRUCT
	;

nativeTypePostFix: (STAR
	| LBRACK RBRACK
	| (LBRACK int32 PLUS) => LBRACK int32 PLUS int32 RBRACK
	| LBRACK int32 RBRACK
	| LBRACK PLUS int32 RBRACK)*
	;

variantType: variantTypeRoot variantTypePostFix
	;

variantTypeRoot: NULL
	| VARIANT
	| CURRENCY
	| VOID
	| BOOL
	| INT8
	| INT16
	| INT32
	| INT64
	| FLOAT32
	| FLOAT64
	| UNSIGNED INT8
	| UNSIGNED INT16
	| UNSIGNED INT32
	| UNSIGNED INT64
	| STAR
	| DECIMAL
	| DATE
	| BSTR
	| LPSTR
	| LPWSTR
	| IUNKNOWN
	| IDISPATCH
	| SAFEARRAY
	| INT
	| UNSIGNED INT
	| ERROR
	| HRESULT
	| CARRAY
	| USERDEFINED
	| RECORD
	| FILETIME
	| BLOB
	| STREAM
	| STORAGE
	| STREAMED_OBJECT
	| BLOB_OBJECT
	| CF
	| CLSID
	;

variantTypePostFix: (LBRACK RBRACK
	| REF
	| VECTOR)*
	;

typeSpec : className
	| type
	;

callConv: (INSTANCE (EXPLICIT)? callKind)?
	;

callKind : (DEFAULT
	| VARARG
	| UNMANAGED (	CDECL
			| STDCALL
			| THISCALL
			| FASTCALL)
	)?
	;

// instruction
instr
{ string str = null; }
	: (instr_none
	| instr_var (int32 | id)
	| instr_i int32
	| instr_i8 int64
	| instr_r float64
	| instr_r int64
	| instr_r LPAREN str = bytes RPAREN
	| instr_brtarget int32
	| instr_brtarget id
	| (instr_method callConv type typeSpec DOUBLE_COLON) => instr_method callConv type typeSpec DOUBLE_COLON methodName LPAREN signatureArguments RPAREN
	| instr_method callConv type methodName LPAREN signatureArguments RPAREN
	| (instr_field type typeSpec) => instr_field type typeSpec DOUBLE_COLON id
	| instr_field type id
	| instr_type typeSpec
	| instr_string compQString
	| instr_string BYTEARRAY LPAREN str = bytes RPAREN
	| instr_sig callConv type LPAREN signatureArguments RPAREN
	| instr_tok ownerType
	| instr_switch LPAREN labels RPAREN)
					
					{ #instr = #([INSTR_NODE, "INSTR_NODE"], #instr); }
	;

// switch labels
labels : // EMPTY
	| (id|int32) (COMMA (id|int32))*
	;

// instruction list
instr_none : ADD | ADD_OVF | ADD_OVF_UN | AND
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

instr_var: LDARG
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

instr_i : LDC_I4
	| LDC_I4_S
	| UNALIGNED_
	;

instr_i8 : LDC_I8
	;

instr_r : LDC_R4 | LDC_R8
	;

instr_brtarget : BEQ | BEQ_S | BGE | BGE_S
	| BGE_UN | BGE_UN_S | BGT | BGT_S | BGT_UN | BGT_UN_S
	| BLE | BLE_S | BLE_UN | BLE_UN_S | BLT | BLT_S
	| BLT_UN | BLT_UN_S | BNE_UN | BNE_UN_S | BR | BR_S
	| BRFALSE | BRFALSE_S | BRTRUE | BRTRUE_S | LEAVE | LEAVE_S
	;

instr_method : CALL | CALLVIRT | JMP | LDFTN | LDVIRTFTN | NEWOBJ
	;

instr_field : LDFLD | LDFLDA | LDSFLD | LDSFLDA | STFLD | STSFLD
	;

instr_type :
	BOX | CASTCLASS | CPOBJ | INITOBJ | ISINST |
	LDELEMA | LDOBJ | MKREFANY | NEWARR | REFANYVAL |
	SIZEOF | STOBJ | UNBOX
	;

instr_string : LDSTR ;

instr_sig : CALLI ;

instr_tok : LDTOKEN ;

instr_switch : SWITCH ;


// base types
id: ID
	| SQSTRING
	;

// dotted name (id . id . id...)
name!
{ string str = null; }
	: n:id  { str = #n.getText(); } (DOT m:id { str = str + "." + #m.getText(); } )*	{ #name = #[ID, str]; }
	;

compQString!
{ string str = null; }
	: a:DQSTRING { str = a.getText(); } (PLUS^ b:DQSTRING { str = str + b.getText(); } )*	{ #compQString = #[DQSTRING, str]; }
	;

className : (LBRACK DOT_MODULE) => LBRACK DOT_MODULE name RBRACK slashedName
	| (LBRACK name) => LBRACK name RBRACK slashedName
	| slashedName
	;

classNames: className (COMMA! className)*
	;

slashedName: name (SLASH^ name)*
	;

int32: INTEGER_LITERAL
	;

int64: INTEGER_LITERAL
	;

float64: FLOAT_LITERAL
	| FLOAT32 LPAREN int32 RPAREN
	| FLOAT64 LPAREN int64 RPAREN
	;

truefalse : TRUE
	| FALSE
	;

bytes returns[string str]
	{ string tmp; str = ""; Token last_token = null;}
	: ( tmp = hex_byte {str += tmp; } )*
	  {
	  	// check length
	  	if ((str.Length%2) != 0) throw new RecognitionException("Hex bytes sequence must be an even length", getFilename(), last_token.getLine(), last_token.getColumn());

	  }
	;

hex_byte returns[string str]
{str=""; } :
	(a:ID 				{ str = a.getText();}
	|b:HEX_BYTE 		{ str = b.getText();}
	|c:INTEGER_LITERAL 	{ str = c.getText();} )
	;
