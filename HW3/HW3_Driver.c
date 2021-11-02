#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

extern uint64_t addU32_U64(uint32_t x, uint32_t y);     // returns x+y
extern uint64_t addU64(uint64_t x, uint64_t y);         // returns x+y
extern int32_t convertS8ToS32(int8_t x);                // converts 8-bit signed value to 32-bits
extern int32_t convertU16ToS32(uint16_t x);             // converts 16-bit unsigned value to
extern int16_t maxS16(int16_t x, int16_t y);            // returns the maximum of x, y
extern uint32_t maxU32(uint32_t x, uint32_t y);         // returns the maximum of x, y
extern bool isGreaterThanU16(uint16_t x, uint16_t y);   // returns 1 if x>y, 0 else
extern bool isGreaterThanS16(int16_t x, int16_t y);     // returns 1 if x>y, 0 else
extern int32_t shiftRightS32 (int32_t x, uint8_t p);    // returns x >> p = x*2^(-p) for
extern uint16_t shiftU16(uint16_t x, int8_t p);         // return x*2^p for p = -31..31
extern bool isEqualU16(uint16_t x, uint16_t y);         // returns 1 if x=y, 0 if x!=y

int main (void) {
    
    uint32_t a = 4294901760, b = 4294901759;
    // should = 8589803519
    printf("Question a, addU32_U64: Correct answer = %lld\n", ((uint64_t)a + (uint64_t)b));
    printf("Question a, addU32_U64: Student answer = %lld\n\n", addU32_U64(a, b));
    
    uint64_t c = 829576213741, d = 46394677278;
    // should be 875970891019
    printf("Question b, addU64: Correct answer = %lld\n", ((uint64_t)c + (uint64_t)d));
    printf("Question b, addU64: Student answer = %lld\n\n", addU64(c, d));

    int8_t e = -7;
//    convertS8ToS32(e);
    printf("Question c, convertS8toS32: Correct answer = %d\n", (int32_t)e);
    printf("Question c, convertS8toS32: Student answer = %d\n\n", convertS8ToS32(e));
    uint16_t f = 254;
//    convertU16ToS32(f);
    printf("Question d, convertU16toS32: Correct answer = %d\n", (uint32_t)f);
    printf("Question d, convertU16toS32: Student answer = %d\n\n", convertU16ToS32(f));
    
    int16_t g = -100;
    int16_t h = -5000;
//    maxS16(g,h);
    printf("Question e pt1, maxS16: Correct answer = %hd\n", g);
    printf("Question e pt1, maxS16: Student answer = %hd\n", maxS16(g,h));
    printf("Question e pt2, maxS16: Correct answer = %hd\n", g);
    printf("Question e pt2, maxS16: Student answer = %hd\n\n", maxS16(h,g));
    
    uint16_t i = 500, j = 7500;
//    maxU16(i,j);
    printf("Question f pt1, convertS8toS32: Correct answer = %hu\n", j);
    printf("Question f pt1, convertS8toS32: Student answer = %hu\n", maxS16(i,j));
    printf("Question f pt2, convertS8toS32: Correct answer = %hu\n", j);
    printf("Question f pt2, convertS8toS32: Student answer = %hu\n\n", maxS16(j,i));
    
    int16_t k = 0x8FFF, l = 3200;
    //isGreaterThanU16
    printf("Question g pt1, isGreaterThanU16: Correct answer = %d\n", 1);
    printf("Question g pt1, isGreaterThanU16: Student answer = %d\n", isGreaterThanU16(l,k));
    printf("Question g pt2, isGreaterThanU16: Correct answer = %d\n", 0);
    printf("Question g pt2, isGreaterThanU16: Student answer = %d\n\n", isGreaterThanU16(k,l));

    //isGreaterThanS16
    printf("Question h pt1, isGreaterThanS16: Correct answer = %d\n", 0);
    printf("Question h pt1, isGreaterThanS16: Student answer = %d\n", isGreaterThanS16(i,j));
    printf("Question h pt2, isGreaterThanS16: Correct answer = %d\n", 1);
    printf("Question h pt2, isGreaterThanS16: Student answer = %d\n\n", isGreaterThanS16(j,i));
    
    int32_t m = 4098;
    uint8_t n = 4;
    // shiftRightS32
    printf("Question i, shiftRightS32: Correct answer = %d\n", 256);
    printf("Question i, shiftRightS32: Student answer = %d\n\n", shiftRightS32(m,n));
    
    //shiftU16
    printf("Question j pt1, shiftU16: Correct answer = %d\n", 64);
    printf("Question j pt1, shiftU16: Student answer = %hd\n", shiftU16(m,5));
    printf("Question j pt2, shiftU16: Correct answer = %d\n", 128);
    printf("Question j pt2, shiftU16: Student answer = %hd\n\n", shiftU16(m,-5));
    
    uint16_t o = 4095, p = 4096;
    // isEqualU16
    printf("Question k pt1, isEqualU16: Correct answer = %d\n", 1);
    printf("Question k pt1, isEqualU16: Student answer = %d\n", isEqualU16(o,o));
    printf("Question k pt2, isEqualU16: Correct answer = %d\n", 0);
    printf("Question k pt2, isEqualU16: Student answer = %d\n\n", isEqualU16(o,p));
    
    return 0;
}
