.data
tb1: .asciiz "Nhap mot so: "
tb2: .asciiz "Tong tu 1 den "
n: .word 0

.text
#Xuat TB1 & Nhap n
li $v0, 4
la $a0, tb1
syscall

li $v0,5
syscall
#Luu v0 vao n
sw $v0, n
lw $t1, n

li $s0, 0#s=0
li $t0, 1# i =1

TinhTong:
 add $s0,$s0,$t0#s=s+i
 addi $t0,$t0,1#i=i+1
 ble $t0, $t1, TinhTong

#Xuat ket qua
li $v0, 4
la $a0, tb2
syscall

li $v0, 1
move $a0, $t1
syscall

li $v0, 11
la $a0,':'
syscall

li $v0, 11
la $a0,' '
syscall

li $v0, 1
move $a0, $s0
syscall



