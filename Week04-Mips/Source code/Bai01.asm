.data
tb1: .asciiz "Nhap chuoi: "
tb2: .asciiz "Chuoi vua nhap: "
str: .space 30

.text
#Xuat thong bao 1
li $v0, 4
la $a0, tb1
syscall

#Nhap chuoi
li $v0, 8
la $a0, str
li $a1, 31
syscall

#Xuat Thong bao 1
li $v0, 4
la $a0, tb2
syscall

#Xuat xhuoi
li $v0, 4
la $a0, str
syscall