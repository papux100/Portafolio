# Paradigmas
## Practica 2
## 8/9/2025
## Angel Rey Rodriguez(377864)
## Prof. Carlos Gallegos
## Reporte

### introduccion:



## 1. Explicación de Conceptos de Programación Orientada a Objetos (POO) con Ejemplos

La Programación Orientada a Objetos (POO) es un paradigma de programación que utiliza "objetos" para representar entidades del mundo real, permitiendo una mejor organización, reutilización y mantenimiento del código. A continuación, se explican los conceptos clave con ejemplos del código migrado.

- **Clase**: Una clase es un blueprint o plantilla que define las propiedades (atributos) y comportamientos (métodos) de un objeto. En el código, la clase Book define atributos como id, title, author, etc., y métodos como to_dict() para convertir el libro en un diccionario.
  
  Ejemplo: 
  ```python:disable-run
  class Book:
      def __init__(self, book_id, title, author, publication_year, genre, quantity):
          self.id = book_id
          self.title = title
          # ... (otros atributos)
  ```
  Aquí, Book es la clase que representa un libro genérico.

- **Objeto**: Un objeto es una instancia de una clase, es decir, una realización concreta de la plantilla definida por la clase. Cada objeto tiene sus propios valores para los atributos.

  Ejemplo: Al ejecutar book = Book(1, "El Quijote", "Cervantes", 1605, "Ficcion", 5), se crea un objeto book con valores específicos.

- **Herencia**: Permite que una clase (hija) herede atributos y métodos de otra clase (padre), promoviendo la reutilización de código. En el código, DigitalBook hereda de Book y añade el atributo file_format.

  Ejemplo:
  ```python
  class DigitalBook(Book):
      def __init__(self, book_id, title, author, publication_year, genre, quantity, file_format):
          super().__init__(book_id, title, author, publication_year, genre, quantity)
          self.file_format = file_format
  ```
  DigitalBook hereda todos los atributos de Book y extiende con file_format.

- **Encapsulamiento**: Consiste en ocultar los detalles internos de un objeto y exponer solo lo necesario a través de métodos. En Python, se usa convención con guiones bajos para atributos "privados", aunque en este código los atributos son públicos por simplicidad. Sin embargo, los métodos como add_book encapsulan la lógica de agregar un libro a la lista de la biblioteca.

  Ejemplo: El atributo issued_books en Member se modifica solo a través de métodos como issue_book en Library, encapsulando la lógica de préstamo.

- **Abstracción**: Se enfoca en exponer solo los detalles esenciales y ocultar la complejidad. Las clases abstractas (no usadas aquí directamente) o métodos como find_book_by_id abstraen la búsqueda sin exponer cómo se itera la lista.

  Ejemplo: El usuario interactúa con library.display_books(), que abstrae la iteración y impresión de libros, sin necesidad de conocer la estructura interna de self.books.

- **Polimorfismo**: Permite que objetos de diferentes clases respondan al mismo método de manera diferente. En el código, to_dict() se sobrescribe en DigitalBook para incluir file_format, mientras que en Book es la versión base.

  Ejemplo: Al llamar book.to_dict() en una lista que contiene tanto Book como DigitalBook, cada uno ejecuta su versión apropiada (polimorfismo por sobrescritura).

## 2. Breve Comparación entre la Versión en C y la Versión en Python

La versión en C es procedural, utilizando estructuras (struct) para datos y funciones globales para operaciones. La gestión de memoria es manual con malloc/free, y las listas se implementan con punteros enlazados. No hay herencia ni polimorfismo nativo, lo que hace el código más verbose y propenso a errores (e.g., fugas de memoria). La persistencia usa archivos de texto plano con fprintf/fscanf, y la interfaz es un menú en consola similar.

En contraste, la versión en Python usa POO, con clases que encapsulan datos y métodos. La gestión de memoria es automática (garbage collector), simulada aquí con memory_management para fines educativos. La herencia permite extender Book a DigitalBook fácilmente, y el polimorfismo simplifica el manejo de tipos mixtos. La persistencia usa JSON, más robusta y legible que el texto plano en C. Python es más conciso (e.g., listas integradas vs. listas enlazadas manuales), legible y menos propenso a errores de bajo nivel. Sin embargo, C es más eficiente en rendimiento para aplicaciones de alto volumen, mientras que Python prioriza la productividad.

Diferencias clave:
- **Estructura**: C usa structs + funciones; Python usa clases con métodos.
- **Memoria**: Manual en C; automática en Python.
- **Persistencia**: Texto en C; JSON en Python.
- **Extensibilidad**: POO en Python facilita agregar tipos como revistas vía herencia.

## Elementos de programacion

### 1. Nombres
Los nombres son identificadores utilizados para variables, funciones, clases, métodos, etc. En Python, son sensibles a mayúsculas/minúsculas y deben seguir reglas de sintaxis (letras, números, guiones bajos, sin espacios).

- **Ejemplos**:
  - Variables: book_id, title, self.books (en `Library.__init__` de biblioteca.py).
  - Clases: Book, DigitalBook, Member, Library (en biblioteca.py).
  - Métodos: add_book, to_dict, display_memory_usage (en biblioteca.py y memory_management.py).
  - Objetos: library (instancia de Library en main() de biblioteca.py).
  - Módulos: memory_management (importado en biblioteca.py y biblioteca_web.py).

### 2. Marcos de Activación
Los marcos de activación (o *activation records*) son estructuras internas que Python utiliza para gestionar el contexto de ejecución de funciones o métodos, incluyendo variables locales, parámetros y el estado del programa. En Python, esto es manejado automáticamente por el intérprete.

- **Ejemplos**:
  - En Library.issue_book (biblioteca.py), al llamar al método, se crea un marco de activación con parámetros book_id y member_id, y variables locales como book y member.
  - En main() (biblioteca.py), cada iteración del bucle while y las llamadas a métodos como library.add_book(book) crean nuevos marcos de activación para manejar las variables locales (book_id, title, etc.).
  - En biblioteca_web.py, cada solicitud HTTP (e.g., add_book()) genera un marco de activación para procesar request.json y otros datos locales.

### 3. Bloques de Alcance
El alcance (*scope*) define la visibilidad de los nombres. En Python, los alcances son determinados por bloques como funciones, clases, módulos o el ámbito global. Python utiliza alcance léxico.

- **Ejemplos**:
  - **Ámbito de clase**: En Library (biblioteca.py), self.books y self.members son atributos de instancia, visibles en todos los métodos de la clase.
  - **Ámbito de método**: En Library.display_books, la variable book en el bucle for book in self.books tiene alcance local al método.
  - **Ámbito global**: La instancia memory_management en memory_management.py es global y accesible desde biblioteca.py y biblioteca_web.py tras importar el módulo.
  - **Ámbito de módulo**: Las funciones en biblioteca_web.py (e.g., get_books) tienen acceso a la variable global library definida en el módulo.

### 4. Administración de Memoria
Python utiliza un recolector de basura (*garbage collector*) para administrar la memoria automáticamente, liberando objetos cuando no hay referencias a ellos. El código incluye una simulación de seguimiento de memoria en memory_management.py.

- **Ejemplos**:
  - **Asignación**: En `Book.__init__` (biblioteca.py), la creación de un objeto (self) incrementa memory_management.increment_heap_allocations(1).
  - **Liberación**: En `Book.__del__`, la destrucción del objeto llama a memory_management.increment_heap_deallocations(1) para simular liberación.
  - **Seguimiento**: En MemoryManagement.display_memory_usage (memory_management.py), se muestra el conteo de asignaciones y liberaciones (self.heap_allocations, self.heap_deallocations).
  - **Gestión automática**: En biblioteca.py, la lista self.books crece dinámicamente sin gestión manual, gracias a Python.

### 5. Expresiones
Las expresiones son combinaciones de valores, variables, operadores y funciones que producen un resultado. En Python, incluyen operaciones aritméticas, lógicas, comparaciones, etc.

- **Ejemplos**:
  - Aritméticas: book.quantity -= 1 en Library.issue_book (biblioteca.py) resta 1 a la cantidad de libros.
  - Comparaciones: book.id == book_id en Library.find_book_by_id verifica igualdad.
  - Llamadas a funciones: book.to_dict() en Library.save_library_to_file (biblioteca.py) genera un diccionario.
  - List comprehensions: [book.to_dict() for book in self.books] en Library.save_library_to_file crea una lista de diccionarios.
  - Condicional: "file_format" in data en Library.load_library_from_file evalúa si un libro es digital.

### 6. Comandos
Los comandos (o sentencias) son instrucciones que ejecutan acciones, como asignaciones, estructuras de control, o llamadas a funciones.

- **Ejemplos**:
  - Asignación: self.books = [] en `Library.__init__` (biblioteca.py) inicializa una lista vacía.
  - Llamada a método: library.add_book(book) en main() (biblioteca.py) agrega un libro.
  - Impresión: print(f"Biblioteca guardada exitosamente en {filename}\n") en Library.save_library_to_file.
  - Control: if not self.books en Library.display_books verifica si la lista está vacía.
  - Entrada: book_id = int(input("Ingresa ID del libro: ")) en main() (biblioteca.py).

### 7. Control de Secuencia
Incluye estructuras para controlar el flujo del programa: selección (condicionales), iteración (bucles) y recursión.

- **Selección**:
  - **Ejemplo**: En Library.issue_book (biblioteca.py):
    ```python:disable-run
    if book and member and book.quantity > 0:
        book.quantity -= 1
        member.issued_books.append(book_id)
        print("\nLibro prestado satisfactoriamente!\n")
    else:
        print("\nLibro o miembro no encontrados.\n")
    ```
    Evalúa si el libro y el miembro existen y si hay existencias.

  - **Ejemplo (biblioteca_web.py)**: En `add_book`:
    ```python
    is_digital = data.get('is_digital', False)
    if is_digital:
        book = DigitalBook(...)
    else:
        book = Book(...)
    ```
    Selecciona entre crear un `Book` o `DigitalBook`.

- **Iteración**:
  - **Ejemplo**: En `Library.display_books` (`biblioteca.py`):
    ```python
    for book in self.books:
        print(f"ID libro: {book.id}\nTitulo: {book.title}\n...")
    ```
    Itera sobre la lista de libros para mostrarlos.

  - **Ejemplo**: En `Library.find_book_by_id`:
    ```python
    for book in self.books:
        if book.id == book_id:
            return book
    ```
    Busca un libro iterando la lista.

- **Recursión**:
  - No hay ejemplos explícitos de recursión en los archivos Python, ya que las operaciones como mostrar libros usan bucles (for) en lugar de recursión, a diferencia de displayBooksRecursive en biblioteca.c. Python favorece iteraciones explícitas para simplicidad.

### 8. Subprogramas
Los subprogramas son funciones o métodos que encapsulan lógica reusable. En Python, incluyen funciones y métodos de clase.

- **Ejemplos**:
  - **Métodos de clase**: Library.add_book, Book.to_dict, DigitalBook.from_dict (biblioteca.py) son métodos que encapsulan operaciones específicas.
  - **Funciones**: main() en biblioteca.py actúa como el punto de entrada del programa, coordinando la interacción con el usuario.
  - **Funciones de Flask**: En biblioteca_web.py, funciones como get_books y add_book son subprogramas asociados a rutas HTTP.
  - **Métodos estáticos**: Book.from_dict y DigitalBook.from_dict (biblioteca.py) crean objetos a partir de diccionarios sin necesidad de una instancia.

### 9. Tipos de Datos
Python es dinámicamente tipado, y los tipos de datos incluyen primitivos (enteros, cadenas), estructuras compuestas (listas, diccionarios) y tipos definidos por el usuario (clases).

- **Ejemplos**:
  - **Primitivos**:
    - Enteros: book_id (en Book.__init__), quantity (en Library.issue_book).
    - Cadenas: title, author (en Book.__init__), file_format (en DigitalBook).
    - Booleanos: is_digital en main() (biblioteca.py) o data.get('is_digital', False) en biblioteca_web.py.
  - **Compuestos**:
    - Listas: self.books y self.members en Library almacenan objetos Book y Member.
    - Diccionarios: book.to_dict() retorna un diccionario con los atributos del libro.
  - **Definidos por el usuario**:
    - Clases: Book, DigitalBook, Member, Library (biblioteca.py) y MemoryManagement (memory_management.py).
    - Enumeraciones implícitas: Genre en biblioteca.py define constantes como FICTION, SCIENCE, etc.
  - **JSON**: En Library.save_library_to_file, los datos se serializan a JSON (diccionarios y listas), un tipo compuesto manejado por el módulo json.

### Resumen
Los archivos Python (biblioteca.py, memory_management.py, biblioteca_web.py) implementan todos los elementos fundamentales requeridos:
- **Nombres**: Variables, clases, métodos y módulos bien definidos.
- **Marcos de activación**: Gestionados implícitamente en métodos y funciones.
- **Bloques de alcance**: Claros en clases, métodos y módulos.
- **Administración de memoria**: Automática, con simulación en memory_management.py.
- **Expresiones**: Usadas en cálculos, comparaciones y list comprehensions.
- **Comandos**: Asignaciones, impresiones, y estructuras de control.
- **Control de secuencia**: Selección e iteración presentes; recursión ausente en Python (a diferencia de C).
- **Subprogramas**: Métodos y funciones encapsulan lógica reusable.
- **Tipos de datos**: Primitivos, compuestos y definidos por el usuario, con JSON para persistencia.

## 3. Conclusiones sobre las Ventajas de POO

La POO ofrece varias ventajas sobre la programación procedural, como se evidencia en esta migración:
- **Reutilización de Código**: La herencia permite extender clases existentes (e.g., `DigitalBook` reutiliza `Book`) sin duplicar código.
- **Mantenibilidad**: El encapsulamiento y abstracción hacen el código más modular, facilitando cambios (e.g., modificar la lógica de préstamo en un solo método).
- **Flexibilidad**: El polimorfismo permite tratar objetos heterogéneos uniformemente, ideal para expandir el sistema (e.g., agregar revistas como subclase de Item).
- **Modelado del Mundo Real**: Las clases representan entidades como Biblioteca y Miembros de forma natural, mejorando la comprensión.
- **Escalabilidad**: Facilita agregar características como búsqueda avanzada o interfaces web (como en `biblioteca_web.py`).

En resumen, la POO en Python hace el programa más intuitivo, extensible y menos error-prone que la versión procedural en C, aunque con un posible costo en rendimiento. Para aplicaciones como esta, las ventajas en desarrollo superan las desventajas. (Informe: ~2 páginas estimadas en formato estándar).

### Referencias

9. Clases. (n.d.). Python Documentation. https://docs.python.org/es/3/tutorial/classes.html
10. 📗 Crear clase. (n.d.). El Libro De Python. https://ellibrodepython.com/crear-clase-python
11. Python classes: cómo crear clases y objetos. (2024, July 15). IONOS Digital Guide. https://www.ionos.mx/digitalguide/paginas-web/desarrollo-web/python-classes/
12. SL, P. E. C. (n.d.). Cómo funcionan las clases y objetos en Python. Programación En Castellano. https://programacion.net/articulo/como_funcionan_las_clases_y_objetos_en_python_1505
  