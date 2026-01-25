#include <stdio.h>
int digit(int number) {
    int dig=0, temp;
    temp=number;
    while(temp>0) {
    temp/=10;
    dig++;
    }
    return dig;
}
int isPalindrome(int number) {
    int reversed=0, temp, value=0;
    temp=number;
    while(temp>0) {
        value=temp%10;
        reversed=reversed*10+temp;
        temp/=10;
    }
    return(number==reversed);
}
void sumOfDigits(int number) {
    int sum=0, temp, value=0, first, last;
    temp=number;
    for(int i=0; i<=digit(number)-1; i++) {
        first=temp%10;
        temp/=10;
    }
    last=number%10;
    temp=number;
    while(temp>0) {
    value=temp%10;
    sum+=value;
    temp/=10; 
    }
    printf("Sum of digits of the number you have entered: %d\nFirst digit: %d\nLast digit: %d\n", sum, first, last);
    return;
}
int mulOfDigits(int number) {
    int mul=1, temp, value=0;
    int arrValues[digit(number)]; //an array including whole digit values
    temp=number;
    while(temp>0) {
        for(int i=0; i<digit(number); i++) {
            value=temp%10;
            arrValues[i]=value;
            if(arrValues[i]!=0) mul*=arrValues[i];
            temp/=10;
        }
    }
    return mul;
}
int main() {
    int number;
    printf("Enter a number: \n");
    scanf("%d", &number);
    printf("\nDigit of your number: %d\nMultiplication of digit values: %d\n", digit(number), mulOfDigits(number));
    sumOfDigits(number); // sum and first last digits of the number
    if(isPalindrome(number)==1) printf("\nYour number is palindrome!\n");
    return 0;
}