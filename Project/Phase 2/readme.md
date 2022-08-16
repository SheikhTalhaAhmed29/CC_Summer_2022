## Lexical Analyzer
Lexical analysis is the first phase of a compiler. It takes modified source code from language preprocessors that are written in the form of sentences. The lexical analyzer breaks these syntaxes into a series of tokens, by removing any whitespace or comments in the source code.

## How Finding Output of Token <tokenclass,lexeme>
The FlexClde file outputs tokens <tokenclass,lexeme> of the given code in C language present in code.c file.
As mentioned above to do so first have to make lexemes.
if there is a word "for" the analyzer will not say it is an identifier as "for" is a reserved keyword and have a higher priority than an identifier. The other thing we do is use whitespaces to separate lexemes in the code. We have already explained a simple example of Keywords and Identifiers but it gets much more complicated than that as "for" can also be written as a string in a print statement. We will discuss more about issues like this in the next section and how and which rules are used to recognize each token class.

## Compile Code Commands
* flex FlexCode.l
* ls -l *.c
* gcc lex.yy.c -lfl
* ./a.out code.c 


https://user-images.githubusercontent.com/57304670/184890804-e77f5e98-09ef-42d7-8e83-d26746b34ba9.mp4

