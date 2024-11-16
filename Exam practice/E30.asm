dosseg
.model small
.stack 100h
.data
sum dw 0        ; To store the sum of all odd numbers
num dw 2       ; Start with the first odd number, 1
.code
main proc
    mov ax, @data
    mov ds, ax   ; Initialize the data segment

    mov cx, 50   ; We need to add 50 odd numbers from 1 to 100
L1:
    mov ax, num   ; Move the current number to ax
    add sum, ax ; Add the current odd number to sum
    add num, 2   ; Move to the next odd number (increment by 2)
    loop L1      ; Repeat until CX reaches 0

    ; Display the sum
    mov ax, sum
    call print_sum  ; Call a procedure to print the sum

    mov ah, 4ch    ; Exit to DOS
    int 21h
main endp

; Procedure to print the sum
print_sum proc
    mov bx, 10        ; Base 10 for decimal conversion
    mov cx, 0         ; Clear CX, it will store reversed digits
    
print_digit:
    xor dx, dx        ; Clear DX before dividing AX
    div bx            ; Divide AX by 10, quotient in AX, remainder in DX
    push dx           ; Push remainder on stack
    inc cx            ; Increment count of digits in CX
    test ax, ax       ; Check if AX is 0
    jnz print_digit   ; If not, continue dividing

print_loop:
    pop dx            ; Pop each digit from stack
    add dl, '0'       ; Convert to ASCII
    mov ah, 2         ; DOS function to display a character
    int 21h           ; Display the digit
    loop print_loop   ; Repeat for all digits

    ret
print_sum endp
end main
