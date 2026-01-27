/*
SORU 6 – (Armstrong + Digit + Power)
153 = 1^3 + 5^3 + 3^3
1–n arasındaki Armstrong sayıları
yazdırınız
adetini ve toplamını bulunuz
*/
#include <stdio.h>
int armstrongCheck(int sayi) {
    int temp, bas=0, value, sum=0, power=1;
    if (sayi == 0) return 1;
    temp=sayi;
    while(temp>0) {
        temp/=10;
        bas++;
    }
    temp=sayi;
    while(temp>0) {
        value=temp%10;
        for(int i=0; i<bas; i++) {
            power*=value;
        }
        sum+=power;
        power=1;
        temp/=10;
    }
    return(sayi==sum);
}
int main() {
    int start, end;
    printf("Armstrong kontrolü icin aralik basi ve sonu giriniz: \n");
    scanf("%d%d", &start, &end);
    printf("Bu araliktaki armstrong sayilar: \n");
    for(int k=start; k<=end; k++) {
        if(armstrongCheck(k)) printf("%d ", k);
    }
    return 0;
}