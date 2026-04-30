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
Una vez guardados los cambios, reiniciamos el servicio y comprobamos el certificado con:
~~~
openssl s_client -connect 127.0.0.1:21 -starttls ftp | head -20
~~~
<br/> <img width="1280" height="323" alt="20" src="https://github.com/user-attachments/assets/8f4b947b-d9a4-4358-ae05-4434222045ea" /> <br/>

## 3.2 Preparar las Zonas del DNS (Bind9).
Tenemos que crear un dominio principal para que nuestro script cree los subdominios. Vamos a llamarlo midominio.local y a configurar los archivos de bind9.
<br/> <br/> <img width="1280" height="323" alt="21" src="https://github.com/user-attachments/assets/86c9e552-aaa2-415f-acdf-3e7a27ab6e6d" /> <br/>
Ahora creamos el archivo de la zona directa:
<br/> <br/> <img width="1280" height="321" alt="22" src="https://github.com/user-attachments/assets/09bdc4a9-23f8-4955-a964-3eae08cce608" /> <br/>
Comprobamos:
<br/> <br/> <img width="1277" height="139" alt="23" src="https://github.com/user-attachments/assets/8d9ece9b-5966-416d-a025-8298dafb7c1a" /> <br/>
Y creamos el archivo de la zona inversa:
<br/> <br/> <img width="1282" height="255" alt="24" src="https://github.com/user-attachments/assets/fd728456-002e-4b1e-9bb8-bb600e6ec130" /> <br/>
Comprobamos:
<br/> <br/> <img width="1277" height="159" alt="25" src="https://github.com/user-attachments/assets/d0fb849e-6430-407a-bc2a-cf78b921cbf7" /> <br/>
Reiniciamos Bind9 para que cargue el nuevo dominio:
<br/> <br/> <img width="1277" height="489" alt="26" src="https://github.com/user-attachments/assets/21c2828f-754a-467f-bd58-04a84d86327b" /> <br/>
Y se comprueba con dig:
<br/> <br/> <img width="1277" height="142" alt="27" src="https://github.com/user-attachments/assets/596477f8-ce5a-42dd-895a-44d3e4a578dc" /> <br/>

## 3.3 Habilitar Python en Apache.
Activamos el paquete libapache2-mod-wsgi-py3:
<br/> <br/> <img width="1280" height="136" alt="28" src="https://github.com/user-attachments/assets/5c135190-381d-4248-8de6-3eb0b6bc3d80" /> <br/>
Y comprobamos:
<br/> <br/> <img width="1283" height="249" alt="29" src="https://github.com/user-attachments/assets/d5dd31ac-92e2-4118-a436-3b3406c808ce" /> <br/>

## 4. El Script de Automatización.
Creamos un archivo para el script (nuevo_cliente.sh) y este sería el script:
~~~
#!/bin/bash

# Script de automatización de alojamiento
################################################################################

# Validación inicial
if [ "$#" -ne 2 ]; then
    echo "Introduzca los parámetros cliente y contraseña, por ese orden."
    echo "Ejemplo: sudo ./crear_cliente.sh cliente1 password123"
    exit 1
fi

USUARIO=$1
PASS=$2
DOMINIO="${USUARIO}.midominio.local"
IP_SERVIDOR="192.168.193.110"
OCTETO_FINAL="110" 

echo "*** Iniciando despliegue para el usuario: $USUARIO ***"

# Creación del usuario del sistema (Acceso FTP, SSH y SFTP) y Directorio Web
#################################################################################


echo "[1/5] Creando usuario del sistema y directorio web..."
# -m crea el home, -s /bin/bash permite acceso por SSH/SFTP
useradd -m -s /bin/bash $USUARIO
echo "$USUARIO:$PASS" | chpasswd

DIR_WEB="/home/$USUARIO/public_html"
mkdir -p $DIR_WEB

# Página web dinámica por defecto (PHP)
cat <<EOF > $DIR_WEB/index.php
<!DOCTYPE html>
<html>
<head><title>Bienvenido $USUARIO</title></head>
<body>
    <h1>Hosting configurado correctamente para $DOMINIO</h1>
    <?php echo "<p>Soporte PHP activado. ¡Hola mundo!</p>"; ?>
</body>
</html>
EOF

# Permisos para que Apache pueda leer, pero el dueño sea el usuario
chown -R $USUARIO:www-data /home/$USUARIO
chmod -R 755 /home/$USUARIO

# Base de datos MySQL / MariaDB (ALL PRIVILEGES)
################################################################################

echo "[2/5] Creando base de datos y usuario SQL..."
DB_NAME="${USUARIO}_db"
mysql -u root -e "CREATE DATABASE ${DB_NAME};"
mysql -u root -e "CREATE USER '${USUARIO}'@'localhost' IDENTIFIED BY '${PASS}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${USUARIO}'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"

# Virtual Host en Apache (Web normal y Python)
################################################################################

echo "[3/5] Configurando Virtual Host en Apache..."
VHOST_FILE="/etc/apache2/sites-available/${DOMINIO}.conf"

cat <<EOF > $VHOST_FILE
<VirtualHost *:80>
    ServerName $DOMINIO
    DocumentRoot $DIR_WEB

    <Directory $DIR_WEB>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    # Configuración para ejecutar Python (WSGI)
    WSGIScriptAlias /python $DIR_WEB/app.wsgi
    <Directory $DIR_WEB>
        <Files app.wsgi>
            Require all granted
        </Files>
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/${USUARIO}_error.log
    CustomLog \${APACHE_LOG_DIR}/${USUARIO}_access.log combined
</VirtualHost>
EOF

# App Python de prueba
cat <<EOF > $DIR_WEB/app.wsgi
def application(environ, start_response):
    status = '200 OK'
    output = b'Hola! La aplicacion Python funciona en tu hosting. \n'
    response_headers = [('Content-type', 'text/plain'),
                        ('Content-Length', str(len(output)))]
    start_response(status, response_headers)
    return [output]
EOF
chown $USUARIO:www-data $DIR_WEB/app.wsgi

# Activamos el sitio en Apache
a2ensite ${DOMINIO}.conf
systemctl reload apache2

# DNS (Subdominio y Resolución Inversa)
################################################################################

echo "[4/5] Configurando registros DNS en Bind9..."
ZONA_DIRECTA="/etc/bind/db.midominio.local"
ZONA_INVERSA="/etc/bind/db.193"

# Añadir a zona directa
echo "${USUARIO}    IN    A    ${IP_SERVIDOR}" >> $ZONA_DIRECTA
# Añadir a zona inversa
echo "${OCTETO_FINAL}      IN    PTR  ${DOMINIO}." >> $ZONA_INVERSA

systemctl restart bind9

# TODO LISTO

echo "[5/5] ¡Proceso completado con éxito!"
echo "-----------------------------------------------------"
echo "Resumen de acceso:"
echo "- Web (PHP): http://$DOMINIO"
echo "- Web (Python): http://$DOMINIO/python"
echo "- Base de datos: $DB_NAME (Usuario: $USUARIO)"
echo "- FTP/SSH/SFTP: Usuario $USUARIO"
echo "¡GRACIAS POR CONTRATAR NUESTROS SERVICIOS!"
echo "-----------------------------------------------------"
~~~
<br/> <img width="1280" height="107" alt="30" src="https://github.com/user-attachments/assets/0b02f244-606f-430d-ba9f-7b682e35a0a0" />
<img width="1282" height="864" alt="31" src="https://github.com/user-attachments/assets/a4ddcd51-db37-4c54-b2eb-b16b17565467" />
<img width="1281" height="865" alt="32" src="https://github.com/user-attachments/assets/840bc496-355d-4fb9-98e2-5375b0525c5f" />
<img width="1282" height="867" alt="33" src="https://github.com/user-attachments/assets/536493cf-d2b8-43e9-8438-4129da144e4d" /> <br/>
Una vez hecho, le proporcionamos permisos de ejecución y ya estaría listo para usar.
<br/> <br/> <img width="1279" height="105" alt="34" src="https://github.com/user-attachments/assets/5953551a-87bd-46f1-b1d2-5986ce8e2d56" /> <br/>
Hacemos una prueba creando el usuario Antonio con contraseña 1234:
<br/> <br/> <img width="1273" height="393" alt="35" src="https://github.com/user-attachments/assets/515df193-6c35-4bdd-bfe9-3a81f14415e3" />

## 4.1 Comprobaciones usando curl:
Primero probamos que el DNS resuelve el subdominio del cliente, para ello hay que cambiar el netplan (en este caso los servidores DNS que usamos), este normalmente se encuentra en:
~~~
/etc/netplan/50-cloud-init.yaml
~~~
<br/> <img width="1284" height="314" alt="36" src="https://github.com/user-attachments/assets/add2d8ba-c82d-46f4-b4e3-a6d41cafacde" /> <br/>
Aplicamos los cambios y comprobamos:
<br/> <br/> <img width="1281" height="217" alt="37" src="https://github.com/user-attachments/assets/90463946-b8bf-492a-bcb4-b74866b95530" /> <br/>
Esto no quiere decir que no funcione. A veces el servicio interno de red de Ubuntu (systemd-resolved) tiene una medida de seguridad por la cual a veces ignora la dirección 127.0.0.1 para evitar "bucles infinitos" de red, y se empeña en preguntarle al DNS secundario. Pero con dig nos devuelve la IP sin problemas.
Vamos a probar la web/PHP con curl:
<br/> <br/> <img width="1283" height="219" alt="38" src="https://github.com/user-attachments/assets/10edf42a-588c-4f1a-b850-8a141cb14c52" /> <br/>
Y la aplicación de Python:
<br/> <br/> <img width="1280" height="120" alt="39" src="https://github.com/user-attachments/assets/f71bf5df-a965-44a2-afdb-5301ea154fbb" /> <br/>
Ahora lo comprobamos desde un cliente/PC en la misma subred:
<br/> <br/> <img width="1218" height="352" alt="40" src="https://github.com/user-attachments/assets/3c5a46a8-5e8b-47be-affc-f07dc66a95de" /> <br/>
Como podemos observar, al no ser 127.0.0.1 si hace ping correctamente al subdominio del usuario creado.
Ahora procedemos a ver los recursos desde un navegador:
<br/> <br/> <img width="1216" height="238" alt="41" src="https://github.com/user-attachments/assets/9e240aeb-6568-42c0-b093-7ddb31fa596f" /> <br/>
<img width="1213" height="149" alt="42" src="https://github.com/user-attachments/assets/ede7e6c5-ba03-4152-90fe-9638774061f0" />

## 5. Docker.
Nuestro servidor actual ya tiene ocupados los puertos 80 (Apache) y 53 (Bind9). Si intentamos levantar contenedores Docker en esos mismos puertos, chocarán y darán error. Para no romper lo que ya hemos hecho, configuraremos los contenedores para que escuchen en puertos alternativos (ej. 8080 para la web y 5353 para el DNS) usando una red interna de Docker. Vamos a instalar Docker y el plugin de Compose:
<br/> <br/> <img width="1282" height="313" alt="43" src="https://github.com/user-attachments/assets/00623f96-0082-4ee9-8064-234c909e9915" /> <br/>
Añadimos el usuario al grupo de Docker para usar los contenedores sin usar sudo:
<br/> <br/> <img width="1280" height="105" alt="44" src="https://github.com/user-attachments/assets/6b06109b-d329-4c27-90e5-4c91897ff387" /> <br/>
Como nos dices en el enunciado que hay que configurar "volúmenes", vamos a crear una carpeta para este proyecto y subcarpetas para guardar los datos de los contenedores de forma persistente. Vamos a la carpeta personal:
<br/> <br/> <img width="1280" height="161" alt="45" src="https://github.com/user-attachments/assets/90a3a58e-8d9b-4209-a2d0-0faec5d03be8" /> <br/>
Y creamos un index.html para las comprobaciones:
<br/> <br/> <img width="1277" height="184" alt="46" src="https://github.com/user-attachments/assets/bf22f568-a789-484e-a07f-446af7121736" /> <br/>
Vamos a escribir un archivo compose que es el que nos va a crear la estructura del contenedor y desde el que quedará configurada la red, los volúmenes y los dos contenedores (un DNS basado en Ubuntu/Bind9 y un servidor Web basado en Nginx). Creamos el docker-compose y este sería su contenido:
~~~
services:
  # 1. Contenedor DNS
  servidor_dns:
    image: ubuntu/bind9:latest
    container_name: dns_docker
    ports:
      - "5353:53/udp"
      - "5353:53/tcp"
    volumes:
      - ./dns:/etc/bind
    networks:
      - red_practica
    restart: unless-stopped

  # 2. Contenedor Web
  servidor_web:
    image: nginx:latest
    container_name: web_docker
    ports:
      - "8080:80"
    volumes:
      - ./html:/usr/share/nginx/html:ro
    networks:
      - red_practica
    restart: unless-stopped

# Configuración de la red virtual de Docker
networks:
  red_practica:
    driver: bridge
~~~
<br/> <img width="1272" height="867" alt="47" src="https://github.com/user-attachments/assets/c00f3ad6-dca1-4bc8-a986-5605365514f9" /> <br/>
Como toda la práctica va de automatización mediante scripts, vamos a crear un pequeño script en Bash que levante el entorno y te muestre su estado. Lo creamos con:
~~~
nano desplegar_docker.sh
~~~
Su contenido será este código, que despliega el contenedor y te muestra el estado en una tabla cogiendo los parámetros a mostrar:
<br/> <br/> <img width="1281" height="434" alt="48" src="https://github.com/user-attachments/assets/b6bed3c1-5a1f-4077-9736-afe5c261f63f" /> <br/>
Le damos permisos de ejecución y lo probamos:
<br/> <br/> <img width="1280" height="129" alt="49" src="https://github.com/user-attachments/assets/66430ca5-cc18-4d17-9118-0badf573a4ef" />
<br/> <img width="1283" height="865" alt="50" src="https://github.com/user-attachments/assets/b853a75f-3924-40de-b086-3a16e5c336ca" /> <br/>
Por último hacemos la comprobación desde un cliente:
<br/> <br/> <img width="1220" height="196" alt="51" src="https://github.com/user-attachments/assets/f60dc432-8ddd-424e-a40e-f05960b6fa05" />
