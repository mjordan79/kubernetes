#!/usr/bin/env bash

# Generate domain private key
openssl genrsa -out digitalnucleus.it.key 2048
# Generate Certificate Signing Request (CSR) with the domain private key and the san.cnf configuation
openssl req -new -key digitalnucleus.it.key -out digitalnucleus.it.csr -subj "/CN=*.digitalnucleus.it" -config san.cnf
# Generate certificate and private key signing with the CA
openssl x509 -req -in digitalnucleus.it.csr -CA localCA.crt -CAkey localCA.key \
  -CAcreateserial -out digitalnucleus.it.crt -days 825 -sha256 \
  -extensions v3_req -extfile san.cnf

