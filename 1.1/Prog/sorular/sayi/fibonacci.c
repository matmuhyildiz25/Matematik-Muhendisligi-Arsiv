#include <stdio.h>
void printFibonacci(int eleman) {
    int arr[10000];
    if (eleman<=0) return;
    arr[0]=1;
    if(eleman>1) arr[1]=1;
    printf("%d elemanli Fibonacci diziniz: %d %d ", eleman, arr[0], arr[1]);
    for(int i=2; i<eleman; i++) {
        arr[i]=arr[i-1]+arr[i-2];
        printf("%d ", arr[i]);
    }
    return;
}
int main() {
    int eleman;
    printf("Kac elemanli Fibonacci dizisi olusturmak istersiniz: \n");
    scanf("%d", &eleman);
    printFibonacci(eleman);
    return 0;
}