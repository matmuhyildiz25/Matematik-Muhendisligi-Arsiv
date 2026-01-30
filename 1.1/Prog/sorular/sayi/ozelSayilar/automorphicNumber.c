#include <stdio.h>
void neonCheck(int number) {
    int square;
    square=number*number;
    if(square%10==number) printf("%d is a neon number.\n", number);
    else printf("%d is not a neon number.\n", number);
    return;
}
int main() {
    int number;
    printf("Enter a number to control neoninty: \n");
    scanf("%d", &number);
    neonCheck(number);
    return 0;
}