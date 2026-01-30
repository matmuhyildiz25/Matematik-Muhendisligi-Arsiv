#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    int A[][] , B[][];
    int i, j, n, m, sutunA, satirA, sutunB, satirB;

    printf("A dizisinin kac sutundan olusacagini giriniz:\nA dizisinin kac satirdan olusacagini giriniz:\n");
    scanf("%d %d" , &sutunA, &satirA);

    printf("B dizisinin kac sutundan olusacagini giriniz:\nB dizisinin kac satirdan olusacagini giriniz:\n");
    scanf("%d %d" , &sutunB, &satirB);

    for(i=0 ; i<satirA ; i++)
    {
        for(j=0 ; j<sutunA ; j++)
        {
        A[i][j] = rand();
        printf("%d\t" , A[i][j]);
        }
    }

    for(n=0 ; n<satirB ; n++)
    {
        for(m=0 ; m<sutunB ; m++)
        {
        B[n][m] = rand();
        printf("%d\t" , B[n][m]);
        }

    }

    return 0;
}