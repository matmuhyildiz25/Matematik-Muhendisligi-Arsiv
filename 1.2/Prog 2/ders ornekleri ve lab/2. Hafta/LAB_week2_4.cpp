#include<stdio.h>
#define N 5

int F(int i)
{	
	return (N-i+2) * (N-i+1) *i*i*i/2; 		      
}

int calculate(int left, int right)
{
	int center;
	printf("\n%d %d", left, right);
	center = (left + right) / 2;
	if((right - left) == 0)
	    return F(left); 	
	return calculate(left, center) + calculate(center+1, right); 		      
}

int main(){
	int k;
	k = calculate(2, N);
	printf("\n%d\n", k);
	return 0;
}


