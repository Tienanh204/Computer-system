%include "io.inc"

section .data
    tb1 db "La so chinh phuong", 0
    tb2 db "Khong la so chinh phuong", 0
    fmt db "%d", 0

section .bss
    n resd 1

section .text
global _main

_main:
    mov ebp, esp  ; for correct debugging
    push n
    push fmt
    call scanf
    add esp, 8
    
    mov eax, [n]
    mov esi, 1
    
checkSquare:
    mov ebx, esi
    imul ebx, ebx 
    
    cmp ebx, eax
    je isSquare
    
    inc esi
    cmp esi, eax
    jle checkSquare 
    
    jmp notSquare
  
isSquare:
    push tb1
    call printf
    add esp,4
    xor eax, eax
    ret
    
notSquare:
    push tb2
    call printf
    add esp,4
    xor eax, eax
    ret
