helm install rabbitmq ./rabbitmq/ --values ./rabbitmq/values.yaml
helm install producer ./producer/ --values ./producer/values.yaml
helm install consumer ./consumer/ --values ./consumer/values.yaml


#helm install vault --set='server.dev.enabled=true' hashicorp/vault
#curl --location --request POST 'http://localhost:8081/produce?message=deployment_test'