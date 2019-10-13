#!/bin/bash
#systemctl stop mariadb
#chown -R mysql:mysql /var/lib/mysql/mysql.sock
#chmod 777 /var/lib/mysql/mysql.sock
#sudo /usr/libexec/mysqld stop
#mysqld_safe start --skip-grant-tables & 
#wait 15
#RUN /usr/libexec/mysqld enable
mysql -e "CREATE USER 'student'@'%' IDENTIFIED BY 'student@1';"
mysql -e "grant all privileges on studentapp.* to 'student'@'%' identified by 'student@1';"
mysql -e "flush privileges;"
#mysql -e "quit;"
systemctl stop mariadb
sleep 10
killall -9 mysqld mysqld_safe
sleep 10
mysqld_safe --skip-grant-tables &
sleep 10
#wait 15
#sudo /usr/libexec/mysqld enable
#systemctl stop mariadb
#sleep 10
#wait 15
systemctl enable mariadb
sleep 10
#wait 15
#mysql -e "CREATE USER 'student'@'%' IDENTIFIED BY 'student@1';"
#mysql -e "grant all privileges on studentapp.* to 'student'@'%' identified by 'student@1';"
mysql -ustudent -pstudent@1 < studentapp.sql
