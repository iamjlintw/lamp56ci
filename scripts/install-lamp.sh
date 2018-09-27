#!/bin/bash
set -e
#install tools
#devtool
yum -y groupinstall "Development Tools"

yum -y install epel-release yum-utils
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
yum-config-manager --enable remi-php56,remi
yum -y update

#install dev tool
yum -y install vim  git unzip zip python



#install php
yum install -y php php-bcmath php-cli php-common php-devel php-gd php-mbstring php-mcrypt php-mysqlnd php-opcache php-pdo php-pear php-process php-tidy php-xml
#install httpd
yum install -y httpd  httpd-tools

#install redis driver
cd /
mkdir src
cd /src
git clone git://github.com/nicolasff/phpredis.git
cd phpredis/
phpize
./configure
make
make install
echo "extension=redis.so" > /etc/php.d/redis.ini




# install composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
chmod +rx /usr/bin/composer

#yum install -y python-pip && pip install "pip>=1.4,<1.5" --upgrade
#pip install supervisor

#run httpd
rm -rf /run/httpd/* /tmp/httpd*
mkdir /var/httpd/
exec /usr/sbin/apachectl -DFOREGROUND