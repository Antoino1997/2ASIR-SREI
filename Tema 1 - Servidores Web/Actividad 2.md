# Ejercicios sobre archivos de configuración.
## 1. Apache utilizará el puerto 81 además del 80.
Vamos al archivo de configuración de los puertos y agregamos lo siguiente:
<br/> <img width="640" height="490" alt="1" src="https://github.com/user-attachments/assets/db8fe7b1-f266-417b-9470-dbc2cb7ce84c" /> <br/>
Y comprobamos que funciona:
<br/> <img width="1216" height="258" alt="2" src="https://github.com/user-attachments/assets/b757c283-f6ea-4bde-a3d0-5dc57e9a94b1" /> <br/>

## 2. Añadir el dominio “marisma.intranet” en el fichero “hosts”.
Vamos al archivo de configuración de los hosts y lo añadimos:
<br/> <img width="651" height="485" alt="3" src="https://github.com/user-attachments/assets/adc7a92b-5223-402a-8d1f-2d9e46d5501e" /> <br/>
Y comprobamos que va:
<br/> <img width="1218" height="173" alt="4" src="https://github.com/user-attachments/assets/85455746-a354-45e3-b41b-2ada29a48a9b" /> <br/>

## 3. Cambia la directiva “ServerTokens” para mostrar el nombre del producto.
Dentro de "security.conf" cambiamos en ServerTokens "OS" a "Prod":
<br/> <img width="657" height="488" alt="5" src="https://github.com/user-attachments/assets/26cb0715-0cd4-4583-b6ea-36880bd0a443" /> <br/>
Y lo comprobamos con curl:
<br/> <img width="900" height="271" alt="6" src="https://github.com/user-attachments/assets/8105bcc8-c3ae-4238-a981-c521e4f8389d" /> <br/>

## 4. Comprueba si se visualiza el pie de página en las páginas generadas por Apache (por ejemplo, en las páginas de error). Cambia el valor de la directiva “ServerSignature” y comprueba que funciona correctamente.
Sin cambiar nada se ve así:
<br/> <img width="598" height="248" alt="7" src="https://github.com/user-attachments/assets/e28b57bc-9364-482b-ba8e-e8c7f33d8a46" /> <br/>
Dentro de "security.conf" cambiamos ServerSignature a Off:
<br/> <img width="606" height="163" alt="8" src="https://github.com/user-attachments/assets/72210c55-0c2d-4bc4-95cd-39825ad5947a" /> <br/>
Y comprobamos que ya no se muestran:
<br/> <img width="610" height="255" alt="9" src="https://github.com/user-attachments/assets/e11b7482-d831-4bbe-9e02-d5f7bf73ed93" /> <br/>

## 5. Crea un directorio “prueba” y otro directorio “prueba2”. Incluye un par de páginas en cada una de ellas.
Creamos las carpetas con sus respectivos "index.html":
<br/> <img width="1217" height="230" alt="10" src="https://github.com/user-attachments/assets/f60475ee-c62f-4182-8d73-9df6bac9077c" /> <br/>
Y comprobamos que funciona:
<br/> <img width="509" height="180" alt="11" src="https://github.com/user-attachments/assets/0e63d528-9f24-43fc-b150-447b46ee26dc" /> <br/>
<br/> <img width="479" height="145" alt="12" src="https://github.com/user-attachments/assets/4b4f1024-5595-4a92-a187-0456eabff025" /> <br/>

## 6. Redirecciona el contenido de la carpeta “prueba” hacia “prueba2”.
Dentro de "apache2.conf" incluimos el redirect:
<br/> <img width="1223" height="715" alt="13" src="https://github.com/user-attachments/assets/ee1fbb37-e7e2-43ad-a902-bddb91a3c355" /> <br/>

## 7. Es posible redireccionar tan solo una página en lugar de toda la carpeta. Pruébalo.
Dentro de "apache2.conf" incluimos el redirect de una página:
<br/> <img width="1220" height="761" alt="14" src="https://github.com/user-attachments/assets/4765d213-612f-4869-840b-b84e7025f9b7" /> <br/>

## 8. Usa la directiva userdir.
Primero habilitamos el módulo y reiniciamos el servicio de apache:
<br/> <img width="652" height="192" alt="15" src="https://github.com/user-attachments/assets/376d000b-3b50-4269-87fc-0fdd3fdaf831" /> <br/>
Ahora creamos la carpeta "public_html" en /home/tuusuario, en mi caso en /home/antonio, además de un index.html (Además hay que comprobar los permisos):
<br/> <img width="650" height="60" alt="16" src="https://github.com/user-attachments/assets/731e168d-a78f-4a51-967a-a6b494603857" /> <br/>
Y comprobamos que funciona:
<br/> <img width="629" height="195" alt="17" src="https://github.com/user-attachments/assets/fabeaf52-0474-49ec-b7c0-16caa3a0d5c6" /> <br/>

## 9. Usa la directiva alias para redireccionar a una carpeta dentro del directorio de usuario.
Entramos en "alias.conf" que se encuentra en "mods-available" y configuramos el alias:
<br/> <img width="646" height="491" alt="18" src="https://github.com/user-attachments/assets/a1286d09-3f63-4ebb-b53b-26e7a7cd288f" /> <br/>
Creamos la carpeta, el archivo index.html y comprobamos que funciona:
<br/> <img width="550" height="192" alt="19" src="https://github.com/user-attachments/assets/bc57dcdd-c3db-4faa-9816-291d1f78ab25" /> <br/>

## 10. ¿Para qué sirve la directiva Options y dónde aparece. Comprueba si apache indexa los directorios. Si es así, ¿cómo lo desactivamos?
La directiva options sirve para configurar el comportamiento dentro de un directorio. Sí indexa el contenido. Lo desactivamos en apache2.conf y vemos que en var/www quitando la línea 'Indexes' ya no aparecen los indexes.
<br/> <img width="654" height="487" alt="20" src="https://github.com/user-attachments/assets/8c1d8217-2193-4a7c-b43b-fbc49aa73733" />
