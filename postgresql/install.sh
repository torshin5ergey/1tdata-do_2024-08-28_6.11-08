#!/bin/bash

set -e

kubectl apply -f postgresql/namespace.yaml
kubectl apply -f postgresql/configmap.yaml
#kubectl create configmap postgres-init-script \
#    --namespace=psql \
#    --from-file=postgresql/init.sql 

#sudo mkdir -p /postgresql/data
#sudo chown -R 999:999 /postgresql/data
#sudo chmod -R 777 /postgresql/data
kubectl apply -f postgresql/pv_pvc.yaml

kubectl apply -f postgresql/deployment.yaml
kubectl apply -f postgresql/service.yaml

kubectl get po -n psql
# kubectl -n psql logs $(kubectl get po -n psql | grep postgres- | awk '{print $1}')
#kubectl -n psql exec -it
#$(kubectl get po -n psql | grep postgres- | awk '{print $1}')
#-- psql -h localhost -U ps_user --password -p 5432 ps_db