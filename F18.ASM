;Take a single character as a grade from user and display the percentage according to their grade.

dosseg
.model small
.stack 100h
.data

;variables defined here grade A for  80-100, B for 70-79, C for 60-69, D for  50-59, F for below 50
var1 db " 'your Percentage is 80 or above 80'$"
var2 db " 'your Percentage is 70 or above but less than 80'$"
var3 db " 'your Percentage is 60 or above but less than 70'$"
var4 db " 'your Percentage is 50 or above but less than 60'$"
var5 db " ''$your Percentage below 50$"
prompt db "Enter grade (A-D): $"

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
    cmp al, 'A'
    je gradeA
    cmp al, 'B'
    je gradeB
    cmp al, 'C'
    je gradeC
    cmp al, 'D'
    je gradeD
    jmp gradeF  ; if none match, assume below 50

gradeA:
    mov dx, offset var1
    jmp printGrade

gradeB:
    mov dx, offset var2
    jmp printGrade

gradeC:
    mov dx, offset var3
    jmp printGrade

gradeD:
    mov dx, offset var4
    jmp printGrade

gradeF:
    mov dx, offset var5

printGrade:
    mov ah, 9
    int 21h
    mov ah, 4ch  ; terminate program
    int 21h

main endp
end main
