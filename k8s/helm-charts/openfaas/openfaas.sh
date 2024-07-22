#!/bin/bash
echo "creating namespaces"

kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml

# helm repo update &&
# 	helm upgrade openfaas \
# 		--install openfaas/openfaas \
# 		--create-namespace
# --namespace openfaas
