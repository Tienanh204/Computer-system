%include "io.inc"

section .data
    tb1 db "Mang vua nhap la: ", 0
    tb2 db 10, "Cac so nguyen to: ", 0
    tb3 db 10, "Gia tri lon nhat: ", 0
    tb4 db 10, "Trung binh mang: %d/%d ", 0
    fmt1 db "%d", 0
    fmt2 db "%3d", 0

section .bss
    arr resd 100
    n resd 1
    j resd 1

section .text
global _main

_main:
; Nhap chuoi
    mov ebp, esp; 
    
    push n
    push fmt1
    call scanf
    add esp, 8
    
   
    mov ebx, arr 
    mov esi, 0
    Input.loop:
       
        push ebx
        push fmt1
        call scanf
        add esp, 8
        
        add ebx, 4
        inc esi
        
        cmp esi, [n]
        jl Input.loop
    
; Xuat mang

    push tb1
    call printf
    add esp, 4
    
    ; Khoi tao
    mov ebx, arr
    mov esi, 0    ; i = 0
    Xuat.Lap:
        ; In phan tu thu a[i]
        push dword [ebx]
        push fmt2
        call printf
        add esp, 8
        ; Tang dia chi mang 
        add ebx, 4
        ; Tang i
        inc esi
        ; Lap neu i < n
        cmp esi, [n]
        jl Xuat.Lap
        
; Xuat so nguyen to 
    push tb2
    call printf
    add esp, 4
   
    mov ebx, arr
    mov esi, 0    ; i = 0
    
    CheckLoop:
        cmp dword [ebx], 2
        jl Continue
       
        mov [j], esi
        mov esi, 2
        
        CheckInnerLoop:
            ; So sanh: neu a[j] == ebx thi no la so nguyen to
            cmp esi, dword [ebx]
            je IsPrime
        
            ; n % esi
            xor edx, edx
            mov eax, dword [ebx]
            mov ecx, esi
            div ecx
        
            cmp edx, 0
            je Continue
            inc esi ; j++ 
            jmp CheckInnerLoop
        
        IsPrime:
            push dword [ebx]
            push fmt2
            call printf
            add esp, 8
            jmp Continue
        
        Continue:
            mov esi, dword [j]

            add ebx, 4
            inc esi

            cmp esi, [n]
            jl CheckLoop


; Xuat phan tu lon nhat trong mang
    push tb3
    call printf
    add esp, 4
    
    ; Khoi tao
    mov ebx, arr
    mov esi, 0    ; i = 0
    mov eax, dword [ebx] ; max = a[0]
    MaxLoop:
        cmp eax, dword [ebx]
        jl UpdateMax
        ContinueMax:

        add ebx, 4
        inc esi
        ; Loop if i < n
        cmp esi, [n]
        jl MaxLoop
        je PrintMax
    
    UpdateMax:
        mov eax, dword [ebx]
        jmp ContinueMax
        
    ; in ra phan tu lon nhat
    PrintMax:
        push eax
        push fmt2
        call printf
        add esp, 8
        
; Xuat ra trung binh mang        
    mov ebx, arr ; ebx = arr
    mov eax, 0 ; sum = 0
    mov esi, 0;
    
AverageLoop:

    add eax, dword [ebx]
    
    add ebx, 4
    inc esi
    ; Neu i < n, continue
    cmp esi, dword [n]
    jl AverageLoop
    jmp PrintAverage
    

PrintAverage:
    ; average = sum / n
    push dword [n]
    push eax
    push tb4
    call printf
    add esp, 12

    End:
        xor eax, eax
        ret