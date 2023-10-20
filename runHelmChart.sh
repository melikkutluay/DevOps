echo "helm charts is creating"

helm install vault --set='server.dev.enabled=true' hashicorp/vault
helm install rabbitmq helm-chart/rabbitmq/ --values helm-chart/rabbitmq/values.yaml
helm install producer helm-chart/producer/ --values helm-chart/producer/values.yaml
helm install consumer helm-chart/consumer/ --values helm-chart/consumer/values.yaml
helm ls

echo "helm charts finished"
#curl --location --request POST 'http://localhost:8081/produce?message=deployment_test'