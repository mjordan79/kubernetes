#!/usr/bin/env bash

helm uninstall external-secrets -n external-secrets
helm repo remove external-secrets
helm repo update
