;check equal or not
dosseg
.model small
.stack 100h
.data 
var1 db 'numbers are equal$'
var2 db 'numbers are not equal$'
.code 
main proc
mov ax,@data
mov ds,ax

mov bl,3
mov al,1
int 21h
cmp bl,al
je L1

mov dx,offset var2
mov ah,9
int 21h
mov ah,4ch
int 21h

L1:
mov dx,offset var1
mov ah,9
int 21h

mov ah,4ch
int 21h


main endp
end main
