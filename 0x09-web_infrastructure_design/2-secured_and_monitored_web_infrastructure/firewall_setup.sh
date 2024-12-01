#!/bin/bash

# Allow SSH
ufw allow 22

# Allow HTTP
ufw allow 80

# Allow HTTPS
ufw allow 443

# Enable UFW
ufw enable
