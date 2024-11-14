
%option noinput nounput noyywrap
%{
#include<string.h>
#include<stdlib.h>
#include "y.tab.h"

extern int yylval;
%}

%%
[\t]        ;
[\n]        return 0;


[0-9]+      {yylval=atoi(yytext);
             return num;}
.            return yytext[0];

%%
