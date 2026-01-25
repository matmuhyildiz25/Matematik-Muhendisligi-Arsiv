#include <stdio.h>
void printReversed(int number) {
    int temp, digit=0, reversed=0;
    temp=number;
    while(temp>0) {
        digit=temp%10;
        reversed=reversed*10+digit;
        temp/=10;
    }
    printf("Sayinizin tersi: %d\n", reversed);
    return;
}
int main() {
    int number;
    printf("Bir sayi giriniz: \n");
    scanf("%d", &number);
    printReversed(number);
    return 0;
}