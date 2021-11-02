.global addU32_U64
.global addU64
.global convertS8ToS32
.global convertU16ToS32
.global maxS16
.global maxU32
.global isGreaterThanU16
.global isGreaterThanS16
.global shiftRightS32
.global shiftU16
.global isEqualU16

.text

// uint64_t addU32_U64(uint32_t x, uint32_t y) 
addU32_U64:
    ADDS R0, R0, R1     //R0 <- R0 + R1, update flags
    MOV R1, #0          //R1 <- 0
    MOVCS R1, #1        //if carry flag set, R1 <- 1
    BX LR               //return to caller

// uint64_t addU64(uint64_t x, uint64_t y) 
addU64:
    ADDS R0, R0, R2     //R0 <- R0 + R2
    ADC R1, R1, R3      //R1 <- R1 + R3 + Carry flag
    BX LR               //return to caller

// int32_t convertS8ToS32(int8_t x)
convertS8ToS32:
// int32_t convertU16ToS32(uint16_t x)
convertU16ToS32:
    BX LR               //return to caller (when loaded into the reg, it is auto converted to 32 bit)

// int16_t maxS16(int16_t x, int16_t y)
maxS16:
    CMP R0, R1          //Compare R0 and R1 (R0 - R1)
    MOVLT R0, R1        //If R0 < R1, R0 <- R1
    BX LR               //return to caller

// uint32_t maxU32(uint32_t x, uint32_t y)
maxU32:
    CMP R0, R1          //Compare R0 and R1 (R0 - R1)
    MOVLS R0, R1        //if R0 <= R1, R0 <- R1
    BX LR               //return to caller

// bool isGreaterThanU16(uint16_t x, uint16_t y)
isGreaterThanU16:
    CMP R0, R1          //Compare R0 and R1 (R0 - R1)
    MOV R0, #0          //R0 <- 1
    MOVLS R0, #1        //if R0 <= R1, R0 <- 0
    BX LR               //return to caller 

// bool isGreaterThanS16(int16_t x, int16_t y)
isGreaterThanS16:
    CMP R0, R1          //Compare R0 and R1 (R0 - R1)
    MOV R0, #0          //R0 <- 0
    MOVGE R0, #1        //if R0 <= R1, R0 <- 1
    BX LR               //return to caller

// int32_t shiftRightS32 (int32_t x, uint8_t p)
shiftRightS32:
    ASR R0, R0, R1      //R0 <- (R0 >> R1)
    BX LR               //return to caller

// uint16_t shiftU16(uint16_t x, int8_t p)
shiftU16:
    CMP R1, #0              //R1 - 0
    BMI right_shift         //if R1 < 0, branch to right_shift (without savign way back)
    MOV R0, R0, LSL R1      //else, R0 <- (R0 << R1)
    BX LR                   //return to caller
    right_shift:
        MVN R1, R1          //R1 <- -R1 (part 1/2 of getting the negative value of R1)
        ADD R1, R1, #1      //R1 <- R1 + 1 (part 2/2 of getting the negative value of R1)
        MOV R0, R0, LSR R1  //R0 <- R0 >> R1
        BX LR               //return to caller

// bool isEqualU16(uint16_t x, uint16_t y)
isEqualU16:
    CMP R0, R1          //R0 - R1
    MOV R0, #1          //R0 <- 1
    MOVNE R0, #0        //if R0 != R1, R0 <- 0
    BX LR               //return to caller
