
(creado por danii47 : https://github.com/Danii47/FCOM , editado ssanjo )

# HOJA DE REFERENCIA MIPS

## Indice
- [HOJA DE REFERENCIA MIPS](#hoja-de-referencia-mips)
- [Indice](#indice)
- [Tipos de registros](#tipos-de-registros)
- [Registros extra](#registros-extra)
- [Funciones de entrada/salida (Syscall)](#funciones-de-entradasalida-syscall)
- [Instrucciones](#instrucciones)
- [Ejemplos de instrucciones](#ejemplos-de-instrucciones)
- [Saltos y bucles](#saltos-y-bucles)

---

## Tipos de registros

| Número | Registro | Descripción |
| - | - | - |
| 0 | \$zero | Siempre contiene el valor 0 |
| 1 | \$at | Reservado para el ensamblador |
| 2-3 | \$v0-$v1 | Valores de retorno de las funciones |
| 4-7 | \$a0-$a3 | Argumentos de las funciones |
| 8-15 | \$t0-$t7 | Temporales (no preservados) |
| 16-23 | \$s0-$s7 | Temporales (preservados) |
| 24-25 | \$t8-$t9 | Temporales (no preservados) |
| 26-27 | \$k0-$k1 | Reservados para el kernel |
| 28 | $gp | Puntero global (Global Pointer) |
| 29 | $sp | Puntero de pila (Stack Pointer) |
| 30 | $fp | Puntero de marco (Frame Pointer) |
| 31 | $ra | Dirección de retorno (Return Address) |

---

## Registros extra
| Número | Registro | Descripción |
| - | - | - |
| 0-31 | \$f0-$f31 | Reservados para valores float y double |

---

## Funciones de entrada/salida (Syscall)

| Código | Descripción | Argumentos | Resultado |
| - | - | - | - |
| 1 | Imprimir entero | $a0 = entero | - |
| 2 | Imprimir flotante | $f12 = flotante | - |
| 3 | Imprimir doble flotante | $f12 = doble flotante | - |
| 4 | Imprimir cadena | $a0 = dirección de la cadena (terminada en el caracter nulo) | - |
| 5 | Leer entero | - | entero guardado en $v0 |
| 6 | Leer flotante | - | flotante guardado en $f0 |
| 7 | Leer doble flotante | - | doble flotante guardado en $f0 |
| 8 | Leer cadena | $a0 = dirección de la cadena<br> $a1 = longitud máxima de la cadena | - |
| 10 | Terminar programa | - | - |
| 11 | Imprimir caracter | $a0 = caracter (entero ASCII del caracter) | - |

---

## Instrucciones
| Instrucción | Parámetros | Descripción | Ejemplo |
| - | - | - | - |
| la | rd, Etiqueta | Carga la dirección representada por Etiqueta en el registro rd | la $s0, A |
| li | rd, inm | Carga el valor inmediato inm en el registro rd | li $s0, 5 |
| lui | rd, inm | Carga el valor inmediato inm en los bits más significativos del registro rd | lui $s0, 5 |
| add | rd, rs, rt | Suma con detección de desbordamiento: rd <- rs + rt | add $s2, $s1, $s0 |
| addi | rd, rs, inm | Suma inmediata (con signo extendido): rd <- rs + inm | addi $s2, $s1, 5 |
| sub | rd, rs, rt | Resta con detección de desbordamiento: rd <- rs - rt | sub $s2, $s1, $s0 |
| lw | rd, d(rs) | Lee el contenido de rs + d (desplazamiento) y lo carga en rd | lw $t1, 0($t0) |
| sw | rt, d(rs) | Almacena el contenido de rt en la dirección de memoria rs + d | sw $t1, 4($t0) |
| move | rd, rs | Copia el contenido de rs en rd | move $t2, $t1 |
| sll | rd, rt, d | Desplaza a la izquierda el contenido de rt d veces y lo almacena en rd | sll $t2, $t1, 2 |
| slt | rd, rs, rt | Establece rd en 1 si rs < rt, de lo contrario, establece rd en 0 | slt $t2, $t1, $t0 |
| slti | rd, rs, inm | Establece rd en 1 si rs < inm (con signo extendido), de lo contrario, establece rd en 0 | slti $t2, $t1, 5 |
| sgt | rd, rs, rt | Establece rd en 1 si rs > rt, de lo contrario, establece rd en 0 | sgt $t2, $t1, $t0 |
| sgti | rd, rs, inm | Establece rd en 1 si rs > inm (con signo extendido), de lo contrario, establece rd en 0 | sgti $t2, $t1, 5 |
| beq | rs, rt, Etiqueta | Salta a la instrucción en la dirección de memoria representada por Etiqueta si rs == rt | beq $t1, $t2, L1 |
| bne | rs, rt, Etiqueta | Salta a la instrucción en la dirección de memoria representada por Etiqueta si rs != rt | bne $t1, $t2, L1 |
| ble | rs, rt, Etiqueta | Salta a la instrucción en la dirección de memoria representada por Etiqueta si rs <= rt | ble $t1, $t2, L1 |
| blt | rs, rt, Etiqueta | Salta a la instrucción en la dirección de memoria representada por Etiqueta si rs < rt | blt $t1, $t2, L1 |
| bge | rs, rt, Etiqueta | Salta a la instrucción en la dirección de memoria representada por Etiqueta si rs >= rt | bge $t1, $t2, L1 |
| bgt | rs, rt, Etiqueta | Salta a la instrucción en la dirección de memoria representada por Etiqueta si rs > rt | bgt $t1, $t2, L1 |
| j | Etiqueta | Salta a la instrucción en la dirección de memoria representada por Etiqueta | j L1 |
| jal | Etiqueta | Salta a la instrucción en la dirección de memoria representada por Etiqueta y guarda la dirección de retorno en $ra | jal L1 |
| jr | rs | Salta a la dirección de memoria contenida en rs | jr $ra |
| jalr | rd, rs | Salta a la dirección de memoria contenida en rs y guarda la dirección de retorno en rd | jalr $t1, $ra |


----

## Ejemplos de instrucciones

> [!TIP]
> La instrucción `la` (_`Load Address`_) carga la dirección de memoria representada por la etiqueta `A` (Ej: un vector) en el registro `$s0`.  
>
> **Ejemplo ASM:**
> ```asm
> la $s0, A
> ```

----

> [!TIP]
> La instrucción `li` (_`Load Inmediate`_) carga el valor inmediato `5` en el registro `$s0`.
>
> **Ejemplo ASM:**
> ```asm
> li $s0, 5
> ```
> *También puede usarse para cargar un valor negativo.*

----

> [!TIP]
> La instrucción `lui` (_`Load Upper Inmediate`_) carga el valor inmediato `5` en los bits más significativos del registro `$s0`.
>
> **Ejemplo ASM:**
> ```asm
> lui $s0, 5
> ```
> *También puede usarse para cargar un valor negativo.*

----

> [!TIP]
> La instrucción `add` (_`ADD`_) suma los valores de los registros `$s1` y `$s0` y almacena el resultado en el registro `$s2`.  
>
> *También puede usarse para "copiar" el valor de un registro a otro sumandole $zero.*  
> 
> **Ejemplo ASM:**
> ```asm
> add $s2, $s1, $s0
> ```

----

> [!TIP]
> La instrucción `addi` (_`ADD inmediate`_) suma el valor inmediato `x` (Ej: 10) al valor del registro `$s1` y almacena el resultado en el registro `$s2`.  
> Que sea con signo extenido significa que si el valor inmediato es negativo, se extiende el bit de signo para que el valor sea negativo. 
>  
> **Ejemplo ASM:**
> ```asm
> addi $s2, $s1, 10
> ```

----

> [!TIP]
> La instrucción `sub` (_`SUBtraction`_) resta los valores de los registros `$s1` y `$s0` y almacena el resultado en el registro `$s2`. 
>  
> **Ejemplo ASM:**
> ```asm
> sub $s2, $s1, $s0
> ```

----

> [!TIP]
> La instrucción `lw` (_`Load Word`_) carga la palabra en la dirección de memoria contenida en el registro `$t1` en el registro `$t2`. El desplazamiento es `0`, por lo que se carga la palabra exactamente en la dirección contenida en `$t1`.
> 
> *Puede ser útil para cargar un valor de un vector en un registro.*
> 
> **Ejemplo ASM:**
> ```asm
> lw $t1, 0($t0)
> ```

----

> [!TIP]
> La instrucción `sw` (_`Store Word`_) almacena el contenido del registro `$t1` en la dirección de memoria contenida en el registro `$t0`. El desplazamiento en el ejemplo es `4`, por lo que se almacena el contenido de `$t1` en la dirección `$t0 + 4`.
>
> *Puede ser útil para almacenar un valor en una posición de un vector vector.*
>
> **Ejemplo ASM:**
> ```asm
> sw $t1, 4($t0)
> ```

----

> [!TIP]
> La instrucción `move` (_`MOVE`_) copia el contenido del registro `$t1` en el registro `$t2`.
>
> *Puede ser útil para copiar el contenido de un registro a otro.*
> 
> **En Python / JavaScript:**
> ```py
> t2 = t1
> ```
> **Ejemplo ASM:**
> ```asm
> move $t2, $t1
> ```
> **Otra forma equivalente sin usar move:**
> ```asm
> add $t2, $zero, $t1
> ```

----

> [!TIP]
> La instrucción `sll` (_`Shift Left Logical`_) desplaza el contenido del registro `$t1` un `d` posiciones a la izquierda y almacena el resultado en el registro `$t2`.
> 
> Esto, en la prácica, es equivalente a multiplicar el contenido de `$t1` por 2^d^.
>
> **Ejemplo ASM:**
> ```asm
> # $t1 00011 (3 en binario)
> sll $t2, $t1, 2
> # $t2 01100 (12 en binario; 3 * 2^2 = 12)
> ```

----

> [!TIP]
> La instrucción `slt` (_`Set on Less Than`_) establece el valor del registro `$t2` en 1 si el valor del registro `$t1` es menor que el valor del registro `$t0`, de lo contrario, establece el valor del registro `$t2` en 0. 
>  
> **En Python:**
> ```py
> t2 = 1 if t1 < t0 else 0
> ```
> **En JavaScript:**
> ```js
> t2 = (t1 < t0) ? 1 : 0
> ```
> **Ejemplo ASM:**
> ```asm
> # $t1 = 5, $t0 = 3
> slt $t2, $t1, $t0
> # $t2 = 0 (5 no es menor que 3)
> ```

----

> [!TIP]
> La instrucción `slti` (_`Set on Less Than Inmediate`_) establece el valor del registro `$t2` en 1 si el valor del registro `$t1` es menor que el valor inmediato `x`, de lo contrario, establece el valor del registro `$t2` en 0.  
> 
> Funciona igual que `slt`, pero en lugar de comparar con el valor de otro registro, compara con un valor inmediato.
>
> **Ejemplo ASM:**
> ```asm
> # $t1 = 2
> slti $t2, $t1, 3
> # $t2 = 1 (2 es menor que 3)
> ```

----

> [!TIP]
> La instrucción `beq` (_`Branch if EQual`_) salta a la etiqueta `L1` si el contenido de los registros `$t1` y `$t2` son iguales.
>
> *Puede ser útil para implementar un bucle.*
>
> **Ejemplo ASM:**
> ```asm
> beq $t1, $t2, Loop
> ```

----

> [!TIP]
> La instrucción `bne` (_`Branch if Not Equal`_) salta a la etiqueta `L1` si el contenido de los registros `$t1` y `$t2` no son iguales.  
> *Es el contrario a beq*.  
> 
> *Puede ser útil para implementar un bucle.*
>
> **Ejemplo ASM:**
> ```asm
> bne $t1, $t2, Loop
> ```

----

> [!TIP]
> La instrucción `ble` (_`Branch if Less or Equal`_) salta a la etiqueta `L1` si el contenido de los registro `$t1` es menor o igual al contenido de `$t2`.
>
> **Ejemplo ASM:**
> ```asm
> ble $t1, $t2, Loop
> ```

----

> [!TIP]
> La instruccion `blt` (_`Branch if Less Than`_) salta a la etiqueta `L1` si el contenido de los registro `$t1` es menor al contenido de `$t2`.
>
> **Ejemplo ASM:**
> ```asm
> blt $t1, $t2, Loop
> ```

----

> [!TIP]
> La instrucción `bge` (_`Branch if Greater or Equal`_) salta a la etiqueta `L1` si el contenido de los registro `$t1` es mayor o igual al contenido de `$t2`.
>
> **Ejemplo ASM:**
> ```asm
> bge $t1, $t2, Loop
> ```

----

> [!TIP]
> La instrucción `bgt` (_`Branch if Greater Than`_) salta a la etiqueta `L1` si el contenido de los registro `$t1` es mayor al contenido de `$t2`.
>
> **Ejemplo ASM:**
> ```asm
> bgt $t1, $t2, Loop
> ```
----

> [!TIP]
> La instrucción `j` (_`Jump`_) salta a la etiqueta `L1` sin condición alguna.
>
> **Ejemplo ASM:**
> ```asm
> j Loop
> ```

----

> [!TIP]
> La instrucción `jal` (_`Jump And Link`_) salta a la etiqueta `L1` y guarda la dirección de retorno en el registro `$ra`. 
>
> **Ejemplo ASM:**
> ```asm
> jal Loop
> ```

----

> [!TIP]
> La instrucción `jr` (_`Jump Register`_) salta a la dirección de memoria contenida en el registro `$ra`.
>
> **Ejemplo ASM:**
> ```asm
> jr $ra
> ```

----

> [!TIP]
> La instrucción `jalr` (_`Jump And Link Register`_) salta a la dirección de memoria contenida en el registro `$ra` y guarda la dirección de retorno en el registro `$t1`.
>
> **Ejemplo ASM:**
> ```asm
> jalr $t1, $ra
> ```




---
## Saltos y bucles


### If 
> [!NOTE]
>Si se quiere hacer un if como el siguiente en Java
>```java
>if (a == b) {
>    // Código si a == b
>}
>// Continuación del código
>```
>En MIPS se haría de la siguiente forma 
>```
> beq $t1, $t2, L1  
># Si $t1 == $t2 salta a L1
>
>   # Código si $t1 == $t2
>
> L2:
>
> # Continuación del código
>```
>

### If-Else
<!--- añade aqui el resto de if else--->
> [!NOTE]
>Si se quiere hacer un if-else como el siguiente en Java
>```java
>if (a == b) {
>    // Código si a == b
>} else {
>    // Código si a != b
>}
>// Continuación del código
>```
>En MIPS se haría de la siguiente forma
>```
> beq $t1, $t2, L1  
># Si $t1 == $t2 salta a L1
>
>   # Código si $t1 == $t2
>
>   j L2
>
> L1:
>
>   # Código si $t1 != $t2
>
> L2:
>
> # Continuación del código
>```

### If-Else con otra condición

> [!NOTE]
> Si se quiere hacer un if-else con otra condicion como la siguiente en Java:
> ```java
> if (a < b) {
>     // Código si a < b
> } else {
>     // Código si a >= b
> }
> // Continuación del código
> ```
> En MIPS se haría de la siguiente forma:
> ```
> slt $t0, $t1, $t2 
> # Si $t1 < $t2, $t0 = 1; de lo contrario, $t0 = 0
>
> beq $t0, $zero, L1 
> # Si $t0 == 0 (es decir, $t1 >= $t2), salta a L1
>
>   # Código si $t1 < $t2
>
>   j L2
>
> L1:
>
>   # Código si $t1 >= $t2
>
> L2:
>
> # Continuación del código
> 

> [!IMPORTANT]
> ```asm
> slt $t0, $t1, $t2  
> beq $t0, $zero, L1 
> ```
> En estas dos lineas se esta comparando si $t1 es menor que $t2, si es asi se salta a L1, si no se sigue con el codigo.

### While
> [!NOTE]
>Si se quiere hacer un while como el siguiente en Java
>```java
>while (a == b) {
>    // Código si a == b
>}
>// Continuación del código
>```
>En MIPS se haría de la siguiente forma
> ```
> Loop:
>
> beq $t1, $t2, End
> # Si $t1 == $t2, salta a End
>
>   # Código si $t1 == $t2
>
> j Loop
>
> End:
>
> # Continuación del código
> ```

### For 
> [!TIP]
>Recordemos que un bucle for en Java se puede representar como un bucle while.
>Por ejemplo, el siguiente bucle for en Java:
>```java
>for (int i = 0; i < 10; i++) {
>    // Código
>}
>// Continuación del código
>```
>Se puede representar como el siguiente bucle while en Java:
>```java
>int i = 0;
>while (i < 10) {
>    // Código
>    i++;
>}
>// Continuación del código
>```

> [!NOTE]
>Si se quiere hacer un for como el siguiente en Java
>```java
>for (int i = 0; i < 10; i++) {
>    // Código
>}
>// Continuación del código
>```
>En MIPS se haría de la siguiente forma
> ```
> li $t0, 0  # i = 0, inicialización
>
> Loop:
>
> slt $t1, $t0, 10 
> # Si i < 10, $t1 = 1; de lo contrario, $t1 = 0
>
> beq $t1, $zero, End  
> # Si $t1 == 0 (es decir, i >= 10), salta a End
> # Recordemos que lo anterior es equivalente a saltar si i >= 10   
>
>   # Código
>
>   addi $t0, $t0, 1
>   # i++, incremento
>
>j Loop
>
> End:
>
> # Continuación del código
> ```

> [!TIP]
> En el ejemplo anterior, se inicializa el contador `i` en `0` con `li $t0, 0`.
> Luego, se compara si `i < 10` con `slt $t1, $t0, 10`.
> Si `i < 10`, se ejecuta el código y se incrementa `i` con `addi $t0, $t0, 1`.
> Si `i >= 10`, se salta a `End` con `beq $t1, $zero, End`.

## Vectores

### Declaración de vectores

> [!NOTE]
> Para declarar un vector en MIPS, se utiliza la sección .data del programa:
> ``` 
> .data  
>   # Vector de 10 enteros inicializado con ceros
>   vector1: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
>     
>   # Vector de 5 enteros con valores específicos
>   vector2: .word 10, 20, 30, 40, 50
>   
>   # Vector de 100 enteros sin inicializar
>   vector3: .space 400    # 100 elementos * 4 bytes por palabra = 400 bytes
>   
>   # Vector de caracteres (cadena)
>   mensaje: .asciiz "Hola Mundo"
> ```
> .word: Reserva espacio para enteros (4 bytes cada uno).  
> .space: Reserva un número específico de bytes en memoria.  
> .asciiz: Define una cadena de caracteres terminada en el carácter nulo.
