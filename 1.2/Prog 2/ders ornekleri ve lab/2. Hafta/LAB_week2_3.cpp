#include<stdio.h>

int F(int n, int x)
{	
    if (n<1)
    	return 0;
	
	return (n%11)/(x+1) + F(n/2, ++x); 		      
}

int main(){
	int n = 15, i, x;
	for(i=10; i<=n; i++)
	{
		x = F(i,2);
		printf("\n%d  %d", i, x);
	}
	
	return 0;
}


