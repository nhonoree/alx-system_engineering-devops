#!/usr/bin/env bash
# This script configures Apache to return "Hello ALX" on the root URL.

# Update and install Apache
sudo apt update
sudo apt install -y apache2

# Create a custom index.html file with the text "Hello ALX"
echo "Hello ALX" | sudo tee /var/www/html/index.html

# Restart Apache to apply the changes
sudo systemctl restart apache2

# Print a success message
echo "Apache is configured. Visit http://localhost to see 'Hello ALX'."
