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
; DISPLAY INPUT
; ==========================
mov dx, offset msg1
mov ah, 09h
int 21h

mov dx, offset msg2
mov ah, 09h
int 21h

; ==========================
; ADDITION
; ==========================
mov dx, offset msg_add
mov ah, 09h
int 21h

mov al, 8
mov bl, 2
add al, bl
call print_num

; ==========================
; SUBTRACTION
; ==========================
mov dx, offset msg_sub
mov ah, 09h
int 21h

mov al, 8
mov bl, 2
sub al, bl
call print_num

; ==========================
; MULTIPLICATION
; ==========================
mov dx, offset msg_mul
mov ah, 09h
int 21h

mov al, 8
mov bl, 2
mul bl          ; AX = result
; AL has result (for small values)
call print_num

; ==========================
; DIVISION
; ==========================
mov dx, offset msg_div
mov ah, 09h
int 21h

mov ax, 0008h
mov bl, 2
div bl          ; AL = quotient
call print_num

; ==========================
; AND
; ==========================
mov dx, offset msg_and
mov ah, 09h
int 21h

mov al, 8
mov bl, 2
and al, bl
call print_num

; ==========================
; OR
; ==========================
mov dx, offset msg_or
mov ah, 09h
int 21h

mov al, 8
mov bl, 2
or al, bl
call print_num

; ==========================
; XOR
; ==========================
mov dx, offset msg_xor
mov ah, 09h
int 21h

mov al, 8
mov bl, 2
xor al, bl
call print_num

; ==========================
; NOT
; ==========================
mov dx, offset msg_not
mov ah, 09h
int 21h

mov al, 8
not al
call print_num

; ==========================
; EXIT
; ==========================
mov ah, 4ch
int 21h

main endp

; ==========================
; PRINT NUMBER (0–255)
; ==========================
print_num proc

    mov ah, 0        ; IMPORTANT: clear AH
    mov bl, 10

    div bl           ; AL = quotient, AH = remainder
    mov bh, ah       ; save ones

    mov ah, 0
    div bl           ; second division

    ; hundreds
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; tens
    mov al, ah
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ; ones
    mov al, bh
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    ret
print_num endp

end main
