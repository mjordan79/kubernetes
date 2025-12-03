#!/usr/bin/env bash

helm repo add traefik https://traefik.github.io/charts
helm repo update
kubectl create ns traefik-gateway
kubectl create -f ./externalsecret.yaml
echo "Waiting 4 seconds for certificate propagation ..."
sleep 4
kubectl create -f ./nginx-ingressclass.yaml
kubectl create -f ./crd/1.4.0/standard-install.yaml
helm upgrade --install traefik-gateway traefik/traefik \
  -f ./values.yaml -n traefik-gateway --version 37.4.0 --create-namespace
