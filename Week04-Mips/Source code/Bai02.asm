.data
tb1: .asciiz "Nhap mot ky tu: "
tb2: .asciiz "Ky tu lien truoc: "
tb3: .asciiz "Ky tu lien sau: "
str: .space 1

.text
#Xuat thong bao 1
li $v0, 4
la $a0, tb1
syscall

#Nhap ky tu
li $v0, 12
syscall
move $a0,$v0


#Xy ly yeu cau
li $t0, 0
addi $t1, $a0,1
subi $t2, $a0,1

li $v0, 11
li $a0, '\n'
syscall

#Xuat thong bao 2 va ky tu lien truoc
li $v0, 4
la $a0, tb2
syscall

li $v0, 11
move $a0, $t2
syscall

li $v0, 11
li $a0, '\n'
syscall

#Xuat thong bao 3 va ky tu lien sau
li $v0, 4
la $a0, tb3
syscall

li $v0, 11
move $a0, $t1
syscall




