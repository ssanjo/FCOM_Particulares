.data
#entregable 1
Pregunta1: .asciiz "Introduzca un número natural: "
MensajeSuma: .asciiz "si sumamos los "
MensajePrimNat: .asciiz " primeros números pares, nos da "


#entregable 2

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


#entregable 3
Pregunta3: .asciiz "Introduzca su cadena: "

Palabra: .space 20

MaximaLongitud: .word 20

mensaje_clave_incorrecta: .asciiz "Clave incorrecta"

salida: .space 20


.text
main:

	jal Entregable1
	jal Entregable2
	jal Entregable3
	j Fin

Entregable1:

	addi $sp, $sp, -4   #Guardamos valore en la pila
	sw $ra, 0($sp)
	
	addi $a1,$0,1	#  Contador
	
	
	li $v0, 4     	# Imprime la solicitud del numero
	la $a0, Pregunta1   
	syscall       	

	
	li $v0, 5 # Leer el número 	
	syscall           
	move $t0, $v0	# Movemos el num a t0
	blt $t0,$zero, EsNegativo
	j NoEsNegativo
	
	EsNegativo:
	
		addi $t8, $zero,-1
		mul $t0,$t0,$t8
		
	NoEsNegativo:
	
		srl $t1,$t0,1	#dividir 
	
	
	
	SumPar:
	
	bgt $a1, $t1, FinBucle	# Cuando ha acabado sale del bucle
	sll $t2, $a1, 1	
	add $t3, $t3, $t2	
	addi $a1, $a1, 1	
	j SumPar
	
	FinBucle:
	
	li $v0, 4            
	la $a0, MensajeSuma	 
	syscall              
	
	li $v0, 1      
	addi $a1, $a1, -1    
	move $a0, $a1       
	syscall
	            
	li $v0, 4            # Cargar el código de la syscall para imprimir un string
	la $a0, MensajePrimNat 	 
	syscall
	            
	li $v0, 1            
	move $a0, $t3 	
	syscall   
	
	  #Guardamos valore en la pila
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra           
	
Entregable2:

		
		addi $sp, $sp, -4   #Guardamos valore en la pila
		sw $ra, 0($sp)

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
		
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		jr $ra
			
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


Entregable3:
	j Ej7

	Ej6:

	addi $sp, $sp, -4   #Guardamos valore en la pila
	sw $ra, 0($sp)
	
	
	li $v0, 4       # Print pregunta   
	la $a0, Pregunta3	 
	syscall  
	
	la $a0, Palabra
	li $v0 , 8 # Leer cadena con longitud maxima 20
	
	lw $a1 , MaximaLongitud
	syscall
	
	move $t0 , $a0
	
	BucleEj6:
	
		
		lb $t1, 0($t0)
		beq $t1, 10,  SalidaEj6
		addi $t0, $t0 , 1
		j BucleEj6
	
		
		
	SalidaEj6:
	
	sb $zero, 0($t0)
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	
	

# Implementación de la función de cifrado del César
	Ej7:
    
    # Verificar si la clave es mayor que 100
    	jal Ej6
    

    
    
   	 la $a2, salida
    	li $a1, 4 #clave
    	li $t0, 100
    	bgt $a1, $t0, clave_mayor_100
    	ble $a1, $zero, clave_mayor_100
    
    	move $t0 , $a0 
	move $t1, $a2
    	# Inicializar variables


	cifrado_loop:
    	lb $t3, 0($t0)     # Cargar el carácter actual de la cadena original
    	beqz $t3, cifrado_fin # Si el carácter es nulo, terminar el cifrado

    	# Aplicar el desplazamiento en la tabla ASCII
    	add $t3, $t3, $a1

    	# Verificar si el carácter cifrado está dentro del rango imprimible
    	li $t4, 32         # ASCII del primer carácter imprimible
    	li $t5, 127        # ASCII del último carácter imprimible
    	blt $t3, $t4, clave_incorrecta    # Si el carácter cifrado es menor que 32, clave incorrecta
    	bgt $t3, $t5, clave_incorrecta    # Si el carácter cifrado es mayor que 127, clave incorrecta

    	# Almacenar el carácter cifrado en la cadena cifrada
    	sb $t3, 0($t1)

    	# Incrementar los índices de las cadenas
    	addi $t0, $t0, 1   # Avanzar al siguiente carácter de la cadena original
    	addi $t1, $t1, 1   # Avanzar al siguiente espacio de la cadena cifrada

    	# Volver al inicio del bucle
    	j cifrado_loop

	cifrado_fin:
    	li $v0, 0          # Código de salida: todo es correcto
    	j Fin          # Retornar

	clave_mayor_100:

    	li $v0, 1  #Código de salida: clave incorrecta
      
    
    	j cargar_clave_incorrecta      # Salir de la función sin retornar la cadena cifrada

	clave_incorrecta:

    	li $v0, 2          # Código de salida: algún carácter cifrado está fuera del rango imprimible
   
    	j cargar_clave_incorrecta     # Salir de la función sin retornar la cadena cifrada

	cargar_clave_incorrecta:
	 
	 la $t0 mensaje_clave_incorrecta
	 move $t1, $a2
	
	loop_clave:

	lb $t3, 0($t0)  
	 
	   
	beqz $t3, Fin
	 
	sb $t3, 0($a2)
	
	addi $t0, $t0, 1   # Avanzar al siguiente carácter de la cadena original
	addi $t1, $t1, 1   # Avanzar al siguiente espacio de la cadena cifrada
	 
	j loop_clave
	
Fin:
	li $v0, 10      
	syscall   
	
	            
