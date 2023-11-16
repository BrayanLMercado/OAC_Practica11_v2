; Nombre: Brayan Lopez Mercado
; Matricula: 1280838
; Fecha: 16/Nov/2023
; Materia: Organizacion y Arquitectura De Computadoras
; Practica 11
.model tiny
locals
.data
    NoteOfTheDayP11 DB 'Necesito Dormir',10,13,0
    NL DB 13,0
    outputDecTag DB 'Salida Con PrintDec: ',10,13,0
    outputHexTag DB 'Salida Con PrintHex',10,13,0

.code
   org 100h
    
Main proc
    start:mov sp,0fffh
    mov ax,101011110001b
    call printHex
    mov cl,32
    call putchar
    call printDec
    call newLine
    jmp start
    ret
    endp

printHex proc
 push ax
 push bx
 push cx
 push dx
 xor cx,cx
 xor dx,dx
 mov bx,10h
 .divide:
     div bx
     push dx ;Enviar el residuo al stack
     inc cx  
     xor dx,dx
     cmp ax,0 ;El numero ya es 0?
     je .print ;Si
     jmp .divide ;No
.print:
     pop dx ;Tomar el digito del stack
     cmp dx,9 ;Se necesita Ajuste?
     jbe .menor ;No
     add dx,7 ;Si
     .menor:
     add dx,'0'
     mov ah,2h
     int 21h
     loop .print
     pop dx
     pop cx
     pop bx
     pop ax
     ret
endp 
    
 printDec proc
 push ax
 push bx
 push cx
 push dx
 xor cx,cx 
 xor dx,dx
 mov bx,10
 divide:
     div bx
     push dx ;Enviar el residuo al stack
     inc cx
     xor dx,dx
     cmp ax,0 ;El numero ya es 0?
     je print ;Si
     jmp divide ;No
 print:
     pop dx ;Tomar el digito del stack
     add dx,'0'
     mov ah,2h
     int 21h
     loop print
     pop dx
     pop cx
     pop bx
     pop ax
     ret
 endp
 
putchar proc
 push ax
 push cx
 push dx
 mov dl,cl
 mov ah,2
 int 21h
 pop dx
 pop cx
 pop ax
 ret
 endp

newLine proc
 push cx
 mov cl,10
 call putchar
 mov cl,13
 call putchar
 pop cx
 ret
endp

end Main
   
    