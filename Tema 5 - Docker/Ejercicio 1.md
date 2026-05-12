Para llevar a cabo una correcta instalación, primero vamos a actualizar el sistema con:
~~~
sudo apt update && sudo apt upgrade
~~~

<img width="1214" height="770" alt="1" src="https://github.com/user-attachments/assets/f77721a1-59ad-4b8b-b7ee-9d3c35bb7955" />

Después de eso, vamos a optar por instalar Docker usando el repositorio apt, y para ello primero tenemos que configurarlo con la clave GPG oficial.
Instalamos curl para poder descargarnos a través de una URL con:
~~~
sudo apt install ca-certificates curl
~~~

<img width="1214" height="411" alt="2" src="https://github.com/user-attachments/assets/261a9e4c-cd32-4ff8-b945-bdf8932e07c3" />

Ahora creamos la carpeta /etc/apt/keyrings, descargo el paquete de Docker ahí y le cambio los permisos con:
~~~
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
~~~

<img width="1213" height="179" alt="3" src="https://github.com/user-attachments/assets/c20d803c-9006-401b-a5ca-1d377e7d1f9d" />

Añadimos el repositorio a apt con:
```bash
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
```

<img width="1213" height="382" alt="4" src="https://github.com/user-attachments/assets/938ce7e8-cd01-400e-97fd-f5b2d8c8e546" />

Y confirmamos que se ha agregado al repositorio apt:

<img width="1215" height="345" alt="5" src="https://github.com/user-attachments/assets/cfa9f53d-a003-43e3-a89f-09595b4ce99c" />

Ahora procedemos a la instalación de docker con:
~~~
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
~~~

<img width="1215" height="503" alt="6" src="https://github.com/user-attachments/assets/174f00db-e7e6-4c8e-b237-427366b1da85" />

Y por último, verificamos con:
~~~
sudo systemctl status docker
~~~

<img width="1220" height="600" alt="7" src="https://github.com/user-attachments/assets/fc9dc1c2-ec5f-400f-8aeb-912f1a7f0fe8" />
