# Paradigmas
## Practica 0
## 8/9/2025
## Angel Rey Rodriguez(377864)
## Prof. Carlos Gallegos
## Reporte

### ¿Qué es Hugo?
Hugo es un generador de sitios estáticos (SSG, por sus siglas en inglés), escrito en Go. Fue creado por Steve Francia en 2013 y, desde la versión 0.14 en 2015, ha sido mantenido principalmente por Bjørn Erik Pedersen junto con otros colaboradores. Es un proyecto de código abierto bajo licencia Apache 2.0

### Funcionamiento

* Hugo transforma un directorio con archivos de contenido (Markdown o HTML) y plantillas en un sitio web completamente estático, generando cada página en menos de un milisegundo.
* Ofrece una experiencia de “resolver y reiniciar” con servidor web integrado, lo que permite probar cambios en vivo durante el desarrollo

### Características

* Multiplataforma.
* Sitios web generados de altísima velocidad de despliegue y descarga.
* Bien documentado.
* Facilidad de uso. Hugo toma contenido escrito en archivos Markdown y los renderiza a un sitio web estático.
* Variedad de temas gratuitos y configurables.
* Tiene soporte para sitios multilingües, internacionalización y localización.
* Preprocesamiento de imagen para optimizar la velocidad de carga, mediante Resizing y Smart Cropping.
* Permite la creación de taxonomías ilimitadas: etiquetas y categorías.

### ¿Qué es GitHub Actions?
GitHub Actions se define como una plataforma utilizada para la integración continua (CI) y la entrega continua (CD), que permite la automatización de procesos de compilación, implementación y prueba.

De la misma manera, esta herramienta destaca por contribuir en el desarrollo y creación del código de forma directa a través de la plataforma.

GitHub Actions permite, además, el inicio de workflows como el desarrollo de issues, la creación de nuevas versiones y demás, al tiempo que se combina y ajustan acciones para los servicios que se usan, crean, actualizan y mantienen la comunidad de la plataforma.

### Características de GitHub Actions

Dentro de las características y propiedades a destacar de la herramienta de GitHub Actions está la automatización de los flujos de trabajo del usuario, desde su etapa de planteamiento de la idea hasta la producción total.

Además, como funciones principales de GitHub Actions, se encuentran sus labores de revisión de código, clasificación de errores, gestión de sucursales y demás.

Otra de las características importantes de esta herramienta es su capacidad para desarrollar flujos de trabajo o workflows que puedan construir y probar las peticiones de extracción en los repositorios, o bien las actividades de implementación de solicitudes de extracción en conjunto con su producción en el sistema.

Como ventaja del uso de GitHub Actions, también tenemos que esta opción permite la ejecución de los flujos de trabajo, incluso en situaciones donde se presente algún tipo de evento en los repositorios.

---

### Crear un sitio estático en Hugo
1. Instalar Hugo en el sistema.
2. creas de preferencia una carpeta donde estaran todos los archivos de tu pagina.
3. Crear un nuevo sitio:
   ```bash
   cd nombre_de_la_carpeta
   hugo new site nombre-del-sitio
   cd nombe-del-sitio
   git init
   git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
   echo "theme = 'ananke'" >> hugo.toml
   hugo server

### Cómo subir información a GitHub

#### 1. Crear un repositorio en GitHub
1. Ingresa a Github.
2. Haz clic en New Repository.
3. Ponle un nombre y selecciona si será público o privado.
4. Da clic en Create repository.

#### 2. Configurar Git en tu computadora
Abre la terminal y configura tu usuario (solo la primera vez):

```bash
git config --global user.name "TuNombre"
git config --global user.email "tuemail@example.com"

mkdir mi-proyecto
cd mi-proyecto
###creamos repositorio y hacemos un commit
git init

echo "# Mi Proyecto" >> README.md

git add .

git commit -m "Primer commit"

git remote add origin https://github.com/usuario/mi-proyecto.git

git push -u origin main
```
Con esto ya puedes crear, modificar y subir tus proyectos a GitHub.


### Configurar GitHub Actions para publicar en GitHub Pages

#### 1. Crear un repositorio en GitHub
1. Ingresa a [GitHub](https://github.com).
2. Crea un repositorio nuevo o usa uno existente.
3. Sube tu proyecto (ejemplo: sitio hecho con Hugo, Jekyll, React, etc.).


#### 2. Activar GitHub Pages
1. Ve a **Settings** → **Pages**.
2. En "Source", selecciona **GitHub Actions**.


#### 3. Crear un Workflow de GitHub Actions
En tu repositorio, crea la carpeta `.github/workflows/` y dentro un archivo `deploy.yml` (puede llamarse diferente).

Ejemplo básico para un sitio **Hugo**:

```yaml
name: Deploy Hugo site to GitHub Pages

on:
  push:
    branches:
      - main   # Se ejecuta cuando haces push a main

jobs:
  build-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo
        uses: actions/checkout@v3

      - name: Instalar Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'

      - name: Build
        run: hugo --minify

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
```



[repositorio Papux100](https://github.com/papux100/Portafolio).

[pagina Papux100](https://papux100.github.io/Portafolio/)

### Referencias

1. colaboradores de Wikipedia. (2024, June 29). Hugo (software). Wikipedia, La Enciclopedia Libre. https://es.wikipedia.org/wiki/Hugo_(software)
2. Mallón, X. (2024, April 24). ¿Qué es GitHub Actions? | KeepCoding Bootcamps. KeepCoding Bootcamps. https://keepcoding.io/blog/que-es-github-actions/
3. 
