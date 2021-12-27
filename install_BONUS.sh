#!/bin/bash

sudo ufw allow 80
sudo ufw allow 21

sudo apt update -y && apt install -y vim wget 
sudo apt upgrade -y 
sudo apt install -y lighttpd mariadb-server php-cgi php-mysql vsftpd

sudo mysql_secure_installation
echo "CREATE DATABASE wordpress;"| mariadb -u bcano -p
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'bcano'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION;"| mariadb -u bcano -p
echo "FLUSH PRIVILEGES;"| mariadb -u bcano -p
echo "SHOW DATABASES;"| mariadb -u bcano -p

sudo wget http://wordpress.org/latest.tar.gz -P /var/www/html ; sudo tar -xzvf /var/www/html/latest.tar.gz ; sudo rm /var/www/html/latest.tar.gz
sudo cp -r /var/www/html/wordpress/* /var/www/html; sudo rm -rf /var/www/html/wordpress
sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
echo "\tCHANGE ELLEMENTS:"
echo "define( 'DB_NAME', '<wordpress>' );"
echo "define( 'DB_USER', '<bcano>' );"
echo "define( 'DB_PASSWORD', '<root>' );"
sleep 4
sudo vim /var/www/html/wp-config.php

sudo lighty-enable-mod fastcgi ; sudo lighty-enable-mod fastcgi-php ; sudo service lighttpd force-reload

echo "\tUNCOMMENT:"
echo "write_enable=YES"
echo "chroot_local_user=YES"
sleep 4
sudo vim /etc/vsftpd.conf
sudo mkdir /home/bcano/ftp /home/bcano/ftp/files ; sudo chown nobody:nogroup /home/bcano/ftp ; sudo chmod a-w /home/bcano/ftp
