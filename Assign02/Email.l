/*Validate Email*/
%{
	#include<stdio.h>

%}
%%
[a-zA-Z0-9_]+"@"[a-z]+".com"|".pk" 	{printf("Valid \n");}

.+				        {printf("Invalid \n");}

%%
int main()
{
	printf("Enter an Email Address: \n");
	yylex();
	return 0;
}
