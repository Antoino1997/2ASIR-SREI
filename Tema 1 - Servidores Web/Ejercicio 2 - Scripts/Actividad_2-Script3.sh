#!bin/bash

# Crea un script que nos permita crear una página web con un título, una cabecera y un mensaje

read -p "Introduce el título de la página: " titulo
read -p "Introduce la cabecera de la página: " cabecera
read -p "Introduce el mensaje de la página: " mensaje
read -p "Introduce el nombre del archivo: " archivo
echo '<!DOCTYPE html>' > /var/www/html/$archivo.html
echo "<html lang='es'>" >> /var/www/html/$archivo.html
echo "<head>" >> /var/www/html/$archivo.html
echo "    <meta charset='UTF-8'>" >> /var/www/html/$archivo.html
echo "    <title>$titulo</title>" >> /var/www/html/$archivo.html
echo "</head>" >> /var/www/html/$archivo.html
echo "<body>" >> /var/www/html/$archivo.html
echo "    <h1>$cabecera</h1>" >> /var/www/html/$archivo.html
echo "    <p>$mensaje</p>" >> /var/www/html/$archivo.html
echo "</body>" >> /var/www/html/$archivo.html
echo "</html>" >> /var/www/html/$archivo.html

echo "Archivo creado correctamente en /var/www/html/$archivo.html"


