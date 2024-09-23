;program to practice array

dosseg
.model small
.stack 100h
.data
arr1 db 'a','b','c'
.code
main proc
mov ax,@data
mov ds,ax

mov si,offset arr1

mov cx,3

L1:
mov dx,[si]
mov ah,2
int 21h
inc si
Loop L1

mov ah,4ch
int 21h


main endp
end main