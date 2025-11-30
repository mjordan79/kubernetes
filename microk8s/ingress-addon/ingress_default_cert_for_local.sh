#!/usr/bin/env bash

# Create a default-cert secret for the ingress controller of the local node (which doesn't need metallb)
kubectl create secret tls default-cert --cert=full_cert.crt --key=tls.key -n ingress

# Patch the ingress controller daemonset for using this default secret:
kubectl -n ingress patch daemonset nginx-ingress-microk8s-controller \
  --type='json' \
  -p='[{"op":"add","path":"/spec/template/spec/containers/0/args/-","value":"--default-ssl-certificate=ingress/default-cert"}]'
