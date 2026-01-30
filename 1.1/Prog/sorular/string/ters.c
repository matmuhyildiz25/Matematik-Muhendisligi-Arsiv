#include <stdio.h>
void reversedString(char str[]) {
    int length=0;
    char temp;
    while(str[length]!='\n') {
        length++;
    }
    for(int i=0; i<length/2; i++) {
        temp=str[i];
        str[i]=str[length-1-i];
        str[length-1-i]=temp;
    }
    return;
}
int main() {
    char str[100];
    printf("Bir string giriniz: \n");
    fgets(str,100,stdin);
    reversedString(str);
    printf("String'in tersi: %s\n", str);
    return 0;
}