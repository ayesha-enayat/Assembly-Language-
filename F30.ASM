
;program to print whether the given input number is even or odd

dosseg
.model small
.stack 100h
.data
prompt db 10,13,"Enter Number:$"
msg1 db  10,13,"Number is Even$"
msg2 db 10,13,"Number is Odd$"


.code
main proc
mov ax, @data
mov ds, ax

lea dx,prompt
mov ah,9
int 21h


mov ah,1
int 21h

mov bl,2
div bl    ;after division remainder store in ah
cmp ah,0
je even

lea dx,msg2
mov ah,9
int 21h
mov ah,4ch
int 21h



even:
lea dx,msg1
mov ah,9
int 21h
mov ah,4ch
int 21h


main endp
end main