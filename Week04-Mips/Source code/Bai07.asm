
.data 
tb1: .asciiz "Nhap n: "
tb2: .asciiz "a["
tb3: .asciiz "]: "
tb4: .asciiz "Mang vua nhap: "
n: .word 0
arr: .space 100
.text 
	#xuat tb1
	li $v0,4	
	la $a0,tb1
	syscall 

	#nhap so nguyen
	li $v0,5
	syscall 

	#luu v0 vao n
	sw $v0,nS

	#load n vao s0
	lw $s0,n

	#Load dia chi arr vao s1
	la $s1,arr

	#khoi tao vong lap
	li $t0,0 # i = 0
Nhap.Lap:
	#xuat tb2
	li $v0,4
	la $a0,tb2
	syscall 

	#xuat i
	li $v0,1
	move $a0,$t0
	syscall 
	
	#xuat tb3
	li $v0,4
	la $a0,tb3
	syscall 

	#Nhap so nguyen
	li $v0,5
	syscall 

	#Luu v0 vao a[i]
	sw $v0,($s1)

	#tang dia chi mang
	addi $s1,$s1,4

	#tang i
	addi $t0,$t0,1

	#neu i < n thi lap
	blt $t0,$s0,Nhap.Lap

	#xuat tb4
	li $v0,4
	la $a0,tb4
	syscall 

	#Load dia chi mang vao s1
	la $s1,arr

	#khoi tao vong lap
	li $t0,0 # i = 0
Xuat.Lap:
	#xuat a[i]
	li $v0,1
	lw $a0,($s1)	
	syscall 

	#xuat khoang trang
	li $v0,11
	li $a0,' '
	syscall
	
	#tang dia chi mang
	addi $s1,$s1,4

	#tang i
	addi $t0,$t0,1

	#neu i < n thi lap
	blt $t0,$s0,Xuat.Lap
