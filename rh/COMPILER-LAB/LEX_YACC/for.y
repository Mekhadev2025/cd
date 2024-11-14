%{
#include<stdio.h>
#include<stdlib.h>
int valid=1;
int yylex();
void yyerror(const char*s);

%}
%token FOR LPAREN RPAREN COMMA ID EQ LT GT LTE GTE NEQ  NUM SEMICOLON  PLUSPLUS PLUS

%%
 start: FOR LPAREN assign SEMICOLON condition SEMICOLON increment RPAREN;
 assign:ID EQ NUM COMMA assign|ID EQ NUM;
 condition:ID LT NUM| ID GT NUM | ID NEQ NUM|ID LTE NUM | ID  GTE NUM;
 increment: ID PLUSPLUS | ID PLUS NUM|PLUSPLUS ID;
 



%%
 void yyerror(const char*s){
    
       printf("Syntax error %s",s);
       
       valid=0;
}
int main(){
printf("Enter the syntax of for statement :");
yyparse();
if(valid){
    printf("\n Correct syntax");
    }
return 0;
}
