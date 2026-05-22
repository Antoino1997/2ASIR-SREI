# Actividad 5 - Docker Compose

## Despliegue de la aplicación Letschat mediante Docker Compose

Creamos el fichero `docker-compose.yml` con nano y lo levantamos en modo *daemon* con:
~~~
sudo nano docker-compose.yml
sudo docker compose up -d
~~~
<img width="1213" height="323" alt="1" src="https://github.com/user-attachments/assets/9536e739-3c05-4c00-b252-8b31644b4860" />

He de aclarar que la estructura del docker-compose.yml se encuentra en el ejercicio y es uno genérico que mete en el contenedor lo necesario.
<br/><br/>Verificamos que los contenedores están corriendo con:
~~~
sudo docker compose ps
~~~
<img width="1210" height="228" alt="2" src="https://github.com/user-attachments/assets/458d9176-a533-4cb6-9f6e-b5f2e29bfa5d" />


Eliminamos la aplicación multicontenedor junto con los volúmenes usando el flag `-v`:
~~~
sudo docker compose down -v
~~~
<img width="1213" height="257" alt="3" src="https://github.com/user-attachments/assets/dbf60519-827a-446c-99b9-366d6c9ad815" />


## Despliegue de la aplicación Temperaturas mediante Docker Compose

Editamos el `docker-compose.yml` con la nueva receta para la aplicación Temperaturas. El fichero define dos servicios (backend y frontend) conectados a la misma red `red_temperaturas`, con `depends_on` para que el frontend espere al backend:
~~~
sudo nano docker-compose.yml
~~~
<img width="1215" height="765" alt="4" src="https://github.com/user-attachments/assets/aa010160-b51a-49cd-a824-521535d3e06f" />


Lo levantamos:
~~~
sudo docker compose up -d
~~~
<img width="1217" height="232" alt="5" src="https://github.com/user-attachments/assets/83c79949-030a-4906-9fd6-851cc1c1c570" />


Comprobamos que ambos contenedores están en marcha y después los eliminamos junto con la red:
~~~
sudo docker compose ps
sudo docker compose down -v
~~~
<img width="1219" height="423" alt="6" src="https://github.com/user-attachments/assets/430ed437-e205-412a-9929-79c2e668a867" />


## Despliegue de WordPress + MariaDB mediante Docker Compose

En este caso creamos un fichero aparte llamado `docker-compose.wp+mariadb.yml` en lugar de sobreescribir el anterior, para tener ambos a la vez. El fichero define los servicios `servidor_mysql` y `servidor_wp` con sus volúmenes, variables de entorno y la red `red_wp` de tipo bridge:
~~~
sudo nano docker-compose.wp+mariadb.yml
~~~
<img width="1216" height="765" alt="7" src="https://github.com/user-attachments/assets/a9f30f72-d11e-49f1-9cf8-a5dd797db7ec" />
<img width="1212" height="767" alt="8" src="https://github.com/user-attachments/assets/2dd9f4b5-8746-42d3-b228-0819f71c1e0d" />


Lo levantamos especificando el fichero con el flag `-f`:
~~~
sudo docker compose -f docker-compose.wp+mariadb.yml up -d
~~~
<img width="1214" height="398" alt="9" src="https://github.com/user-attachments/assets/74969155-b1b9-4c3c-ac77-4e2ee6258384" />

Comprobamos con `docker ps` que ambos contenedores están corriendo y accedemos a `127.0.0.1` para verificar que el instalador de WordPress está disponible:
<img width="1215" height="771" alt="10" src="https://github.com/user-attachments/assets/e83e3510-d152-4a87-a3d7-a2f4042fce9b" />
