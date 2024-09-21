;program to print * 5 times

dosseg
.model small
.stack 100h
.data
.code
main proc
    mov cx,5

L1:
    push cx

L2:
    mov dx,'*'
    mov ah,2
    int 21h

    mov dx,10     
    mov ah,2
    int 21h       

    mov dx,13     
    mov ah,2
    int 21h       

    pop cx
    loop L1         ; Loop 5 times

main endp
end main
