#include <stdio.h>
void spyCheck(int number) {
    int sum=0, mul=1, temp;
    temp=number;
    while(temp>0) {
        sum+=temp%10;
        if(temp%10!=0) mul*=temp%10;
        temp/=10;
    }
    if(mul==sum || number==0) printf("Your number (%d) is a spy number.\n", number);
    else printf("Your number (%d) is NOT a spy number.\n", number);
    return;
}
int main() {
    int number;
    printf("Enter a number to control spyity: \n");
    scanf("%d", &number);
    spyCheck(number);
    return 0;
}