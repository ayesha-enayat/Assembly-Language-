;program to reverse a string

dosseg
.model small
.stack 100h
.data

name1 db 'Ayesha$'

.code 
main proc
mov ax,@data
mov ds,ax

mov si,offset name1

mov cx,6
L1:
mov bx,[si]
push bx
inc si
Loop L1

mov cx,6
L2:
pop dx
mov ah,2
int 21h
Loop L2


mov ah,4ch
int 21h

main endp
end main