.global lsl32 //logical shift left
.global lsr32 //logical shift right
.global asl32 //arithmatic shift left
.global asr32 //arithmatic shift right

.text

lsl32:
asl32:
    MOV R0, R0, LSL R1  //R0 <- (R0 LSL R1)
    BX LR               //Return to caller

lsr32:
    MOV R0, R0, LSR R1  //R0 <- (R0 LSR R1)
    BX LR               //Return to caller

asr32:
    MOV R0, R0, ASR R1  //R0 <- (R0 ASR R1)
    BX LR               //Return to caller
