;program to print capital letters from A to Z using loop

dosseg
.model small
.stack 100h
.data
.code
main proc

mov cx,26
mov dx,65

L1:
mov ah,2
int 21h

inc dx
Loop L1


main endp
end main