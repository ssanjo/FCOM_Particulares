.data
A: .word 0, 1, 1, 2, 3, 5, 8, 13, 21, 34
B: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 # Vector para números pares
C: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 # Vector para números impares
N: .word 10 

F: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 # Reserva espacio para 20 enteros (4 bytes cada uno)

.space 20

S1: .asciiz "Hola Uno Mundo Dos"

.space 14


S2: .space 32

S3: .space 32	

S4: .space 32
    
.text

#Entregable 1

main:
    la $s0, A # Carga la dirección de A en $s0
    lw $s4, N # Carga el número de elementos en A
    li $s1, 9 
    li $s2, 0 # Inicializa el acumulador
    li $s5, 0 
    li $s6, 0 

# suma en orden inverso y separa pares e impares

loop_suma_inversa:
    sll $t0, $s1, 2 # Multiplica índice por 4
    add $t1, $t0, $s0 # Suma a la dirección del vector
    lw $t2, 0($t1) 
    add $s2, $s2, $t2 
    
    # Verifica si es par o impar y lo almacena en B o C respectivamente
    andi $t3, $t2, 1 #0 si es par, 1 si es impar
    beq $t3, $zero, es_par
    j es_impar

es_par:
    sll $t4, $s5, 2 # indice para B
    la $t5, B
    add $t5, $t5, $t4
    sw $t2, 0($t5)
    addi $s5, $s5, 1
    j continua_loop

es_impar:
    sll $t6, $s6, 2 # indice para C
    la $t7, C
    add $t7, $t7, $t6
    sw $t2, 0($t7)
    addi $s6, $s6, 1

continua_loop:
    addi $s1, $s1, -1 # Disminuye el índice del bucle
    bgez $s1, loop_suma_inversa # Si no ha terminado vuelve a suma inversa

# Calcula la media aritmética
    li $t8, 10 # Número total de elementos
    div $s2, $t8
    mflo $s3 

# Invertir el vector A
    li $s1, 0 
    li $s7, 9 
invertir_loop:
    bge $s1, $s7, fin # Termina si los índices se cruzan
    sll $t0, $s1, 2 # indice inicial poe 4 (debajo indice final)
    sll $t1, $s7, 2 
    add $t0, $t0, $s0 # Dirección de inicio (y fin)
    add $t1, $t1, $s0 
    lw $t2, 0($t0) # Valor inicial (y final)
    lw $t3, 0($t1) 
    sw $t3, 0($t0) 
    sw $t2, 0($t1)
    addi $s1, $s1, 1 # icrementa índice inicial (disminuye el indice final)
    addi $s7, $s7, -1 
    j invertir_loop

fin:
    
    
#Entregable 2

	li $s4, 0
	
	la $s2, F
	sw $zero, ($s2)
	li $t0, 1
	sw $t0, 4($s2)
	li $s0, 2

	addi $t8, $zero, 1 # $t8 es la sumade F[0] y F[1]
	addi $t8, $t8, 1
	addi $s2, $s2, 8
	addi $t0, $s2, -4
	addi $t1, $s2, -8

	lw $t9, 0($t0)#t9 es F[i-1]
	lw $t8, 0($t1)#t8 es F[i-2]

loop:

	add $t2, $t9, $t8 #F[i] = F[i-1] + F[i-2];
	add $t8, $t8, $t2 # $t8 = $t8 + F[i]
	add $s4, $s4, $t2
	sw $t2, 0($s2)
	move $t8, $t9 #F[i-2] <-- F[i-1]
	move $t9, $t2 
	addi $s0, $s0, 1 
	addi $s2, $s2, 4 
	blt $s0, 20, loop
	

# Final del programa


#Entregable 3
	
	# cargar los punteros
	
	la $t2, S1
        la $s6, S1
        la $s7, S2

        BucleLectura:
	#movemos el puntero de s1 al final del string
            lb $t1, ($s6) #cargar letra
            addi $s6, $s6, 1 #mover puntero
            bne $t1, $0, BucleLectura #si no hemos llegado al final del string seguimos moviendo el puntero
            
	#ajuste de la posicion(el puntero estaba a la derecha del fin del string hay que moverlo)
        addi $s6, $s6, -1

        BucleCopiarInverso:

            addi $s6, $s6, -1 # mover izquierda puntero de s1
            lb $t1, ($s6)
            sb $t1, ($s7)
            addi $s7, $s7, 1 #mover derecha puntero de s2
            blt $t2, $s6, BucleCopiarInverso # mientras no lleguemos al final del string seguimos
            
# parte de copiar posiciones impares de s1 y s2
	
	la $s6, S1
        la $s7, S2
        la $t3, S3
        la $t4, S4
        li $t5, 32

        addi $s6, $s6, -1

        BucleImparS1:

            addi $s6, $s6, 1 # mover puntero s1
            lb $t6, ($s6)
            beq $t6, $t5, BucleParS1 # si la letra es igual a espacio saltamos a par
            beq $t6, $0, TerminarS1 # si la letra es igual a final terminamos con s1
            sb $t6, ($t3)
            addi $t3, $t3, 1 # mover puntero s3
            j BucleImparS1

        TerminarS1:

        addi $s7, $s7, -1

        BucleImparS2:

            addi $s7, $s7, 1 # mover puntero s2
            lb $t7, ($s7)
            beq $t7, $t5, BucleParS2 # si la letra es igual a espacio saltamos a par
            beq $t7, $0, TerminarS2 # si la letra es igual a final terminamos con s2
            sb $t7, ($t4)
            addi $t4, $t4, 1 # mover puntero s4
            j BucleImparS2


	BucleParS1:
	
	#simplemente recorremos la palabra hasta el proximo espacio
            addi $s6, $s6, 1
            lb $t6, ($s6)
            beq $t6, $t5, BucleImparS1 # si la letra es igual a final terminamos con s1
            beq $t6, $0, TerminarS1
            j BucleParS1


        BucleParS2:
        
	#simplemente recorremos la palabra hasta el proximo espacio
            addi $s7, $s7, 1
            lb $t7, ($s7)
            beq $t7, $t5, BucleImparS2 # si la letra es igual a final terminamos con s2
            beq $t7, $0, TerminarS2
            j BucleParS2

TerminarS2:

	# Adios :(
	li $v0, 10 
	syscall
