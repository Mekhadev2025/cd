%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
%}
%token WHILE LPAREN RPAREN LBRACE RBRACE NUMBER IDENTIFIER SEMICOLON LT GT LE GE EQ NE

%%

start: statements;
statements: WHILE LPAREN condition RPAREN LBRACE statement RBRACE;
condition: IDENTIFIER comp NUMBER;
comp: LT|GT|LE|GE|EQ|NE;
statement:statements| assign;
assign: IDENTIFIER '=' NUMBER SEMICOLON;
 
         

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter a 'while' loop for syntax validation:\n");
    if (yyparse() == 0) {
        printf("Syntax is valid.\n");
    } else {
        printf("Syntax error detected.\n");
    }
    return 0;
}
