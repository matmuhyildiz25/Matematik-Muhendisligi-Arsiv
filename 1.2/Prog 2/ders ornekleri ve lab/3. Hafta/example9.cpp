#include <stdio.h>
#include <math.h>
float T_iter(float x,int n){
	int f,i;
	float sum;
	for(i=0; i<=n; i+=1){
		if(i<=0){
			f=1;
			sum=x;
		}
		else{
			f*=i*(i+1);
			sum+=(pow(-1,i)*pow(x,2*n))/f;
		}
	}
	return sum;
}

int f(int a){
	if(a<=0)
		return 1;
	return a*f(a-1);
}


float T(float x, int n){
	if(n==0)
		return x;
	return T(x,n-1)+(pow(-1,n)*pow(x,2*n))/f(2*n);
}

int main(){
	int n;
	float x;
	printf ("x degerini giriniz:");
	scanf("%f", &x);
	printf ("n degerini giriniz:");
	scanf("%d", &n);
	printf("%f\n", T_iter(x,n));//Hatali fonksiyon duzeltilmesi gerekiyor.
	printf("%f", T(x,n));
	return 0;
}
