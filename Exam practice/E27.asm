;program to searching value in an array
dosseg
.model small
.stack 100h
.data
msg db ' Enter a number: $'
msg1 db ' Number found $'
msg2 db ' Number Not Found $'
value db ?
arr1 db 1,3,4,6,7,8,9
.code 
main proc
mov ax,@data
mov ds,ax

mov dx,offset msg
mov ah,9
int 21h

mov ah,1
int 21h
sub al,48

mov value,al
mov si,offset arr1


mov cx,7
mov al,value

search:
mov bl,[si]
cmp al,bl
je found
inc si
Loop search

mov dx,offset msg2
mov ah,9
int 21h
mov ah,4ch
int 21h


found:
mov dx,offset msg1
mov ah,9
int 21h

mov ah,4ch
int 21h





main endp
end main