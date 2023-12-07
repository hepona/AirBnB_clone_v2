#!/usr/bin/env bash
#Bash script that sets up your web servers for the deployment of web_static.
sudo apt update
sudo apt install nginx
sudo mkdir -p data
sudo mkdir -p data/web_static
sudo mkdir -p data/web_static/releases
sudo mkdir -p data/web_static/shared
sudo mkdir -p data/web_static/releases/test
echo "Hello word toto" >/data/web_static/releases/index.html
sudo mkdir -p data/web_static/current
sudo ln -sf data/web_static/releases/test/ data/web_static/current
sudo chown ubuntu:ubuntu /data/
