tree grammar CilTransformer;

options {
  output       = AST;
  tokenVocab   = CIL;
  ASTLabelType = CommonTree;
}

@header 
{
  package transformation.cil;
}

DUPA : 'dupa' ;

start: decls -> ^(DUPA DUPA) ;
