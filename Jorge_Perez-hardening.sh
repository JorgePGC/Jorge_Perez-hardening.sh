NAME:Jorge de Jesus Pèrez Garcìa
ID:1730888
##!/bin/bash
echo "**********************************"
#Script should be able to identify if the OS is or CentOS v7 or CentOS v8
CENTOS=$(grep '^VERSION' /etc/os-release)
cent=$(cat /etc/centos-release)
echo $cent
echo "**********************************"
#It should install clamav antivirus. If the antivirus is already installed or running, the script should stop and uninstall the software before it install a fresh one.
if  rpm -eq clamav; then
 echo "clamav instalado"
else
 sudo yum install https://www.clamav.net/downloads/production/clamav-0.104.1.linux.x86_64.rpm
fi
echo "**********************************"
#Script should install EPEL repositories only for CENTOS v7 servers
echo $CENTOS
if  $CENTOS  = 'VERSION="7"' ;then
 echo "ola"
 yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
else
 echo "adios"
fi
echo "**********************************"
#Finally, script should be capable to update all packages having an available update in the repositories.
echo "Actualizando"
actu=$(yum check-update)
if $actu ="";then
 echo "No hay ningun paque por actualizar
else
 echo "Actualizando paquetes"
 sudo yum -y update
fi
