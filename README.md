# DevOps
1- helm install rabbitmq ./rabbitmq/ --values ./rabbitmq/values.yaml
2- helm install producer ./producer/ --values ./producer/values.yaml
3- helm install consumer ./consumer/ --values ./consumer/values.yaml
4- kubectl port-forward --namespace default svc/producer 8081:8081
port-forward --namespace default svc/rabbitmq 15672:15672

helm upgrade --install rabbitmq --set image.repository=nexus.dev.visualize.softtech.com.tr/repository/dap/rabbitmq --set image.tag=1 --set auth.username=user --set auth.password=user --set auth.erlangCookie="" --set metrics.enabled=true bitnami/rabbitmq