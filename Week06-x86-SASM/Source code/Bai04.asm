%include "io.inc"

section .data
    tb db "Nhap n: ", 0
    tb1 db "La so doi xung", 0
    tb2 db "Khong la so doi xung", 0
    fmt db "%d", 0

section .bss
    n resd 1
    reversed resd 1
    temp resd 1

section .text
global CMAIN

CMAIN:
    
    push n
    push fmt
    call scanf
    add esp, 8

   
    mov eax, [n]
    mov [temp], eax

    mov dword [reversed], 0

Loop:
    
    mov eax, [temp]
    mov edx, 0
    mov ebx, 10
    div ebx

   
    mov ecx, [reversed]
    imul ecx, 10
    add ecx, edx
    mov [reversed], ecx

   
    mov [temp], eax

   
    cmp eax, 0
    jnz Loop

   
    mov eax, [n]
    cmp eax, [reversed]
    je Sodx

    
    push tb2
    call printf
    add esp, 4
    jmp end

Sodx:
   
    push tb1
    call printf
    add esp, 4

end:
    xor eax, eax
    ret