| Directiva | Uso / Función | Ejemplo encontrado |
| :--- | :--- | :--- |
| **`<IfModule>`** | Es una sección que permite escribir directivas condicionadas por la presencia (o ausencia) de un módulo específico en Apache. | `<IfModule ssl_module>` <br> `Listen 443` <br> `</IfModule>` (Usado en `/etc/apache2/ports.conf` para escuchar el puerto 443 solo si el módulo SSL está cargado). |
| **`LoadModule`** | Se utiliza para cargar un módulo en el servidor web Apache. | `LoadModule alias_module /usr/lib/apache2/modules/mod_alias.so` (Usado en `/etc/apache2/mods-enabled/alias.load`). |
| **`Include`** | Permite la inclusión de otros archivos de configuración dentro del archivo de configuración actual. | `Include ports.conf` (Usado en `/etc/apache2/apache2.conf`). |
| **`<Directory>`** | Se utiliza para aplicar directivas de configuración que afectarán a un directorio específico y todos los subdirectorios incluidos en él. | `<Directory />` <br> `Options FollowSymLinks` <br> `AllowOverride None` <br> `Require all denied` <br> `</Directory>` (Usado en `/etc/apache2/apache2.conf`). |
| **`<Files>` / `<FilesMatch>`** | Se utiliza para aplicar directivas de configuración que afectarán a un archivo o grupo de archivos (a menudo utilizando caracteres comodín o expresiones regulares). | `<FilesMatch "^\.ht">` <br> `Require all denied` <br> `</FilesMatch>` (Usado en `/etc/apache2/apache2.conf` para denegar el acceso a archivos `.htaccess`). |
| **`<Location>`** | Se utiliza para aplicar directivas de configuración que afectarán a una URL específica o un grupo de URLs. | `<Location /server-status>` <br> `SetHandler server-status` <br> `Require local` <br> `</Location>` (Usado en `/etc/apache2/mods-enabled/status.conf`). |
| **`<VirtualHost>`** | Se utiliza para aplicar directivas de configuración que afectarán a un servidor virtual (por ejemplo, para alojar múltiples dominios en un mismo servidor). | `<VirtualHost *:80>` <br> `ServerAdmin webmaster@localhost` <br> `DocumentRoot /var/www/html` <br> `</VirtualHost *:80>` (Usado en `/etc/apache2/sites-enabled/000-default.conf`). |

### ¿Qué son los ficheros `.htaccess`?

Los ficheros `.htaccess` proporcionan un mecanismo para que los usuarios (no administradores del servidor) puedan realizar cambios en la configuración por directorio.
