;print array 
dosseg
.model small
.stack 100h
.data
arr1 db 1,2,3,4,5

.code
main proc
mov ax,@data
mov ds,ax

mov si,offset arr1
mov cx,5
L1:
mov dx,[si]
add dx,48
mov ah,2
int 21h
inc si
Loop L1

mov ah,4ch 
int 21h
main endp
end main