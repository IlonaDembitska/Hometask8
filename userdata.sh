#!/bin/bash

apt update -y
apt install -y apache2 openssl

systemctl enable apache2
systemctl start apache2

echo "<h1 style='color:green;text-align:center;margin-top:60px;'>Hometask 8 — HTTPS works!</h1>" > /var/www/html/index.html

mkdir -p /etc/ssl/mycert

cat << eof > /etc/ssl/mycert/openssl.cnf
[ req ]
default_bits       = 2048
default_md         = sha256
prompt             = no
encrypt_key        = no
distinguished_name = dn
x509_extensions    = v3_req

[ dn ]
C = UA
ST = Kyiv
L = Kyiv
O = DevOpsCourse
OU = Hometask8
CN = my-ec2-https

[ v3_req ]
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = localhost
IP.1 = 127.0.0.1
eof

openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/ssl/mycert/self.key \
  -out /etc/ssl/mycert/self.crt \
  -config /etc/ssl/mycert/openssl.cnf

a2enmod ssl
a2enmod rewrite

cat << eof > /etc/apache2/sites-available/000-default.conf
<VirtualHost *:80>
    Redirect / https:///
</VirtualHost>
eof

cat << eof > /etc/apache2/sites-available/hometask8-ssl.conf
<VirtualHost *:443>
    DocumentRoot /var/www/html
    SSLEngine on
    SSLCertificateFile /etc/ssl/mycert/self.crt
    SSLCertificateKeyFile /etc/ssl/mycert/self.key
</VirtualHost>
eof

a2ensite hometask8-ssl.conf
systemctl reload apache2