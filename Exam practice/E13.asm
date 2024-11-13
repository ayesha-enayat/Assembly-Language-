;print array 
dosseg
.model small
.stack 100h
.data
arr2 db 'a','b','c','d','e'
.code
main proc
mov ax,@data
mov ds,ax

mov si,offset arr2
mov cx,5
L1:
mov dx,[si]
mov ah,2
int 21h
inc si
Loop L1

mov ah,4ch 
int 21h
main endp
end main
