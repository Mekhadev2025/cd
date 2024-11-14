%{
#include <stdio.h>
#include <string.h>

char name[5];  // To hold the first four characters of the name
int ignore_flag = 0; // Flag to indicate if string should be ignored

void update_ignore_flag(char *input) {
    // Check if the input string contains the first four characters of the name
    if (strstr(input, name) != NULL) {
        ignore_flag = 1;
    } else {
        ignore_flag = 0;
    }
}
%}

%%
.*\n {
    // Check if the input line contains the first four characters of the name
    update_ignore_flag(yytext);
    if (!ignore_flag) {
        printf("Valid String: %s", yytext);
    }
}
%%

int main() {
    printf("Enter your name (at least 4 characters): ");
    scanf("%4s", name);  // Read the first four characters of the name
    printf("Ignoring strings that contain the substring: %s\n", name);
    yylex();  // Start processing input strings
    return 0;
}

/*
mec@cc-2-4:~/RheaCS7A/cycle 2$ flex sub2.l
mec@cc-2-4:~/RheaCS7A/cycle 2$ gcc -o example_pgm lex.yy.c -lfl
mec@cc-2-4:~/RheaCS7A/cycle 2$ ./example_pgm
Enter your name (at least 4 characters): Rhea
Ignoring strings that contain the substring: Rhea
Valid String: 
Heroo
Valid String: Heroo
Rhea
MaRhI
Valid String: MaRhI
MaRheaIpdpfe
lkpopp
Valid String: lkpopp
mec@cc-2-4:~/RheaCS7A/cycle 2$ 
mec@cc-2-4:~/RheaCS7A/cycle 2$ ./example_pgm
Enter your name (at least 4 characters): Samasya
Ignoring strings that contain the substring: Sama
Valid String: sya
mec@cc-2-4:~/RheaCS7A/cycle 2$ ./example_pgm
Enter your name (at least 4 characters): Ashley
Ignoring strings that contain the substring: Ashl
Valid String: ey
Kera
Valid String: Kera
Ashlop
Asjkfk
Valid String: Asjkfk
mec@cc-2-4:~/RheaCS7A/cycle 2$ 
mec@cc-2-4:~/RheaCS7A/cycle 2$ ./example_pgm
Enter your name (at least 4 characters): Ashley
Ignoring strings that contain the substring: Ashl
Valid String: ey
Ashyu
Valid String: Ashyu
Keras
Valid String: Keras
Ashlpo
klop
Valid String: klop
mec@cc-2-4:~/RheaCS7A/cycle 2$ 
mec@cc-2-4:~/RheaCS7A/cycle 2$ 
*/
