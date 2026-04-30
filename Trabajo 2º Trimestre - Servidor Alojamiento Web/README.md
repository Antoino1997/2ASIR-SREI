# Práctica Segundo Trimestre - Servidor Alojamiento Web

## 1. Antes de comenzar
Primero de todo hay que tener una máquina limpia (preferentemente) Ubuntu Server y luego procederemos a actualizar los repositorios de paquetes y actualizar el sistema con:
~~~
sudo apt update && sudo apt upgrade -y
~~~
Para poder hacer las capturas de algunos comandos, omitiré el -y que se usa para autoconfirmar en caso de pregunta.

### Instalación de la máquina
<br/> <img width="717" height="537" alt="1" src="https://github.com/user-attachments/assets/97463faf-b3d9-4725-8cf1-549340c4b0fb" /> <br/>
<br/> <img width="827" height="390" alt="2" src="https://github.com/user-attachments/assets/2de7a1be-2587-4f34-bdf9-0a9244996ade" /> <br/>
Ahora bien, durante la instalación del sistema operativo, nos vamos a parar el dos puntos claves.
<br/> <br/> <img width="1277" height="297" alt="3" src="https://github.com/user-attachments/assets/68b62f86-d41c-43cd-b1f1-119602a61256" /> <br/>
El primero es la configuración de red, vamos a poner una IP estática configurando la IPv4:
<br/> <br/> <img width="1279" height="859" alt="4" src="https://github.com/user-attachments/assets/f1a4e142-a072-4a6a-aa02-6c19f59ebd59" /> <br/>
- La subnet es la subred de nuestro nodo en proxmox, cogiendo solo los tres primeros octetos.
- La Address va a ser nuestra IP, yo he elegido la 192.168.193.124.
- Y el gateway (puerta de enlace) es la IP del router, para tener salida a internet.
<br/> <br/> <img width="1277" height="266" alt="5" src="https://github.com/user-attachments/assets/50e4e2dd-46cc-43f6-b640-693536fed363" /> <br/>
Ahora configuramos el perfil del administrador del sistema:
<br/> <br/> <img width="1281" height="859" alt="6" src="https://github.com/user-attachments/assets/05fbedf6-b513-40d8-98b4-f179d7488303" /> <br/>
Y para terminar la instalación dejamos activo el servidor SSH:
<br/> <br/> <img width="1277" height="862" alt="7" src="https://github.com/user-attachments/assets/95920f35-5634-4e33-9d95-1ee2f87862f3" />

### Actualización repositorios y actualización del sistema
<br/> <img width="1278" height="860" alt="8" src="https://github.com/user-attachments/assets/4c06040d-0583-4515-8483-e7b07a1cca35" />

## 2. Instalación de la base del servidor
En este paso vamos a instalar los paquetes necesarios para todo lo que se nos pide en la práctica. Ésta es la lista de los paquetes que vamos a instalar, agrupados por su función, y la explicación de por qué:
## Servidor Web y PHP
- apache2 : Es el servidor web por excelencia, lo hemos usado ya mucho a lo largo del curso. 
- php y libapache2-mod-php: necesitamos alojar páginas dinámicas con PHP, necesitamos instalar el lenguaje PHP y el módulo que permite a Apache entender e interpretar el código PHP antes de enviarlo al cliente.
- php-mysql: Permite que las páginas web hechas en PHP (y también el programa phpMyAdmin) puedan hablar y extraer datos de tu base de datos MariaDB/MySQL.

## Base de Datos
- mariadb-server: Es el motor de base de datos relacional, compatible con MySQL.

- phpmyadmin: Es una aplicación web (escrita en PHP) con una interfaz gráfica para administrar tus bases de datos MariaDB/MySQL desde el navegador, la hemos usado en IAW.

## Servidor FTP
- vsftpd: Very Secure FTP Daemon. Es el programa que permitirá a tus clientes subir y descargar los archivos de sus páginas web a sus carpetas personales. 

## Servidor DNS
- bind9 (junto con a sus dependencias): Es el software de servidor DNS que hemos usado anteriormente. Lo vamos a necesitar para crear subdominios y configurar la resolución directa e inversa. Bind9 se encargará de traducir nombres como cliente1.midominio.local a nuestra IP 192.168.193.110.

## Soporte para Python en la Web
- python3 y libapache2-mod-wsgi-py3: WSGI (Web Server Gateway Interface) es el estándar que usa Apache para comunicar peticiones web directamente a scripts de Python de forma eficiente y segura.

Lo vamos a instalar todo en un solo comando:
~~~
sudo apt install apache2 php libapache2-mod-php php-mysql mariadb-server phpmyadmin vsftpd bind9 bind9utils dnsutils python3 libapache2-mod-wsgi-py3 -y
~~~~
<br/> <img width="1278" height="862" alt="9" src="https://github.com/user-attachments/assets/3c7778a9-7873-486e-a950-d35728aec31d" /> <br/>
Durante la instalación tendremos que onfigurar phpmyadmin, primero seleccionamos apache2:
<br/> <br/> <img width="1279" height="864" alt="10" src="https://github.com/user-attachments/assets/0ef55ad4-e109-46c2-8b38-0fd9fc060032" /> <br/>
Y luego configuramos la base de datos de phpmyadmin:
<br/> <br/> <img width="1282" height="867" alt="11" src="https://github.com/user-attachments/assets/9d6fdc4d-cefe-40e9-a5a9-4992a2142dc4" /> <br/>
Por último introducimos una contraseña:
<br/> <br/> <img width="1278" height="863" alt="12" src="https://github.com/user-attachments/assets/cb6ddd94-9f7b-4424-92ab-1e321328beee" /> <br/>
Ahora procedemos a comprobar los diferentes servicios y sus estados, uno por uno:
- Apache2:
<br/> <br/> <img width="1279" height="440" alt="13" src="https://github.com/user-attachments/assets/2000a9d0-df8a-4e72-87bd-85ded5363fe9" /> <br/>
- Base de datos (MariaDB):
<br/> <br/> <img width="1279" height="485" alt="14" src="https://github.com/user-attachments/assets/a9223a15-0e60-4575-ab01-9e0730d56955" /> <br/>
- Servidor FTP (vsftdp):
<br/> <br/> <img width="1279" height="317" alt="15" src="https://github.com/user-attachments/assets/6c9d2b63-2353-4fd8-80a6-d51790368dd6" /> <br/>
- Servidor DNS (Bind9):
<br/> <br/> <img width="1280" height="457" alt="16" src="https://github.com/user-attachments/assets/b12dc2df-50ee-47b4-adc1-e9481f0adb74" />

## 3. Configuraciones
Como más adelante tenemos que hacer un script de automatización, lo suyo es que los servicios estén totalmente configurados. Se puede dividir en 3 pasos.

## 3.1 Asegurar el FTP con certificados TLS.
Vamos a hacer que el acceso FTP configure correctamente TLS, convirtiendo el FTP normal que es inseguro, en FTPS que cifra las contraseñas y los archivos. Para esto vamos a crear un certificado autofirmado válido por un año con este comado:
~~~
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj "/C=ES/ST=Andalusia/L=Huelva/O=Hosting/CN=192.168.193.124"
~~~
<br/> <img width="1280" height="346" alt="17" src="https://github.com/user-attachments/assets/15ee516a-8c3c-43d5-b8f6-7a8eb4c792e0" /> <br/>
Ahora vamos a configurar vsftpd para que use el certificado. Para ello nos vamos al archivo de configuración que se encuentra en:
~~~
/etc/vsftpd.conf
~~~
Descomentamos el write_enable para permitir que los usuarios puedan subir sus archivos mediante FTP:
<br/> <br/> <img width="1279" height="864" alt="18" src="https://github.com/user-attachments/assets/68971e0d-32f6-4b23-9a63-15299b4a327e" /> <br/>
Y también borramos al final del todo las líneas relacionadas con el certificado RSA para añadirles las que apuntan a nuestro certificado TLS:
<br/> <br/> <img width="1287" height="867" alt="19" src="https://github.com/user-attachments/assets/9bd77eac-63e6-4f51-9564-6583fc1bba5c" /> <br/>
