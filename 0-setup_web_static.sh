#!/usr/bin/env bash
# sudo apt update
# sudo apt install nginx
mkdir -p data
mkdir -p data/web_static
mkdir -p data/web_static/releases
mkdir -p data/web_static/shared
mkdir -p data/web_static/releases/test
echo "Hello word toto" > /data/web_static/releases/index.html
ln -S /data/web_static/current /data/web_static/releases/test/
sudo chown ubuntu : ubuntu /data/