#!/bin/bash

# Install Certbot
apt update
apt install -y certbot python3-certbot-nginx

# Obtain SSL certificate
certbot --nginx -d www.foobar.com
