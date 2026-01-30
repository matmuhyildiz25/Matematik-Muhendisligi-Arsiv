//2025-26 FINAL SORUSU

#include <stdio.h>

int checkOrder(int arr[], int n) {
    int inc = 1;   // artan varsay
    int dec = 1;   // azalan varsay

    for (int i = 0; i < n - 1; i++) {
        if (arr[i] > arr[i + 1])
            inc = 0;

        if (arr[i] < arr[i + 1])
            dec = 0;
    }

    if (inc)
        return 1;   // artan
    else if (dec)
        return -1;  // azalan
    else
        return 0;   // sırasız
}

int main() {
    int n;
    int arr[100];

    printf("Eleman sayisi: ");
    scanf("%d", &n);

    printf("Diziyi gir:\n");
    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
    }

    int result = checkOrder(arr, n);

    if (result == 1)
        printf("Dizi artan sirada.\n");
    else if (result == -1)
        printf("Dizi azalan sirada.\n");
    else
        printf("Dizi sirali degil.\n");

    return 0;
}