;program to take input string from user and reverse it

dosseg
.model small
.stack 100h

.data
msg db 'Enter a string: $'

.code
main proc

    mov ax, @data
    mov ds, ax

    ; Prompt user for input
    mov dx, offset msg
    mov ah, 9
    int 21h

    mov cx,0          ; Initialize counter to 0 (cx will count characters)

L1:
    mov ah, 1           
    int 21h
    cmp al, 13           ; Check if Enter key (ASCII 13) is pressed
    je L2                ; If Enter is pressed, jump to reverse

    push ax     
    inc cx               ; Increment character counter         
    jmp L1              


L2:
    pop dx                ; Pop the character from the stack
    mov ah,2                ; Display the character
    int 21h              
    loop L2              ; Repeat until cx reaches 0

    ; Exit the program
    mov ah, 4Ch          ; Terminate the program
    int 21h

main endp
end main
