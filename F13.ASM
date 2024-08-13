
; This program demonstrates the use of three variables, two loops,
; and the "OR" logic gate. 

.model small
.stack 100h
.data

var1 db 0          
var2 db 0          
var3 db 0          

.code
main proc
    
    mov ax, @data
    mov ds, ax

    
    mov cl, 5        
loop1_start:
    inc var1         
    inc var2         
    loop loop1_start 

    
    mov al, var1
    mov bl, var2
    or al, bl        
    mov var3, al     

  
    mov cl, 3       
loop2_start:
    ; Print var1
    mov al, var1
    call print_num

    ; Print var2
    mov al, var2
    call print_num

    ; Print var3
    mov al, var3
    call print_num

    loop loop2_start 

   
    mov ah, 4Ch
    int 21h
main endp


print_num proc
   
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h
    ret
print_num endp

end main
