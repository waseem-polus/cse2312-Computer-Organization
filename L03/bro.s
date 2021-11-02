.global bro32

.text

//uint32_t bro(uint32_t x)
//R0 output
//R1 input
//R2 test mask
//R3 apply mask
bro32:
    MOV R1, R0              //move original value into R1
    MOV R0, #0              //move zero into R0 (result)
    MOV R2, #0x80000000     //test mask with bit 31 set
    MOV R3, #0x00000001     //apply mask with bit 0 set
bro_loop:
    TST R1, R2              //return 0 if bit not set, non-zero if bit set
    ORRNE R0, R0, R3        //if bit in R1 set, set bit in R0
    MOVS R2, R2, LSR #1     //move mask bit to the right
    MOV R3, R3, LSL #1      //move mask bit to the left
    BNE bro_loop            //loop back for remaining 31 bits
    BX LR                   //return to caller
