;Program to print string using macro

print macro p1
mov dx,offset p1
mov ah,09h
int 21h
endm

.model small
.stack 100h
.data
str1 db 'Hello $'
str2 db 'World$'

.code 
main proc
mov ax,@data
mov ds,ax
print str1
print str2

mov ah,4ch
int 21h

main endp 
end main
