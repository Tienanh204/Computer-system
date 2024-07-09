
.data
   tb1: .asciiz "Nhap n: "
   tb2: .asciiz "La so chinh phuong"
   tb3: .asciiz "Khong la so chinh phuong"
 
   n: .word 0
 
.text
main:
    #Xuat TB1
    li $v0, 4
    la $a0, tb1
    syscall
  
    #Nhap n
    li $v0, 5
    syscall
    sw $v0, n
  
    #Load gia tri n vao thanh ghi $s0
    lw $s0, n
     
    #i=0
    li $t0, 0
    

checkSquare:
    mult $t0, $t0
    mflo $t1
    #Neu i*i > n
    bgt $t1, $s0, notSquareNum
    
    #Neu i*i == n
    beq $t1, $s0, isSquareNum
    # i++ 
    addi $t0, $t0, 1
    # Neu i<=n  Loop
    j checkSquare

isSquareNum:
   #Xuat tb2
   li $v0, 4
   la $a0, tb2
   syscall
   j endProgram 
  
notSquareNum:
   #Xuat tb3
   li $v0, 4
   la $a0, tb3
   syscall
   j endProgram

  
endProgram:
   li $v0, 10
   syscall
