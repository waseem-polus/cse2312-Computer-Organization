@ a. uint64_t addU32_U64(uint32_t x, uint32_t y) // returns x+y
@ b. uint64_t addU64(uint64_t x, uint64_t y) // returns x+y
@ c. int32_t convertS8ToS32(int8_t x) // converts 8-bit signed value to 32-bits
@ signedfs
@ (don’t overthink this… it is a one-line function)
@ d. int32_t convertU16ToS32(uint16_t x) // converts 16-bit unsigned value to
@ 32-bits signed
@ e. int16_t maxS16(int16_t x, int16_t y) // returns the maximum of x, y
@ f. uint32_t maxU32(uint32_t x, uint32_t y) // returns the maximum of x, y
@ g. bool isGreaterThanU16(uint16_t x, uint16_t y) // returns 1 if x>y, 0 else
@ h. bool isGreaterThanS16(int16_t x, int16_t y) // returns 1 if x>y, 0 else
@ i. int32_t shiftRightS32 (int32_t x, uint8_t p) // returns x >> p = x*2^(-p) for
@ p = 0..31
@ j. uint16_t shiftU16(uint16_t x, int8_t p) // return x*2^p for p = -31..31
@ k. bool isEqualU16(uint16_t x, uint16_t y) // returns 1 if x=y, 0 if x!=y

.global addU32_U64          @ (uint32_t x, uint32_t y) // returns x+y
.global addU64              @ (uint64_t x, uint64_t y) // returns x+y
.global convertS8ToS32      @ (int8_t x) // converts 8-bit signed value to 32-bits
.global convertU16ToS32     @ (uint16_t x) // converts 16-bit unsigned value to 32-bits signed
.global maxS16              @ (int16_t x, int16_t y) // returns the maximum of x, y
.global maxU32              @ (uint32_t x, uint32_t y) // returns the maximum of x, y
.global isGreaterThanU16    @ (uint16_t x, uint16_t y) // returns 1 if x>y, 0 else
.global isGreaterThanS16    @ (int16_t x, int16_t y) // returns 1 if x>y, 0 else
.global shiftRightS32       @ (int32_t x, uint8_t p) // returns x >> p = x*2^(-p) for 0..31
.global shiftU16            @ (uint16_t x, int8_t p) // return x*2^p for p = -31..31
.global isEqualU16          @ (uint16_t x, uint16_t y) // returns 1 if x=y, 0 if x!=y


.text

addU32_U64:
    MOV     R2, R1
    MOV     R1, #0
    ADDS    R0, R0, R2
    ADC     R1, R1, #0
    BX  LR
      
addU64:
    ADDS    R0, R0, R2
    ADC     R1, R1, R3
    BX  LR
    
convertS8ToS32:
    BX  LR
    
convertU16ToS32:
    BX  LR
    
maxS16:
    CMP R0, R1
    MOVLT   R0,R1
    BX  LR
maxU32:
    CMP R0, R1
    MOVLO   R0, R1
    
isGreaterThanU16:
    CMP R0, R1
    MOVLS   R0, #1
    MOVHI   R0, #0
    BX  LR
    
isGreaterThanS16:
    CMP R0, R1
    MOVLE   R0, #0
    MOVGT   R0, #1
    BX  LR
    
shiftRightS32:
    ASR R0, R0, R1
    BX  LR
    
shiftU16:
    CMP R1, #0          //R1 - 0
    BMI right_shift     //if R1 is negative, branch to right_shift without saving current location
    MOV R0, R0, LSL R1  //R0 <- R0 << R1
    BX  LR              //return to caller 
  right_shift:
    MVN R1,R1           //R1 <- -R1
    ADD R1,R1, #1       //R1 <- R1 + 1
    MOV R0, R0, LSR R1  //R0 <- R0 >> R1
    BX  LR              //return to caller
    
isEqualU16:
    CMP R0, R1
    MOVEQ   R0, #1
    MOVNE   R0, #0
    BX  LR
