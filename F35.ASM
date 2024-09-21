.model small
.stack 100h
.data
    num1 dw 5      ; First number
    num2 dw 7      ; Second number
    result dw 0    ; Variable to store the result
    msg db 'Sum: $'  ; Message to display before result
.code
main proc
    ; Initialize Data Segment
    mov ax, @data
    mov ds, ax

    ; Call the procedure to add two numbers
    call addNumbers

    ; Exit to DOS
    mov ah, 4Ch
    int 21h
main endp

;===========================
; Procedure: addNumbers
; This procedure adds num1 and num2, stores the result, and displays it
;===========================

addNumbers proc
    ; Add num1 and num2
    mov ax, num1
    add ax, num2
    mov result, ax

    ; Display the message "Sum: "
    mov ah, 09h
    lea dx, msg
    int 21h

    ; Convert result to ASCII and display it
    mov ax, result
    call printNumber

    ret
addNumbers endp

;===========================
; Procedure: printNumber
; This procedure converts a number in AX to ASCII and prints it
;===========================

printNumber proc
    ; Store AX in a temporary variable
    mov bx, ax

    ; Divide AX by 10 to get the digits
    mov cx, 0       ; Initialize digit counter
printLoop:
    mov dx, 0       ; Clear dx for division
    div word ptr [ten]   ; Divide by 10
    add dl, 30h     ; Convert remainder to ASCII
    push dx         ; Save the digit
    inc cx          ; Increase digit count
    cmp ax, 0       ; Check if any digits remain
    jne printLoop

    ; Print the digits in the correct order
printDigits:
    pop dx          ; Pop digits in reverse order
    mov ah, 02h     ; DOS interrupt to print char
    int 21h
    loop printDigits

    ret
printNumber endp

.data
    ten dw 10       ; Constant value 10 for division
end main
