#include <stdio.h>
void toLower(char str[]) {
    int k=0;
    while(str[k]!='\0') {
        if(str[k]>='A' && str[k]<='Z') str[k]+=32;
        k++;
    }
    return;
}
void toUpper(char str[]) {
    int k=0;
    while(str[k]!='\0') {
        if(str[k]>='a' && str[k]<='z') str[k]-=32;
        k++;
    }
    return;
}
int main() {
    char str[100], str1[100], str2[100];
    printf("String giriniz: \n");
    fgets(str,100,stdin);
    toLower(str);
    printf("Kucuk hali: %s\n", str);
    toUpper(str);
    printf("Buyuk hali: %s\n", str);
    return 0;
}
