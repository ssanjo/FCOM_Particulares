# Tecnología Informática y Niveles de Abstracción

>[!TIP]
>El contenido mas relevante de cara al examen se encuentra a partir de la sección 6.

# Índice

- [Tecnología Informática y Niveles de Abstracción](#tecnología-informática-y-niveles-de-abstracción)
- [Índice](#índice)
  - [1. Introducción](#1-introducción)
    - [La Revolución de los Computadores](#la-revolución-de-los-computadores)
      - [Aplicaciones de la Revolución Informática:](#aplicaciones-de-la-revolución-informática)
  - [2. Tipos de Computadores](#2-tipos-de-computadores)
    - [Clasificación de Computadores](#clasificación-de-computadores)
      - [2.1 Computadores de Propósito General](#21-computadores-de-propósito-general)
      - [2.2 Computadores Empotrados](#22-computadores-empotrados)
      - [2.3 Servidores y Clusters](#23-servidores-y-clusters)
  - [3. Tendencias Tecnológicas](#3-tendencias-tecnológicas)
    - [Evolución del Hardware](#evolución-del-hardware)
      - [Comparación de Tecnologías a lo Largo del Tiempo](#comparación-de-tecnologías-a-lo-largo-del-tiempo)
    - [Expansión del Mercado de Procesadores](#expansión-del-mercado-de-procesadores)
  - [4. La Era Post-PC](#4-la-era-post-pc)
  - [5. Niveles de Abstracción](#5-niveles-de-abstracción)
    - [División del Sistema Informático](#división-del-sistema-informático)
  - [6. Memoria Principal](#6-memoria-principal)
    - [Tipos de Memoria](#tipos-de-memoria)
    - [Acceso a Memoria](#acceso-a-memoria)
    - [Elementos de la Memoria](#elementos-de-la-memoria)
    - [Funcionamiento de lectura](#funcionamiento-de-lectura)
    - [Funcionamiento de escritura](#funcionamiento-de-escritura)
  - [7. Funcionamiento del Computador, Ejecución de una Instrucción y Arquitectura del CPU](#7-funcionamiento-del-computador-ejecución-de-una-instrucción-y-arquitectura-del-cpu)
    - [Etapas de Ejecución de una Instrucción](#etapas-de-ejecución-de-una-instrucción)
    - [Componentes del CPU](#componentes-del-cpu)
  - [8. Rendimiento y sus expresiones](#8-rendimiento-y-sus-expresiones)
    - [Definiciones](#definiciones)
    - [Fórmulas](#fórmulas)
  - [9. Potencia](#9-potencia)
    - [Potencia Dinámica](#potencia-dinámica)
    - [Potencia Estática](#potencia-estática)
      - [Métodos de Reducción de Potencia Estática:](#métodos-de-reducción-de-potencia-estática)
  - [10. Aceleración y Eficiencia](#10-aceleración-y-eficiencia)
    - [Aceleración (Speedup)](#aceleración-speedup)
    - [Eficiencia](#eficiencia)
  - [11. Tipos de Binario](#11-tipos-de-binario)
    - [Binario Natural (sin signo)](#binario-natural-sin-signo)
    - [Binario con Signo](#binario-con-signo)
    - [Complemento a 2](#complemento-a-2)
  - [12. Hexadecimal, Caracteres y ASCII](#12-hexadecimal-caracteres-y-ascii)
    - [Sistema Hexadecimal](#sistema-hexadecimal)
    - [Representación de Caracteres](#representación-de-caracteres)
      - [Código ASCII](#código-ascii)
      - [Unicode](#unicode)



## 1. Introducción
### La Revolución de los Computadores
La evolución de la tecnología informática ha sido impresionante, permitiendo la proliferación de computadoras en múltiples sectores y aplicaciones. Este avance se debe en gran parte a la **Ley de Moore**, que establece que la cantidad de transistores en un circuito integrado se duplica aproximadamente cada dos años, lo que ha llevado a mejoras en rendimiento y reducción de costos.

#### Aplicaciones de la Revolución Informática:
- **Sector Automotriz**: Sistemas de navegación, asistencia al conductor y automatización en la conducción.
- **Dispositivos Móviles**: Tablets, smartphones, smartwatches y otros dispositivos conectados.
- **Cálculo Científico e Ingeniería**: Simulación de modelos complejos en diversas disciplinas.
- **Inteligencia Artificial**: Procesamiento de grandes volúmenes de datos para reconocimiento de patrones y toma de decisiones.

## 2. Tipos de Computadores
### Clasificación de Computadores
#### 2.1 Computadores de Propósito General
- **Computadoras de Escritorio y Portátiles**:
  - Diseñadas para múltiples aplicaciones.
  - Ejecutan una amplia variedad de software.
  - Balance entre costo y prestaciones.

#### 2.2 Computadores Empotrados
- **Definición**: Computadores diseñados para realizar tareas específicas.
- **Características**:
  - Integrados en otros dispositivos (electrodomésticos, automóviles, etc.).
  - Restricciones estrictas en consumo, rendimiento y costo.

#### 2.3 Servidores y Clusters
- **Características**:
  - Alto rendimiento y capacidad de procesamiento.
  - Accesibles a través de redes.
  - Almacenados en centros de datos con sistemas de refrigeración especializados.

## 3. Tendencias Tecnológicas
### Evolución del Hardware
La mejora continua del hardware ha permitido aumentar la eficiencia en relación con el costo y rendimiento.

#### Comparación de Tecnologías a lo Largo del Tiempo
| Año  | Tecnología                         | Relación Rendimiento/Costo |
|------|----------------------------------|----------------------------|
| 1951 | Tubo de vacío                     | 1                          |
| 1965 | Transistor                        | 35                         |
| 1975 | Circuito Integrado (IC)           | 900                        |
| 1995 | Very Large Scale IC (VLSI)        | 2.4 millones               |
| 2013 | Ultra Large Scale IC (ULSI)       | 250 mil millones           |

### Expansión del Mercado de Procesadores
- Incremento en la cantidad de dispositivos móviles en comparación con PCs y tablets.
- Predominio de procesadores diseñados para eficiencia energética.

## 4. La Era Post-PC
- **Dispositivos Móviles y Wearables**: Uso masivo de dispositivos conectados a la red.
- **Desafíos**:
  - Dependencia de baterías.
  - Limitaciones en procesamiento local.
- **Computación en la Nube**:
  - Descentralización del procesamiento.
  - Aumento de capacidad de almacenamiento y cómputo remoto.

## 5. Niveles de Abstracción
### División del Sistema Informático
1. **Software de Aplicación**:
   - Programas escritos en lenguajes de alto nivel (C, C++, Java, Python).
   - Interfaces gráficas y funcionalidad específica.

2. **Software de Sistema**:
   - **Compiladores**: Traducción de código de alto nivel a lenguaje máquina.
   - **Sistema Operativo**:
     - Gestión del procesador (planificación de tareas).
     - Gestión de memoria y almacenamiento.
     - Seguridad y control de acceso.

3. **Hardware**:
   - Procesadores, memoria y dispositivos de entrada/salida.
   - Interfaz entre software y hardware mediante la arquitectura del repertorio de instrucciones (ISA).

## 6. Memoria Principal
### Tipos de Memoria
- **Memoria RAM (Random Access Memory)**: Volátil, utilizada para almacenar datos y programas en ejecución.
- **Memoria ROM (Read-Only Memory)**: No volátil, almacena firmware y datos permanentes.

### Acceso a Memoria
- **Lectura**: Se accede a una posición específica y se carga en un registro.
- **Escritura**: Se modifica el contenido de una posición con un nuevo valor.

### Elementos de la Memoria
- **Celdas de Memoria**: Almacenan datos en forma binaria.
- **Bus de Datos**: Transporta la información entre memoria y CPU.
- **Bus de Direcciones**: Indica la posición de memoria que se desea acceder.
  
### Funcionamiento de lectura
1. **Dirección**: Se envía la dirección de memoria a la que se desea acceder.
2. **Selección**: Se activa la celda de memoria correspondiente.
3. **Lectura**: Se lee el contenido de la celda y se envía a la CPU.

### Funcionamiento de escritura
1. **Dirección**: Se envía la dirección de memoria a la que se desea acceder.
2. **Selección**: Se activa la celda de memoria correspondiente.
3. **Escritura**: Se escribe el contenido en la celda de memoria.
  
>[!TIP]
>El funcionamiento de lectura y escritura es completamente analogo, la diferencia radica en la operación que se realiza en la celda de memoria.
>
>

## 7. Funcionamiento del Computador, Ejecución de una Instrucción y Arquitectura del CPU
### Etapas de Ejecución de una Instrucción
1. **Búsqueda**: Se obtiene la instrucción desde la memoria.
2. **Decodificación**: Se interpreta la instrucción.
3. **Ejecución**: Se realiza la operación en la ALU.
4. **Almacenamiento**: Se guardan los resultados.

### Componentes del CPU
- **Unidad de Control**: Coordina la ejecución de instrucciones.
- **ALU**: Realiza cálculos matemáticos y lógicos.
- **Registros**: Almacenan temporalmente datos.
- **Memoria Caché**: Acceso rápido a datos e instrucciones frecuentes.

## 8. Rendimiento y sus expresiones
### Definiciones
- **Tiempo de respuesta**: Tiempo que tarda un programa en ejecutarse.
- **Productividad**: Relación entre el tiempo de respuesta y el tiempo de CPU.
- **Rendimiento** = 1 / Tiempo de respuesta.
- **Rendimiento relativo**: Comparación del rendimiento de dos sistemas:  
$R_{relativo} = \frac{T_{CPU2}}{T_{CPU1}}$ = $\frac{Rendimiento_{CPU2}}{Rendimiento_{CPU1}}$  
"CPU1 es $R_{relativo}$ veces más rápido que CPU2"

- **Tiempo Invertido**: Tiempo de respuesta total, incluyendo el de procesamiento de CPU, operaciones de E/S y tareas del Sistema OperativoTiempo de CPU
- **Tiempo de CPU (t)**:  Tiempo consumido procesando una determinada tarea, se descuenta E/S y otras tareas con recursos compartidos.
  
- **Periodo de reloj (T)**: Tiempo entre dos pulsos consecutivos, duracion de un ciclo.
  
- **Frecuencia de reloj (f)**: 1 / T , ciclos por segundo.

- **Ciclos por Instrucción (CPI)**: Relación entre ciclos de reloj y cantidad de instrucciones ejecutadas.

- **Numero de ciclos (N)**: Cantidad de ciclos necesarios para ejecutar un programa.
  
- **Numero de Instrucciones (Ic)**: Cantidad de instrucciones ejecutadas en un programa.

### Fórmulas

$$
T_{CPU} = N\times T_{ciclo}
$$

$$
t_{CPU} = \frac{Instrucciones}{Programa} \times \frac{Ciclos}{Instruccion} \times \frac{Tiempo}{Ciclo}
$$

$$
t_{CPU} = Ic \times CPI \times T_{ciclo}
$$

$$
Rendimiento = \frac{1}{t_{CPU}}
$$

$$
R_{relativo} = \frac{T_{CPU2}}{T_{CPU1}} = \frac{Rendimiento_{CPU2}}{Rendimiento_{CPU1}}
$$

$$
N = Ic \times CPI
$$



## 9. Potencia 
### Potencia Dinámica
La potencia dinámica es la energía consumida por el procesador cuando ejecuta instrucciones y cambia de estado. Se calcula con la siguiente fórmula:

$$
W_{dinámica} = C_{load} \times V^2 \times f
$$

donde:
- $C_{load}$ es la carga capacitiva de los transistores.
- $V$ es el voltaje de operación.
- $f$ es la frecuencia del reloj.

Para reducir la potencia dinámica, se pueden emplear las siguientes estrategias:
- **Reducir el voltaje de operación**: Disminuye el consumo cuadráticamente.
- **Reducir la frecuencia de reloj**: Disminuye linealmente el consumo, pero también reduce el rendimiento.
- **Optimizar la carga capacitiva**: Se consigue con un diseño eficiente de circuitos y el uso de tecnologías avanzadas.

### Potencia Estática
La potencia estática es la energía consumida incluso cuando el procesador no está ejecutando instrucciones. Proviene de las corrientes de fuga en los transistores. Su fórmula es:

$$
W_{estática} = I_{fuga} \times V
$$

donde:
- $I_{fuga}$ es la corriente de fuga de los transistores.
- $V$ es el voltaje de operación.

#### Métodos de Reducción de Potencia Estática:
- **Uso de transistores de bajo consumo**: Reduce la corriente de fuga.
- **Técnicas de apagado de componentes (power gating)**: Desactiva partes del chip cuando no se están usando.
- **Reducción del voltaje de operación**: Minimiza las fugas de corriente.

## 10. Aceleración y Eficiencia
### Aceleración (Speedup)
La aceleración o speedup es una medida que cuantifica cuánto más rápido se ejecuta un programa en múltiples procesadores comparado con un solo procesador.

$$ S(N) = \frac{t_1}{t_N} $$

donde:

$T_1$ es el tiempo de ejecución en un solo procesador
$t_N$ es el tiempo de ejecución en N procesadores

### Eficiencia
La eficiencia mide qué tan bien se están utilizando los recursos disponibles:

$$ E(N) = \frac{S(N)}{N} = \frac{t_1}{N \times t_N} $$



## 11. Tipos de Binario
### Binario Natural (sin signo)
El binario natural es el sistema numérico base de los computadores. Se representa con 0s y 1s.
- Ejemplo:
  - 1011₂ = 1×2³ + 0×2² + 1×2¹ + 1×2⁰ = 11₁₀

### Binario con Signo 
Se utiliza para representar números positivos y negativos. El bit más significativo indica el signo (0 para positivo, 1 para negativo).
- Ejemplo:
  - 4 en binario de 8 bits: 00000100₂
  - -4 en binario de 8 bits: 10000100₂

### Complemento a 2
Es el método más común para representar números con signo en binario. Su ventaja es que permite realizar sumas y restas sin necesidad de reglas especiales.

- Ejemplo:
  - 4 en binario de 8 bits: 00000100₂
  - -4 en complemento a 2: 11111100₂

**Cálculo del complemento a 2:**
1. Invertir los bits.
2. Sumar 1 al resultado.

## 12. Hexadecimal, Caracteres y ASCII
### Sistema Hexadecimal
Es un sistema de numeración en base 16 utilizado para representar grandes cantidades de información de forma compacta.

| Decimal | Binario   | Hexadecimal |
|---------|----------|-------------|
| 0       | 0000     | 0           |
| 1       | 0001     | 1           |
| 10      | 1010     | A           |
| 15      | 1111     | F           |

### Representación de Caracteres
#### Código ASCII
ASCII (American Standard Code for Information Interchange) es un estándar de codificación de caracteres en 7 u 8 bits.

| Caracter | Código ASCII |
|----------|-------------|
| A        | 65 (0x41)   |
| B        | 66 (0x42)   |
| a        | 97 (0x61)   |
| b        | 98 (0x62)   |

#### Unicode
Unicode amplía ASCII y permite la representación de caracteres de múltiples alfabetos, con variantes como UTF-8 y UTF-16.

