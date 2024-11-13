;program to print a single character
dosseg
.model small
.stack 100h
.data
.code 
main proc
mov dl,'a'
mov ah,2
int 21h

mov dl,1
add dl,48
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main