.data
   menu: .asciiz "============= Menu ===========\n1. Nhap mang \n2. Xuat mang \n3. Liet ke cac so nguyen to \n4. Gia tri lon nhat trong mang\n5. Trung binh mang\n0. Thoat\n======================\nNhap lua chon cua ban: "
   tb1: .asciiz "Nhap n: "
   tb2: .asciiz "A["
   tb3: .asciiz "]: "
   tb4: .asciiz "Mang vua nhap: "
   tb5: .ascii "Cac so nguyen to: "
   tb6: .asciiz "Gia tri lon nhat: "
   tb7: .asciiz "Trung binh mang: "
   tb8: .asciiz " du "
   exitMsg: .asciiz "Cam on da su dung chuong trinh"
   n: .word 0
   arr: .space 100

.text
main: 
   # Hien thi menu
   li $v0, 4
   la $a0, menu
   syscall
   # Nhap lua chon
   li $v0, 5
   syscall
   move $t0, $v0 # Luu lua chon

   # Xu ly lua chon
   beq $t0, 1, choice1
   beq $t0, 2, choice2
   beq $t0, 3, choice3
   beq $t0, 4, choice4
   beq $t0, 5, choice5
   beq $t0, 0, exit
   j main 

#----------------------------------------------
#1. Nhap mang n so nguyen
choice1:
   #xuat tb1
   li $v0,4	
   la $a0,tb1
   syscall 

   #nhap so nguyen
   li $v0,5
   syscall 
   
   #luu v0 vao n
   sw $v0,n

   #load n vao s0
   lw $s0,n
 
   #Load dia chi arr vao s1
   la $s1,arr
   
   #khoi tao vong lap
   li $t0,0 # i = 0 
     
   j Nhap

Nhap:
    #xuat tb2
    li $v0,4
    la $a0,tb2
    syscall 

    #xuat i
    li $v0,1
    move $a0,$t0
    syscall 
	
    #xuat tb3
    li $v0,4
    la $a0,tb3
    syscall 
    
    #Nhap so nguyen
    li $v0,5
    syscall 
    
    #Luu v0 vao a[i]
    sw $v0,($s1)
    
    #tang dia chi mang
    addi $s1,$s1,4
    
    #tang i
    addi $t0,$t0,1
    
    #neu i < n thi lap
    blt $t0,$s0,Nhap
    
    j main
#----------------------------------------------
#2. Xuat mang
choice2:
    #xuat tb4
    li $v0,4
    la $a0,tb4
    syscall 
    
    #Load dia chi mang vao s1
    la $s1,arr
    
    #khoi tao vong lap
    li $t0,0 # i = 0
    
    j Xuat
Xuat:
    #xuat a[i]
    li $v0,1
    lw $a0,($s1)	
    syscall 
    
    #xuat khoang trang
    li $v0,11
    li $a0,' '
    syscall
    
    #tang dia chi mang
    addi $s1,$s1,4
    
    #tang i
    addi $t0,$t0,1
    
    #neu i < n thi lap
    blt $t0,$s0,Xuat
    
    li $v0,11
    li $a0,'\n'
    syscall
    j main
#----------------------------------------------
#3. Liet ke cac so nguyen to trong mang
choice3:
    li $v0, 4
    la $a0, tb5
    syscall
    
    lw $s0,n
    #Load dia chi arr vao s1
    la $s1,arr
    #khoi tao vong lap
    li $t0,0 # i = 0 
    
    primeLoop:
        lw $t1, ($s1) 
   
        move $a0, $t1
        jal isPrime
       
        # Neu $v0 = 1, phan tu la so ngto va in ra
        beq $v0, 1, printPrime
        # i++, arr+=4
        addi $t0, $t0, 1
        addi $s1, $s1, 4
        blt $t0, $s0, primeLoop
    
    li $v0,11
    li $a0,'\n'
    syscall
    j main

isPrime:
    li $t2, 1
    ble $a0, $t2, notPrime

    li $t2, 2
    beq $a0, $t2, printPrime
    isPrimeLoop:
        div $a0, $t2
        mfhi $t3
        beq $t3, 0, notPrime
        addi $t2, $t2, 1
        mult $t2, $t2
        mflo $t3
        ble $t3, $a0, isPrimeLoop
    li $v0, 1
    jr $ra
    
notPrime:
    li $v0, 0
    jr $ra

printPrime:
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0, 11
    li $a0, ' '
    syscall
    
    addi $t0, $t0, 1
    addi $s1, $s1, 4
    
    j primeLoop
    
   
#----------------------------------------------
#4. Tim gia tri lon nhat strong mang
choice4:
    li $v0, 4
    la $a0, tb6
    syscall
    
    #Load dia chi arr vao s1
    la $s1,arr
    li $t0, 0 #i = 0
    lw $t1, 0($s1) 
    
    maxLoop:
        lw $t2, ($s1) 
        bge $t1, $t2, NotMax 
        move $t1, $t2 
    NotMax:
        addi $s1, $s1, 4
        addi $t0, $t0, 1 
        blt $t0, $s0, maxLoop 
    
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0,11
    li $a0,'\n'
    syscall
    
    j main
    
#----------------------------------------------
#5. Tinh trung binh mang
choice5:
    li $v0, 4
    la $a0, tb7
    syscall
   
    la $s1,arr
    li $t0, 0 #i = 0
    
     #Luu tong cac so trong mang
     li $s2, 0
    
    avgLoop:
        lw $t2, ($s1) 
        add $s2, $s2, $t2

        addi $s1, $s1, 4
        addi $t0, $t0, 1 
        blt $t0, $s0, avgLoop 
    
    div $s2, $s0
    mflo $t0
    mfhi $t1
    
    li $v0, 1
    move $a0, $t0
    syscall
    
    li $v0, 4
    la $a0, tb8
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall
    
    li $v0,11
    li $a0,'\n'
    syscall
    
    j main
#----------------------------------------------    
exit:
    li $v0, 4
    la $a0, exitMsg
    syscall
    li $v0, 10
    syscall
    
    
