.global sumS32          //a
.global dotpS32         //b
.global countAboveLimit //c
.global findCityAligned //d
.global findCityPacked  //e

.text

//a
//int32_t sumS32(const int32_t x[], uint32_t count)
//R0 <- x[0], R1 <- count
sumS32:
    MOV R2, R0          //R2 <- x[0]
    MOV R0, #0          //R0 <- 0
sumS32_loop:
    CMP R1, #0          //R1 == 0
    BEQ sumS32_end      //yes? go to end
    LDR R3, [R2], #4    //R3 <- *(R2)++
    ADD R0, R0, R3      //R0 += R3
    SUB R1, R1, #1      //R1--
    B sumS32_loop       //loop
sumS32_end:
    BX LR               //return to caller

//b
//int32_t dotpS32(const int32_t x[], const int32_t y[], uint32_t count) 
//R0 <- x[0], R1 <- y[0], R2 <- count
dotpS32:
    PUSH {R4,R5}        //push R4 and R5 to stack
    MOV R3, R0          //R3 <- x[0]
    MOV R0, #0          //R0 <- 0
dotpS32_loop:
    CMP R2, #0          //R2 == 0
    BEQ dotpS32_end     //yes? go to end
    LDR R4, [R1], #4    //R4 <- *(R1)++
    LDR R5, [R3]. #4    //R5 <- *(R3)++
    MLA R0, R4, R5, R0  //R0 <- R0 + (R4 * R5)
    SUB R2, R2, #1      //R2--
    B dotpS32_loop      //loop
dotpS32_end:
    POP {R4,R5}         //pop R4 and R5 from stack
    BX LR               //return to caller

//c
//uint32_t countAboveLimit(const int32_t x[], int32_t limit, uint32_t count)
//R0 <- x[0], R1 <- limit, R2 <- count
countAboveLimit:
    PUSH {R4}               //push R4 to stack
    MOV R3, R0              //R3 <- x[0]
    MOV R0, #0              //R0 <- 0
countAboveLimit_loop:
    CMP R2, #0              //R2 == 0
    BEQ countAboveLimit_end //yes? go to end
    LDR R4, [R3], #4        //R4 <- *(R3)++
    CMP R4, R1              //R4 - R1
    ADDHI R0, R0, #1        //if R4 > R1, R0++
    SUB R2, R2, #1          //R2--
    B countAboveLimit_loop
countAboveLimit_end:
    POP {R4}                //pop R4 from stack
    BX LR                   //return to caller

//d
//int32_t findCityAligned (const char city[], const BUSINESS2 business[], uint32_t count)
//R0 <- city[0], R1 <- business[0], R2 <- count
indCityAligned:
    PUSH {R4-R7, R8, R9, R10}
    MOV R5, R0	     @ backup copy of city[] to R5
    MOV R4, R1	     @ move business[0] to R4
    ADD R4, R4, #72  @ R0 = &business[0].city[0]
    MOV R3, #112     @ R2 = sizeof(BUSINESS)
    MOV R10, #0	     @ index tracker
    CMP R2, #0	     @ check if empty array
test_string:
    BEQ test_exit_not_found
    MOV R6, R4
    MOV R7, R0
test_string_loop:
    LDRSB R8, [R6], #1
    LDRSB R9, [R7], #1
    CMP R8, R9
    BNE next_business
    CMP R8, #0
    BEQ test_exit_found
    B test_string_loop
next_business:
    ADD R4, R4, R3
    ADD R10, R10, #1
    SUBS R2, R2, #1
    B test_string
test_exit_found:
    MOV R0, R10
    POP {R4-R7, R8, R9, R10}
    BX  LR
test_exit_not_found:
    MOV R0, #-1
    POP {R4-R7, R8, R9, R10}
    BX  LR

//e
//int32_t findCityPacked (const char city[], const BUSINESS2 business[], uint32_t count)
//R0 <- city[0], R1 <- business[0], R2 <- count
findCityPacked:
    PUSH {R4-R7, R8, R9, R10}
    MOV R5, R0	     @ backup copy of city[] to R5
    MOV R4, R1	     @ move business[0] to R4
    ADD R4, R4, #71  @ R0 = &business[0].city[0]
    MOV R3, #108     @ R2 = sizeof(BUSINESS)
    MOV R10, #0	     @ index tracker
    CMP R2, #0	     @ check if empty array
    B test_string