.data
tb1: .asciiz "Nhap so thu nhat: "
tb2: .asciiz "Nhap so thu hai: "
tb3: .asciiz "So lon hon la: "
tb4: .asciiz "Hai so bang nhau"

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

#So sanh 2 so
lw $s0, a
lw $s1, b
#Neu a < b
slt $t0,$s0,$s1
bne $t0,0,Less

#Neu a > b
slt $t0,$s1,$s0
bne $t0, 0, Greater

#Neu a = b
beq $s0, $s1,Equal

Less:
li $v0, 4
la $a0, tb3
syscall

li $v0, 1
move $a0, $s1
syscall

j End

Greater:
li $v0, 4
la $a0, tb3
syscall

li $v0, 1
move $a0, $s0
syscall

j End

Equal:
li $v0, 4
la $a0, tb4
syscall

j End

End:





