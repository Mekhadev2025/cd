%{
#include<ctype.h>
#include<string.h>
#include<stdlib.h>
int tmp=0;
void yyerror();
int yylex();

%}
%token num
%left '+' '-'
%left '*''/'


%%
line:exp {printf("=\n%d",$$);return 0};
exp:exp'+'exp {$$=$1+$3;}
   |exp '-'exp {$$=$1-$3;}
   |exp'*'exp {$$=$1*$3;}
   |exp'/'exp {$$=$1/$3;}
   |'('exp')'  {$$=$2;}
   |num {$$=$1;};
   
%%

void yyerror(){
  
   printf("Incorrect");
   tmp=1;}
  

int main(){
   printf("ENter expression\n;");
   yyparse();
   return 0;}

