%include "io.inc"

section .data
    tb1 db "La Nguyen To", 0
    tb2 db "Khong la Nguyen To", 0
    fmt db "%d", 0

section .bss
    n resd 1

section .text
global _main
_main:
    mov ebp, esp; for correct debugging
    ; Nhap n
    push n
    push fmt
    call _scanf
    add esp, 8

    mov esi,2
    
    mov eax, [n]
    cmp eax,2
    jl notPrime
    
    cmp eax,2
    je continue
    
Loop:
    xor edx,edx
    mov eax, [n]
    div esi
    
    cmp edx, 0
    je notPrime
    jmp continue
    

notPrime:
    push tb2
    call printf
    add esp, 4
    
    xor eax, eax
    ret
    
    
continue:
    inc esi
    cmp esi,[n]
    jl Loop
    
    push tb1
    call printf
    add esp, 4
    
    xor eax, eax
    ret


    

