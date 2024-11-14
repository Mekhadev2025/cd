%{
#include<stdio.h>
#include<stdlib.h>

int valid=1;
int yylex();
void yyerror(const char* s);
%}

%token SELECT COL FROM WHERE OP COMMA  NUM STRING SEMICOLON
%%
start: SELECT COL cols FROM COL option;
option: WHERE condition SEMICOLON|SEMICOLON;
condition: COL OP value;
value : NUM|STRING;
cols: COL COMMA COL|cols|;











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
