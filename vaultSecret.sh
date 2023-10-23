#!/bin/sh
microk8s kubectl get all
sleep 15s
#export VAULT_TOKEN=$(kubectl logs pod/vault-0 | grep "Root Token")
microk8s kubectl exec --stdin=true --tty=true vault-0 -- vault kv put -mount=secret vaultdemo demo.username=user demo.password=user | /bin/bash
