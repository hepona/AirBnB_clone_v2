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
# target="/data/web_static/releases/test/"
# link="/data/web_static/current"

# # Check if the symbolic link exists
# if [ -L "$link" ]; then
#     # Remove the symbolic link
#     echo "Removing existing symbolic link..."
#     rm "$link"
# fi

# # Create a new symbolic link
# echo "Creating new symbolic link..."
# ln -s "$target" "$link"
# echo "Symbolic link created successfully."
# ln -sf /data/web_static/current /data/web_static/releases/test/
ln -sf /data/web_static/releases/test/ /data/web_static/current

# # ln -s /data/web_static/current "/data/web_static/releases/test
# # Adjust permissions
sudo chown -R ubuntu:ubuntu /data/

# Configure Nginx
sudo sed -i "s@server_name _;@server_name _;\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t}\n@" /etc/nginx/sites-available/default

# Restart Nginx
sudo service nginx restart

exit 0
