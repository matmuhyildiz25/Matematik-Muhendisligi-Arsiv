#include <stdio.h>
int primeCheck(int number) {
    if(number==2) return 1;
    if(number<2) return 0;
    for(int i=2; i<=number/2; i++) {
        if(number%i==0) {
            return 0;
        }
    }
    return 1;
}
// int isPrime(int number) {
//     if(number==2) return 1;
//     if(number<2) return 0;
//     for(int i=2; i*i<=number; i++) if(number%i==0) return 0;
//     return 1;
// }
int main() {
    int num;
    printf("Enter a number to check whether it can be written as sum of two prime numbers: \n");
    scanf("%d", &num);
    printf("Options: \n");
    for(int j=2; j<num/2; j++) {
        if(primeCheck(j) && primeCheck(num-j)) printf("%d + %d = %d\n" , j , num-j , num);
    }
    return 0;
}