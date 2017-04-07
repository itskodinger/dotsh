!#/bin/sh

#################################################
#     Server Configuration for Debian Final     #
#              Don't use port 7071              #     
#################################################

## updating packages
sudo apt-get update -y

## installing dependencies
sudo apt-get install unzip -y
sudo apt-get install nano -y
sudo apt-get install sed -y
sudo apt-get install screen -y

## installing HTTP Server (Powered By Apache)
sudo yum install apache2 -y

## starting HTTP Services
sudo service apache2 start

## fix for hostname resolving
echo "ServerName	localhost" >> /etc/apache2/apache2.conf

## install PHP
sudo apt-get install php php-mysql php-devel php-gd php-pecl-memcache php-pspell php-snmp php-xmlrpc php-xml -y

## change to port 7071
sed -i -e 's/Listen 80/Listen 7071/g' /etc/httpd/conf/httpd.conf

##restarting HTTP Services
sudo service apache2 restart

## downloading phpsysinfo
cd /var/www/html
rm -R *
wget https://github.com/phpsysinfo/phpsysinfo/archive/master.zip
unzip master.zip
cp -r phpsysinfo-master/* /var/www/html
mv phpsysinfo.ini.new phpsysinfo.ini

## finishing installation
sudo service apache2 restart