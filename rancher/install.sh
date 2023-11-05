#!/bin/bash
# Check if RANCHER_PASSWORD is set
if [ -z "${RANCHER_PASSWORD}" ]; then
    echo "RANCHER_PASSWORD is not set"
    exit 1
fi

helm repo add rancher-latest https://releases.rancher.com/server-charts/latest

kubectl create namespace cattle-system

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.crds.yaml

helm repo add jetstack https://charts.jetstack.io

helm repo update

helm install cert-manager jetstack/cert-manager \
    --namespace cert-manager \
    --create-namespace \
    --version v1.11.0

helm install rancher rancher-latest/rancher \
    --namespace cattle-system \
    --set hostname=koober.sslip.io \
    --set replicas=1 \
    --set bootstrapPassword=${RANCHER_PASSWORD}
