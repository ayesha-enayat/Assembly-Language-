;program to input two numbers and add them

dosseg
.model small
.stack 100h
.data
.code 
main proc

;input first number
mov ah,1
int 21h 
mov bl,al               ;mov first character to bl

;input second number
mov ah,1
int 21h

add bl,al
sub bl,48
mov dl,bl

mov ah,2
int 21h

mov ah,4ch
int 21h


main endp
end main