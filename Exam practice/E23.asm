;macro practice 

print macro p1
mov dx,offset p1
mov ah,9
int 21h
endm

dosseg
.model small
.stack 100h
.data
var1 db 'hello$'
var2 db 'How are you$'
var3 db 'Exam Day$'
.code 
main proc
mov ax,@data
mov ds,ax


print var1
call enterkey

print var2
call enterkey

print var3


mov ah,4ch
int 21h
main endp


enterkey proc
mov dL,13
mov ah,2
int 21h

mov dL,10
mov ah,2
int 21h
ret 
enterkey endp

end main