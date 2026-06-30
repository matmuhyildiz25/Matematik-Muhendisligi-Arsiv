#include<stdio.h>

int Rec_LCM(int m, int n, int common)
{	
    if (m==1 && n==1)
    {
    	return 1;
	}		
	
	if(m%common == 0 || n%common == 0)
	{
		if(m%common == 0)
			m = m / common;
		if(n%common == 0)
			n = n / common;	
		return common * Rec_LCM(m, n, common);
	}
	else{	
		return Rec_LCM(m, n, common+1);
	}	      
}

int LCM(int m, int n)
{
	return Rec_LCM(m, n, 2);
}

int main(){
	printf("%d\n", LCM(10,15));
	return 0;
}


