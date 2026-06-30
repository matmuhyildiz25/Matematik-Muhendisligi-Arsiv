#include<stdio.h>

void PrintDigits(int n)
{
	if(n<10){
		printf("%d\n", n);
		return;
	} 
	PrintDigits(n/10);
	printf("%d\n", n%10);
}

int main(){
	PrintDigits(365);
	return 0;
}
