;draw pattern 
dosseg
.model small
.stack 100h
.data
.code 
main proc
mov ah,6
mov al,30
mov bh,01000000b

mov ch,21
mov cl,21
mov dh,40
mov dh,40
int 10h

mov ah,6
mov al,10
mov bh,01100000b

mov ch,0
mov cl,0
mov dh,20
mov dl,20
int 10h
mov bh,10100000b

mov ch,0
mov cl,0
mov dh,20
mov dl,20
int 10h

mov ah,4ch
int 21h

main endp
end main