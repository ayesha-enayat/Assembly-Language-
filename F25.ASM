;compare two strings of and display output

dosseg
.model small
.stack 100h

.data
password1 db 'mypassword$'        ; First predefined password
password2 db 'mypassword$'        ; Second predefined password (change to test mismatch)
           
success_msg db 'Passwords match! $'             
failure_msg db 'Passwords do not match! $'      

.code
main proc

    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Compare the two passwords
    lea si, password1         
    lea di, password2          

compare_loop:
    mov al, [si]              
    cmp al, '$'                
    je strings_match          

    mov bl, [di]              
    cmp bl, '$'                
    je strings_not_match      

    cmp al, bl               
    jne strings_not_match     

    ; Move to the next character
    inc si                   
    inc di                    
    jmp compare_loop         

strings_match:
    ; Display success message
    mov dx, offset success_msg
    mov ah, 9
    int 21h
    jmp exit_program

strings_not_match:
    ; Display failure message
    mov dx, offset failure_msg
    mov ah, 9
    int 21h

exit_program:
    ; Exit the program
    mov ah, 4Ch
    int 21h

main endp
end main
