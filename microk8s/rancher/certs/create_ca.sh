#!/usr/bin/env bash
openssl genrsa -out localCA.key 2048
openssl req -x509 -new -nodes -key localCA.key -sha256 -days 3650 -out localCA.pem \
  -subj "/C=IT/ST=Lombardia/L=Milano/O=DigitalNucleus/OU=Dev/CN=Local Dev CA"
cp localCA.crt /usr/local/share/ca-certificates
# This will update the Trusted CA in /etc/ssl/certs
update-ca-certificates
# In windows, import the localCA.crt in certmgr.msc

