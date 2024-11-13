;store variable and print it
dosseg
.model small
.stack 100h
.data
var1 db 'b'
var2 db 'ayesha$'
.code
main proc
mov ax,@data
mov ds,ax

mov dl,var1
mov ah,2
int 21h

mov dx,offset var2
mov ah,9
int 21h

mov ah,4ch
int 21h

main endp 
end main