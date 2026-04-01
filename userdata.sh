#!/bin/bash
dnf update -y
dnf install -y nginx
systemctl start nginx
systemctl enable nginx
echo "Hello from EC2 $(hostname)" > /usr/share/nginx/html/index.html