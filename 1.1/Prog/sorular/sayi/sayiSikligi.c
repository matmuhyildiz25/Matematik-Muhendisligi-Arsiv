#include <stdio.h>
void freq(int number) {
    int temp, i=0, dig=0;
    int freq[10]={0}, arr[20], printed[10]={0};
    temp=number;
    while(temp>0) {
        arr[i]=temp%10;
        i++;
        dig++;
        temp/=10;
    }
    for(int k=0; k<dig; k++) {
        freq[arr[k]]++;
    }
    printf("Eleman sikligi\n-------------------\n");
    for(int m=dig-1; m>=0; m--) {
        int digit=arr[m]; //yazilmadiysa ekleyelim
        if(printed[digit]==0) printf("%d elemaninin siklik: %d adet\n",arr[m] ,freq[arr[m]]);
        printed[digit]=1; //artik yazildi
    }
    return;
}
int main() {
    int number;
    printf("Bir sayi giriniz: \n");
    scanf("%d", &number);
    freq(number);
    return 0;
}