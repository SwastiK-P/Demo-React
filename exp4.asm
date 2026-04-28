.model small
.stack 100h

.data
msg1 db 0dh,0ah,"Enter a string: $"
msg2 db 0dh,0ah,"Reversed string: $"

; DOS buffered input format
input db 20          ; max length
      db ?           ; actual length
      db 20 dup(?)   ; buffer

revstr db 20 dup('$')

.code
main proc

mov ax,@data
mov ds,ax
mov es,ax

; ==========================
; DISPLAY INPUT MESSAGE
; ==========================
mov ah,09h
lea dx,msg1
int 21h

; ==========================
; TAKE STRING INPUT
; ==========================
mov ah,0Ah
lea dx,input
int 21h


; ==========================
; SET POINTERS
; ==========================
; SI → last character of input
mov cl,input+1       ; length
mov ch,0
lea si,input+2       ; start of string
add si,cx
dec si               ; last character

; DI → destination buffer
lea di,revstr


; ==========================
; REVERSE STRING LOOP
; 👉 Keep this block for "reverse logic"
; ==========================
reverse_loop:
mov al,[si]
mov [di],al
dec si
inc di
loop reverse_loop


; ==========================
; ADD STRING TERMINATOR
; ==========================
mov al,'$'
mov [di],al


; ==========================
; DISPLAY RESULT MESSAGE
; ==========================
mov ah,09h
lea dx,msg2
int 21h


; ==========================
; DISPLAY REVERSED STRING
; ==========================
mov ah,09h
lea dx,revstr
int 21h


; ==========================
; EXIT
; ==========================
mov ah,4ch
int 21h

main endp
end main

