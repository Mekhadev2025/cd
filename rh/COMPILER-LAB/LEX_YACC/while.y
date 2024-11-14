%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
%}

%token WHILE LPAREN RPAREN LBRACE RBRACE IDENTIFIER NUMBER LT LE GT GE EQ NE SEMICOLON

%%

program:
    statement
    ;

statement:
    WHILE LPAREN condition RPAREN LBRACE statements RBRACE
    ;

condition:
    IDENTIFIER comparison_op IDENTIFIER
    | IDENTIFIER comparison_op NUMBER
    ;

comparison_op:
    LT | LE | GT | GE | EQ | NE
    ;

statements:
    assignment SEMICOLON statements
    | assignment SEMICOLON
    | /* empty */
    ;

assignment:
    IDENTIFIER '=' expression
    ;

expression:
    IDENTIFIER
    | NUMBER
    | IDENTIFIER '+' IDENTIFIER
    | IDENTIFIER '-' IDENTIFIER
    | IDENTIFIER '+' NUMBER
    | IDENTIFIER '-' NUMBER
    | NUMBER '+' IDENTIFIER
    | NUMBER '-' IDENTIFIER
    ;

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

