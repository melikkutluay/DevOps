# DevOps
1- helm install rabbitmq ./rabbitmq/ --values ./rabbitmq/values.yaml
2- helm install producer ./producer/ --values ./producer/values.yaml
3- helm install consumer ./consumer/ --values ./consumer/values.yaml
4- helm install vault --set='server.dev.enabled=true' hashicorp/vault
5- kubectl port-forward --namespace default svc/producer 8081:8081
6- vault token create
7- kubectl port-forward --namespace default svc/vault 8200:8200
port-forward --namespace default svc/rabbitmq 15672:15672

helm upgrade --install rabbitmq --set image.repository=nexus.dev.visualize.softtech.com.tr/repository/dap/rabbitmq --set image.tag=1 --set auth.username=user --set auth.password=user --set auth.erlangCookie="" --set metrics.enabled=true bitnami/rabbitmq




Unseal Key 1: a0L94GGdTA2heKhPQ3hKRvXVHP50U5Gsur8NOgWBLeQl
Unseal Key 2: mlzJjJByj2mNKaHqRpskKMOEnN+XhAyOpsLmjXtv5X5m
Unseal Key 3: LvkL8no4VsGgaZpK+vkPWMcA0xVcmuauB/GOoKjpnGvN
Unseal Key 4: WEMI3kll8d5R7+AEOL7BBwMZw/4h1XSAfcMzTuz4jyUw
Unseal Key 5: B3S9pn3DuUArqjyASiVETCVrCo3vbx/IKJdMwNIJgCFt

Initial Root Token: hvs.aYj6zCXdQ0Z8GT2R6oSgpYiM
