CREATE DATABASE foobar_db;
CREATE USER 'foobar_user'@'localhost' IDENTIFIED BY 'password123';
GRANT ALL PRIVILEGES ON foobar_db.* TO 'foobar_user'@'localhost';
FLUSH PRIVILEGES;
