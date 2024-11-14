%{
#include "y.tab.h"
%}


%%
select           return SELECT;
[a-zA-z][a-zA-Z]*  return COL;
from               return FROM;
[a-zA-z][a-zA-Z]*  return TABLENAME;
,                   return COMMA;
;                   return SEMICOLON;
[0-9]               return VALUE;
<|>|<=|>=|=|!=      return OP;
.                   return yytext[0];



%%

int yyrap(){
  return 1;}
