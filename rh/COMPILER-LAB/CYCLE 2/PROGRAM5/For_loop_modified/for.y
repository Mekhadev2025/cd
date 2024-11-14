%{
    #include <stdio.h>
    #include<stdlib.h>
    int yylex();  // Lexical analyzer function
    void yyerror(const char *s);  // Error handling function
    int valid = 1;  // Flag to check validity of the for loop syntax
%}

%token FOR LPAREN RPAREN SEMICOLON ID ASSIGNMENT NUM LT GT PLUS PLUSPLUS

%%

start : for_loop
      ;

for_loop : FOR LPAREN expr SEMICOLON condition SEMICOLON increment RPAREN
         ;

expr : ID ASSIGNMENT NUM
     ;

condition : ID LT NUM
          | ID GT NUM
          ;

increment : ID PLUSPLUS
          | PLUSPLUS ID
          | ID PLUS NUM
          ;

%%

void yyerror(const char *s) {
    printf("Syntax error: %s\n", s);  // Print error message passed from Yacc
    valid = 0;  // Mark as invalid if an error occurs
}

int main() {
    printf("Enter a for loop to be checked for syntax correctness:\n");
    yyparse();  // Start parsing the input
    if (valid) {
        printf("The for loop syntax is valid!\n");
    }
    return 0;
}
