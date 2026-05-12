# Preparativos
- Servidor DNS 192.168.193.55/24 (Ubuntu server con lightdm)
- Cliente 192.168.193.52/24 (Cliente limpio)

Primero de todo actualizamos el servidor e instalamos bind9:
<br/> <br/> <img width="1273" height="862" alt="1" src="https://github.com/user-attachments/assets/c653e98e-6fb7-4a74-a139-c2f20b3c73bb" />
<img width="1279" height="311" alt="2" src="https://github.com/user-attachments/assets/0b4f9cf1-be75-4a90-b87d-688eab5a983e" />

# Caching & Forwarding
Primero vamos a proceder con la configuración de servidor de caché de DNS, para ello vamos a configurar el archivo de configuración haciendo:
~~~
sudo nano /etc/bind/named.conf.options
~~~
<img width="1280" height="334" alt="3" src="https://github.com/user-attachments/assets/c812bee0-15fa-495d-a3a5-3c9ffab2bfc8" />
Aquí lo que vamos a declarar es una lista de control de entrada con el rango de IP que vamos a permitir que escuchen las peticiones que hagamos a nuestro servidor DNS. Vamos a añadir este bloque de ACL arriba del bloque options y a especificar los clientes en los que confiamos:
<br/> <br/> <img width="271" height="109" alt="4" src="https://github.com/user-attachments/assets/41812cd7-8dd4-43ce-9fc3-5d8507ca8a3b" /> <br/>
Ahora permitimos las consultas:
<br/> <br/> <img width="1278" height="343" alt="5" src="https://github.com/user-attachments/assets/3db7ae7e-9136-4c26-9fc8-4586d8b16578" /> <br/>
Una vez terminado, comprobamos la sintaxis de nuestro archivo de configuración con:
~~~
sudo named-checkconf
~~~
<img width="1279" height="115" alt="6" src="https://github.com/user-attachments/assets/65414b39-587f-4fe3-bc73-3ba248ed0fcb" />
Reiniciamos bind y comprobamos el estado:
<br/> <br/> <img width="1278" height="587" alt="7" src="https://github.com/user-attachments/assets/13173658-8387-4114-8c13-74d402cb97a6" /> <br/>
Como se puede ver en la imagen, al tener una versión reciente de bind9 este ya no guarda en los logs las Ipv4 por las que escucha, por lo que he usado una serie de comandos para visualizarlos:
~~~
sudo ss -tlnp | grep named | awk '{print $4}' | sort -u
~~~
Y como se puede observar escucha tanto por 127.0.0.1:53 como por 192.168.193.55:55

# Forwarding
Ahora vamos a configurarlo además como un servidor forwarding. Para esto, en el mismo archivo que hemos modificado, simplemente descomentamos el bloque de forwarders y añadimos otras opciones:
<br/> <br/> <img width="1280" height="458" alt="8" src="https://github.com/user-attachments/assets/53f23af4-2002-4d00-b533-95acf45eced8" /> <br/>
Una vez guardado, volvemos a comprobar la sintaxis y reiniciamos el servicio:
<br/> <br/> <img width="1280" height="489" alt="9" src="https://github.com/user-attachments/assets/7beb5bf6-0e65-4840-aadd-42a37498a8b1" />

# Comprobación del cliente:
Primero configuramos el siguiente archivo:
~~~
/etc/resolv.conf
~~~
<img width="1210" height="120" alt="11" src="https://github.com/user-attachments/assets/058af868-8857-49d4-8a18-1f4af92cfa28" />
Ahora que ya tenemos el cliente configurado, podemos empezar con las comprobaciones:
<br/> <br/> <img width="1216" height="583" alt="13" src="https://github.com/user-attachments/assets/693850f2-1209-4101-a1e6-396fdb06d8b0" />
<img width="1214" height="561" alt="14" src="https://github.com/user-attachments/assets/8e78aa30-bad9-403f-a265-eb11e5304bed" /> <br/>
Y la comprobación inversa:
<br/> <br/> <img width="1217" height="480" alt="15" src="https://github.com/user-attachments/assets/17c6a176-8d31-475b-bcb4-9a9a1ad4f210" /> <br/>
Ahora, voy a configurar el siguiente archivo para guarde los logs con:
~~~
sudo nano /etc/bind/named.conf
~~~
<img width="1278" height="435" alt="16" src="https://github.com/user-attachments/assets/e9d2c4ab-e732-4656-8cde-61ba92df4d19" /> <br/>
Creamos la carpeta para los logs y le damos permisos a bind:
<br/> <br/> <img width="1280" height="99" alt="17" src="https://github.com/user-attachments/assets/6f2ec568-ec62-4f95-b72e-7aee2fa5bd7f" /> <br/>
Comprobamos sintaxis, reiniciamos bind y comprobamos los logs en tiempo real con el siguiente comando:
~~~
sudo tail -f /var/log/named/query.log
~~~
<img width="1278" height="229" alt="18" src="https://github.com/user-attachments/assets/8a051dfc-d708-4dbd-a58a-15006098f644" />
