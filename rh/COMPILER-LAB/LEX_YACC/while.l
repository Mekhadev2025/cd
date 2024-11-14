%{
#include "y.tab.h"
%}

%%

"while"    return WHILE;
"("        return LPAREN;
")"        return RPAREN;
"{"        return LBRACE;
"}"        return RBRACE;
[ \t\n]+   /* ignore whitespace */;
[a-zA-Z_][a-zA-Z0-9_]* return IDENTIFIER;
[0-9]+     return NUMBER;
"<"        return LT;
"<="       return LE;
">"        return GT;
">="       return GE;
"=="       return EQ;
"!="       return NE;
";"        return SEMICOLON;
.          return yytext[0];

%%

int yywrap() {
    return 1;
}

