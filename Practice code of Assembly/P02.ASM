;program to print name with characters

dosseg
.model small
.stack 100
.data
.code 
main proc
mov dl,'A'
mov ah,2
int 21h

mov dl,'Y'
mov ah,2
int 21h

mov dl,'E'
mov ah,2
int 21h

mov dl,'S'
mov ah,2
int 21h

mov dl,'H'
mov ah,2
int 21h

mov dl,'A'
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main