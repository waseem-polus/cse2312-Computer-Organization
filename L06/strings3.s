.global strMid

.text

//void strMid(char strTo[], char strFrom[], uint32_t offset, uint32_t length)
strMid:
    PUSH{R4, R5}
strMid_loop1:
    LDRSB R5, [R1], #1
    CMP R5, #0
    BEQ strMid_end
    SUBS R2, R2, #1
    BNE strMid_loop1
strMid_loop2:
    LDRSB R5, [R1], #1
    CMP R5, #0
    BEQ strMid_end
    SUBS R3, R3, #1
    BNE strMid_loop2
    STR R5, [R0], #1
strMid_end:
    MOV R4, #0
    STR R4, [R0]
    POP{R4, R5}
    BX LR
