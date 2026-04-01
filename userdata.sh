#!/bin/bash
dnf update -y
dnf install -y nginx unzip

cd /tmp
wget https://www.tooplate.com/zip-templates/2134_gotto_job.zip
unzip 2134_gotto_job.zip

cp -r 2134_gotto_job/* /usr/share/nginx/html/

systemctl start nginx
systemctl enable nginx