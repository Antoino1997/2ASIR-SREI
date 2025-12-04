#!bin/bash

#Crea un script que añada un puerto de escucha en el fichero de configuración de Apache. 
#El puerto se recibirá como parámetro en la llamada y se comprobará que no esté ya presente en el fichero de configuración.

#/etc/apache2/ports.conf

if [ $# -ne 1 ]; then
    echo "Introduce solo un puerto"
    exit 1
fi

if grep "Listen $1" /etc/apache2/ports.conf; then
    echo "El puerto ya está en el archivo"
    exit 1
else
    echo "Listen $1" >> /etc/apache2/ports.conf
    echo "Puerto añadido correctamente"
fi; 



