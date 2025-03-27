.data
A: .word 0, 1, 1, 2, 3, 5, 8, 13, 21, 34
B: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 # Vector para números pares
C: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 # Vector para números impares
N: .word 10 
.text

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
    li $v0, 10
    syscall