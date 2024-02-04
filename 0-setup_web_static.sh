#!/usr/bin/env bash
#bash script that sets up your web servers for the deployment of web_static.

sudo apt update
sudo apt install nginx
sudo mkdir -p /data/web_static/releases
sudo mkdir -p /data/web_static/shared
sudo mkdir -p /data/web_static/releases/test
echo "
<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>
" >/data/web_static/releases/test/index.html
rm -rf /data/web_static/current
ln -s /data/web_static/releases/test/ /data/web_static/current
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
