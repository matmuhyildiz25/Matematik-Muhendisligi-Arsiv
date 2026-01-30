/*
Bölüm 3: Koşullu Dizi Soruları
Soru 9.
Aşağıdaki prototipe sahip bir fonksiyon yazınız:
int countGreaterThanAverage(int arr[], int n);
Bu fonksiyon, dizinin ortalamasından büyük olan elemanların sayısını döndürmelidir.
*/
#include <stdio.h>
int countGreaterThanAverage(int arr[], int n) {
    int count=0, sum=0, average=0;
    for(int i=0; i<n; i++) {
        sum+=arr[i];
    }
    average=sum/n;
    for(int k=0; k<n; k++) {
        if(arr[k]>average) count++;
    }
    return count;
}
int main() {
    int n, arr[1000];
    printf("Dizinizin eleman sayisini giriniz: \n");
    scanf("%d", &n);
    printf("Dizinizin elemanlarini giriniz: \n");
    for(int m=0; m<n; m++) {
        scanf("%d", &arr[m]);
    }
    printf("Dizinizin ortalamadan büyük olan eleman sayisi: %d\n", countGreaterThanAverage(arr,n));
}