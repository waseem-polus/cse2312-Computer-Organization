#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

extern uint32_t lsl32(uint32_t x, uint32_t p);
extern uint32_t lsr32(uint32_t x, uint32_t p);
extern int32_t asl32(int32_t x, uint32_t p);
extern int32_t asr32(int32_t x, uint32_t p);
// extern means function instance is not in this object... in another object (C or asm)
// linker resolves the externs in C with .def or .global in ASM code
// not an assembly thing... it is a C keyboard used to tell linker 
// this function must be found in another object
// example extern printf(char* format, ....) this line of code in stdio.h
// extern means in the c library object

int main()
{
    uint32_t shift = 2;
    uint32_t a, b, c;
    int32_t d, e, f;

    a = 8;
    b = lsl32(a, shift);
    c = lsr32(a, shift);
    printf("a = %u\n", a);
    printf("b = a << %u = %u\n", shift, b);
    printf("c = a >> %u = %u\n", shift, c);

    d = -8;
    e = asl32(d, shift);
    f = asr32(d, shift);
    printf("d = %d\n", d);
    printf("e = d << %u = %d\n", shift, e);
    printf("f = d >> %u = %d\n", shift, f);

    d = 8;
    e = asl32(d, shift);
    f = asr32(d, shift);
    printf("d = %d\n", d);
    printf("e = d << %u = %d\n", shift, e);
    printf("f = d >> %u = %d\n", shift, f);

    return EXIT_SUCCESS;
}

