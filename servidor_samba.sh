#! /bin/bash

# Desarrollado por: Ing. Saul Mamani Mamani
# Twitter: @kanito777
# Email: luas0_1@yahoo.es
# Celular: +591 76137269
# Distribuciones Debian

if [ $(whoami) = 'root' ]
then
        echo 'Intente de nuevo con un usuario normal, no como root'
	exit
else
	sudo apt-get install samba

	usuario=$(whoami)

	rutaCarpeta=/home/$usuario/compartido_samba_$usuario

	echo $rutaCarpeta

	if [ -d $rutaCarpeta  ]
	then
		echo "La carpeta " $rutaCarpeta " ya existe, se compartira esa carpeta"
	else
		mkdir $rutaCarpeta
		chmod -R 775 $rutaCarpeta
		echo 'carpeta creada en: ' $rutaCarpeta
	fi

	rutaSamba=/etc/samba/smb.conf
	sudo /bin/su -c "echo '' >> "$rutaSamba
	sudo /bin/su -c "echo '[compartido_samba_'$usuario']' >> "$rutaSamba
	sudo /bin/su -c "echo 'path='$rutaCarpeta >>"$rutaSamba
	sudo /bin/su -c "echo 'read only=no'>>"$rutaSamba
	sudo /bin/su -c "echo 'security=share'>>"$rutaSamba
	sudo /bin/su -c "echo 'guest ok=yes'>>"$rutaSamba
	sudo /bin/su -c "echo 'browseable=yes'>>"$rutaSamba
	sudo /bin/su -c "echo 'umask=000'>>"$rutaSamba	
	sudo /bin/su -c "echo 'comment=carpeta compartida por un script de saul mamani'>>"$rutaSamba

	sudo service smbd restart

	echo "Felicidades!!! Su carpeta su a creado y compartido correctamente...."
fi
