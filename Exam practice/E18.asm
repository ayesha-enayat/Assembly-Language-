;divide two numbers
dosseg
.model small
.stack 100h
.data
.code
main proc 
mov ax,26
mov bl,5
div bl

mov cl,al
mov ch,ah

mov dl,cl
add dl,48
mov ah,2
int 21h

mov dl,ch
add dl,48
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main