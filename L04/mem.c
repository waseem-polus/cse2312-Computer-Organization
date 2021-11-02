// C99

#include <stdio.h>  // printf
#include <stdint.h> // C99 uintX_t and intX_t types

extern void writeU32(uint32_t *p, uint32_t x);
extern uint32_t readU32(uint32_t *p);
extern void writeS32(int32_t *p, int32_t x);
extern int32_t readS32(int32_t *p);
extern void writeU16(uint16_t *p, uint16_t x);
extern uint16_t readU16(uint16_t *p);
extern void writeS16(int16_t *p, int16_t x);
extern int16_t readS16(int16_t *p);
extern void writeU8(uint8_t *p, uint8_t x);
extern uint8_t readU8(uint8_t *p);
extern void writeS8(int8_t *p, int8_t x);
extern int8_t readS8(int8_t *p);

/*
void writeU32(uint32_t *p, uint32_t x)
{
    *p = x; // dereference pointer and write x to memory
}

uint32_t readU32(uint32_t *p)
{
    return *p; // dereference pointer read from memory
}
*/

int main(void)
{
    uint32_t a; // a is on stack
    printf("&a = %p\n", &a); // printf location of a on stack
    writeU32(&a, 0x12345678);
    printf("a = 0x%08x\n", readU32(&a));

    int32_t b; // b is on stack
    printf("&b = %p\n", &b); // printf location of b on stack
    writeS32(&b, -1000000);
    printf("b = %d\n", readS32(&b));

    uint16_t c; // c is on stack
    printf("&c = %p\n", &c); // printf location of c on stack
    writeU16(&c, 0x90AB);
    printf("c = %hu\n", readU16(&c));

    int16_t d; // d is on stack
    printf("&d = %p\n", &d); // printf location of d on stack
    writeS16(&d, -10000);
    printf("d = %hd\n", readS16(&d));

    uint8_t e; // e is on stack
    printf("&e = %p\n", &e); // printf location of e on stack
    writeU8(&e, 0xCD);
    printf("e = %hhu\n", readU8(&e));

    int8_t f; // f is on stack
    printf("&f = %p\n", &f); // printf location of f on stack
    writeS8(&f, -100);
    printf("f = %hhd\n", readS8(&f));

    return 0;
}


