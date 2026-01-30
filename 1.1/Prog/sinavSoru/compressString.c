//2025-26 FINAL VE BUT SORUSU

#include <stdio.h>

void compress(char str[]) {
    int read = 0;
    int write = 0;

    while (str[read] != '\0') {
        // her yeni karakteri yaz
        str[write] = str[read];
        write++;

        // aynı karakterleri atla
        while (str[read] == str[read + 1]) {
            read++;
        }

        read++;
    }

    // yeni sonu koy
    str[write] = '\0';
}

int main() {
    char str[100];

    printf("String gir: ");
    scanf("%s", str);

    compress(str);

    printf("Compressed: %s\n", str);

    return 0;
}