#include <stdio.h>
int dividerCheck(int number) {
    int sum=0, temp, digit=0, arr[100];
    temp=number;
    while(temp>0) {
        arr[digit]=temp%10;
        digit++;
        temp/=10;
    }
    for(int i=0; i<digit; i++) {
        if(i%2==0) sum+=arr[i];
        else sum-=arr[i];
    }
    return(sum%11); //0 means completely divisible
}
int main() {
    int start, end;
    printf("Enter an inital point: \n");
    scanf("%d", &start);
    printf("Enter an endpoint: \n");
    scanf("%d", &end);
    printf("Eleven divisible numbers lied on your interval: \n");
    for(int i=start; i<=end; i++) {
        if(dividerCheck(i)==0) printf("%d ", i);
    }
    return 0;
}