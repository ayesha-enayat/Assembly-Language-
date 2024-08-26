;Take a input number between (5-9) from user and display the Grade according to their input number.

dosseg
.model small
.stack 100h
.data

;variables defined here grade A+ for 90%, A for 80%, B for  70%, C for 60%, D for 50%
var1 db " Grade A+$"    
var2 db " Grade A$"     
var3 db " Grade B$"     
var4 db " Grade C$"     
var5 db " Grade D$"     
var6 db " fail$"
prompt db "Enter number between 5-9: $" ; 


.code
main proc
    mov ax, @data
    mov ds, ax

    ; Prompt user for input
    mov dx, offset prompt
    mov ah, 9
    int 21h

    ; Get user input (single character)
    mov ah, 1
    int 21h

   

    ; Determine grade
    cmp al, '9'         ;9 represent 90%
    je gradeAPlus
    cmp al, '8'         ;8 represent 80%
    je gradeA           
    cmp al, '7'         ;7 represent 70%
    je gradeB
    cmp al, '6'         ;6 represent 60%
    je gradeC
    cmp al, '5'         ;5 represent 50%
    je gradeD
    jmp gradeF  ; if none match


gradeAPlus:
    mov dx, offset var1
    jmp printGrade

gradeA:
    mov dx, offset var2
    jmp printGrade

gradeB:
    mov dx, offset var3
    jmp printGrade

gradeC:
    mov dx, offset var4
    jmp printGrade

gradeD:
    mov dx, offset var5
    jmp printGrade

gradeF:
    mov dx, offset var6

printGrade:
    mov ah, 9
    int 21h
    mov ah, 4ch  ; terminate program
    int 21h

main endp
end main
