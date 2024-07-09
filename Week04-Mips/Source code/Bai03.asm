.data
tb1: .asciiz "Nhap mot ky tu: "
tb2: .asciiz "Ky tu in thuong: "
str: .space 1

.text
#Xuat thong bao 1
li $v0, 4
la $a0, tb1
syscall

#Nhap ky tu
li $v0, 12
syscall
move $a0, $v0


#Xy ly yeu cau
li $t0, 0
addi $t0,$a0,32

li $v0, 11
la $a0, '\n'
syscall

 #Xuat thong bao 2 va xuat ket qua
li $v0, 4
la $a0, tb2
syscall

li $v0, 11
move $a0, $t0
syscall


