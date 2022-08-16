# Phase 3

Conversion of C Code to Python Code using YACC

## Introduction Of YACC

YACC (yet another compiler-compiler) is an LALR(1) (LookAhead, Left-to-right, Rightmost derivation producer with 1 lookahead token) parser generator. YACC was originally designed for being complemented by Lex.

## Aproach Used:

Making a Lexical Analyzer was generally more easy than the Parser at the same time, after reading a lot of documentations and cooperative work, we figured out how to make it happen accurately.
Working:

After download, compile the documents to make an executable, run the executable to parse the source code. There are two methods for giving source code to the executable, we have two methods to set input strings to the executable, first from the standard input in the cl(command line), second from a text file. The executable would parse the source program and let user know, whether there are any parsing errors in the program.

## YACC and Flex Compilation

* lex lexer.l
* yacc -d parser.y -v
* gcc -w -g y.tab.c -ly -ll -o semantic_analyser
