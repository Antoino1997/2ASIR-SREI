# Actividad 4 - Almacenamiento y redes Docker

## Despliegue de la aplicación Guestbook

Primero creamos la red interna de Docker que conectará los contenedores entre sí:
~~~
sudo docker network create red_guestbook
~~~
<img width="1216" height="126" alt="1" src="https://github.com/user-attachments/assets/e5103429-8207-431d-87ff-0499a4cae911" />


Ahora lanzamos el contenedor de Redis (base de datos en memoria) conectado a esa red, con un volumen persistente en `/opt/redis`, y a continuación el contenedor de la aplicación Guestbook mapeando el puerto 5000:
~~~
sudo docker run -d --name redis --network red_guestbook -v /opt/redis:/data redis redis-server --appendonly yes
sudo docker run -d -p 80:5000 --name guestbook --network red_guestbook iesgn/guestbook
~~~
<img width="1216" height="764" alt="2" src="https://github.com/user-attachments/assets/8e8f74a7-500e-48e2-8869-b46986a42046" />


Comprobamos que la aplicación está funcionando accediendo desde el navegador a `127.0.0.1`:
<img width="1216" height="315" alt="3" src="https://github.com/user-attachments/assets/9b058288-83e8-4b4b-b6e0-385d4d17719f" />


## Despliegue de la aplicación Temperaturas

Como antes, creamos una red para que los dos contenedores puedan comunicarse internamente:
~~~
sudo docker network create red_temperaturas
~~~
<img width="1216" height="115" alt="4" src="https://github.com/user-attachments/assets/edde11fe-1c0c-48c3-af40-14109a39024d" />


Lanzamos el backend y el frontend de la aplicación, conectando ambos a la red y mapeando el puerto 3000 del frontend al 80 del host:
~~~
sudo docker run -d --name temperaturas-backend --network red_temperaturas iesgn/temperaturas_backend
sudo docker run -d -p 80:3000 --name temperaturas-frontend --network red_temperaturas iesgn/temperaturas_frontend
~~~
<img width="1211" height="540" alt="5" src="https://github.com/user-attachments/assets/035b3b41-dfbd-4a74-be49-7d71b7b4bcce" />
<img width="1214" height="210" alt="6" src="https://github.com/user-attachments/assets/15e291e5-da01-4205-af3f-91a6d355b30e" />


Comprobamos que la aplicación funciona correctamente accediendo a `127.0.0.1` en el navegador:
<img width="1217" height="471" alt="7" src="https://github.com/user-attachments/assets/7e3c3d5b-0850-4846-a33f-425c36ea4d40" />


## Despliegue de WordPress + MariaDB

Creamos la red que usarán los dos servicios:
~~~
sudo docker network create red_wp
~~~
<img width="1214" height="119" alt="8" src="https://github.com/user-attachments/assets/20673892-40e9-4f63-b91a-8a398b896b5d" />


Lanzamos el contenedor de MariaDB con las variables de entorno necesarias para configurar la base de datos y un volumen persistente en `/opt/mysql_wp`:
~~~
sudo docker run -d --name servidor_mysql \
  --network red_wp \
  -v /opt/mysql_wp:/var/lib/mysql \
  -e MYSQL_DATABASE=bd_wp \
  -e MYSQL_USER=user_wp \
  -e MYSQL_PASSWORD=prueba \
  -e MYSQL_ROOT_PASSWORD=prueba \
  mariadb
~~~
<img width="1215" height="431" alt="9" src="https://github.com/user-attachments/assets/5ffddf3a-9cc4-4e0e-8411-d18ec4623164" />


A continuación lanzamos el contenedor de WordPress, apuntando al contenedor de MariaDB como host de base de datos, con un volumen para el contenido y mapeando el puerto 80:
~~~
sudo docker run -d --name servidor_wp \
  --network red_wp \
  -v /opt/wordpress:/var/www/html/wp-content \
  -e WORDPRESS_DB_HOST=servidor_mysql \
  -e WORDPRESS_DB_USER=user_wp \
  -e WORDPRESS_DB_PASSWORD=prueba \
  -e WORDPRESS_DB_NAME=bd_wp \
  -p 80:80 \
  wordpress
~~~
<img width="1216" height="765" alt="10" src="https://github.com/user-attachments/assets/a3a5d98a-649b-4949-8116-7c5a0a6f4eb9" />


Accedemos a `127.0.0.1` en el navegador y comprobamos que aparece el instalador de WordPress:
<img width="1214" height="768" alt="11" src="https://github.com/user-attachments/assets/4a4cc8ec-1d35-4fd3-83e8-5a3e99de8789" />
