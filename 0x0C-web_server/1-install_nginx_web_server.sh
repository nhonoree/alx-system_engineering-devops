#!/bin/bash
# 1-install_nginx_web_server: Install and configure Nginx web server

# Update and install nginx
apt-get update -y
apt-get install nginx -y

# Configure Nginx to serve a page with 'Hello World!'
echo "Hello World!" > /var/www/html/index.html

# Ensure Nginx is listening on port 80
# We won't use systemctl, so we will restart Nginx using service command
service nginx restart

# Confirm Nginx is running and serving the page
curl localhost
