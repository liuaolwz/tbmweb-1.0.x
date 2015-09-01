#InnoDB Only
CREATE DATABASE tbweb
    CHARACTER SET utf8
    COLLATE utf8_bin;
CREATE USER 'tbweb'@'%'
    IDENTIFIED BY 'tbweb';
GRANT ALL ON tbweb.* TO 'tbweb'@'%';