echo "helm charts is creating"

helm install vault --set='server.dev.enabled=true' hashicorp/vault
sleep 20s
sh vaultSecret.sh
helm install rabbitmq helm-chart/rabbitmq/ --values helm-chart/rabbitmq/values.yaml
sleep 60s
helm install producer helm-chart/producer/ --values helm-chart/producer/values.yaml
helm install consumer helm-chart/consumer/ --values helm-chart/consumer/values.yaml
sh portForward.sh
helm ls