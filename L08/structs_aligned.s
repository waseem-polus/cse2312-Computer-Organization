.global getName
.global getZip

@ padding may be added between variables (default in c)
@ struct  _BUSINESS {
@     uint32_t taxId;
@     char name[33]
@     uint32_t addNo;
@     char direction;
@     char street[33];
@     char city[33];
@     char state[3];
@     uint32_t zip
@ };

.text

getName:
    ADD R0, R0, #4
    MOV R2, #120
    MUL R3, R2, R1
    ADD R0, R0, R3
    BX LR

getZip:
    ADD R0, R0, #116
    MOV R2, #120
    MUL R3m R2, R1
    ADD R0, R0, R3
    LDR R0, [R0]
    BX LR