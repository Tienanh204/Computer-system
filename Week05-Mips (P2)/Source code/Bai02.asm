
.data
   tb1: .asciiz "Nhap n: "
   tb2: .asciiz "La so nguyen hoan thien"
   tb3: .asciiz "Khong la so nguyen hoan thien"
 
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
     
    #i=1
    li $t0, 1
    
    #Khoi tao tong cac uoc la 0
    li $s1, 0
    
    #Tinh n-2
    subi $s2, $s0, 1

checkNum:
    bgt $t0, $s2, endCheckNum
    div $s0, $t0
    mfhi $t1
    
    beq $t1, $zero, addSum
    addi $t0, $t0, 1
    j checkNum

addSum:
    add $s1, $s1, $t0
    addi $t0, $t0, 1
    j checkNum
    
endCheckNum:
    beq $s1, $s0, isComplete
    j notComplete
    
isComplete:
   #Xuat tb2
   li $v0, 4
   la $a0, tb2
   syscall
   j endProgram 
  
notComplete:
   #Xuat tb3
   li $v0, 4
   la $a0, tb3
   syscall
   j endProgram

  
endProgram:
   li $v0, 10
   syscall
