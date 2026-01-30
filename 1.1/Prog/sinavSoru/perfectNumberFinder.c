//2025-26 VIZE SORUSU

#include <stdio.h>

int isPerfect(int n) {
    if (n <= 1)
        return 0;

    int sum = 1;

    for (int i = 2; i <= n / 2; i++) {
        if (n % i == 0)
            sum += i;
    }

    return sum == n;
}

int main() {
    int low, high;

    printf("Alt sinir: ");
    scanf("%d", &low);

    printf("Ust sinir: ");
    scanf("%d", &high);

    printf("Perfect numberlar:\n");

    for (int i = low; i <= high; i++) {
        if (isPerfect(i))
            printf("%d ", i);
    }

    return 0;
}