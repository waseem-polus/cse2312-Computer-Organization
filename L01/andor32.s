.global and32
.global or32

.text
// uint32_t and32(uint32_t x, uint32_t y)
// return R0, x in R0, y in R1

and32:
    AND R0, R0, R1 // R0 <- R0 | R1
    BX LR

or32: 
    ORR R0, R0, R1 // R0 <- R0 & R1
    BX LR
    