#include<stdio.h>

void F(int a)
{
	if(a<5)
		return;
	a--;
	F(a);
	printf("%d\n",a);
	return;
}

int main()
{
	int a=7;
	F(a);
	printf("main %d\n", a);

}
