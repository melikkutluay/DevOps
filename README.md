# DevOps


helm upgrade --install rabbitmq --set image.repository=nexus.dev.visualize.softtech.com.tr/repository/dap/rabbitmq --set image.tag=1 --set auth.username=user --set auth.password=user --set auth.erlangCookie="" --set metrics.enabled=true bitnami/rabbitmq