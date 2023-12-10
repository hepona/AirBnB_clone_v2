#!/usr/bin/env bash
#Bash script that sets up your web servers for the deployment of web_static.
sudo apt update
sudo apt install nginx
sudo mkdir -p /data
sudo mkdir -p /data/web_static
sudo mkdir -p /data/web_static/releases
sudo mkdir -p /data/web_static/shared
sudo mkdir -p /data/web_static/releases/test
echo "Hello word toto" > /data/web_static/releases/index.html
sudo mkdir -p /data/web_static/current
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/
sudo sed -i "s@server_name _;@server_name _;\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t}\n@" /etc/nginx/sites-available/default
# config_content="location /hbnb_static {\n\talias /data/web_static/current/;\n}\n"
# if ! grep -q "location /hbnb_static" /etc/nginx/sites-available/default; then
#     sudo sed -i "/server_name _;/a $config_content" /etc/nginx/sites-available/default
# fi
sudo service nginx restart
exit 0