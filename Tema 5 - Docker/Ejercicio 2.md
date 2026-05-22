# Actividad 2 - Docker

## Imagen Hello World

Ejecutamos el contenedor `hello-world` con:
~~~
sudo docker run hello-world
~~~
<img width="1203" height="761" alt="1" src="https://github.com/user-attachments/assets/b82d2912-a54f-490b-92b3-dce69b85664b" />


Como el contenedor termina su ejecución, su proceso se detiene. Podemos verlo con `docker ps -a`, que muestra también los contenedores parados:
~~~
sudo docker ps -a
~~~
<img width="1216" height="137" alt="2" src="https://github.com/user-attachments/assets/e8c7c47d-b00b-4b60-a313-23ebb009f020" />


Eliminamos el contenedor con su nombre:
~~~
sudo docker rm determined_merkle
~~~
<img width="1215" height="180" alt="3" src="https://github.com/user-attachments/assets/e4d4cab2-314b-432b-8d49-bb89498e0347" />


Y comprobamos con `docker images` las imágenes que tenemos descargadas localmente:
~~~
sudo docker images
~~~
<img width="1221" height="172" alt="4" src="https://github.com/user-attachments/assets/23683412-864c-4001-b162-2af08b13cd20" />


## Ejecutando un contenedor interactivo

Usamos `-it` para lanzar un contenedor Ubuntu con una terminal interactiva y `--name` para asignarle un nombre:
~~~
sudo docker run -it --name prueba-ubuntu ubuntu bash
~~~
<img width="1216" height="256" alt="5" src="https://github.com/user-attachments/assets/179f7214-348b-479e-b602-d4a32bc3216a" />


Si salimos del contenedor, este se detiene. Podemos volver a arrancarlo y reconectarnos con:
~~~
sudo docker start prueba-ubuntu
sudo docker attach prueba-ubuntu
~~~
<img width="1219" height="145" alt="6" src="https://github.com/user-attachments/assets/49ee6230-71b2-4d5b-9b69-29c5193b6a5c" />


Con `exec` podemos ejecutar comandos dentro del contenedor sin necesidad de entrar en él. Por ejemplo, `ping` no está disponible en la imagen mínima de Ubuntu, pero `ls -l` sí funciona:
~~~
sudo docker exec prueba-ubuntu ping 8.8.8.8
sudo docker exec prueba-ubuntu ls -l
~~~
<img width="1217" height="652" alt="7" src="https://github.com/user-attachments/assets/3cd57f4a-3588-44f0-a26b-a542d6769b3a" />


Con `inspect` obtenemos información detallada del contenedor en formato JSON: su estado, imagen, rutas internas, red, etc.:
~~~
sudo docker inspect prueba-ubuntu
~~~
<img width="1219" height="768" alt="8" src="https://github.com/user-attachments/assets/a87d1d48-8e0c-435a-815f-c3b3471c36bc" />


## Creando un contenedor demonio

La opción `-d` hace que el contenedor se ejecute en segundo plano (modo *daemon*). Con `bash -c` podemos encadenar comandos más complejos. En este ejemplo creamos un contenedor que imprime "hello world" cada segundo de forma indefinida:
~~~
sudo docker run -d --name prueba-ubuntu-2 ubuntu bash -c "while true; do echo hello world; sleep 1; done"
~~~
<img width="1220" height="211" alt="9" src="https://github.com/user-attachments/assets/dad579c8-f570-441d-87a5-8caeaf04cfb1" />


Verificamos que está corriendo con `docker ps` y consultamos su salida con `docker logs`:
~~~
sudo docker ps
sudo docker logs prueba-ubuntu-2
~~~
<img width="1216" height="766" alt="10" src="https://github.com/user-attachments/assets/75d2b19c-779a-4630-b95e-ba3818473cba" />


Por último, lo eliminamos forzosamente (aunque esté en ejecución) con `-f`:
~~~
sudo docker rm -f prueba-ubuntu-2
~~~
<img width="1217" height="184" alt="11" src="https://github.com/user-attachments/assets/b3e0cc63-b693-4680-8eb0-de3eae3a22ba" />


## Creando un contenedor con un servidor web

Usamos la imagen oficial de Apache (`httpd:2.4`) de Docker Hub, mapeando el puerto 8080 del host al 80 del contenedor con `-p`:
~~~
sudo docker run -d --name prueba-apache -p 8080:80 httpd:2.4
~~~
<img width="1217" height="390" alt="12" src="https://github.com/user-attachments/assets/2e998982-d988-4b77-9643-621256e0e96e" />


Comprobamos que el servidor responde accediendo a la IP del bridge de Docker:
~~~
sudo curl 172.17.0.1:8080
~~~
<img width="1217" height="294" alt="13" src="https://github.com/user-attachments/assets/88ff793f-95dc-4413-8c75-9f9b618951f2" />


Para personalizar el contenido, entramos al contenedor con `exec -it` y sobreescribimos el `index.html`:
~~~
sudo docker exec -it prueba-apache bash
cd htdocs/
echo "<h1>Curso Docker</h1>" > index.html
exit
~~~

Volvemos a hacer curl y vemos el cambio reflejado:
~~~
sudo curl 172.17.0.1:8080
~~~
<img width="1217" height="239" alt="14" src="https://github.com/user-attachments/assets/39bbe7e0-e461-4298-a63c-8709d3a5030d" />


## Configuración de contenedores con variables de entorno

Podemos pasar variables de entorno a los contenedores con el flag `-e`. Lo probamos con MariaDB, que requiere definir la contraseña de root obligatoriamente:
~~~
sudo docker run -d --name prueba-mariadb -e MARIADB_ROOT_PASSWORD=my-secret-pw mariadb
~~~
<img width="1216" height="653" alt="15" src="https://github.com/user-attachments/assets/6809f686-eeaf-4738-b794-11df899204ff" />


Verificamos que la variable se ha establecido correctamente dentro del contenedor con `exec env`:
~~~
sudo docker exec -it prueba-mariadb env
~~~
<img width="1214" height="277" alt="16" src="https://github.com/user-attachments/assets/d543127e-065a-431c-8fc6-bc64a71be165" />


Podemos ver `MARIADB_ROOT_PASSWORD=my-secret-pw` en la salida, confirmando que la variable de entorno se pasó correctamente al contenedor.
