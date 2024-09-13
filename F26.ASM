dosseg
.model small
.data
fn db 'Ayesha$'
ln db 'Enayat$'
.code
main proc
mov ax,@data
mov ds,ax

mov ax,offset fn
mov bx,offset ln

push ax
push bx

pop ax
pop bx

mov dx,ax
mov ah,9
int 21h

mov dl, ' '
    mov ah, 2                  
    int 21h
    
mov dx,bx
mov ah,9
int 21h

mov ah,4ch
int 21h
main endp
end main