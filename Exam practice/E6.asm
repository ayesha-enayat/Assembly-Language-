;program to input two numbers and subtract them
dosseg
.model small
.stack 100h
.data
.code 
main proc
mov ah,1
int 21h
mov bl,al

mov ah,1
int 21h
mov cl,al

sub bl,cl
mov dl,bl
add dl,48
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main