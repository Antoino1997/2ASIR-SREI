# Instalación de Apache en Ubuntu
## Antes de comenzar
Primero de todo hay que tener una máquina limpia Ubuntu 25.10 y luego procedemos a actualizar los paquetes con:
~~~
sudo apt update && sudo apt upgrade -y
~~~
<br/> <img width="1219" height="186" alt="1" src="https://github.com/user-attachments/assets/7f5a5c95-0b5a-4a2f-aa4c-db62d6bd95ba" /> <br/>
Ahora realizamos la instalación de Apache con:
~~~
sudo apt install apache2 -y
~~~
<br/> <img width="1211" height="192" alt="2" src="https://github.com/user-attachments/assets/f288f658-0ad7-4768-92a3-8bb3e20b14fd" /> <br/>
Una vez instalado, comprobamos que funciona.
<br/> <img width="1214" height="767" alt="3" src="https://github.com/user-attachments/assets/80af2adc-f501-4632-8075-de05163af360" /> <br/>
Procedemos con la instalación de MySQL con:
~~~
sudo apt install mysql-server -y
~~~
<br/> <img width="1210" height="287" alt="4" src="https://github.com/user-attachments/assets/42a93225-258d-47fb-bf4c-384deecbc555" /> <br/>
Y ahora procedemos con:
~~~
sudo mysql_secure_installation
~~~
<br/> <img width="1211" height="421" alt="5" src="https://github.com/user-attachments/assets/5a772781-3573-4305-84eb-b2a5a3f2d95e" /> <br/>
Comprobamos que podemos acceder a mysql:
<br/> <img width="1219" height="312" alt="6" src="https://github.com/user-attachments/assets/8cdf2991-8f0c-42f8-bdf9-db83db6d9b5b" /> <br/>
Por último, instalamos php para completar la instalación LAMP con:
~~~
sudo apt install php libapache2-mod-php php-mysql
~~~
<br/> <img width="1215" height="253" alt="7" src="https://github.com/user-attachments/assets/3a272c65-477f-48f6-98f9-5c06ff7aa576" /> <br/>
Comprobamos que php está instalado:
<br/> <img width="1212" height="189" alt="8" src="https://github.com/user-attachments/assets/2c72f68c-6ed7-4dd0-88c1-21dbefa13cc9" /> <br/>
Ahora procedemos a crear el directorio del dominio:
<br/> <img width="1211" height="180" alt="9" src="https://github.com/user-attachments/assets/e5721382-db91-4f07-915f-1e8a918fdd0c" /> <br/>
Y ahora creamos la configuración del VirtualHost del dominio:
<br/> <img width="646" height="493" alt="10" src="https://github.com/user-attachments/assets/b63eb895-c031-485f-85cb-10b0f8ecae67" /> <br/>
Ahora habilitamos el sitio y recargamos el servicio apache2:
<br/> <img width="654" height="488" alt="11" src="https://github.com/user-attachments/assets/d027f159-c431-4725-a51c-90fea185fb20" /> <br/>
Ahora creamos un archivo index.html para ver que funciona:
<br/> <img width="653" height="487" alt="12" src="https://github.com/user-attachments/assets/37b34346-02d5-493a-852b-46bf8db48760" /> <br/>
Ponemos localhost en el navegador y debería de salir así:
<br/> <img width="435" height="177" alt="13" src="https://github.com/user-attachments/assets/e3b2cc81-e9ef-4cc3-98c7-4589cc3ab122" /> <br/>
Ahora vamos a probar que nuestra nueva página web pueda procesar peticiones PHP, para ello creamos un archivo info.php que contenga lo siguiente:
<br/> <img width="655" height="129" alt="14" src="https://github.com/user-attachments/assets/5df2ce09-8c7a-405a-91b6-ebb5038966b6" /> <br/>
Y comprobamos que se visualiza en el navegador:
<br/> <img width="1221" height="761" alt="15" src="https://github.com/user-attachments/assets/53718285-29d6-4034-a0b1-4ee913596b17" /> <br/>
