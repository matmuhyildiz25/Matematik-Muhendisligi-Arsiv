/*
Kullanıcıdan n elemanlı bir tamsayı dizi alınız. +
Yazacağınız C programında:
Dizideki tekrar eden elemanların sayısını bulunuz. --------
Diziden tekrar eden elemanları silerek yeni bir dizi oluşturunuz. -------
Diziyi tersten yazdırınız. +
Dizideki çift ve tek elemanları iki ayrı diziye ayırınız. +
Diziyi artan veya azalan sırada sıralayınız. +
Dizideki çift ve tek elemanları kendi içlerinde ayrı ayrı sıralayınız. +
Diziyi sola ve sağa 1 birim döndürünüz (left–right rotation). -------
Verilen bir anahtar değerin (key) dizide olup olmadığını kontrol ediniz. +
*/
#include <stdio.h>
void sortedInc(int arr[], int n) {
    int temp, i, j, m;
    for(i=0; i<n-1; i++) {
        for(j=0; j<n-1-i; j++) {
            if(arr[j]>arr[j+1]) {
                temp=arr[j];
                arr[j]=arr[j+1];
                arr[j+1]=temp;
            }
        }
    }
    printf("\nDizinin kucukten buyuge siralanmis hali: \n");
    for(m=0; m<n; m++) {
    printf("%d ", arr[m]);
    }
    return;
}
void sortedDec(int arr[], int n) {
    int temp, i, j, m;
    for(i=0; i<n-1; i++) {
        for(j=0; j<n-1-i; j++) {
            if(arr[j]<arr[j+1]) {
                temp=arr[j];
                arr[j]=arr[j+1];
                arr[j+1]=temp;
            }
        }
    }
    printf("\nDizinin buyukten kucuge siralanmis hali: \n");
    for(m=0; m<n; m++) {
    printf("%d ", arr[m]);
    }
    return;
}
void seperateEvenOdd(int arr[], int n) {
    int countEven=0, countOdd=0, oddArr[1000], evenArr[1000];
    for(int i=0; i<n; i++) {
        if(arr[i]%2==0) {
            evenArr[countEven]=arr[i];
            countEven++;
        }
        else {
            oddArr[countOdd]=arr[i];
            countOdd++;
        }
    }
    printf("\nDizideki cift elemanlar: \n");
    for(int k=0; k<countEven; k++) {
        printf("%d ", evenArr[k]);
    }
    sortedInc(evenArr, countEven);
    sortedDec(evenArr, countEven);
    printf("\nDizideki tek elemanlar: \n");
    for(int m=0; m<countOdd; m++) {
    printf("%d ", oddArr[m]);
    }
    sortedInc(oddArr, countOdd);
    sortedDec(oddArr, countOdd);
    return;
}
void printReversed(int arr[], int n) {
    for(int i=n-1; i>=0; i--) {
        printf("%d ", arr[i]);
    }
    printf("\n");
    return;
}
void printReversedOptional(int arr[], int n) {
    int temp;
    for(int i=0; i<n/2; i++) {
        temp=arr[i];
        arr[i]=arr[n-1-i];
        arr[n-1-i]=temp;
    }
    for(int j=0; j<n; j++) {
        printf("%d ", arr[j]);
    }
    printf("\n");
    return;
}
int search(int arr[], int n, int key) {
    for(int i=0; i<n; i++) {
        if(arr[i]==key) return 1;
    }
    return 0;
}
int main() {
    int n, arr[1000], key;
    printf("Dizinizin eleman sayisini giriniz: \n");
    scanf("%d", &n);
    printf("Dizinizin elemanlarini giriniz (tamsayi): \n");
    for(int m=0; m<n; m++) {
        scanf("%d", &arr[m]);
    }
    printf("\nDizinizin asil hali: \n");
    for(int l=0; l<n; l++) {
        printf("%d", &arr[l]);
    }
    sortedInc(arr,n);
    sortedDec(arr,n);
    printf("\nDizinizin tersi: \n");
    printReversed(arr,n);
    printf("\nDizinizin tersi (opsiyonel): \n");
    printReversedOptional(arr,n);
    seperateEvenOdd(arr,n);
    printf("\nAramak istediginiz elemani giriniz: \n");
    scanf("%d", &key);
    if(search(arr,n,key)) printf("Aradiginiz eleman dizide mevcuttur.\n");
    else printf("Aradiginiz eleman dizide yoktur.\n");
    return 0;
}