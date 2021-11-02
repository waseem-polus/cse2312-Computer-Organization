.global countOnesS32

.text

// uint32_t countOneS32(uint_t x)
countOnesS32:
    MOV R1, R0
    MOV R0, #0
    MOV R2, #0x80000000
co_loop:
    TST R1, R2
    ADDNE R0, R0, #1
    MOVS R0, R0, LSL #1
    BNE co_loop
    BX LR