#include <stdio.h>
void printNeon(int number) {
    int powered=1, temp, sum=0;
    powered=number*number;
    temp=powered;
    while(temp>0) {
       sum+=temp%10;
       temp/=10;
    }
    if(sum==number) printf("%d ", number);
    return;
}
int main() {
    int start, end;
    printf("Enter an inital point: \n");
    scanf("%d", &start);
    printf("Enter an endpoint: \n");
    scanf("%d", &end);
    printf("Neon numbers lied on your interval: \n");
    for(int i=start; i<=end; i++) {
        printNeon(i);
    }
}