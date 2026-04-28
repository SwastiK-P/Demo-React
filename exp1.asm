.model small
.stack 100h

.data
msg1 db 10,13,"First Number: 8$"
msg2 db 10,13,"Second Number: 2$"

msg_add db 10,13,"Addition Result: $"
msg_sub db 10,13,"Subtraction Result: $"
msg_mul db 10,13,"Multiplication Result: $"
msg_div db 10,13,"Division Result: $"
msg_and db 10,13,"AND Result: $"
msg_or  db 10,13,"OR Result: $"
msg_xor db 10,13,"XOR Result: $"
msg_not db 10,13,"NOT Result: $"

.code
main proc

mov ax, @data
mov ds, ax

; ==========================
; DISPLAY HARDCODED INPUT
; ==========================
mov dx, offset msg1
mov ah, 09h
int 21h

mov dx, offset msg2
mov ah, 09h
int 21h


; ==========================
; ADDITION SECTION
; ==========================
mov dx, offset msg_add
mov ah, 09h
int 21h

mov al, 08h
mov bl, 02h
add al, bl

call print_num


; ==========================
; SUBTRACTION SECTION
; ==========================
mov dx, offset msg_sub
mov ah, 09h
int 21h

mov al, 08h
mov bl, 02h
sub al, bl

call print_num


; ==========================
; MULTIPLICATION SECTION
; ==========================
mov dx, offset msg_mul
mov ah, 09h
int 21h

mov al, 08h
mov bl, 02h
mul bl

call print_num


; ==========================
; DIVISION SECTION
; ==========================
mov dx, offset msg_div
mov ah, 09h
int 21h

mov ax, 0008h
mov bl, 02h
div bl

call print_num


; ==========================
; AND SECTION
; ==========================
mov dx, offset msg_and
mov ah, 09h
int 21h

mov al, 08h
mov bl, 02h
and al, bl

call print_num


; ==========================
; OR SECTION
; ==========================
mov dx, offset msg_or
mov ah, 09h
int 21h

mov al, 08h
mov bl, 02h
or al, bl

call print_num


; ==========================
; XOR SECTION
; ==========================
mov dx, offset msg_xor
mov ah, 09h
int 21h

mov al, 08h
mov bl, 02h
xor al, bl

call print_num


; ==========================
; NOT SECTION
; ==========================
mov dx, offset msg_not
mov ah, 09h
int 21h

mov al, 08h
not al

call print_num


; ==========================
; EXIT
; ==========================
mov ah, 4ch
int 21h

main endp


; ==========================
; PRINT NUMBER (SINGLE DIGIT)
; ==========================
print_num proc
add al, 30h
mov dl, al
mov ah, 02h
int 21h
ret
print_num endp

end main
