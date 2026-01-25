#include <stdio.h>
#include <stdlib.h>

int main()
{
    int bookPrice , orderQuantity , lackBook50 , lackBook30;
    float discountRate1 , discountRate2 , discountPrice , sum , price30 , price50 , sum30 , sum50;
    orderQuantity = 0;
    discountRate1 = 0.5;
    discountRate2 = 0.3;

    printf("Enter an integer book price:\tEnter order quantity to compute discount rate:\n");
    scanf("%d %d" , &bookPrice , &orderQuantity);

    if(orderQuantity>=50)
    {
        discountPrice = bookPrice * (1 - discountRate1);
        sum = discountPrice * orderQuantity;
        printf("As you are an obedient client you have 50%% discount so you need to pay %f for each book you get\tTotal price: %f" , discountPrice , sum);
    }
    else if(orderQuantity>=10 && orderQuantity<50)
    {
        discountPrice = bookPrice * (1 - discountRate2);
        sum = discountPrice * orderQuantity;
        printf("As you have ordered much, we provide you 30%% discount so you need to pay %f for each book\tTotal price: %f" , discountPrice , sum);
    }
    else
    {
        lackBook30 = 10 - orderQuantity;
        lackBook50 = 50 - orderQuantity;
        price50 = bookPrice * (1 - discountRate1);
        sum50 = 50 * price50;
        price30 = bookPrice * (1 - discountRate2);
        sum30 = 10 * price30;
        sum = bookPrice * orderQuantity;
        printf("Sorry, you didn't deserve discount\tTotal price: %f\t but if you add %d more books you can save 30%% (pay %f for each book) or add %d in order to obtain 50%% discount (pay %f for each book)\tIf you had got minimum order quantity for %%30 discount you would pay: %f\tIf you had got minimum order quantity for %%50 discount you would pay: %f" , sum , lackBook30 , price30 ,lackBook50 , price50 , sum30 , sum50);
    }

    return 0;
}