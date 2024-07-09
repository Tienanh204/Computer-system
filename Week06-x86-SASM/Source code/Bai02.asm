%include "io.inc"

section .data
    tb1 db "La so nguyen hoan thien", 0
    tb2 db "Khong la so nguyen hoan thien", 0
    fmt db "%d", 0

section .bss
    n resd 1

section .text
global _main

_main:
    mov ebp, esp; for correct debugging
    push n
    push fmt
    call scanf
    add esp, 8
    
    mov esi, 1
    mov ebx,0
    
    mov eax,[n]
    cmp eax, 1
    je notComplete
    
LoopCpl:
    xor edx, edx
    mov eax, [n]
    div esi
    
    cmp edx, 0
    je addSum
    
    inc esi
    jmp checkLoop
  
addSum:
    add ebx, esi
    inc esi
    jmp LoopCpl 
 
checkLoop:
     mov eax, [n]
     cmp esi,eax
     jl LoopCpl
     
     mov eax, [n]
     cmp ebx, eax
     je isComplete
     jmp notComplete
     
isComplete:
     push tb1
     call printf
     add esp, 4
     
     xor eax, eax
     ret
     
notComplete:
     push tb2
     call printf
     add esp, 4
     
     xor eax, eax
     ret