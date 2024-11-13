;program to reverse a string 
dosseg
.model small
.stack 100h
.data
mymame db 'ayesha$'
.code 
main proc
mov ax,@data
mov ds,ax

mov si,offset mymame
mov cx,6
L1:
mov bx,[si]
push bx
inc si
Loop L1

mov cx,6
L2:
pop bx
mov dx,bx
mov ah,2
int 21h
Loop L2

mov ah,4ch 
int 21h

main endp
end main