/*
SORU 4 – (Strong + Factorial + Loop)
Girilen sayının
Strong number olup olmadığını kontrol ediniz
Değilse en yakın küçük Strong number’ı bulunuz
*/
#include <stdio.h>
int strongNum(int sayi) {
    int temp, fac=1, sum=0, bas=0, value[100];
    temp=sayi;
    while(temp>0) {
        value[bas]=temp%10;
        temp/=10;
        bas++;
    }
    for(int i=0; i<bas; i++) {
        if(value[i]==0) fac=1;
        for(int j=1; j<=value[i]; j++) {
            fac*=j;
        }
        sum+=fac;
        fac=1;
    }
    return (sayi==sum);
}
int main() {
    int num, yakin;
    printf("Kontrol icin sayi giriniz: \n");
    scanf("%d", &num);
    if(strongNum(num)) printf("(%d) güclü sayidir\n", num);
    else {
        for(int j=num-1; j>=1; j++) {
            if(strongNum(j)) {
                yakin=j;
                break;
            }
        }
    }
    printf("(%d) Güclü sayi degildir ve kendisine en yakin kucuk guclu sayi %d'dir.\n", num, yakin);
    return 0;
}