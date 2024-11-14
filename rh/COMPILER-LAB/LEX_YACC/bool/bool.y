%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token TRUE FALSE
%left AND OR
%left NOT

%%

// Grammar rules
expression:
    expression OR expression  { $$ = $1 || $3; }
    | expression AND expression { $$ = $1 && $3; }
    | NOT expression            { $$ = !$2; }
    | TRUE                      { $$ = 1; }
    | FALSE                     { $$ = 0; }
    | '(' expression ')'        { $$ = $2; }
    ;

%%

// Error handling function
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter a Boolean expression:\n");
    int result = yyparse();  // Start parsing
    if (result == 0) {
        printf("Expression evaluated successfully.\n");
        printf("Result: %d\n", $$);

    } else {
        printf("Expression evaluation failed.\n");
    }
}

