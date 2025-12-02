# Práctica Primer Trimestre - Servidores Web

## Antes de comenzar
Primero de todo hay que tener una máquina limpia Ubuntu 25.10 y luego procedemos a actualizar los paquetes con:
~~~
sudo apt update && sudo apt upgrade -y
~~~
<br/> <img width="651" height="486" alt="1" src="https://github.com/user-attachments/assets/f60d6b81-a04c-4908-9e42-7aa34a08b617" /> <br/>

## 1. Dominios mediante el archivo hosts
Para realizar lo indicado en el enunciado, necesitamos dos dominios iniciales (centro.intranet y departamentos.centro.intranet) y un tercero para el final de la práctica que requiere nginx (servidor2.centro.intranet). Para esto nos vamos al archico hosts y lo editamos con:
~~~
sudo nano /etc/hosts
~~~
<br/> <img width="654" height="486" alt="2" src="https://github.com/user-attachments/assets/55514ff9-a641-46bc-89ca-1bcb16cc82ed" /> <br/>
Ahora vamos a comprobar que los dominios están haciendo un ping a cada uno de ellos:
<br/> <img width="649" height="228" alt="3" src="https://github.com/user-attachments/assets/9b80b502-d19e-4624-af99-928de48f450f" /> <br/>
<br/> <img width="654" height="236" alt="4" src="https://github.com/user-attachments/assets/c71b859e-df5c-4bf6-811b-d5428cac739f" /> <br/>
<br/> <img width="650" height="234" alt="5" src="https://github.com/user-attachments/assets/1012a686-ac7a-426e-9bd0-41b3b261c3cd" /> <br/>

## 2. Instalación de la pila LAMP
Vamos a instalar Apache, MySQL y PHP todo a la misma vez mediante el repositorio apt, usando:
~~~
sudo apt install apache2 mysql-server php libapache2-mod-php php-mysql php-gd php-xml php-mbstring -y
~~~
Esto instalará todo junto con sus dependencias.
<br/> <img width="1216" height="513" alt="6" src="https://github.com/user-attachments/assets/96fe8e4a-31de-42e8-91fb-997db6b74692" /> <br/>
Una vez haya terminado de instalar, activamos el servicio de apache con:
~~~
sudo systemctl enable apache2
sudo systemctl start apache2
~~~
Y luego comprobamos su estado con:
~~~
sudo systemctl status apache2
~~~
<br/> <img width="646" height="480" alt="7" src="https://github.com/user-attachments/assets/30721311-ba57-44ac-a708-369ee35b2016" /> <br/>

## 3. Instalación y Configuración de WordPress
El dominio centro.intranet será el que servirá el wordpress. Lo primero que vamos a hacer es crear la base de datos, sin ella el wordpress no funciona. Como ya tenemos MySQL instalado, vamos a usando sentencias SQL para crear la base de datos, el usuario y su contraseña y también darle privilegios para poder conectarnos:
<br/> <img width="660" height="323" alt="8" src="https://github.com/user-attachments/assets/ad7e950b-abf4-4a0f-956b-f5deeb832cb2" /> <br/>
Dentro de sql, creamos la base de datos de wordpress con los siguientes parámetros, la cual es la base de datos mínima que necesita:
~~~
CREATE DATABASE wordpressdb;
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'user';
GRANT ALL PRIVILEGES ON wordpressdb.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
~~~
<br/> <img width="643" height="162" alt="9" src="https://github.com/user-attachments/assets/6dc0d54e-5d8e-4a6a-91a3-ab54a3c6deb6" /> <br/>
<br/> <img width="649" height="45" alt="10" src="https://github.com/user-attachments/assets/4adfec7a-437f-4d5f-9d43-ef85cf2f6051" /> <br/>
Después de crear la base de datos, vamos a descargarnos Wordpress con:

~~~
wget https://wordpress.org/latest.tar.gz
~~~

<br/> <img width="652" height="298" alt="11" src="https://github.com/user-attachments/assets/1654ab07-4110-4287-963e-d02e7e2124aa" /> <br/>
Ahora tenemos que descomprimirlo, moverlo y cambiarle los permisos:
<br/> <img width="650" height="179" alt="12" src="https://github.com/user-attachments/assets/5403d730-e055-4edd-b85f-fa6f0018b795" /> <br/>
<br/> <img width="658" height="132" alt="13" src="https://github.com/user-attachments/assets/2c59e12e-846b-4bdb-b69c-0b633535451d" /> <br/>
Ahora tenemos que configurar el VirtualHost, para ello tenemos que crear el archivo de configuración para el sitio:
~~~
sudo nano /etc/apache2/sites-available/centro.conf
~~~
<br/> <img width="653" height="254" alt="14" src="https://github.com/user-attachments/assets/4b5f508f-b387-4adf-999f-e84875932b54" /> <br/>
Habilitamos el sitio con el modulo a2ensite:
<br/> <img width="652" height="160" alt="15" src="https://github.com/user-attachments/assets/2922f0ad-1efa-4a22-af71-fe336204014d" /> <br/>
Para ver que Wordpress está activo, tenemos que ir al navegador y poner "centro.intranet". Si está bien configurado, nos debería de llevar a la página de configuración inicial de Wordpress:
<br/> <img width="1213" height="767" alt="16" src="https://github.com/user-attachments/assets/61f20d04-d6a2-4982-8540-d4c75826ec52" /> <br/>
<br/> <img width="744" height="586" alt="17" src="https://github.com/user-attachments/assets/dc325bef-2e91-48e8-adcc-4aa78be566a4" /> <br/>
<br/> <img width="747" height="630" alt="18" src="https://github.com/user-attachments/assets/590ea696-ec9a-43d0-ae7d-fe43cbb7daac" /> <br/>
<br/> <img width="736" height="312" alt="19" src="https://github.com/user-attachments/assets/cc5e23e3-e02f-4584-a980-58915f914107" /> <br/>
Y ya lo tendriamos instalado.
<br/> <img width="1212" height="724" alt="20" src="https://github.com/user-attachments/assets/af50085b-b9f1-47be-acb2-dd69cb4b3d16" /> <br/>

## 4. Aplicación Python con WSGI
El dominio que se va a encargar de la aplicación de python será departamentos.centro.intranet. Primero instalamos el módulo WSGI:
~~~
sudo apt install libapache2-mod-wsgi-py3
~~~
<br/> <img width="650" height="227" alt="21" src="https://github.com/user-attachments/assets/5bf4f612-35bf-4f54-9f8e-f61de124e885" /> <br/>
Una vez instalado, creamos la carpeta donde estará el script y el propio script:
<br/> <img width="650" height="94" alt="22" src="https://github.com/user-attachments/assets/ef953bc1-8146-44de-97b2-b98edec5542e" /> <br/>
<br/> <img width="655" height="480" alt="23" src="https://github.com/user-attachments/assets/dfcbd081-98e5-45f1-a2f1-9d32899f416e" /> <br/>
Ahora tenemos que configurar el VirtualHost para Python:
~~~
sudo nano /etc/apache2/sites-available/departamentos.conf
~~~
<br/> <img width="650" height="482" alt="24" src="https://github.com/user-attachments/assets/a4765c3a-c968-45f7-99fb-4b9e4bc285e2" /> <br/>
Y por último habilitamos el sitio:
<br/> <img width="655" height="167" alt="25" src="https://github.com/user-attachments/assets/d8c5cdf4-52c3-4251-b6fc-035d92bc26b8" /> <br/>
Ahora comprobamos que va:
<br/> <img width="1196" height="357" alt="26" src="https://github.com/user-attachments/assets/02200d1b-321c-4980-82d4-86778dce8736" />

## 5. Proteger Python con Autenticación
Primero tenemos que crear el usuario y el archivo de contraseña con:
~~~
sudo htpasswd -c /etc/apache2/.htpasswd UsuJesus
~~~
<br/> <img width="647" height="146" alt="27" src="https://github.com/user-attachments/assets/f87b0629-baf4-44bd-bfac-3e9a92367755" /> <br/>
También tenemos que modificar el VirtualHost con la autenticación:
<br/> <img width="658" height="482" alt="28" src="https://github.com/user-attachments/assets/4a607b4f-932c-4970-9cb7-60d1a25167bc" /> <br/>
Una vez hecho, comprobamos que nos lo pide al entrar:
<br/> <img width="1214" height="413" alt="29" src="https://github.com/user-attachments/assets/c2f2344b-2d6e-4100-92f0-4234dc1c78d5" /> <br/>

## 6. Instalar y Configurar AWStats
Instalamos el repositorio con apt:
~~~
sudo apt install awstats -y
~~~
<br/> <img width="651" height="223" alt="30" src="https://github.com/user-attachments/assets/5072b158-9db6-4c59-a5f2-19238415a8ec" /> <br/>
Vamos a configurarla para centro.intranet, copiando la configuración base:
<br/> <img width="1220" height="110" alt="31" src="https://github.com/user-attachments/assets/2cc5b803-8b48-45d8-8c43-3ba5670f4be7" /> <br/>
Y modificamos para que quede acorde:
<br/> <img width="368" height="49" alt="32" src="https://github.com/user-attachments/assets/d88be712-407f-4d13-a36d-af71564f4e07" /> <img width="236" height="46" alt="33" src="https://github.com/user-attachments/assets/ff0173ac-ad8f-47c0-b770-421821ccd650" /> <br/>
Ahora habilitamos CGI que es necesario para ver las gráficas:
<br/> <img width="658" height="206" alt="34" src="https://github.com/user-attachments/assets/b2bc315c-8ba7-4b62-87a7-4c33d877ef3d" /> <br/>
Por último generamos las estadísticas iniciales:
~~~
sudo /usr/lib/cgi-bin/awstats.pl -config=centro.intranet -update
~~~
<br/> <img width="1223" height="329" alt="35" src="https://github.com/user-attachments/assets/f4e80c56-cbe7-4edb-bcaf-ced6e2fe9f16" /> <br/>
Para comprobarlo, entramos en el navegador y ponemos lo siguiente:
<br/> <img width="1212" height="771" alt="36" src="https://github.com/user-attachments/assets/bab786e9-bda9-4955-90cb-410273ea4ff3" /> <br/>

## 7. NGINX y PHPMyAdmin
Ya que apache usa el puerto 80, nosotros vamos a configurar nginx y phpmyadmin en el puerto 8080. Además como apache ya usa php como módulo, nginx necesita php-fpm. Procedemos a instalar ambos:
~~~
sudo apt install nginx php-fpm -y
~~~
<br/> <img width="646" height="231" alt="37" src="https://github.com/user-attachments/assets/302dba9f-8622-43dd-a8a9-391c7a753093" /> <br/>
Editamos la configuración por defecto:
<br/> <img width="647" height="80" alt="38" src="https://github.com/user-attachments/assets/50fd7d0d-4829-4c4f-afff-83aa0b998e85" /> <br/>
<br/> <img width="359" height="92" alt="39" src="https://github.com/user-attachments/assets/aad44fab-e65f-4769-aadf-603b7f13320f" /> <br/>
<br/> <img width="536" height="60" alt="40" src="https://github.com/user-attachments/assets/274089e3-3576-4426-8fac-91b5ded78a04" /> <br/>
<br/> <img width="440" height="164" alt="41" src="https://github.com/user-attachments/assets/6faefa8a-4108-410e-989d-828252e59173" /> <br/>
Reiniciamos nginx y comprobamos su estado:
<br/> <img width="1215" height="544" alt="42" src="https://github.com/user-attachments/assets/f04e01e8-1fdb-4e93-826f-e953634453c7" /> <br/>
Ahora instamos PHPMyAdmin con:
~~~
sudo apt install phpmyadmin -y
~~~
<br/> <img width="649" height="101" alt="43" src="https://github.com/user-attachments/assets/51e794c6-2e1e-43c7-abaf-4e35d92bbf8b" /> <br/>
Y vamos a entrar directamente en la configuración de PHPMyAdmin:
<br/> <img width="640" height="480" alt="44" src="https://github.com/user-attachments/assets/489de771-45f4-4f92-aadf-12b2a866fe3d" /> <br/>
<br/> <img width="640" height="487" alt="45" src="https://github.com/user-attachments/assets/0c050324-1fdc-4f77-b4a0-cc33df2b27dd" /> <br/>
<br/> <img width="646" height="484" alt="46" src="https://github.com/user-attachments/assets/3b89dcad-e2db-44af-abad-030f149f7d65" /> <br/>
Una vez instalado, vamos a vincular a nginx mediante un enlace simbólico.
<br/> <img width="1218" height="105" alt="47" src="https://github.com/user-attachments/assets/8ea108e5-f4e7-4f3b-8fef-94bc0a718b88" /> <br/>
Para evitar el error 502 Bad Gateway al ponerlo por el puerto 8080, tenemos que hacer que apache escuche por el puerto 8080, para ello hacemos lo siguiente:
<br/> <img width="1213" height="89" alt="48" src="https://github.com/user-attachments/assets/23006747-7f92-4dcf-95f6-70af79793d7a" /> <br/>
<br/> <img width="1220" height="772" alt="49" src="https://github.com/user-attachments/assets/ba0fe358-c5f9-4551-bcb9-198aeb5112f0" /> <br/>
<br/> <img width="1223" height="96" alt="50" src="https://github.com/user-attachments/assets/023089e5-2472-4a9b-9cb6-967852cea041" /> <br/>
<br/> <img width="1226" height="607" alt="51" src="https://github.com/user-attachments/assets/f668c131-61ac-423b-8950-6514ce80bbe4" /> <br/>
Reiniciamos el servicio de apache y comprobamos que podemos entrar mediante http://servidor2.centro.intranet:8080/phpmyadmin :
<br/> <img width="1219" height="774" alt="52" src="https://github.com/user-attachments/assets/5d3b5cad-a91d-4339-a28c-a4378db79957" /> <br/>
<br/> <img width="1215" height="769" alt="53" src="https://github.com/user-attachments/assets/73146691-ebfa-47c8-8c82-0077c93e9d80" /> <br/>
