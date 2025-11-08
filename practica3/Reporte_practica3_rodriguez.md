# Paradigmas
## Practica 3
## 7/11/2025
## Angel Rey Rodriguez(377864)
## Prof. Carlos Gallegos
## Reporte 

### introduccion:
Haskell es un lenguaje de programación funcional puro, con tipado fuerte y estático, que se basa en el uso de funciones matemáticas para resolver problemas sin modificar datos ni tener efectos secundarios. Usa evaluación perezosa, lo que significa que solo calcula lo necesario cuando se necesita, y su sintaxis es muy limpia y concisa. Se creó con fines académicos, pero también se utiliza en áreas como análisis financiero, inteligencia artificial, y sistemas de alta confiabilidad debido a su precisión y seguridad en el manejo de datos.

### para que sirve?
Haskell sirve para crear programas que sean seguros, confiables y fáciles de mantener, especialmente en tareas donde los errores pueden ser costosos o peligrosos. Se usa en áreas como la banca, la investigación científica, la inteligencia artificial, los compiladores, y los sistemas críticos. También es muy útil para enseñar conceptos de programación funcional y para investigar nuevos lenguajes o técnicas. En resumen, Haskell se usa tanto en la industria como en la academia para desarrollar software claro, correcto y matemáticamente sólido.

### para que fue creado?
Haskell fue creado a finales de los años 80 por investigadores y científicos de la computación que querían unificar los distintos lenguajes funcionales que existían en ese momento. Cada universidad tenía su propia versión, lo que dificultaba compartir ideas y avances. El objetivo fue crear un lenguaje puramente funcional, limpio y bien definido, que sirviera como base común para la enseñanza, la investigación y el desarrollo de nuevas ideas en programación funcional. En resumen, Haskell nació para ser un estándar académico que ayudara a estudiar y mejorar la forma de programar usando principios matemáticos.

### en la actualidad
Hoy en día, Haskell se usa tanto en la industria como en la investigación. En la industria, se emplea para desarrollar sistemas financieros, análisis de datos, servidores web, y software de alta confiabilidad, donde los errores deben ser mínimos. Empresas como Facebook, GitHub, y Standard Chartered Bank lo han usado para partes críticas de sus sistemas. En el ámbito académico, sigue siendo una herramienta importante para enseñar programación funcional y para investigar nuevos lenguajes y conceptos de computación. Aunque no es tan popular como C++ o Python, Haskell sigue siendo muy valorado por su claridad, precisión y seguridad.

### como instalar haskell

## 1. Instalación del Entorno Haskell

### Windows con MSYS2 (Recomendado)

```bash
# Instalar GHCup (gestor de Haskell)
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

**Durante la instalación de GHCup:**
-  Sí instalar Haskell Language Server (HLS)
-  Sí agregar al PATH
-  Instalar GHC (compilador)
-  Instalar Cabal (gestor de paquetes)
-  Instalar Stack (alternativa)

## 2. Verificación de la Instalación

```bash
# Cerrar y reabrir terminal, luego verificar:
ghc --version
cabal --version
stack --version
```

**Salida esperada:**
```
The Glorious Glasgow Haskell Compilation System, version 9.6.3
cabal-install version 3.10.1.0
Version 2.13.1
```

## 3. Configuración de VS Code

1. Instalar extensiones:
   - "Haskell" por Haskell Foundation
   - "Haskell Syntax Highlighting"
   - "Error Lens" (opcional)

2. Reiniciar VS Code

## 4. Prueba Básica del Entorno

### Crear archivo `prueba.hs`:
```haskell
main = do
  putStrLn "Hello, everybody!"
  putStrLn ("Please look at my favorite odd numbers: " ++ show (filter odd [10..20]))
```

### Ejecutar la prueba:
```bash
# Compilar
ghc prueba.hs

# Ejecutar
./prueba
```

### Salida esperada:
```
Hello, everybody!
Please look at my favorite odd numbers: [11,13,15,17,19]
```

## 5. Instalación y Ejecución de la Aplicación TODO

### Método 1: Con Git (si está en repositorio)
```bash
# Clonar el repositorio
git clone https://github.com/usuario/todo-app-haskell.git
cd todo-app-haskell

# Compilar con Cabal
cabal update
cabal build

# Ejecutar
cabal run todo-app
```

### Método 2: Con archivos locales
```bash
# Navegar al directorio de la aplicación
cd haskell/examples/blog/todo

# Compilar
cabal build

# Ejecutar
cabal run
```

### Método 3: Con Stack (alternativa)
```bash
stack build
stack exec todo-app
```

## 6. Estructura Esperada de la Aplicación TODO

```
todo-app/
├── app/
│   └── Main.hs
├── src/
│   ├── Todo.hs
│   └── Database.hs
├── todo-app.cabal
├── package.yaml
└── README.md
```

## 7. Comandos de Ejecución Directa (sin compilar)

```bash
# Ejecutar directamente con runghc
runghc app/Main.hs

# O si tiene un módulo principal específico
runghc -i/src Main.hs
```

## 8. Solución de Problemas Comunes

### Si hay errores de dependencias:
```bash
cabal update
cabal install --only-dependencies
```

### Si hay problemas con HLS en VS Code:
```bash
ghcup set ghc 9.6.3
ghcup set hls
```

### Verificar instalaciones:
```bash
ghcup list
```

## 9. Ejemplo de Ejecución Exitosa

```bash
PS C:\msys64\home\usuario\todo-app> cabal run
Build profile: -w ghc-9.6.3
Preprocessing executable 'todo-app' for todo-app-0.1.0.0...
Building executable 'todo-app' for todo-app-0.1.0.0...
[1 of 2] Compiling Todo
[2 of 2] Compiling Main
Linking .\dist-newstyle\build\x86_64-windows\ghc-9.6.3\todo-app-0.1.0.0\x\todo-app\build\todo-app\todo-app.exe...

Bienvenido a la aplicación TODO
Comandos disponibles:
  - add <tarea>
  - list
  - complete <número>
  - exit
>
```

## 10. Resumen de Comandos Esenciales

```bash
# Verificar instalación
ghc --version && cabal --version

# Compilar cualquier programa Haskell
ghc programa.hs
./programa

# Ejecutar sin compilar
runghc programa.hs

# Para la aplicación TODO
cabal build && cabal run
```



### Conclusion
Haskell es un lenguaje poderoso pero con curva de aprendizaje pronunciada. Su sistema de tipos robusto y programación funcional pura ofrecen ventajas en corrección y mantenibilidad, aunque puede resultar abstracto para desarrolladores acostumbrados a paradigmas imperativos. La instalación con GHCup ha mejorado significativamente, pero la ecosystem aún es más complejo que lenguajes mainstream. Ideal para proyectos donde la seguridad de tipos y escalabilidad son críticas, pero puede ser excesivo para scripts simples.

### Referencias

[repositorio Papux100](https://github.com/papux100/Portafolio).

[pagina Papux100](https://papux100.github.io/Portafolio/)

Get started. (n.d.). https://www.haskell.org/get-started/
colaboradores de Wikipedia. (2025, April 4). Haskell. Wikipedia, La Enciclopedia Libre. https://es.wikipedia.org/wiki/Haskell
Visual Studio Code - The open source AI code editor. (2021, November 3). https://code.visualstudio.com/
Haskell Language. (n.d.). https://www.haskell.org/
