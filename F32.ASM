;program to print pyramid  of stars
dosseg
.model small
.stack 100h
.data
.code
main proc

    mov bx, 1      ; Initialize bx to 1
    mov cx, 5      ; Initialize cx to 5 for outer loop

L1:
    push cx        ; Save cx value for outer loop
    mov cx, bx     ; Set cx to the current value of bx for inner loop (number of stars to print)

L2:
    mov dl, '*'    ; Character to print
    mov ah, 2      ; Print function
    int 21h        ; Print the character in dl

    Loop L2        ; Decrement cx and loop until cx is 0

    ; Print a new line after inner loop
    mov dl, 0Ah    ; Line feed (LF)
    mov ah, 2
    int 21h        ; Print line feed

    mov dl, 0Dh    ; Carriage return (CR)
    mov ah, 2
    int 21h        ; Print carriage return

    inc bx         ; Increment bx to increase the number of stars printed
    pop cx         ; Restore outer loop counter
    Loop L1        ; Decrement cx and loop until cx is 0

main endp
end main
