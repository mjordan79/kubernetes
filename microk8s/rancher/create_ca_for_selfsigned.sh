#!/usr/bin/env bash
kubectl -n cattle-system create secret generic tls-ca \
  --from-file=serverca=./certs/localCA.crt

# Edit the cattle-cluster-agent deployment and add the following volume mount:
#volumeMounts:
#  - name: ca-cert
#    mountPath: /etc/kubernetes/ssl/certs
#volumes:
#  - name: ca-cert
#    secret:
#      secretName: tls-ca
kubectl -n cattle-system patch deployment cattle-cluster-agent \
  --type='json' \
  -p='[
    {
      "op":"add",
      "path":"/spec/template/spec/containers/0/volumeMounts/-",
      "value":{
        "name":"ca-cert",
        "mountPath":"/etc/kubernetes/ssl/certs"
      }
    },
    {
      "op":"add",
      "path":"/spec/template/spec/volumes/-",
      "value":{
        "name":"ca-cert",
        "secret":{
          "secretName":"tls-ca"
        }
      }
    }
  ]'
