# 

## 1. Crea un directorio llamado "dir1" y otro llamado "dir2"
Para ello creamos los dos directorios y nos aseguramos:
<br/> <img width="644" height="489" alt="1" src="https://github.com/user-attachments/assets/2af6fb1d-4089-41d3-a8fb-9524112d7714" /> <br/>

## 2. Explica qué diferencia existe entre ambos y muestra su equivalencia con la directiva Require:
~~~
<Directory /var/www/example1>
Order Deny,Allow
Deny from All
Allow from 192.168.1.100
</Directory>


<Directory /var/www/example1>
Order Allow,Deny
Deny from All
Allow from 192.168.1.100
</Directory>
~~~

La diferencia clave entre las dos configuraciones radica en el orden en que Apache procesa las reglas (Deny from y Allow from) y, crucialmente, el comportamiento por defecto cuando una solicitud no coincide con ninguna de las reglas explícitas.
En el primer caso, primero denegará todo el acceso de forma predeterminada y luego permitirá la conexión desde 192.168.1.100; y en el segundo ejemplo primero permitirá todo el acceso de forma predeterminada y luego denegará el acceso a todos excepto a 192.168.1.100.
Esta sería la sintaxis de la directiva "require" que haría lo mismo. Esta directiva solo nos permite la conexión desde esa ip en específico.

~~~
<Directory /var/www/example1>
Require ip 192.168.1.100
</Directory>
~~~

## 3. Para dir1
Dentro de etc/apache2/apache2.conf:
### a. Permite el acceso de las peticiones provenientes de 10.3.0.100
<br/> <img width="261" height="81" alt="2" src="https://github.com/user-attachments/assets/3f663ef3-2805-4be3-b699-5c74a441c833" /> <br/>
### b. Permite el acceso desde "marisma.intranet"
<br/> <img width="315" height="71" alt="3" src="https://github.com/user-attachments/assets/991e72e1-3779-4b1f-9657-0497b2850421" /> <br/>
### c. Permite el acceso desde cualquier subdominio de "marisma.intranet"
<br/> <img width="320" height="71" alt="4" src="https://github.com/user-attachments/assets/cca6a4cb-6820-4b6d-bee5-eb1672ab921d" /> <br/>
### d. Permite el acceso de las peticiones provenientes de "10.3.0.100" con máscara "255.255.0.0"
<br/> <img width="264" height="66" alt="5" src="https://github.com/user-attachments/assets/a07d8d8b-d305-4cad-b5ed-22e104cbe0ff" /> <br/>

## 4. Modifica la configuración de forma que el acceso a dir1:
### a. Se permita a "marisma.intranet" y no se permita desde 10.3.0.101"
<br/> <img width="375" height="112" alt="6" src="https://github.com/user-attachments/assets/6329cd22-4f46-4da6-aeef-6aa75782e771" /> <br/>

## 5. Modifica la configuración de forma que el acceso a dir2:
### a. Se permita a "10.3.0.100/8" y no a "marisma.intranet"
<br/> <img width="423" height="120" alt="7" src="https://github.com/user-attachments/assets/bf972a16-f85f-45b3-b3ce-5b830a37ed1a" />


