#include <stdio.h>
int findDuck(int number) {
    int temp;
    temp=number;
    while(temp>0) {
        if(temp%10==0) return 1;
        temp/=10;
    }
    return 0;
}
int main() {
    int start, end;
    printf("Enter an inital point: \n");
    scanf("%d", &start);
    printf("Enter an endpoint: \n");
    scanf("%d", &end);
    printf("Duck numbers lied on your interval: \n");
    for(int i=start; i<=end; i++) {
        if(findDuck(i)) printf("%d ", i);
    }
    return 0;
}