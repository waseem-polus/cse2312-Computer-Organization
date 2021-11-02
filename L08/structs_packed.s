.global getName
.global getZip

@ packed means no padding between variables in memory
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
    MOV R2, #115
    MUL R3, R2, R1
    ADD R0, R0, R3
    BX LR

getZip:
    ADD R0, R0, #111
    MOV R2, #115
    MUL R3m R2, R1
    ADD R0, R0, R3
    LDR R0, [R0]
    BX LR