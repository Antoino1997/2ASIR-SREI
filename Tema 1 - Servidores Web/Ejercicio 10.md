# Certificado SSL Autofirmado
## 1. Teniendo una instancia EC2 creada, nos conectamos por SSH desde nuestro equipo:
<br/> <img width="866" height="763" alt="1" src="https://github.com/user-attachments/assets/b9c81be0-7153-4057-b38c-170184f97bae" /> <br/>

## 2. Instalación del servidor web Apache
<br/> <img width="976" height="152" alt="2" src="https://github.com/user-attachments/assets/900a37a7-5773-4f50-a0fe-bee4304b3019" /> <br/>

## 3. Creación del certificado autofirmado
Con el siguiente comando empezamos la creación del certificado:
~~~
sudo openssl req \
  -x509 \
  -nodes \
  -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/ssl/private/apache-selfsigned.key \
  -out /etc/ssl/certs/apache-selfsigned.crt
~~~
<br/> <img width="449" height="119" alt="3" src="https://github.com/user-attachments/assets/e788792c-28c4-4213-bbb5-dc98bd3f384d" /> <br/>
<br/> <img width="621" height="230" alt="4" src="https://github.com/user-attachments/assets/fcff8456-db26-4d50-9149-361d1f31b187" /> <br/>

## 4. Cómo automatizar la creación de un certificado autofirmado
Con este script podremos automatizar la creación del certificado que hemos creado en el punto anterior:
<br/> <img width="1450" height="371" alt="5" src="https://github.com/user-attachments/assets/8b36070d-6ef3-41c3-81d0-c9ccba870a90" /> <br/>

## 5. Cómo consultar la información del sujeto del certificado
Con:
~~~
openssl x509 -in /etc/ssl/certs/apache-selfsigned.crt -noout -subject
~~~
<br/> <img width="1039" height="80" alt="6" src="https://github.com/user-attachments/assets/7fabcbd9-a82d-4b98-8b2c-2826bc7b4329" /> <br/>

## 6. Cómo consultar la fecha de caducidad del certificado
Con:
~~~
openssl x509 -in /etc/ssl/certs/apache-selfsigned.crt -noout -dates
~~~
<br/> <img width="782" height="99" alt="7" src="https://github.com/user-attachments/assets/758b4086-f638-473c-862b-0ae27e7af2a5" /> <br/>

## 7. Configuración de un VirtualHost con SSL/TSL en el servidor web Apache
Utilizaremos el archivo de configuración que tiene Apache por defecto para SSL/TLS, que está en la ruta: /etc/apache2/sites-available/default-ssl.conf, cambiamos las siguientes líneas:
<br/> <img width="835" height="564" alt="8" src="https://github.com/user-attachments/assets/5aed6204-1c80-4212-90c3-20382310c71f" /> <br/>
Habilitamos ese sitio con:
~~~
sudo a2ensite default-ssl.conf
~~~
También tenemos que habilitar el módulo ssl con:
~~~
sudo a2enmod ssl
~~~
<br/> <img width="865" height="260" alt="9" src="https://github.com/user-attachments/assets/c04adeb4-aa21-4995-9a99-2d152bd653f9" /> <br/>
Configuramos el virtual host de HTTP para que redirija todo el tráfico a HTTPS, para eso tenemos que ir a /etc/apache2/sites-available/000-default.conf y editarlo:
<br/> <img width="973" height="511" alt="10" src="https://github.com/user-attachments/assets/fbcbbb68-02cc-4694-bb35-08892eede7aa" /> <br/>
Tenemos que activar el módulo rewrite con:
~~~
sudo a2enmod rewrite
~~~
<br/> <img width="469" height="151" alt="11" src="https://github.com/user-attachments/assets/42981e1e-91ed-4ae1-91d1-f9b461eea8b1" /> <br/>
Por último, lo comprobamos con curl:
<br/> <img width="545" height="231" alt="12" src="https://github.com/user-attachments/assets/3fa79171-1ba7-40ce-bd43-46d44a1424a8" /> <br/>

## 8. CERTBOT
Vamos a usar una Autoridad de Certificación (Let's Encrypt) para tener un certificado válido que los navegadores no marquen como peligroso. Nos registramos en https://www.noip.com/es-MX y creamos un hostname con la ip pública de nuestra instancia de EC2:
<br/> <img width="1446" height="243" alt="13" src="https://github.com/user-attachments/assets/1b510b35-7194-41e1-b80c-08ebc2564267" /> <br/>
Una vez creado, en nuestro ssh instalamos cerbot con:
~~~
sudo apt install certbot python3-certbot-apache
~~~
<br/> <img width="982" height="134" alt="14" src="https://github.com/user-attachments/assets/b2641495-58df-4f16-870c-296cdb06f968" /> <br/>
Y luego solicitamos el certificado con certbot usando:
~~~
sudo certbot --apache
~~~
En mi caso he tenido varios fallos y el comando te va guardando las opciones que has utilizado en un log. Una de las cosas que tenemos que hacer es en EC2 abrir tanto el puerto 80 como el 443.
<br/> <img width="1631" height="216" alt="image" src="https://github.com/user-attachments/assets/2a334d78-ff67-47c5-8136-05164538e492" /> <br/>
Luego de eso, usamos el comando de arriba.
<br/> <img width="976" height="499" alt="16" src="https://github.com/user-attachments/assets/e4c36531-de48-41ea-ab3f-1f022275484e" /> <br/>
<br/> <img width="963" height="271" alt="17" src="https://github.com/user-attachments/assets/232bc674-f6e0-4bb9-961b-a208badd8750" /> <br/>
Una vez termina, comprobamos desde cualquier navegador como nuestro dominio ya está en marcha:
<br/> <img width="2559" height="815" alt="18" src="https://github.com/user-attachments/assets/1d2f65be-b069-493e-baf4-49ec89714999" />





