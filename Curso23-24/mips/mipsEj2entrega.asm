.data

F: .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

.text
	la $s2, F
	sw $zero, ($s2)
	li $t0, 1
	sw $t0, 4($s2)
	li $s0, 2

	addi $s4, $zero, 1 # $s4 es la sumade F[0] y F[1]
	addi $s4, $s4, 1
	addi $s2, $s2, 8
	addi $t0, $s2, -4
	addi $t1, $s2, -8

	lw $s3, 0($t0)#s3 es F[i-1]
	lw $s4, 0($t1)#s4 es F[i-2]

loop:

	add $t2, $s3, $s4 #F[i] = F[i-1] + F[i-2];
	add $s4, $s4, $t2 # $s4 = $s4 + F[i]
	sw $t2, 0($s2)
	move $s4, $s3 #F[i-2] <-- F[i-1]
	move $s3, $t2 
	addi $s0, $s0, 1 
	addi $s2, $s2, 4 
	blt $s0, 20, loop
	
# Final del programa
li $v0, 10 
syscall