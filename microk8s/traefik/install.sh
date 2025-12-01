#!/usr/bin/env bash

helm upgrade --install traefik-gateway traefik/traefik \
  -f ./values.yaml -n traefik-gateway --version 37.4.0 --create-namespace
