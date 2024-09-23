;program to input name and reverse it

dosseg
.model small
.stack 100h
.data
var1 db 50 dup ('$')
msg1 db 10,13,'Enter your name: $'
msg2 db 10,13,'Your name is: $'
msg3 db 10,13,'Reversed name is: $'

.code
main proc
mov ax,@data
mov ds,ax


mov dx,offset msg1
mov ah,9
int 21h

mov si,offset var1



mov cx,0
L1:
mov ah,1
int 21h
cmp al,13
je programend
mov [si],al
push [si]
inc si
inc cx
jmp L1


programend:
mov dx,offset msg2
mov ah,9
int 21h

mov dx,offset var1
mov ah,9
int 21h

mov dx,offset msg3
mov ah,9
int 21h

mov si,offset var1
L2:
pop dx
mov ah,2
int 21h
Loop L2

mov ah,4ch 
int 21h


main endp
end main