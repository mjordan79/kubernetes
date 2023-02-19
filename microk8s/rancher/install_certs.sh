#!/bin/bash
microk8s kubectl -n cattle-system create secret tls tls-rancher-ingress \
	--cert=certs/tls.crt \
	--key=certs/tls.key
