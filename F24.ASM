;program to swap first name and last name

dosseg
.model small
.stack 100h

.data
first_name db 'ayesha$'    
last_name  db 'enayat$'    


.code
main proc

    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Push first and last name addresses onto the stack
    lea si, first_name         
    push si                   

    lea si, last_name           
    push si                    


    ; Pop and display last name first
    pop si                      
    mov dx, si                 
    mov ah, 9                   
    int 21h

    ; Print a space between the names
    mov dl, ' '
    mov ah, 2                  
    int 21h

    ; Pop and display first name
    pop si                     
    mov dx, si               
    mov ah, 9                   
    int 21h

    ; Exit the program
    mov ah, 4Ch                 
    int 21h

main endp
end main
