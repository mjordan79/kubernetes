#!/bin/bash
namespace=$1
kubectl delete replicaset -n $1 $(kubectl get replicaset -n $1 -o jsonpath='{ .items[?(@.spec.replicas==0)].metadata.name }')


