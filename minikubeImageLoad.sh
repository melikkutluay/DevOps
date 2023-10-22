echo "minikube image import is starting"

minikube image load bitnami/rabbitmq:3.12.6-debian-11-r14
minikube image load hashicorp/vault-k8s:1.3.0
minikube image load melikktly/producer:dep-5
minikube image load melikktly/consumer:dep-5

echo "minikube image import finished"