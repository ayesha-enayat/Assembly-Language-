; Program to draw a parallelogram in the center of the screen
.model small
.stack 100h

.data

.code
main proc
    ; Set video mode to 13h (320x200, 256 colors)
    mov ax, 13h        ; 320x200 graphics mode
    int 10h            ; BIOS interrupt to set video mode

    mov cx, 30         ; Number of rows (height of parallelogram)
    mov dx, 50         ; Width of parallelogram (number of pixels per row)
    mov si, 50         ; Initial horizontal position for the first row (start from column 50)
    mov di, 40         ; Vertical position (starting row at y = 40)

draw_row:
    push cx            ; Save the row counter
    
    mov bx, dx         ; Set the width of the parallelogram for the current row
    mov cx, si         ; Starting x position for this row

draw_pixel:
    mov ah, 0Ch        ; BIOS function for writing pixels
    mov al, 4Fh        ; Color of the parallelogram (a shade of blue)
    mov dx, di         ; Y-coordinate (current row)
    int 10h            ; BIOS interrupt to draw the pixel
    
    inc cx             ; Move to the next pixel in the row (increase x)
    dec bx             ; Decrease the pixel count for this row
    jnz draw_pixel     ; Repeat until the row width is covered
    
    inc si             ; Increase the slant for the next row (shift to the right)
    inc di             ; Move to the next row (increase y-coordinate)
    pop cx             ; Restore the row counter
    loop draw_row      ; Repeat for each row
    
    ; Wait for key press before exiting
    mov ah, 00h        ; Wait for keyboard input
    int 16h            ; BIOS keyboard interrupt

    ; Return to text mode (3h)
    mov ax, 3h         ; Set video mode to 3 (text mode)
    int 10h            ; BIOS interrupt

    mov ah, 4Ch        ; Terminate program
    int 21h            ; DOS interrupt to exit

main endp
end main
