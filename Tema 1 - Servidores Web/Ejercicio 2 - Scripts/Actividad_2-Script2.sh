#!bin/bash

#Crea un script que añada un nombre de dominio y una ip al fichero hosts. 
# Debemos comprobar que no existe dicho dominio en el fichero hosts

#/etc/hosts

read -p "Introduce la IP: " ip
read -p "Introduce el dominio: " dominio

if grep "$dominio" /etc/hosts; then
    echo "El dominio ya está en el archivo"
    exit 1
else
    echo "$ip $dominio" >> /etc/hosts
    echo "IP y dominio correctamente"
fi; 
