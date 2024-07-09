.data
tb1: .asciiz "Nhap vao ki tu: \n"
tb2: .asciiz " La so\n"
tb3: .asciiz " La chu thuong\n"
tb4: .asciiz " La chu in hoa\n"
numa: .word 0
kitu: .word 0

.text
main:
    # Hiển thị thông báo "Nhap vao ki tu: "
    li $v0, 4           
    la $a0, tb1        
    syscall             
    
    # Nhập ký tự
    li $v0, 12          
    syscall             
    move $t0, $v0       # Lưu ký tự
    
    # Kiểm tra ký tự
    # Nếu là số
    li $t1, 48         
    li $t2, 57          
    blt $t0, $t2, isDigit  
    
    # Nếu là chữ in hoa
    li $t1, 65         
    li $t2, 90         
    blt $t0, $t2, isUpper
    
    # Nếu là chữ thường
    li $t1, 97         
    li $t2, 122         
    blt $t0, $t2, isLower

isDigit:
    # Xuất kết quả là số
    li $v0, 4           
    la $a0, tb2        
    syscall             
    j exit

isLower:
    # Xuất kết quả là chữ thường
    li $v0, 4           
    la $a0, tb3        
    syscall             
    j exit

isUpper:
    # Xuất kết quả là chữ in hoa
    li $v0, 4           
    la $a0, tb4        
    syscall             
    j exit

exit:
    # Kết thúc chương trình
    li $v0, 10          
    syscall
