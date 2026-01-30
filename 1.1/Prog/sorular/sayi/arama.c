#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    int A[50], i, number, cont = 1;
    srand(time(NULL));

    for(i=0 ; i<50 ; i++)
    {
        A[i] = rand()%100;
        printf("%d\t" , A[i]);
    }

    printf("Aramak istediginiz sayiyi giriniz:\n");
    scanf("%d" , &number);
    

    for(i=0 ; i<50 ; i++)
    {
        if(number == A[i])
        {
        cont = 0;
        printf("Girdiginiz %d elemani %d. indisli eleman olarak mevcuttur." , number , i);
        }
    }
    
    if(cont == 1)
    {
        printf("Girdiginiz %d elemani bu dizide bulunmamaktadir." , number);
    }
    
    return 0;
}