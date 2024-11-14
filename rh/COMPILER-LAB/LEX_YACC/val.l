
%{
#include"y.tab.h"
%}

%%
 
[a-zA-Z][a-zA-z0-9]*      return NUM;
[\n]                  return 0;
.                          return yytext[0];

%%

int yywrap(){
   return 1;}
