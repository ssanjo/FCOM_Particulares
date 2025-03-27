.data
F: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 # Reserva espacio para 20 enteros (4 bytes cada uno)

.text
main:
    li $t0, 0                
    li $t1, 1                
    sw $t0, F                
    sw $t1, F+4              

    # Prepara los registros para el bucle
    li $t2, 2                # i = 2
    li $t3, 20               
    li $s4, 1              

loop:
    bge $t2, $t3, end_loop   # Si i es mayor o igual a 20 sale del bucle

    lw $t4, F+($t2-1)*4     
    lw $t5, F+($t2-2)*4     
    add $t6, $t4, $t5       
    sw $t6, F+($t2)*4        

    add $s4, $s4, $t6        

    addi $t2, $t2, 1         # i++
    j loop

end_loop:

    li $v0, 10
    syscall