# Actividad 6 - Creación de una nueva imagen a partir de un contenedor

Hasta ahora hemos creado contenedores a partir de imágenes de Docker Hub. Para servir nuestra propia aplicación necesitamos crear una imagen personalizada, lo que se conoce como "dockerizar" una aplicación.

La primera forma de hacerlo es partiendo de un contenedor que hayamos modificado.

## 1. Arrancar un contenedor base

Arrancamos un contenedor interactivo a partir de la imagen de Debian:
~~~
sudo docker run -it --name creacion-imagen debian bash
~~~
<img width="1216" height="261" alt="1" src="https://github.com/user-attachments/assets/cc132c89-ba2f-42d3-a049-700926784c19" />


## 2. Realizar modificaciones en el contenedor

Dentro del contenedor, actualizamos e instalamos Apache2:
~~~
apt update && apt install apache2 -y
~~~
<img width="1214" height="767" alt="2" src="https://github.com/user-attachments/assets/b321eee4-37c6-4308-be4c-e86f341543a2" />


Creamos un `index.html` personalizado y salimos:
~~~
echo "<h1>Curso Docker</h1>" > /var/www/html/index.html
exit
~~~
<img width="1217" height="149" alt="3" src="https://github.com/user-attachments/assets/3a9b6bec-320d-48e6-acc3-ddead7cc8e1b" />


## 3. Crear la nueva imagen con `docker commit`

Con `docker commit` generamos una nueva imagen que incluye las capas de la imagen base más los cambios que hemos realizado en el contenedor. Si no indicamos etiqueta se asigna `latest` por defecto:
~~~
sudo docker commit creacion-imagen antonio/myapache2:v1
~~~

Comprobamos con `docker images` que la nueva imagen aparece en el listado local:
~~~
sudo docker images
~~~
<img width="1213" height="499" alt="4" src="https://github.com/user-attachments/assets/6d906675-b433-4261-8398-3716d10f842c" />


## 4. Lanzar un contenedor a partir de la nueva imagen

Al crear una imagen con este método **no podemos configurar el proceso que se ejecuta por defecto**, por lo que hay que indicarlo explícitamente al crear el contenedor. Para arrancar Apache en primer plano usamos `apache2ctl -D FOREGROUND`.

Primero eliminamos el contenedor anterior y lanzamos el nuevo servidor web:
~~~
sudo docker rm -f creacion-imagen
sudo docker run -d -p 8080:80 \
  --name servidor_web \
  antonio/myapache2:v1 \
  bash -c "apache2ctl -D FOREGROUND"
~~~

Verificamos con `docker ps -a` que el contenedor está corriendo con la nueva imagen:
~~~
sudo docker ps -a
~~~
<img width="1216" height="434" alt="5" src="https://github.com/user-attachments/assets/1a8e4b98-c58f-45a2-baee-959427d2b2d9" />
