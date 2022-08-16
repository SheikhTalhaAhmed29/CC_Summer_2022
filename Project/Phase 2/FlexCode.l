
%{

#include <stdlib.h>
#include <stdio.h>


int cmnt_strt = 0; //This is used to deal with the comments in the tokenization

%}


letter [a-zA-Z] 
digit [0-9] 
ws  [ \t\r\f\v]+ 
identifier (_|{letter})({letter}|{digit}|_){0,31}


%x CMNT
%x PREPROC

%%


"int"                             {printf("\t%-30s : Data Type\n",yytext);}
"long"                            {printf("\t%-30s : Data Type\n",yytext);}
"long long"                       {printf("\t%-30s : Data Type\n",yytext);}
"short"                           {printf("\t%-30s : Data Type\n",yytext);}
"signed"                          {printf("\t%-30s : Data Type\n",yytext);}
"unsigned"                        {printf("\t%-30s : Data Type\n",yytext);}

"for"                             {printf("\t%-30s : Keyword\n",yytext);}
"break"                           {printf("\t%-30s : Keyword\n",yytext);}
"continue"                        {printf("\t%-30s : Keyword\n",yytext);}
"if"                              {printf("\t%-30s : Keyword\n",yytext);}
"else"                            {printf("\t%-30s : Keyword\n",yytext);}
"return"                          {printf("\t%-30s : Keyword\n",yytext);}

{identifier}                      {printf("\t%-30s : Identifier\n", yytext);}

{ws}                              ;

[+\-]?{digit}+[lLuU]?              {printf("\t%-30s : Constant\n", yytext);}

"/*"                              {cmnt_strt = yylineno; BEGIN CMNT;}
<CMNT>.|{ws}                      ;
<CMNT>\n                          {yylineno++;}
<CMNT>"*/"                        {BEGIN INITIAL;}
<CMNT>"/*"                        {printf("Line %3d: Nested comments are not valid!\n",yylineno);}
<CMNT><<EOF>>                     {printf("Line %3d: Unterminated comment\n", cmnt_strt); yyterminate();}

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

\"[^\"\n]*$                     {printf("Line %3d: Unregonizable string %s\n",yylineno,yytext);}

{digit}+({letter}|_)+        {printf("Line %3d: Not a valid variable name %s\n",yylineno,yytext);}

\n                              {yylineno++;} //Code to increase count of line no

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

";"                    {printf("\t%-30s : Terminator\n",yytext);}

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
