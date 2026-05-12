# Conceptos básicos sobre Docker

Docker es una herramienta de código abierto diseñada para facilitar el despliegue y la ejecución de aplicaciones mediante el uso de contenedores. Un contenedor es un paquete ligero que incluye todo lo que una aplicación necesita para funcionar: su código, librerías, configuraciones y dependencias.
El problema que Docker resuelve es muy habitual en el mundo del desarrollo: una aplicación funciona perfectamente en el ordenador del programador, pero falla al llevarse a otro entorno como un servidor o el equipo de un compañero. Docker elimina este problema asegurando que el entorno de ejecución sea siempre el mismo, independientemente de dónde se ejecute.

# Imágenes vs. Contenedores

Aunque a menudo se usan como sinónimos, una imagen y un contenedor son cosas distintas.
Una imagen Docker es una plantilla estática y de solo lectura. Define cómo debe ser el entorno de la aplicación: qué sistema operativo usar, qué programas instalar y cómo configurarlos. Por sí sola no hace nada; es simplemente un molde.
Un contenedor Docker es el resultado de ejecutar esa imagen. Es el entorno real y activo donde la aplicación corre. A partir de una misma imagen se pueden crear múltiples contenedores funcionando simultáneamente e independientemente entre sí. Cada contenedor se puede iniciar, detener o eliminar sin afectar a los demás.
Una analogía útil: si la imagen es el molde de una galleta, el contenedor es cada galleta que produces con él.

# Volúmenes de almacenamiento

Los contenedores son por naturaleza efímeros, es decir, todo lo que se genera o modifica dentro de un contenedor desaparece cuando este se elimina. Esto es un problema cuando necesitamos conservar datos entre ejecuciones, como registros de usuarios o archivos subidos.
Para solucionar esto, Docker ofrece los volúmenes. Un volumen es un espacio de almacenamiento que existe fuera del contenedor, en el sistema anfitrión, pero que el contenedor puede usar como si fuera suyo. De esta forma, aunque el contenedor se destruya o se recree, los datos almacenados en el volumen permanecen intactos y disponibles para el siguiente contenedor que los necesite.
