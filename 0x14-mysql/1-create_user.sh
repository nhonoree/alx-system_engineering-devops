#!/usr/bin/env bash
# Creates holberton_user and grants replication permissions

sudo mysql -u root -p <<EOF
CREATE USER 'holberton_user'@'localhost' IDENTIFIED BY 'projectcorrection280hbtn';
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;
EOF
