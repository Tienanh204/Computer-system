.data
tb1: .asciiz "Nhap vao mot chuoi: "
tb2: .asciiz "Chuoi nguoc lai: "
str: .space 50

.text
main:
    #Xuat TB1
    li $v0, 4
    la $a0, tb1
    syscall

    #Nhap chuoi
    li $v0, 8
    la $a0, str
    li $a1, 50 
    syscall

    # Luu dia chi vao s0
    move $s0, $a0

    # Xuat TB2 Va xu ly yeu cau
    li $v0, 4
    la $a0, tb2
    syscall

    # Goi ham inChuoiNguocLai
    move $a0, $s0
    jal inChuoiNguocLai

    # Ket thuc chuong trinh
    li $v0, 10
    syscall

# Ham in chuoi nguoc lai
inChuoiNguocLai:
    move $t0, $a0      
    li $t1, 0   
    
    #Tinh do dai chuoi
    countLength:
        lb $t2, ($t0)   
        beqz $t2, reverseString 
        addi $t1, $t1, 1 
        addi $t0, $t0, 1 
        j countLength 

    # In chuoi nguoc lai
    reverseString:
        subi $t1, $t1, 1 
        move $t0, $a0 
        add $t0, $t0, $t1 
        li $v0, 11   
        reverseLoop:
            lb $a0, ($t0) 
            beqz $a0, endReverseLoop 
            syscall         
            subi $t0, $t0, 1 
            j reverseLoop   # Lap lai
        endReverseLoop:
            jr $ra      
