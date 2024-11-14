%{
#include<stdio.h>
int lc=0,sc=0,tc=0,ch=0,wc=0;

%}

/* RULE Section*/

%%
[\n] { lc++; ch+=yyleng;}
[ ] { sc++; ch+=yyleng;}
[\t] { tc++; ch+=yyleng;}
[^\t\n ]+ {wc++;ch+=yyleng;}

%%

int yywrap(){
   return 1;
   }
int main(){

   printf("Enter the sentence :");
   yylex();
   printf("Number of lines :%d\n",lc);
   printf("Number of spaces :%d\n",sc);
   printf("Nuber of tabs spaces words chars %d,%d,%d\n",tc,wc,ch);
   
return 0;}

