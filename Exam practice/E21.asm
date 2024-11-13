;print asterik
;*
;**
;***
;****
;*****

dosseg
.model small
.stack 100
.data
.code 
main proc


mov cx,5
mov bx, 1
L1:
push cx

mov cx,bx
L2:
mov dx,'*'
mov ah,2
int 21h

Loop L2

mov dx,13
mov ah,2
int 21h
mov dx,10
mov ah,2
int 21h


inc bx

pop cx
Loop L1

mov ah,4ch 
int 21h
main endp
end main