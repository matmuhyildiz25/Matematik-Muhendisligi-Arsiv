#include<stdio.h>

void fonk(int k)
{
	printf("k = %d\n",k);
	k++;
	if(k>3) 
		return;
	fonk(k);
	printf("fonk (1) was called. \n");	
	fonk(k);
	printf("fonk (1) was called. \n");
}

int main(){
	int n=1;
	fonk(n);
	printf("The function was called in main\n");
}
