#!/usr/bin/env bash
# Bash script that sets up web servers for the deployment of web_static.
sudo apt update
sudo apt install -y nginx

sudo mkdir -p /data/web_static/{releases/test,shared}
echo "
<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>
" | sudo tee /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test /data/web_static/current

sudo chown -R ubuntu:ubuntu /data/
CONFIG="
server {
    location /hbnb_static/ {
        alias /data/web_static/current/;
    }
}
"

echo "$CONFIG" | sudo tee /etc/nginx/sites-available/default
sudo service nginx restart
