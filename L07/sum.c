// C99

#include <stdio.h>  // printf
#include <stdint.h> // C99 uintX_t and intX_t types

// sum element of array modulo 2^32
extern uint32_t sumU32(const uint32_t x[], uint32_t count);

/*
// C version of our assembly function
uint32_t sumU32(const uint32_t x[], uint32_t count)
{ 
   uint32_t sum = 0;
   while (count> 0)
   {
      sum += *(x++);
      count--;
   }
    return sum;
}
*/

#define COUNT 3
int main(void)
{
    uint32_t x[COUNT] = {10, 20, 30};
    uint32_t sum = sumU32(x, COUNT); 
    printf("Sum of elements in x is %u\n", sum);
    
    return 0;
}


