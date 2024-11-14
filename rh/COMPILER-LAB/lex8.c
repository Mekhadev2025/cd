#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>

#define MAX_TOKEN_LENGTH 100
#define BUFFER_SIZE 1000

// Token types
typedef enum {
    TOKEN_KEYWORD,
    TOKEN_IDENTIFIER,
    TOKEN_NUMBER,
    TOKEN_STRING_LITERAL,
    TOKEN_CHAR_LITERAL,
    TOKEN_OPERATOR,
    TOKEN_PUNCTUATION,
    TOKEN_UNKNOWN,
    TOKEN_END
} TokenType;

// Token structure
typedef struct {
    TokenType type;
    char value[MAX_TOKEN_LENGTH];
} Token;

// Keywords in C
const char *keywords[] = {
    "auto", "break", "case", "char", "const", "continue", "default",
    "do", "double", "else", "enum", "extern", "float", "for", "goto",
    "if", "int", "long", "register", "return", "short", "signed",
    "sizeof", "static", "struct", "switch", "typedef", "union",
    "unsigned", "void", "volatile", "while", "include", "define"
};

// Function prototypes
Token getNextToken(const char **input);
void printToken(Token token);
int isKeyword(const char *str);
int isOperatorChar(char c);

int main() {
    // Open the file for reading
    FILE *file = fopen("input.txt", "r");
    if (file == NULL) {
        printf("Error opening file!\n");
        return 1;
    }

    // Read the file content into a string buffer
    char buffer[BUFFER_SIZE];
    size_t bytesRead = fread(buffer, 1, sizeof(buffer) - 1, file);
    buffer[bytesRead] = '\0'; // Null-terminate the string

    // Close the file
    fclose(file);

    // Tokenize the input
    const char *currentPosition = buffer;
    Token token;

    printf("Input:\n%s\n", buffer);
    printf("Tokens:\n");

    while ((token = getNextToken(&currentPosition)).type != TOKEN_END) {
        printToken(token);
    }

    return 0;
}

// Function to get the next token from the input
Token getNextToken(const char **input) {
    Token token;
    token.type = TOKEN_UNKNOWN;
    token.value[0] = '\0';

    // Skip whitespace
    while (isspace(**input)) {
        (*input)++;
    }

    // End of input
    if (**input == '\0') {
        token.type = TOKEN_END;
        return token;
    }

    // String literal
    if (**input == '"') {
        int length = 0;
        (*input)++;
        while (**input != '"' && **input != '\0' && length < MAX_TOKEN_LENGTH - 1) {
            token.value[length++] = **input;
            (*input)++;
        }
        if (**input == '"') {
            (*input)++;
        }
        token.value[length] = '\0';
        token.type = TOKEN_STRING_LITERAL;
        return token;
    }

    // Character literal
    if (**input == '\'') {
        int length = 0;
        (*input)++;
        while (**input != '\'' && **input != '\0' && length < MAX_TOKEN_LENGTH - 1) {
            token.value[length++] = **input;
            (*input)++;
        }
        if (**input == '\'') {
            (*input)++;
        }
        token.value[length] = '\0';
        token.type = TOKEN_CHAR_LITERAL;
        return token;
    }

    // Identifier or keyword
    if (isalpha(**input) || **input == '_') {
        int length = 0;
        while ((isalnum(**input) || **input == '_') && length < MAX_TOKEN_LENGTH - 1) {
            token.value[length++] = **input;
            (*input)++;
        }
        token.value[length] = '\0';
        token.type = isKeyword(token.value) ? TOKEN_KEYWORD : TOKEN_IDENTIFIER;
        return token;
    }

    // Number
    if (isdigit(**input)) {
        int length = 0;
        while (isdigit(**input) && length < MAX_TOKEN_LENGTH - 1) {
            token.value[length++] = **input;
            (*input)++;
        }
        token.value[length] = '\0';
        token.type = TOKEN_NUMBER;
        return token;
    }

    // Operators and punctuations
    if (isOperatorChar(**input) || ispunct(**input)) {
        token.value[0] = **input;
        token.value[1] = '\0';
        token.type = isOperatorChar(**input) ? TOKEN_OPERATOR : TOKEN_PUNCTUATION;
        (*input)++;
        return token;
    }

    // Unknown character
    token.value[0] = **input;
    token.value[1] = '\0';
    token.type = TOKEN_UNKNOWN;
    (*input)++;

    return token;
}

// Function to print the token
void printToken(Token token) {
    const char *typeStr;
    switch (token.type) {
        case TOKEN_KEYWORD:
            typeStr = "Keyword";
            break;
        case TOKEN_IDENTIFIER:
            typeStr = "Identifier";
            break;
        case TOKEN_NUMBER:
            typeStr = "Number";
            break;
        case TOKEN_STRING_LITERAL:
            typeStr = "String Literal";
            break;
        case TOKEN_CHAR_LITERAL:
            typeStr = "Char Literal";
            break;
        case TOKEN_OPERATOR:
            typeStr = "Operator";
            break;
        case TOKEN_PUNCTUATION:
            typeStr = "Punctuation";
            break;
        case TOKEN_UNKNOWN:
            typeStr = "Unknown";
            break;
        case TOKEN_END:
            typeStr = "End";
            break;
        default:
            typeStr = "Invalid";
            break;
    }
    printf("Token: %-15s Value: %s\n", typeStr, token.value);
}

// Function to check if a string is a keyword
int isKeyword(const char *str) {
    for (size_t i = 0; i < sizeof(keywords) / sizeof(keywords[0]); i++) {
        if (strcmp(str, keywords[i]) == 0) {
            return 1;
        }
    }
    return 0;
}

// Function to check if a character is an operator
int isOperatorChar(char c) {
    return strchr("+-*/=<>!&|%^", c) != NULL;
}

