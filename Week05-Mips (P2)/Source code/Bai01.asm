.data
   tb1: .asciiz "Nhap n: "
   tb2: .asciiz "La so nguyen to"
   tb3: .asciiz "Khong la so nguyen to"
  
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
  
   #Neu n<1
   ble $s0, 1, notPrime
  
   #Neu n=2
   li $t0, 2
   beq $s0, $t0, isPrime
  
   # i=0
   li $t0, 2
 

Loop:
  
   #Neu n%i==0 => Khong la so nguyen to
   div $s0, $t0
   mfhi $t1
   beq $t1, $zero, notPrime
  
   # i++
   addi $t0, $t0, 1
  
   #Neu i^2 <= n thi Lap
   mult $t0, $t0
   mflo $t1
   ble $t1 $s0, Loop
  
   j isPrime
  
notPrime:
   #Xuat tb3
   li $v0, 4
   la $a0, tb3
   syscall
   j endProgram

isPrime:
   #Xuat tb3
   li $v0, 4
   la $a0, tb2
   syscall
   j endProgram
  
endProgram:
   li $v0, 10
   syscall
