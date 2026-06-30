#include<stdio.h>

int F(int a, int b)
{
	int t;
	if(a==0) return b;
	printf("%d %d\n", a, b);
	t = a;
	a = b%t;	
	return F(a, t); 		      
}

int main(){
	int x=115, c, y=4;
	c = F(x,y);
	printf("%d\n", c);
	
	return 0;
}


