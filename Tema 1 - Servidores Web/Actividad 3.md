## Directivas de Identificación

| Directiva | Descripción | Valor por Defecto (Típico) | Ubicación Común (Típica) |
| :--- | :--- | :--- | :--- |
| `ServerName` | Nombre del servidor y puerto. Se usa para crear URLs de redirección. | Determinado por el sistema (o no especificado). | `sites-enabled/000-default.conf` o VirtualHost |
| `ServerAdmin` | Dirección de correo electrónico del administrador (anunciada en páginas de error). | `webmaster@localhost` | `sites-enabled/000-default.conf` o VirtualHost |
| `ServerTokens` | Información sobre el servidor incluida en las cabeceras HTTP (`Server:`). | `Full` (Se recomienda cambiar a `Prod`). | `apache2.conf` |

---

## Directivas de Localización de Ficheros

| Directiva | Descripción | Valor por Defecto (Típico) | Ubicación Común (Típica) |
| :--- | :--- | :--- | :--- |
| `DocumentRoot` | Directorio raíz desde donde se servirán los documentos web. | `/var/www/html` | `sites-enabled/000-default.conf` o VirtualHost |
| `ErrorLog` | Archivo de log donde se almacenan los mensajes de error. | `${APACHE_LOG_DIR}/error.log` | `sites-enabled/000-default.conf` o `apache2.conf` |
| `CustomLog` | Define la ubicación y el formato de los archivos de registro de acceso. | Se define en VirtualHosts. Ejemplo: `access.log` | `sites-enabled/000-default.conf` o VirtualHost |
| `ServerRoot` | Directorio de nivel superior que contiene la configuración y binarios. | `/etc/apache2` o `/usr/local/apache2` | `apache2.conf` o `httpd.conf` |

---

## Directivas de Control de la Conexión

| Directiva | Descripción | Valor por Defecto (Típico) | Ubicación Común (Típica) |
| :--- | :--- | :--- | :--- |
| `Timeout` | Tiempo (en segundos) que el servidor esperará eventos de E/S. | **60** segundos (Puede ser 300s en versiones antiguas). | `apache2.conf` |
| `KeepAlive` | Permite múltiples peticiones sobre la misma conexión TCP. | **`Off`** (Aunque `On` es una configuración muy común). | `apache2.conf` |
| `MaxKeepAliveRequests` | Límite de peticiones permitidas por conexión persistente. | **100** | `apache2.conf` |
| `KeepAliveTimeout` | Tiempo de espera por peticiones subsiguientes en una conexión persistente. | **5** segundos. | `apache2.conf` |

---

## Otras Directivas

| Directiva | Descripción | Valor por Defecto (Típico) | Ubicación Común (Típica) |
| :--- | :--- | :--- | :--- |
| `LogLevel` | Nivel de verbosidad de los mensajes en el `ErrorLog`. | **`warn`** | `apache2.conf` |
| `LogFormat` | Define apodos para diferentes formatos de registro de acceso (usados por `CustomLog`). | `common` (Formato por defecto si no se especifica otro). | `apache2.conf` |
