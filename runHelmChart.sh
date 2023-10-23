echo "helm charts is creating"

microk8s helm repo add hashicorp https://helm.releases.hashicorp.com
microk8s helm install vault --set='server.dev.enabled=true' hashicorp/vault
sleep 20s
sh vaultSecret.sh
microk8s helm install rabbitmq helm-chart/rabbitmq/ --values helm-chart/rabbitmq/values.yaml
sleep 60s
microk8s helm install producer helm-chart/producer/ --values helm-chart/producer/values.yaml
microk8s helm install consumer helm-chart/consumer/ --values helm-chart/consumer/values.yaml

microk8s helm ls