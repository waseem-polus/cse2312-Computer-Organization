#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

extern bool isEven(uint32_t x);

int main()
{
    uint32_t x;
    x = 2;
    if (isEven(x))
        printf("%u is even\n", x);
    else
        printf("%u is odd\n", x);
    x = 3;
    if (isEven(x))
        printf("%u is even\n", x);
    else
        printf("%u is odd\n", x);
    return EXIT_SUCCESS;
}

