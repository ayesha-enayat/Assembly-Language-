;program to input two numbers and subtract them

dosseg
.model small
.stack 100h
.data
.code 
main proc

;input first number
mov ah,1
int 21h
mov bl,al

mov ah,1
int 21h

sub bl,al
add bl,48


mov dl,bl
mov ah,2
int 21h


main endp
end main 