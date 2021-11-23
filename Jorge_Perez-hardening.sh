NAME:Jorge de Jesus Pèrez Garcìa
ID:1730888
##!/bin/bash
echo "**********************************"
#Step 1
CENTOS=$(grep '^VERSION' /etc/os-release)
cent=$(cat /etc/centos-release)
echo $cent
echo "**********************************"
#Step 2
if  rpm -eq clamav; then
 echo "clamav instalado"
else
 sudo yum install https://www.clamav.net/downloads/production/clamav-0.104.1.linux.x86_64.rpm
fi
echo "**********************************"
#Step 3
echo $CENTOS
if  $CENTOS  = 'VERSION="7"' ;then
 echo "Centos version 8"
else
 yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm"
fi
echo "**********************************"
#Step 4
echo "Actualizando"
actu=$(yum check-update)
if $actu ="";then
 echo "No hay ningun paque por actualizar
else
 echo "Actualizando paquetes"
 sudo yum -y update
fi
