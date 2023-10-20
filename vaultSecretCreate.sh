#!/bin/sh
kubectl exec --stdin=true --tty=true vault-0 -- vault kv put -mount=secret vaultdemo demo.username=user demo.password=user