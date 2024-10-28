#!/bin/bash

set -e

kubectl apply -f clickhouse/namespace.yaml

kubectl apply -f clickhouse/configmap.yaml

sudo mkdir -p /mnt/clickhouse
sudo chown -R 999:999 /mnt/clickhouse
sudo chmod -R 700 /mnt/clickhouse
kubectl apply -f clickhouse/pv_pvc.yaml

kubectl apply -f clickhouse/deployment.yaml
kubectl apply -f clickhouse/service.yaml

kubectl get po -n ch
