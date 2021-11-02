.global writeU32
.global readU32
.global writeS32
.global readS32
.global writeU16
.global readU16
.global writeS16
.global readS16
.global writeU8
.global readU8
.global writeS8
.global readS8

.text

//write x into the address
//address is saved in R0, x is saved in R1
writeU32:
    STR R1, [R0] //*R0 <- R1
    BX LR

//read the value in address
//address saved in R0
readU32:
    LDR R0, [R0] //R0 <- *R0
    BX LR

writeS32:
    STR R1, [R0]
    BX LR

readS32:
    LDR R0, [R0] //R0 <- *R0
    BX LR

writeU16:
    STRH R1, [R0] //*R0 <- R1
    BX LR

readU16:
    LDRH R0, [R0] //R0 <- *R0
    BX LR

writeS16:
    STRH R1, [R0]
    BX LR

readS16:
    LDRSH R0, [R0] //R0 <- *R0
    BX LR

writeU8:
    STRB R1, [R0] //*R0 <- R1
    BX LR

readU8:
    LDRB R0, [R0] //R0 <- *R0
    BX LR

writeS8:
    STRB R1, [R0]
    BX LR

readS8:
    LDRSB R0, [R0] //R0 <- *R0
    BX LR
    