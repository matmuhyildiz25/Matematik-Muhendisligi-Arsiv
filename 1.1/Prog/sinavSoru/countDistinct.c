//2025-26 FINAL VE BUT SORUSU

#include <stdio.h>

int countDistinct(int arr[], int n) {
    int count = 0;

    for (int i = 0; i < n; i++) {
        int isDistinct = 1;

        for (int j = 0; j < i; j++) {
            if (arr[i] == arr[j]) {
                isDistinct = 0;
                break;
            }
        }

        if (isDistinct)
            count++;
    }

    return count;
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

    int result = countDistinct(arr, n);

    printf("Distinct eleman sayisi: %d\n", result);

    return 0;
}