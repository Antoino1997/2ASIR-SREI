# Práctica Primer Trimestre - AWS

## Antes de comenzar
Primero de todo he borrado todo lo anterior del laboratorio para tenerlo limpio y realizar el trabajo correctamente.

## 1. Creación de VPC
Para esta práctica necesitamos crear una VPC que tenga dos subredes públicas y dos privadas. Nos vamos al apartado de VPC y le damos a 'VPC y más'. Le vamos a asignar la ip que vemos en la captura (10.2.0.0/16) y no vamos a poner bloque IPv6.

<img width="1660" height="670" alt="1" src="https://github.com/user-attachments/assets/d4550245-7b82-488f-8a8c-24a3cbdc8b4b" /> <br/>

Personalizamos el resto como nos pide el ejercicio:

<br/><img width="476" height="314" alt="2" src="https://github.com/user-attachments/assets/87e29394-06e9-4042-8259-106e677ab560" />

Ponemos 2 subredes privadas y 2 subredes públicas con estos bloques CIDR:

<br/><img width="482" height="570" alt="3" src="https://github.com/user-attachments/assets/d899aafb-4ab1-47a2-9118-6e1c08302a16" />
<br/><img width="483" height="590" alt="4" src="https://github.com/user-attachments/assets/8eb31017-3299-4fbd-8509-f3a77fb75f25" />

Y lo creamos:

<br/><img width="1643" height="654" alt="5" src="https://github.com/user-attachments/assets/487fd2c8-2129-40f2-944e-5e4ec3063396" />

El mapa de recursos:

<br/><img width="1638" height="535" alt="6" src="https://github.com/user-attachments/assets/44c0935c-dac9-448d-afe7-9ebfcc779281" />

## 2. Creación de instancias
Vamos a lanzar una instancia Debian dentro de la subred pública 1. Nos vamos al apartado de EC2 y le damos a 'Lanzar instancia':

<br/><img width="1093" height="758" alt="7" src="https://github.com/user-attachments/assets/824593e8-ff28-4c5c-9d3e-b98dd5e14d54" />

La llamamos como nos pide la práctica, dejamos la instancia como tipo t3.micro, pero en 'Configuraciones de red', le damos a editar para seleccionar la VPC que hemos creado:

<br/><img width="1089" height="449" alt="8" src="https://github.com/user-attachments/assets/25fe2787-3b1d-4b88-892d-92c6e6ff7174" />
<br/><img width="1084" height="301" alt="9" src="https://github.com/user-attachments/assets/e73b49d9-4ac5-43e9-87c2-00b1cf5c69a7" />

Habilitamos la IP pública de forma automatica, y vamos a proceder a crear un grupo de seguridad:

<br/><img width="1077" height="653" alt="10" src="https://github.com/user-attachments/assets/c7780100-1373-49fa-8e15-3992ad153eb6" />

Con esto nos aseguramos la conexión SSH y que el puerto 80 esté abierto. Finalmanta la lanzamos y se crea:

<br/><img width="902" height="298" alt="11" src="https://github.com/user-attachments/assets/4208cfb5-fe4f-45ff-a594-8c7b69208212" />
<br/><img width="2277" height="509" alt="image" src="https://github.com/user-attachments/assets/54db1e4b-b4a9-4c11-bf6b-96f09a36fd25" />

Y nos conectamos por SSH:

<br/><img width="960" height="511" alt="12" src="https://github.com/user-attachments/assets/5d78fa82-279e-4574-ae26-5e5917a58b37" />

## 3. Apache y PHP

Actualizamos nuestra máquina:

<img width="911" height="492" alt="13" src="https://github.com/user-attachments/assets/07fcc7f4-a551-4aa3-9008-fe248b381bcb" /><br/>

Ahora instalamos Apache:

<img width="964" height="301" alt="14" src="https://github.com/user-attachments/assets/8a38ca7a-177c-426b-85aa-b2890bb31dc0" /><br/>

Lo iniciamos y lo dejamos configurado para que se inicie cada vez que se lance la instancia:

<img width="957" height="101" alt="15" src="https://github.com/user-attachments/assets/6a974e3a-bb54-4965-9f42-5dad2a68178e" />

En el navegador, ponemos la IP pública que nos da AWS y comprobamos que Apache se ha instalado:

<img width="1382" height="998" alt="16" src="https://github.com/user-attachments/assets/0003ad20-8361-45b7-8e98-7ce99b6a0a22" />

Vamos a instalar PHP como módulo de apache:

<img width="958" height="267" alt="17" src="https://github.com/user-attachments/assets/0ab9c234-e85e-41c6-9f3c-983f02cd18ce" />
<img width="549" height="129" alt="18" src="https://github.com/user-attachments/assets/879d8de2-a85a-4ebe-a234-b2efe73f9c11" />

Y también instalamos mysql, y después comprobamos que esté dentro de los módulos de PHP:

<img width="503" height="219" alt="19" src="https://github.com/user-attachments/assets/6282c855-3d43-4ca3-9cd9-b7508d5d4b82" />
<img width="345" height="100" alt="20" src="https://github.com/user-attachments/assets/73a0e2c9-3fb5-4950-8d62-49ea9d3f9036" />

## 4. Creación de la base de datos

Vamos al servicio RDS y creamos una base de datos del tipo MySQL:

<img width="1630" height="571" alt="21" src="https://github.com/user-attachments/assets/b1a84f86-b5dc-4ffc-846f-ae365181d7b3" />

Le damos el nombre requerido y el usuario será admin con contraseña 'administrador':

<img width="1623" height="665" alt="22" src="https://github.com/user-attachments/assets/d5181631-f865-4765-b5d1-fa89b38be934" />

Y seguimos con la configuración:

<img width="1138" height="380" alt="23" src="https://github.com/user-attachments/assets/1c016694-023f-4681-bf70-81f602f83d40" />
<img width="1125" height="251" alt="24" src="https://github.com/user-attachments/assets/d1f26b1a-0df2-48a7-a413-8ffc5dcd5cf6" />

En conectividad nos aseguramos de poner la VPC que hemos creado para esta práctica:

<img width="1619" height="296" alt="25" src="https://github.com/user-attachments/assets/1ae0fc98-9b3c-42c7-8be5-e3cbbe0e641e" />
<img width="1622" height="706" alt="26" src="https://github.com/user-attachments/assets/846c3550-04a8-4e21-afb8-3f06c61a8b8a" />

En configuración adicional:

<img width="1168" height="344" alt="27" src="https://github.com/user-attachments/assets/b78feb91-e525-4583-9cd4-179e83c50b24" />

Y la creamos:

<img width="2267" height="194" alt="28" src="https://github.com/user-attachments/assets/ddd35736-400d-4228-b96e-d8df074361e1" />

Una vez creada la base de datos,vamos a establecer la conexión con la instancia con el asistente que RDS nos proporciona. Establecerá los permisos necesarios en los grupos de seguridad de la instancia y la BD sin mayor complicación.

<img width="2267" height="579" alt="29" src="https://github.com/user-attachments/assets/464bfc62-d008-4011-a525-f89015467d32" />

Simplemente le damos a conectar:

<img width="1375" height="400" alt="30" src="https://github.com/user-attachments/assets/17d7239d-99f0-4447-995f-7cb0d7421841" />

Y esperamos hasta que se completa:

<img width="2259" height="287" alt="31" src="https://github.com/user-attachments/assets/0983d8c2-17dd-4d96-8955-360a1d176a22" />

## 5. Elastic File System

Nos vamos al apartado de EFS para crear el sistema de almacenamiento externo que vamos a conectar a la instancia y que más tarde conectaremos a wordpress:

<img width="803" height="823" alt="32" src="https://github.com/user-attachments/assets/781788d5-31d7-41cb-9555-3c156f4a5eec" />

Comprobamos que está bien creado:

<img width="1625" height="339" alt="33" src="https://github.com/user-attachments/assets/5e700401-3e99-4e2c-afad-1519b0a28bd4" />
<img width="1621" height="334" alt="34" src="https://github.com/user-attachments/assets/11233804-7bd5-430b-948e-3f5fc7ad1504" />

Ahora, en los grupos de seguridad de la instancia EC2 que tenemos, vamos a editar el grupo de seguridad para permitir el acceso de la instancia al EFS:

<img width="1620" height="391" alt="35" src="https://github.com/user-attachments/assets/6bc911fe-558c-48bb-8008-55f4794dbc75" />

Ahora le damos a asociar y usamos la opción del DNS:

<img width="1587" height="515" alt="36" src="https://github.com/user-attachments/assets/d5ab57a8-7c5e-4a9c-8a33-24a876f8cfc6" />

Y lo montamos mediante SSH:

<img width="964" height="59" alt="37" src="https://github.com/user-attachments/assets/c5ef32a6-baba-4f91-a40a-5009dfa2ff9c" />

Y por último comprobamos:

<img width="954" height="275" alt="38" src="https://github.com/user-attachments/assets/ec31cc37-87a1-49ab-9400-6be04802ac5e" />

## 6. Descarga de wordpress

Dentro de /var/www/html descargamos wordpress:

<img width="952" height="293" alt="39" src="https://github.com/user-attachments/assets/0c454070-18f1-43ec-baaf-727917eb97f6" />

Y lo descomprimimos:

<img width="502" height="122" alt="40" src="https://github.com/user-attachments/assets/0909a427-34f9-4737-ad04-b0fd09926245" />

Descargamos el cliente de mysql:

<img width="957" height="295" alt="41" src="https://github.com/user-attachments/assets/213845b1-88b1-458f-84b1-4708259c61f2" />

Al intentar conectarnos a la base de datos nos daba error de certificado SSL, basicamente la instancia no tenía el certificado de Amazon RDS, así que lo he descargado y he apuntado a él durante la conexión con la base de datos:

<img width="963" height="73" alt="42" src="https://github.com/user-attachments/assets/16d16ae3-3a1b-4a89-bec4-df7e3c82fd1b" />
<img width="961" height="232" alt="43" src="https://github.com/user-attachments/assets/b5e96a8d-cf88-49ad-808a-b7648ebb6271" />
<img width="962" height="214" alt="44" src="https://github.com/user-attachments/assets/0588dfcf-e75c-4191-ba05-27172f9a147e" />

Ahora creamos la base de datos, el usuario y la contraseña:

<img width="630" height="228" alt="45" src="https://github.com/user-attachments/assets/ba1fcdf3-f9af-4f38-b7c7-ea854cf106f0" />

Y entramos desde el navegador (en las reglas de entrada del grupo de seguridad de rds hay que habilitar el puerto 80):

<img width="1140" height="747" alt="46" src="https://github.com/user-attachments/assets/6833d083-9498-429a-a70d-f3f89918f826" />

Estos son los datos para conectarnos, en lugar de localhost tenemos que poner el nombre de la base de datos RDS:

<img width="840" height="725" alt="47" src="https://github.com/user-attachments/assets/c7f396e8-44cb-457a-b6dd-7d33f17f5e49" />

Creamos de forma manual el wp-config.php y empezamos la instalación:

<img width="779" height="880" alt="48" src="https://github.com/user-attachments/assets/e688036d-8869-4344-b026-be418a871577" />

Y comprobamos:

<img width="532" height="560" alt="49" src="https://github.com/user-attachments/assets/52b0ae49-42ef-46ce-8a12-42cd99c3901c" />
<img width="2559" height="715" alt="50" src="https://github.com/user-attachments/assets/596868b1-8a84-4a91-90cf-9d701dab530e" />

## 7. Conexión de EFS a directorio WP-Content

Nos vamos a la carpeta de instalación con cd /var/www/html/wordpress. Dentro, para hacer un backup de lo que ya tenemos:

<img width="631" height="42" alt="51" src="https://github.com/user-attachments/assets/0d5143e5-452c-4b2e-b05f-4c40acc1ab45" />

Ahora creamos el nuevo punto de montaje vacío:

<img width="632" height="417" alt="52" src="https://github.com/user-attachments/assets/3eb09ed9-9dba-41a0-a9f0-2393c8dd0694" />

Vamos a montar el EFS pero ahora apuntando a wp-content:

<img width="964" height="59" alt="53" src="https://github.com/user-attachments/assets/8a30bb66-ce49-4eac-9417-303a746bb1aa" />

Por último vamos a restaurar los archivos que había copiando su contenido desde wp-content-old y le asignamos el usuario correcto para finalizar:

<img width="737" height="100" alt="54" src="https://github.com/user-attachments/assets/4f0beff0-b4f4-481b-9b92-59e9838b5100" />

Con df -h vemos que está montado:

<img width="953" height="255" alt="55" src="https://github.com/user-attachments/assets/224a37d0-2f7d-452a-8c05-df5c044b54fd" />

