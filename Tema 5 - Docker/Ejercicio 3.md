# Actividad 3 - Pull, rename y borrado de contenedores

## Descarga la imagen de Ubuntu

Descargamos la imagen de Ubuntu desde Docker Hub con:
~~~
sudo docker pull ubuntu
~~~
<img width="1215" height="205" alt="1" src="https://github.com/user-attachments/assets/ea32938a-df6f-4b50-aef1-18a20c807cd7" />


## Descarga la imagen de hello-world

~~~
sudo docker pull hello-world
~~~
<img width="1218" height="208" alt="2" src="https://github.com/user-attachments/assets/0764b990-41a9-421f-8bdf-44d3f7f7b22f" />


## Descarga la imagen de nginx

~~~
sudo docker pull nginx
~~~
<img width="1215" height="379" alt="3" src="https://github.com/user-attachments/assets/8b28ca5e-b2a9-432d-9e6b-d5642b5b642d" />


## Muestra un listado de todas las imágenes

Con `docker images` vemos todas las imágenes descargadas localmente junto con su tamaño en disco:
~~~
sudo docker images
~~~
<img width="1220" height="245" alt="4" src="https://github.com/user-attachments/assets/45e09fd2-921b-47ea-bf8c-dff871d61ace" />


## Ejecuta un contenedor hello-world con el nombre "myhello1"

~~~
sudo docker run --name myhello1 hello-world
~~~
<img width="1217" height="588" alt="5" src="https://github.com/user-attachments/assets/175b1044-392b-46f6-bceb-a0c1301cf0db" />


## Ejecuta un contenedor hello-world con el nombre "myhello2"

~~~
sudo docker run --name myhello2 hello-world
~~~
<img width="1216" height="583" alt="6" src="https://github.com/user-attachments/assets/eb8980e3-d8f6-493c-9abe-f4fd172d2046" />


## Ejecuta un contenedor hello-world con el nombre "myhello3"

~~~
sudo docker run --name myhello3 hello-world
~~~
<img width="1212" height="586" alt="7" src="https://github.com/user-attachments/assets/b608fcc6-1e1c-4223-b252-746f724c32f6" />


## Muestra los contenedores que se están ejecutando

~~~
sudo docker ps -a
~~~
<img width="1216" height="405" alt="8" src="https://github.com/user-attachments/assets/85807a47-1cbf-474a-b0ff-1ee4ac6bf167" />


Técnicamente no están en ejecución porque el contenedor `hello-world` termina solo en cuanto muestra su mensaje. Con `-a` los vemos igualmente aunque estén parados.

## Para los contenedores "myhello1" y "myhello2"

Aunque ya están detenidos, podemos usar `docker stop` igualmente. Aplica cuando tenemos contenedores que sí siguen en ejecución:
~~~
sudo docker stop myhello1
sudo docker stop myhello2
~~~
<img width="1216" height="163" alt="9" src="https://github.com/user-attachments/assets/d63d61a5-7117-44a8-99e7-c32d96a9c587" />


## Borra el contenedor "myhello1"

~~~
sudo docker rm myhello1
~~~
<img width="1214" height="119" alt="10" src="https://github.com/user-attachments/assets/6e36cc7b-1be6-401c-8d3a-a20563a84ed4" />


## Muestra los contenedores que se están ejecutando

Comprobamos que `myhello1` ya no aparece, pero el resto de contenedores siguen ahí:
~~~
sudo docker ps -a
~~~
<img width="1213" height="365" alt="11" src="https://github.com/user-attachments/assets/225c3094-50fb-4f2d-834d-f96145a4c6a1" />


## Borra todos los contenedores

Para borrar todos los contenedores de golpe, combinamos `docker ps -aq` (que devuelve solo los IDs) con `docker rm -f`:
~~~
sudo docker rm -f $(sudo docker ps -aq)
~~~
<img width="1215" height="249" alt="12" src="https://github.com/user-attachments/assets/2dcf3f1c-64cf-4739-b0db-f799c4656448" />


Verificamos con `docker ps -a` que la lista queda vacía.
