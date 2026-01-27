#include <stdio.h>
#include <stdlib.h>

int main()
{
    float a , b , c , max , other1 , other2;
    const char *triangleType , *kind;

    //checking whether the given numbers can create a real triangle
    do
    {
    printf("Enter value for 'a' side: \tEnter value for 'b' side: \tEnter value for 'c' side: \t");
    scanf("%f %f %f" , &a , &b , &c);
    if(!(a+b>c && a+c>b && b+c>a))
    {
        printf("Please enter accurate values to create a real triangle\t");
    }
    } while(!(a+b>c && a+c>b && b+c>a));

    if(a==b && a==c && b==c)
    {
        triangleType = "Equilateral";
    }
    else if(a==b || a==c || b==c)
    {
        triangleType = "İsosceles";
    }
    else
    {
        triangleType = "Scalene";
    }
    //detecting the longest side of triangle
    if(a>b && a>c)
    {
        max = a;
        other1 = b;
        other2 = c;
    }
    if(b>b && b>c)
    {
        max = b;
        other1 = a;
        other2 = c;
    }
    if(c>a && c>b)
    {
        max = c;
        other1 = a;
        other2 = b;
    }

    //determining that the triangle's type by one of its angle
    if((max * max) > ((other1 * other1) + (other2 * other2)))
    {
        kind = "Obtuse angled";
    }
    else if((max * max) < ((other1 * other1) + (other2 * other2)))
    {
        kind = "Acute angled";
    }
    else
    {
        kind = "Right-Angled";
    }

    printf("Your triangle is: %s and %s" , triangleType , kind);
    return 0;
}