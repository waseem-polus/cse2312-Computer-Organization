.global isEven

.text
// bool isEven(uint32_t x)
// x in R0, return result in R0
isEven: 
    AND R0, #1 //if x is odd, R0 == 1; else R0 = 0
    RSB R0, R0, #1  // R0 <- (1 - R0)
                    // R0 = 1 if even, R0 = 0 if odd
    BX LR //return to caller, result in R0
    