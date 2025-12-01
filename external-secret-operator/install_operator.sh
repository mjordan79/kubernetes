#!/usr/bin/env bash

helm repo add external-secrets https://charts.external-secrets.io
helm upgrade --install external-secrets \
   external-secrets/external-secrets \
    --version 1.1.0 -n external-secrets \
    --create-namespace \
    --set installCRDs=true
