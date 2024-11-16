;program to check input number is even or odd
dosseg
.model small
.stack 100h
.data
msg db 'Enter Number: $' 
msg1 db 10,13,'Even$'
msg2 db 10,13,'Odd$' 

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

mov bl,2
div bl

cmp ah,0
je isEven

lea dx,msg2
mov ah,9
int 21h
mov ah,4ch
int 21h

isEven:
lea dx,msg1
mov ah,9
int 21h
mov ah,4ch
int 21h



mov ah,4ch 
int 21h

main endp
end main