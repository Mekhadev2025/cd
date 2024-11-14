%{
#include<stdio.h>
#include<stdlib.h>

int valid=1;
int yylex();
void yyerror(const char* s);
%}

%token SELECT COL FROM  WHERE  VALUE COMMA OP SEMICOLON

%%

start: SELECT cols FROM COL x;
x: WHERE condition SEMICOLON|SEMICOLON;
condition: COL OP VALUE;
cols: COL|COL COMMA cols;


%%

void yyerror(const char*s){
    printf("\nSyntax error %s",s);
    
    valid=0;} 

int main(){

  printf("\n Enter the string to be checked :");
  yyparse();
  if(valid){
  
     printf("\nCorrect ");
     }
  return 0;
  
}

