.data
tb1: .asciiz "Nhap so thu nhat: "
tb2: .asciiz "Nhap so thu hai: "
tb3: .asciiz "Tong: "
tb4: .asciiz "Hieu: "
tb5: .asciiz "Tich: "
tb6: .asciiz "Thuong: "
tb7: .asciiz " du "
a: .word 0
b: .word 0

.text
#Xuat TB1 & nhap a
li $v0, 4
la $a0, tb1
syscall

li $v0, 5
syscall
sw $v0, a # Luu $v0 vao a

#Xuat TB2 & nhap b
li $v0, 4
la $a0, tb2
syscall

li $v0, 5
syscall
sw $v0, b # Luu $v0 vao b


#Xuat TB3 & Tinh tong
li $v0, 4
la $a0, tb3
syscall

lw $s0,a
lw $s1,b
add $t2,$s0,$s1

li $v0, 1
move $a0,$t2
syscall

li $v0, 11
li $a0, '\n'
syscall

#Xuat TB4 & Tinh hieu
li $v0, 4
la $a0, tb4
syscall

sub $t2,$s0,$s1

li $v0, 1
move $a0,$t2
syscall

li $v0, 11
li $a0, '\n'
syscall

#Xuat TB5 & Tinh tich
li $v0, 4
la $a0, tb5
syscall

mult $s0,$s1
mflo $t1

li $v0, 1
move $a0,$t1
syscall

li $v0, 11
li $a0, '\n'
syscall

#Xuat TB6 & Tinh Thuong
li $v0, 4
la $a0, tb6
syscall

div $s0,$s1
mflo $t1
mfhi $t2

li $v0, 1
move $a0,$t1
syscall

li $v0, 4
la $a0, tb7
syscall

li $v0, 1
move $a0,$t2
syscall


