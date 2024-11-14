%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror();
int flag=0;
%}
%token NUM

%%
start: NUM;

%%

void yyerror(){
    printf("\nError");
    flag=1;}
    
int main(){

    printf("\nNeter identifier::");
    yyparse();
    if(!flag){
        printf("\nEntered identifier is valid ");
        }
    else{
         printf("\nInvalid");
         }
    return 0;}
