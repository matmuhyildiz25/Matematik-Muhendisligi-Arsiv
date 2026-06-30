#include<stdio.h>

int F_rec(int n)
{	
    if (n<3)
    	return n;
			
	return n%3 + F_rec(n/3);	      
}

int F_iter(unsigned int n)
{
	int k=0; 	
    while(n>0){
    	k += n%3;
    	n /= 3;
	}			
	return k;      
}

int main(){
	printf("%d\n", F_rec(4));
	printf("%d\n", F_iter(4));
	return 0;
}


