//Vector floating point (VFP) processor
//They have a number of registers that can handle floating point numbers (S0 and S1 are D0; S2 and S3 are D1)

.global sumF64

.text

//double sumF64(const double x[], uint32_t count)
//x[0] -> R0, Count -> R1
sumF64: 
    MOV R2, #0          //R2 <- 32bit zero
    VMOV D0, R2, R2     //D0 <- R2:R2
sumF64:
    CMP R1, #0          //R1 == 0
    BEQ sumF64_end      //yes? branch
    VLDR D1, [R0]       //Vector load (D0 <- *(R0))
    ADD R0, R0, #8      //R0++
    VADD.F64 D0, D0, D1 //D0 += D1 (Vector add floating 64 bit num)
    SUB R1, R1, #1      //R1--
    B sumF64            //loop
sumF64_end:
    BX LR               //return to caller