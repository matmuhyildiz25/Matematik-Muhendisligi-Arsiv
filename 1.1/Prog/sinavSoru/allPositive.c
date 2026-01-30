//2025-26 BUT SINAV

#include <stdio.h>

int allPositive(int arr[], int n) {
    for (int i = 0; i < n; i++) {
        if (arr[i] <= 0)
            return 0;
    }
    return 1;
}

int main() {
    int n;
    int arr[50];

    do {
        printf("Eleman sayisi (1-50 arasi): ");
        scanf("%d", &n);
    } while (n <= 0 || n >= 51);

    printf("Diziyi gir:\n");
    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
    }

    if (allPositive(arr, n))
        printf("Tum elemanlar pozitif.\n");
    else
        printf("Pozitif olmayan eleman var.\n");

    return 0;
}