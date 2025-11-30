#!/bin/bash
helm repo add rancher-stable https://releases.rancher.com/server-charts/stable && \
        helm install rancher rancher-stable/rancher \
        --namespace cattle-system \
        --create-namespace \
        --version 2.11.3 \
        --set hostname=rancher2.vmstar.lan \
        --set bootstrapPassword=admin \
        --set ingress.tls.source=secret \
        --set privateCA=false
