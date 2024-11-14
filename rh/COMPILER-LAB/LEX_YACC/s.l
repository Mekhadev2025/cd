%{
  #include "y.tab.h"
%}

%%
"select"         return SELECT;
"from"           return FROM;
"where"          return WHERE;
[a-zA-Z][a-zA-Z]*  return COL;
[0-9]+             return NUM;
"\""[a-zA-Z0-9]+"\""  return STRING;    
"="                return OP;
","                return COMMA;
";"                return SEMICOLON;
[ \t\n]            ;
.                  return yytext[0];





%%

int yywrap(){

  return 1;}
