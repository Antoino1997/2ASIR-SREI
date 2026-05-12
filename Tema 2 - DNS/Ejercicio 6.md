# Preparativos
Partimos del servidor maestro (192.168.193.55/24) y el servidor esclavo (192.168.193.70/24)

En el servidor maestro es donde se hará la mayoría de la configuración. Primero vamos a entrar en el archivo de configuración y cambiara la línea de recursión con:
~~~
sudo nano named.conf.options
~~~

<img width="1275" height="485" alt="1" src="https://github.com/user-attachments/assets/44a9db47-2a9e-4efd-9ffb-e5738f5afc53" />

Ahora vamos a editar el archivo donde se definen las zonas de DNS locales y personalizadas, añadiendo la zona marisma.intranet y la inversa con:
~~~
sudo nano named.conf.local
~~~

<img width="1277" height="275" alt="2" src="https://github.com/user-attachments/assets/e4051e4d-5ec1-4821-a0a1-6cf89e13526b" />

El siguiente paso es crear el archivo de zona directa. Aquí definiremos los nombres que pide el ejercicio (ns1, ftp1, mail1, www, etc.). Vamos a hacer una copia de la plantilla vacía y la modificaremos:

<img width="1281" height="519" alt="3" src="https://github.com/user-attachments/assets/78cc1ae8-b9dc-4819-8cc5-58587646650f" />

Ahora creremos el archivo de la zona inversa. Lo mismo, copiamos uno vacío y lo editamos:

<img width="1274" height="386" alt="4" src="https://github.com/user-attachments/assets/c672a05e-e1e8-4bea-af5e-9b5af1dfcb91" />

Comprobamos la sintaxis de ambos archivos con:
~~~
sudo named-checkzone marisma.intranet /etc/bind/db.marisma.intranet
~~~

<img width="1277" height="130" alt="5" src="https://github.com/user-attachments/assets/ef64fbe1-e93a-4f50-9768-78a94f8797b2" />

Y ahora procedemos a reiniciar el servicio y mirar el estado:

<img width="1278" height="485" alt="6" src="https://github.com/user-attachments/assets/6e262539-664a-414c-82c6-64a75f7152b5" />

A continuación, vamos al servidor esclavo y vamos a configurarlo de una forma muy parecida a como configuramos el cliente en la actividad anterior, editando:
~~~
/etc/resolv.conf
~~~

<img width="1279" height="433" alt="7" src="https://github.com/user-attachments/assets/dd80135b-769b-4a36-afc7-94f369d8bd2f" />

Con esto le estamos diciendo que el servidor de nombres (DNS) y que busque la zona marisma.intranet.

# Comprobaciones
- Registro A:

<img width="1277" height="231" alt="8" src="https://github.com/user-attachments/assets/8ff7b80c-8d45-44e3-91a0-efb2d8a0f9c8" />

- Registro NS:

<img width="1275" height="512" alt="9" src="https://github.com/user-attachments/assets/e02906b2-ffd6-49bd-b045-ac65917bbeed" />

- Registro MX:

<img width="1274" height="521" alt="10" src="https://github.com/user-attachments/assets/83fa878d-8c20-4e40-8d08-bdf2a6fdfa09" />

- Registro SOA:

<img width="1279" height="452" alt="11" src="https://github.com/user-attachments/assets/aac7cb68-017e-42b2-aa1b-12ef877fefda" />

- Resolución inversa:

<img width="1281" height="501" alt="12" src="https://github.com/user-attachments/assets/32c7ceb6-a198-4308-8de8-939c55423094" />
