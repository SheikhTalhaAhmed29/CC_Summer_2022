/*Validate ISO Phone Number*/
%{
  
%}

%%
  
"+"+[0-9][0-9]{11} {printf("\nMobile Number Valid\n");}
  
.+ {printf("\nMobile Number Invalid\n");}
  
%%
  
// driver code
int main()
{
    printf("\nEnter Mobile Number : ");
    yylex();
    printf("\n");
    return 0;
}
