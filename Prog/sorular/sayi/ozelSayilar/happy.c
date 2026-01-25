#include <stdio.h>
void happyCheck(int number) {
    int temp, sum=0, original=number;
    do {
        temp=number;
        sum=0;
        while(temp>0) {
        sum+=(temp%10)*(temp%10);
        temp/=10;
    }
    number=sum;
    } while(number != 1 && number != 4);
    if (number == 1)
        printf("%d ", original);
    return;
}
int main() {
    int start, end;
    printf("Enter an inital point: \n");
    scanf("%d", &start);
    printf("Enter an endpoint: \n");
    scanf("%d", &end);
    printf("Happy numbers lied on your interval: \n");
    for(int i=start; i<=end; i++) {
        happyCheck(i);
    }
    return 0;
}