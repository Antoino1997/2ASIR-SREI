# Virtual Host
## 1. Crear la estructura
Creamos los dos directorios junto con sus archivos:
<br/> <img width="800" height="136" alt="1" src="https://github.com/user-attachments/assets/9589ad84-69d3-4253-8b56-ea80587d5e50" /> <br/>

## 2. Otorgar permisos
Para poder modificar los archivos en nuestro directorio web, necesitamos cambiar el propietario haciendo lo siguiente:
<br/> <img width="906" height="96" alt="2" src="https://github.com/user-attachments/assets/f75c922e-1b9c-4390-90b3-2e13d267882a" /> <br/>
Y también cambiamos los permisos para lectura:
<br/> <img width="815" height="98" alt="3" src="https://github.com/user-attachments/assets/e369cf83-bb02-49de-9f95-fb3dfbb123cd" /> <br/>

## 3. Crear una página de prueba para cada VirtualHost
Copiamos el archivo de configuración por defecto para ejemplo.com y prueba.com y lo editamos:
<br/> <img width="1213" height="116" alt="4" src="https://github.com/user-attachments/assets/b0646c67-e54d-419f-83b7-00f5679526f4" /> <br/>
<br/> <img width="1218" height="665" alt="5" src="https://github.com/user-attachments/assets/aacc9d81-db99-4b0a-8646-ea858016a88d" /> <br/>
<br/> <img width="1219" height="145" alt="6" src="https://github.com/user-attachments/assets/fc75bb1a-16e4-41fb-8d28-eca55e6e23b9" /> <br/>
<br/> <img width="1220" height="631" alt="7" src="https://github.com/user-attachments/assets/41165f3c-9d1b-4f9b-98a8-169f1d3ad1e0" /> <br/>

## 4. Habilitamos los nuevos archivos de VirtualHost
Usamos a2ensite para habilitarlos:
<br/> <img width="1225" height="216" alt="8" src="https://github.com/user-attachments/assets/f73c48e8-0c4d-44b9-96db-ea1b00595c1d" /> <br/>
Y ahora editamos /etc/hosts para alojarlos:
<br/> <img width="465" height="110" alt="9" src="https://github.com/user-attachments/assets/a4f17566-1e6d-48f5-8892-486ec926a208" /> <br/>
Y por último, comprobamos ambos dominios:
<br/> <img width="509" height="155" alt="10" src="https://github.com/user-attachments/assets/ceed2a24-f202-452a-9194-d4a3a271fec5" /> <br/>
<br/> <img width="494" height="145" alt="11" src="https://github.com/user-attachments/assets/9949f025-92a5-4e02-802b-4e173b63a451" />
