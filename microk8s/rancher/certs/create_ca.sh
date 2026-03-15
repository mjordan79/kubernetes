#!/usr/bin/env bash

# Generate a Private Key for the generation of the Certificate Authority (CA)
openssl genrsa -out localCA.key 2048
# Now with this Private Key, generate the Certificate Authority (CA)
openssl req -x509 -new -nodes -key localCA.key -sha256 -days 3650 -out localCA.crt \
  -subj "/C=IT/ST=Lombardia/L=Milano/O=VMStar International/OU=Dev/CN=VMStar Local Dev CA"
cp localCA.crt /usr/local/share/ca-certificates
# This will update the Trusted CA in /etc/ssl/certs
update-ca-certificates
# In windows, import the localCA.crt in certmgr.msc in your Trusted Root Certification Authorities
