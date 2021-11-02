.global sumU32

.text

sumU32:
    MOV R2, R0
    MOV R0, #0
sumU32_loop:
    CMP R1, #0
    BEQ sumU32_end
    LDR R3, [R2], #4    //R3 <- *(x++)
    ADD R0, R0, R3
    SUB R1, R1, #1
    B sumU32_loop
sumU32_end:
    BX LR