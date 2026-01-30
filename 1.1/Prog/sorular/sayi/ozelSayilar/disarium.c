#include <stdio.h>
int disariumCheck(int number) {
    int digit=0, temp, arrDig[100], value=1, sum=0;
    temp=number;
    while(temp>0) {
        temp/=10;
        digit++;
    }
    temp=number;
    for(int i=digit-1; i>=0; i--) {
        arrDig[i]=temp%10;
           for(int j=0; j<=i; j++) {
               value*=arrDig[i];
           }
               sum+=value;
               value=1;
        temp/=10;
    }

    return(number==sum);
}
int main() {
    int number;
    printf("Enter a number to control: \n");
    scanf("%d", &number);
    if(disariumCheck(number)) printf("%d is a disarium number.", number);
    else printf("%d is NOT a disarium number.", number);
    return 0;
}