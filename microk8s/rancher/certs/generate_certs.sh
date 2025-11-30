#!/usr/bin/env bash

# Generate domain private key
openssl genrsa -out vmstar.lan.key 2048
# Generate Certificate Signing Request (CSR) with the domain private key and the san.cnf configuation
openssl req -new -key vmstar.lan.key -out vmstar.lan.csr -subj "/CN=*.vmstar.lan" -config san.cnf
# Generate certificate and private key signing with the CA
openssl x509 -req -in vmstar.lan.csr -CA localCA.crt -CAkey localCA.key \
  -CAcreateserial -out vmstar.lan.crt -days 825 -sha256 \
  -extensions v3_req -extfile san.cnf
# Generate the full certificate (CA + Cert)
cat vmstar.lan.crt > full_cert.crt
cat localCA.crt >> full_cert.crt
# Rename them with much more useful names
mv vmstar.lan.key tls.key
mv vmstar.lan.crt tls.crt
