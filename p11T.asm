; Nombre: Brayan Lopez Mercado
; Matricula: 1280838
; Fecha: 16/Nov/2023
; Materia: Organizacion y Arquitectura De Computadoras
; Practica 11
.model tiny
locals
.data
    Mens DB 'Hola Mundo',10,13,0
.code
    org 100h
  
principal proc
    mov sp,0fffh
    @@ini0: mov dx,1
    @@ini1: mov cx,dx
    @@sigue: mov al,'x'
    call putchar
    loop @@sigue
    mov al,10
    call putchar
    mov al,13
    call putchar
    inc dx
    cmp dx,20
    jbe @@ini1
    jmp @@ini0
    ret
    endp

putchar proc
 push ax
 push dx
 mov dl,al
 mov ah,2
 int 21h
 pop dx
 pop ax
 ret
 endp
 
 end principal
   