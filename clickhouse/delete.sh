#!/bin/bash

set -e

kubectl -n ch delete deploy clickhouse
kubectl -n ch delete pvc clickhouse-pv-claim
kubectl delete pv clickhouse-pv-volume

kubectl delete ns ch

sudo rm -r /mnt/clickhouse
