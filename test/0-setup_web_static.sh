#!/usr/bin/env bash
# Bash script that sets up your web servers for the deployment of web_static.
sudo apt update

# Install Nginx
sudo apt install nginx

# Create necessary directories
sudo mkdir -p /data/web_static/releases
sudo mkdir -p /data/web_static/shared
sudo mkdir -p /data/web_static/releases/test

# # Create an index.html file
echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" >/data/web_static/releases/test/index.html

# # Create a symbolic link

rm -rf /data/web_static/current
ln -s /data/web_static/releases/test/ /data/web_static/current
# # Adjust permissions
sudo chown -R ubuntu:ubuntu /data/

# Configure Nginx
# sudo sed -i '51 i \\n\tlocation /hbnb_static {\n\talias /data/web_static/current;\n\t}' /etc/nginx/sites-available/default

CONFIG="
server {
    location /hbnb_static/ {
        alias /data/web_static/current/;
    }
}
"
echo "$CONFIG" | sudo tee /etc/nginx/sites-available/default
# Restart Nginx
sudo service nginx restart