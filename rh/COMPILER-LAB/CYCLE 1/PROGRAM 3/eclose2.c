#include<stdio.h>
#include<stdlib.h>
struct node{
   int st;
    struct node* link;
 }
 
 void findclosure(int,int);
 void insert(int,char,int);
 int findalpha(char);
 void print(int);
 
 
 static int set[20],nostate,s,noaplha,notransition,r,c,buffer[20];
 char aplhabet[20];
 static int e_closure[20][20]={0};
 struct node* transition[20][20]={NULL}
 
 
 void main(){
   int i,j,k,m,t,n;
   struct node* temp;
   printf("\nEnter the no of alphabets ? \n");
   scanf("%d",&noalpha);
   for(i=0;i<noalpha;i++){
          alphabet[i]=getchar();
          getchar();}
   
   printf("Enter no of states );
    scanf("%d",&nostate);
    printf("Enter transitions");
     for(i=1;i<notransition;i++){
            scanf("%d %c%d",&r,&c,&s);}
            
            for(i=1;i<nostate;i++){
                  c=0;
                  for(j=0;j<20;j++){
                        buffer[j]=0;
                        e_closure[i][j]=0;
                        }
                        findclosure9i,i);
                        printf("Closure of q %d",i);
                        print_e_closure(i);}}
            
    
