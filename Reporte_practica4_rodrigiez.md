# Paradigmas
## Practica 4
## 20/11/2025
## Angel Rey Rodriguez(377864)
## Prof. Carlos Gallegos
## Reporte

### introduccion:

El paradigma lógico es un estilo de programación basado en la lógica formal matemática, específicamente en el cálculo de predicados de primer orden. A diferencia de los paradigmas imperativos que se centran en "cómo" resolver un problema, el paradigma lógico se enfoca en "qué" problema se quiere resolver.

##### Características Principales
- **Programación declarativa**: Se describe el "qué" en lugar del "cómo"
- **Base de conocimientos**: Hechos y reglas que definen el dominio
- **Inferencia automática**: El motor de inferencia encuentra soluciones
- **Backtracking**: Mecanismo de retorno ante fallos
- **Unificación**: Proceso de emparejamiento de términos

#### Estructuras de Datos y Recursión

##### Listas en Prolog

```prolog
% Hechos básicos sobre listas
lista_vacia([]).
lista_con_elementos([_|_]).

% Miembro de una lista
miembro(X, [X|_]).
miembro(X, [_|Cola]) :- miembro(X, Cola).

% Concatenación de listas
concatenar([], L, L).
concatenar([X|L1], L2, [X|L3]) :- concatenar(L1, L2, L3).

% Longitud de una lista
longitud([], 0).
longitud([_|Cola], N) :- longitud(Cola, M), N is M + 1.
```

##### Árboles Binarios

```prolog
% Definición de árbol binario
arbol_vacio(nil).
arbol(raiz, izquierdo, derecho).

% Recorrido en orden
en_orden(nil, []).
en_orden(arbol(Raiz, Izq, Der), Lista) :-
    en_orden(Izq, ListaIzq),
    en_orden(Der, ListaDer),
    concatenar(ListaIzq, [Raiz|ListaDer], Lista).
```

#### Backtracking

El backtracking es fundamental en Prolog - el sistema automáticamente retrocede cuando una solución no satisface las restricciones.

```prolog
% Ejemplo de backtracking - encontrar todos los caminos
camino(a, b).
camino(b, c).
camino(c, d).
camino(a, e).
camino(e, d).

ruta(Inicio, Fin, Camino) :-
    ruta_aux(Inicio, Fin, [Inicio], Camino).

ruta_aux(Fin, Fin, Visitados, Visitados).
ruta_aux(Actual, Fin, Visitados, Camino) :-
    camino(Actual, Siguiente),
    \+ miembro(Siguiente, Visitados),
    ruta_aux(Siguiente, Fin, [Siguiente|Visitados], Camino).
```

#### Diferente y No (Negación y Diferenciación)

##### Operador de Diferenciación (\=)

```prolog
% Verificar si dos términos son diferentes
diferentes(X, Y) :- X \= Y.

% Ejemplo de uso
ejemplo_diferente :-
    diferentes(manzana, naranja),  % true
    diferentes(5, 5).              % false
```

##### Negación como Fracaso (\+)

```prolog
% Negación lógica - algo es verdad si no se puede probar
no_es_miembro(X, Lista) :- \+ miembro(X, Lista).

% Verificar si un número no es par
no_es_par(X) :- \+ es_par(X).
es_par(X) :- 0 is X mod 2.
```

#### Estudio de Caso: Árbol Genealógico

```prolog
% Base de conocimientos - hechos
padre(juan, maria).
padre(juan, carlos).
padre(carlos, ana).
padre(carlos, luis).
madre(luisa, maria).
madre(luisa, carlos).
madre(maria, pedro).

% Reglas de relaciones familiares
abuelo(Abuelo, Nieto) :-
    padre(Abuelo, Padre),
    padre(Padre, Nieto).

hermano(Hermano1, Hermano2) :-
    padre(Padre, Hermano1),
    padre(Padre, Hermano2),
    Hermano1 \= Hermano2.

ancestro(Ancestro, Descendiente) :-
    padre(Ancestro, Descendiente).
ancestro(Ancestro, Descendiente) :-
    padre(Ancestro, Intermedio),
    ancestro(Intermedio, Descendiente).
```

#### Programas Básicos

##### Factorial

```prolog
factorial(0, 1).
factorial(N, Resultado) :-
    N > 0,
    M is N - 1,
    factorial(M, ResultadoTemp),
    Resultado is N * ResultadoTemp.
```

##### Fibonacci

```prolog
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, Resultado) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    Resultado is F1 + F2.
```

#### Mínimo y Máximo

##### Encontrar mínimo en lista

```prolog
% Minimo de dos números
minimo(A, B, A) :- A =< B.
minimo(A, B, B) :- B < A.

% Minimo en lista
minimo_lista([X], X).
minimo_lista([X|Cola], Min) :-
    minimo_lista(Cola, MinCola),
    minimo(X, MinCola, Min).
```

##### Encontrar máximo en lista

```prolog
% Maximo de dos números
maximo(A, B, A) :- A >= B.
maximo(A, B, B) :- B > A.

% Maximo en lista
maximo_lista([X], X).
maximo_lista([X|Cola], Max) :-
    maximo_lista(Cola, MaxCola),
    maximo(X, MaxCola, Max).
```

#### Circuitos Resistivos

```prolog
% Circuitos en serie y paralelo
resistencia(serie(R1, R2), R) :-
    resistencia(R1, R1Val),
    resistencia(R2, R2Val),
    R is R1Val + R2Val.

resistencia(paralelo(R1, R2), R) :-
    resistencia(R1, R1Val),
    resistencia(R2, R2Val),
    R is (R1Val * R2Val) / (R1Val + R2Val).

% Resistencia básica
resistencia(basica(Valor), Valor).

% Ejemplo de uso
% resistencia(serie(basica(10), paralelo(basica(20), basica(20))), RTotal).
```

#### Segmentos de Recta

```prolog
% Puntos en el plano
punto(X, Y).

% Segmento de recta entre dos puntos
segmento(punto(X1, Y1), punto(X2, Y2)).

% Longitud de un segmento
longitud_segmento(segmento(punto(X1, Y1), punto(X2, Y2)), Longitud) :-
    DX is X2 - X1,
    DY is Y2 - Y1,
    Longitud is sqrt(DX*DX + DY*DY).

% Punto medio de un segmento
punto_medio(segmento(punto(X1, Y1), punto(X2, Y2)), punto(Xm, Ym)) :-
    Xm is (X1 + X2) / 2,
    Ym is (Y1 + Y2) / 2.
```

#### Torre de Hanoi

```prolog
% Torres de Hanoi
hanoi(1, Origen, Destino, _) :-
    write('Mover disco de '), write(Origen), write(' a '), write(Destino), nl.

hanoi(N, Origen, Destino, Auxiliar) :-
    N > 1,
    M is N - 1,
    hanoi(M, Origen, Auxiliar, Destino),
    hanoi(1, Origen, Destino, Auxiliar),
    hanoi(M, Auxiliar, Destino, Origen).

% Ejemplo de uso: hanoi(3, izquierda, derecha, centro).
```

#### Listas Enlazadas

```prolog
% Definición de lista enlazada
lista_enlazada(vacia).
lista_enlazada(nodo(Valor, Siguiente)) :- lista_enlazada(Siguiente).

% Insertar al inicio
insertar_inicio(Valor, Lista, nodo(Valor, Lista)).

% Insertar al final
insertar_final(Valor, vacia, nodo(Valor, vacia)).
insertar_final(Valor, nodo(Cabeza, Cola), nodo(Cabeza, NuevaCola)) :-
    insertar_final(Valor, Cola, NuevaCola).

% Buscar elemento
buscar(Valor, nodo(Valor, _)).
buscar(Valor, nodo(_, Siguiente)) :- buscar(Valor, Siguiente).
```

#### El Mono y el Plátano

```prolog
% Estado: estado(PosicionMono, PosicionCaja, TienePlatano)
% Acciones: empujar, subir, caminar, agarrar

estado_inicial(estado(puerta, ventana, no)).
estado_final(estado(_, _, si)).

% Reglas de transición
transicion(estado(P, P, no), subir, estado(P, P, no)) :-
    write('El mono sube a la caja'), nl.

transicion(estado(P1, P1, no), empujar(P2), estado(P2, P2, no)) :-
    P1 \= P2,
    write('El mono empuja la caja de '), write(P1), write(' a '), write(P2), nl.

transicion(estado(P1, P2, no), caminar(P3), estado(P3, P2, no)) :-
    P1 \= P3,
    write('El mono camina de '), write(P1), write(' a '), write(P3), nl.

transicion(estado(P, P, no), agarrar, estado(P, P, si)) :-
    write('El mono agarra el plátano!'), nl.

% Resolver el problema
resolver :-
    estado_inicial(EstadoInicial),
    estado_final(EstadoFinal),
    resolver(EstadoInicial, EstadoFinal, []).

resolver(Estado, Estado, _).
resolver(EstadoActual, EstadoFinal, Visitados) :-
    transicion(EstadoActual, Accion, EstadoSiguiente),
    \+ member(EstadoSiguiente, Visitados),
    resolver(EstadoSiguiente, EstadoFinal, [EstadoSiguiente|Visitados]).
```

#### Ventajas del Paradigma Lógico

1. **Programación declarativa**: Más fácil de razonar
2. **Manejo natural de problemas de búsqueda**
3. **Base de conocimientos explícita**
4. **Flexibilidad en la especificación de problemas**
5. **Mecanismos de inferencia automáticos**

#### Limitaciones

1. **Eficiencia en ciertos tipos de problemas**
2. **Curva de aprendizaje para programadores procedurales**
3. **Manejo limitado de efectos secundarios**
4. **Dificultad con algoritmos que requieren estado mutable**

### Referencias

[repositorio Papux100](https://github.com/papux100/Portafolio).

[pagina Papux100](https://papux100.github.io/Portafolio/blog).

Prolog - Quick Guide. (n.d.). https://www.tutorialspoint.com/prolog/prolog_quick_guide.htm
SWI-Prolog -- Getting started quickly. (n.d.). https://www.swi-prolog.org/pldoc/man?section=quickstart
