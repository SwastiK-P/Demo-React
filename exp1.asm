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
mov ah, 0
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
mov ah, 0
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
mov ah, 0
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
mov ah, 0
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
mov ah, 0
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
mov ah, 0
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
mov ah, 0
call print_num

; ==========================
; NOT
; ==========================
mov dx, offset msg_not
mov ah, 09h
int 21h

mov al, 8
not al
mov ah, 0
call print_num

; ==========================
; EXIT
; ==========================
mov ah, 4ch
int 21h

main endp

; ==========================
; PRINT NUMBER (CORRECT)
; ==========================
print_num proc

    push ax
    push bx
    push cx
    push dx

    mov cx, 0
    mov bx, 10

convert:
    mov dx, 0
    div bx          ; AX / 10
    push dx         ; remainder
    inc cx
    cmp ax, 0
    jne convert

print:
    pop dx
    add dl, 30h
    mov ah, 02h
    int 21h
    loop print

    pop dx
    pop cx
    pop bx
    pop ax

    ret
print_num endp

end main
