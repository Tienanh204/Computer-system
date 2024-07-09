.data
   tb1: .asciiz "Nhap n: "
   tb2: .asciiz "La so doi xung"
   tb3: .asciiz "Khong la so doi xung"
 
   n: .word 0
 
.text
main:
    # Xuat tb1
    li $v0, 4
    la $a0, tb1
    syscall
  
    # Nhap n
    li $v0, 5
    syscall
    sw $v0, n
  
    # Load n vao thanh ghi $s0
    lw $s0, n
     
    # Khoi tao $s1 = n (Bien tam)
    move $s1, $s0
    # Khoi tao $s2 de luu KQ
    li $s2, 0

checkArgument:
    # Nếu n == 0, kết thúc vòng lặp
    beq $s1, $zero, endCheck
    
    # n%10
    li $t0, 10
    div $s1, $t0
    mfhi $t1 # Phan du
    
    # Cap nhap so doi xung
    mul $s2, $s2, $t0
    add $s2, $s2, $t1
    
    # n/=10
    div $s1, $t0
    mflo $s1
    
    j checkArgument

endCheck:
    beq $s2, $s0, isArgument
    j notArgument

isArgument:
   # Xuat tb2
   li $v0, 4
   la $a0, tb2
   syscall
   j endProgram 
  
notArgument:
   # Xuat tb3
   li $v0, 4
   la $a0, tb3
   syscall
   j endProgram

endProgram:
   li $v0, 10
   syscall
