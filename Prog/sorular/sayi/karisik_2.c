#include <stdio.h>
void sumOfNum(int start, int end) {
    int i, sum=0;
    for(i=start; i<=end; i++) sum+=i;
    printf("\nSum of numbers between interval you have entered: %d", sum);
    return;
}
void findEvenOdd(int start, int end) {
    int evenCount=0, oddCount=0;
    int sumEven=0, sumOdd=0;
    int arrEven[1000], arrOdd[1000];
    for(int i=start; i<=end; i++) {
        if(i%2==0) {
            arrEven[evenCount]=i;
            sumEven+=i;
            evenCount++;
        }
        else {
            arrOdd[oddCount]=i;
            sumOdd+=i;
            oddCount++;
        }
    }
    printf("\nEven numbers lied on your interval are: \n");
    for(int j=0; j<evenCount; j++) {
        printf("%d ", arrEven[j]);
    }
    printf("\nSum of even numbers: %d", sumEven);
    printf("\nOdd numbers lied on your interval are: \n");
    for(int m=0; m<oddCount; m++) {
        printf("%d ", arrOdd[m]);
    }
    printf("\nSum of odd numbers: %d", sumOdd);
    return;
}
void mulNum(int start, int end) {
    int mul=1;
    if(start==0) {
        for(int i=start+1; i<=end; i++) mul*=i; //excluding zero from the multiplication
    }
    else {
        for(int j=start; j<=end; j++) mul*=j;
    }
    printf("\nMultiplication of numbers between your interval: %d", mul);
    return;
}
void reversed(int start, int end) {
    for(int i=end; i>=start; i--) printf("%d ", i);
    return;
}
int main() {
    int start, end;
    printf("Enter inital endpoint (natural number): \n");
    scanf("%d", &start);   
    printf("Enter finish endpoint (natural number): \n");
    scanf("%d", &end);
    sumOfNum(start,end);
    findEvenOdd(start, end);
    mulNum(start,end);
    printf("\n");
    reversed(start,end);
    return 0;
}