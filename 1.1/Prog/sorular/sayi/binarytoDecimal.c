#include <stdio.h>
void binaryToDecimal(int sayi) {
    int temp, digit=0, powered=1, value=0, arr[100];
    temp=sayi;
    while(temp>0) {
        arr[digit]=temp%10;
        for(int i=0; i<digit; i++) {
        powered*=2;
        }
        value+=powered*arr[digit];
        temp/=10;
        digit++;
        powered=1;
    }
    printf("Girdiginiz ikilik sayi: %d\nOnluk sayi sistemi hali: %d\n", sayi, value);
    return;
}
int main() {
    int number;
    printf("İkili sisteme uygun bir sayi giriniz: \n");
    scanf("%d", &number);
    binaryToDecimal(number);
    return 0;
}