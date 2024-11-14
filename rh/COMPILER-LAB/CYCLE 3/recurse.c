//-/ div don't work
#include<stdio.h>

#include<string.h>

#include<ctype.h>

char input[10];
int i, error;
void E();
void T();
void Eprime();
void Tprime();
void F();
void main() {
  i = 0;
  error = 0;
  printf("Enter an arithmetic expression : ");
  gets(input);
  E();
  if (strlen(input) == i && error == 0)
    printf("\nAccepted..!!!\n");
  else printf("\nRejected..!!!\n");
}

void E() {
  T();
  Eprime();
}
void Eprime() {
  if (input[i] == '+') {
    i++;
    T();
    Eprime();
  }
}
void T() {
  F();
  Tprime();
}
void Tprime() {
  if (input[i] == '*') {
    i++;
    F();
    Tprime();
  }
}
void F() {
  if (isalnum(input[i])) i++;
  else if (input[i] == '(') {
    i++;
    E();
    if (input[i] == ')')
      i++;
    else error = 1;
  } else error = 1;
}
/*OUTPUT
mec@cc-2-4:~/RheaCS7A/CYCLE 3$ gcc recurse.c
recurse.c: In function ‘main’:
recurse.c:18:3: warning: implicit declaration of function ‘gets’ [-Wimplicit-function-declaration]
   gets(input);
   ^~~~
/tmp/cc1GjD5p.o: In function `main':
recurse.c:(.text+0x36): warning: the `gets' function is dangerous and should not be used.
mec@cc-2-4:~/RheaCS7A/CYCLE 3$ ./a.out
Enter an arithmetic expression : i+(i*a)

Accepted..!!!
mec@cc-2-4:~/RheaCS7A/CYCLE 3$ ./a.out
Enter an arithmetic expression : i+*a

Rejected..!!!
mec@cc-2-4:~/RheaCS7A/CYCLE 3$ ./a.out
Enter an arithmetic expression : i+a

Accepted..!!!
mec@cc-2-4:~/RheaCS7A/CYCLE 3$ ./a.out
Enter an arithmetic expression : i-a

Rejected..!!!
*/
