#!/bin/bash

set -e

kubectl -n psql delete deploy postgres
kubectl -n psql delete pvc postgres-pv-claim
kubectl delete pv postgres-pv-volume

kubectl delete ns psql

sudo rm -r /postgresql
