%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char* tokenType[] = {"Keyword", "Identifier", "Character", "String", "Integer", "Real number", "Comment", "Operator", "Punctuation symbol"};
enum tnumber {TEOF, TKEYWORD, TIDENTIFIER, TCHARACTER, TSTRING, TINTEGER, TREAL, TCOMMENT, TOPERATOR, TPUNCTUATION, TERROR};
int line = 1, pos = 1;
char *p = NULL;
union{
        int iVal;
        float rVal;
} yylval;

int char_to_int(char *a);
int str_to_octal(char * a);
int str_to_hexa(char * a);
int calc_line(char * a);
%}

WS      " "
TAB     \t
LINE    \n
OPERATOR (\+|\-|\*|\/|%|!|=|<|>)=?|&&|\|\||\+\+|\-\-|\,
KEYWORD break|case|char|default|else|float|for|if|int|return|switch|void|while
IDENTIFIER      [A-Za-z_][A-Za-z0-9_]*
REAL    [0-9]+\.[0-9]+([eE][\+\-]?[0-9]+)?
DECIMAL [1-9][0-9]*|0
OCTAL   0[0-7]+
HEXA    0[xX][A-Fa-f0-9]+
CHARAC  \\[abfnrtv0\'\"?\\]|[^\\\'\"]
CHARACTER       \'{CHARAC}\'
STRING  \"{CHARAC}*\"
COMMENT \/\*([^\*]|\*+[^\*/])*\*+\/|\/\/(.)*
PUNCTUATION     \(|\)|\{|\}|\[|\]|";"|":"
ERROR   .

%%

{WS}    {{pos++; }}
{TAB}   {{pos++; }}
{LINE}  {line++;  pos= 1; }
{OPERATOR}       {{return TOPERATOR; }}
{KEYWORD}        {{return TKEYWORD; }}
{IDENTIFIER}     {{return TIDENTIFIER; }}
{REAL}  {{return TREAL; }}
{DECIMAL}        {{yylval.iVal=atoi(yytext); return TINTEGER; }}
{OCTAL}        {{yylval.iVal=str_to_octal(yytext); return TINTEGER; }}
{HEXA}        {{yylval.iVal=str_to_hexa(yytext); return TINTEGER; }}
{CHARACTER}      {{yylval.iVal=char_to_int(yytext); return TCHARACTER; }}
{STRING} {{return TSTRING; }}
{PUNCTUATION}    {{return TPUNCTUATION; }}
{COMMENT}        {{return TCOMMENT; }}
{ERROR}  {{return TERROR; }}


%%

int main(int argc, char *argv[]){
        enum tnumber tn;
        if(!argc)       exit(0);
        yyin = fopen(argv[1], "r");

        // Insert source code here...
        while ((tn = yylex()) != TEOF) {
                switch(tn) {
                case TCHARACTER:
                        printf("%-15s:%19s,%3d,%3d,%5d\n", yytext, tokenType[2], line, pos, yylval.iVal);
                        pos += yyleng;
                        break;
                case TINTEGER:
                        printf("%-15s:%19s,%3d,%3d,%5d\n", yytext, tokenType[4], line, pos, yylval.iVal);
                        pos += yyleng;
                        break;
                case TREAL:
                        yylval.rVal = strtof(yytext, &p);
                        printf("%-15s:%19s,%3d,%3d,%5.2f\n", yytext, tokenType[5], line, pos, yylval.rVal);
                        pos += yyleng;
                        break;
                case TKEYWORD:
                        printf("%-15s:%19s,%3d,%3d\n", yytext, tokenType[0], line, pos);
                        pos += yyleng;
                        break;
                case TIDENTIFIER:
                        printf("%-15s:%19s,%3d,%3d\n", yytext, tokenType[1], line, pos);
                        pos += yyleng;
                        break;
                case TSTRING:
                        printf("%-15s:%19s,%3d,%3d\n", yytext, tokenType[3], line, pos);
                        pos += yyleng;
                        line += calc_line(yytext);
                        break;
                case TCOMMENT:
                        printf("%-15s:%19s,%3d,%3d\n", yytext, tokenType[6], line, pos);
                        pos += yyleng;
                        line += calc_line(yytext);
                        break;
                case TOPERATOR:
                        printf("%-15s:%19s,%3d,%3d\n", yytext, tokenType[7], line, pos);
                        pos += yyleng;
                        break;
                case TPUNCTUATION:
                        printf("%-15s:%19s,%3d,%3d\n", yytext, tokenType[8], line, pos);
                        pos += yyleng;
                        break;
                case TERROR:
                        printf("Error occured in Line %d, Position %d\n", line, pos);
                        return 0;
                }
        }

        fclose(yyin);
        return 0;
}

int char_to_int(char * a) {
        if (a[1] == '\\') { // \\n -> \\\n
                switch (a[2]) {
                case 'a':       return (int)'\a';
                case 'b':       return (int)'\b';
                case 'f':       return (int)'\f';
                case 'n':       return (int)'\n';
                case 'r':       return (int)'\r';
                case 't':       return (int)'\t';
                case 'v':       return (int)'\v';
                case '0':       return (int)'\0';
                default:        return (int)a[2];
                }
        }
        else {
                return  (int)a[1];
        }
}

int str_to_octal(char * a) {
        int k = 0;
        for (int i=0; i<strlen(a); i++) {
                k = k*8 + (a[i]-'0');
        }
        return k;
}

int str_to_hexa(char * a) {
        int k= 0;
        for (int i=2; i<strlen(a); i++) {
                int j;
                if (a[i]>='a' && a[i]<='f') {
                        j = a[i] - 'a' + 10;
                }
                else if (a[i]>='A' && a[i]<='F') {
                        j = a[i] - 'A' + 10;
                }
                else {
                        j = a[i] - '0';
                }
                k = k * 16 + j;
        }
        return k;
}

int calc_line(char * a) {
        int t = 0;
        int lines = 0;

        for (int i = 0 ; a[i] != '\0'; i++) {
                if (a[i] == '\n') {
                        t++;
                 }
        }
        return t;
}
