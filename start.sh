#!/bin/bash
#systemctl stop mariadb
#chown -R mysql:mysql /var/lib/mysql/mysql.sock
#chmod 777 /var/lib/mysql/mysql.sock
sudo /usr/libexec/mysqld stop
#RUN mysqld_safe --skip-grant-tables &
#RUN /usr/libexec/mysqld enable
mysql -e "CREATE USER 'student'@'%' IDENTIFIED BY 'student@1';"
mysql -e "grant all privileges on studentapp.* to 'student'@'%' identified by 'student@1';"
mysql -e "flush privileges;"
#mysql -e "quit;"
#systemctl stop mariadb
mysqld_safe --skip-grant-tables &
sudo /usr/libexec/mysqld enable
#systemctl stop mariadb
#systemctl enable mariadb
mysql -ustudent -pstudent@1 < studentapp.sql
