;program to add 2 numbers
dosseg
.model small
.stack 100h
.data
.code 
main proc

mov dl,2
mov bl,3
add dl,bl
add dl,48
mov ah,2
int 21h


mov dl,3
add dl,5
add dl,48
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main