// C99

#include <stdio.h>  // printf
#include <stdint.h> // C99 uintX_t and intX_t types
#include <stdbool.h> // C99 bool type

extern bool isPositiveU32(uint32_t x);
extern bool isPositiveS32(int32_t x);

int main(void)
{
    uint32_t x;
    x = 2;
    if (isPositiveU32(x))
        printf("x = %u is positive\n", x);
    else
        printf("x = %u is not positive (zero)\n", x);        

    x = 0;
    if (isPositiveU32(x))
        printf("x = %u is positive\n", x);
    else
        printf("x = %u is not positive (zero)\n", x);        

    int32_t y;
    y = 2;
    if (isPositiveS32(y))
        printf("y = %d is positive\n", y);
    else
        printf("y = %d is not positive\n", y);        

    y = 0;
    if (isPositiveS32(y))
        printf("y = %d is positive\n", y);
    else
        printf("y = %d is not positive\n", y);        

    y = -2;
    if (isPositiveS32(y))
        printf("y = %d is positive\n", y);
    else
        printf("y = %d is not positive\n", y);        
    return 0;
}


