;Program to Print name using Characters
DOSSEG
.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
MOV DL,'A'
MOV AH,2
INT 21H
MOV DL,'Y'
MOV AH,2
INT 21H
MOV DL,'E'
MOV AH,2
INT 21H
MOV DL,'S'
MOV AH,2
INT 21H
MOV DL,'H'
MOV AH,2
INT 21H
MOV DL,'A'
MOV AH,2
INT 21H
MOV AH,4CH
INT 21H
MAIN ENDP
END MAIN
