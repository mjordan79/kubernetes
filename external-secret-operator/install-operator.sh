#!/usr/bin/env bash

helm repo add external-secrets https://charts.external-secrets.io
helm repo update
helm upgrade --install external-secrets external-secrets/external-secrets \
    -n external-secrets --version 1.1.0 --create-namespace --set installCRDs=true
