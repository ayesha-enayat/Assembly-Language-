.model small
.stack 100h
.data
    sum dw 0       ; to store the result (sum of odd numbers)
    num dw 2       ; starting number (2 is the first even number)
    message db 'The sum of odd numbers between 1 to 100 is: $'

.code
main proc
    mov ax, @data  ; initialize data segment
    mov ds, ax

    mov cx, 50     ; loop counter (there are 50 odd numbers between 1 and 100)

calculate_sum:
    mov ax, sum    ; load the current sum into AX
    add ax, num    ; add the current odd number to sum
    mov sum, ax    ; store the result back in sum
    add num, 2     ; move to the next odd number
    loop calculate_sum

    ; Display the message
    mov ah, 09h    ; DOS interrupt to display string
    lea dx, message
    int 21h

    ; Convert sum to string
    mov ax, sum    ; load the sum into AX register
    call print_number

    ; Terminate program
    mov ah, 4Ch    ; DOS interrupt to terminate program
    int 21h

main endp

; Subroutine to print the number in AX
print_number proc
    push ax        ; save AX register
    mov cx, 0      ; initialize digit count
    mov bx, 10     ; divisor for base 10

convert_digit:
    xor dx, dx     ; clear DX
    div bx         ; divide AX by 10 (AX / 10)
    push dx        ; save remainder (digit)
    inc cx         ; increment digit count
    test ax, ax    ; check if AX is zero
    jnz convert_digit

print_digit:
    pop dx         ; get the digit
    add dl, '0'    ; convert to ASCII
    mov ah, 02h    ; DOS interrupt to print character
    int 21h
    loop print_digit

    pop ax         ; restore AX register
    ret
print_number endp

end main
