.data
	Func4Uno: .space 32
	Func4Dos: .space 32
	Func4Tres: .space 32
	
	pregunta: .asciiz "Introduce un numero natural: "
	
	imprimirCodigo: .asciiz "el código de la operación es : "
	regImprimir: .asciiz "\n  y se han usado los registros: "
	regRs: .asciiz "rs es "
	regRt: .asciiz " | rt es "
	regRd: .asciiz " | rd es "
	
	RsFun3: .word g0
		g0: .asciiz "$zero"
		g1: .asciiz "$at"
		g2: .asciiz  "$v0"
		g3: .asciiz "$v1"
		g4: .asciiz  "$a0"
		g5: .asciiz  "$a1"
		g6: .asciiz "$a2"
		g7: .asciiz "$a3"
		g8: .asciiz  "$t0"
		g9: .asciiz  "$t1"
		g10: .asciiz "$t2"
		g11: .asciiz "$t3"
		g12: .asciiz "$t4"
		g13: .asciiz "$t5"
		g14: .asciiz "$t6"
		g15: .asciiz "$t7"
		g16: .asciiz "$s0"
		g17: .asciiz "$s1"
		g18: .asciiz "$s2"
		g19: .asciiz "$s3"
		g20: .asciiz "$s4"
		g21: .asciiz "$s5"
		g22: .asciiz "$s6"
		g23: .asciiz "$s7"
		g24: .asciiz "$t8"
		g25: .asciiz "$t9"
		g26: .asciiz "$k0"
		g27: .asciiz "$k1"
		g28: .asciiz  "$gp"
		g29: .asciiz "$sp"
		g30: .asciiz "$fp"
		g31: .asciiz "$ra"
	
   	vector: .word g0,g1,g2,g3,g4,g5,g6,g7,g8,g9,g10,g11,g12,g13,g14,g15,g16,g17,g18,g19,g20,g21,g22,g23,g24,g25,g26,g27,g28,g29,g30,g31


.text

		
		li $v0, 4  #preguntamos un numero 
		la $a0, pregunta
		syscall
		li $v0, 5
		syscall
		
		
		la $a1, Func4Uno	# direcciones donde se guardan los strings 
		la $a2, Func4Dos
		la $a3, Func4Tres
		
		
		move $a0, $v0
		jal FEj4
		move $t0, $v0	
		
		la $a0, imprimirCodigo	
		li $v0, 4
		syscall
		move $a0, $t0
		li $v0, 1
		syscall
		
		la $a0, regImprimir	
		li $v0, 4
		syscall
		
		la $a0, regRs	#imprimimos el registro RS
		syscall
		la $a0, Func4Uno
		lw $a0, 0($a0)
		syscall
		
		la $a0, regRt	#imprimimos el registro RT
		syscall
		la $a0, Func4Dos
		lw $a0, 0($a0)
		syscall
		
		la $a0, regRd	#imprimimos el registro RD
		syscall
		la $a0, Func4Tres
		lw $a0, 0($a0)
		syscall
		 
		li $v0, 10
		syscall
			
FEj3:
		 
		blt $a0, 0, salirF3
		bgt $a0, 31, salirF3
		
		li $t0, 4
		mul $t1, $a0, $t0
		
		la $t2, vector
		add $t2, $t2, $t1
		lw $t3, 0($t2)
		
		sw $t3, 0($a1)
		
		li $v0, 1
		jr $ra
		
		
	salirF3:
		
		
		li $v0, 1
		jr $ra
		
Distinguir:	
		lw $s2, 12($sp)
		lw $s1, 8($sp)
		lw $s0, 4($sp)
		lw $ra, 0($sp)
		addi $sp, $sp, 16
	
		li $v0, 1 #Si la insstruccion no es de tipo R, en v0 hay un 1
		jr $ra	
	
FEj4:
		
		addi $sp, $sp, -16   #Guardamos valore en la pila
		sw $ra, 0($sp)
		sw $s0, 4($sp)
		sw $s1, 8($sp)
		sw $s2, 12($sp)
	
		add $s0, $zero, $a0	
		srl $s1, $s0, 26		
		bne $s1, $zero, Distinguir
		
		# rs
		srl $s1, $s0, 21		#guardamos en s1 los 221 primeros bitss
		li $s2, 0x03E
		and $s1, $s1, $s2		#sacamos los 5 bits del campo rs
			
		move $a0, $s1		#llamamos a la FEj3 y guardamos en a1 el registro usado
		jal FEj3
		
		
		
		# rd
		srl $s1, $s0, 11		#guardamos en s1 los 11 primeros bits
		li $s2,0x00001F
		and $s1, $s1, $s2		#sacamos los 5 bits del campo rd
			
		move $a0, $s1			#llamamos a la FEj3 y guardamos en a1 el registro usado
		move $a1, $a3		
		jal FEj3
		
		# rt	
		srl $s1, $s0, 16		#guardamos en s1 los 16 primeros bits
		li $s2, 0x001F
		and $s1, $s1, $s2		#sacamos los 5 bits del campo rt
			
		move $a0, $s1
		move $a1, $a2		
		jal FEj3
		
		lw $s2, 12($sp)	#Sacamos loss valores de la pila
		lw $s1, 8($sp)
		lw $s0, 4($sp)
		lw $ra, 0($sp)
		addi $sp, $sp, 16

		li $v0, 0
		jr $ra
				
		
		
		
