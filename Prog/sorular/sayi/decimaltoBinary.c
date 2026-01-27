#include <stdio.h>
void decimalToBinary(int sayi) {
    int temp, i=0;
    int arr[100];
    temp=sayi;
    while(temp>0) {
        if(temp%2==0) arr[i]=0;
        else arr[i]=1;
        i++;
        temp/=2;
    }
    printf("Girdiginiz (onluk sistem) sayi: %d\nSayinin ikili sistem hali: ", sayi);
    for(int j=i-1; j>=0; j--) printf("%d", arr[j]);
    return;
}
int main() {
    int number;
    printf("Onluk sisteme uygun bir sayi giriniz: \n");
    scanf("%d", &number);
    decimalToBinary(number);
    return 0;
}