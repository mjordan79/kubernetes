#!/usr/bin/env bash

helm uninstall traefik-gateway -n traefik-gateway
helm repo remove traefik
helm repo update
kubectl delete -f ./crd/1.4.0/standard-install.yaml
kubectl delete -f ./externalsecret.yaml
kubectl delete ns traefik-gateway
