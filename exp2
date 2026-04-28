.model small
.stack 100h

.data
; ==========================
; HARDCODED INPUTS
; ==========================
hex_num db 98h       ; Hex number
ascii_in db '7'      ; ASCII input
bcd_in db 04h        ; BCD input

; ==========================
; STORAGE VARIABLES
; ==========================
bcd_h db ?
bcd_t db ?
bcd_o db ?
ascii_bcd db ?
bcd_ascii db ?

; ==========================
; MESSAGES
; ==========================
msg_hex db 10,13,"Hex to BCD Conversion:$"
msg_ascii db 10,13,"ASCII to BCD Conversion:$"
msg_bcd db 10,13,"BCD to ASCII Conversion:$"

msg_h db 10,13,"Hundreds: $"
msg_t db 10,13,"Tens: $"
msg_o db 10,13,"Ones: $"

msg_res db 10,13,"Result: $"

.code
main proc

mov ax,@data
mov ds,ax

; ==========================
; HEX → BCD SECTION
; ==========================
mov dx, offset msg_hex
mov ah, 09h
int 21h

mov al, hex_num
mov ah, 0
mov bl, 10
div bl              ; AL=quotient, AH=remainder

mov bcd_o, ah

mov ah, 0
div bl

mov bcd_t, ah
mov bcd_h, al

; DISPLAY
mov dx, offset msg_h
mov ah,09h
int 21h
mov al, bcd_h
call print_num

mov dx, offset msg_t
mov ah,09h
int 21h
mov al, bcd_t
call print_num

mov dx, offset msg_o
mov ah,09h
int 21h
mov al, bcd_o
call print_num


; ==========================
; ASCII → BCD SECTION
; ==========================
mov dx, offset msg_ascii
mov ah,09h
int 21h

mov al, ascii_in
sub al, 30h
mov ascii_bcd, al

mov dx, offset msg_res
mov ah,09h
int 21h
mov al, ascii_bcd
call print_num


; ==========================
; BCD → ASCII SECTION
; ==========================
mov dx, offset msg_bcd
mov ah,09h
int 21h

mov al, bcd_in
add al, 30h
mov bcd_ascii, al

mov dx, offset msg_res
mov ah,09h
int 21h

mov dl, bcd_ascii
mov ah,02h
int 21h


; ==========================
; EXIT
; ==========================
mov ah,4ch
int 21h

main endp


; ==========================
; PRINT NUMBER (SINGLE DIGIT)
; ==========================
print_num proc
add al,30h
mov dl,al
mov ah,02h
int 21h
ret
print_num endp

end main
