%{
#include "y.tab.h"
%}

%%

"for"              return FOR;
"("                return LPAREN;
")"                return RPAREN;
"="                return EQ;
"<"                return LT;
">"                return GT;
[a-zA-Z][a-zA-Z0-9]* return ID;
"<="               return LTE;
">="               return GTE;
"!="               return NEQ;
[0-9]+             return NUM;
"+"                return PLUS;
"++"               return PLUSPLUS;
";"                return SEMICOLON;
","                return COMMA;
[ \t\n]            ;
.                  return yytext[0];

%%

int yywrap(){


  return 1;}
  
