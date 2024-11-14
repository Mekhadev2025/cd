%{
#include<stdio.h>
#include<stdlib.h>

int  yylex();
void yyerror(const char* s);
int valid=1;
%}

%token SELECT COL COMMA FROM TABLENAME WHERE OP VALUE SEMICOLON


%%

start : SELECT COL FROM TABLENAME WHERE COL OP VALUE SEMICOLON;



void yyerror(const char* s){
    printf("Syntax error :%s",s);
    valid =0;}
%%    
int main(){
    printf("Enter the syntax");
    
    yyparse();
   if(valid){
        printf("The syntax is valid");
        }
   return 0;}
    
