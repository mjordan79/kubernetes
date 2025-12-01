#!/bin/bash

# Remember: tls.crt must be a full-chain certificate.
kubectl create secret tls tls-secret \
  --cert=./certs/tls.crt \
  --key=./certs/tls.key \
  --namespace=digitalnucleus-secrets
