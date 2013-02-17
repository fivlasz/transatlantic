tree grammar CILTransformer;

options {
  output       = AST;
  tokenVocab   = CIL;
  ASTLabelType = CommonTree;
  // filter       = true; // required if you want to traverse only a part of a tree
  rewrite      = true; // rewrites a tree
}

tokens {
DUPA;
}
// first I need to transform the CIL grammar to proper AST form
top: '.class' 'auto' 'ansi' DOTTEDNAME -> ^(DUPA["dupa1"] DUPA["dupa2"]) ;
