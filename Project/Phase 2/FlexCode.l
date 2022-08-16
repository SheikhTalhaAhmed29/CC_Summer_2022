//Flex Code
%{

#include <stdlib.h>
#include <stdio.h>


int cmnt_strt = 0; //This is used to deal with the comments in the tokenization

%}

//Creation of Regular Expressions for letters, digits,white space and identifiers respectively
letter [a-zA-Z] 
digit [0-9] 
ws  [ \t\r\f\v]+ 
identifier (_|{letter})({letter}|{digit}|_){0,31}

//Describing special commands like comments
%x CMNT
%x PREPROC

%%
/*TEst comment */
//Storing all the keywords to recognize
//First all the datatypes are defined
"int"                             {printf("\t%-30s : Data Type\n",yytext);}
"long"                            {printf("\t%-30s : Data Type\n",yytext);}
"long long"                       {printf("\t%-30s : Data Type\n",yytext);}
"short"                           {printf("\t%-30s : Data Type\n",yytext);}
"signed"                          {printf("\t%-30s : Data Type\n",yytext);}
"unsigned"                        {printf("\t%-30s : Data Type\n",yytext);}
//Reserved keywords defined
"for"                             {printf("\t%-30s : Keyword\n",yytext);}
"break"                           {printf("\t%-30s : Keyword\n",yytext);}
"continue"                        {printf("\t%-30s : Keyword\n",yytext);}
"if"                              {printf("\t%-30s : Keyword\n",yytext);}
"else"                            {printf("\t%-30s : Keyword\n",yytext);}
"return"                          {printf("\t%-30s : Keyword\n",yytext);}
//Identifying of identifiers
{identifier}                      {printf("\t%-30s : Identifier\n", yytext);}
//Whitespace break logic
{ws}                              ;
//Number Constant
[+\-]?{digit}+[lLuU]?              {printf("\t%-30s : Constant\n", yytext);}
//Start of multiline comment
"/*"                              {cmnt_strt = yylineno; BEGIN CMNT;}
<CMNT>.|{ws}                      ;
<CMNT>\n                          {yylineno++;}
<CMNT>"*/"                        {BEGIN INITIAL;}
<CMNT>"/*"                        {printf("Line %3d: Nested comments are not valid!\n",yylineno);}
<CMNT><<EOF>>                     {printf("Line %3d: Unterminated comment\n", cmnt_strt); yyterminate();}
//Headers of the code
^"#include"                       {BEGIN PREPROC;}
<PREPROC>"<"[^<>\n]+">"            {printf("\t%-30s : Header file\n",yytext);}
<PREPROC>{ws};
<PREPROC>\"[^"\n]+\"              {printf("\t%-30s : Header file\n",yytext);}
<PREPROC>\n                       {yylineno++; BEGIN INITIAL;}
<PREPROC>.                        {printf("Line %3d: Illegal header file format \n",yylineno);}
"//".*                            ;

\"[^\"\n]*\"     {

  if(yytext[yyleng-2]=='\\') /* check if it was an escaped quote */
  {
    yyless(yyleng-1);       /* push the quote back if it was escaped */
    yymore();
  }

}
//Eoor state for strings
\"[^\"\n]*$                     {printf("Line %3d: Unregonizable string %s\n",yylineno,yytext);}
//Error Condition of wrong Variale name
{digit}+({letter}|_)+        {printf("Line %3d: Not a valid variable name %s\n",yylineno,yytext);}
//Change line number
\n                              {yylineno++;} //Code to increase count of line no
//Operators detection code
"--"                {printf("\t%-30s : Operator\n",yytext);}
"++"                {printf("\t%-30s : Operator\n",yytext);}
"->"                {printf("\t%-30s : Operator\n",yytext);}
"&&"                {printf("\t%-30s : Operator",yytext);}
"||"                {printf("\t%-30s : Operator\n",yytext);}
"<="                {printf("\t%-30s : Operator\n",yytext);}
">="                {printf("\t%-30s : Operator\n",yytext);}
"=="                {printf("\t%-30s : Operator\n",yytext);}
"!="                    {printf("\t%-30s : Operator\n",yytext);}
"-"                    {printf("\t%-30s : Operator\n",yytext);}
"+"                    {printf("\t%-30s : Operator\n",yytext);}
"*"                    {printf("\t%-30s : Operator\n",yytext);}
"/"                        {printf("\t%-30s : Operator\n",yytext);}
"%"                    {printf("\t%-30s : Operator\n",yytext);}
"<"                    {printf("\t%-30s : Operator\n",yytext);}
">"                    {printf("\t%-30s : Operator\n",yytext);}
//Terminator recogniser
";"                    {printf("\t%-30s : Terminator\n",yytext);}
//Recognizes all the valid parenthesis
"{"                             {printf("\t%-30s : Parentheses\n",yytext);}
"}"                             {printf("\t%-30s : Parentheses\n",yytext);}
","                    {printf("\t%-30s : Parentheses\n",yytext);}
"="                    {printf("\t%-30s : Parentheses\n",yytext);}
"("                    {printf("\t%-30s : Parentheses\n",yytext);}
")"                    {printf("\t%-30s : Parentheses\n",yytext);}
"["                             {printf("\t%-30s : Parentheses\n",yytext);}
"]"                             {printf("\t%-30s : Parentheses\n",yytext);}

.                               {printf("Line %3d: Illegal character %s\n",yylineno,yytext);}

%%
//Main code
int main()
{
  yyin=fopen("code.c","r"); // get the input file
  yylex(); //run the method where logics are implemented 
}
