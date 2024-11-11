;program to print a single character
dosseg
.model small
.stack 100h
.data
.code
main proc

mov dl,'A'
mov ah,2
int 21h


mov dl,1  ;it print smily face because it takes 1 as ascii code
mov ah,2
int 21h

mov dl,'6'
mov ah,2
int 21h





mov ah,4ch
int 21h






main endp
end main