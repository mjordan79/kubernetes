#!/usr/bin/env bash

WITH_SIGS_API=$1

helm repo add traefik https://traefik.github.io/charts
helm repo update
kubectl create ns traefik-gateway
kubectl create -f ./externalsecret.yaml
echo "Waiting 4 seconds for certificate propagation ..."
sleep 4
if [[ "$WITH_SIGS_API" == "--with-sigs-api" ]];
then
  echo "Installing official SIGS API 1.4 for Gateway APIs..."
  kubectl create -f ./crd/1.4.1/standard-install.yaml
fi
helm upgrade --install traefik-gateway traefik/traefik \
  -f ./values.yaml -n traefik-gateway --version 37.4.0 --set image.tag=3.6.4 --create-namespace
