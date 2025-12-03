# Expresiones Regulares
## Escribe las expresiones regulares para los siguientes supuestos:
### Directorios en /www/ cuyo nombre consista en tres dígitos.
~~~
/www/\d{3}/
~~~
### Ficheros: *.gif, *.jpeg, *.jpg, *.png
~~~
.+\.(gif | jpe?g | png )
~~~
### Escribe una directiva para redireccionar todos los GIF a ficheros JPEG en otro servidor
~~~
RedirectMatch "(.*).gif$" "$1.jpg"
~~~
### Numeros enteros y decimales
~~~
-?\d*(.\d+)?
~~~
### Números de teléfono en el formato Americano: 123-123-1234
~~~
\d{3}-\d{3}-\d{4}
~~~
### Palabras
~~~
\b[a-zA-Z]+ \b
~~~
### Códigos hexadecimales de color de 24 o 32 bits
~~~
#[0-9a-fA-F]{6} #[0-9a-fA-F]{8}
~~~
### Palabras de 4 letras
~~~
\b[A-Za-z]{4}\b
~~~
### Número entero sin signo
~~~
\b\d+\b
~~~
### Número entero con signo
~~~
\b(+|-)\d+\b
~~~
### Números reales
~~~
[-+]?\d*(.\d+)?
~~~
### Número reales con exponente
~~~
[-+]?\d*(.\d+)?([eE][+-]?\d+)?
~~~
### Email
~~~
\b[\w.-]+@[\w.-]+.\w{2,4}\b
~~~
### Números del 0 a 255
~~~
\b25[0-5]|2[0-4]\d|[01]?\d{1,2}\b
~~~
