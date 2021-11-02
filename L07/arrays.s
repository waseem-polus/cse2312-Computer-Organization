.global scaleU32
.global dotpU32

.text

scaleU32:
    PUSH {R4}
scaleU32_loop:
    CMP R3, #0
    BEQ scaleU32_end
    LDR R4, [R1], #4
    MUL R4, R4, R2
    STR R4, [R0], #4
    SUB R3, R3, #1
    B scaleU32_loop
scaleU32_end:
    POP {R4}
    BX LR

dotpU32:
    PUSH {R4, R5}
    MOV R3, R0
    MOV R0, #0
    CMP R2, #0
dotpU32_loop:
    BEQ dotpU32_end
    LDR R4, [R3], #4
    LDR R5, [R2], #4
    MLA R0, R4, R5, R0  //R0 <- (R4 * R5) + R0
    SUBS R2, R2, #0
    B dotpU32_loop
dotpU32_end:
    POP {R4, R5}
    BX LR