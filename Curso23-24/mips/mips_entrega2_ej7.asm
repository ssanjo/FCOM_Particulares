# Direcci�n de memoria de la cadena original: $a0
# N�mero de desplazamiento en la tabla ASCII: $a1
# Direcci�n de memoria de la cadena cifrada: $a2
# C�digo de salida: $v0

.data


Pregunta3: .asciiz "Introduzca su cadena: "

Palabra: .space 20

MaximaLongitud: .word 20

mensaje_clave_incorrecta: .asciiz "Clave incorrecta"

salida: .space 20

.text

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
	
	

# Implementaci�n de la funci�n de cifrado del C�sar
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
    lb $t3, 0($t0)     # Cargar el car�cter actual de la cadena original
    beqz $t3, cifrado_fin # Si el car�cter es nulo, terminar el cifrado

    # Aplicar el desplazamiento en la tabla ASCII
    add $t3, $t3, $a1

    # Verificar si el car�cter cifrado est� dentro del rango imprimible
    li $t4, 32         # ASCII del primer car�cter imprimible
    li $t5, 127        # ASCII del �ltimo car�cter imprimible
    blt $t3, $t4, clave_incorrecta    # Si el car�cter cifrado es menor que 32, clave incorrecta
    bgt $t3, $t5, clave_incorrecta    # Si el car�cter cifrado es mayor que 127, clave incorrecta

    # Almacenar el car�cter cifrado en la cadena cifrada
    sb $t3, 0($t1)

    # Incrementar los �ndices de las cadenas
    addi $t0, $t0, 1   # Avanzar al siguiente car�cter de la cadena original
    addi $t1, $t1, 1   # Avanzar al siguiente espacio de la cadena cifrada

    # Volver al inicio del bucle
    j cifrado_loop

cifrado_fin:
    li $v0, 0          # C�digo de salida: todo es correcto
    j fin_funcion           # Retornar

clave_mayor_100:

    li $v0, 1  #C�digo de salida: clave incorrecta
      
    
     j cargar_clave_incorrecta      # Salir de la funci�n sin retornar la cadena cifrada

clave_incorrecta:

    li $v0, 2          # C�digo de salida: alg�n car�cter cifrado est� fuera del rango imprimible
   
    j cargar_clave_incorrecta     # Salir de la funci�n sin retornar la cadena cifrada

cargar_clave_incorrecta:
	 
	 la $t0 mensaje_clave_incorrecta
	 move $t1, $a2
	
loop_clave:

	lb $t3, 0($t0)  
	 
	   
	beqz $t3, fin_funcion
	 
	sb $t3, 0($a2)
	
	addi $t0, $t0, 1   # Avanzar al siguiente car�cter de la cadena original
	addi $t1, $t1, 1   # Avanzar al siguiente espacio de la cadena cifrada
	 
	j loop_clave
	 
	 
fin_funcion:
	           # salir

# Mensaje de error para clave incorrecta
