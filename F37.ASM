; Program to draw a rectangle
dosseg
.model small
.stack 100h

.data

.code
main proc
    mov ah, 6          ; Scroll up function (BIOS video service)
    mov al, 6         ; Number of lines to scroll
    mov bh, 01100000b  ; Background attribute (binary number)
    mov ch, 0          ; Upper left row coordinate
    mov cl, 0          ; Upper left column coordinate
    mov dh, 20         ; Lower right row coordinate (rectangle's height)
    mov dl, 20         ; Lower right column coordinate (rectangle's width)
    int 10h            ; BIOS interrupt for video services
    
    mov ah, 4ch        ; Terminate program
    int 21h            ; DOS interrupt

main endp
end main
