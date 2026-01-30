/*
Soru 3.
Aşağıdaki prototipe sahip bir fonksiyon yazınız:
int maxElement(int arr[], int n);
Bu fonksiyon, dizideki en büyük elemanı döndürmelidir.
*/
#include <stdio.h>
int max(int a, int b, int c, int d, int e) {
    int arr[5] = {a, b, c, d, e};
    int maxEleman = arr[0];
    for(int i=1; i<5; i++) {
        if(arr[i]>maxEleman)
            maxEleman=arr[i];
    }
    return maxEleman;
}
int maxEl(int a, int b, int c, int d, int e) {
    int maxE=a;
    if(b>maxE) maxE= b;
    if(c>maxE) maxE= c;
    if(d>maxE) maxE= d;
    if(e>maxE) maxE= e;
    return maxE;
}
int maxDizi(int arr[], int n) {
    int maxEleman;
    maxEleman=arr[0];
    for(int i=1; i<n; i++) {
        if(arr[i]>maxEleman) maxEleman=arr[i];
    }
    return maxEleman;
}
int min(int arr[], int n) {
    int minEleman;
    minEleman=arr[0];
    for(int i=0; i<n; i++) {
        if(arr[i]<minEleman) minEleman=arr[i];
    }
    return minEleman;
}
int main() {
    int arr[100], n;
    printf("Dizinizin eleman sayisini giriniz: \n"); //dizinin eleman sayisi
    scanf("%d", &n);
    printf("Dizinizin elemanlarini giriniz: \n"); //dizinin elemanlari
    for(int i=0; i<n; i++) {
        scanf("%d", &arr[i]);
    }
    printf("Dizinizdeki en buyuk eleman: %d\nDizinizdeki en kucuk eleman sayisi: %d\n", max(arr,n), min(arr,n));
    return 0;
}