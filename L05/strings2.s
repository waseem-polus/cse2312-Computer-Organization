.global strLength
.global strFind
.global strFindN

.text

strLength:
    MOV R1, R0          //R1 <- &str[0]
    MOV R0, #0          //R0 <- 0
sreLength_loop:
    LDRSB R2, [R1, R0]  //R2 <- *(R1+R0) OR R2 <- str[R0]
    CMP R2, #0          //compare R2 and 0 (if R2 == null)
    BEQ strLength_end   //if zero return
    ADD R0, R0, #1      //if not zero, R0++
    B sreLength_loop    //next itteration of loop
strLength_end
    BX LR               //return to caller

strFind:
    MOV R2, R0
    MOV R0, #0
strFind_loop:
    LDRSB R3, [R2, R0]
    CMP R3, #0
    BEQ strFind_reachedNullTerminator:
    CMP R3, R1
    BEQ strFind_end
    ADD R0, R0, #1
    B strFind_loop
strFind_reachedNullTerminator:
    MOV R0, #-1
strFind_end:
    BX LR

strFindN:
    MOV R3, R0
    MOV R0, #0
strFindN_loop:
    PUSH {R4}
    LDRSB R4, [R3, R0]
    CMP R4, #0
    BEQ strFindN_reachedNullTerminator:
    CMP R4, R1
    BEQ strFindN_next
    B strFindN_loop
strFindN_next:
    ADD R0, R0, #1
    SUBS R2, R2, #1
    BEQ strFindN_end
    B strFindN_loop
strFindN_reachedNullTerminator:
    MOV R0, #-1
strFindN_end:
    POP {R4}
    BX LR
