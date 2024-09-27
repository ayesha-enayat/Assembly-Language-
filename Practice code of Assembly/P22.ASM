; evensum.asm
.model small
.stack 100h

.data
    sum dw 0                               ; Variable to store the sum
    message db 'The sum of even numbers between 1 and 100 is: $'
    newline db 0Dh, 0Ah, '$'               ; Carriage return and line feed

.code
main proc
    ; Initialize Data Segment
    mov ax, @data
    mov ds, ax

    ; Initialize Registers
    mov cx, 50              ; Counter for 50 even numbers
    xor ax, ax              ; Clear AX to store sum
    mov bx, 2               ; Starting even number (2)

sum_loop:
    add ax, bx              ; Add current even number to sum
    add bx, 2               ; Move to the next even number
    loop sum_loop           ; Decrement CX and loop if not zero

    mov sum, ax             ; Store the final sum in 'sum'

    ; Display Message
    mov ah, 09h             ; DOS function to display string
    lea dx, message         ; Load address of message
    int 21h                 ; Call DOS interrupt

    ; Display Sum
    mov ax, sum             ; Load sum into AX for printing
    call PrintNumber        ; Call subroutine to print the number

    ; Display Newline
    mov ah, 09h             ; DOS function to display string
    lea dx, newline         ; Load address of newline
    int 21h                 ; Call DOS interrupt

    ; Terminate Program
    mov ah, 4Ch             ; DOS function to terminate program
    int 21h                 ; Call DOS interrupt
main endp

; Subroutine to Print a Number in AX
PrintNumber proc
    push ax                 ; Preserve AX
    push bx                 ; Preserve BX
    push cx                 ; Preserve CX
    push dx                 ; Preserve DX

    mov bx, 10              ; Divisor for decimal conversion
    xor cx, cx              ; Clear CX (digit count)

    ; Check if AX is zero
    cmp ax, 0
    jne convert_digits
    ; If AX is zero, print '0'
    mov dl, '0'
    mov ah, 02h             ; DOS function to display character
    int 21h
    jmp PrintNumber_End

convert_digits:
    ; Convert number to string by dividing by 10
convert_loop:
    xor dx, dx              ; Clear DX before division
    div bx                  ; Divide AX by 10; quotient in AX, remainder in DX
    push dx                 ; Push remainder (digit) onto stack
    inc cx                  ; Increment digit count
    cmp ax, 0
    jne convert_loop         ; Continue if quotient is not zero

    ; Pop and print each digit
print_loop:
    pop dx                  ; Pop digit from stack
    add dl, '0'             ; Convert digit to ASCII
    mov ah, 02h             ; DOS function to display character
    int 21h                 ; Call DOS interrupt
    loop print_loop          ; Loop until all digits are printed

PrintNumber_End:
    pop dx                  ; Restore DX
    pop cx                  ; Restore CX
    pop bx                  ; Restore BX
    pop ax                  ; Restore AX
    ret
PrintNumber endp

end main
