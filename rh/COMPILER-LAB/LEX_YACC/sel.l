%{
  #include "y.tab.h"
%}

%%
"from"                  return FROM;
"select"             return SELECT;
"where"              return WHERE;
[a-zA-z][a-zA-z]*    return COL;

[a-zA-Z0-9]+               return VALUE;

"="                   return OP; 

";"                  return SEMICOLON;
","                  return COMMA;
[ \t\n]              ;
"."                  return yytext[0];

%%

int yywrap(){

  return 1;}
