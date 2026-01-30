#include <stdio.h>
void change(char str[], char ch);

void change(char str[], char ch)
{
    int k=0;
    while(str[k]!='\0')
    {
        if((str[k]>= 'A' && str[k]<= 'Z') || (str[k]>= 'a' && str[k]<= 'z')) str[k]=ch;
        k++;
    }
    return;
}
int main()
{
    char str[]="Yildiz Technical University";
    change(str , '*');
    printf("%s" , str);
    return 0;
}