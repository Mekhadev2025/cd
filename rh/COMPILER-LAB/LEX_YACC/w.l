%{
#include<stdio.h>
#include "y.tab.h"
%}
%%
"while"     return WHILE;
"("         return LPAREN;
")"         return RPAREN;
"{"         return LBRACE;
"}"         return RBRACE;
";"         return SEMICOLON;
[a-zA-Z_][a-zA-Z0-9_]*   return IDENTIFIER;
[0-9]+       return NUMBER;
"<"          return LT;
">"          return GT;
"<="         return LE;
">="         return GE;
"="          return EQ;
"!="         return NE;
.            rteturn yytext[0];

%% 

int yywrap(){
   return 1;}

