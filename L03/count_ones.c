// C99
#include <stdlib.h> // EXIT_SUCCESS
#include <stdio.h>  // printf
#include <stdint.h> // C99 uintX_t and intX_t types

extern uint32_t countOnes32(uint32_t x);

int main(void)
{
    uint32_t a, c;
    a = 0x12345678;
    c = countOnes32(a);
    printf("The number of 1 bits in 0x%08x is %u\n", a, c);

    return EXIT_SUCCESS;
}


