#!/bin/bash
apt-get update
apt-get install nginx -y
echo "Hi Fateh Singh" >/var/www/html/index.nginx-debian.html