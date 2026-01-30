/*
 Write a C function that stores all prime factors of a positive integer in an array given and returns the number of prime factors.
Function prototype:
int primefactors(int x, int arr[])
*/
#include <stdio.h>
int isPrime(int number) {
    for(int i=2; i<number/2; i++) {
        if(number%i==0) return 0;
    }
    return 1; //asal
}
int primeFactors(int x, int arr[]) {
    int count=0;
    for(int i=2; i<=x; i++) {
        while(x%i==0 && isPrime(i)) { /* WHILE */
            arr[count]=i;
            count++;
            x/=i; /* SAYI KUCULTME */
        }
    }
    return count;
}
int main() {
    int number, divider, arr[100];
    printf("Bir sayi giriniz: \n");
    scanf("%d", &number);
    divider=primeFactors(number, arr);
    printf("%d adet asal carpan.\n", divider);
    return 0;
}