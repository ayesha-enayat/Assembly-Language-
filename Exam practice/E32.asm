;display the largest number in an array
dosseg
.model small
.stack 100h
.data
arr db 1,2,3,7,5
res db ?
.code
main proc
mov ax,@data
mov ds,ax

mov cx,5
mov bl,79h
mov si,offset arr

l1:
mov al,[si]
cmp al,bl
jge next

mov bl,al


next:
inc si
dec cx
jnz l1

mov res,bl
mov dl,res
add dl,48
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main