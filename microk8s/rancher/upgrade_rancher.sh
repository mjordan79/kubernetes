#!/usr/bin/env bash

helm upgrade rancher rancher-stable/rancher \
        --namespace cattle-system \
        --create-namespace \
        --version 2.8.4 \
        --set hostname=rancher2.vmstar.lan \
        --set bootstrapPassword=admin \
        --set ingress.tls.source=secret \
        --set privateCA=false
