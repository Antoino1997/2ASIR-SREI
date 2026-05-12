# Preparativos
El ejercicio pide crear iesmarisma.intranet, pero como ya tengo montada y funcionando marisma.intranet, lo que voy a hacer es crear el subdominio informatica.marisma.intranet. Voy usar el método de Subdominio Virtual, que es escribirlo todo en el mismo fichero. Es lo más fácil y menos propenso a errores.

Para esto, lo que tengo que hacer es editar el fichero de zona de marisma.intranet. Aquí nos aseguraremos de tener los hosts principales (smtp, ftp. www) y crearemos los del subdominio:

<img width="1278" height="556" alt="1" src="https://github.com/user-attachments/assets/cce1473a-d710-47da-93f4-aabb5bb83136" />

Al escribir www.informatica dentro de la zona marisma.intranet, BIND entiende automáticamente que el nombre completo (FQDN) es www.informatica.marisma.intranet.

Comprobamos la sintaxis y reiniciamos bind:

<img width="1281" height="138" alt="2" src="https://github.com/user-attachments/assets/ca137171-afc9-4f83-936a-d73d61e7eb1a" />

# Comprobaciones
Desde el cliente, comprobamos los cambios:

- www de informática:

<img width="1277" height="226" alt="3" src="https://github.com/user-attachments/assets/0c3735c4-9f43-4c70-b2ac-396ca3901acb" />

- smtp de informática:

<img width="1279" height="462" alt="4" src="https://github.com/user-attachments/assets/18438908-5b83-494a-877a-16bade209c7e" />

- Dominio principal (para ver que no se rompió):

<img width="1280" height="234" alt="5" src="https://github.com/user-attachments/assets/cb5419e5-9e47-4036-99bc-74e3733a42d7" />
