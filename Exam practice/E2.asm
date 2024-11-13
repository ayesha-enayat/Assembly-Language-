;program to print name with characters
dosseg
.model small
.stack 100h
.data
.code 
main proc
mov dl,'a'
mov ah,2
int 21h

mov dl,'y'
mov ah,2
int 21h

mov dl,'e'
mov ah,2
int 21h

mov dl,'s'
mov ah,2
int 21h

mov dl,'h'
mov ah,2
int 21h

mov dl,'a'
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main
