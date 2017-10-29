#! /bin/bash

# Desarrollado por: Ing. Saul Mamani Mamani
# Twitter: @kanito777
# Email: luas0_1@yahoo.es
# Celular: +591 76137269
# Distribuciones Debian

echo "Instalando y configurando servidor web apache..."

sudo apt-get install apache2
service apache2 start

echo "creando un sitio web de ejemplo..."

rutaCarpeta=/var/www/html
rutapagina=$rutaCarpeta/mipaginaweb/index.html

if [ -d $rutaCarpeta  ]
then
	sudo mkdir $rutaCarpeta/mipaginaweb
	sudo touch  $rutaCarpeta/mipaginaweb/index.html
else
	sudo mkdir /var/www/mipaginaweb
	sudo touch /var/www/mipaginaweb/index.html
	rutapagina=/var/www/mipaginaweb/index.html
fi

sudo /bin/su -c "echo '<h1>Mi Primera Pagina Web</h1>' > "$rutapagina
sudo /bin/su -c "echo '<p>Felicidades!! tu servidor web apache esta corriendo</p>' >> "$rutapagina
sudo /bin/su -c "echo '<p>&copy; Saul Mamani<br/>@kanito777</p>' >> "$rutapagina

echo "-------------------------------"
echo "Feliciades!!! Tu servidor web a sido creado y esta corriendo en el puerto 80"
echo "Abra un navegador web (Mozilla Firefox, Google chrome, etc) e ingrese en la URL:  http://localhost/mipaginaweb"
