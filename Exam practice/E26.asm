;draw parallegoram
dosseg
.model small
.stack 100h
.data
.code 
main proc
mov ah,06h
mov al,10
mov bh,000100000b
mov ch,0
mov cl,0
mov dh,35
mov dl,5
int 10h

mov ah,4ch
int 21h
main endp
end main
