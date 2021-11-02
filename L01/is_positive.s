.global isPositiveU32
.global isPositiveS32

.text

//bool isPositiveU32(uint32_t x)
// x in R0, return result in R0
isPositiveU32: // unsigned are from 0 to 2^(32)-1
    CMP R0, #0 // nothing <- R0 - 0, ZF = 0, R0 = 0 else
    MOVNE R0, #1 // if R0 not zero (positive), R0 = 1 (true)
    MOVEQ R0, #0 //if R0 is zero (not positive),R0 = 0 (false)
    BX LR // return to caller, result in R0

// bool isPositiveS32(int32_t x)
// x in R0, return result in R0
isPositiveS32: // signed are from -2^(32) to 2^(32)-1
    CMP R0, #0 // nothing <- R0 - 0, ZF = 0, R0 = 0 else
    MOV R0, #1 // assume it is positive
    MOVEQ R0, #0 //if R0 is zero (not positive), R0 = 0 (false)
    MOVMI R0, #0 //if R0 is negative, R0 = 0 (false)
    BX LR // return to caller, result in R0
    