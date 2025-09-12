# Paradigmas
## Practica 1
## 12/9/2025
## Angel Rey Rodriguez(377864)
## Prof. Carlos Gallegos
## Reporte 

### introduccion:

### Nombres (Identificadores)
* **Variables:** static_var, bss_var, library, members, bookCount, choice
* **Tipos:** genre_t, book_t, member_t
* **Funciones:** addBook(), displayBooks(), findBookById(), etc.
* **Constantes** enumeradas: FICTION, NON_FICTION, SCIENCE, etc.

### Marcos de Activación (Activation Records)

Cada llamada a función crea un marco de activación en el stack:

```c
void addBook(book_t **library, int* count) {
    // Variables locales: new_book (en stack)
    book_t *new_book = (book_t *)malloc(sizeof(book_t));
    // Marco de activación contiene parámetros y variables locales
}
```

### Bloques de Alcance
* **Alcance global:** Variables static_var, bss_var, tipos definidos
* **Alcance de función:** Variables locales dentro de cada función
* **Alcance de bloque:** Variables dentro de estructuras de control

### Administración de Memoria
* **Stack:** Variables automáticas (library, members, choice, etc.)
* **Heap:** Memoria dinámica asignada con malloc() y realloc()
* **Segmento de datos:** static_var
* **Segmento BSS:** bss_var 

### Expresiones
c
// Expresiones aritméticas
bookFound->quantity--;
memberFound->issued_count++;

// Expresiones lógicas
if (current->id == bookID && current->quantity > 0)

// Expresiones de asignación
new_book->next = *library;
*library = new_book;
6. Comandos (Statements)
Declaraciones: int bookCount = 0;

Asignaciones: choice = 0;

Llamadas a funciones: displayBooks(library);

Estructuras de control: if, switch, while, do-while

7. Control de Secuencia
Selección
c
// if-else
if (bookFound && memberFound) {
    // código
} else {
    // código alternativo
}

// switch-case
switch (choice) {
    case 1: addBook(...); break;
    case 2: displayBooks(...); break;
    // ...
}
Iteración
c
// while loop
while (current) {
    // procesar elemento
    current = current->next;
}

// for loop
for (int i = 0; i < memberFound->issued_count; i++) {
    // procesar libro prestado
}

// do-while loop
do {
    // mostrar menú y procesar opción
} while(choice != 8);
Recursión
c
void displayBooksRecursive(book_t *library) {
    if (!library) {
        return; // caso base
    }
    printf("\nID libro: %d\nTitulo: %s\n", library->id, library->title);
    displayBooksRecursive(library->next); // llamada recursiva
}
8. Subprogramas (Funciones)
Funciones con parámetros: void addBook(book_t **library, int* count)

Funciones con retorno: book_t* findBookById(book_t *library, int bookID)

Funciones void: void displayBooks(book_t *library)

Procedimientos: Funciones que no retornan valor pero realizan acciones

9. Tipos de Datos
Tipos Primitivos
int, char

Tipos Estructurados
c
// Estructuras
typedef struct _book {
    int id;
    char title[100];
    // ... más campos
} book_t;

// Enumeraciones
typedef enum {
    FICTION,
    NON_FICTION,
    // ... más géneros
} genre_t;
Tipos Derivados
Punteros: book_t *library, member_t **members

Arrays: char title[100], int *issued_books

Estructuras autorreferenciadas: Para implementar listas enlazadas

Tipos Definidos por el Usuario
c
typedef struct _book book_t;
typedef struct _member member_t;
typedef enum {...} genre_t;
10. Manejo de Archivos
c
// Escritura
FILE *file = fopen(filename, "w");
fprintf(file, "%d\n%s\n", current->id, current->title);

// Lectura
FILE *file = fopen(filename, "r");
fscanf(file, "%d\n", &new_book->id);
11. Gestión de Memoria Explícita
c
// Asignación
book_t *new_book = (book_t *)malloc(sizeof(book_t));

// Reasignación
memberFound->issued_books = realloc(...);

// Liberación
free(current);
free(current->issued_books);
Este código demuestra prácticamente todos los conceptos fundamentales de la programación en C, mostrando cómo se implementan y utilizan estos elementos en una aplicación real de gestión de biblioteca.
### Referencias

