.global meanF64

.text

meanF64: 
    MOV R2, #0          //R2 <- 32bit zero
    VMOV D0, R2, R2     //D0 <- R2:R2
    VMOV S4, R1
    CMP R1, #0          //R1 == 0
    BEQ sumF64_error    //yes? branch
meanF64:
    VLDR D1, [R0]       //Vector load (D0 <- *(R0))
    ADD R0, R0, #8      //R0++
    VADD.F64 D0, D0, D1 //D0 += D1 (Vector add floating 64 bit num)
    SUBS R1, R1, #1     //R1--
    BNE sumF64          //loop
meanF64_end:
    VCVT.F64.U32 D1, S4 //D1 <- (64bit Float) S4
    VDIV.F64 D0, D0, D1 //D0 <- D0/D1
meanF64_error:
    BX LR               //return to caller