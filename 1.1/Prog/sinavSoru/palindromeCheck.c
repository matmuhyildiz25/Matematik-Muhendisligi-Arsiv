//2025-26 VIZE SORUSU

#include <stdio.h>

int isPalindrome(char str[]) {
    int len = 0;

    // uzunluk bul
    while (str[len] != '\0')
        len++;

    int left = 0;
    int right = len - 1;

    while (left < right) {
        if (str[left] != str[right])
            return 0;

        left++;
        right--;
    }

    return 1;
}

int main() {
    char word[100];

    printf("Kelime gir: ");
    scanf("%s", word);

    if (isPalindrome(word))
        printf("Palindrome.\n");
    else
        printf("Palindrome degil.\n");

    return 0;
}