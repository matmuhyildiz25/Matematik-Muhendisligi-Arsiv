#include <stdio.h>
int main() {
    int satir;
    printf("Desenin satir sayisini giriniz: \n");
    scanf("%d", &satir);
    for(int i=1; i<=satir; i++) {
        for(int s=1; s<=satir-i; s++) {
            printf(" ");
        }
        for(int j=1; j<=2*i-1; j++) {
            printf("*");
        }
        printf("\n");
    }
    //ters piramit
    for(int m=satir; m>=1; m--) {
        for(int s=1; s<=satir-m; s++) {
            printf(" ");
        }
        for(int j=1; j<=2*m-1; j++) {
            printf("#");
        }
        printf("\n");
    }
    return 0;
}