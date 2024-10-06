; Find the largest number in an array
.model small
.stack 100h
.data
    array db 5, 3, 9, 1, 6, 7        ; Array of numbers
   arr db 6                   ; Size of the array
    largest db 0                      ; Variable to store the largest number
    msg db 'The largest number is: $' ; Message to print

.code
main proc
    mov ax, @data                    ; Initialize data segment
    mov ds, ax

    mov cx,arr             ; Set loop counter to size of the array (using CX)
    mov si, 0                        ; Initialize index to 0
    mov al, [array]                  ; Load first element into AL
    mov largest, al                  ; Assume the first element is the largest

find_largest:
    inc si                           ; Move to the next element
    cmp si, cx                       ; Check if we reached the end of the array
    jge done                         ; If yes, we are done

    mov al, [array + si]            ; Load the next element
    cmp al, largest                  ; Compare with the current largest
    jg update_largest               ; If it's larger, update

    jmp find_largest                ; Otherwise, continue

update_largest:
    mov largest, al                 ; Update largest with the new value
    jmp find_largest                ; Continue searching

done:
    ; Print the message
    mov ah, 09h                     ; DOS function to print string
    lea dx, msg                     ; Load address of message
    int 21h                         ; Call DOS interrupt

    ; Print the largest number
    mov al, largest                 ; Load the largest number
    call PrintNumber                ; Print the largest number

    ; Exit the program
    mov ax, 4C00h                   ; DOS terminate program
    int 21h

PrintNumber proc
    ; Convert the number in AL to ASCII and print it
    xor ah, ah                      ; Clear AH for division
    mov bl, 10                      ; Divisor for decimal conversion
    xor cx, cx                      ; Clear CX (to store the number of digits)

convert_loop:
    xor dx, dx                      ; Clear DX for the division
    div bl                          ; Divide AX by 10
    push dx                         ; Push remainder (digit) onto the stack
    inc cx                          ; Increment digit count
    test ax, ax                     ; Check if AX is zero
    jnz convert_loop                ; Repeat if not zero

print_loop:
    pop dx                          ; Pop digit from stack
    add dl, '0'                     ; Convert digit to ASCII
    mov ah, 02h                     ; DOS function to print character
    int 21h                         ; Call DOS interrupt
    loop print_loop                 ; Print all digits

    ret
PrintNumber endp
main endp
end main
