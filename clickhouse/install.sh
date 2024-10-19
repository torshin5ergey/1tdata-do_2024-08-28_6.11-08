#!/bin/bash

set -e

kubectl apply -f clickhouse/namespace.yaml

kubectl apply -f clickhouse/configmap.yaml

kubectl apply -f clickhouse/pv_pvc.yaml

kubectl apply -f clickhouse/deployment.yaml
kubectl apply -f clickhouse/service.yaml

kubectl get po -n clickhouse
