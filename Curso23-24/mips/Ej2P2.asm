.data

Mensaje: .asciiz "Introduzca un número natural: "
MensajeSuma: .asciiz "si sumamos los "
MensajePrimNat: .asciiz " primeros números pares (tu número entre 2 redondeando hacia abajo), nos da "

.text
main:
	addi $a1,$0,1	#  Contador
	
	
	li $v0, 4     	# Imprime la solicitud del numero
	la $a0, Mensaje    
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
	
Fin:
	li $v0, 10      
	syscall         
