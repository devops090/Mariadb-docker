#CREATE USER 'root' IDENTIFIED BY 'root';
#grant all privileges on studentapp.* to 'root' identified by 'root';
#flush privileges;
create database studentapp;
use studentapp;
CREATE TABLE Students(student_id INT NOT NULL AUTO_INCREMENT,
student_name VARCHAR(100) NOT NULL,
student_addr VARCHAR(100) NOT NULL,
student_age VARCHAR(3) NOT NULL,
student_qual VARCHAR(20) NOT NULL,
student_percent VARCHAR(10) NOT NULL,
student_year_passed VARCHAR(10) NOT NULL,
PRIMARY KEY (student_id)
);
#CREATE USER 'student'@'10.128.0.14' IDENTIFIED BY 'student@1';
#grant all privileges on studentapp.* to 'student'@'10.128.0.14' identified by 'student@1';
#flush privileges;
