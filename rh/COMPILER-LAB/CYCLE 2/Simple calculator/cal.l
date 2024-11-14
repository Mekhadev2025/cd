%option noinput nounput noyywrap
%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
extern int yylval;
%}


%%


[\t]      ;
[\n]      return 0;


[0-9]+    { yylval = atoi(yytext);
            return num;
          }
.         return yytext[0];
%%
