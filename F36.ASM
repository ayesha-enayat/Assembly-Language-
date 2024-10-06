; Program to draw a square
dosseg
.model small
.stack 100h

.data

.code
main proc
    mov ah, 6          ; Scroll up function (not the correct one for drawing, but let's proceed with it)
    mov al, 10         ; Number of lines to scroll
    mov bh, 00010000b  ; Background attribute (binary number)
    mov ch, 0          ; Upper left row coordinate
    mov cl, 0          ; Upper left column coordinate
    mov dh, 15         ; Lower right row coordinate (square's height)
    mov dl, 15         ; Lower right column coordinate (square's width)
    int 10h            ; BIOS interrupt for video services
    
    mov ah, 4ch        ; Terminate program
    int 21h            ; DOS interrupt

main endp
end main
