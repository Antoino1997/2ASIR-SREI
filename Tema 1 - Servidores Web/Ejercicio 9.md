# Autenticación básica
## 1. Crea cinco usuarios: usuario1, usuario2, usuario3, usuario4, usuario5.
<br/> <img width="1218" height="563" alt="1" src="https://github.com/user-attachments/assets/35ef46a5-70ad-44a8-9c2e-69bd4a972420" /> <br/>

## 2. Crea dos grupos de usuarios, el primero formado por usuario1 y usuario2; y el segundo por el resto de usuarios.
<br/> <img width="812" height="89" alt="2" src="https://github.com/user-attachments/assets/a53b1fb9-cd65-45ac-aa55-a097d9331895" /> <br/>
<br/> <img width="910" height="123" alt="3" src="https://github.com/user-attachments/assets/14422138-cb8b-443d-b2d1-32428d9db678" /> <br/>

## 3. Crea un directorio llamado privado1 que permita el acceso a todos los usuarios.
Voy a crear privado2 también ya que lo vamos a necesitar.
<br/> <img width="816" height="97" alt="4" src="https://github.com/user-attachments/assets/c34e5313-6ed0-4216-bdc1-d4da31899664" /> <br/>
Ahora, en /etc/apache2/apache2.conf vamos a poner lo siguiente:
<br/> <img width="326" height="138" alt="5" src="https://github.com/user-attachments/assets/04fc2f7c-0370-4039-bfbf-381959d006e3" /> <br/>
Lo comprobamos:
<br/> <img width="778" height="339" alt="6" src="https://github.com/user-attachments/assets/1d960662-1907-425c-b16c-5f29bd4814ae" /> <br/>

## 4. Crea un directorio llamado privado2 que permita el acceso sólo a los usuarios del grupo1.
En /etc/apache2/apache2.conf ponemos lo siguiente:
<br/> <img width="356" height="142" alt="7" src="https://github.com/user-attachments/assets/96dcb4ca-94e3-4bbf-ada4-c839b0a06e18" /> <br/>
Y lo comprobamos:
<br/> <img width="849" height="456" alt="8" src="https://github.com/user-attachments/assets/77091b7d-8ee1-4ad7-84bc-95a8afef705f" /> <br/>
<br/> <img width="841" height="264" alt="9" src="https://github.com/user-attachments/assets/305af2c7-8a7c-4689-a8b7-22824a1d23b4" />

## 5. Esta parte es teórica.

## 6. En el directorio privado2 haz que sólo sea accesible desde el localhost, y estudia cómo se comporta la autorización si ponemos: satisfy any, satisfy all
Primero tenemos que activar el módulo con:
~~~
sudo a2enmod access_compat
~~~
<br/> <img width="652" height="167" alt="10" src="https://github.com/user-attachments/assets/d7809686-2c4a-4d27-b22f-84bfb8626266" /> <br/>
La primera, con Satisfy All nos dice que debemos cumplir todas las condiciones (entrar desde localhost y que usuario y contraseña sean reconocidos).
<br/> <img width="394" height="256" alt="11" src="https://github.com/user-attachments/assets/4b258c49-8d07-40ed-b875-43873b161362" /> <br/>
Y en el segundo caso, con Satisfy Any, solo tiene que cumplirse uno:
<br/> <img width="646" height="484" alt="12" src="https://github.com/user-attachments/assets/b95d9cab-b377-42ce-ad2e-dd17f1c4f300" />
