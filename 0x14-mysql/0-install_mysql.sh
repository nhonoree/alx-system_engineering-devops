#!/usr/bin/env bash
# Installs MySQL 5.7 on both web-01 and web-02

sudo apt-get update
sudo apt-get install -y mysql-server-5.7
sudo mysql_secure_installation
