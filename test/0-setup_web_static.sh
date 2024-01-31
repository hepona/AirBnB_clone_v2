#!/usr/bin/env bash
# Bash script that sets up your web servers for the deployment of web_static.

# Update package information
sudo apt update

# Install Nginx
sudo apt install nginx

# Create necessary directories
sudo mkdir -p /data/web_static/releases
sudo mkdir -p /data/web_static/shared
sudo mkdir -p /data/web_static/releases/test

# Create an index.html file
echo "Hello world toto" > /data/web_static/releases/test/index.html

# Create a symbolic link
link_path="/data/web_static/current"
target_path="/data/web_static/releases/test"
if [ -L "$link_path" ]; then
    rm "$link_path"
fi
ln -s "$target_path" "$link_path"
# ln -s /data/web_static/current "/data/web_static/releases/test
# Adjust permissions
sudo chown -R ubuntu:ubuntu /data/

# Configure Nginx
sudo sed -i "s@server_name _;@server_name _;\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t}\n@" /etc/nginx/sites-available/default

# Restart Nginx
sudo service nginx restart

exit 0
