.global strLength

.text

@ strLength:
@     MOV R1, R0          //R1 <- &str[0]
@     MOV R0, #0          //R0 <- 0
@ sreLength_loop:
@     LDRSB R2, [R1]      //R2 <- *R1 OR R2 <- str[]
@     ADD R1, R1, #1      //&str[0]++
@     CMP R2, #0          //compare R2 and 0 (if R2 == null)
@     BEQ strLength_end   //if zero return
@     ADD R0, R0, #1      //if not zero, R0++
@     B sreLength_loop    //next itteration of loop
@ strLength_end
@     BX LR               //return to caller

@ strLength:
@     MOV R1, R0          //R1 <- &str[0]
@     MOV R0, #0          //R0 <- 0
@ sreLength_loop:
@     LDRSB R2, [R1], #1  //R2 <- *R1 OR R2 <- str[0], THEN &str[]++
@     CMP R2, #0          //compare R2 and 0 (if R2 == null)
@     BEQ strLength_end   //if zero return
@     ADD R0, R0, #1      //if not zero, R0++
@     B sreLength_loop    //next itteration of loop
@ strLength_end
@     BX LR               //return to caller

strLength:
    MOV R1, R0          //R1 <- &str[0]
    MOV R0, #0          //R0 <- 0
sreLength_loop:
    LDRSB R2, [R1, R0]  //R2 <- *(R1+R0) OR R2 <- str[R0]
    CMP R2, #0          //compare R2 and 0 (if R2 == null)
    BEQ strLength_end   //if zero return
    ADD R0, R0, #1      //if not zero, R0++
    B sreLength_loop    //next itteration of loop
strLength_end
    BX LR               //return to caller
    