#!/bin/bash
microk8s helm3 repo add rancher-stable https://releases.rancher.com/server-charts/stable && \
        microk8s helm3 install rancher rancher-stable/rancher \
        --namespace cattle-system \
        --create-namespace \
        --version 2.6.10 \
        --set hostname=rancher2.objectway.it \
        --set bootstrapPassword=admin \
        --set ingress.tls.source=secret \
        --set privateCA=false
