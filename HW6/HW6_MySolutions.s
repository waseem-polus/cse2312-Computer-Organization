.global sumF32  //1.a
.global prodF64 //1.b
.global dotpF64 //1.c
.global maxF32  //1.d

.text

//1.a
//float sumF32(const float x[], uint32_t count)
//R0 <- x[], R1 <- count
sumF32:
    CMP R1, #0              //count == 0
    BEQ sumF32_end          //true? go to end
    VLDR S0, [R0]           //S0 <- x[0]
    ADD R0, R0, #4          //R0 <- &x[1]
sumF32_loop:
    SUBS R1, R1, #1         //count--, update flags
    BEQ sumF32_end          //if zero, go to end
    VLDR S1, [R0]           //S1 <- x[i]
    ADD R0, R0, #4          //R0 <- &x[i++]
    VADD.F32 S0, S0, S1     //S0 += S1
    B sumF32_loop           //go to loop
sumF32_end:
    BX LR                   //return to caller

//1.b
//double prodF64(const double x[], uint32_t count)
//R0 <- x[], R1 <- count
prodF64:
    CMP R1, #0              //count == 0
    BEQ prodF64_end         //true? go to end
    VLDR D0, [R0]           //D0 <- x[0]
    ADD R0, R0, #8          //R0 <- &x[1]
prodF64_loop:
    SUBS R1, R1, #1         //count--, update flags
    BEQ prodF64_end         //if zero, go to end
    VLDR D1, [R0]           //D1 <- x[i]
    ADD R0, R0, #8          //R0 <- &x[i++]
    VMUL.F64 D0, D0, D1     //D0 *= D1
    B prodF64_loop          //go to loop
prodF64_end:
    BX LR                   //return to caller

//1.c
//double dotpF64(const double x[], const double y[],uint32_t count)
//R0 <- x[], R1 <- y[], R2 <- count
dotpF64:
    CMP R2, #0              //count == 0
    BEQ dotpF64_end         //true? go to end
dotpF64_loop:
    VLDR D1, [R0]           //D1 <- x[i]
    ADD R0, R0, #8          //R0 <- &x[i++]
    VLDR D2, [R1]           //D2 <- y[i]
    ADD R1, R1, #8          //R1 <- &y[i++]
    VMLA.F64 D0, D1, D2     //D0 += D1 * D2
    SUBS R2, R2, #1         //count --, update flags
    BNE dotpF64_loop        //if !zero, go to loop
dotpF64_end:
    BX LR                   //return to caller

//1.d
//float maxF32(const float x[], uint32_t count)
//R0 <- x[], R1 <- count
maxF32:
    VSUB S0, S0, S0
    CMP R1, #0
    BEQ maxF32_end
maxF32_loop:
    
maxF32_end:
    BX LR