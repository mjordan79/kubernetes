#!/usr/bin/env bash

# Label a node as a control-plane
kubectl label node <nome-nodo> node-role.kubernetes.io/control-plane=true

# Label a node as a worker node
kubectl label node <nome-nodo> node-role.kubernetes.io/worker=true

# Taint control plane nodes:
kubectl taint nodes <nome-nodo> node-role.kubernetes.io/control-plane=:NoSchedule
