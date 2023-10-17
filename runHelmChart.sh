helm install rabbitmq ./rabbitmq/ --values ./rabbitmq/values.yaml
helm install producer ./producer/ --values ./producer/values.yaml
helm install consumer ./consumer/ --values ./consumer/values.yaml