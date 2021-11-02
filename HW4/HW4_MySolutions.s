.global strFindN                //1
.global isStrEqual              //2A
.global strConcatenate          //2B
.global leftString              //2C
.global decimalStringToInt16    //2D

.text

// int32_t strFindN(const char str[], char c, uint32_t n)
//R0 <- str[], R1 <- c, R2 <- n
strFindN:
    PUSH {R4}            //Push value of R4 to stack
    MOV R3, R0          //R3 <- str[]
    MOV R0, #0          //R0 <- #0
strFindN_loop:
    LDRSB R4, [R3, R0]  //R4 <- str[i]
    CMP R4, R1          //str[i] == c
    BNE strFindN_next   //false? branch to strFind_next
    SUBS R2, R2, #1     //true? n-- (update flags)
    BEQ strFindN_end    //if zero, branch to strFindN_end
strFindN_next:
    ADD R0, R0, #1      //R0 <- i++
    CMP R4, #0          //str[i] == '\0'
    BNE strFindN_loop   //false? branch to strFindN_loop
    MOV R0, #-1         //true? R0 <- #-1
strFindN_end:
    POP {R4}             //Pop the value of R4 from the stack
    BX LR               //return to caller

//A)
//bool isStrEqual(const char str1[], const char str2[])
//R0 <- str1[], R1 <- str2[]
isStrEqual:
    LDRSB R2, [R0], #1  //R2 <- *(str1++)
    LDRSB R3, [R1], #1  //R3 <- *(str2++)
    CMP R2, R3          //R2 == R3
    MOVNE R0, #0        //if not equal, R0 <- #0 
    BNE isStrEqual_end  //if not equal, branch to isStrEqual_end
    CMP R3, #0          //R3 == '\0'
    MOVEQ R0, #1        //if equal, R0 <- #1
    BNE isStrEqual      //if not equal, branch to isStrEqual
isStrEqual_end:
    BX LR

//B)
//void strConcatenate(char strTo[], const char strFrom[])
//R0 <- strTo[], R1 <- strFrom[]
strConcatenate:
    LDRSB R2, [R0], #1      //R2 <- *(strTo++)
    CMP R2, #0              //R2 == '\0'
    BNE strConcatenate  
    SUB R0, R0, #1          //*(str--) (return to the address of the '\0' so it can be overridden)
strConcatenate_copy:
    LDRSB R2, [R1], #1      //R2 <- *(strFrom++)
    STRB R2, [R0], #1       //R2 -> *(strTo++)
    CMP R2, #0              //R2 == '\0'
    BNE strConcatenate_copy //if equal, branch to strConcatenate_copy
    BX LR                   //return to caller

//C)
//void leftString(char * strOut, const char * strIn, uint32_t length)
//R0 <- strOut, R1 <- strIn, R2 <- length
leftString:
    LDRSB R3, [R1], #1      //R3 <- *(strIn++)
    STRB R3, [R0], #1       //R3 -> *(strOut++)
    CMP R3, #0              //R3 == '\0'
    BEQ leftString_end      //true? branch to leftString_end
    SUBS R2, R2, #1         //false? length-- (update flags)
    BNE leftString          //if length != 0, branch to leftString 
    STRB R2, [R0]           //else, '\0' -> *(strOut) (append null terminator)
leftString_end:
    BX LR                   //return to caller

//D)
//int16_t decimalStringToInt16(const char * str)
//R0 <- str
decimalStringToInt16:
    MOV     R1, R0                      //R1 <- str
    MOV     R0, #0                      //R0 <- #0
    MOV     R3, #1                      //R3 <- #1
    LDRSB   R2, [R1], #1                //R2 <- *(str++)
    CMP     R2, '-'                     //R2 == '-'
    BNE     decimalStringToInt16_loop   //false? branch to decimalStringToInt16_loop
    MOV     R3, #-1                     //true? R3 <- #-1
    LDRSB   R2, [R1], #1                //R2 <- *(str++)
decimalStringToInt16_loop:
    CMP R2, #0                      //R2 == '\0'
    BEQ decimalStringToInt16_end    //true? branch to decimalStringToInt16_end
    SUB R2, R2, #'0'
    MOVMI R0, #0
    BMI decimalStringToInt16_end
    CMP R2, #
decimalStringToInt16_end:
    BX LR