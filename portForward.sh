#!/bin/sh
echo "Port Forwarding"
#sleep 20s
kubectl port-forward --namespace default svc/producer 8081:8081 &
kubectl port-forward --namespace default svc/rabbitmq 15672:15672 &
kubectl port-forward --namespace default svc/vault 8200:8200 &
