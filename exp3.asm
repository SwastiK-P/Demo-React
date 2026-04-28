.model small
.stack 100h

.data
msg1 db 0dh,0ah,"Enter first 2-digit BCD number: $"
msg2 db 0dh,0ah,"Enter second 2-digit BCD number: $"
msg3 db 0dh,0ah,"Sum = $"

num1 db ?
num2 db ?
result db ?

.code
main proc

mov ax, @data
mov ds, ax

; ==========================
; INPUT FIRST BCD NUMBER
; ==========================
lea dx, msg1
mov ah, 09h
int 21h

; Read first digit (tens)
mov ah, 01h
int 21h
sub al, 30h        ; ASCII → number
mov cl, 4
shl al, cl         ; shift to upper nibble
mov num1, al

; Read second digit (ones)
mov ah, 01h
int 21h
sub al, 30h
mov bl, num1
or bl, al          ; combine digits
mov num1, bl


; ==========================
; INPUT SECOND BCD NUMBER
; ==========================
lea dx, msg2
mov ah, 09h
int 21h

; tens digit
mov ah, 01h
int 21h
sub al, 30h
mov cl, 4
shl al, cl
mov num2, al

; ones digit
mov ah, 01h
int 21h
sub al, 30h
mov bl, num2
or bl, al
mov num2, bl


; ==========================
; BCD ADDITION
; ==========================
mov al, num1
add al, num2
daa                 ; decimal adjust
mov result, al


; ==========================
; DISPLAY RESULT
; ==========================
lea dx, msg3
mov ah, 09h
int 21h

; display tens digit
mov al, result
and al, 0F0h
mov cl, 4
shr al, cl
add al, 30h
mov dl, al
mov ah, 02h
int 21h

; display ones digit
mov al, result
and al, 0Fh
add al, 30h
mov dl, al
mov ah, 02h
int 21h


; ==========================
; EXIT
; ==========================
mov ah, 4ch
int 21h

main endp
end main
