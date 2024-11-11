; Program to draw a square and print their name in it
dosseg
.model small
.stack 100h
.data
msg db 'square$'
.code
main proc
mov ax,@data
mov ds,ax
    mov ah, 6          ; Scroll up function (not the correct one for drawing, but let's proceed with it)
    mov al, 10         ; Number of lines to scroll
    mov bh, 00010000b  ; Background attribute (binary number)
    mov ch, 0          ; Upper left row coordinate
    mov cl, 0          ; Upper left column coordinate
    mov dh, 20         ; Lower right row coordinate (square's height)
    mov dl, 20        ; Lower right column coordinate (square's width)
    int 10h            ; BIOS interrupt for video services
    mov ah,02h
    mov bh,0
    mov dl,14
    mov dh,12
    int 10h
    mov dx,offset msg
    mov ah,09h
    int 21h
    mov ah, 4ch        ; Terminate program
    int 21h            ; DOS interrupt

main endp
end main
