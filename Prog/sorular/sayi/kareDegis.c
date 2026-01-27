/*
Bölüm 2: Fonksiyonlarla Dizi Değiştirme
Soru 6.
Aşağıdaki prototipe sahip bir fonksiyon yazınız:
void squareElements(int arr[], int n);
Bu fonksiyon, dizideki her elemanı karesiyle değiştirmelidir.
Güncellenmiş diziyi main() fonksiyonunda ekrana yazdırınız.
*/
#include <stdio.h>
void squareElements(int arr[], int n) {
    int powered=1;
    for(int i=0; i<n; i++) {
        powered=arr[i]*arr[i];
        arr[i]=powered;
        powered=1;
    }
    printf("Dizinizin elemanlarinin kareleriyle yer degistirmis hali: \n");
    for(int k=0; k<n; k++) {
        printf("%d ", arr[k]);
    }
    return;
}
int main() {
    int n, arr[1000];
    printf("Dizinizin eleman sayisini giriniz: \n");
    scanf("%d", &n);
    printf("Dizinizin elemanlarini giriniz: \n");
    for(int m=0; m<n; m++) {
        scanf("%d", &arr[m]);
    }
    squareElements(arr,n);
}