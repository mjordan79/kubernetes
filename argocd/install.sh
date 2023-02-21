#!/bin/bash

# Refer to: https://argo-cd.readthedocs.io/en/stable/getting_started/

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Create secret with the certificates to expose ArgoCD with https
#cat ../rancher/rke/certs/tls.crt > full_chain.crt
#cat ../rancher/rke/certs/cacerts.pem >> full_chain.crt

kubectl -n argocd create secret tls "mysecret.it" \
        --cert=./certs/full_chain.crt \
        --key=./certs/tls.key

# WARNING: in order to access ArgoCD through an ingress, you must add the "--insecure" flag to the command in the "argocd-server" deployment.
# The official documentation makes you add an annotation to the ingress (haproxy.org/ssl-passthrough: "true"),
# but that would pass SSL/TLS traffic through at Layer 4 directly to the backend service without Layer 7 inspection
# (traffic is proxied in TCP mode, which makes unavailable a number of the controller annotations (requiring HTTP mode)).
# This means that the rules based on the request host won't work.

# Create the ingress
kubectl apply -n argocd -f argocd-ingress.yaml

# (Optional) Install ArgoCD CLI tool
curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
chmod +x /usr/local/bin/argocd

# Finding the admin generated password:
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

# Changing the admin password:
argocd account bcrypt --password <YOUR-PASSWORD-HERE>

# And then:
kubectl -n argocd patch secret argocd-secret \
  -p '{"stringData": {
    "admin.password": "<GENERATED-BCRYPT-HERE>",
    "admin.passwordMtime": "'$(date +%FT%T%Z)'"
  }}'

# To login from the command line:
argocd login my-argocd.myhostname.it --username admin --password Password47 --grpc-web

