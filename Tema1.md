# Tecnología Informática y Niveles de Abstracción

>[!TIP]
>El contenido mas relevante de cara al examen se encuentra a partir de la sección 6.

# Índice

1. [Introducción](#1-introducción)
2. [Tipos de Computadores](#2-tipos-de-computadores)
3. [Tendencias Tecnológicas](#3-tendencias-tecnológicas)
4. [La Era Post-PC](#4-la-era-post-pc)
5. [Niveles de Abstracción](#5-niveles-de-abstracción)
6. [Memoria Principal, Acceso, Elementos y Funcionamiento](#6-memoria-principal-acceso-elementos-y-funcionamiento)
7. [Funcionamiento del Computador, Ejecución de una Instrucción y Arquitectura del CPU](#7-funcionamiento-del-computador-ejecución-de-una-instrucción-y-arquitectura-del-cpu)
8. [Factores de Rendimiento, Productividad, Rendimiento Relativo y Medida del Tiempo de Ejecución](#8-factores-de-rendimiento-productividad-rendimiento-relativo-y-medida-del-tiempo-de-ejecución)
9. [Temporización de la CPU, Tiempo de CPU, Número de Instrucciones y CPI](#9-temporización-de-la-cpu-tiempo-de-cpu-número-de-instrucciones-y-cpi)
10. [Potencia Dinámica y Estática, Reducción de Potencia](#10-potencia-dinámica-y-estática-reducción-de-potencia)
11. [Multiprocesadores, Aceleración y Eficiencia](#11-multiprocesadores-aceleración-y-eficiencia)
12. [Tipos de Binario](#12-tipos-de-binario)
13. [Hexadecimal, Caracteres y ASCII](#13-hexadecimal-caracteres-y-ascii)
14. [Conclusiones](#14-conclusiones)



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

## 6. Memoria Principal, Acceso, Elementos y Funcionamiento
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

## 8. Factores de Rendimiento, Productividad, Rendimiento Relativo y Medida del Tiempo de Ejecución
### Factores de Rendimiento
- **CPI (Ciclos por Instrucción)**: Relación entre ciclos de reloj y cantidad de instrucciones ejecutadas.
- **Frecuencia del reloj**: Determina la rapidez del procesador.

### Fórmula del Tiempo de Ejecución
\[
Tiempo\ de\ CPU = \frac{Instrucciones}{Programa} \times \frac{Ciclos}{Instrucción} \times \frac{Tiempo}{Ciclo}
\]

## 9. Temporización de la CPU, Tiempo de CPU, Número de Instrucciones y CPI
### Temporización
- **Periodo de reloj**: Tiempo entre dos pulsos consecutivos.
- **Frecuencia de reloj**: Inverso del periodo, medida en GHz.

## 10. Potencia Dinámica y Estática, Reducción de Potencia
### Potencia Dinámica
- Depende de la frecuencia de reloj, voltaje y carga capacitiva.

### Potencia Estática
- Perdida de energía por corrientes de fuga.

## 11. Multiprocesadores, Aceleración y Eficiencia
- **Procesadores multinúcleo**: Mayor eficiencia y capacidad de procesamiento paralelo.

## 12. Tipos de Binario
- **Binario Natural**: Números sin signo.
- **Complemento a 2**: Representación de enteros con signo.

## 13. Hexadecimal, Caracteres y ASCII
- **Hexadecimal**: Base 16 para representar valores binarios de forma compacta.
- **ASCII**: Estándar de codificación de caracteres de 7 y 8 bits.
- **Unicode**: Expansión de ASCII para múltiples idiomas y símbolos.

## 14. Conclusiones
- La evolución de la informática ha mejorado la eficiencia y capacidad de los sistemas computacionales.
- La arquitectura de Von Neumann sigue siendo un modelo central en el diseño de computadores modernos.
- La optimización del rendimiento depende de múltiples factores, desde hardware hasta algoritmos de software.
