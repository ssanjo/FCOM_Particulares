.data

Pregunta: .asciiz "Introduce un número: "
Error2: .asciiz "ERROR: El número introducido tiene un factor primo mayor que los considerados."
Error1: .asciiz "ERROR: El número introducido es menor que 2"
Primos: .word 2, 3, 5, 7, 11, 13, 17, 19, 0
Guardar: .space 128
SaltoDeLinea: .asciiz "\n"
Elevado: .asciiz "^"
Asterisco: .asciiz " * "
Igual: .asciiz " = "


.text

Main:

	# Solicitar al usuario un número entero
    	li $v0, 4
    	la $a0, Pregunta
    	syscall

    	# Leer el número entero ingresado por el usuario
    	li $v0, 5
    	syscall
    	move $t0, $v0  # $a0 = número a factorizar
    	
    	
    
    	# Nueva linea
    	li $v0, 4         
    	la $a0, SaltoDeLinea 
    	syscall
    
    	move $a0, $t0
	la $a1 Primos
	la $a2 Guardar
	jal FactoresPrimosEntrada

	beq $v0 , 0 , Dibujo0
	beq $v0 , 1 , Dibujo1
	j Dibujo2

	Dibujo0:
		#printea el numero ingresado
		li $v0, 1
		syscall
		
		li $v0, 4         
    		la $a0, Igual
    		syscall
		
		move $a0, $a2
		jal ImprimeFactores
		j Fin
		
	Dibujo1:
		li $v0, 4         
    		la $a0, Error1 
    		syscall
    		
    		# Nueva linea
    		li $v0, 4         
    		la $a0, SaltoDeLinea 
    		syscall
    		
    		j Fin
	Dibujo2:
		li $v0, 4         
    		la $a0, Error2 
    		syscall
    		
    		# Nueva linea
    		li $v0, 4         
    		la $a0, SaltoDeLinea 
    		syscall
    		
		j Fin

FactoresPrimosEntrada:
    	# Guarda los registros necesarios
    	addi $sp, $sp, -12
    	sw $ra, 0($sp)
    	sw $s0, 4($sp)
    	sw $s1, 8($sp)

   	# Carga de parámetros
    	move $s0, $a0     # $s0 = número a factorizar
    	move $s1, $a2     # $s1 = dirección del vector resultado

	# Verifica si el número es menor que 2
    	ble $s0, 1, NumeroMenorDeDos

    	# Inicializa el índice del vector de primos
    	li $t0, 0
    
    	move $t3, $a1
	
 	# Llamada a la función recursiva
    	jal FactoresPrimosRecursivo

    	# Restaurar registros y retornar
    	j Retornar

	FactoresPrimosRecursivo:
    	# Prolog
    	addi $sp, $sp, -4
   	 sw $ra, 0($sp)

   	# Caso base: si el número es 1, retorna
    	beq $s0, 1, VueltaAtras
    	# Cargar el primo actual del vector
    	lw $t1, 0($t3)
   	# Si es 0, terminar
    	beq $t1, $zero, FinalPrimos

    	# Dividir el número por el primo actual
    	div $s0, $t1
    
    	mfhi $t2          # $t2 = resto
    	beq $t2, $zero, FactorEncontrado  # Si la división es exacta, hemos encontrado un factor

    	# Siguiente elemento del vector de primos
    	addi $t3, $t3, 4
    	jal FactoresPrimosRecursivo
    	j Salida
    
    	FactorEncontrado:
    	
    	# Almacenar el factor primo en el vector resultado
    	mflo $s0
    	sw $t1, 0($s1)
    		
    	addi $s1, $s1, 4  # Siguiente posición del vector resultado

    	# Llamada recursiva
    	jal FactoresPrimosRecursivo
    	j Salida



	Salida:
    	# Epílogo
    	lw $ra, 0($sp)
    	addi $sp, $sp, 4
    	jr $ra
    	
    	VueltaAtras:
    	# Epílogo
    	lw $ra, 0($sp)
    	addi $sp, $sp, 4
    	li $v0, 0
    	jr $ra
    	

	NumeroMenorDeDos:
    	li $v0, 1         # El número es menor que 2
    	j Retornar

	FinalPrimos:
    	li $v0, 2         # Factor primo no encontrado en el vector de primos
    	j Retornar

	Retornar:
    	# Restaura los registros
    	lw $ra, 0($sp)
    	lw $s0, 4($sp)
    	lw $s1, 8($sp)
    	addi $sp, $sp, 12

    	jr $ra            # Retorna al programa principal
    
    
ImprimeFactores:


	
    # Guardar registros necesarios
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)

    # Cargar parámetros
    move $s0, $a0     # $s0 = dirección del vector de factores primos

    # Inicializar variables
    li $s1, 1         # $s1 = contador de repetición del factor actual
    
    lw $t1, ($s0)
    
    beq $t1, $zero, SalidaDibujo
    
   
    
ImprimirBucle:
	move $t0, $t1
	addi $s0, $s0, 4

    lw $t1, ($s0)     # Cargar el próximo factor primo
    
    
    
    beq $t1, $zero, FinalDibujo  # Si es 0, terminar
    
    beq $t1, $t0, IgualAnterior
    
    j NoIgualAnterior
    
IgualAnterior:	
	addi $s1,$s1, 1
	j ImprimirBucle
	
NoIgualAnterior:

	beq  $s1, 1 , AnteriorUnico
	j AnteriorRepetido

	AnteriorUnico:
		li $v0, 1         # syscall para imprimir un entero
    		move $a0, $t0     # Cargar el factor primo a imprimir, que es el anterior
    		syscall
    		
    		li $v0, 4         # syscall para imprimir una cadena
    		la $a0, Asterisco     # Cargar el caracter '*'
    		syscall
    		
    		

    		j ImprimirBucle
    		
		
	AnteriorRepetido:
	
		li $v0, 1         # syscall para imprimir un entero
    		move $a0, $t0     # Cargar el factor primo a imprimir
    		syscall
    		li $v0, 4         # syscall para imprimir una cadena
    		la $a0, Elevado     # Cargar el caracter '^'
    		syscall
    		li $v0, 1         # syscall para imprimir un entero
    		move $a0, $s1     # Cargar el exponente del factor primo
    		syscall
    		
    		li $v0, 4         # syscall para imprimir una cadena
    		la $a0, Asterisco     # Cargar el caracter '*'
    		syscall
    		
		li $s1, 1
		
		j ImprimirBucle
		
FinalDibujo:

	beq  $s1, 1 , AnteriorUnicoFinal
	j AnteriorRepetidoFinal

	AnteriorUnicoFinal:
		li $v0, 1         # syscall para imprimir un entero
    		move $a0, $t0     # Cargar el factor primo a imprimir, que es el anterior
    		syscall
    		
    		j SalidaDibujo

    		
    		
		
	AnteriorRepetidoFinal:
	
		li $v0, 1         # syscall para imprimir un entero
    		move $a0, $t0     # Cargar el factor primo a imprimir
    		syscall
    		li $v0, 4         # syscall para imprimir una cadena
    		la $a0, Elevado     # Cargar el caracter '^'
    		syscall
    		li $v0, 1         # syscall para imprimir un entero
    		move $a0, $s1     # Cargar el exponente del factor primo
    		syscall
    		
    		j SalidaDibujo
    		
	
	
	








SalidaDibujo:
    li $v0, 4         # syscall para imprimir una cadena

    la $a0, SaltoDeLinea # Cargar el caracter de nueva línea
        
    syscall

    # Epílogo
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    addi $sp, $sp, 12
    jr $ra            # Retornar al programa principal

    
Fin:
