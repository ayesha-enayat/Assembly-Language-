;print asteriks

dosseg
.model small
.stack 100h
.data
.code
main proc

mov bx,1
mov cx,5
L1:
push cx
mov cx,bx

l2:
mov dx,'*'
mov ah,2
int 21h

Loop l2

mov dx,10
mov ah,2
int 21h

mov dx,13
mov ah,2
int 21h


inc bx
pop cx
Loop L1

main endp 
end main
