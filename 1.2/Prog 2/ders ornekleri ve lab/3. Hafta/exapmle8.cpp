#include <stdio.h>
int F_iter(int n){
	int i,sum=1;
	for(i=1;i<=n; i++)
		sum+=(i-1)*(i+1);
	return sum;
}
int F(int n){
	int sum;
	if(n<=0)
		return 1;
	return (n-1)*(n+1)+F(n-1);
}

int main(){
	int n;
	scanf("%d", &n);
	printf("%d\n", F_iter(n));
	printf("%d", F(n));
	return 0;
}
