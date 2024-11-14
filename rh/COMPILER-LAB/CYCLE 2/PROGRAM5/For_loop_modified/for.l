%{
#include "y.tab.h"
%}
%%

"for"                       return FOR;        // Match the 'for' keyword
"("                         return LPAREN;     // Match '('
")"                         return RPAREN;     // Match ')'
";"                         return SEMICOLON;  // Match ';'
"="                         return ASSIGNMENT; // Match '='
"++"                        return PLUSPLUS;   // Match '++'
"<"                         return LT;         // Match '<'
">"                         return GT;         // Match '>'

[a-zA-Z][a-zA-Z0-9]*        return ID;         // Match an identifier
[0-9]+                      return NUM;        // Match a number

[ \t\n]                     ;  // Ignore whitespace
.                            return yytext[0]; // Match any other character

%%

int yywrap() {
    return 1;
}
