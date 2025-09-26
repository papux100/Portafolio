# Paradigmas
## Practica 1
## 12/9/2025
## Angel Rey Rodriguez(377864)
## Prof. Carlos Gallegos
## Reporte 

# introduccion:

A través de este ejercicio, se exploran conceptos clave de programación, como nombres, marcos de activación, bloques de alcance, administración de memoria, expresiones, comandos, estructuras de control de secuencia (selección, iteración y recursión), subprogramas y tipos de datos. El objetivo es desglosar el código para comprender cómo cada uno de estos elementos contribuye a la funcionalidad del sistema, destacando su organización, modularidad y manejo eficiente de recursos.

# intrucciones
El objetivo de esta práctica es identificar los elementos fundamentales de los lenguajes de programación: nombres, marcos de activación, bloques de alcance, administración de memoria, expresiones, comandos, control de secuencia como lo es; selección, iteración y recursión, subprogramas, y tipos de datos.

Identificar estos conceptos en la aplicación propuesta para esta práctica.

Entregar aquí en classroom el reporte en PDF de la práctica, generado a partir del contenido en su portafolio. No olviden añadir al reporte el enlace a su portafolio y al sitio estático, donde este reporte es la segunda entrada.

Repositorio de código para la práctica: https://github.com/gallegosj89/portafolio
# Resultados

## 1. Nombres
Los nombres son identificadores utilizados para variables, funciones, estructuras, enumeraciones, etc. En el código, encontramos:

* **Variables:**

  * **Globales:** static_var (estática, segmento de datos), bss_var (BSS, no inicializada).

  * **Locales (stack)**: library, members, bookCount, memberCount, choice (en main), new_book, current, bookFound, memberFound, etc.

  * **Campos de estructuras:** id, title, author, publication_year, genre, quantity, next (en book_t); id, name, issued_count, issued_books, next (en member_t).


* **Funciones:**

  * genreToString, addBook, findBookById, displayBooksRecursive, displayBooks, addMember, issueBook, returnBook, freeLibrary, freeMembers, saveLibraryToFile, loadLibraryFromFile, saveMembersToFile, loadMembersFromFile, displayMembers, searchMember, main.


* **Tipos definidos:**

    * genre_t (enumeración).
    * book_t, member_t (estructuras).


* **Constantes:**

  * Enumeradores: FICTION, NON_FICTION, SCIENCE, HISTORY, FANTASY, BIOGRAPHY, OTHER.
  * Cadenas literales: "Error al asignar memoria", "library.txt", etc.




* **2. Marcos de activación**
   
Los marcos de activación (o registros de activación) son áreas en el stack que almacenan información sobre una llamada a función, incluyendo parámetros, variables locales y el valor de retorno. En este código:

  * **Ejemplos de marcos de activación:**

    * En addBook: parámetros (library, count), variables locales (new_book, genre).
    * En main: variables locales (library, members, bookCount, memberCount, choice).
    * Cada llamada a función crea un nuevo marco de activación en el stack, que se libera al retornar.


* **Comportamiento:**

  * Las variables locales como new_book en addBook o current en findBookById se almacenan en el stack.
  * Los parámetros (library, count) se pasan por valor o puntero, almacenados en el marco de activación de la función.




## 3. Bloques de alcance
   
Los bloques de alcance definen la visibilidad y vida útil de los nombres. En el código:

* **Alcance global:**

  * Variables: static_var (estática, alcance de archivo),  bss_var (global, no inicializada).
  * Definiciones: genre_t, book_t, member_t.


* **Alcance de función:**

  * Variables locales en funciones como new_book en addBook, current en findBookById.
  * Ejemplo: En addBook, new_book y genre solo son visibles dentro de la función.


* **Alcance de bloque:**

  * Dentro de bucles o condicionales, como i en el bucle for de issueBook:
  ```c
  for (int i = 0; i < memberFound->issued_count; i++)
  ```
  * Aquí, i solo existe dentro del bucle.


* **Alcance estático:**

  * static_var tiene alcance de archivo, pero su vida útil es durante toda la ejecución del programa.

## 4. Administración de memoria
   
El código utiliza varios esquemas de administración de memoria:

* **Segmento de datos:**

  * static_var (inicializada, estática).
  * Cadenas literales como "Ficcion".


* **Segmento BSS:**

  * bss_var (global no inicializada).


* **Stack:**

  * Variables locales automáticas: library, members, bookCount, choice, etc.
  * Parámetros de funciones: library, count en addBook.


* **Heap:**

   * Asignación dinámica con malloc y realloc:

     * En addBook: new_book = (book_t *)malloc(sizeof(book_t)).
     * En issueBook: realloc para issued_books.


* **Liberación con free:**

   * En freeLibrary: free(current) para cada nodo de la lista book_t.
   * En freeMembers: free(current->issued_books) y free(current).


* Seguimiento de memoria:

   * Funciones como incrementHeapAllocations y incrementHeapDeallocations (definidas en memory_management.h) rastrean asignaciones y liberaciones.

* **Gestión explícita:**

  * El código verifica errores de asignación (if (!new_book)).
  * Usa listas enlazadas (next) para gestionar estructuras dinámicas (book_t, member_t).




## 5. Expresiones
   
Las expresiones son combinaciones de operandos y operadores que producen un valor. Ejemplos:

* **Aritméticas:**

   * (*count)++ en addBook.
bookFound->quantity-- en issueBook.


* **Lógicas:**

  * if (bookFound && memberFound) en issueBook.
  * while (current) en findBookById.


* **Asignación:**

   * new_book->id = scanf("%d", &new_book->id) (lectura).
   * new_book->next = *library en addBook.


* **Llamadas a funciones:**

   * genreToString(library->genre) en displayBooksRecursive.
   * malloc(sizeof(book_t)) en addBook.


* **Comparaciones:**

   * if (current->id == bookID) en findBookById.
   * strcmp(genre_str, "Ficcion") == 0 en loadLibraryFromFile.




## 6. Comandos

Los comandos son instrucciones ejecutables en el programa. Ejemplos:

* **Asignaciones:**

  * new_book->quantity = scanf("%d", &new_book->quantity) en addBook.
  * memberFound->issued_books = realloc(...) en issueBook.


* **Entrada/salida:**

  * printf("Ingresa ID del libro: ") en addBook.
  * fscanf(file, "%d\n", &new_book->id) en loadLibraryFromFile.


* **Control de flujo:**

  * if, switch, while, for (ver control de secuencia).
  * return NULL en findBookById.


* **Llamadas a funciones:**

  * incrementHeapAllocations(new_book, sizeof(book_t)) en addBook.
  * fclose(file) en saveLibraryToFile.

El control de secuencia incluye selección, iteración y recursión:

* **Selección:**
```c
if-else:
cif (!new_book) {
    printf("Error al asignar memoria...\n");
    return;
}
```
En addBook, verifica si la asignación de memoria falló.

* **switch:**

```c
cswitch (genre) {
    case FICTION: return "Ficcion";
    ...
}
```
En genreToString, selecciona una cadena según el valor de genre.


* **Iteración:**
```c
while:
cwhile (current) {
    if (current->id == bookID) {
        return current;
    }
    current = current->next;
}
```
En findBookById, recorre la lista de libros.
```c
for:
cfor (int i = 0; i < memberFound->issued_count; i++) {
    if (memberFound->issued_books[i] == bookID) {
        ...
    }
}
```
En returnBook, busca un libro en la lista de prestados.


* **Recursión:**

En **displayBooksRecursive**:
```c
cvoid displayBooksRecursive(book_t *library) {
    if (!library) return;
    printf(...);
    displayBooksRecursive(library->next);
}
```
Recorre la lista de libros recursivamente.




## 8. Subprogramas
Los subprogramas son funciones que encapsulan tareas específicas. En el código:

* **Funciones:**

addBook: Agrega un libro a la lista.
findBookById: Busca un libro por ID.
displayBooksRecursive: Muestra libros recursivamente.
issueBook: Presta un libro a un miembro.
freeLibrary: Libera memoria de la lista de libros.
main: Punto de entrada, controla el flujo del programa.


* **Características:**

Parámetros: Por valor (int bookID) o puntero (book_t **library).
Retorno: const char* en genreToString, book_t* en findBookById, void en addBook.
Modularidad: Cada función realiza una tarea específica, como agregar, prestar o liberar.




## 9. Tipos de datos
El código utiliza varios tipos de datos:

**Primitivos:**

* int: id, publication_year, quantity, bookCount.
* char: Arreglos como title[100], author[100].
* FILE*: Para manejar archivos en saveLibraryToFile.


#### Definidos por el usuario:

* **Enumeración:**
```c
ctypedef enum { FICTION, NON_FICTION, ... } genre_t;
```
Define géneros de libros.

* **Estructuras:**
```c
ctypedef struct _book {
    int id;
    char title[100];
    ...
    struct _book *next;
} book_t;
```
Representa un libro con un enlace al siguiente.

```c
ctypedef struct _member {
    int id;
    char name[100];
    ...
    struct _member *next;
} member_t;
```
Representa un miembro con un enlace al siguiente.

* **Punteros:**
```c
book_t*, member_t*: Para listas enlazadas.
int*: issued_books en member_t.
Punteros dobles: book_t **library, member_t **members para modificar listas.
```

* **Arreglos:**
```c
char title[100], char author[100].
int *issued_books: //Arreglo dinámico para IDs de libros prestados.
```

# conclusion
En mi opinión, el programa en C para la gestión de una biblioteca es un excelente ejemplo de cómo los fundamentos de programación estructurada pueden aplicarse para crear un sistema funcional y eficiente. La claridad en el uso de nombres, la organización modular de los subprogramas y el manejo cuidadoso de la memoria dinámica reflejan un diseño bien pensado.

# Referencias


[repositorio Papux100](https://github.com/papux100/Portafolio).

[pagina Papux100](https://papux100.github.io/Portafolio/).

1. U2 - Programming Paradigms.pdf. (n.d.). Google Docs. https://drive.google.com/file/d/1Ts1HTPs-ho9X-wjSw81eRFSJpDrPnJ5w/view
