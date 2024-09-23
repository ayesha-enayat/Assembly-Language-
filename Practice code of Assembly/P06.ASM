;program to subtact two numbers

dosseg
.model small
.stack 100h
.data
.code 
main proc
mov bl,4
mov cl,1

sub bl,cl
mov dl,bl
add dl,48
mov ah,2
int 21h

mov bl,5
mov cl,3
sub bl,cl
add bl,48
mov dl,bl
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main