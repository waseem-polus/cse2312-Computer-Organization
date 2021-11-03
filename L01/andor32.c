#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

extern uint32_t and32(uint32_t x, uint32_t y);
extern uint32_t or32(uint32_t x, uint32_t y);

int main()
{
  uint32_t d, e, f;
  d = 0x12345678;
  e = 0xFFFF0000;
  f = and32(d, e);
  printf("d = 0x%08x\r\n", d);
  printf("e = 0x%08x\r\n", e);
  printf("f = d & e = 0x%08x\r\n", f);
  f = or32(d, e);
  printf("d = 0x%08x\r\n", d);
  printf("e = 0x%08x\r\n", e);
  printf("f = d | e = 0x%08x\r\n", f);
  return EXIT_SUCCESS;
}

