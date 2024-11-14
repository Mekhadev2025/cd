//Recurse 3rd program 
#include <stdio.h>
#include <string.h>
#include <ctype.h>

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
  printf("Enter an arithmetic expression: ");
  gets(input);
  E();
  if (strlen(input) == i && error == 0)
    printf("\nAccepted..!!!\n");
  else
    printf("\nRejected..!!!\n");
}

void E() {
  T();       // Process a term
  Eprime();  // Check for + or - operators
}

void Eprime() {
  if (input[i] == '+' || input[i] == '-') {  // Accept + or -
    i++;
    T();
    Eprime();
  }
}

void T() {
  F();       // Process a factor
  Tprime();  // Check for * or / operators
}

void Tprime() {
  if (input[i] == '*' || input[i] == '/') {  // Accept * or /
    i++;
    F();
    Tprime();
  }
}

void F() {
  if (isalnum(input[i])) {  // Recognize a number or variable (id)
    i++;
  } else if (input[i] == '(') {  // Recognize parentheses
    i++;
    E();
    if (input[i] == ')')
      i++;
    else
      error = 1;  // Missing closing parenthesis
  } else {
    error = 1;  // Invalid character
  }
}
/*OUTPUT
mec@cc-2-4:~/RheaCS7A/CYCLE 3$ gcc recurse2.c
recurse2.c: In function ‘main’:
recurse2.c:18:3: warning: implicit declaration of function ‘gets’ [-Wimplicit-function-declaration]
   gets(input);
   ^~~~
/tmp/cc58Plix.o: In function `main':
recurse2.c:(.text+0x36): warning: the `gets' function is dangerous and should not be used.
mec@cc-2-4:~/RheaCS7A/CYCLE 3$ ./a.out
Enter an arithmetic expression: a-b

Accepted..!!!
mec@cc-2-4:~/RheaCS7A/CYCLE 3$ a+(b-c)
bash: a+(b-c): command not found
mec@cc-2-4:~/RheaCS7A/CYCLE 3$ ./a.out
Enter an arithmetic expression: a+(b-c)

Accepted..!!!
*/
