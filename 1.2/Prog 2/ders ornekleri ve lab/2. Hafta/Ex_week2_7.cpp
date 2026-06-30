#include<stdio.h>

int rec(int n)
{	
    if (n<1)
    	return 1;
			
	return n + rec(n-1) + rec(n-2);	      
}

int iter(int n)
{
	int i, ti, t1=1, t2=1; 	
    for(i=1;i<=n;i++){
    	ti = i + t1 + t2;
    	t2 = t1;
    	t1 = ti;
	}			
	return ti;      
}

int main(){
	printf("%d\n", rec(8));
	printf("%d\n", iter(8));
	return 0;
}


